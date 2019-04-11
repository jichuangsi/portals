<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:66:"D:\web\Education\template/index_style/toutiao/cms\content/list.htm";i:1552445807;s:66:"D:\web\Education\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
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
			<li  onclick="navMenuHideShow()"><span>更多</span></li>
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
.ListMorpic ul li span img{
	height: 100%;	
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
		$('.nav-menu-list').fadeIn();
	}
	function hidenavMenu(){
		$('.nav-menu-list').fadeOut();
	}
</script>
<div class="nav-menu-list" style="display: none;">
				<p><a href="javascript:void(0)" onclick="hidenavMenu()" class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></a> </p>
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
<?php if(is_array(get_sort($fid,'brother')) || get_sort($fid,'brother') instanceof \think\Collection || get_sort($fid,'brother') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort($fid,'brother');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
<dl <?php if($fid==$key): ?>class="ck"<?php endif; ?>>
			<dt><a href="<?php echo urls('index',['fid'=>$key]); ?>"><?php echo $vo; ?></a><span></span></dt>
					<?php if(count(get_sort($key,'name','sons'))>1): ?>
					<dd>
<?php if(!(empty(get_sort($key,'name','sons')) || ((get_sort($key,'name','sons') instanceof \think\Collection || get_sort($key,'name','sons') instanceof \think\Paginator ) && get_sort($key,'name','sons')->isEmpty()))): $_result=get_sort($key,'name','sons');if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
					<a href="<?php echo urls('index',['fid'=>$key]); ?>"><?php echo $vs; ?></a>
			<?php endforeach; endif; else: echo "" ;endif; endif; ?>
	</dd>
	<?php endif; ?>
</dl>
			<?php endforeach; endif; else: echo "" ;endif; ?>
	<div class="exit"><span onClick="HiddenMoreSorts()">关闭</span></div>
</div>
<script>
	$(function(){
//		console.log(<?php echo $fid; ?>);
		$('.body_Hearcont').html('<div onclick="window.location.href=\'/index.php/search/\'" style="display: flex;"> <input style="opacity: 0.8 ;margin: auto;width: 80%;padding: 4px 0px;border-radius: 8px;border: none;outline: none;text-indent: 16px;text-align: center;" placeholder="点击搜索"/> </div>')
//		$('.body_Hearcont').html('<div onclick="window.location.href=\'/index.php/search/\'" style="display: flex;"> <button style="opacity: 0.8 ;margin: auto;width: 80%;padding: 4px 0px;border-radius: 8px;border: none;outline: none;text-indent: 16px;text-align: center;">点击搜索</button> </div>')
		var divwid =$('.BoxIn ul ol div').width();
		$('.BoxIn ul ol div').width((divwid+100));
		$('.BoxIn ul ol div span').prepend('<a href="/index.php/cms/">推荐</a>');
		var binALength=$('.BoxIn ul ol div span a').length;
		for(var i=0;i<binALength;i++){
			if($('.BoxIn ul ol div span a').eq(i).hasClass('ck')){
				if(i>2){
					 var $one_li =$(".BoxIn ul ol div span a:eq("+i+")");   
					 var $two_li = $(".BoxIn ul ol div span a:eq(2)");    
					 $one_li.insertAfter($two_li);   
				}
			}
		}
	});
</script>
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
/*function HiddenMoreSorts(){
	$('.MoreSorts').fadeOut();
}
$('.BigsortBox .BoxIn ul li').click(function(){
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
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/waplist.css">
<div class="nav_guide">当前位置：$GuideFidStr</div>

<div class="MainContainerBox">
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
<!--<?php if(defined('LABEL_DEBUG')): ?><!--LISTPAGE <!--news_list_page_listdata01	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>2 )): ?>
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
<ul class="pic_word" onclick="window.location.href='<?php echo $rs['url']; ?>'">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>"></span></a></ol>
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a>
		<p onclick="window.location.href='<?php echo $rs['url']; ?>'"><?php echo get_word($rs['content'],64); ?></p>
	</div>
</li>
</ul>
<div>
	<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>
</div>
<?php else: ?>
<ul class="pic_word" onclick="window.location.href='<?php echo $rs['url']; ?>'">
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
	<p onclick="window.location.href='<?php echo $rs['url']; ?>'"><?php echo get_word($rs['content'],94); ?></p>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>
</li>
</ul>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> LISTPAGE--><?php endif; $__array__=fun('label@run_listpage_label','news_list_page_listdata01',['mid'=>$mid,'fid'=>$fid,'page'=>$page,'dirname'=>__FILE__,'field'=>'','val'=>'','tpl'=>'','rows'=>'10','where'=>'','status'=>'','order'=>'create_time','by'=>'desc','cache_time'=>'0']);$pages=$__array__['pages'];$news_list_page_listdata01=$__array__['cfg']; ?> -->
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
	<!--<ul class="pic_word">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>"></span></a></ol>
</ul>-->
<?php if(($rs['fid']!=15)): ?>
<ul class="pic_word" onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>"></span></a></ol>
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a>
		<p onclick="window.location.href='<?php echo $rs['url']; ?>'"><?php echo get_word($rs['content'],94); ?></p>
	</div>
</li>
</ul>
<?php else: ?>
<ul onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
	<ol style="position: relative;"><p style="font-weight: bold;text-align: center;"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></p>
		<a href="<?php echo $rs['url']; ?>"><span style="width: 100%;display: flow-root;text-align: center;margin: 10px 0px;"><img style="width: 80%;max-width: 380px;" src="<?php echo $rs['picurl']; ?>"><div style="width: 50px;height: 50px;background: rgba(0,0,0,0.4);border-radius: 50px;position: absolute;top: 46%;left: 45%;display: flex;"><i style="margin: auto;color: #fff;" class="fa fa-play" aria-hidden="true"></i></div></span></a></ol>
</ul>
<?php endif; ?>
<div>
	<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo date("Y-m-d",$rs['create_time']); ?></dd></dl>
	<!--<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>-->
</div>
<?php else: ?>
<ul class="pic_word" onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
	<p><?php echo get_word($rs['content'],94); ?></p>
</li>
</ul>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo date("Y-m-d",$rs['create_time']); ?></dd></dl>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> LISTPAGE--><?php endif; $__array__=fun('label@run_listpage_label','news_list_page_listdata01',['mid'=>$mid,'fid'=>$fid,'page'=>$page,'dirname'=>__FILE__,'field'=>'','val'=>'','tpl'=>'','rows'=>'10','where'=>'status>0','status'=>'','order'=>'id desc,view desc','by'=>'desc','cache_time'=>'0']);$pages=$__array__['pages'];$news_list_page_listdata01=$__array__['cfg']; ?> 
	</div>
</div>

<script type="text/javascript">
var Mpage = 1;
//显示更多
function ShowMoreList(){
	Mpage++;
	$.get('<?php fun('label@label_listpage_ajax_url','news_list_page_listdata01'); ?>'+Mpage,function(res){
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