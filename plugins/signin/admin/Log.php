<?php
namespace plugins\signin\admin;

use app\common\controller\AdminBase;
use app\common\traits\AddEditList;
use plugins\signin\model\Member as MemberModel;

class Log extends AdminBase
{
	use AddEditList;	
	protected $validate = '';
	protected $model;
	protected $form_items = [];
	protected $list_items;
	protected $tab_ext = [
			'page_title'=>'会员签到日志',	        
	        'right_button'=>[ ['type'=>'delete']],
	        'search'=>['uid'=>'用户UID','ip'=>'来源IP',],
// 	        'hidden_edit'=>true,	
	];
	
	protected function getOrder(){
	    return 'id desc';
	}
	
	protected function _initialize()
    {
		parent::_initialize();
		$this->model = new MemberModel();
		if (empty(table_field('signin_member','rank'))) {
		    query("ALTER TABLE  `qb_signin_member` ADD  `rank` SMALLINT( 5 ) NOT NULL COMMENT  '排名'");
		}
		if (empty(table_field('signin_member','intime'))) {
		    query("ALTER TABLE  `qb_signin_member` ADD  `intime`  tinyint( 1 ) NOT NULL COMMENT  '是否及时签到'");
		}
		$this->tab_ext['top_button'] = [
		        ['type'=>'delete'],
		        [
		                'title'=>'前台签到页',
		                'url'=>purl('index/index',[],'index'),
		                'target'=>'_blank',
		        ],
		];
		$this->list_items = [
				 
				['uid', '用户', 'username'],
		        ['ip', '来源IP', 'text'],
				['create_time', '签到时间', 'datetime'],
		        ['money', '所得积分', 'text'],
		        ['rank', '排名', 'text'],
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
