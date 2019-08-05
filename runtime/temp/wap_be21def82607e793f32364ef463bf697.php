<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:73:"D:\web\Education\portals\template/index_style/default/index\reg\index.htm";i:1553597762;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>注册帐户</title>
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="stylesheet" href="/public/static/css/base.css">
	<link rel="stylesheet" href="/public/static/icon/icon.css">
	<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
	<script type="text/javascript" src="/public/static/layer/layer.js"></script>
</head>
<body>
<style>
header{
	background:#ffdd33;
	color:#000000;
	margin-bottom:8px;
	font-weight: bold;
}
header ul{
	display:table;
	width:100%;
	height:50px;	
}
header ul ol,header ul li{
	display:table-cell;
	vertical-align:middle;
	text-align:center;
}
header ul ol{
	width:40px;
	font-size: 32px;
	color: #fff;
}
.LogoContainer{
	max-width:640px;
	margin:auto;
	position:relative;
}
.LogoContainer:before{
	content:'';
	display:block;
	padding-top:60%;
}
.LogoContainer ul{
	width:30%;
	position:absolute;
	left:50%;
	top: 50%;
  -webkit-transform: translate3D(-50%, -50%, 0);
      -ms-transform: translate3D(-50%, -50%, 0);
          transform: translate3D(-50%, -50%, 0);
}
.LogoContainer ul ol img{
	width:100%;
}
.LogoContainer ul li{
	text-align:center;
	padding-top:5%;
	color:#D43B1B;
}
.FormContainer{
	padding:0 20px;
}
.FormContainer ul{
	display:table;
	width:100%;
	border-bottom:#DDD solid 1px;
}
.FormContainer ul ol,.FormContainer ul li{
	display:table-cell;
	vertical-align:middle;
	height:40px;	
}
.FormContainer ul ol{
	width:30px;
	font-size:20px;
}
.FormContainer ul li input{
	width:99%;
	border:0;
	text-indent:5px;
	outline:none;
	background:none;
}
.FormContainer ul li input.error{
	border:#F30 solid 1px;
	border-radius:5px;
}
.FormContainer dl{
	display:table;
	width:100%;
	margin-top:20px;
}
.FormContainer dl dt,.FormContainer dl dd{
	display:table-cell;
	vertical-align:middle;
	height:30px;
	width:50%;
}
.FormContainer dl dd{
	text-align:right;
}
.OtherLogin .h{
	line-height:30px;
	margin-top:30px;
	position:relative;
	color:#888;
	text-align:center;
}
.OtherLogin .h:before{
	content:'';
	display:block;
	position:absolute;
	width:100%;
	height:1px;
	background:#DDD;
	left:0;
	top:14px;
}
.OtherLogin .h span{
	display:inline-block;
	position:relative;
	/*background:#FFF;*/
	padding:0 20px;
}
.OtherLogin .c{
	text-align:center;
	padding:15px 0;
}
.OtherLogin .c a{
	display:inline-block;
	background:#333BDD;
	padding:8px;
	margin:0 20px;
	color:#FFF;
	font-size:20px;
	border-radius:5px;
}
.OtherLogin .c a.wx{
	background:#41BD16;
}	
@media (max-width: 2000px) and (min-width:601px) {
	header ul{
		height:70px;
		font-size:24px;	
	}	
}
@media (max-width: 600px) and (min-width:501px) { 
	header ul{
		height:60px;
		font-size:20px;	
	}	
}
@media (max-width: 500px) and (min-width:401px) { 
	header ul{
		height:55px;
		font-size:18px;	
	}
}
@media (max-width: 400px) {
	header ul{
		height:50px;
		font-size:21px;	
	}
}
.butterBox{
	text-align:center;
	padding:20px 0;
	word-spacing:20px;
}
.mui-btn{
	font-size: 14px;
	font-weight: 400;
	line-height: 1.42;
	position: relative;
	display: inline-block;
	margin-bottom: 0;
	padding: 6px 12px;
	cursor: pointer;
	-webkit-transition: all;
	transition: all;
	-webkit-transition-timing-function: linear;
	transition-timing-function: linear;
	-webkit-transition-duration: .2s;
	transition-duration: .2s;
	text-align: center;
	vertical-align: top;
	white-space: nowrap;
	color: #333;
	border: 1px solid #ccc;
	border-radius: 3px;
	border-top-left-radius: 3px;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
	border-bottom-left-radius: 3px;
	background-color: #fff;
	background-clip: padding-box
}
.mui-btn-danger{
	color: #fff;
	border: 1px solid #FFDD33;
	background-color: #FFDD33
}
.mui-btn-back{
	color: #fff;
	border: 1px solid #999;
	background-color: #AAA
}
</style>
<header>
	<ul>
		<ol><i class="fa fa-angle-left" onclick="window.history.back()"></i></ol>
		<li>注册帐户</li>
		<ol><br/></ol>
	</ul>
</header>
<div class="FormContainer">
<form class="mui-input-group" action="<?php echo urls('reg/index'); ?>" method="post">
	<ul><ol><i class="fa fa-fw fa-user-o"></i></ol><li><input type="text" name="username" minlength="3" maxlength="20" placeholder="请输入帐号" onBlur="checkinput($(this),'username')" required/></li></ul>
	<ul><ol><i class="si si-lock"></i></ol><li><input type="password" name="password" minlength="5" maxlength="30" placeholder="请输入密码" onBlur="checkinput($(this),'password')" required/></li></ul>
	<ul><ol><i class="si si-lock"></i></ol><li><input type="password" name="password2" minlength="5" maxlength="30" placeholder="请重复输入密码" onBlur="checkpassword($(this))" required/></li></ul>
	<ul><ol><i class="fa fa-envelope"></i></ol><li><input type="text" name="email" placeholder="必填" onBlur="checkinput($(this),'email')" required/></li></ul>
	<!--
	<ul><ol><i class="fa fa-weixin"></i></ol><li><input type="text" name="weixin_id" placeholder="必填"/></li></ul>
	-->

					<?php if($webdb['reg_email_num'] == '1'): ?>
					<ul>
						<ol><i class="glyphicon glyphicon-question-sign"></i></ol>
						<li><input type="text" name="email_code" placeholder="请点击右边文字获取验证码" onBlur="check_num($(this),'email')" required/></li>
						<li><a href="#" onclick="get_code_num('email')">获取验证码</a></li>
					</ul>
					<?php endif; if($webdb['reg_phone_num'] == '1'): ?>
					<ul>
						<ol><i class="fa fa-fw fa-mobile-phone"></i></ol>
						<li><input type="text" name="mobphone" placeholder="手机号不能留空" required/></li>
						<li>&nbsp;</li>
					</ul>
					<ul>
						<ol><i class="glyphicon glyphicon-question-sign"></i></ol>
						<li><input type="text" name="phone_code" placeholder="请点击右边文字获取验证码"  required/></li>
						<li><a href="#" onclick="get_code_num('mobphone')">获取验证码</a></li>
					</ul>
					<?php endif; if($webdb['yzImgReg'] == '1'): ?>
	<ul>
		<ol><i class="glyphicon glyphicon-question-sign"></i></ol>
		<li><input type="text" name="captcha" placeholder="请输入右边验证码" onBlur="checkinput($(this),'captcha')" required/></li>
		<li><img src="<?php echo captcha_src(); ?>" style="cursor: pointer;" onclick="this.src='<?php echo captcha_src(); ?>?d='+Math.random();" title="点击刷新"/></li>
	</ul>
	<?php endif; if($webdb['reg_weixin_num'] == '1'): ?>
	<ul>
		<ol><i class="glyphicon glyphicon-question-sign"></i></ol>
		<li><input type="text" name="weixin_code" placeholder="请点击右边文字获取验证码" onBlur="check_num($(this),'weixin')" required/></li>
		<li><a href="#" onclick="weixin_mp()">获取验证码</a></li>
	</ul>
	<?php endif; ?>


	<div class="butterBox">
		<a href="<?php echo urls('login/index'); ?>"><button type="button" class="mui-btn mui-btn-back">返回登录</button></a>
		<button type="submit" class="mui-btn mui-btn-danger">立即注册</button>
	</div>
	<div class="OtherLogin">
		<div class="h"><span>推荐使用第三方一键注册登录</span></div>
		<div class="c">
			<?php if((!in_wxapp())): ?><a href="<?php echo purl('login/qq/index'); ?>"><i class="fa fa-fw fa-qq"></i></a><?php endif; if((in_weixin()||in_wxapp())): ?><a href="<?php echo purl('weixin/login/index'); ?>" class="wx"><i class="fa fa-fw fa-weixin"></i></a><?php endif; ?>
			<a class="phone" style="background: #ffdd33;" href="<?php echo urls('index/login/phone'); ?>?fromurl=<?php echo $fromurl; ?>"><i class="fa fa-fw fa-mobile-phone"></i></a>
		</div>
	</div>
</form>
<script type="text/javascript">

function weixin_mp(){
	layer.open({
	  type: 1,
	  title: '关注公众号',
	  shadeClose: true,
	  shade: false,
	  maxmin: true, //开启最大化最小化按钮
	  area: ['350px', '450px'],
	  content: "<center><img style='width:280px' src='<?php echo tempdir(config('webdb.mp_code_img')?:config('webdb.weixin_code_img')); ?>'><br>请长按识别上方二维码关注公众号<br>然后回复：验证码</center>",
	  end: function(){
		  	//get_code_num('weixin');
		}
	});
}

function get_code_num(type){
	var to='';
	var obj = $(".mui-input-group input[name='"+type+"']");
	if(type=='mobphone'){
		to = obj.val();
		if(to==''){
			obj.focus();
			layer.msg('请先输入手机号码');
			return false;
		}
		if(!(/^1[34578]\d{9}$/.test(to))){
				obj.focus();
				layer.msg('手机号码有误！请重新填写');
				return false;
		}
	}else if(type=='email'){
		to = obj.val();
		if(to==''){
			obj.focus();
			layer.msg('请先输入邮箱');
			return false;
		}
	}
	layer.msg('请稍候,系统正在发送验证码!',{time:3000});
	$.get("<?php echo urls('reg/getnum'); ?>?type="+type+'&to='+ to +'&'+Math.random(),function(res){
		layer.close();
		if(res.code==0){
			layer.alert('验证码已成功发出,请耐心等候,注意查收!');
			objs.removeClass('error');
		}else{
			layer.alert(res.msg);
//			objs.addClass('error');
		}			
	});
}

function check_num(objs,type){
	var vals=objs.val();
	$.get("<?php echo urls('reg/check_num'); ?>?num="+vals+"&type="+type+'&'+Math.random(),function(res){
		if(res.code==0){
			objs.removeClass('error');
		}else{
			layer.msg(res.msg);
			objs.addClass('error');
		}			
	});
}


function checkinput(objs,type){
	var vals=objs.val();
	$.get("<?php echo urls('reg/check'); ?>?"+type+"="+vals+'&'+Math.random(),function(d){
		if(d=='ok'){
			objs.removeClass('error');
		}else{
			layer.msg(d);
			//objs.focus();
			objs.addClass('error');
		}			
	});
}
function checkpassword(objs){
	var repassword=objs.val();
	var password=$('input[name="password"]').val();
	if(repassword!=password){
		layer.alert('重复输入密码不一致！');
		objs.addClass('error');
	}else{
		objs.removeClass('error');
	}
}
</script>
</div>
</body>
</html>