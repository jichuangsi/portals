<?php
namespace plugins\givemoney\index;

use app\common\controller\IndexBase;
use plugins\givemoney\model\Member as Model;

class Api extends IndexBase
{
    /**
     * 打赏接口
     * $rid 与 $cid 不能混用
     * 论坛回复ID就用$rid
     * 评论回复ID就用$cid 
     * @param number $id 主题ID
     * @param string $sysname 主题所在频道目录名
     * @param number $money 打赏积分个数
     * @param number $cid 评论ID
     * @param number $rid 论坛回复ID
     * @return void|\think\response\Json|void|unknown|\think\response\Json
     */
    public function give($id=0,$sysname='',$money=0,$cid=0,$rid=0){
        if (empty($this->user)) {
            return $this->err_js('你还没登录');
        }
        $about = input('about')?:'';
        $sysid = 0;
        if (empty($sysname)) {
            return $this->err_js('频道不存在');
        }
        $array = modules_config($sysname);
        if (empty($array)) {
            return $this->err_js('频道有误');
        }elseif ($id && !query($array['keywords'].'_content',['where'=>['id'=>$id],'value'=>'id'])) {
            return $this->err_js('主题并不存在');
        }
        $sysid = $array['id'];
        
        $result = $this->check_money($money);
        if ($result!==true) {
            return $this->err_js($result);
        }
        
        $data = [
                'uid'=>$this->user['uid'],
                'aid'=>intval($id),
                'sysid'=>intval($sysid),
                'cid'=>intval($cid),
                'rid'=>intval($rid),
                'money'=>$money,
                'create_time'=>time(),
                'about'=>$about,
        ];
        
        $topic = fun('content@info',$id,$sysname,false);
        $rsdb = [];
        if($rid){
            $rsdb = fun('content@reply',$rid,$sysname);     //论坛回复
        }elseif($cid){
            $rsdb = fun('comment@info',$cid);   //评论回复
        }
        $data['touid'] = $rsdb['uid'] ?: $topic['uid'];
        if ($data['touid']==$this->user['uid'] && empty($this->admin)) {
            return $this->err_js('你不能给自己打赏');;
        }
        if(Model::create($data)){
            $this->get_money($money,$topic,$rsdb);
            hook_listen( 'content_give_jifen' , $id , ['rid'=>$rid,'cid'=>$cid,'sysname'=>$sysname,'money'=>$money] );      //监听打赏
            return $this->ok_js();
        }else{
            return $this->err_js('数据库插入失败');
        }
    }
    
    /**
     * 获取用户列表
     * @param string $sysname
     * @param number $id
     * @param number $cid
     * @param number $rid
     * @return void|\think\response\Json|void|unknown|\think\response\Json
     */
    public function getlist($sysname='',$id=0,$cid=0,$rid=0){
        $sysid = 0;
        if (empty($sysname)) {
            return $this->err_js('频道不存在');
        }
        $array = modules_config($sysname);
        if (empty($array)) {
            return $this->err_js('频道有误');
        }
        $sysid = $array['id'];
        
        $map = ['sysid'=>$sysid];
        if ($cid) {
            $map['cid'] = $cid;
        }elseif ($rid) {
            $map['rid'] = $rid;
        }else{
            $map['aid'] = $id;
            $map['rid'] = 0;
            $map['rid'] = 0;
        }
        $listdb = Model::where($map)->order('id desc')->limit(20)->column(true);
        foreach($listdb AS $key=>$rs){
            $rs['username'] = get_user_name($rs['uid']);
            $rs['user_icon'] = get_user_icon($rs['uid']);
            $rs['create_time'] = format_time($rs['create_time']);
            $listdb[$key] = $rs;
        }
        $listdb = array_values($listdb);
        return $this->ok_js($listdb);
    }
    
    /**
     * 统计每条信息总共打赏积分总数
     * @param string $sysname
     * @param number $id
     * @param number $cid
     * @param number $rid
     * @return void|\think\response\Json|void|unknown|\think\response\Json
     */
    public function count($sysname='',$id=0,$cid=0,$rid=0){
        $sysid = 0;
        if (empty($sysname)) {
            return $this->err_js('频道不存在');
        }
        $array = modules_config($sysname);
        if (empty($array)) {
            return $this->err_js('频道有误');
        }
        $sysid = $array['id'];
        
        $map = ['sysid'=>$sysid];
        if ($cid) {
            $map['cid'] = $cid;
        }elseif ($rid) {
            $map['rid'] = $rid;
        }else{
            $map['aid'] = $id;
            $map['cid'] = 0;
            $map['rid'] = 0;
        }
        $num = Model::where($map)->sum('money');
        if ($num) {
            return $this->ok_js($num);
        }else{
            return $this->err_js('还没人打赏');
        }        
    }
    
    private function get_money($money=0,$topic=[],$rsdb=[]){        
        $url = get_url( urls($topic['module_dir'].'/content/show',['id'=>$topic['id']]) );
        if(empty($rsdb)){
            add_jifen($topic['uid'], $money,'发表主题(id:'.$topic['id'].')被 '.$this->user['username'].' 打赏');
            $content = "你发表的主题被 ".$this->user['username']." 打赏了 {$money} 个积分。该主题是：<a href=\"{$url}\" target=\"_blank\">{$topic['title']}</a>";
            send_msg($topic['uid'],'你发表的主题被打赏了',$content,false);
            send_wx_msg($topic['uid'],$content);
        }else{
            add_jifen($rsdb['uid'], $money,'回复主题(id:'.$topic['id'].')被 '.$this->user['username'].' 打赏');
            $content = "你参与评论的主题被 ".$this->user['username']." 打赏了 {$money} 个积分。该主题是：<a href=\"{$url}\" target=\"_blank\">{$topic['title']}</a>评论内容是：".get_word($rsdb['content'], 40);
            send_msg($rsdb['uid'],'你参与评论的主题被打赏了',$content,false);
            send_wx_msg($rsdb['uid'],$content);
        }
        add_jifen($this->user['uid'], -abs($money),'打赏主题(id:'.$topic['id'].')扣除积分');
    }
    
    private function check_money(&$money=0){
        $money = intval($money);
        if (empty($money)) {
            return '打赏积分不能为空!';
        }elseif ($money<1){
            return '打赏积分不能小于一个!';
        }elseif ($money>$this->user['money']){
            return '打赏积分，不能超过你拥有的积分 '.$this->user['money'].' 个，想要更多积分，请每天签到可以获取奖励!';
        }
        return true;           
    }

}
