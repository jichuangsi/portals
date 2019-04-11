<?php 
namespace plugins\propagandize\install;

use app\common\controller\AdminBase;


class Install extends AdminBase{
    public function run($id=0){
        $res = query('hook',[
                'where'=>['name'=>'index_begin'],
                'count'=>'id'
        ]);
        if(empty($res)){
            query("INSERT INTO `qb_hook` (`id`, `name`, `about`, `ifopen`, `list`) VALUES(0, 'index_begin', '前台程序入口', 1, 0);");
        }
    }
}