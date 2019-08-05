<?php
namespace app\cmswk\model;

use app\common\model\C;
use think\Db;

//模型内容处理
class Content extends C
{
	/**
	 * 下载表数据查询
	 * @param string $name 比如可以是 sort 或 field 等等
	 * @return array
	 */
	public static function getDownloadInfo($map=[]){
		$tablename = self::getTableBy('download');
		return Db::name($tablename)->where($map)->find();
		
	}
	
	/**
	 * 写入下载记录
	 * @param array $data 
	 * @return string
	 */
	public static function insertDownloadLog($data=[]){
		$tablename = self::getTableBy('download');
		$tablename4 = self::getTableBy('content4');
		Db::name($tablename4)->where('id',$data['aid'])->setInc('download_sum');	//文件表次数更新
		return Db::name($tablename)->insert($data);
		
	}
	
	/**
	 * 下载次数更新
	 * @param number $id 文件ID
	 * @param number $uid 下载用户ID
	 */
	public static function updateDownloadLog($id=0,$uid=0){
		$tablename = self::getTableBy('download');
		$tablename4 = self::getTableBy('content4');
		Db::name($tablename)->where(['aid'=>$id,'uid'=>$uid])->setInc('download_num');//下载记录表次数更新
		Db::name($tablename4)->where('id',$id)->setInc('download_sum');	//文件表次数更新
		
	}
	
	
}
