<?php
namespace plugins\eggs\index;

use app\common\controller\IndexBase;
use plugins\eggs\model\Member as Model;

class Index extends IndexBase
{

    public function index(){
        return $this->fetch();
    }
    
    protected function getRand2($proArr){
        $randNum = substr(microtime(),2,2);
        foreach ($proArr as $key => $proCur) {
            if ($randNum <= $proCur) {
                $result = $key;
                break;
            }
        }
        $result || $result=4;
        return $result;
    }
    
    /**
     * 砸过金蛋入口
     * @param number $uid
     * @return void|unknown|\think\response\Json|void|\think\response\Json
     */
    public function check($uid=0){
        if (empty($this->user)) {
            return $this->err_js('你还没登录',[],2);
        }
        // elseif($this->user['money'] < $this->webdb['paymoney_pound']){
        //     return $this->err_js('你的积分不足 ' . $this->webdb['paymoney_pound'] . ' 个!');
        // }        
        $map = [
                'uid'=>$uid?:$this->user['uid'],
        ];

        $info = Model::where($map)->order('id desc')->find();
        if ($info) {
            $info = getArray($info);
            if ( date('z',$info['create_time'])==date('z') ) {
                $info['create_time'] = format_time($info['create_time']);
                return $this->err_js('你今天已经砸过金蛋了,请明天再来!',3);
            }
        }

       if ($this->webdb['pound_max_num']>0) {
           $data = Model::where([])->order('id desc')->limit($this->webdb['pound_max_num'])->column('create_time');
           if (count($data) ==$this->webdb['pound_max_num'] && date('z',end($data))==date('z') ) {
                 return $this->err_js('你来得太晚啦,每天的前'.$this->webdb['pound_max_num'].'名才可以砸金蛋,请明天再来!',3);
           }
        }

        return $this->get();
    }

    public function get(){
        $prize_arr = array(
                '0' => array('id'=>1,'min'=>3,'max'=>27,'prize'=>'一等奖','v'=>5),
                '1' => array('id'=>2,'min'=>array(243,123),'max'=>array(267,147),'prize'=>'二等奖','v'=>20),
                '2' => array('id'=>3,'min'=>array(303,183,63),'max'=>array(327,207,87),'prize'=>'三等奖','v'=>60),
                '3' => array('id'=>4,'min'=>array(33,93,153,213,273,333),'max'=>array(57,117,177,237,297,357),'prize'=>'鼓励奖','v'=>100)
        );
        
        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        
        $rid = $this->getRand2($arr);       //根据概率获取奖项id
        $result = [];        
        $res = $prize_arr[$rid-1];      //中奖项
        $min = $res['min'];
        $max = $res['max'];
        if($res['id']==1){
            $result['angle'] = mt_rand($min,$max);          //随机生成一个角度
        }else{
            if($rid==4){
                $i = mt_rand(0,5);
            }elseif($rid==3){
                $i = mt_rand(0,2);
            }else{
                $i = mt_rand(0,1);
            }
            $result['angle'] = mt_rand($min[$i],$max[$i]);
        }
        $result['prize'] = $res['prize'];
        $money = $this->webdb['poundmoney'.$rid];

        $result['jf'] = $money;
        
        $data = [
                'uid'=>$this->user['uid'],
                'create_time'=>time(),
                'money'=>$money,
                'typesize'=>$rid,
        ];
        if(Model::create($data)){
            //不消耗积分
            // if($this->webdb['paymoney_pound']>0){
            //     add_jifen($this->user['uid'], -$this->webdb['paymoney_pound'],'砸金蛋下注');
            // }
            if($money>0){
                add_jifen($this->user['uid'], $money,'砸金蛋中奖');
            }
            return $this->ok_js($result);
        }else{
            return $this->err_js('数据库插入失败!');
        }   
    }
}