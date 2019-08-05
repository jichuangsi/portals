<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:72:"D:\web\Education\portals\template/index_style/default/index/pc_error.htm";i:1555325357;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" type="text/css" href="/public/static/others/showerr.css">
<title>出错提示</title>
<meta http-equiv="X-UA-Compatible" content="IE=8"><!-- 强制ie8,for 360 -->
<meta charset="utf-8">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
</head>
<body>
<div class="TopContainer">
	<div class="TopBox">
		<div class="logo"><a href="/"><img src="<?php echo tempdir(config('webdb.logo')); ?>" onerror="this.src='/public/static/index/default/logo.png'"></a></div>
		<div class="MoreAct">
			<a href="/" class="home">网站首页</a>			
			<?php if(!(empty($userdb['uid']) || (($userdb['uid'] instanceof \think\Collection || $userdb['uid'] instanceof \think\Paginator ) && $userdb['uid']->isEmpty()))): ?>
			<a href="<?php echo get_url('member'); ?>" class='member'>会员中心</a> 
			<a href="<?php echo get_url('quit'); ?>" class='quit'>退出</a>
			<?php else: ?>
			<a href="<?php echo get_url('login'); ?>" class='login'>登录</a> 
			<a href="<?php echo get_url('reg'); ?>" class='reg'>注册</a>
			<?php endif; ?>
		</div>
	</div>
</div>
<div class="MainContainer">
	<div class="MainBox">
		<div class="LeftBox">
			<div class="showerrBox">
				<ul class="incont">
					<ol class="cont">
						<div class="showerrMsg">
							<div class="MsgBox"><?php echo(strip_tags($msg));?></div>
						</div>
					</ol>
					<li class="butter">
						<a id="href" href="<?php echo $url; ?>">页面自动跳转(<em id="wait"><?php echo $wait; ?></em>)</a>
					</li>
				</ul>
			</div> 
		</div>
  <script type="text/javascript">
  if('<?php echo $url; ?>'=='javascript:history.back(-1);'){
	  	if ((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)) { // IE 
			if (history.length > 0) {
				//window.history.go(-1);
			} else {
				//window.location.href = "<?php echo get_url('home'); ?>";
				$("#href").attr('href',"<?php echo get_url('home'); ?>");
			}
		} else { //非IE浏览器 
			if (navigator.userAgent.indexOf('Firefox') >= 0 || navigator.userAgent.indexOf('Opera') >= 0 || navigator.userAgent.indexOf('Safari') >= 0 || navigator.userAgent.indexOf('Chrome') >= 0 || navigator.userAgent.indexOf('WebKit') >= 0) {

				if (window.history.length > 1) {
					//window.history.go(-1);
				} else {
					//window.location.href = "<?php echo get_url('home'); ?>";
					$("#href").attr('href',"<?php echo get_url('home'); ?>");
				}
			} else { //未知的浏览器 
				window.history.go(-1);
			}
		}
  }
  </script>
		<div class="RightBox">
			<?php if(!(empty($userdb['uid']) || (($userdb['uid'] instanceof \think\Collection || $userdb['uid'] instanceof \think\Paginator ) && $userdb['uid']->isEmpty()))): ?>
			<div class="UserBox">
				<div class="h">我的资料</div>
				<div class="icon">
					<a href="<?php echo get_url('user'); ?>?uid=<?php echo $userdb['uid']; ?>" target="_blank" class="img"><span><img src="<?php echo tempdir($userdb['icon']); ?>" onerror="this.src='/public/static/images/nobody.gif'"/></span></a>
					<a href="<?php echo get_url('user'); ?>?uid=<?php echo $userdb['uid']; ?>" target="_blank" class="t"><?php echo $userdb['username']; ?></a>
				</div>
				<div class="text">
					<div>级别: <span><?php echo getGroupByid($userdb['groupid']); ?></span></div>
					<div>积分: <em><?php echo $userdb['money']; ?></em> 个</div>
					<div>注册日期: <?php echo format_time($userdb['regdate']); ?></div>
				</div>
			</div>
			<?php else: ?>
			<div class="UserBox">
				<div class="h">登录通行证</div>
            	<form name="form1" method="post" action="<?php echo get_url('login'); ?>">
					<ul class="logins">
						<li class="name"><input type="text" name="username" minlength="2" maxlength="20" placeholder="请输入帐号" required/></li>
						<li class="pass"><input type="password" name="password" minlength="3" maxlength="30" placeholder="请输入密码" required /></li>
						<li class="word"><a href="<?php echo iurl('index/getpassword/index'); ?>">忘记密码？</a></li>
					</ul>
					<div class="submit"><input type="submit" value="登录"/></div>
					<div class="mores">还没有通行证?<a href="<?php echo get_url('reg'); ?>">立即注册</a></div>
            	</form>
			</div>
			<?php endif; ?>
		</div>
	</div>
</div>
<div class="FootContainer">
	Copyright@www.php168.com all rights reserved <?php echo config('webdb.miibeian_gov_cn'); ?> 
</div>
<script>
(function(){
    var wait = document.getElementById('wait'),
        href = document.getElementById('href').href;
    var interval = setInterval(function(){
        var time = --wait.innerHTML;
        if(time <= 0) {
            location.href = href;
            clearInterval(interval);
        };
    }, 1000);
})();
if( window.top == window.self ){
   $('.TopContainer').show();
   $('.FootContainer').show();
   $('.RightBox').show();
}else{
   $('.TopContainer').hide();
   $('.FootContainer').hide();
   $('.RightBox').hide();
}
</script>
</body>
</html>
