<?php
namespace plugins\eggs\model;
use think\Model;


class Member extends Model
{
	
    // 设置当前模型对应的完整数据表名称
    protected $table = '__EGGS_MEMBER__';
    protected $autoWriteTimestamp = false;   // 自动写入时间戳
    protected $dateFormat = false;
    
    public static function get_label($tag_array){
        $map = [];
        $cfg = unserialize($tag_array['cfg']);
        return static::getList($cfg['rows'],$cfg['order'],$cfg['by'],$map);
    }
    
    public static function getList($rows=10,$order='',$by='',$map=[]){
        $order = $order?:'id';
        $by = $by=='asc' ? 'asc' : 'desc';
        $rows = intval($rows) ?: 5;
        $data_list = self::where($map)->order($order,$by)->paginate($rows);
        $data_list->each(function($rs,$key){
            $rs['username'] = get_user_name($rs['uid']);
            $rs['user_icon'] = get_user_icon($rs['uid']);
            return $rs;
        });
        return $data_list;
    }

}