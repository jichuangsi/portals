<?php
namespace app\fenlei\admin;

use app\common\controller\admin\S;


class Sort extends S
{
//     protected function set_field_form($id=0){
//         $array = parent::set_field_form($id);
//         $array['基础设置'][] = ['text', 'haibao', '海报模板路径',fun('haibao@get_haibao_list').'可留空,多个用逗号隔开,需要补全路径(其中haibao_style不用填):比如:“xxx/show.htm”'];
//         return $array;
//     }
    
//     public function edit($id=0){
//         if ($this->request->isPost()) {
//             $data = $this->request->post();
//             if ($data['haibao']) {
//                 $detail = explode(',',$data['haibao']);
//                 foreach($detail AS $value){
//                     if($value!='' && !is_file(TEMPLATE_PATH.'haibao_style/'.$value)){
//                         $this->error('当前文件不存在:'.TEMPLATE_PATH.'haibao_style/'.$value);
//                     }
//                 }
//             }
//         }
//         return parent::edit($id);
//     }
		protected function set_config(){
        $this->list_items = [
                ['name', '项目名称', 'link',iurl('content/index',['fid'=>'__id__']),'_blank'],
                ['mid', '所属模型', 'select2',$this->m_model->getTitleList()],
                ['list', '排序值', 'text.edit'],
                ['isenable', '是否启用', 'select',['是','否']],
        ];
        
        $this->form_items = [                
                ['text', 'name', '活动名称'],
                ['image', 'logo', '图片'],
                ['select', 'pid', '归属上级分类','不选择，则为顶级分类',$this->model->getTreeTitle()],
                ['select', 'isenable', '是否启用','',['是','否']],
                ['textarea', 'description', '活动内容描述'],
                ['textarea', 'activityrule', '活动规则'],
                ['select', 'mid', '所属模型','创建后不能随意修改',$this->m_model->getTitleList(),1],
        ];
        
        $this->tab_ext = [
                'page_title'=>'项目管理',
                'top_button'=>[
                        [
                                'title' => '创建项目',
                                'icon'  => 'fa fa-fw fa-th-list',
                                'class' => 'btn btn-primary',
                                'href'  => auto_url('add')
                        ],
                ],
                'right_button'=>[
                        [
                                'title' => '管理选项',
                                'icon'  => 'fa fa-fw fa-file-text-o',
                                'href'  => auto_url('content/index', ['fid' => '__id__'])
                        ],
                        [
                                'title' => '增加选项',
                                'icon'  => 'glyphicon glyphicon-plus',
                                'href'  => auto_url('content/add', ['fid' => '__id__'])
                        ],                        
                        ['type'=>'delete'],
                        ['type'=>'edit'],
                ],
        ];
    }



    public function edit($id = null)
        {
            if($this->request->isPost()){
                $data = $this -> request -> post();            
                if (!empty($this -> validate)) {    // 验证
                    //$result = $this -> validate($data, $this -> validate);
                    //if (true !== $result) $this -> error($result);
                } 
                 $data['allowpostyz'] = implode(',', $data['allowpostyz']);  //允许报名自动通过审核的用户组
                $data['allowview'] = implode(',', $data['allowview']);  //允许查看内容的用户组
                $data['template'] = $this->get_tpl($data);                  //项目自定义模板
                
                
                if ($this -> model -> update($data)) {
                    $this -> success('修改成功', 'index');
                } else {
                    $this -> error('修改失败');
                }
            }
            $this->form_items = [];
            
            $msg = '请把模板放在此目录下: '.TEMPLATE_PATH.'index_style/ 然后输入相对路径,比如 default/abc.htm';
            
            $this -> tab_ext['group'] = [
                    '基础设置'=>[
    		['text', 'name', '活动名称'],
    		['image', 'logo', '图片'],
            ['select', 'pid', '归属上级分类','不选择，则为顶级分类',$this->model->getTitleList()],
            ['select', 'isenable', '是否启用','',['是','否']],
            ['textarea', 'description', '活动内容描述'],
            ['textarea', 'activityrule', '活动规则'],
                    ],
                    'SEO优化设置'=>[
                            ['text', 'seo_title', 'SEO标题'],
                            ['text', 'seo_keywords', 'SEO关键字'],
                            ['text', 'seo_description', 'SEO描述'],
                    ],
            ];
            
            if(empty($id)) $this->error('缺少参数');
            
            $info = $this->getInfoData($id);
            
            if($info['template']){
                $array = unserialize($info['template']);
                
                if (is_array($array)){
                    $info = array_merge($info,['templates'=>$array]);
                }
            }
            
            return $this->editContent($info);
    }

}













