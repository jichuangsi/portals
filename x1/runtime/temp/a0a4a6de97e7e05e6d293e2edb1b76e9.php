<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:64:"D:\web\x1\template/index_style/default/search\index/pc_index.htm";i:1547619338;s:55:"D:\web\x1\template/index_style/toutiao/index/layout.htm";i:1550470514;s:58:"D:\web\x1\template\index_style\default\index\min_login.htm";i:1537234413;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo $webdb['mseo_title']; ?></title>
<meta name="keywords" content='<?php echo $webdb['mseo_keyword']; ?>'>
<meta name="description" content='<?php echo $webdb['mseo_description']; ?>'>
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
		<ol><?php echo $userdb['username']; ?> 您好！欢迎来到<?php echo $webdb['webname']; ?></ol>
		<li><a href="<?php echo get_url('member'); ?>" target="_blank">进入会员中心</a> <a href="<?php echo get_url('quit'); ?>" target="_blank">安全退出</a></li>
<?php else: ?>
		<ol>您好！欢迎来到<?php echo $webdb['webname']; ?></ol>
		<li>
			<form action="<?php echo urls('index/login/index'); ?>" method="post">
	<input type="hidden" name="fromurl" value="<?php echo get_url('location'); ?>">
	<div class="qb_ui_TopLoginBox">
		<span>通行证</span>
		<span><input type="text" name="username" minlength="2" placeholder="输入帐号" required/></span>
		<span><input type="password" name="password" minlength="5" placeholder="输入密码" required/></span>
		<span><button type="submit">登录</button></span>
		<span><a href="<?php echo get_url('reg'); ?>">注册</a> | <a href="<?php echo get_url('login'); ?>">登录</a></span>
		<span><a href="<?php echo purl('login/qq/index'); ?>" class="fa fa-qq"> 登录</a></span>
		<span><a href="<?php echo purl('weixin/login/index'); ?>" class="fa fa-weixin"> 登录</a></span>
	</div>
</form>
		</li>
<?php endif; ?>
	</ul>
</div>
		</li>
	</ul>
</div>


<style>
	input,textarea,select,button,option{font-family:inherit;font-size:inherit;font-weight:inherit}
	input,button,select,textarea{outline:0}
#top{height:1px;line-height:1px;background-color:#ebebeb;}
.searchbox{width:600px;height:38px;margin:30px auto 20px auto}
.searchbox .q{display:inline-block;background:#FFF;width:484px;height:38px;font-size:16px;color:#CCC;margin:0;padding:0 10px 0 10px;border:0;float:left;line-height:38px;border:1px solid #cfc7c8;border-right:0;-moz-box-shadow:inset 0 1px 6px #e1e1e1;-webkit-box-shadow:inset 0 1px 6px #e1e1e1;box-shadow:inset 0 1px 6px #e1e1e1}
.searchbox .btn{width:95px;width:94px\9\0;height:40px;line-height:40px;border:0;background-color:#fc8c1d;cursor:pointer;float:right;display:inline-block;color:#FFF;text-align:center;font-size:16px;-webkit-appearance:none;border-radius:0}
.searchbox .btn:hover{background-color:#fc9f38;-webkit-appearance:none;border-radius:0}
.hotsearch{clear:both;width:598px;margin:10px auto 30px auto;border:1px solid #fff0c6;background-color:#FFF}
.hotsearch .hothead{height:28px;background-color:#fffae9;border-bottom:1px solid #fff0c6}
.hotsearch .hothead a{display:inline-block;float:left;height:28px;width:100px;text-align:center;line-height:28px;border-right:1px solid #fff0c6;font-size:14px;color:#999}
.hotsearch .hothead a:hover{text-decoration:none;color:#F60}
.hotsearch .hothead a.current{background-color:#fff;height:29px;color:#F60}
.hotsearch ul{margin:10px 0 0 10px}
.hotsearch h2{color:#CCC;font-size:16px;line-height:40px;text-align:center}
.hotsearch li{height:20px;line-height:20px;width:180px;_width:175px;margin:5px 0 0 10px;display:inline-block;float:left;overflow:hidden}
.hotsearch li a{color:#113aaa;font-size:14px;display:inline-block;float:left;margin-left:5px;width:140px;overflow:hidden}
.hotsearch li a:hover{color:#f70615}
.hotsearch li .num{display:inline-block;float:left;width:16px;height:16px;margin-top:2px;background-color:#609;line-height:16px;text-align:center;color:#FFF;font-size:12px;-moz-border-radius:3px;-webkit-border-radius:3px;border-radius:3px}
.hotsearch li .top1{background-color:#F90}
.hotsearch li .top2{background-color:#8ca6dc}
</style>
<div id="top"></div>
<div class="content">
  <div class="searchbox">
    <form action="<?php echo url('search/index/lists'); ?>" method="get" onsubmit="return subck();">
      <input align="middle" name="keyword" class="q" id="kw" value="请输入关键字搜索" onfocus="javascript:if(this.value=='请输入关键字搜索'){this.value='';this.style.color='#333';this.style.borderColor='#FC8105';}" onblur="javascript:if(this.value==''){this.value='请输入关键字搜索';this.style.color='#CCC';this.style.borderColor='#CFC7C8';}" maxlength="100" size="50" autocomplete="off" baidusug="1" style="color: rgb(204, 204, 204); border-color: rgb(207, 199, 200);">
      <input id="btn" class="btn" align="middle" value="搜索一下" type="submit">
    </form>
  </div>
</div>
<script type="text/javascript">
function subck(){
	var q = document.getElementById("kw").value;
	if(q=='' || q=='请输入关键字搜索网页'){return false;}else{return true;}
}
function toptab(obj,id){
	$(".hothead a").removeClass("current");
	$("#tab"+id).addClass("current");
    $(".hotsearch ul").hide();
	$("#toplist"+id).show();
}
</script>
<div class="hotsearch">
  <div class="hothead"><a href="javascript:void(0)" id="tab1" onmouseover="toptab(this,'1');" class="current">实时热搜</a></div>
  <ul id="toplist1">
    <?php if(is_array($resou) || $resou instanceof \think\Collection || $resou instanceof \think\Paginator): $k = 0; $__LIST__ = $resou;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($k % 2 );++$k;?>
    <li><span class="num <?php if($k < '4'): ?>top1<?php else: ?>top2<?php endif; ?>"><?php echo $k; ?></span><a href="<?php echo url('search/index/lists','html',true); ?>?keyword=<?php echo $rs['keyword']; ?>"><?php echo $rs['keyword']; ?></a></li>
    <?php endforeach; endif; else: echo "" ;endif; ?>
    <div style=" clear: both"></div>
  </ul>
  <div style="margin-top: 10px"></div>
</div>
<script charset="gbk" src="http://www.baidu.com/js/opensug.js"></script> 

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