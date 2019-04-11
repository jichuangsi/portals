<?php
namespace plugins\signin\admin;

use app\common\controller\admin\Setting AS _Setting;


class Setting extends _Setting
{    
    /**
     * 参数设置
     * {@inheritDoc}
     * @see \app\common\controller\admin\Setting::index()
     */
    public function index($group=null){
        $this->config = [
                [
                        'c_key'=>'sign_fx_1',
                        'title'=>'直接推荐人可得积分',
                        'c_descrip'=>'也可以写百分比',
                        'c_value'=>'',
                        'form_type'=>'text',
                        'options'=>"",
                        'ifsys'=>0,
                        'list'=>0,
                ],
                [
                        'c_key'=>'sign_fx_2',
                        'title'=>'2级推荐人可得积分',
                        'c_descrip'=>'也可以写百分比',
                        'c_value'=>'',
                        'form_type'=>'text',
                        'options'=>"",
                        'ifsys'=>0,
                        'list'=>0,
                ],
                [
                        'c_key'=>'sign_fx_3',
                        'title'=>'3级推荐人可得积分',
                        'c_descrip'=>'也可以写百分比',
                        'c_value'=>'',
                        'form_type'=>'text',
                        'options'=>"",
                        'ifsys'=>0,
                        'list'=>0,
                ],
        ];
        return parent::index($group);
    }
}

