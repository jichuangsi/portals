<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:66:"D:\web\Education\template/admin_style/blansj/admin\index\login.htm";i:1547800330;}*/ ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理</title>
<link rel="stylesheet" type="text/css" href="/public/static/blansj_admin/css/login.css" />
<META content="MSHTML 6.00.2900.3132" name=GENERATOR>
</HEAD>
</head>
<body>
<script type="text/javascript">
if(self!=top){
	window.top.location=location.href;
}
</script>
<div class="container">
	<section id="content">
		<form name="form1" method="post" action="<?php echo url('login'); ?>">
			<h1>登录</h1>
			<div>
				<input type="text" name="username" placeholder="输入帐号" id="username">
			</div>
			<div>
				<input type="password" name="password" placeholder="输入密码" id="password">
			</div>
			<?php if(!(empty($webdb['admin_login_usercode']) || (($webdb['admin_login_usercode'] instanceof \think\Collection || $webdb['admin_login_usercode'] instanceof \think\Paginator ) && $webdb['admin_login_usercode']->isEmpty()))): ?>
				<div>
						<input type="text" name="captcha" placeholder="输入验证码" id="password">
						<img src="<?php echo captcha_src(); ?>" style="cursor: pointer;" onclick="this.src='<?php echo captcha_src(); ?>?d='+Math.random();" title="点击刷新"/>
				</div>
				<?php endif; ?>
			 <div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span>			
			 </div> 
			<div style="MARGIN-LEFT: 39PX;">
			<input type="reset" value="取消" class="btn btn-primary">
			<input type="submit" value="登录" class="btn btn-primary">
			</div>
		</form><!-- form -->
		 <!-- button -->
	</section><!-- content -->
</div>
<!-- container -->
</body>
</html>
 