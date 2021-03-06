<?php
namespace app\index\controller;

use app\common\model\User AS UserModel;
use app\common\controller\IndexBase;
use think\Controller;
include  './config.inc.php';
include  './uc_client/client.php';

class Reg extends IndexBase
{
    /**
     * 获取邮箱或手机注册码
     * @param string $type
     */
    public function getnum($type='',$to=''){
        //邮箱注册码与手机注册码,不建议同时启用,所以这里没分开处理
        if( time()-get_cookie('send_num') <60 ){
            return $this->err_js('1分钟后,才能再次获取验证码!');
        }
        $num = cache(get_cookie('user_sid').'_reg') ?: rand(1000,9999);
        $send_num = get_md5_num($to.$num,6);
        $title = '来自《'.config('webdb.webname').'》的注册验证码,请注册查收';
        $content = '你的注册验证码是:'.$send_num;
        cache(get_cookie('user_sid').'_reg',$num,600);
        if($type=='mobphone'){
        	if( UserModel::get_info($to,'mobphone') ){
        		$result = '当前手机已经被注册了,请更换一个号码';
        	}else{
        		$result = send_sms($to,$send_num);
        	}
        }elseif($type=='email'){
            if( UserModel::get_info($to,'email') ){
                $result = '当前邮箱已经被注册了,请更换一个邮箱';
            }else{
                $result = send_mail($to,$title,$content);
            }
        }else{
            $result = '请选择类型!';
        }        
        if($result===true){
            set_cookie('send_num', time());
            return $this->ok_js();
        }else{
            return $this->err_js($result);
        }
    }
    
    /**
     * 核对手机或邮箱注册码
     * @param string $type
     * @param string $num
     * @return void|\think\response\Json
     */
    public function check_num($type='',$num='',$field=''){
        //邮箱注册码与手机注册码,不建议同时启用,所以这里没分开处理
        if($type=='weixin'){
            //验证码从这里生成 plugins\weixin\libs\keyword\Reg_yz
            if( cache('weixin_yznum_'.$num) ){
                return $this->ok_js();
            }
        }else{
            $_num = cache(get_cookie('user_sid').'_reg');
            $send_num = get_md5_num($field.$_num,6);
            if( $num ==  $send_num){
                return $this->ok_js();
            }
        }
        return $this->err_js('验证码不正确');
    }
    
    /**
     * 注册字段验证
     */
    public function check(){
        $data = get_post('get');
		foreach($data AS $key=>$value){
			$name = $key;
			break;
		}
        $result = $this->validate($data, 'Reg.'.$name);
        if( $result!==true ){ 
			die($result);
		}else{
		    die('ok');
		}
    }
    
    /**
     * 注册
     * @return mixed|string
     */
    public function index()
    {
        if ($this->webdb['forbid_normal_reg']) {
            $this->error('系统关闭了手工注册功能,你可以选择QQ登录或微信登录!!');
        }
        if ($this->user) {
            $this->error('你已经注册过了!');
        }
        
        $data = get_post('post');
         $isModular=$data['isModular'];
        if(!empty($data)){
            $array = explode(',','uid,username,password,password2,email,mobphone,captcha,email_code,phone_code,weixin_code');  //允许注册的字段
            foreach($data AS $key=>$value){
                if(!in_array($key, $array)){
                    unset($data[$key]);
                }
            }
            if(isset($this->webdb['RegYz'])){
                $data['yz'] = $this->webdb['RegYz'];
            }
            $data['money'] = $this->webdb['regmoney'];
        }
        hook_listen('reg_by_hand_begin',$data);
        	
        if(IS_POST){
            
            //邮箱注册码与手机注册码,不建议同时启用,所以这里只判断只中一种
            if(config('webdb.reg_email_num') || config('webdb.reg_phone_num')){
                $num = cache(get_cookie('user_sid').'_reg');
                $send_num = get_md5_num(($data['mobphone']?:$data['email']).$num,6);
                if( ($data['email_code']!=$send_num&&$data['phone_code']!=$send_num) || empty($num)) {
                    $this->error('验证码不对');
                }
                cache(get_cookie('user_sid').'_reg',null);
            }
            
            //关注公众号获取注册码,验证码从这里生成 plugins\weixin\libs\keyword\Reg_yz
            if( config('webdb.reg_weixin_num')){
                if( !cache('weixin_yznum_'.$data['weixin_code']) ){
                    $this->error('注册码不对');  
                }
                cache('weixin_yznum_'.$data['weixin_code'],null);
            }
            
            // 验证
            $result = $this->validate($data, 'Reg');
            if(true !== $result) $this->error($result);
            
            
            $uids=uc_user_register($data['username'],$data['password'],$data['email']);
		        if($uids <= 0) {
					if($uids == -1) {
						$this->error('用户名不合法！');
					} elseif($uids == -2) {
						$this->error('包含要允许注册的词语！');
					} elseif($uids == -3) {
						$this->error('用户名已经存在！');
					} elseif($uids == -4) {
						$this->error('Email 格式有误！');
					} elseif($uids == -5) {
						$this->error('Email 不允许注册！');
					} elseif($uids == -6) {
						$this->error('该 Email 已经被注册！');
					} else {
						$this->error('未定义！');
					} 
				} else {
					$data['uid']=$uids;
					$ucsynlogin = uc_user_synlogin($uids);
					$res=urlencode($ucsynlogin);
					$ress=urldecode($res);
					echo $ress;
				}
				
            $uid = UserModel::register_user($data); //注册帐号
            if ($uid<2) {
                $this->error($uid);
            } 
            
            hook_listen('reg_by_hand_end',$uid,$data);
           
            $result = UserModel::login($data['username'],$data['password'],$data['cookietime']);   //帐号同时实现登录
            if(is_array($result)){
            	if($isModular==1){
            		$this->success('注册成功',iurl('/hy/index/index'));
            	}else{
            		 $this->success('注册成功','index/index');
            	}
            }else{
                $this->error('注册失败！');
            }
        }
		return $this->fetch();
    }
}
