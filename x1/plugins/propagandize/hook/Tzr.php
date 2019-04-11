<?php
namespace plugins\propagandize\hook;

class Tzr{
    
    public function IndexBegin($array=[]){
        $p_uid = input('p_uid');
        if($p_uid){
            set_cookie('p_uid',$p_uid);
            $money = config('webdb.P__propagandize')['propagandize_money_visit'];   //不注册也有奖励
            if ( $money>0 && !cache('propagandize_'.$p_uid) && empty($array['user']) ) {
                cache('propagandize_'.$p_uid,$p_uid);
                add_jifen($p_uid, $money,'推荐IP来自 '.get_ip().' 的访客访问');
                send_msg($p_uid,'恭喜你,推荐他人访问,获得 '.$money.' 个霸币奖励','推荐IP来自 '.get_ip().' 的访客访问,获得 '.$money.' 个霸币奖励');
            }            
        }
    }
    
    public function UserAddEnd($userdb=[]){
        $p_uid = get_cookie('p_uid');
        if($p_uid){
            $uid = $userdb['uid'];      //新注册用户的uid
            $tzr = get_user($p_uid);    //获取推荐人的用户信息
            $array = [
                    'uid'=>$uid,
                    'introducer_1'=>$tzr['uid'],
                    'introducer_2'=>$tzr['introducer_1'],
                    'introducer_3'=>$tzr['introducer_2'],
            ];
            edit_user($array);
            $this->give_money($tzr['uid'],$userdb,1);
            $this->give_money($tzr['introducer_1'],$userdb,2);
            $this->give_money($tzr['introducer_2'],$userdb,3);
            //set_cookie('p_uid',null);
        }
    }
    
    public function LayoutBodyFoot($userdb=[]){
        if (IN_WAP===true) {
            $area = "['95%','80%']";
        }else{
            $area = "['500px','430px']";
        }
//      $share_url = get_url('location');
         $share_url ='http://192.168.31.122';
        if (!strstr($share_url,'p_uid=')) {
            if(strstr($share_url,'?')){
                $share_url .= '&';
            }else{
                $share_url .= '?';
            }
            $share_url .= 'p_uid='.$userdb['uid'];
        }
//      $share_url ='http://192.168.31.122';
        $codeimg = get_qrcode($share_url);
        $webdb = config('webdb.P__propagandize');
print<<<EOT
<div id="div_propagandize" style="display:none;">
<div style="padding:20px;line-height:150%;">
<div style="border-bottom:1px solid #ddd;margin-bottom:10px;padding:10px;">
欢迎分享,分享有收益。<br>
1、直接推荐他人注册可获得 {$webdb['propagandize_money_1']} 个积分的奖励<br>
2、间接推荐他人注册可获得 {$webdb['propagandize_money_2']} 个积分的奖励<br>
3、上上级推荐还可获得 {$webdb['propagandize_money_3']} 个积分的奖励<br>
</div>
分享网址：<a href="{$share_url}">{$share_url}</a>
<br>
分享二维码如下：
<br><center><img width="200" src="{$codeimg}"></center>
</div>
</div>
<script type="text/javascript">
function show_propagandize(){
	layer.open({
		type:1,
		title:false,
		content:$('#div_propagandize'),
		area:{$area},
	});
}
</script>
<i class="fa fa-share-square-o shares" onclick="show_propagandize()" style="position:fixed;right:10px;bottom:60px;font-size:20px;color:#666;">分享</i>
EOT;
    }
    
    protected function give_money($tzr_uid=0,$userdb=[],$step=1){
        if (empty($tzr_uid)) {
            return ;
        }
        $money = config('webdb.P__propagandize')['propagandize_money_'.$step];
        if ($money<1) {
            return ;
        }
        
        $msg = ($step==1?'直接':'间接') . '推荐 '.$userdb['username'].' 注册';
        add_jifen($tzr_uid, $money,$msg);
        
        $msg = '恭喜你,获得 '.$money.' 积分的奖励,因为你'.$msg;
        $conetnt = "点击看看 <a href='".get_url('user',$userdb['uid'])."' target='_blank'>{$userdb['username']}</a> 的个人信息";
        send_msg($tzr_uid,$msg,$conetnt);
    }
    
}