<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:77:"D:\web\Education\portals\template/index_style/toutiao/cms\index/wap_index.htm";i:1555581223;s:74:"D:\web\Education\portals\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $webdb['seo_title']; ?></title>
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



<div class="BigsortBox">
	<div class="BoxIn">
		<ul>
			<ol><div><span>
<?php $menu_choose=config('system_dirname')?config('system_dirname'):'index'; ?>
<!--<?php if(is_array(get_web_menu('wap')) || get_web_menu('wap') instanceof \think\Collection || get_web_menu('wap') instanceof \think\Paginator): $i = 0; $__LIST__ = get_web_menu('wap');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<a href="<?php echo $rs['url']; ?>" <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>class="ck"<?php endif; ?>><?php echo $rs['name']; ?></a>
<?php endforeach; endif; else: echo "" ;endif; ?>-->
		<?php if(is_array(get_sort(0,'other')) || get_sort(0,'other') instanceof \think\Collection || get_sort(0,'other') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort(0,'other');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
			<a href="<?php echo urls('content/index',['fid'=>$key]); ?>" <?php if(($key==$fid)): ?>class="ck"<?php endif; ?>><?php echo $vo; ?></a>
		<?php endforeach; endif; else: echo "" ;endif; ?>
			</span></div></ol>
			<li ><span><i class="fa fa-bars" aria-hidden="true"></i></span></li>
		</ul>
	</div>
</div>

<!--弹出更多导航菜单-->
<style>
.pic_word{
	display: flex !important;
}
.pic_word ol{
	width: 100% !important;
}
.pic_word ol a{
	height: 100% !important;
}
.pic_word ol a span img{
	width: 100% !important;
	height: 100% !important;
}
.ListContnaier .ListVotes{
	padding: 0px !important;
}
.ListContnaier .ListVotes .Lists dl{
	argin: 0px 5px 0px 0px !important;
}
.ListContnaier .ListVotes .Lists dl dd p{
	    word-break: break-all;
}
.ListVotes{
	width: 1000px;
}
.ListContnaier .ListVotes .Lists{
	/*display: inline-block;*/
	width: 150px !important;
}
.nav-menu-list{
	width: 100%;
	height:100%;
	background-color: #fafafa;
	position: fixed;
	top: 0;
	left: 0;
	z-index: 99999999;
	text-decoration: none;
	color: #000000;
	font-size: 15px;
}
.menu_close{
	color: #000000;
	font-size: 25px;
	text-indent: 3%;
}
.clour{
	color: #999999;
}
.fontSize20{
	font-size: 13px;
}
.Ichannel{
	text-indent: 3%;
	margin-bottom: 3%;
}
.edit_btn{
	padding: 0 10px;
	color: #FFDD33;
	font-size: 15px;
	text-align: center;
	float: right;
	margin-right: 2%;
	background-color: #FAFAFA;
	border-radius: 28px;
	border: 1px solid #FFDD33;
}
.Ichannel-list{
	width: 92%;
	margin-left: 3%;
	list-style-type: none;
}
.Ichannel-list li{
	width: 24%;
	float: left;
	margin-bottom: 3%;
	display: flex;
}
.channel_info{
	width: 80%;
	height: 100%;
	text-align: center;
	margin: auto;
	background-color: #e6e6e6;
	line-height: 35px;
}
.clearFloat{
	margin: 2%;
	clear: both;
}
.addchannel-list{
	width: 92%;
	margin-left: 3%;
	list-style-type: none;
}
.addchannel_info{
	width: 80%;
	height: 100%;
	text-align: center;
	margin: auto;
	background-color: #e6e6e6;
	line-height: 35px;
}
</style>
<script>
	function navMenuHideShow(){
//		$('.nav-menu-list').fadeIn();
	}
	function hidenavMenu(){
//		$('.nav-menu-list').fadeOut();
	}
</script>
<div class="nav-menu-list" style="display: none;">
				<p><a href="javascript:void(0)"  class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></a> </p>
				<p  class="Ichannel"> 我的频道 <a class="fontSize20 clour">点击进入频道</a> <button class="edit_btn" type="button">编辑</button></p>
				<ul class="Ichannel-list">
					<li>
							<div class="channel_info" style="color: #6666;">
								推荐
							</div>
						</li>
					<?php if(is_array(get_sort(0,'other')) || get_sort(0,'other') instanceof \think\Collection || get_sort(0,'other') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort(0,'other');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
						<li>
							<div class="channel_info">
								<a href="<?php echo urls('content/index',['fid'=>$key]); ?>" <?php if(($key==$fid)): ?>class="ck"<?php endif; ?>><?php echo $vo; ?></a>
							</div>
						</li>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</ul>
				<p  class="clearFloat Ichannel"> 我的频道 <a class="fontSize20 clour">点击进入频道</a> </p>
				<ul class="addchannel-list Ichannel-list">
					<li>
						<div class="addchannel_info">
							<i class="fa fa-plus" aria-hidden="true"></i>关注
						</div>
					</li>
					<li>
						<div class="addchannel_info">
							<i class="fa fa-plus" aria-hidden="true"></i>关注
						</div>
					</li>
					<li>
						<div class="addchannel_info">
							<i class="fa fa-plus" aria-hidden="true"></i>关注
						</div>
					</li>
					<li>
						<div class="addchannel_info">
							<i class="fa fa-plus" aria-hidden="true"></i>关注
						</div>
					</li>
					<li>
						<div class="addchannel_info">
							<i class="fa fa-plus" aria-hidden="true"></i>关注
						</div>
					</li>
					<li>
						<div class="addchannel_info">
							<i class="fa fa-plus" aria-hidden="true"></i>关注
						</div>
					</li>
				</ul>
</div>
<div class="MoreSorts" style="display: none;">
	<div class="BackBox" onClick="HiddenMoreSorts()"></div>
<?php if(is_array(get_web_menu('wap')) || get_web_menu('wap') instanceof \think\Collection || get_web_menu('wap') instanceof \think\Paginator): $i = 0; $__LIST__ = get_web_menu('wap');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<dl>
			<dt><a href="<?php echo $rs['url']; ?>"><?php echo $rs['name']; ?></a><span></span></dt>
					<dd>
	<?php if(!(empty($rs['sons']) || (($rs['sons'] instanceof \think\Collection || $rs['sons'] instanceof \think\Paginator ) && $rs['sons']->isEmpty()))): if(is_array($rs['sons']) || $rs['sons'] instanceof \think\Collection || $rs['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
					<a href="<?php echo $vs['url']; ?>"><?php echo $vs['name']; ?></a>
			<?php endforeach; endif; else: echo "" ;endif; endif; ?>
	</dd>
</dl>		
<?php endforeach; endif; else: echo "" ;endif; ?>
	<div class="exit"><span onClick="HiddenMoreSorts()">关闭</span></div>
</div>
<script type="text/javascript">
<!--
$('.MoreSorts dl dt span').click(function(){
	var thisobj=$(this).parent().parent();
	thisobj.siblings('dl').removeClass('ck');
	if(thisobj.hasClass('ck')){
		thisobj.removeClass('ck');
	}else{
		thisobj.addClass('ck');
	}
});
function HiddenMoreSorts(){
	$('.MoreSorts').fadeOut();
}
/*$('.BigsortBox .BoxIn ul li').click(function(){
	var scrollTopH=parseInt($(window).scrollTop());
	$('.MoreSorts').css({'top':scrollTopH+'px'});
	$('.MoreSorts').fadeIn();
});*/
//统计总宽度
//var mysortBoxW=0;
//$('.BigsortBox ul ol div a').each(function(){
	//mysortBoxW+=$(this).width();
//});
var mysortBoxW=$('.BigsortBox ul ol div span').width()+30;
$('.BigsortBox ul ol div').width(mysortBoxW);
var myScroll; 
myScroll = new IScroll('.BigsortBox ul ol', { scrollX: true, scrollY: false, mouseWheel: true,preventDefault: false,preventDefaultException: { tagName: /^(INPUT|TEXTAREA|BUTTON|SELECT|LI)$/ } });
//-->
</script>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/wapindex.css">
<div class="MainContainerBox">
	<div class="MainSlideBox" style="display: none;">
<script type="text/javascript" src="/public/static/mui/js/mui.min.js"></script>
<script>
	$(function(){
		window.location.href="/index.php/cms/list-9.html";
	});
</script>
<!--<script>
	$(function(){
		$.get("/index.php/vote/",function(res){
			$('.votelistinfo').append(res);
			$('.votelistinfo .votes').hide();
			var voteoption=$('.ListVotes').find(".Lists").length;
			if(voteoption==0){
				$('.votelistinfo').hide();
			}
			$('.ListVotes').width(150*voteoption+20);
		});  
		$('.body_Hearcont').html('<div onclick="window.location.href=\'/index.php/search/\'" style="display: flex;"> <input style="opacity: 0.8 ;margin: auto;width: 80%;padding: 4px 0px;border-radius: 8px;border: none;outline: none;text-indent: 16px;text-align: center;" placeholder="点击搜索"/> </div>')
		var divwid =$('.BoxIn ul ol div').width();
		$('.BoxIn ul ol div').width((divwid+80));
		$('.BoxIn ul ol div span').prepend('<a href="/index.php/cms/">推荐</a>');
		$("a").not("[href*='list']").addClass('ck');
		
	});
</script>-->
<!--幻灯片标签开始---->
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--wap_index_rollpic2	images	-->
<!--
<link rel="stylesheet" href="/public/static/index/default/slider.css">
<div id="slider" class="mui-slider">
		<div class="mui-slider-group mui-slider-loop">
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/public/static/images/4.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/images/1.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/images/2.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/images/3.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/images/4.jpg"></a></div>
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/public/static/images/1.jpg"></a></div>
		</div>
		<div class="mui-slider-indicator">
			<div class="mui-indicator mui-active"></div>
			<div class="mui-indicator"></div>
			<div class="mui-indicator"></div>
			<div class="mui-indicator"></div>
		</div>
</div>
<script type="text/javascript" charset="utf-8">var slider = mui("#slider");</script>
-->
	<!--上面的是演示数据，演示数据可有可无，有的话，必须以注释的形式紧跟在标签后面，下面的就是模板-->
	<!--每一个标签有开始与结尾标志 name就代表标签名，可以中文，不能重复，val就是想得到的变量名 type是指定要什么数据-->
<link rel="stylesheet" href="/public/static/index/default/slider.css">
<div id="slider" class="mui-slider" >
	 <div class="mui-slider-group mui-slider-loop">
		<div class="mui-slider-item mui-slider-item-duplicate"><a href="<?php echo end($listdb)['url']; ?>"><img alt="<?php echo end($listdb)['title']; ?>" src="<?php echo end($listdb)['picurl']; ?>"></a></div>
		<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="mui-slider-item"><a href="<?php echo $rs['url']; ?>"><img alt="<?php echo $rs['title']; ?>" src="<?php echo $rs['picurl']; ?>"></a></div>
		<?php endforeach; endif; else: echo "" ;endif; ?>
		<div class="mui-slider-item mui-slider-item-duplicate"><a href="<?php echo $listdb['0']['url']; ?>"><img alt="<?php echo $listdb['0']['title']; ?>" src="<?php echo $listdb['0']['picurl']; ?>"></a></div>
	</div>
	<div class="mui-slider-indicator">
		<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="mui-indicator <?php if($i == '1'): ?>mui-active<?php endif; ?>"></div>
		<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
</div>
<script type="text/javascript" charset="utf-8">var slider = mui("#slider");</script>
 QB--><?php endif; $wap_index_rollpic2 = fun('label@run_label','wap_index_rollpic2',['val'=>'listdb','list'=>'rs','systype'=>'images','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>    
<!--幻灯片标签结束---->	
	</div>
	<div style="width: 100%;" class="votelistinfo">
	<!--include file="../../default/vote/content/list" /}-->
</div> 

	<div class="ListConts">
		<?php
										function gettime($time_s,$time_n){
											$time_s = $time_s;
											$time_n = $time_n;
											$strtime = '';
											$time = $time_n-$time_s;
											if($time >= 31536000){
												return $strtime = date('Y-m-d ',$time_s);
											}
											if($time >= 86400){
												$strtime .= intval($time/86400).'天前';
												$time = $time % 86400;
												return $strtime;
											}else{
												$strtime .= '';
											}
											if($time >= 3600){
												$strtime .= intval($time/3600).'小时前';
												$time = $time % 3600;
												return $strtime;
											}else{
												$strtime .= '';
											}
											if($time >= 60){
												$strtime .= intval($time/60).'分钟';
												$time = $time % 60;
												return $strtime;
											}else{
												$strtime .= '';
											}
											if($time > 0){
												$strtime .= '刚刚';
											}else{
												$strtime = "时间错误";
											}
											return $strtime;
											}
?>	
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/waplist.css">
<!--<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--news_list_page_listdata01	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>2 )): ?>
<div class="ListMorpic">
<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
<a href="<?php echo $rs['url']; ?>"><ul>
<a href="<?php echo $rs['url']; ?>">
<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if(($i<4)): ?>
	<li><span><img src="<?php echo $pic['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></span></li>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>
</a>
</ul>
</a>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>
</div>	
<?php elseif(( $rs['picurl']!='' )): ?>
<ul class="pic_word">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>"></span></a></ol>
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a>
		<p onclick="window.location.href='<?php echo $rs['url']; ?>'"><?php echo get_word($rs['content'],94); ?></p>
	</div>
</li>
</ul>
<div>
	<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>
</div>
<?php else: ?>
<ul class="pic_word">
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
	<p><?php echo get_word($rs['content'],94); ?></p>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>
</li>
</ul>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $news_list_page_listdata01 = fun('label@run_label','news_list_page_listdata01',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'','order'=>'create_time','by'=>'','status'=>'2','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?> -->
<!--<iframe name="content_frame" width=100% height=80 frameborder="0" scrolling="no" marginwidth=0 SRC="../public/template/index_style/default/vote/content/list.html" style="min-width: 1520px;"></iframe>-->

<div class="ListMainCont">
	<div class="ListArticles">
<!--name是标签名，跟通用标签不能重名，rows取几条数据,order按什么方式排序，list代表可控排序，id即时间,view代表浏览量-->
<?php if(defined('LABEL_DEBUG')): ?><!--LISTPAGE <!--news_list_page_listdata01		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>2 )): ?>
<div class="ListMorpic">
<div class="ListMorpic" onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
<a href="<?php echo $rs['url']; ?>"><ul>
<a href="<?php echo $rs['url']; ?>">
<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if(($i<4)): ?>
	<li><span><img src="<?php echo $pic['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></span></li>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>
</a>
</ul>
</a>
</div>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo date("Y-m-d",$rs['create_time']); ?></dd></dl>
</div>	
<?php elseif(( $rs['picurl']!='' )): ?>
<ul class="pic_word" onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>"></span></a></ol>
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a>
		<p onclick="window.location.href='<?php echo $rs['url']; ?>'"><?php echo get_word($rs['content'],94); ?></p>
	</div>
</li>
</ul>
<div>
	<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo date("Y-m-d",$rs['create_time']); ?></dd></dl>
	<!--<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>-->
</div>
<?php else: ?>
<ul class="pic_word" onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
	<p onclick="window.location.href='<?php echo $rs['url']; ?>'"><?php echo get_word($rs['content'],94); ?></p>
</li>
</ul>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo date("Y-m-d",$rs['create_time']); ?></dd></dl>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> LISTPAGE--><?php endif; $__array__=fun('label@run_listpage_label','news_list_page_listdata01',['mid'=>$mid,'fid'=>$fid,'page'=>$page,'dirname'=>__FILE__,'field'=>'','val'=>'','tpl'=>'','rows'=>'10','where'=>'status=2','status'=>'','order'=>'id desc,view desc','by'=>'desc','cache_time'=>'0']);$pages=$__array__['pages'];$news_list_page_listdata01=$__array__['cfg']; ?> 
	</div>
</div>
	</div>
<script type="text/javascript">
var Mpage = 1;
//显示更多
function ShowMoreList(){
	Mpage++;
//	$.get('<?php fun('label@label_listpage_ajax_url','news_list_page_listdata002'); ?>'+Mpage+'&'+Math.random(),function(res){
//	$.get('<?php fun("label@label_ajax_url","news_list_page_listdata01",__FILE__); ?>'+Mpage,function(res){
	$.get('<?php fun('label@label_listpage_ajax_url','news_list_page_listdata01'); ?>'+Mpage+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
			}else{
				$('.ListConts').append(res.data);
				scroll_get = true;  //这一行仅仅是匹配滚动显示更多.如果没使用滚动特效,可以删除
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}

//滚动显示更多
var scroll_get = true;	//做个标志,不要反反复复的加载
$(document).ready(function () {
	$(window).scroll(function () {
		if (scroll_get==true &&  (400 + $(window).scrollTop())>($(document).height() - $(window).height())) {
			scroll_get = false;
			layer.msg('内容加截中,请稍候',{time:1000});
			ShowMoreList();
		}
	});
});

</script>
</div>
	
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