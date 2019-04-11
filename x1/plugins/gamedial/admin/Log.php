<?php
namespace plugins\gamedial\admin;

use app\common\controller\AdminBase;
use app\common\traits\AddEditList;
use plugins\gamedial\model\Member as MemberModel;

class Log extends AdminBase
{
	use AddEditList;	
	protected $validate = '';
	protected $model;
	protected $form_items = [];
	protected $list_items;
	protected $tab_ext = [
			'page_title'=>'会员抽奖日志',
	        'right_button'=>[ ['type'=>'delete']],
	];
	
	protected function getOrder(){
	    return 'id desc';
	}
	
	protected function _initialize()
    {
		parent::_initialize();
		$this->model = new MemberModel();
		$this->tab_ext['top_button'] = [ ['type'=>'delete'],
		        [
		                'title'=>'查看大转盘',
		                'target'=>'_blank',
		                'href'=> purl('index/index',[],'index'),
		        ],
		];
		$this->list_items = [
				 
				['uid', '用户', 'username'],
				['create_time', '抽奖时间', 'datetime'],
		        ['money', '所得积分', 'text'],
		        ['typesize', '所得奖项', 'select2',['','一等奖','二等奖','三等奖','鼓励奖']],
// 				['sysid', '签到模块', 'callback',function($id){
// 				    $array = modules_config($id);
// 				    return $array['name'];
// 				}],
// 				['aid', '签到主题', 'callback',function($id,$rs){
// 				    $array = MemberModel::get_info($rs['aid'],$rs['sysid']);
// 				    return "<a href='{$array['url']}' target='_blank'>{$array['title']}</a>";
// 				},'__data__'],			
			];
	}

}
