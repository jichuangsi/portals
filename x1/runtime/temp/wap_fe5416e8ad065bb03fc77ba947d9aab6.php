<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:61:"D:\web\x1\template/index_style/default/search\index\index.htm";i:1548400274;s:59:"D:\web\x1\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $webdb['mseo_title']; ?></title>
<meta name="keywords" content='<?php echo $webdb['mseo_keyword']; ?>'>
<meta name="description" content='<?php echo $webdb['mseo_description']; ?>'>
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



<style>
	input,button,select,textarea{outline:0}
 .searchbox{height:36px;margin:10px 10px;clear:both;border:1px solid #fc8c1d;position:relative;overflow:hidden}
.searchbox form{height:38px}
.searchbox .q{display:block;background:#efefef;width:auto;width:95%;height:38px;font-size:16px;color:#CCC;margin:0;padding:0 0 0 10px;border:0;line-height:38px;border:0;border-right:0;margin-right:20px}
.searchbox .btn{width:55px;height:38px;line-height:38px;border:0;background-color:#fc8c1d;cursor:pointer;display:block;color:#FFF;text-align:center;font-size:16px;position:absolute;top:0;right:0;-webkit-appearance:none;border-radius:0}
.searchbox .btn:hover{background-color:#fc9f38;-webkit-appearance:none;border-radius:0}
.hotsearch{clear:both;width:100%;margin:55px 10px 10px 10px}
.hotsearch h2{color:#666;font-size:16px;line-height:30px;text-align:center}
.ranklist li{height:20px;margin:5px 5px 5px 0;padding-bottom:5px;overflow:hidden;border-bottom:1px solid #f3f3f3;width: 44%;float: left;}
.ranklist li .num{display:inline-block;float:left;width:16px;height:16px;margin-top:2px;background-color:#8eb9f5;line-height:16px;text-align:center;color:#FFF;font-size:12px}
.ranklist li .top1{background-color:#f97a0b}
.ranklist li .top2{background-color:#fa9a43}
.ranklist li .top3{background-color:#fcb574}
.ranklist li a{font-size:14px;display:inline-block;float:left;height:20px;margin-left:5px;padding:0 5px}
.ranklist li a:hover{background-color:#f2f1ee;text-decoration:none;padding:0 5px}
.bdsug_copy{display:none}
.body_Hearcont{
	display: flex;
}
.top_searchbox{
	display: flex;
	justify-content: center;
	width: 100%;
	margin: auto;
}
.top_searchbox button{
	background-color: rgba(0,0,0,0);
	border: 0;
}
</style>
 <script>
	$(function(){
		$('.body_Hearcont').html('<div class="top_searchbox"><button onclick="window.history.back();" type="button" style="width: 10%;color: #fff;"><i class="fa fa-chevron-left" aria-hidden="true"></i></button> <form style="width: 88%;display: inline;" action="<?php echo url('search/index/lists'); ?>" method="get"><input style="opacity: 0.8;;width: 80%;padding: 4px 0px;border-radius: 8px;border: none;outline: none;text-indent: 8px;" align="middle" name="keyword" class="q" id="kw" value="<?php echo $keyword; ?>" maxlength="1000" baiduSug="1" autocomplete="off" placeholder="请输入搜索关键字" x-webkit-speech /><button type="submit" style="padding: 5px;color: #fff;">搜索</button> </form></div>');
	});
</script>
<!--<div class="searchbox">
  <form action="<?php echo url('search/index/lists'); ?>" method="get">
    <input style="width: 80%;padding: 4px 0px;border-radius: 11px;border: none;outline: none;text-indent: 4px;" align="middle" name="keyword" class="q" id="kw" value="请输入关键字搜索" onfocus="javascript:if(this.value=='请输入关键字搜索'){this.value='';this.style.color='#333'}" onblur="javascript:if(this.value==''){this.value='请输入关键字搜索';this.style.color='#CCC'}" maxlength="1000" size="50" autocomplete="off" baiduSug="1" x-webkit-speech />
    
    <input id="btn" class="btn" align="middle" value="搜索" type="submit" />
  </form>
</div>-->
<div class="hotsearch">
  <h2>热门搜索</h2>
  <div class="cl10"></div>
  <ul class="ranklist">
      <?php if(is_array($resou) || $resou instanceof \think\Collection || $resou instanceof \think\Paginator): $k = 0; $__LIST__ = $resou;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($k % 2 );++$k;?>
	    <li><span class="num <?php if($k < '4'): ?>top1<?php else: ?>top2<?php endif; ?>"><?php echo $k; ?></span><a href="<?php echo url('search/index/lists','html',true); ?>?keyword=<?php echo $rs['keyword']; ?>"><?php echo $rs['keyword']; ?></a></li>
	  <?php endforeach; endif; else: echo "" ;endif; ?>
  </ul>
</div>
<script charset="gbk" src="http://www.baidu.com/js/opensug.js"></script>
	
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