<?php
namespace plugins\propagandize\member;

use app\common\controller\MemberBase;
use app\common\model\User as Model;
use app\common\traits\AddEditList;

class Log extends MemberBase
{
    use AddEditList;
    
    public function index(){
        $data_list = Model::where('introducer_1',$this->user['uid'])->whereOr('introducer_2',$this->user['uid'])->whereOr('introducer_3',$this->user['uid'])->order("uid desc")->paginate(15);
//         $data_list->each(function(&$rs,$key){
//             return $rs;
//         });
        $this->list_items = [
                ['uid','新用户','username'],
                ['regdate','注册时间','datetime'],
                ['introducer_1','直接推荐人','username'],
                ['introducer_2','上级推荐人','username'],
                ['introducer_3','上上级推荐人','username'],
                ['uid','uid','uid'],
        ];
        
        $this->tab_ext['id'] = 'uid';
        $this->tab_ext['page_title'] = '我推荐的用户';
        $this->tab_ext['right_button'] = [];
        $this->tab_ext['top_button'] = [];
        
        return $this->getMemberTable($data_list);
    }
    
    //避免有人恶意执行 AddEditList 里边的三个方法 , 所以下面置空处理
    public function add(){        
    }    
    public function edit(){        
    }    
    public function delete(){        
    }

}
