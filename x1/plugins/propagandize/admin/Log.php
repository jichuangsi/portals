<?php
namespace plugins\propagandize\admin;

use app\common\controller\AdminBase;
use app\common\traits\AddEditList;
use app\common\model\User as Model;

class Log extends AdminBase
{
	use AddEditList;	
	protected $validate = '';
	protected $model;
	protected $form_items = [];
	protected $list_items;
	protected $tab_ext = [
			'page_title'=>'宣传推广日志',
	        'top_button'=>[ ],
	        'right_button'=>[ ],
	];
	
	protected function _initialize(){
	    parent::_initialize();
	    $this->model = new Model();	    
	}
	
	public function index($type=0) {
	    $this->list_items = [
	            ['uid','新用户','username'],
	            ['regdate','注册时间','datetime'],
	            ['introducer_1','直接推荐人','username'],
	            ['introducer_2','上级推荐人','username'],
	            ['introducer_3','上上级推荐人','username'],
	    ];
 
	    //$this->tab_ext['search']=['introducer_1'=>'直接推荐人uid','introducer_2'=>'上级推荐人uid','introducer_3'=>'上上级推荐人uid'];
	    $data_list = Model::whereOr('introducer_1','>',0)->whereOr('introducer_2','>',0)->whereOr('introducer_3','>',0)->order("uid desc")->paginate(15);
	    return $this -> getAdminTable($data_list);
	}
}
