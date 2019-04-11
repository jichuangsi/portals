<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:72:"D:\web\Education\template/index_style/toutiao/cms\content\myfabulous.htm";i:1550137606;s:66:"D:\web\Education\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo !empty($fid)?($info['seo_title']?:$info['name']):$m_info['title']; ?></title>
<meta name="keywords" content='<?php echo !empty($fid)?($info['seo_keywords']?:$info['name']):$m_info['title']; ?>'>
<meta name="description" content='<?php echo $info['seo_description']; ?>'>
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



<div class="qb_header">
	<div class="goback"><a href="#" onclick="window.history.back();" class="fa fa-reply"> 返回</a></div>
    <div class="web">我的点赞</div>
    <div class="member"><a href="/member.php" class="fa fa-user-circle"></a></div>
</div>
<div class="history" style="margin-top: 55px;padding: 14px;">
	
</div>
<style>
	.qb_header {
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 999;
	}
	.qb_header {
	    display: table;
	    background: #ffdd33;
	    border-bottom: #DDD solid 1px;
	    width: 100%;
	}
	.qb_header div.goback {
	    width: 60px;
	}
	.qb_header div {
	    display: table-cell;
	    text-align: center;
	    padding: 15px 5px;
	    font-size: 16px;
	    vertical-align: middle;
	}
	.qb_header div {
	    display: table-cell;
	    text-align: center;
	    padding: 15px 5px;
	    font-size: 16px;
	    vertical-align: middle;
	}
	.web {
	    font-size: 21px !important;
	    font-weight: bold;
	}
	.qb_header div {
	    display: table-cell;
	    text-align: center;
	    padding: 15px 5px;
	    font-size: 16px;
	    vertical-align: middle;
	}
	.qb_header div.member {
	    width: 40px;
	    font-size: 22px;
	}
</style>
<script>
	$(function(){
		$('.body_Hearcont').remove();
		var histarr=JSON.parse(localStorage.getItem("Fabulous"));
		for(var i=histarr.length-1;i>=0;i--){
			$('.history').append(histarr[i].val);
		}
	});
</script>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/waplist.css">
	
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