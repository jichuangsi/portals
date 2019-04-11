<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:70:"D:\web\Education\template/index_style/default/index\login/pc_index.htm";i:1554713074;s:62:"D:\web\Education\template/index_style/toutiao/index/layout.htm";i:1554717568;s:65:"D:\web\Education\template\index_style\default\index\min_login.htm";i:1554707864;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户登录</title>
<meta name="keywords" content='<?php echo $webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo $webdb['seo_description']; ?>'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="shortcut icon" type="image/x-icon" href="/public/static/index/toutiao/favicon.ico">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/reset.css">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/cms.css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
<script type="text/javascript" src="/public/static/index/toutiao/kefu.js"></script>
</head>

<body>
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展  -->
<?php echo hook_listen('layout_body_head',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/head.css">
<div class="TopContBox">
	<ul>
		<ol><a href="$webdb[www_url]" class="home"><img src="/public/static/index/toutiao/home.png"></a></ol>
		<li>
<div class="qb_pc_topBox">
	<ul>		
<?php if(!(empty($userdb) || (($userdb instanceof \think\Collection || $userdb instanceof \think\Paginator ) && $userdb->isEmpty()))): ?>
		<ol><?php echo $userdb['username']; ?> 您好！欢迎来到 <a href="/index.php/cms/list-9.html" style="color: blue;"><?php echo $webdb['webname']; ?></a></ol>
		<li><a href="<?php echo get_url('member'); ?>" target="_blank">进入会员中心</a> <a href="<?php echo get_url('quit'); ?>" >安全退出</a></li>
<?php else: ?>
		<ol> 您好！欢迎来到<a href="/index.php/cms/list-9.html" style="color: blue;"><?php echo $webdb['webname']; ?></a></ol>
		<li>
			<form action="<?php echo urls('index/login/index'); ?>" method="post">
	<input type="hidden" name="fromurl" value="<?php echo get_url('location'); ?>">
	<div class="qb_ui_TopLoginBox">
		<span>通行证</span>
		<span><input type="text" name="username" minlength="2" placeholder="输入帐号" required/></span>
		<span><input type="password" name="password" minlength="5" placeholder="输入密码" required/></span>
		<span><button type="submit">登录</button></span>
		<span><a href="<?php echo get_url('reg'); ?>">注册</a> | <a href="<?php echo get_url('login'); ?>">登录</a></span>
		<!--<span><a href="<?php echo purl('login/qq/index'); ?>" class="fa fa-qq"> 登录</a></span>
		<span><a href="<?php echo purl('weixin/login/index'); ?>" class="fa fa-weixin"> 登录</a></span>-->
	</div>
</form>
		</li>
<?php endif; ?>
	</ul>
</div>
		</li>
	</ul>
</div>


<link rel="stylesheet" href="/public/static/index/default/pclogin.css"> 
<div class="UserLoginCont">
	<div class="head"><i class="si si-lock-open"></i> 用户登录</div>
	<div class="LoginCont">
		<div class="Left">
			<form class="mui-input-group" action="<?php echo urls('login/index'); ?>" method="post">
				<div class="LoginBox">
					<div class="h">已是会员，请登录</div>
					<ul>
						<li class="icon"><i class="fa fa-user-o"></i></li>
						<ol>
							<input type="text" name="username" minlength="2" maxlength="20" placeholder="请输入帐号" required/>
						</ol>
						<li><a href="<?php echo urls('reg/index'); ?>">注册帐号</a></li>
					</ul>
					<ul>
						<li class="icon"><i class="si si-lock"></i></li>
						<ol>
							<input type="password" name="password" minlength="3" maxlength="30" placeholder="请输入密码" required/>
						</ol>
						<li><a href="<?php echo urls('getpassword/index'); ?>">忘记密码</a></li>						
					</ul>
					<div class="butter"><input type="hidden" name="fromurl" value="/index.php/cms/list-9.html"><button type="submit">登录</button></div>
				</div>
			</form>
		</div>
		<div class="Right" style="display: none;">
			<h3>没有帐号？点击下面按钮马上注册</h3>
			<p>你也可以用微信扫描下面二维码自动注册或自动登录</p>
			<dl>
				<dt><a href="<?php echo urls('index/reg/index'); ?>">马上注册</a></dt>
				<dd>
					<img src="<?php echo purl('login/scan/qrcode',['type'=>'wx']); ?>"/>
				</dd>
			</dl>
		</div>
	</div>
</div>

<script type="text/javascript">
$(function(){
	$('.qb_ui_TopLoginBox span').not(':last').remove();
});
function countSecond(){　
	$.get("<?php echo purl('login/scan/cklogin'); ?>?"+Math.random(), function(data){
		if(data=='ok'){
			window.location.href="<?php echo purl('login/scan/cklogin'); ?>?type=success";
		}else{
			setTimeout("countSecond()",3000);
		}
	});	
}
countSecond()
</script>


<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/foot.css">
<div id="copyright" style="display: none;">
    <div>Copyright@<?php echo $webdb[www_url]; ?> all rights reserved <a href="http://www.miibeian.gov.cn" target="_blank"><?php echo $webdb['miibeian_gov_cn']; ?></a></div>
    <div>Powered by <a href="http://www.php168.com" target="_blank">qibosoft <?php echo $webdb['QB_VERSION']; ?></a> Code &copy; 2018 <a href="http://bbs.qibosoft.com/" target="_blank">qibosoft</a></div>
	<?php echo $webdb['copyright']; ?>
</div>
<!-- 在线客服 开始 -->
<div id="top"></div>
<!-- 在线客服 结束 -->
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_foot',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<script type="text/javascript" src="/public/static/js/qibo.js"></script>
</body>
</html>