<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:68:"D:\web\Education\template/index_style/default/bbs\index/pc_index.htm";i:1554195885;s:62:"D:\web\Education\template/index_style/toutiao/index/layout.htm";i:1554718189;s:65:"D:\web\Education\template\index_style\default\index\min_login.htm";i:1554707864;s:65:"D:\web\Education\template\index_style\default\bbs\scroll_sort.htm";i:1548659155;}*/ ?>
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




<link rel="stylesheet" href="/public/static/bbs/list.css">
<div class="MainContainer">
<!-- 栏目列表 -->
<style type="text/css">
.scroll-sort{
	width:1200px;
	margin:auto;
	margin-bottom:10px;
	background:#FFF;
	height:65px;
}
.scroll-sort span a{
	color:#666;
}
.scroll-sort span{
	border-radius:4px;
	margin-left:15px;
	padding-left:13px;
	padding-right:13px;
	font-size:16px;
	line-height:35px;
	margin-top:15px;
	height:35px;
	background:#efefef;
	display:block;
	float:left;
}
.scroll-sort span:hover{
	background:orange;
}
.scroll-sort span:hover a{
	color:#fff;
}
.scroll-sort .choose{
	background:orange;
}
.scroll-sort .choose a{
	color:#fff;
}
.swiper-slide{width: auto!important;}
</style>
<link href="/public/static/libs/swiper/swiper.min.css" rel="stylesheet">
	<div class="scroll-sort">
		<div class="swiper-container">
			<div class="swiper-wrapper">
			<?php if(is_array(sort_config(0)) || sort_config(0) instanceof \think\Collection || sort_config(0) instanceof \think\Paginator): $i = 0; $__LIST__ = sort_config(0);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<span class='swiper-slide <?php if($fid == $rs['id']): ?>choose<?php endif; ?>'><a href="<?php echo urls('content/index',['fid'=>$rs['id']]); ?>"><?php echo $rs['name']; ?></a></span>
			<?php endforeach; endif; else: echo "" ;endif; ?>
			</div>
		</div>
	</div>
<script src="/public/static/libs/swiper/swiper.min.js"></script>
<script>
    $(function () {
        var swiper = new Swiper('.swiper-container', {
            spaceBetween: 0,
            slidesPerView:'auto',
            freeMode: true
        });
    })
</script>
	<div class="Container">
		<div class="LeftCnt"> 
			<dl class="BaseInfo">
				<dt>今日<span id="div_today_post">0</span>帖 昨日<span id="div_yesterday_post">0</span>帖  最高日<span id="div_max_post">0</span>帖 </dt>
				<dd>社区主页<i class="fa fa-pagelines"></i></dd>
			</dl> 
			<div class="ListBox">
				<div class="head">
					<span onclick="listbbs(0,'list')" class="ck">最新回复</span>
					<span onclick="listbbs(1,'id')">最新帖子</span>
					<span onclick="listbbs(2,'status')">推荐帖子</span>
					<span onclick="listbbs(3,'view')">热门帖子</span>					 
				</div>
				<div class="ShowLists">
<!--name是标签名，跟通用标签不能重名，rows取几条数据,order按什么方式排序，list代表可控排序，id即时间,view代表浏览量-->
		<?php if(defined('LABEL_DEBUG')): ?><!--LISTPAGE <!--bbs_list_page_pc		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<ul class="list">
						<li class="icon"><a href="<?php echo get_url('user',['uid'=>$rs['uid']]); ?>" target="_blank"><img src="<?php echo get_user_icon($rs['uid']); ?>" onerror="this.src='/public/static/images/nobody.gif'" ></a></li>
						<li class="info">
							<div class="title"><a target="_blank" href="<?php echo urls('content/show',['id'=>$rs['id']]); ?>"><?php echo $rs['title']; ?></a>
							<?php if($rs['list']>time()): ?><span class="top">顶</span><?php endif; if($rs['status'] == '2'): ?><span class="com">精</span><?php endif; if($rs['view'] > '200'): ?><span class="hot">热</span><?php endif; if((time()-$rs['create_time']<3600*24)): ?><span class="hot">新</span> <?php endif; ?></div>
							<div class="more"><a href="<?php echo get_url('user',['uid'=>$rs['uid']]); ?>" target="_blank"><?php echo $rs['username']; ?></a> <span><i class="fa fa-clock-o"></i><?php echo format_time($rs['create_time'],true); ?> <i class="fa fa-fw fa-user-o"></i>回复: <?php echo $rs['replyuser']; ?> <?php echo format_time($rs['update_time'],true); ?></span></div>
						</li>
						<li class="hits"><i class="si si-eye"></i><?php echo $rs['view']; ?></li>
						<li class="reply"><i class="fa fa-commenting-o"></i><?php echo $rs['replynum']; ?></li>
					</ul>
		  <?php endforeach; endif; else: echo "" ;endif; ?> LISTPAGE--><?php endif; $__array__=fun('label@run_listpage_label','bbs_list_page_pc',['mid'=>$mid,'fid'=>$fid,'page'=>$page,'dirname'=>__FILE__,'field'=>'','val'=>'','tpl'=>'','rows'=>'20','where'=>'','status'=>'1','order'=>'list','by'=>'desc','cache_time'=>'0']);$pages=$__array__['pages'];$bbs_list_page_pc=$__array__['cfg']; ?> 
				</div><!--<?php echo $pages; ?> 这是传统分页-->
				<div class="ShowMoreBBs"><button type="button" onclick="ShowMoreBBs()">查看更多</button></div>
			</div>
		</div>
		<div class="RightCnt">
			<div class="RightSide">
				<dl class="RightBase">
					<dt>
						<a href="<?php echo urls('content/add'); ?>"><button type="button">发表新贴</button></a>
						 <ul><ol><span>主题 </span><em id="div_total_topic">00</em></ol> <li><span>帖子 </span><em id="div_total_post">00</em></li></ul>
						<div>共 <span id="div_total_member">20</span> 位会员 欢迎新会员 <a href="#" id="div_new_member">xxx</a></div> 
					</dt>
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
		$("#div_max_post").html(day_top_post);
		
	});

	$.get("<?php echo urls('index/wxapp.member/get_list',['rows'=>1]); ?>",function(res){
		if(res.code==0){
			new_member = res.data[0].username;
			total_member = res.paginate.total;
		}
		$("#div_total_member").html(total_member);
		$("#div_new_member").html(new_member);
	});

});

</script>
				</dl>


				<div class="SideMores">
					<div class="h"><span>精彩内容</span></div>
					<ul class="ListNewfen pc_indexpage">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_indexpage	bbs	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<li><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></li>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $pc_indexpage = fun('label@run_label','pc_indexpage',['val'=>'','list'=>'rs','systype'=>'bbs','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'8','class'=>'','order'=>'status','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'pc_indexpage','cache_time'=>'0'  ]); ?>
					</ul>
					<div class="MOreShow msnewfen"><button type="button" onclick="MoreShowNewfen('<?php fun("label@label_ajax_url","pc_indexpage",__FILE__); ?>')">更多<i class="fa fa-chevron-down"></i></button></div>
				</div>
<script type="text/javascript">
var M_s_page = 1;
function MoreShowNewfen(url){
	M_s_page++;
	$.get(url+M_s_page,function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.msnewfen').hide();
			}else{
				$('.ListNewfen').append(res.data);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
</script>

				<div class="SideMores" style="display: none;">
					<div class="h"><span>活跃</span></div>
					<ul class="ListMember pc_qun_list_member">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_qun_list_member	qun	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<li><a href="<?php echo $rs['url']; ?>" target="_blank" title="<?php echo get_word($rs['content'],200); ?>"><span><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"  onmouseover="changeShowImg($(this),'over');" onmouseout="changeShowImg($(this),'out');" ></span><em><?php echo $rs['title']; ?></em></a></li>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $pc_qun_list_member = fun('label@run_label','pc_qun_list_member',['val'=>'','list'=>'rs','systype'=>'qun','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'6','class'=>'','order'=>'list','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'pc_qun_list_member','cache_time'=>'0'  ]); ?>

					</ul>
					<script type="text/javascript">
						function changeShowImg(obj,mouse){
							if(mouse=='over'){
								obj.animate({"width":"150%","height":"150%"},300);
							}else if(mouse=='out'){
								obj.animate({"width":"100%","height":"100%"},300);
							}
						}
					</script>
					<div class="MOreShow"><button class="showMoreShop" type="button" onclick="showMoreMember('<?php fun("label@label_ajax_url","pc_qun_list_member",__FILE__); ?>')">更多<i class="fa fa-chevron-down"></i></button></div>
				</div>
<script type="text/javascript">
var shoppage=1;
function showMoreMember(url){	
	shoppage++;
	$.get(url+shoppage,function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.showMoreShop').attr('onclick','');
				$('.showMoreShop').html('显示完了');
				$('.showMoreShop').css({'background':'#CCC'});
			}else{
				res.data="<div class='pages"+shoppage+"'>"+res.data+"</div>";			
				$('.ListMember').append(res.data);
				$('.ListMember .pages'+shoppage).hide();
				$('.ListMember .pages'+shoppage).show(500);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
</script>				
				<dl class="RightBase" style="margin-top:20px;">
					<dd>
						<div class="h"><span>热门分类</span></div>
						<ul>
<?php if(is_array(sort_config(0)) || sort_config(0) instanceof \think\Collection || sort_config(0) instanceof \think\Paginator): $i = 0; $__LIST__ = sort_config(0);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
							<li><a href="<?php echo urls('content/index',['fid'=>$rs['id']]); ?>" <?php if($fid == $rs['id']): ?>class="ck"<?php endif; ?>><?php echo $rs['name']; ?></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</dd>
				</dl>

				<div class="SideMores">
					<div class="h"><span>友情链接</span></div>
					<ul class="FriendLink" style="display: none;">
						<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_bbsindex_link		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<li><a href="http://www.qibomb.com" target="_blank">齐博模板网</a></li>
						<li><a href="http://www.qibomoban.com" target="_blank">齐博模板堂</a></li>
						<li><a href="http://www.admin5.net/" target="_blank">A5站长网</a></li>
						<li><a href="http://www.im286.com/" target="_blank">落伍者</a></li>
						<li><a href="http://www.qibosoft.com" target="_blank">齐博软件</a></li>
						<li><a href="http://www.chinaccnet.com/" target="_blank">中电云集</a></li>
						  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $pc_bbsindex_link = fun('label@run_label','pc_bbsindex_link',['val'=>'','list'=>'rs','systype'=>'','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
					</ul>
				</div>
				<dl class="WXcode" style="display: none;">
					<dt>扫一扫访问手机版</dt>
					<dd>
					<img src="<?php echo get_qrcode(get_url('location')); ?>"/>
					</dd>
				</dl>
			</div>
		</div>
	</div>
</div>
<div class="topUpCont">
    <ul>
    	<ol><i class="fa fa-angle-double-up"></i></ol>
        <li>回到顶部</li>
    </ul>
</div>

<script type="text/javascript">
var Mpage=1;
var byorder='list';
var showmorebbs='<button type="button" onclick="ShowMoreBBs()">查看更多</button>';
function ShowMoreBBs(){
	Mpage++;
	$('.ShowMoreBBs').html('内容加载中……');
	$.get('<?php fun('label@label_listpage_ajax_url','bbs_list_page_pc'); ?>'+Mpage+'&order='+byorder+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.ShowMoreBBs').html('');
			}else{				
				$('.ShowLists').append("<span class='Mpage"+Mpage+"'></span>");
				$('.Mpage'+Mpage).hide();
				$('.Mpage'+Mpage).html(res.data);
				$('.Mpage'+Mpage).fadeIn();
				$('.ShowMoreBBs').html(showmorebbs);
				scroll_get = true;
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
			ShowMoreBBs();
		}
	});
});


function listbbs(num,order){
	Mpage=1;
	byorder=order;
	$('.ListBox .head span').removeClass('ck');
	$('.ListBox .head span').eq(num).addClass('ck');
	$.get('<?php fun('label@label_listpage_ajax_url','bbs_list_page_pc'); ?>'+Mpage+'&order='+byorder+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("没有相应的帖子！",{time:500});
				$('.ShowLists').html('');
				$('.ShowMoreBBs').html('');
			}else{
				$('.ShowLists').html("<span class='Mpage"+Mpage+"'></span>");
				$('.Mpage'+Mpage).hide();
				$('.Mpage'+Mpage).html(res.data);
				$('.Mpage'+Mpage).fadeIn();
				$('.ShowMoreBBs').html(showmorebbs);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
$(document).ready(function () {	
	var rightBoxH = $('.RightSide').height();	//右边页面的高度	
	var headBoxH = $('.RightBase').offset().top;	//元素距离网页顶部的距离
	$(window).scroll(function () {
		var scroll_Height = $(window).scrollTop(); //页面滚动的高度距离
		if(scroll_Height>rightBoxH+headBoxH){
			$('.RightBase').addClass('RightBase1'); //让右边漂浮起来
			var thistopH = scroll_Height-headBoxH;	//靠在页面的顶部
			$(".RightBase").css({'top':thistopH+'px'});
		}else{
			$('.RightBase').removeClass('RightBase1');
		}
		if (scroll_Height > 100) {
			$(".topUpCont").show();
		} else {
			$(".topUpCont").hide();
		}		
	});
	$(".topUpCont").click(function () {
		$("html,body").animate({scrollTop:0},500);
	});
});	

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