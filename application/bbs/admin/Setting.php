<?php
namespace app\bbs\admin;

use app\common\controller\admin\Setting AS _Setting;


class Setting extends _Setting
{    
//     protected $config = [
//             [
//                     'c_key'=>'reward_gave_wx',
//                     'title'=>'打赏金额是否直接转到微信钱包',
//                     'c_value'=>'0',
//                     'options'=>"0|存入到帐户余额\r\n1|直接转到微信钱包(必须开通微信支付才行)",
//                     'c_descrip'=>'',
//                     'form_type'=>'radio',
//                     'ifsys'=>0,
//                     'list'=>0,
//             ],
//             [
//                     'c_key'=>'show_pay_money',
//                     'title'=>'内容页是否显示用户的消费金额',
//                     'c_value'=>'0',
//                     'options'=>"0|不显示\r\n1|显示",
//                     'c_descrip'=>'',
//                     'form_type'=>'radio',
//                     'ifsys'=>0,
//                     'list'=>0,
//             ],
//     ];
    
    /**
     * 参数设置
     * {@inheritDoc}
     * @see \app\common\controller\admin\Setting::index()
     */
    public function index($group=null){
        
        $array = [
                [
                        'c_key'=>'reward_gave_wx',
                        'title'=>'打赏金额是否直接转到微信钱包',
                        'c_value'=>'0',
                        'options'=>"0|存入到帐户余额\r\n1|直接转到微信钱包(必须开通微信支付才行)",
                        'c_descrip'=>'',
                        'form_type'=>'radio',
                        'ifsys'=>0,
                        'list'=>0,
                ],
                [
                        'c_key'=>'show_pay_money',
                        'title'=>'内容页是否显示用户的消费金额',
                        'c_value'=>'0',
                        'options'=>"0|不显示\r\n1|显示",
                        'c_descrip'=>'',
                        'form_type'=>'radio',
                        'ifsys'=>0,
                        'list'=>0,
                ],
                [
                        'c_key'=>'group_reply_money',
                        'title'=>'发表评论回复对应用户组奖励积分',
                        'c_descrip'=>'0或留空则不做处理',
                        'form_type'=>'usergroup',
                        'ifsys'=>0,
                        'list'=>-1,
                ],
        ];
        
        if (is_array($this->config)) {
            $this->config = array_merge($this->config,$array);
        }else{
            $this->config = $array;
        }
        
        return parent::index($group);
    }
}

