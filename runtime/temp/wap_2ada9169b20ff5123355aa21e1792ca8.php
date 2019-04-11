<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:67:"D:\web\Education\template/index_style/default/index\login\index.htm";i:1553597879;s:66:"D:\web\Education\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $info['title']; ?></title>
<meta name="keywords" content='<?php echo $webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo $webdb['seo_description']; ?>'>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="/public/static/css/base.css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/wap_head.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
<script type="text/javascript" src="/public/static/index/toutiao/iscroll.js"></script>
<script type="text/javascript" src="/public/static/js/BrowsingHistory.js"></script>
</head>
<body>
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_head',$userdb,$webdb,true); ?>

<div class="body_Hearcont">
	<ul>
	<!--<li>
		<a href="/member.php/member/msg/index.html"><img src="/public/static/index/toutiao/email.png" width="30"></a>
		</li>-->
		<ol><a href="/"><img src="<?php echo (tempdir($webdb['logo']) ?: '/public/static/index/toutiao/wap_logo.png'); ?>"></a></ol>
		<li>
		<a href="/search/"><img src="/public/static/index/toutiao/so.png" width="30"></a>
		</li>
	</ul>
</div> 



<link rel="stylesheet" href="/public/static/css/base.css">
<style>
	input:-webkit-autofill , textarea:-webkit-autofill, select:-webkit-autofill {
	-webkit-box-shadow: 0 0 0px 1000px transparent  inset !important;
    background-color:#EFEFEF;
    background-image: none;
     transition: background-color 50000s ease-in-out 0s; //背景色透明  生效时长  过渡效果  启用时延迟的时间
}
input {
	 background-color:transparent;
}
	body{
		  overflow: hidden;
	}
.mui-btn{
	margin-top:20px;
}
.LogoContainer{
	margin-top: 10px;
	max-width:640px;
	height: 190px;
	/*margin-bottom: -39px;*/
	/*margin:auto;*/
	position:relative;
}
/*.LogoContainer:before{
	content:'';
	display:block;
	padding-top:50%;
}*/
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
	width:69%;
	margin: auto;
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
	margin-top:15px;
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
	.LogoContainer ul li{
		font-size:26px;
	}	
	.FormContainer .subimt input{
		line-height:60px;
		font-size:24px;
	}
}
@media (max-width: 600px) and (min-width:501px) { /* <- 3-2  hexagons per row */
    .LogoContainer ul li{
		font-size:22px;
	}
	.FormContainer .subimt input{
		line-height:50px;
		font-size:20px;
	}	
}
@media (max-width: 500px) and (min-width:401px) { /* <- 3-2  hexagons per row */
    .LogoContainer ul li{
		font-size:20px;
	}	
	.FormContainer .subimt input{
		line-height:45px;
		font-size:18px;
	}
}
@media (max-width: 400px) { /* <- 2-1  hexagons per row */
    .LogoContainer ul li{
		font-size:18px;
	}
	.FormContainer .subimt input{
		line-height:40px;
		font-size:16px;
	}
}
.mui-btn,button,input[type=button],input[type=reset],input[type=submit] {
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
.mui-btn-danger,.mui-btn-negative,.mui-btn-red {
	color: #fff;
	border: 1px solid #FFDD33;
	background-color: #ffdd33;
}
.mui-btn-block {
	font-size: 18px;
	display: block;
	width: 100%;
	margin-bottom: 10px;
	padding: 15px 0;
	border-radius: 50px;
}
</style>
<script>
	$(function(){
		$("input").attr("disabled",false);
			$("input").attr("readOnly",false);
	});
</script>
<div class="LogoContainer">	
	<ul>
		<ol style="text-align: center;"><img src="/public/static/member/default/base/logo.png"/></ol>
		<!--<li><?php echo $webdb['webname']; ?></li>-->
	</ul>
</div>
<div class="FormContainer">
<form class="mui-input-group" action="<?php echo urls('login/index'); ?>" method="post">
	<ul><ol><i class="fa fa-fw fa-user-o"></i></ol><li><input type="text"  name="username" minlength="2" maxlength="20" placeholder="请输入帐号" /></li></ul>
	<ul><ol><i class="si si-lock"></i></ol><li><input type="password"   name="password" minlength="3" maxlength="30" placeholder="请输入密码" /></li></ul>
	<input type="hidden" name="fromurl" value="<?php echo $fromurl; ?>">
	<button type="submit" class="mui-btn mui-btn-danger mui-btn-block">进入新闻</button>
	<p style="text-align: center;">登录即表示你同意 <a style="color: #406599;" href="<?php echo urls('login/agreement'); ?>">&nbsp;用户协议&nbsp;</a>和 <a style="color: #406599;" href="<?php echo urls('login/privacypolicy'); ?>" onclick="ShowPrivacy()">&nbsp;隐私条款&nbsp;</a></p>
	<dl>
		<dt><a href="<?php echo urls('getpassword/index'); ?>">忘记密码</a></dt>
		<dd><a href="<?php echo urls('reg/index'); ?>">注册帐号</a></dd>
	</dl>
	<div class="OtherLogin">
		<div class="h"><span>其他登录方式</span></div>
		<div class="c">
			<a href="<?php echo purl('login/qq/index'); ?>?fromurl=<?php echo $fromurl; ?>"><i class="fa fa-fw fa-qq"></i></a>
			<?php if((in_weixin()||in_wxapp())): ?><a href="<?php echo purl('weixin/login/index'); ?>?fromurl=<?php echo $fromurl; ?>" class="wx"><i class="fa fa-fw fa-weixin"></i></a><?php endif; ?>
			<a class="phone" style="background: #f30;" href="<?php echo urls('index/login/phone'); ?>?fromurl=<?php echo $fromurl; ?>"><i class="fa fa-fw fa-mobile-phone"></i></a>
		</div>
	</div>
</form>
</div>
<script>
	function ShowAgreement(){
		$('#Agreement').fadeIn(500);
	}
	function HideAgreement(){
		$('#Agreement').fadeOut();
	}
	function ShowPrivacy(){
		$('#Privacy').fadeIn();
	}
	function HidePrivacy(){
		$('#Privacy').fadeOut();
	}
</script>
<style>
	.Agreement{
		width: 100%;
		height: 100%;
		z-index: 9999999;
		background: #efefef;
		position: fixed;
		top: 0;
		overflow: scroll;
	}
	.Agreement_header{
		position: fixed;
		top: 0;
		text-align: center;
		color: #000000;
		width: 100%;
		height: 51px;
		line-height: 51px;
		font-size: 21px;
		background-color: #fff;
	}
	.Agreement_header a{
		position: absolute;
		left: 15px;
		padding: 0px 5px;
		color: #000000;
	}
	.Agreement_info{
		margin-top: 55px;
		line-height: 30px;
		padding: 15px;
		overflow: scroll;
	}
	.Agreement_info h1,.Agreement_info h4,.Agreement_info p{
		margin: 15px 0px;
		
	}
	.Agreement_info p{
		text-indent: 20px;
	}
</style>
	
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,$webdb,true); ?>

<link rel="stylesheet" href="/public/static/index/toutiao/wap_foot.css"> 
<div class="body_Footcont">
	<div class="footer">
		<ul>
<!--
			<li><a href="javascript:;history.go(-1);"><i class="si si-arrow-left"></i><span>返回</span></a></li>
			<li><a href="<?php echo iurl('cms/index/index'); ?>"><i class="si si-present"></i><span>资讯</span></a></li>
			<li><a href="<?php echo get_url('index'); ?>"><i class="si si-home"></i><span>首页</span></a></li>
			<li><a href="<?php echo iurl('shop/index/index'); ?>" data="购物车<?php echo iurl('shop/car/index'); ?>"><i class="si si-basket"></i><span>商城</span></a></li>
			<li><a href="<?php echo get_url('member'); ?>"><i class="si si-user"></i><span>会员中心</span></a></li>
-->
<?php if(is_array(get_web_menu('wapfoot')) || get_web_menu('wapfoot') instanceof \think\Collection || get_web_menu('wapfoot') instanceof \think\Paginator): $i = 0; $__LIST__ = get_web_menu('wapfoot');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>class="cur"<?php endif; ?>><a href="<?php echo $rs['url']; ?>"><i class="<?php echo (isset($rs['style']) && ($rs['style'] !== '')?$rs['style']:'glyphicon glyphicon-star'); ?>"></i><span><?php echo $rs['name']; ?></span></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>

		</ul>
	</div>
</div>

<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_foot',$userdb,$webdb,true); ?>
</body>
</html>