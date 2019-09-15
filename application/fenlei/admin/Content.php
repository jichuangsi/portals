<?php
namespace app\fenlei\admin;

use app\common\controller\admin\C;
use app\fenlei\traits\Content AS TraitsContent;


class Content extends C
{	
    use TraitsContent;
    
    /**
     * 一次性列出所有模型的内容，效率会比较低
     * @return mixed|string
     */
    public function listall()
    {
        isset($this->tab_ext['nav'])              || $this->tab_ext['nav'] = [ $this->nav() , 0];
        isset($this->tab_ext['page_title'])     || $this->tab_ext['page_title'] = '内容管理';
        isset($this->tab_ext['top_button'])   || $this->tab_ext['top_button'] = [
                [
                        'title' => '发布内容',
                        'icon'  => 'fa fa-plus',
                        'class' => '',
                        'href'  => auto_url('postnew')
                ],
                [
                        'type'       => 'delete',
                ],
                [
                        'title'       => '添加到辅栏目',
                        'icon'        => 'fa fa-indent',
                        'class'       => 'confirm',
                        'target-form' => 'ids',
                        'href'        => auto_url('info/add')
                ],
                [
                        'title' => '返回栏目列表',
                        'icon'  => 'fa fa-reply',
                        'class' => '',
                        'href'  => auto_url('sort/index')
                ],
        ];
        
        //比如万能表单是不需要栏目的，就不要显示栏目
        if(empty(config('post_need_sort'))){
            unset($this->tab_ext['top_button'][3]);
        }
        if(empty(config('use_category'))){
            unset($this->tab_ext['top_button'][2]);
        }
        
        if(empty($this->list_items)){
            //列表显示哪些字段
            $this->list_items =  [
                    ['fid', '所属活动', 'select',$this->s_model->getTitleList(),config('system_dirname')],
                    ['mid', '所属模型', 'select2',$this->m_model->getTitleList()],
					['gid', '机构名称', 'callback',function($value){
                        $array = $this->get_hy($value);
                        return $array;
                    }],
                    ['uid', '发布者', 'username'],
                    ['create_time', '创建日期', 'datetime'],
                    ['namelist', '黑白名单', 'select',['黑名单','白名单']],
                    ['content', '备注', 'text'],
            ];
            //比如万能表单是不需要栏目的，就不要显示栏目
            if(empty(config('post_need_sort'))){
                unset($this->list_items[1]);
            }
        }
        $data = $this->model->getAll( $this->getMap() ,$this->getOrder('id desc'));
        return $this->getAdminTable($data);
    }
    
    /**
     * 列出所有内容，可以根据栏目ID或者模型ID，但不能为空，不然不知道调用什么字段
     * @param number $fid
     * @param number $mid
     * @param string $type 为listall值的话,显示所有,在这里调用的目的是为了省去再单独的设置后台权限
     * @return mixed|string
     */
    public function index($fid=0,$mid=0,$type='')
    {    
        if($type=='listall'){   //放在这里的话,就省去再单独的设置后台权限
            return $this->listall();
        }elseif($type=='excel'){
            return $this->excel($mid,input()['ids']);
        }
        if(!$mid && !$fid){
            //$this->error('参数有误！');
            //$mid = $this->m_model->getID();
            return $this->listall();
        }elseif($fid){ //根据栏目选择发表内容
            $mid = $this->model->getMidByFid($fid);
            //$mid = ContentModel::getMidByFid($fid);
        }
        
        $this->mid = $mid;
        $this->tab_ext['nav'] = [ $this->nav() , $mid];
        isset($this->tab_ext['page_title']) || $this->tab_ext['page_title'] = '内容管理';

        
        if(!isset($this->tab_ext['top_button'])){
            $this->tab_ext['top_button'] = [
                    [
                            'title' => '发布内容',
                            'icon'  => 'fa fa-plus',
                            'class' => '',
                            'href'  => auto_url('add',$fid?['fid'=>$fid]:['mid'=>$mid])
                    ],
                    [
                            'type'       => 'delete',
                    ],
                    [
                            'title'       => '添加到辅栏目',
                            'icon'        => '',
                            'class'       => 'ajax-post confirm',
                            'target-form' => 'ids',
                            'href'        => auto_url('info/add')
                    ],
                    [
                            'title' => '返回栏目列表',
                            'icon'  => 'fa fa-reply',
                            'class' => '',
                            'href'  => auto_url('sort/index')
                    ],
            ];
            
            //比如万能表单是不需要栏目的，就不要显示栏目
            if(empty(config('post_need_sort'))){
                unset($this->tab_ext['top_button'][3] );
            }
            
            //不使用辅栏目
            if(empty(config('use_category'))){
                unset($this->tab_ext['top_button'][2]);
            }
            
        }
        
        //排序方式
        $this -> tab_ext['order'] = 'view,list,create_time';
        //搜索字段
        $this -> tab_ext['search'] = array_merge(['title'=>'标题','uid'=>'用户uid'],$this->getEasySearchItems());
        //筛选字段
        $this->tab_ext['filter_search'] = array_merge( $this->getEasyfiltrateItems(),[
                'fid'=>get_sort(0,'all'),
                'status'=>['未审核','已审核','已推荐']
        ]);
        
        if(empty($this->list_items)){
            $array =  [
                    ['fid', '所属活动', 'select',$this->s_model->getTitleList(),config('system_dirname')],
                    //['mid', '所属模型', 'select2',$this->m_model->getTitleList()],
                    ['uid', '发布者', 'callback',function($value){
                        $array = get_user($value);
                        return $array['username'];
                    }],
                    ['gid', '机构名称', 'callback',function($value){
                        $array = $this->get_hy($value);
                        return $array;
                    }],
                    ['create_time', '创建日期', 'datetime'],
                    ['namelist', '黑白名单', 'select',['黑名单','白名单']],
                    ['title', '备注', 'text'],
            ];
            
            //比如万能表单是不需要栏目的，就不要显示栏目
            if(empty(config('post_need_sort'))){
                unset( $array[0] );
            }
            
            //列表显示哪些字段
            $this->list_items = array_merge(
//                  $this->getEasyIndexItems(),  //列表要显示的自定义字段
                    $array
                    );            
        }
        
        $data = self::getListData($fid ? ['fid'=>$fid] : ['mid'=>$mid]);
        return $this->getAdminTable($data);
    }
    
    /**
     * 发布页，可以根据栏目ID或者模型ID，但不能为空，不然不知道调用什么字段
     * @param number $fid
     * @param number $mid
     * @return unknown
     */
    public function add($fid=0,$mid=0)
    {
    	$urls=get_url('location');
    	
        $data = $this->request->post();
        
//       if(strpos($data['picurl'],'uploads') !== false){
//       	$dataurl=substr($urls,0,strpos($urls,'/admin'))."/public/";
//       	$data['picurl']=$dataurl.$data['picurl'];
//       }
       
        isset($data['fid']) && $fid = $data['fid'];
        
        if($fid && !$mid){
            $mid = $this->model->getMidByFid($fid);
        }elseif( !$fid && !$mid ){  //栏目与模型都为空
            return $this->postnew();
        }elseif( config('post_need_sort') && !$fid ){  //指定必须要选择栏目的频道
            return $this->postnew($mid);
        }
        $this->mid = $mid;
        
        //接口
        hook_listen('cms_add_begin',$data);
        if (($result=$this->add_check($mid,$fid,$data))!==true) {
            $this->error($result);
        }
        
        // 保存数据
        if ($this -> request -> isPost()) {
//             $data = $this->request->post();
            
//             if(isset($data['map'])){
//                 list($data['map_x'],$data['map_y']) = explode(',', $data['map']);
//             }
            
            $this->saveAdd($mid,$fid,$data);
        }
        
       //发表时可选择的栏目
        $sort_array = $this->s_model->getTreeTitle(0,$this->mid);
        //发布页要填写的字段
//      $this->form_items = $this->getEasyFormItems();     //发布表单里的自定义字段
		$this->form_items = [     
				['select', 'gid', '机构','',$this->getHyList()],     
				['select', 'namelist', '黑白名单','',['黑名单','白名单']],       
                ['text', 'title', '备注'],
        ];
        //如果栏目存在才显示栏目选择项
        if( config('post_need_sort') ){
            $this->form_items = array_merge(
                        [
                                [ 'select','fid','所属活动','',$sort_array,$fid],
                               // [ 'linkages','street_id','所属地区','','area',4],
                        ],
                        $this->form_items
                        //$this->getEasyFormItems()
                    );
        }
        
        //联动字段
        $this->tab_ext['trigger'] = $this->getEasyFieldTrigger();
        
//      $this->tab_ext['area'] = config('use_area'); //是否启用地区
        
        //分组显示
        $this->tab_ext['group'] = $this->get_group_form($this->form_items);
        if( $this->tab_ext['group'] ){
            unset($this->form_items);
        }

        $this->tab_ext['page_title'] = '发布 '.$this->m_model->getNameById($this->mid);

        return $this->addContent('index',['fid'=>$fid]);
    }
    
    /**
     * 模型分类导航
     * @return string[][]|NULL[][]|unknown[][]
     */
    protected function nav(){
        $tab_list   = [
                [
                        'title'=>'所有内容',
                        //'url'=>auto_url('listall'),
                        'url'=>auto_url('index','type=listall'),
                ]
        ];
        $mlist = $this->m_model->getTitleList();
        foreach ( $mlist AS $key => $value) {
            $tab_list[$key] = [
                    'title'=>$value,
                    'url'=>auto_url('index', ['mid' => $key]),
            ];
        }
        return $tab_list;
    }
    
    /**
     * 修改内容
     * @param unknown $id
     * @return mixed|string
     */
    public function edit($id)
    {
        if(empty($id)){
            $this->error('缺少id参数');
        }
        
        $info = $this->getInfoData($id);
        
        if(empty($info)){
            $this->error('信息不存在参数');
        }
        
        $this->mid = $info['mid'];  //$this->model->getMidById($id);
        
        // 保存数据
        if ($this -> request -> isPost()) {
			//表单数据
			$data = $this->request->post();
			
			//接口
			hook_listen('cms_edit_begin',$data);
			if (($result=$this->edit_check($id,$info,$data))!==true) {
			    $this->error($result);
			}
			
// 			if(isset($data['map'])){
// 			    list($data['map_x'],$data['map_y']) = explode(',', $data['map']);
// 			}

            $this->saveEdit($this->mid,$data);
        }
        
        //发表时可选择的栏目
        $sort_array = $this->s_model->getTreeTitle(0,$this->mid);
        //发布页要填写的字段
//      $this->form_items = $this->getEasyFormItems();     //发布表单里的自定义字段
		$this->form_items = [     
				['select', 'gid', '机构','',$this->getHyList()],     
				['select', 'namelist', '黑白名单','',['黑名单','白名单']],       
                ['text', 'title', '备注'],
        ];
        //如果栏目存在才显示栏目选择项
        if(config('post_need_sort')){
            $this->form_items = array_merge(
                    [
                            [ 'select','fid','所属活动','',$sort_array],
                    ],
                    //$this->getEasyFormItems()
                    $this->form_items
                    );
        }
        
        //联动字段
        $this->tab_ext['trigger'] = $this->getEasyFieldTrigger();
        
        $this->tab_ext['group'] = $this->get_group_form($this->form_items);
        if( $this->tab_ext['group'] ){
            unset($this->form_items);
        }
        
        $this->tab_ext['page_title'] = $this->m_model->getNameById($this->mid);
        
//      $this->tab_ext['area'] = config('use_area'); //是否启用地区        
        
        //修改内容后，最好返回到模型列表页，因为有可能修改了栏目
        return $this->editContent($info);
    }
    /**
     * 获取机构列表
     */
    public function getHyList(){
    	$rs=query('select id,title from qb_hy_content1');
//  	return $rs;
		foreach($rs AS $key=>$rss){
                    $array[$rss['id']] = $rss['title'];
                }
                return $array;
    }
    /*
     * 根据id获取机构信息
     */
    public function get_hy($id=0){
    	$rs=query("select title from qb_hy_content1 where id='$id'");
    	return $rs[0]['title'];
    }
    
    
}
