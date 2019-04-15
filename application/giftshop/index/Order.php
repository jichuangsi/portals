<?php
namespace app\giftshop\index;

use app\common\controller\index\Order AS _Order;
use app\giftshop\model\Content AS ContentMode;
//use app\common\util\Shop AS ShopFun;

//下单
class Order extends _Order
{
    /**
     * 提交订单
     * {@inheritDoc}
     * @see \app\common\controller\index\Order::add()
     */
    public function add(){
        $result = $this->check_buy();
        if (!is_numeric($result)) { //检查用户是否有足够的积分
            $this->error($result);
        }
        
        if ($this->request->isPost()==false) {
            $this->assign('money',$this->check_rmb());
            $this->assign('jifen',$result);
        }
        
        return parent::add();
    }
    
    
    /**
     * 付款完毕
     * {@inheritDoc}
     * @see \app\common\controller\index\Order::endpay()
     */
    public function endpay($order_id = ''){
        return parent::endpay($order_id);
    }
    
    /**
     * ajax可用积分判断
     * @return unknown
     */
    public function check(){
        $result = $this->check_buy();
        if (!is_numeric($result)) {
            return $this->err_js($result);
        }else{
            return $this->ok_js($result);
        }
    }
    
    /**
     * 订单提交成功后执行的操作
     * @param array $order_ids 订单id数组
     * @param array $car_ids 购物车id数组
     */
    protected function end_add($order_ids=[],$car_ids=[]){
        if (empty($order_ids)) {
            return ;
        }
        //购物车实际只有一个商品 ,并且只有一个商家,如果多个商家的话,下面会出问题,会错乱
        $listdb = $this->car_model->getList($this->user['uid'],1);        
        foreach ($listdb AS $uid=>$shop_array){
            $jifen = 0;
            foreach ($shop_array AS $rs){   //这里实际只有一个商品
                $jifen +=  $rs['jifen'] * $rs['_car_']['num'];
                ContentMode::addField($rs['id'],'num',false);   //库存量减少一个
            }
            
            if ($jifen>0) {
                add_jifen($uid, abs($jifen),'销售商品:'.$rs['title']);
                add_jifen($this->user['uid'], -abs($jifen),'兑换商城商品:'.$rs['title']);
                send_msg($uid,'有人兑换商品了',$this->user['username']." 在商城兑换了商品:".$rs['title']);
            }
        }
        
        $money = $this->check_rmb();        
        if ($money===0||$money===0.00) {    //0元商品,设置为已支付
            $data = [
                    'id'=>$order_ids[0],    //只针对只有一个商家的情况.
                    'pay_status'=>1,
                    'user_jf'=>$jifen,
                    'pay_time'=>time(),
            ];            
        }else{
            $data = [
                    'id'=>$order_ids[0],    //只针对只有一个商家的情况.
                    'user_jf'=>$jifen,
            ]; 
        }
        $this->order_model->update($data);
        
        $this->car_model->destroy($car_ids);    //清空购物车
    }
    
    /**
     * 检查需要多少积分才能兑换 同时检查是否有存库
     * @return string|number
     */
    protected function check_buy(){
        $listdb = $this->car_model->getList($this->user['uid'],1);
        $jifen = 0;
        foreach ($listdb AS $uid=>$shop_array){
            foreach ($shop_array AS $rs){   //实际只有一个商品
                $jifen +=  abs($rs['jifen']) * $rs['_car_']['num'];
                if ($rs['num']<1) {
                    return $rs['title'] . ' 该商品库存为0,无法购买';
                }elseif ($rs['_car_']['num']>$rs['num']){
                    return $rs['title'] . ' 该商品库存为'.$rs['num'].',你选购的数量不能超过它';
                }
            }
        }
        if ($this->user['money']<$jifen) {
            return '本次需要消费霸币 ' . $jifen . ' 个,你仅有 ' . $this->user['money'] . '个,无法提交订单';
        }
        return $jifen;
    }
    
    /**
     * 检查是否需要支付人民币
     * @return string|number
     */
    protected function check_rmb(){
//         $listdb = $this->car_model->getList($this->user['uid'],1);
//         $money = 0;
//         foreach ($listdb AS $uid=>$shop_array){
//             foreach ($shop_array AS $rs){   //某个商家的多个商品
//                 $_shop[] = $rs['_car_']['shopid'] . '-' . $rs['_car_']['num']  . '-' . $rs['_car_']['type1'] . '-' .$rs['_car_']['type2'] . '-' .$rs['_car_']['type3'];
//                 $money += ShopFun::get_price($rs,$rs['_car_']['type1']-1);
//             }
//         }
        $money = fun('shop@car_money');
        return $money;
    }
}

