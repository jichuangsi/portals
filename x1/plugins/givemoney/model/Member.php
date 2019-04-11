<?php
namespace plugins\givemoney\model;
use think\Model;


class Member extends Model
{
	
    // 设置当前模型对应的完整数据表名称
    protected $table = '__GIVEMONEY_MEMBER__';
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
}