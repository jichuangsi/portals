<?php
namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Config AS ConfigModel;
use plugins\config_set\model\Group AS GroupModel;
use app\common\traits\AddEditList;
use think\Cache;
use app\common\fun\Cfgfield;


class Setting extends AdminBase
{
    use AddEditList;
    protected $validate = '';
    protected $model;
    protected $form_items = [];
    protected $list_items;
    protected $tab_ext;
    protected $group = 'base';
    protected $_config = [];    //系统强制要补上的字段
    protected $config = [];    //频道或插件强制要补上的字段

    protected function _initialize()
    {
        parent::_initialize();
        $this->model = new ConfigModel();
        $this->tab_ext = [ 'help_msg'=>'系统参数配置',];
        $this->add_module_config();
    }
    
    /**
     * 模块里要强制补上的配置参数
     */
    protected function add_module_config(){
        if ($this->config || defined('IN_PLUGIN') || empty(config('system_dirname'))) {
            return ;
        }
        $this->config = [
                [
                        'c_key'=>'module_pc_index_template',
                        'title'=>'频道主页PC版风格模板',
                        'c_descrip'=>'请把模板放在此目录下: /template/index_style/ 然后输入相对路径,比如 default/abc.htm',
                        'form_type'=>'text',
                        'ifsys'=>0,
                        'list'=>-1,
                ],
                [
                        'c_key'=>'module_wap_index_template',
                        'title'=>'频道主页WAP版风格模板',
                        'c_descrip'=>'请把模板放在此目录下: /template/index_style/ 然后输入相对路径,比如 default/abc.htm',
                        'form_type'=>'text',
                        'ifsys'=>0,
                        'list'=>-1,
                ],
                [
                        'c_key'=>'group_create_num',
                        'title'=>'发布主题数量对应用户组的限制',
                        'c_descrip'=>'针对总数限制，非按天限制。留空或为0则不限制',
                        'form_type'=>'usergroup',
                        'ifsys'=>0,
                        'list'=>-1,
                ],
                [
                        'c_key'=>'group_post_money',
                        'title'=>'发布主题对应用户组的积分变化',
                        'c_descrip'=>'填负数才是扣积分，否则就是奖励积分，0或留空则不做处理',
                        'form_type'=>'usergroup',
                        'ifsys'=>0,
                        'list'=>-1,
                ],
        ];
    }
    
    /**
     * 补全系统强制要加上的字段
     * @param number $group 分组ID
     */
    protected function add_config($group=0){
        if (empty($group)) {
            return ;
        }
        $gdb = GroupModel::where('id',$group)->find();
        if($gdb['sys_id']==0){                  //分组属于系统,不属于任何频道或插件
            $array = $this->_config;
        }else{                                          //分组属于频道或插件
            $array = $this->config;
        }
        
        foreach ($array AS $rs){
            $realut = ConfigModel::where(['c_key'=>$rs['c_key'],'sys_id'=>$gdb['sys_id'],])->find();
            if(empty($realut)){     //数据表中不存在强制要加的字段,就强制补上
                $rs['sys_id'] = $gdb['sys_id'];
                $rs['type'] = $group;
                $rs['ifsys'] = $gdb['sys_id']>0 ? 0 : $rs['ifsys'];
                ConfigModel::create($rs);
            }
        }
    }
    
    /**
     * 清除缓存
     */
    public function clearcache(){
        delete_dir(RUNTIME_PATH.'temp');
        delete_dir(RUNTIME_PATH.'log');
        Cache::clear();
        
        $this->success('清除成功','index/welcome');
    }
    
    /**
     * 设置分组导航
     * @param unknown $group
     */
    protected function setNav($group){
        $this->tab_ext = [
                'nav'=>[
                        GroupModel::getNav(true),   //分组导航
                        $group
                ],
        ];
    }
    
    
    /**
     * 参数设置
     * @param string $group 分组ID
     * @return mixed|string
     */
    public function index($group='1')
    {
        // 保存数据
        if ($this->request->isPost()) {
            // 表单数据
            $data = $this->request->post();
            if( $this->model->save_group_data($data,$data['group']?$data['group']:$group) ){
                $this->success('修改成功');
            }            
        }
        
        $this->add_config($group);      //补全字段
        
        //某分类下的所有参数选项
        $list_data = empty($group) ? [] : $this->model->getListByGroup($group);
        
        //创建表格
        $this->setNav($group);
        $tab_list = [
                ['hidden','group',$group]
        ];
        $this->form_items = array_merge($tab_list,Cfgfield::toForm($list_data));
        
        $data = [];
        foreach($list_data AS $rs){
            $data[$rs['c_key']] = $rs['c_value'];
        }
        $this->mid = $group;    //纯属为了模板考虑的
		return $this->editContent($data);
    }

}
