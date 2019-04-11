<?php
namespace plugins\signin\model;
use think\Model;


class Member extends Model
{
	
    // 设置当前模型对应的完整数据表名称
    protected $table = '__SIGNIN_MEMBER__';
    protected $autoWriteTimestamp = false;   // 自动写入时间戳
    protected $dateFormat = false;

    /**
     * 获取信息内容
     * @param number $aid 信息内容ID,
     * @param string $sysid 频道id
     * @return void|unknown
     */
    public static function get_info($aid=0,$sysid=''){
        static $mods = [];
        if (empty($mods)) {
            $mods = modules_config();
        }
        $dirname = $mods[$sysid]['keywords'];
        if (empty($dirname)) {
            return ;
        }
        $class = "app\\$dirname\\model\\Content";
        if(class_exists($class) && method_exists($class,'getInfoByid')){
            $obj = new $class;
            $info = $obj->getInfoByid($aid,true);
            if(empty($info)){
                return ;
            }
            $info['module_dir'] = $mods[$sysid]['keywords'];    //频道目录,生成频道网址要用到
            $info['module_name'] = $mods[$sysid]['name'];     //频道名称
            return $info;
        }
    }
    
    /**
     * 标签 获取每天排名的
     * @param unknown $tag_array
     * @return unknown
     */
    public function get_label($tag_array){
        $cfg = unserialize($tag_array['cfg']);
        $rows = $cfg['rows'];
        $rows>0 || $rows=12;
        if($cfg['time']=='y'){
            $time = 'yesterday';
        }elseif($cfg['time']=='y2'){
            $time =[date('Y-m-d',time()-3600*24*2),date('Y-m-d',time()-3600*24)];
        }else{
            $time = 'today';
        }
        $map = [
                'aid'=>intval($cfg['aid']),
                'sysid'=>intval($cfg['sysid']),
        ];
        $cfg['by']=='desc' || $cfg['by']='asc';
        $cfg['order'] = in_array($cfg['order'], ['id','money','rank'])?$cfg['order']:'id';
        $data_list = self::where($map)->whereTime('create_time',$time)->order($cfg['order'],$cfg['by'])->paginate($rows);
//         $data_list->each(function(&$rs,$key){
//             return $rs;
//         });
        return $data_list;
    }
    
    /**
     * 标签 获取最近签到的用户列表
     * @param unknown $tag_array
     * @return unknown
     */
    public function get_last($tag_array){
        $cfg = unserialize($tag_array['cfg']);
        $rows = $cfg['rows'];
        $rows>0 || $rows=12;
        $map = [
                'aid'=>intval($cfg['aid']),
                'sysid'=>intval($cfg['sysid']),
        ];
        $data_list = self::where($map)->order('id','desc')->paginate($rows);
        return $data_list;
    }
    
    /**
     * 统计最近三天的签到人数总量
     * @param string $type
     * @return unknown
     */
    public static function count_sign($type='',$ext_id=0,$ext_sys=0){
        if($type=='y'){
            $time = 'yesterday';
        }elseif($type=='y2'){
            $time =[date('Y-m-d',time()-3600*24*2),date('Y-m-d',time()-3600*24)];
        }else{
            $time = 'today';
        }
        $ext_sys = intval($ext_sys);
        $ext_id = intval($ext_id);
        return self::where('sysid',$ext_sys)->where('aid',$ext_id)->whereTime('create_time',$time)->count('id');
    }
    
    
}