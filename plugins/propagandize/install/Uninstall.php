<?php
namespace plugins\propagandize\install;

use app\common\controller\AdminBase;


class Uninstall extends AdminBase{
    public function run($id=0){
        query("DELETE FROM `qb_hook_plugin` WHERE `hook_class` = 'plugins\\propagandize\\hook\\Tzr'");
    }
}