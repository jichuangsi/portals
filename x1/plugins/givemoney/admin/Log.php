<?php
namespace plugins\givemoney\admin;

use app\common\controller\AdminBase;
use app\common\traits\AddEditList;
use plugins\givemoney\model\Member as MemberModel;

class Log extends AdminBase
{
	use AddEditList;	
	protected $validate = '';
	protected $model;
	protected $form_items = [];
	protected $list_items;
	protected $tab_ext = [
			'page_title'=>'用户打赏主题日志',
	        'top_button'=>[ ['type'=>'delete']],
	        'right_button'=>[ ['type'=>'delete']],
// 	        'hidden_edit'=>true,	
	];
	
	protected function getOrder(){
	    return 'id desc';
	}
	
	protected function _initialize()
    {
		parent::_initialize();
		$this->model = new MemberModel();
		$this->list_items = [
		        ['aid', '所属主题', 'callback',function($id,$rs){
		           //$array = MemberModel::get_info($rs['aid'],$rs['sysid']);
		             $array = fun('content@info',$rs['aid'],$rs['sysid'],true);
		            return "<a href='{$array['url']}' target='_blank'>{$array['title']}</a>";
		        },'__data__'],	
		        ['sysid', '所属频道', 'callback',function($id){
		            $array = modules_config($id);
		            return $array['name'];
		        }],
				['touid', '打赏者', 'username'],
				['create_time', '打赏时间', 'datetime'],
		        ['touid', '受赠者', 'username'],
		        ['money', '所得积分', 'text'],
			];
	}

}
