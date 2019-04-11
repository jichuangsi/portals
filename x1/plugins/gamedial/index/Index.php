<?php
namespace plugins\gamedial\index;

use app\common\controller\IndexBase;
use plugins\gamedial\model\Member as Model;

class Index extends IndexBase
{
    public function index(){
        return $this->fetch();
    }
    
    protected function getRand2($proArr){
        $randNum = substr(microtime(),2,2);
        foreach ($proArr as $key => $proCur) {
            if ($randNum <= $proCur) {
                $result = $key;
                break;
            }
        }
        $result || $result=4;
        return $result;
    }
    
    
    public function get(){
        
        if(empty($this->user)){
            return $this->err_js('你还没登录',[],2);
        }elseif($this->user['money'] < $this->webdb['paymoney']){
            return $this->err_js('你的积分不足 ' . $this->webdb['paymoney'] . ' 个!');
        }elseif( $this->webdb['each_day_play_num']>0 && Model::whereTime('create_time','today')->count('id') >= $this->webdb['each_day_play_num'] ){
            return $this->err_js('每天最多只能玩 ' . $this->webdb['each_day_play_num'] . ' 局,请明天再来!');
        }
        
        $prize_arr = array(
                '0' => array('id'=>1,'min'=>3,'max'=>27,'prize'=>'一等奖','v'=>5),
                '1' => array('id'=>2,'min'=>array(243,123),'max'=>array(267,147),'prize'=>'二等奖','v'=>20),
                '2' => array('id'=>3,'min'=>array(303,183,63),'max'=>array(327,207,87),'prize'=>'三等奖','v'=>60),
                '3' => array('id'=>4,'min'=>array(33,93,153,213,273,333),'max'=>array(57,117,177,237,297,357),'prize'=>'鼓励奖','v'=>100)
        );
        
        foreach ($prize_arr as $key => $val) {
            $arr[$val['id']] = $val['v'];
        }
        
        $rid = $this->getRand2($arr);       //根据概率获取奖项id
        $result = [];        
        $res = $prize_arr[$rid-1];      //中奖项
        $min = $res['min'];
        $max = $res['max'];
        if($res['id']==1){
            $result['angle'] = mt_rand($min,$max);          //随机生成一个角度
        }else{
            if($rid==4){
                $i = mt_rand(0,5);
            }elseif($rid==3){
                $i = mt_rand(0,2);
            }else{
                $i = mt_rand(0,1);
            }
            $result['angle'] = mt_rand($min[$i],$max[$i]);
        }
        $result['prize'] = $res['prize'];
        $money = $this->webdb['dialmoney'.$rid];
        $result['jf'] = $money;
        
        $data = [
                'uid'=>$this->user['uid'],
                'create_time'=>time(),
                'money'=>$money,
                'typesize'=>$rid,
        ];
        if(Model::create($data)){
            if($this->webdb['paymoney']>0){
                add_jifen($this->user['uid'], -$this->webdb['paymoney'],'大转盘下注');
            }
            if($money>0){
                add_jifen($this->user['uid'], $money,'大转盘中奖');
            }
            return $this->ok_js($result);
        }else{
            return $this->err_js('数据库插入失败!');
        }        
    }
}
