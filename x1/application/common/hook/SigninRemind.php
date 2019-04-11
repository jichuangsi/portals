<?php
namespace app\common\hook;

class SigninRemind{
    

    public $info = [
            //归属接口,必填
            'hook_key'=>'layout_body_foot',
            //归属插件,可为空
            'plugin_key'=>'',
            //开发者
            'author'=>'齐博',
            //开发者网站
            'author_url'=>'http://www.php168.com',
            //功能描述
            'about'=>'每天签到提醒',
    ];
	
	//钩子行为
    public function run(&$user){
		$forbig_pop = 0;
		if(empty($user)){	//游客
			return ;
		}elseif(isset($user['sendmsg']['signin_pop']) && empty($user['sendmsg']['signin_pop'])){ //设置过,并且禁止显示.
			return ;
		}
        $msgurl = purl('signin/api/check',[],'index');
		$url = config('webdb.P__signin')['sign_url']?:purl('signin/log/index',[],'member');
        $openurl = murl('member/remind/api');
    print<<<EOT

<script type="text/javascript">
if($.cookie('signin_remind')!='no'&&"{$user['uid']}"!=''){
	$.cookie('signin_remind', 'no', { expires: 1, path: '/' });   //60分钟提醒一次
	$.get("{$msgurl}",function(res){
		if(res.code==1){
			layer.confirm('每天签到有积分奖赏,你是否立即去签到?', {
				//btn : [ '签到', '稍会' , '别提醒' ],
				btn : [ '签到', '稍会' ],
				btn3:function(index) {set_remind_msg('signin_pop',0);},
			},function(index) {
				location.href="/index.php/p/signin-index-index.html";
			},function(index) {
				$.cookie('signin_remind', 'no', { expires: 1, path: '/' });   //600分钟提醒一次
			});
		}
	})	
}

function set_remind_msg(name,value) {
	layer.confirm('你确认要关闭签到提醒功能吗?以后也可以在会员中心左上角重新开启',{btn:['确定','取消']},function(){
		$.get("{$openurl}?name="+name+"&value="+value,function(res){
			layer.closeAll();
			if(res.code==0){				
				layer.msg('成功关闭提醒');
			}else{
				layer.alert('关闭失败');
			}
		});
	});
}
</script>

EOT;
       
    }
	
	
	//卸载时运行 
	public function uninstall($id=0){		
	}
	
	//安装时运行
	public function install($id=0){		
	}
    
}