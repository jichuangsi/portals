<?php
namespace app\cmswk\admin;

use app\common\controller\admin\S;


class Sort extends S
{
	/* 
	public function index(){
		
				echo "<pre>";
		$listdb = $this->getListData($map = [], $order = []);
		
		echo '栏目总数'.count($listdb);
		echo '<hr>';
		
		$sortdb=array();
		foreach ($listdb AS $val){
			if(!$val['pid']){
				$sortdb[$val['id']]['id'] = $val['id'];
				$sortdb[$val['id']]['name'] = $val['name'];
				$sortdb[$val['id']]['son'] = $this->blsort($listdb,$val['id']);
				
			}
		}
		
		echo "<hr color='red'>";
		print_r($sortdb);
		echo "<hr color='blue'>";
		print_r($listdb);
	}
	
	public function blsort($listdb=[],$id=0){
		$sondb = [];
		foreach ($listdb AS $v){
			if($v['pid']==$id){
				$sondb[$v['id']]['id'] = $v['id'];
				$sondb[$v['id']]['xiaji'] = $this->blsort($listdb,$v['id']);
			}
		}
		if($sondb){
			return $sondb;
		}
	} */
}













