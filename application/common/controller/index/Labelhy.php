<?php
namespace app\common\controller\index;

use app\common\controller\IndexBase;
use app\common\traits\LabelhyEdit;


abstract class Labelhy extends IndexBase
{
    use LabelhyEdit;
    protected $tab_ext ;
    protected $form_items;
    protected $model;                 //内容模型
    protected $m_model;            //模块模型
    protected $s_model;              //栏目模型
    
    protected function _initialize()
    {
        parent::_initialize();
        if ($this->check_power() !== true) {
            $this->error('你没权限!');
        }
        preg_match_all('/([_a-z]+)/',get_called_class(),$array);
        $dirname = $array[0][1];        
        $this->model = get_model_class($dirname,'content');
        $this->m_model = get_model_class($dirname,'module');
        $this->s_model = get_model_class($dirname,'sort');
        //底部按钮
        $this->tab_ext = [
                'addbtn'=>'<a href="'.auto_url('delete',$this->get_parameter()).'"><button  type="button" class="btn btn-default">清空数据</button></a> 
                                    <a href="'.auto_url('index/labelhy/index',$this->get_parameter()).'?limit_type=system"><button  type="button" class="btn btn-default">更换其它</button></a> 
                                   <button onclick="parent.layer.close(parent.layer.getFrameIndex(window.name));parent.location.reload();" type="button" class="btn btn-danger">关闭当前窗口</button>',
                'hidebtn'=>'back',
        ];
        if(!in_wap()){  //非WAP端,强制使用PC模板
            define('USE_PC_TEMPLATE', true);
        }
    }
    
    
    /**
     * 通用标签设置
     * @return mixed|string
     */
    public function tag_set()
    {
        if($this->request->isPost()){
            $this->setTag_value("app\\".config('system_dirname')."\\model\\Content@labelGetList");
            $_array = $this->get_post_data();
            //这里要做个权限判断,避免修改其它用户的信息 $_array['ext_id']
            $this->save($_array);
        }
        $url_array = $this->get_parameter();
        
        $info = $this->getTagInfo();        
        
        if(empty($info) || empty($info['view_tpl'])){
            //$info['view_tpl'] = $this->get_cache_tpl();
        }
        
        $rsdb = unserialize($info['cfg']);
        
        $mid = input('mid');
        
        //之前选定了辅栏目
        if (config('use_category')&&empty($mid)&&strstr($info['class_cfg'],'@labelGetCategoryList')) {
            header("location:".url('category_set',$url_array));
            exit;
        }
        
        if(empty($mid)&&!empty($rsdb['mid'])){
            $mid = $rsdb['mid'];
        }
        
        //模型分类菜单
        $nav = [];
        foreach ($this->m_model->getTitleList() AS $key=>$value){
            $nav[$key]=[
                    'title'=>$value,
                    'url'=>url('tag_set',array_merge($url_array,['mid'=>$key])),
            ];
        }
        
        if(config('use_category')&&category_config()){  //辅栏目存在的时候
            $nav['category']=[
                    'title'=>'辅栏目',
                    'url'=>url('category_set',$url_array),
            ];
        }
        
        if (empty($nav[$mid])) {    //考虑到更换频道后,有的模型并不存在
            unset($mid,$rsdb['mid']);
        }
        
        $mid || $mid=$this->m_model->getId();   //获取一个默认模型ID
        
        $this->tab_ext['nav'] =[
                $nav,
                $mid,
        ];
        
        $cfg = cache('tag_default_'.input('name'));
        
        $this->form_items = [
                ['hidden','mid',$mid],
                ['hidden','type',config('system_dirname')],
                //['radio','fidtype','栏目范围','',['不限','指定栏目'],0],
                //['checkboxtree','fids','指定栏目','不选择将显示所有栏目，要显示子栏目的话，必须全选中',$this->s_model->getTreeTitle(0,$mid,false)],
                ['number','rows','显示条数','',5],
                ['number','leng','标题显示字数','',70],
                ['number','cleng','内容显示字数','',250],
                ['radio','ispic','是否要求有封面图','',['不限','必须要有封面图'],0],
                //['radio','status','范围限制','',['不限','已审','推荐'],0],
                ['radio','order','排序方式','',['id'=>'发布日期','view'=>'浏览量','list'=>'可控排序','rand()'=>'随机排序',],'id'],
                ['radio','by','排序方式','',['desc'=>'降序','asc'=>'升序'],'desc'],
        ];
        
        if($info['if_js']){ //APP站外调用,不使用模板,只要JSON数据
            $num = count($this->form_items);
            unset($this->form_items[$num-2] , $this->form_items[$num-1]);            
        }
        
        $this->tab_ext['trigger'] = [
                ['fidtype', '1', 'fids'],
        ];
        
        return $this->editContent($rsdb);
    }
    
    
    /**
     * 类的标签设置
     * @return mixed|string
     */
    public function class_set(){
        
        if($this->request->isPost()){
            $this->setTag_value(str_replace('--', '\\', input('classname')));
            $_array = $this->get_post_data();
            $this->save($_array);
        }
        $info = $this->getTagInfo();
        
        if(empty($info) || empty($info['view_tpl'])){
            //$info['view_tpl'] = $this->get_listpage_cache_tpl();
        }
        
        $this->tab_ext['page_title'] = '类标签设置';
        
        $this->form_items = [
                //['hidden','div_width',input('div_width')],
                //['hidden','div_height',input('div_height')],
                ['hidden','type','class'],
                ['hidden','type','classname',input('classname')],
                ['number','rows','显示条数','',5],               
                //['radio','order','排序方式','',['id'=>'日期','rand()'=>'随机排序',],'id'],
                ['radio','by','排序方式','',['desc'=>'降序','asc'=>'升序'],'desc'],
                //['text', 'where', 'where查询条件(不懂PHP,禁止乱填,否则页面会报错)','例如:fid=5又或者fid|in|2,4,6@uid|not in|5,8'],                
                ['textarea','view_tpl','模板代码','',$info['view_tpl']],
                ['button', 'choose_style', [
                        'title' => '点击选择模板',
                        'icon' => 'fa fa-plus-circle',
                        'href'=>url('index/label/choose_style',['type'=>'title','tpl_cache'=>'tags_page_demo_tpl_'.input('pagename'),'name'=>input('name')]),
                        //'data-url'=>url('choose_style',['type'=>'images']),
                        'class'=>'form-btn pop',
                    ],
                        'a'
                ],
        ];
        return $this->editContent(unserialize($info['cfg']));
    }
    
}













