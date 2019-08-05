<?php
namespace app\cmswk\index;

use app\common\controller\index\C; 


//内容页与列表页
class Content extends C
{
	
	/**
	 * 列表页
	 * {@inheritDoc}
	 * @see \app\common\controller\index\C::index()
	 */
	public function index($fid=0,$mid=0){
	    return parent::index($fid,$mid);
	}
	
	/**
	 * 内容详情页
	 * {@inheritDoc}
	 * @see \app\common\controller\index\C::show()
	 */
	public function show($id){

	    return parent::show($id);
	}
	
	/**
	 * 访问权限检查
	 * @param array $info
	 */
	protected function view_check($info=[]){
		parent::view_check($info);
		if($info['if_private'] && ($info['uid']!=$this->user['uid'])){
			$this->error('该文档是私有文档，你无权查看！');
		}
	}
	
	
	
	/**
	 * PDF文档查看
	 * {@inheritDoc}
	 * @see \app\common\controller\index\C::show()
	 */
	public function viewer(){
		return $this->fetch('viewer');
	}
	
	
	/**
	 * 文档下载前相关检测或扣费处理
	 * @param number $id 文档ID
	 * @see \app\common\controller\index\C::show()
	 */
	public function download_check($id=0){
		
		if(empty($this->user)){
			$this->error('登陆后才可以下载相关内容！');
		}
		$this->mid = $this->model->getMidById($id);
		if(empty($this->mid)){
			$this->error('内容不存在!');
		}
		//获取内容数据
		$info = $this->getInfoData($id);
		
		$jf_name = $this->webdb['MoneyName'];//积分名称
		
		$map = [
				'uid'=>$this->user['uid'],
				'aid'=>$id
		];
		$download_info = $this->model->getDownloadInfo($map);//检测下载记录
		$pay_money = 0;//下载文档需消耗的积分
		//非发布者本人
		if($this->user['uid']!=$info['uid']){
			if($info['if_private']){
				$this->error('该文档为私有文档，你无权下载！');
			}
			//没下载过并且需要积分下载的相关处理
			if(empty($download_info)&&($info['money']>0)){
				$pay_money = $info['money'];
				if($pay_money>$this->user['money'])
					$this->error("你目前的".$jf_name.'为'.$this->user['money'].'，下载该文档需消耗'.$pay_money.$jf_name.',请进入会员中心充值'.$jf_name.'再进行下载！');
				add_jifen($this->user['uid'],-$info['money'],'下载【'.$info['title'].'】消耗积分');//扣取下载文档积分
			}
		}
		
		if(empty($download_info)){
			$insert_data = [
					'aid'=>$id,
					'uid'=>$this->user['uid'],
					'auid'=>$info['uid'],
					'money'=>$pay_money,
					'create_time'=>time(),
					'download_num'=>1
			];
			$this->model->insertDownloadLog($insert_data);
		}else{
			$this->model->updateDownloadLog($id,$this->user['uid']);
		}
		return $info; //返回文档数据内容
	
		
	}
	
	
	
	
	/**
	 * 文档下载
	 * @param number $id 文档ID
	 * @see \app\common\controller\index\C::show()
	 */
	public function download_file($id=0){

		//获取内容数据
		$info = $this->download_check($id);

		$file_arr = explode('.',$info['file_url']);
		$doc_type = strtolower(array_pop($file_arr));//文件后缀名
	
		$filename = $info['title']?$info['title'].'.'.$doc_type:$info['file_url'];//下载的文件名

		$file_path = PUBLIC_PATH.$info['file_url'];//文件所在位置
		
		if(!file_exists($file_path)){   //检查文件是否存在
			$this->error('该文件不存在');
		}else{
			$file = fopen($file_path,"r"); // 打开文件
			// 输入文件标签
			Header("Content-type: application/octet-stream");
			Header("Accept-Ranges: bytes");
			Header("Accept-Length: ".filesize($file_path));
			Header("Content-Disposition: attachment; filename=" . $filename);
			// 输出文件内容
			echo fread($file,filesize($file_path));
			fclose($file);
			exit();
		}
	}
	
	
	
}
