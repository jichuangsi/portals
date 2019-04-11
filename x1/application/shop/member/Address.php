<?php
namespace app\shop\member;

use app\common\controller\MemberBase;
use app\common\traits\AddEditList;
use app\member\model\Address AS AddressModel;

class Address extends MemberBase
{
    use AddEditList;
    
    protected $validate = '';
    protected $model;
    protected $form_items;
    protected $list_items;
    protected $tab_ext;
    protected $mid;
    
    protected function _initialize()
    {
        parent::_initialize();
        $this->model        = new AddressModel();
        $this->list_items = [
                ['user','联系人','text'],
                ['telphone','联系电话','text'],
                ['address','联系地址','text'],
                ['often','默认地址','yesno'],
        ];
        $this->tab_ext['page_title'] = '我的收货地址';
        $this->tab_ext['right_button'] = [
                [
                        'type'=>'delete',
                        'title'=>'删除',
                ],
                [
                        'type'=>'edit',
                        'title'=>'修改',
                ],
        ];
        $this->form_items = [
                ['text','user','联系人'],
                ['number','telphone','联系电话'],
                ['text','address','联系地址<dd class="layui-input-inline" style="display:none;"> <div class="ListArea"><select name='.province_id.' data-title="请选择省份" lay-ignore></select> <select name='.city_id.' data-title="请选择城市" lay-ignore></select> <select name='.zone_id.' data-title="请选择区域" lay-ignore></select> <select name='.street_id.' data-title="请选择街道" lay-ignore></select></div></dd>'],
                ['radio','often','是否为默认地址','',['否','是']],
        ];
    }
    
    
    public function index($ext_id=0) {
        if ($this->request->isPost()) {
            //修改排序
            return $this->edit_order();
        }
        
        $map = [
                'uid'=>$this->user['uid'],
        ];
        if ($ext_id) {
            if (empty($ext_sys)) {
                $ext_sys = modules_config('qun')['id'];
            }
            $map = [
                    'ext_id'=>$ext_id,
                    'ext_sys'=>$ext_sys,
            ];
        }
        
        $this->tab_ext['top_button'] = [
                [
                        'type'=>'add',
                        'title'=>'新增收货地址',
                        'href'=>url('add',[
                                'ext_id'=>$ext_id,
                                'ext_sys'=>$ext_sys,
                        ]),
                ],
        ];
        
        $listdb = $this->getListData($map);
        return $this -> getAdminTable($listdb);
    }
    
    public function add($ext_id=0,$ext_sys=0) {
//  	return $this->err_js("123321"); 
        $url = url('index',[
                'ext_id'=>$ext_id,
                'ext_sys'=>$ext_sys,
        ]);
        return $this -> addContent($url);
    }
    
    public function edit($id = null) {        
        if (empty($id)) $this -> error('缺少参数');
        $info = $this -> getInfoData($id);
        if ($info['uid']!=$this->user['uid']) {
            $this -> error('你没权限');
        }
        $url = url('index',[
                'ext_id'=>$info['ext_id'],
                'ext_sys'=>$info['ext_sys'],
        ]);
        return $this -> editContent($info,$url);
    }
    
    
    public function delete($ids = null) {
        $ids = is_array($ids)?$ids:[$ids];
        foreach($ids AS $key){
            $info = $this -> getInfoData($key);
            if ($info['uid']!=$this->user['uid']) {
                $this -> error('你没权限');
            }
        }
        if ($this -> deleteContent($ids)) {
            $this -> success('删除成功');
        } else {
            $this -> error('删除失败');
        }
    }
}