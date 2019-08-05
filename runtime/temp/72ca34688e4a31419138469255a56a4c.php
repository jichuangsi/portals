<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:73:"D:\web\Education\portals\template/index_style/toutiao/cms\index\index.htm";i:1555325357;s:70:"D:\web\Education\portals\template/index_style/toutiao/index/layout.htm";i:1555325357;s:73:"D:\web\Education\portals\template\index_style\default\index\min_login.htm";i:1554707864;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo !empty($webdb['mseo_title'])?$webdb['mseo_title']:$webdb['seo_title']; ?></title>
<meta name="keywords" content='<?php echo !empty($webdb['mseo_keyword'])?$webdb['mseo_keyword']:$webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo !empty($webdb['mseo_description'])?$webdb['mseo_description']:$webdb['seo_description']; ?>'>
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
		<li><a href="<?php echo get_url('member'); ?>" target="_blank">进入会员中心</a> <a href="<?php echo get_url('quit'); ?>?quiturl=<?php echo get_url('location'); ?>" >安全退出</a></li>
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


<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/index.css">
<div class="MainContainer" >
	<div class="LeftCont">
		<div class="logo"><a href="/"><img style="width: 120px;" src="/public/static/index/toutiao/logo.png"></a></div>
		<ul class="Sorts">	
		<?php $menu_choose=config('system_dirname')?config('system_dirname'):'index'; if(is_array(get_web_menu($pc)) || get_web_menu($pc) instanceof \think\Collection || get_web_menu($pc) instanceof \think\Paginator): $i = 0; $__LIST__ = get_web_menu($pc);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>class="ck"<?php endif; ?>><a href="<?php echo $rs['url']; ?>"><?php echo $rs['name']; ?></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?> 
		</ul>
	</div>
	<div class="CenterContainer">
		<div class="SlideBox">
			
<div class="ShowRollPicBox3" style="width: 680px; height: 400px;display: none;">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--showroll	images	-->
<!--<ul class="bigimg">
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="/public/static/index/toutiao/1_20170513080535_lh301.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="/public/static/index/toutiao/1_20170426090432_44xrf.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="/public/static/index/toutiao/1_20170426090452_ucyia.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="/public/static/index/toutiao/1_20170426090435_2djvz.jpg"></a></li>
</ul>
<input class="width" type="hidden" value="680">
<input class="height" type="hidden" value="400">
<ul class="ListTitle">
<li style=""><span>像我们一样年轻：绘画梦想</span></li>
<li style=""><span>同学两亿岁：外星女狂追校草</span></li>
<li style=""><span>妈妈是超人收官：安迪嗯哼同框</span></li>
<li style=""><span>爱国者：张鲁一佟丽娅精彩谍战</span></li>
</ul>
<div class="pages"><span class="now">1</span>/<span class="all">4</span></div>
<ul class="changeShow"><ol onclick="parv_changSlide3()"></ol><li onclick="next_changSlide3()"></li></ul>-->

<ul class="bigimg">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="<?php echo $rs['picurl']; ?>"></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<input class="width" type="hidden" value="680">
<input class="height" type="hidden" value="400">
<ul class="ListTitle">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li style=""><span><?php echo $rs['title']; ?></span></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<div class="pages"><span class="now"><?php echo $i; ?></span>/<span class="all">4</span></div>
<ul class="changeShow"><ol onclick="parv_changSlide3()"></ol><li onclick="next_changSlide3()"></li></ul>
 QB--><?php endif; $showroll = fun('label@run_label','showroll',['val'=>'listdb','list'=>'rs','systype'=>'images','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
</div>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/rolltype3.css">
<script language="JavaScript" src="/public/static/index/toutiao/jquery-1.2.6.min.js"></script>
<script language="JavaScript" src="/public/static/index/toutiao/rolltype3.js"></script>
		</div>
		<div class="ListArticBox">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--news_list_page_listdata01	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>3 )): ?>

<div class="ListArtic">
<div class="title"><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></div>
<ul class="morpic"><a href="<?php echo $rs['url']; ?>" target="_blank">
<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if(($i<5)): ?>
	<li><span><img src="<?php echo $pic['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></span></li>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>
</a></ul>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id'],'cms'); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</div>
		
<?php elseif(( $rs['picurl']!='' )): ?>
<div class="ListArtic">
<ul class="pic_word">
	<ol><a href="<?php echo $rs['url']; ?>" target="_blank"><span><img src="<?php echo $rs['picurl']; ?>" onmouseover="thisimg_over($(this))" onmouseout="thisimg_out($(this))"></span></a></ol>
	<li><div class="title" target="_blank"><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],60); ?></a></div>
<p><?php echo get_word($rs['content'],200); ?></p>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id'],'cms'); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</li>
</ul>
</div>
<?php else: ?>
<div class="ListArtic">
<ul class="pic_word">
	<li><div class="title"><a  href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],60); ?></a></div>
<p><?php echo get_word($rs['content'],200); ?></p>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id'],'cms'); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</li>
</ul>
</div>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $news_list_page_listdata01 = fun('label@run_label','news_list_page_listdata01',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'15','class'=>'','order'=>'list','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0' ,'mid'=>'-1' ]); ?> 
		</div>
<div class="ShowMoreArtic" style="display:none"><img src="/public/static/index/toutiao/timg.gif"><!--span onclick="ShowMoreArtic()">内容加载中</span--></div>	
	</div>
<script type="text/javascript">
	$(function(){
		window.location.href="/index.php/cms/list-9.html";
	});
var Mpage = 1;
//显示更多
function ShowMoreList(){
	Mpage++;
	$.get('<?php fun("label@label_ajax_url","news_list_page_listdata01",__FILE__); ?>'+Mpage,function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
			}else{
				$('.ListArticBox').append(res.data);
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
	<div class="RightCont">
		<div class="SearchBox">
			<form method="get" action="<?php echo urls('search/index/lists'); ?>" onsubmit="return cksearch();" target="_blank">
				<div class="input"><input id="keyword_s" type="text" name="keyword" placeholder='请输入关键字'/></div>
				<div class="sub"><input name="button" type="submit" value="搜索"/></div>
    		</form>
<script type="text/javascript">
<!--
function cksearch(){
	if ($('#keyword_s').val()==''){
		layer.alert("关键字不能为空");
		return false;
	}
}
//-->
</script> 
		</div>
		<div class="RightAdBox" style="display: none;"><?php if(defined('LABEL_DEBUG')): ?><!--QB <!--jubao	image	--><img src="/public/static/index/toutiao/1_20170424110430_s0csd.png" border="0"> QB--><?php endif; $jubao = fun('label@run_label','jubao',['val'=>'','list'=>'rs','systype'=>'image','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?></div>
		<div class="NewMenmbers" style="display: none;">
			<div class="head"><span>最新会员</span></div>
			<div class="cont">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--member	member	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul><ol><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['icon']; ?>" onerror="this.src='/public/static/index/toutiao/nobody.gif'"></a></ol><li><div><?php echo $rs['username']; ?></div><p>注册时间：<?php echo $rs['regdate']; ?></p></li></ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $member = fun('label@run_label','member',['val'=>'','list'=>'rs','systype'=>'member','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>

			</div>
		</div>
		<div class="HotArticBox">
			<div class="head">热门信息</div>
			<div class="cont cont1">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--toutiaohot	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
			  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $toutiaohot = fun('label@run_label','toutiaohot',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'15','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
			</div>
		</div>
		<div class="HotArticBox" style="display: none;">
			<div class="head">精彩专题</div>
			<div class="Slide">
<div class="ShowRollPicBox1" style="width: 320px; height: 200px;">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--jingcaizhuanti	images	-->
<!--<ul class="bigimg">
<li style="opacity: 0; left: 100%;"><a href="#"><img src="/public/static/index/toutiao/1_20170424100456_ht0o6.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#"><img src="/public/static/index/toutiao/2.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#"><img src="/public/static/index/toutiao/1_20170424100430_wtffg.jpg"></a></li>
</ul>
<input class="width" type="hidden" value="320">
<input class="height" type="hidden" value="200">
<ul class="ListTitle">
<li style="display: list-item;"><span>热身赛-内马尔复出破门 巴西2-0胜</span></li>
<li style="display: none;"><span>收藏版-2018俄罗斯世界杯分组赛程</span></li>
<li style="display: none;"><span>泡沫之夏：三个人的爱情博弈</span></li>
</ul>-->
<ul class="bigimg">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="<?php echo $rs['picurl']; ?>"></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<input class="width" type="hidden" value="320">
<input class="height" type="hidden" value="200">
<ul class="ListTitle">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li style="display: none;"><span><?php echo $rs['title']; ?></span></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
 QB--><?php endif; $jingcaizhuanti = fun('label@run_label','jingcaizhuanti',['val'=>'listdb','list'=>'rs','systype'=>'images','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
</div>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/rolltype1.css">
<script language="JavaScript" src="/public/static/index/toutiao/rolltype1.js"></script>
</div>
			<div class="cont">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--toutiao01	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
			  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $toutiao01 = fun('label@run_label','toutiao01',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
			</div>
		</div>
		<div class="RightSideBox">
			<div class="head"><?php if(defined('LABEL_DEBUG')): ?><!--QB <!--toutiao02	text	--><span>精彩视频</span><a href="#">更多</a> QB--><?php endif; $toutiao02 = fun('label@run_label','toutiao02',['val'=>'','list'=>'rs','systype'=>'text','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?></div>
			<div class="cont">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--toutiao03	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul> 
<ol><a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $rs['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></a></ol>
<li><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></li>
</ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $toutiao03 = fun('label@run_label','toutiao03',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'4','class'=>'','order'=>'','by'=>'','where'=>'ispic|>|0','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>

			</div>
		</div>
		<div class="RightSideBox">
			<div class="head"><?php if(defined('LABEL_DEBUG')): ?><!--QB <!--toutiao04	text	--><span>精彩图片</span><a href="#">更多</a> QB--><?php endif; $toutiao04 = fun('label@run_label','toutiao04',['val'=>'','list'=>'rs','systype'=>'text','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?></div>
			<div class="cont">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--toutiao05	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul> 
<ol><a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $rs['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></a></ol>
<li><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></li>
</ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $toutiao05 = fun('label@run_label','toutiao05',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'4','class'=>'','order'=>'','by'=>'','where'=>'ispic|>|0','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
			</div>
		</div>
		<div class="RightSideBox" >
			<div class="head"><?php if(defined('LABEL_DEBUG')): ?><!--QB <!--toutiao06	text	--><span>推荐商品</span><a href="#">更多</a> QB--><?php endif; $toutiao06 = fun('label@run_label','toutiao06',['val'=>'','list'=>'rs','systype'=>'text','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?></div>
			<div class="cont">
				<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--toutiao07	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul> 
<ol><a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $rs['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></a></ol>
<li><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></li>
</ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $toutiao07 = fun('label@run_label','toutiao07',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'4','class'=>'','order'=>'','by'=>'','where'=>'ispic|>|0','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
			</div>
		</div>
		<div class="FriendLinkBox">
			<div class="head"><span>友情链接</span></div>
			<ul class="picLink">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--links		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(!(empty($rs['picurl']) || (($rs['picurl'] instanceof \think\Collection || $rs['picurl'] instanceof \think\Paginator ) && $rs['picurl']->isEmpty()))): ?>
        <li><a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $rs['picurl']; ?>" title="<?php echo $rs['title']; ?>" /></a></li>
        <?php else: ?>
        <li><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></li>
        <?php endif; endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $links = fun('label@run_label','links',['val'=>'','list'=>'rs','systype'=>'','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'9','class'=>'plugins\links\index\Link@labelShow','order'=>'','by'=>'','where'=>'status=1','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
             

			</ul>
		</div>
		<div class="CopyRightBox" style="display: none;">
			<div >Copyright@<?php echo $webdb[www_url]; ?> all rights reserved <br><a href="http://www.miibeian.gov.cn" target="_blank"><?php echo $webdb[miibeian_gov_cn]; ?></a></div>
		</div>
	</div>
</div>
<script>
//	$(function(){
//		window.location.href='http://su212.net/';
//	});
$(document).ready(function () {
	var rightBoxH=$('.MainContainer .RightCont').height();
	$(window).scroll(function () {
		var scroll_Height=$(window).scrollTop();
		if (scroll_Height > 50) {
			$(".MainContainer .LeftCont").css({'top':scroll_Height+'px'});
		}else{
			$(".MainContainer .LeftCont").css({'top':'0px'});
		}
		if(scroll_Height>rightBoxH){
			$('.HotArticBox').addClass('HotArticBox1');
			$(".HotArticBox").css({'top':scroll_Height+'px'});
		}else{
			$('.HotArticBox').removeClass('HotArticBox1');
		}
		if($('body').height()-scroll_Height<1300 && check_showMore==1){
			ShowMoreArtic();
		}
	});
});
$('.RightSideBox .cont ul ol a img').hover(
	function(){
		$(this).animate({"max-width":"120%","max-height":"120%"},100);
	},
	function(){
		$(this).animate({"max-width":"100%","max-height":"100%"},100);
	}
);
function thisimg_over(objs){
	objs.animate({"max-width":"120%","max-height":"120%"},100);
}
function thisimg_out(objs){
	objs.animate({"max-width":"100%","max-height":"100%"},100);
}
</script>

<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/foot.css">
<div id="copyright" style="display: none;">
    <div>Copyright@<?php echo $webdb[www_url]; ?> all rights reserved <a href="http://www.miibeian.gov.cn" target="_blank"><?php echo $webdb['miibeian_gov_cn']; ?></a></div>
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