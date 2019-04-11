<?php
namespace plugins\gamedial\member;

use app\common\controller\MemberBase;
use plugins\gamedial\model\Member as Model;

class Log extends MemberBase
{
    
    public function delete($id=0){
        //$this->error('为防止作弊,系统关闭了删除功能');
        $info = Model::get($id);
        if ($info['uid']!=$this->user['uid']) {
            $this->error('你无权删除他人的内容');
        }
        Model::destroy($id);
        $this->success('删除成功');
    }
    
    
    public function index(){
        $map = [
                'uid'=>$this->user['uid']
        ];
        $data_list = Model::where($map)->order("id desc")->paginate(15);
        $data_list->each(function(&$rs,$key){
            $rs['create_time'] = format_time($rs['create_time'],"Y-m-d H:i:s");
            //$rs['username'] = get_user_name($rs['uid']);
            return $rs;
        });
        
        $pages = $data_list->render();
        $listdb = getArray($data_list)['data'];
            
        //给模板赋值变量
        $this->assign('pages',$pages);
        $this->assign('listdb',$listdb);
        return $this->fetch();
    }
    

}
