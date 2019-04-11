<?php
namespace plugins\gamedial\admin;

use app\common\controller\admin\Setting AS _Setting;


class Setting extends _Setting
{
    protected $config = [
            [
                    'c_key'=>'each_day_play_num',
                    'title'=>'每天最多可以玩几局',
                    'c_descrip'=>'',
                    'form_type'=>'number',
                    'ifsys'=>0,
                    'list'=>10,
            ],
    ];
    
    /**
     * 参数设置
     * {@inheritDoc}
     * @see \app\common\controller\admin\Setting::index()
     */
    public function index($group=null){
        return parent::index($group);
    }
}

