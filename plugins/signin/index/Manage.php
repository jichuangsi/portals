<?php
namespace plugins\signin\index;

use app\common\controller\IndexBase;

class Manage extends IndexBase
{
    public function show($id=0){
        $url = iurl('qun/content/show',['id'=>$id],true,false,'module');
        header("location:$url");exit;
    }
}
