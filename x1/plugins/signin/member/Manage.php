<?php
namespace plugins\signin\member;

use app\common\controller\MemberBase;
use app\common\traits\AddEditList;
use plugins\signin\model\Cfg AS CfgModel;
use plugins\signin\model\Member;

class Manage extends MemberBase
{
    use AddEditList;
    protected $validate = '';
    protected $model;
    protected $form_items;
    protected $list_items;
    protected $tab_ext;
    
    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new CfgModel();
        $this->tab_ext['page_title'] = QUN.'签到设置';     
        $this->form_items = [
                ['hidden','ext_id',$ext_id],
                ['hidden','ext_sys',$ext_sys],
                ['text','day_money','每天签到可得多少个积分'],
                ['text','limit_num','每天限制多少人签到'],
                ['text','min_money','超过上限的签到人数,给予多少积分的奖励'],
        ];
    }
    
    public function add($ext_id=0,$ext_sys=0){
        $qun = $this->get_qun($ext_id,$ext_sys);
        $this->form_items = array_merge($this->form_items,
                [
                        ['hidden','ext_id',$ext_id],
                        ['hidden','ext_sys',$ext_sys],
                ]);
        return $this->addContent();
    }
    
    public function edit($id=0){
        $this->form_items = array_merge($this->form_items,
                [
                        ['hidden','id',$id],
                ]);
        $info = CfgModel::where('id',$id)->find();
        if (empty($info)) {
            $this->error('ID有误');
        }elseif ($info['uid']!=$this->user['uid']){
            $this->error('你没权限');
        }
        return $this->editContent($info);
    }
    
    public function set($ext_id=0,$ext_sys=0){
        if (empty($ext_id)) {
            $this->error('参数不存在');
        }
        if (empty($ext_sys)) {
            $ext_sys = modules_config('qun')['id'];
        }
        $map = [
                'ext_id'=>$ext_id,
                'ext_sys'=>$ext_sys,
        ];
        $qun = $this->get_qun($ext_id,$ext_sys);
        $info = CfgModel::where($map)->find();
        if (empty($info)) {
            return $this->add($ext_id,$ext_sys);
        }elseif ($info['uid']!=$this->user['uid']){
            $this->error('你没权限');
        }
        return $this->edit($info['id']);
    }
    
    public function delete($id=0){
    }
    
    /**
     * 获取关联内容信息,比如圈子
     * @param number $ext_id
     * @param number $ext_sys
     * @return void|\plugins\signin\model\unknown
     */
    protected function get_qun($ext_id=0,$ext_sys=0){        
        $info = Member::get_info($ext_id,$ext_sys);
        if ($info['uid']!=$this->user['uid']){
            $this->error('你没权限!!');
        }
        return $info;
    }
    
    
    public function index(){
        $this->list_items = [
                ['title',QUN.'名称','text'],
        ];
        $listdb = fun('qun@getByuid',$this->user['uid']);
        foreach ($listdb AS $key=>$rs){
            unset($rs['status']);
            $rs['picurl'] = tempdir($rs['picurl']);
            $listdb[$key] = $rs;
        }
        $this->tab_ext['right_button'] = [
                [
                        'title'=>'预览',
                        'url'=>purl('index/index',['id'=>'__id__'],'index'),
                        'icon'=>'glyphicon glyphicon-calendar',
                        'target'=>'blank',
                ],
                [
                        'title'=>'签到设置',
                        'url'=>purl('set',['ext_id'=>'__id__']),
                        'icon'=>'fa fa-gears',
                ],
        ];
        $this->tab_ext['top_button'] = [];
        return $this->getAdminTable($listdb);
    }
    

}
