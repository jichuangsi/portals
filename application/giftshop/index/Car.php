<?php
namespace app\giftshop\index;

use app\common\controller\index\Car AS _Car;
use app\giftshop\model\Content AS ContentMode;

//购物车
class Car extends _Car
{
    public function index(){
        return parent::index();
    }
    
    public function act($shopid=0,$type=''){
        return parent::act($shopid,$type);
    }
    
    protected function check_status($shopid=0,$num=1,$type1='',$type2='',$type3=''){
        $info = ContentMode::getInfoByid($shopid);
        if ($info['num']<1) {
            return '很抱歉,库存为0,不能购买!';
        }elseif ($num>$info['num']) {
            return '购买数量,不能超过库存量!';
        }
        return parent::check_status($shopid,$num,$type1,$type2,$type3);
    }
}

