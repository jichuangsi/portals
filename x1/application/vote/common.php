<?php 
// use app\common\model\Module;
use think\Db;

if (!function_exists('get_option_ranking')) {
    /**
     * 获取投票选项当前排名
     * @param number $mid 模型ID
     * @param number $id 选项ID
     * @return number 当前排名
     */
    function get_option_ranking($mid=1,$id=0){
	$table=config('system_dirname').'_content'.$mid;
	$this_contentdb = Db::name($table)->where('id',$id)->find();
	$this_result = Db::name($table)->where('agree','>',$this_contentdb['agree'])->count();
	$option_ranking=$this_result+1;
	return $option_ranking;
    }
}
