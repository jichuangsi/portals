<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:58:"D:\web\x1\template/index_style/default/bbs\index\index.htm";i:1548659155;s:59:"D:\web\x1\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;s:55:"D:\web\x1\template\index_style\default\bbs\post_btn.htm";i:1548659155;s:54:"D:\web\x1\template\index_style\default\index\share.htm";i:1542707408;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo !empty($webdb['mseo_title'])?$webdb['mseo_title']:$webdb['seo_title']; ?></title>
<meta name="keywords" content='<?php echo !empty($webdb['mseo_keyword'])?$webdb['mseo_keyword']:$webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo !empty($webdb['mseo_description'])?$webdb['mseo_description']:$webdb['seo_description']; ?>'>
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

<div class="qb_wap_header">
	<div class="L" onclick="$('.SearchBox').show();"><i class="fa fa-search"> 搜索</i></div>
	论坛主页
	<div class="R" onclick="window.location.href='<?php echo get_url('member'); ?>'"><i class="fa fa-user-circle-o"> 会员</i></div>
</div>

	<style type="text/css">
	.SearchBox{
		padding: 10px 10px 0 10px;
	}
	.SearchBox ul{
		display: table;
		width: 100%;
		background: #FFF;
		border-radius: 5px;
	}
	.SearchBox ul ol,.SearchBox ul li{
		display: table-cell;
		vertical-align: middle;	
	}
	.SearchBox ul li{
		width:35px;
	}
	.SearchBox ul li button{
		width:100%;
		height: 35px;
		border: 0px;
		background: none;
		outline: none;
		font-size:20px;
		color: #AAA;
	}
	.SearchBox ul ol{
		padding-left: 5px;
	}
	.SearchBox ul ol input{
		width: 100%;
		border: 0px;
		line-height: 35px;
		outline: none;
		text-indent: 5px;
	}
	</style>
	<div class="SearchBox" style="display:none;">
		<form method="POST" action="<?php echo urls('search/index'); ?>">
			<ul>
				<ol><input name="keyword" type="text" placeholder="请输入关键字"/></ol>
				<li><button type="submit"><i class="fa fa-search"></i></button></li>
			</ul>
		</form>
	</div>





<script type="text/javascript" src="/public/static/mui/js/mui.min.js"></script>
<link rel="stylesheet" href="/public/static/index/default/slider.css">
<div id="slider" class="mui-slider" >

<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--wap_bbs_rollpic001	images	-->
<!--
		<div class="mui-slider-group mui-slider-loop">
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/public/static/group/circle/wapbanner.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/group/circle/wapbanner.jpg"></a></div> 
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/public/static/group/circle/wapbanner.jpg"></a></div>
		</div>
		<div class="mui-slider-indicator">
			<div class="mui-indicator mui-active"></div>
			<div class="mui-indicator"></div> 
		</div>
-->
		<div class="mui-slider-group mui-slider-loop">
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="<?php echo end($picdb)['picurl']; ?>"></a></div>
			<?php if(is_array($picdb) || $picdb instanceof \think\Collection || $picdb instanceof \think\Paginator): $i = 0; $__LIST__ = $picdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?><div class="mui-slider-item"><a href="#"><img src="<?php echo $rs['picurl']; ?>"></a></div> <?php endforeach; endif; else: echo "" ;endif; ?>
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="<?php echo array_shift($picdb)['picurl']; ?>"></a></div>
		</div>
		<div class="mui-slider-indicator">
			<div class="mui-indicator mui-active"></div>
			<?php if(is_array($picdb) || $picdb instanceof \think\Collection || $picdb instanceof \think\Paginator): $i = 0; $__LIST__ = $picdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?><div class="mui-indicator"></div> <?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
 QB--><?php endif; $wap_bbs_rollpic001 = fun('label@run_label','wap_bbs_rollpic001',['val'=>'picdb','list'=>'rs','systype'=>'images','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
</div>
<script type="text/javascript" charset="utf-8">var slider = mui("#slider");slider.slider({interval: 3000});</script>



<link rel="stylesheet" href="/public/static/bbs/list1.css">
<div class="bbsContainer">

<!--
<style type="text/css">
.category-head{width:100%;background:#fff;margin:10px 0 10px 0;padding:8px 0 5px 0;display: inline;white-space: nowrap;overflow-x:scroll;float:left;overflow-y:hidden}
.category-head li{display:inline-block;height:30px;padding-left:15px;}
</style>
<ul class="category-head">
<?php $_result=sort_config('',0);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
       <li><a href="<?php echo urls('content/index',['fid'=>$key]); ?>"><?php echo $rs; ?></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
-->

<!--
	<ul class="topBoxs">
		<li class="logo"><a href="/"><img src="/public/static/bbs/logo1.png"></a></li>
		<li class="info"><span>齐博官方论坛</span><em>会员2540位</em></li>
		<li class="atten"><a href="<?php echo urls('content/add',['fid'=>$fid]); ?>">发表</a></li>
	</ul>
	 
	<div class="countInfo">
		<ul>
			<ol><span>主题</span><em>2188</em>篇</ol>
			<li><span>浏览</span><em>12312</em>次</li>
		</ul>
	</div>
-->


<!--分类开始-->
<style type="text/css">
.MainMenu{
	margin-top:8px;
	background: #FFF;
	padding: 15px 10px;
}
.MainMenu ul:after{
	content: '';
	display:block;
	clear: both;
}
.MainMenu ul li{
	width:25%;
	float: left;
	overflow: hidden;
	position: relative;
	margin-bottom:5px;
}
.MainMenu ul li span,.MainMenu ul li em{
	display: block;
	width:60px;
	overflow: hidden;
	margin: auto;
	text-align: center;
	position: relative;
}
.MainMenu ul li span{
	border-radius: 50%;
	background: #23C075;
	color: #FFF;
}
.MainMenu ul li em{
	height: 20px;
	overflow: hidden;
	font-size:14px;
}
.MainMenu ul li:nth-child(2) span{
	background: #F90;
}
.MainMenu ul li:nth-child(3) span{
	background: #B01FE0;
}
.MainMenu ul li:nth-child(4) span{
	background: #133CD7;
}
.MainMenu ul li:nth-child(5) span{
	background: #B0B928;
}
.MainMenu ul li:nth-child(6) span{
	background: #B28C49;
}
.MainMenu ul li:nth-child(7) span{
	background: #B66CDC;
}
.MainMenu ul li:nth-child(8) span{
	background: #6359BE;
}
.MainMenu ul li span:before{
	content: '';
	display: block;
	padding-top: 100%;
}
.MainMenu ul li span i{
	position: absolute;
	left:50%;
	top: 50%;
	font-size:30px;
  -webkit-transform: translate3D(-50%, -50%, 0);
      -ms-transform: translate3D(-50%, -50%, 0);
          transform: translate3D(-50%, -50%, 0);
}
.sort_button{
	width:100%;
}
.sort_button .swiper-pagination{
	bottom:0px !important;
}
</style>
<!-- 滑动按钮要用到的CSS与JS文件,他涉及到三个class类 swiper-container swiper-wrapper swiper-slide -->
<link href="/public/static/libs/swiper/swiper.min.css" rel="stylesheet">
<script src="/public/static/libs/swiper/swiper.min.js"></script>
<script>
    $(function () {
        var swiper = new Swiper('.sort_button', {
			autoplay: {
				delay: 3000,
			 },
			pagination: {
				el: '.swiper-pagination', 
			},
        });
    })
</script>
<div class="MainMenu">
		<ul>
			<div class="swiper-container sort_button">
					<div class="swiper-wrapper">
<!--每行4个,可以把4改成8即变成两行-->
<?php $_result=array_chunk(sort_config('',0),8,true);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$array): $mod = ($i % 2 );++$i;?>
<div class="swiper-slide">
<?php if(is_array($array) || $array instanceof \think\Collection || $array instanceof \think\Paginator): $i = 0; $__LIST__ = $array;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$name): $mod = ($i % 2 );++$i;?>
						<li><a href="<?php echo urls('content/index',['fid'=>$key]); ?>"><span><i class="<?php echo (get_sort($key,'logo') ?: 'fa fa-leaf'); ?>"></i></span><em><?php echo $name; ?></em></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</div>
<?php endforeach; endif; else: echo "" ;endif; ?>
					</div>
					<div class="swiper-pagination"></div>
			</div>
		</ul>
</div>
<!--分类结束 -->


	<ul class="topBoxs">		 
		<!--<li class="atten"><a href="<?php echo urls('content/add',['fid'=>$fid]); ?>">我要发表</a></li>-->
	</ul>


<!--滚动开始-->
<style type="text/css">
.auto-roll{
	height:35px;
	overflow:hidden;
	background:#fff;
	margin-top:10px;
}
.auto-roll li{
	padding-left:8px;
	line-height:35px;
}
.auto-roll li dd{
	width:50%;
}
.auto-roll li dd:nth-child(1){
	float:left;
}
.auto-roll li dd:nth-child(2){
	float:right;
}
.auto-roll li i:nth-child(1){
	color:orange;
	margin-right:7px;
}
.auto-roll li a{
	color:orange;
}
</style>
	<div class="auto-roll">
		<ul class="qun_wapindex_r001">			 
			<li><dd><i class="si si-calendar"></i>今日发贴: <a id="div_today_post">0</a> 篇</dd> <dd><i class="fa fa-calendar"></i>昨日发贴: <a id="div_yesterday_post">0</a> 篇</dd></li>
			<li><dd><i class="fa fa-file-o"></i>共有主题: <a id="div_total_topic">0</a> 篇</dd> <dd><i class="fa fa-fire"></i>共有贴子: <a id="div_total_post">0</a> 篇</dd></li>
			<li><dd><i class="fa fa-user-circle"></i>总共会员: <a id="div_total_member">1</a> 位</dd> <dd><i class="fa fa-child"></i>最高日发贴: <a id="div_day_top_post">1</a> 篇</dd></li>
			<li><dd style="width:100%;"><i class="fa fa-user-o"></i>欢迎新人: <a id="div_new_member"></a></dd></li>
		</ul>
	</div>
<script type="text/javascript"> 
	$.get("<?php echo urls('index/wxapp.member/get_list',['rows'=>1]); ?>",function(res){
		if(res.code==0){
			new_member = res.data[0].username;
			total_member = res.paginate.total;
		}
		$("#div_total_member").html(total_member);
		$("#div_new_member").html(new_member);
	});
    function autoScroll(obj){  
		$(obj).find("ul").animate({  
			marginTop : "-35px"  
		},1000,function(){  
			$(this).css({marginTop : "0px"}).find("li:first").appendTo(this);  
		})  
	}  
	$(function(){ 
		var scroll=setInterval('autoScroll(".auto-roll")',2500);
         $(".auto-roll").hover(function(){
            console.log("aaa");
            clearInterval(scroll);
         },function(){
            scroll=setInterval('autoScroll(".auto-roll")',2500);
         });
	}); 
</script> 
<!--滚动结束-->



	<div class="ChangeShow">
		<ul class="types">
			<li onclick="ChangeShow(0,'list')" class="ck">新回复</li>
			<li onclick="ChangeShow(1,'id')">新发表</li>
			<li onclick="ChangeShow(2,'status')">推荐</li>
		</ul>
		<!--
		<ul class="ListType">
			<li><a href="#"><span>置顶</span>校园暴力事件频发，为何校园变“江湖”？</a></li>
			<li><a href="#"><em>精华</em>数据告诉你，未来几年升学你要和多少人PK？</a></li>
			<li><a href="#"><i>热门</i>人大女生获吴玉章奖学金 发13篇SCI论文</a></li>
		</ul>-->
	</div>
	 
	<!--
	<div class="countPost">
		<ul>
			<ol><i class="si si-calendar"></i>今日 <span id="div_today_post">0</span> 帖</ol>
			<li><i class="fa fa-calendar"></i>昨日 <span id="div_yesterday_post">0</span> 帖</li>
		</ul>
	</div> 
	-->
<style type="text/css">
.ListInfos .pics{
	height:80px;
	margin-top:5px;
}
.ListInfos .pics dd{
	width:31%;
	margin-right:6px;
	float:left;
	height:80px;	
}
.ListInfos .pics dd img{
	display:none;
}
</style>
	<div class="ListInfos">
		<!--name是标签名，跟通用标签不能重名，rows取几条数据,order按什么方式排序，list代表可控排序，id即时间,view代表浏览量-->
		<?php if(defined('LABEL_DEBUG')): ?><!--LISTPAGE <!--bbs_list_page_wap		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="lists">
			<ul>
				<ol><a href="<?php echo get_url('user',['uid'=>$rs['uid']]); ?>" target="_blank"><img style="border-radius:100%;" src="<?php echo get_user_icon($rs['uid']); ?>" onerror="this.src='/public/static/images/nobody.gif'" ></a><div><span><?php echo get_word($rs['username'],20); ?></span><em><?php echo format_time($rs['create_time'],true); ?> Re: <?php echo get_word($rs['replyuser'],8); ?></em></div></ol>
				<li><i class="fa fa-commenting-o"></i><span><?php echo $rs['replynum']; ?> </span> <label onclick="digg_topic(<?php echo $rs['id']; ?>,this)" style="margin-left:20px;"><i class="fa fa-thumbs-o-up"></i><em><?php echo $rs['agree']; ?></em></label> </li>
			</ul>
			<div class="title" onclick="window.location.href='<?php echo urls('content/show',['id'=>$rs['id']]); ?>'"><a href="<?php echo urls('content/show',['id'=>$rs['id']]); ?>"><?php if(($rs['list']>time())): ?><span>顶</span> <?php elseif(($rs['status']>1)): ?><em>精</em> <?php elseif(($rs['view']>200)): ?><i>热</i>  <?php elseif((time()-$rs['create_time']<3600*24)): ?><i>新</i> <?php endif; ?> <?php echo $rs['title']; ?></a></div>
			<?php $pics=$rs['picurls']?:fun('content@get_images',fun('bbs@getContents',$rs['id'])); if($pics): ?>
			<div class="pics" onclick="window.location.href='<?php echo urls('content/show',['id'=>$rs['id']]); ?>'">
			<?php if(is_array($pics) || $pics instanceof \think\Collection || $pics instanceof \think\Paginator): $i = 0; $__LIST__ = $pics;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;if($i<4): ?><dd style="background:url(<?php echo $vs['picurl']; ?>) no-repeat;background-position:center center;background-size:100% auto;"></dd><?php endif; endforeach; endif; else: echo "" ;endif; ?>
			</div>
			<?php endif; ?>
		</div>
		  <?php endforeach; endif; else: echo "" ;endif; ?> LISTPAGE--><?php endif; $__array__=fun('label@run_listpage_label','bbs_list_page_wap',['mid'=>$mid,'fid'=>$fid,'page'=>$page,'dirname'=>__FILE__,'field'=>'','val'=>'','tpl'=>'','rows'=>'20','where'=>'','status'=>'1','order'=>'list','by'=>'desc','cache_time'=>'0']);$pages=$__array__['pages'];$bbs_list_page_wap=$__array__['cfg']; ?> 		
	</div>
	<div class="ShowMoreInfo"><span onclick="ShowMoreInfo()">加载更多</span></div>
</div>
<script type="text/javascript">
//点赞
function digg_topic(id,obj){
	layer.msg("提交中,请稍候！",{time:500});
	$(obj).find('em').css({'color':'blue'});
	$.get("<?php echo urls('wxapp.post/agree'); ?>?id="+id,function(res){
		layer.closeAll();
		if(res.code==0){
			var num =  $(obj).find('em').html();
			num++;
			$(obj).find('em').html(num);
			layer.msg("点赞成功！",{time:500});
		}else{
			layer.msg("点赞失败:"+res.msg,{time:2500});
		}	
	});
}

var Mpage=1;
var byorder='id';
var showmorebbs='<span onclick="ShowMoreInfo()">加载更多</span>';
function ShowMoreInfo(){
	Mpage++;
	$('.ShowMoreInfo').html('内容加载中……');
	$.get('<?php fun('label@label_listpage_ajax_url','bbs_list_page_wap'); ?>'+Mpage+'&order='+byorder+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.ShowMoreInfo').html('');
			}else{
				$('.ListInfos').append("<span class='Mpage"+Mpage+"'></span>");
				$('.Mpage'+Mpage).hide();
				$('.Mpage'+Mpage).html(res.data);
				$('.Mpage'+Mpage).fadeIn();
				$('.ShowMoreInfo').html(showmorebbs);
				scroll_get = true;
			}
		}else{
			layer.msg(res.msg,{time:1000});
		}
	});
}

//滚动显示更多
var scroll_get = true;	//做个标志,不要反反复复的加载
$(document).ready(function () {
	$(window).scroll(function () {
		if (scroll_get==true &&  (400 + $(window).scrollTop())>($(document).height() - $(window).height())) {
			scroll_get = false;			
			layer.msg('内容加截中,请稍候',{time:1500});
			ShowMoreInfo();
		}
	});
});


function ChangeShow(num,order){
	Mpage=1;
	byorder=order;
	$('.ChangeShow .types li').removeClass('ck');
	$('.ChangeShow .types li').eq(num).addClass('ck');
	$.get('<?php fun('label@label_listpage_ajax_url','bbs_list_page_wap'); ?>'+Mpage+'&order='+byorder+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("没有相应的帖子！",{time:500});
				$('.ListInfos').html('');
				$('.ShowMoreInfo').html('');
			}else{
				$('.ListInfos').html("<span class='Mpage"+Mpage+"'></span>");
				$('.Mpage'+Mpage).hide();
				$('.Mpage'+Mpage).html(res.data);
				$('.Mpage'+Mpage).fadeIn();
				$('.ShowMoreInfo').html(showmorebbs);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
//回复帖子 
var replayid=0;
function replaycomment(id){
	replayid=id;
	layer.open({
	  type: 1,
	  title:'我要回复',
	  area: ['90%'], //宽高，高参数忽略
	  content: '<ul class="replayBox"><ol><textarea placeholder="请输入回复内容"></textarea></ol><li><button onclick="replaycomment1();">确定</button><span onclick="layer.closeAll();">取消</span></li></ul>'
	});
}
function replaycomment1(){
	var replaycont=$('.replayBox textarea').val();
	//得到内容回复
	layer.alert(replaycont);
}
</script>

<script type="text/javascript">
$(function(){
	var today_post = 0;
	var yesterday_post = 0;
	var total_post = 0;
	var total_topic = 0;
	var day_top_post = 0;
	var total_member = 1;
	var new_member = '';
	$.get("<?php echo urls('wxapp.infomsg/index'); ?>",function(res){
		if(res.code==0){
			today_post = res.data.today_post;
			yesterday_post = res.data.yesterday_post;
			total_post = res.data.total_post;
			total_topic = res.data.total_topic;
			day_top_post = res.data.day_top_post;
		}
		$("#div_today_post").html(today_post);
		$("#div_yesterday_post").html(yesterday_post);
		$("#div_total_topic").html(total_topic);
		$("#div_total_post").html(total_post);
		$("#div_day_top_post").html(day_top_post);
		$("#div_total_post").html(total_post);
	});

});

</script>


<!-- 发布按钮 -->
<div id="post_btn"  style="background:orange;width:40px;height:40px;line-height:40px;font-size:25px;bottom:70px;position:absolute;z-index:10;cursor:pointer;border-radius:100%;-moz-border-radius:100%;opacity:0.7;color:#fff;position:fixed;right:5px;text-align:center;" onclick="window.location.href='<?php echo urls('content/add',['fid'=>$fid]); ?>'"><span class="fa fa-plus"></span></div>
<script type="text/javascript">
var btn_topValue = 0,// 上次滚动条到顶部的距离  
	btn_interval = null;// 定时器  
document.onscroll = function() {  
	if(btn_interval == null){
		$("#post_btn").fadeOut();	//慢慢隐藏
		btn_interval = setInterval("show_btn()", 1200); //启动定时器，每1秒执行1次  
	}  
	btn_topValue = document.documentElement.scrollTop;
}
function show_btn() {  
	// 判断此刻到顶部的距离是否和1秒前的距离相等  
	if(document.documentElement.scrollTop == btn_topValue) {  
		//alert("scroll bar is stopping!");  
		$("#post_btn").fadeIn();	//慢慢显示
		clearInterval(btn_interval);  
		btn_interval = null; 
	} 
} 
</script>


<!-- 微信分享 -->
<?php $share=['title'=>$webdb['mseo_keyword'],'about'=>$webdb['mseo_description'],'picurl'=>tempdir($webdb['logo'])]; 
$share = is_array($share)?array_merge($info?:[],$share):$info;
isset($share['about'])||$share['about'] = get_word(str_replace(["'","\r","\n","\t",' ','　'],'',del_html($share['content'])),150);
isset($share['link'])||$share['link'] = get_url('location');
preg_match('/^(http:|https:)/',$share['link']) || $share['link'] = request()->domain().$share['link'];
preg_match('/^(http:|https:)/',$share['picurl']) || $share['picurl'] = request()->domain().$share['picurl'];
$share['title'] = str_replace(["'","\r","\n","\t",' ','　'],'',$share['title']);
$share['about'] = str_replace(["'","\r","\n","\t",' ','　'],'',$share['about']);
 ?>
<style>
.Share_Message{ 
	position: fixed; 
	width:100%; 
	height: 100%; 
	background: rgba(0,0,0,0.8);
	z-index: 900000; 
	top:0; 
	left: 0; 
	display: none;
}
.Share_Message div{
	background:url(/public/static/images/sharebg.png) no-repeat right center; 
	width:100%; 
	height:350px; 
	background-size:contain; 
	top:0; 
	display: block;
}
</style>
<script type="text/javascript">
function SharShowMsg(){
	var t = $(document).height();
	$('.Share_Message').html('<div></div>');
	$('.Share_Message').height(t).fadeIn();
}
function SharHiddenMsg() {
	$('.Share_Message').fadeOut();
}
</script>
<div class="Share_Message" onClick="SharHiddenMsg();"></div>
<script src="/public/static/js/jweixin.js"></script>
<script type="text/javascript">

function ShareTimeline(){
    wx.onMenuShareTimeline({
      title: '<?php echo $share['title']; ?>',
      link: '<?php echo $share['link']; ?>',
      imgUrl: '<?php echo $share['picurl']; ?>',
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
        //alert('分享到朋友圈后，每进来一位新用户，你都将获得<?php echo $webdb[CommendRegHongBao]; ?>元红包的奖励，你若取消关注公众号，将不派发！');
      },
      success: function (res) {
        layer.msg('成功分享到朋友圈');
		//window.location.reload();
		//window.location.href='?id=$id&hid=$hid&job=have_shareTimeline';
      },
      cancel: function (res) {
        //alert('系统监测到你没有真正分享到朋友圈，请重新分享！');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });
	wx.showOptionMenu();
	//SharShowMsg();
    //alert('请点击左上角的菜单，然后分享到朋友圈去即可');
}

function ShareAppMessage(){
	wx.onMenuShareAppMessage({
      title: '<?php echo $share['title']; ?>',
      desc: '<?php echo $share['about']; ?>',
      link: '<?php echo $share['link']; ?>',
      imgUrl: '<?php echo $share['picurl']; ?>',
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		//alert('请分享到朋友圈去，分享到微信好友无效！');
      },
      success: function (res) {
		  layer.msg('成功分享到好友');
		//window.location.href='?job=have_shareFriend';
      },
      cancel: function (res) {
        //alert('你已取消操作，建议你重新分享给好友！');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });
    //alert('请点击左上角的菜单，发送给朋友');
}


function wx_share_config(){
	wx.config({
		debug: false,
		appId: '<?php echo weixin_share("appId"); ?>',
		timestamp: <?php echo weixin_share("timestamp")?:0; ?>,
		nonceStr: '<?php echo weixin_share("nonceStr"); ?>',
		signature: '<?php echo weixin_share("signature"); ?>',
		jsApiList: [
			'checkJsApi',
			'onMenuShareTimeline',
			'onMenuShareAppMessage', 
			'hideMenuItems',
			'showMenuItems',
		  ]
	});

	wx.ready(function () {
		//wx.hideOptionMenu();
		ShareTimeline();
		ShareAppMessage();
	});

	wx.error(function (res) {
	  //alert(res.errMsg);
	});
}

var have_load_wx_share_config = false;
window.onload = function(){	//避免jweixin.js没有完全加载进来的情况
	have_load_wx_share_config = true;
	wx_share_config();
};

$(function(){
	//处理window.onload被覆盖的情况
	setTimeout(function(){
		if(have_load_wx_share_config==false){
			wx_share_config();
		}
	},5000);
})

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