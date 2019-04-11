<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:70:"D:\web\Education\template/index_style/toutiao/cms\content/pc_show2.htm";i:1554262063;s:62:"D:\web\Education\template/index_style/toutiao/index/layout.htm";i:1554714292;s:65:"D:\web\Education\template\index_style\default\index\min_login.htm";i:1554707864;s:67:"D:\web\Education\template\index_style\toutiao\cms\content\guide.htm";i:1554715199;s:72:"D:\web\Education\template\index_style\default\cms\content\comment_pc.htm";i:1530867667;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo $info['title']; ?></title>
<meta name="keywords" content='<?php echo $info['title']; ?> <?php echo get_sort($info['fid']); ?>  <?php echo M('name'); ?>'>
<meta name="description" content='<?php echo get_word(del_html($info['content']),300); ?>'>
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
		<li><a href="<?php echo get_url('member'); ?>" target="_blank">进入会员中心</a> <a href="<?php echo get_url('quit'); ?>" target="_blank">安全退出</a></li>
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


<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/guide.css">
<div class="BencandyHead">
	<div class="InBox">
		<dl>
			<dt>
				<ul>
					<ol><a href="/"><img src="/public/static/index/toutiao/logo.png"></a></ol>
					<li>
<a style="display: none;" href='/' class="home">网站首页</a> 

<!-- 频道 -->
<?php $array = config('system_dirname') ? modules_config(config('system_dirname')):''; if($array): $url=iurl(config('system_dirname').'/index/index'); ?>
<a  href="<?php echo $url; ?>"><?php echo $array['name']; ?></a>
<?php endif; ?>
<!-- 栏目 -->
<?php $array=[];if($fid&&$_name=sort_config()[$fid]['name'])$array=empty($array=sort_get_father($fid))?[$fid=>$_name]:$array+[$fid=>$_name];foreach($array AS $key=>$name):$url=iurl(config('system_dirname').'/content/index',['fid'=>$key]); ?>
 -&gt; <a href="<?php echo $url; ?>"><?php echo $name; ?></a>
<?php endforeach; ?>
<!-- 自定义标题与链接 -->
<?php if($link_name!=''): $url=$link_url?$link_url:'#'; ?>
<a href="<?php echo $url; ?>"><?php echo $link_name; ?></a>
<?php endif; ?>
					</li>
				</ul>
			</dt>
			<dd>
				<div class="SearchBox1">
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
			</dd>
		</dl>
	</div>
</div>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/bencandy.css">
<div class="MainContainer">
	<div class="LeftCont">
<div class="bshareBox">
		<div class="comment"><?php echo fun('comment@total',$id); ?></div>
		<div class="bshare-custom">
			<a title="分享到新浪微博" class="bshare-sinaminiblog">微博</a>
			<a title="分享到QQ空间" class="bshare-qzone">Qzone</a>
			<a title="分享到微信" class="bshare-weixin">微信</a>        
			<!--a class="bshare-facebook">On Facebook</a-->			
			<!--a class="bshare-twitter">On Twitter</a-->			
			<!--a title="分享到Google+" class="bshare-gplus"></a-->
			<!--a title="分享到QQ好友" class="bshare-qqim"></a-->
		</div>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
	</div>
	</div>
	<div class="CenterContainer">
<div class="Articletitle"><?php echo $info['title']; ?></div>
		<div class="top_about">
			<?php echo date("Y-m-d H:i:s",$info['create_time']); ?>
			浏览:<span><?php echo $info['view']; ?></span>次
			【<a href="javascript:doZoomSize(18)">大</a> <a href="javascript:doZoomSize(16)">中</a> <a href="javascript:doZoomSize(14)">小</a>】
		</div>
		<div class="ArticleContent">
<!------图片展示开始--------->
<?php if(defined('LABEL_DEBUG')): ?><!--SHOWPAGE <!--pc_photo_show_pic001		-->
<link rel="stylesheet" href="/public/static/css/showimgs.css">
<div class="ShowImgsBox">
	<div class="BigImg">
		<div></div>
		<ul><ol onclick="pravShowImg()"><i class="fa fa-angle-left"></i></ol><li onclick="nextShowImg()"><i class="fa fa-angle-right"></i></li></ul>		
	</div>
	<div class="ListImgs">
		<ul>
		</ul>
		<dl><dt onclick="pravShowImg()"><i class="fa fa-angle-left"></i></dt><dd onclick="nextShowImg()"><i class="fa fa-angle-right"></i></dd></dl>
	</div>
	<div class="ShowContent"><?php echo $info['content']; ?></div>
</div>
<script>
var imgdatas=[
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	{'picurl':'<?php echo $rs['picurl']; ?>','content':'<?php echo $rs['title']; ?>'},
<?php endforeach; endif; else: echo "" ;endif; ?>
];
</script>
<script type="text/javascript" src="/public/static/js/showimgs.js"></script>
 SHOWPAGE--><?php endif; fun('label@run_showpage_label','pc_photo_show_pic001',$info,['page'=>$page,'dirname'=>__FILE__,'tpl'=>'','field'=>'','val'=>'info','cache_time'=>'0']); ?>
<!------图片展示结束--------->
		</div>
				<!--自定义字段-->
		<?php if(defined('LABEL_DEBUG')): ?><!--SHOWPAGE <!--d41d8cd98f00b204e9800998ecf8427e		--><?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
       <div class="SideBox">
			<div class="tag"><span><?php echo $rs['title']; ?></span></div>
			<div class="cont"><?php echo $rs['value']; ?></div>
		</div>
  <?php endforeach; endif; else: echo "" ;endif; ?> SHOWPAGE--><?php endif; fun('label@run_showpage_label','d41d8cd98f00b204e9800998ecf8427e',$info,['page'=>$page,'dirname'=>__FILE__,'tpl'=>'','field'=>'picurl,title,content,pics','val'=>'info','cache_time'=>'0']); ?>
		<!--引用评论碎片-->
		<?php if(defined('LABEL_DEBUG')): ?><!--COMMENT<!--commentpc01		-->
			﻿
<link rel="stylesheet" href="/public/static/css/pccomment.css"> 
<div class="WapCommentBox">
	<ul class="PostCommentBox1">
		<ol><i class="fa fa-edit"></i><textarea placeholder="发布您的精彩评论"></textarea></ol>
		<li><button type="butter" onclick="post_commentPc()">发表</button></li>		
	</ul>
	<div class="head">
		<div class="tag">全部评论(<?php echo $total; ?>)</div>
	</div>
	<div class="ListComment">
		<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<ul class="lists">
			<ol class="icon"><a href="/"><img src="<?php echo $rs['icon']; ?>" onerror="this.src='/public/static/images/nobody.gif'"/></a></ol>
			<li class="infos">
				<dl>
					<dt><a href="/"><?php echo $rs['username']; ?></a> <span><?php echo $rs['time']; ?></span></dt>
					<dd>
						<em onclick="dingcomment(<?php echo $rs['id']; ?>)"><i class="si si-like"></i> <a class="agree<?php echo $rs['id']; ?>"><?php echo $rs['agree']; ?></a></em> 
						<span onclick="post_comment(<?php echo $rs['id']; ?>)"><i class="fa fa-commenting-o"></i> 回复</span>
					</dd>
				</dl>
				<div class="comment"><?php echo $rs['content']; ?></div>				
				<div class="repalyinfs repalyinfs<?php echo $rs['id']; ?>">
					<?php if(is_array($rs['children']) || $rs['children'] instanceof \think\Collection || $rs['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<div><a href="/"><?php echo (isset($vo['username']) && ($vo['username'] !== '')?$vo['username']:'游客'); ?>：</a><?php echo $vo['content']; ?></div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
			</li>
		</ul>
		<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
	<div class="ShowMoreComment"><button type="butter" onclick="ShowMoreComment()">更多评论 <i class="fa fa-angle-double-down"></i></button></div>
</div>
<script type="text/javascript">
	var posturl="{posturl}";
	var repalyid=0;
	var commentpage=1;
	function post_comment(pid){			
		if(pid>0){
			repalyid=pid;
			posturl=posturl+"?pid="+pid;
		}
		layer.open({
		  type: 1,
		  skin: 'layui-layer-demo', //样式类名
		  area: ['320px', '280px'], //宽高
		  closeBtn: 0, //不显示关闭按钮
		  anim: 2,
		  shadeClose: true, //开启遮罩关闭
		  content: '<ul class="PostCommentBox"><ol><textarea placeholder="请输入评论内容"></textarea></ol><li><button type="butter" onclick="post_comment1()">发表</button><button type="butter" onclick="layer.closeAll()">取消</button></li></ul>'
		});
	}
	
	//引用评论
	function post_comment1(){
		var contents=$('.PostCommentBox textarea').val();
		if(contents==''){
			layer.alert("请输入评论内容！");
		}else{
			$.post(
				posturl,
				{content:contents},
				function(res,status){
					if(res.code==0){
						if(repalyid>0){
							$('.repalyinfs'+repalyid).html(res.data);
						}else{
							$('.ListComment').html(res.data);
							commentpage=1;
							//$('.ShowMoreComment').fadeIn();
						}
						layer.closeAll(); //疯狂模式，关闭所有层
						layer.msg('发表成功！');
						HiddenShowMoreComment();
					}else{
						layer.alert('评论发表失败:'+res.msg);
					}
				}
			);				
		}			
	}
	
	
	function post_commentPc(){
		var contents=$('.PostCommentBox1 textarea').val();
		if(contents==''){
			layer.alert("请输入评论内容！");
		}else{
			$('.PostCommentBox1 textarea').val('评论发表中……');
			$('.PostCommentBox1 li').html('<span>发表中</span>');
			$.post(
				posturl,
				{content:contents},
				function(res,status){
					$('.PostCommentBox1 textarea').val('');
					$('.PostCommentBox1 li').html('<button type="butter" onclick="post_commentPc()">发表</button>');
					if(res.code==0){
						$('.ListComment').html(res.data);
						commentpage=1;
						layer.msg('发表成功！');
						HiddenShowMoreComment();
					}else{
						layer.alert('评论发表失败:'+res.msg);
					}
				}
			);				
		}
	}

	function dingcomment(id){
			var agree=parseInt($('.agree'+id).html());
			$.get('{posturl}?agree=1&id='+id+'&'+Math.random(),function(res){
				if(res.code==0){
					agree++;
					$('.agree'+id).html(agree);
					layer.msg('点赞成功！');
				}else{
					layer.alert('点赞失败:'+res.msg);
				}
			});
	}
		
	function ShowMoreComment(){
			commentpage++;
			$.get('{pageurl}?page='+commentpage+'&'+Math.random(),function(res){
				if(res.code==0){
					if(res.data==''){
						layer.msg('显示完了！');
						$('.ShowMoreComment').fadeOut();
					}else{
						res.data="<div class='pages"+commentpage+"'>"+res.data+"</div>";			
						$('.ListComment').append(res.data);
						$('.ListComment .pages'+commentpage).hide();
						$('.ListComment .pages'+commentpage).show(500);
					}
				}else{
					layer.msg(res.msg,{time:2500});
				}
			});
	}

	function HiddenShowMoreComment(){
			var Comments=$('.ListComment .lists').length;
			if(parseInt(Comments/<?php echo $cfg_array['rows']; ?>)<1){
				$('.ShowMoreComment').hide();
			}else{
				$('.ShowMoreComment').show();
			}
	}

	HiddenShowMoreComment();
</script>
		 COMMENT--><?php endif; fun('label@run_comment_label','commentpc01',$info,['sysid'=>$sysid,'aid'=>$id,'status'=>'','dirname'=>__FILE__,'tpl'=>'','cache_time'=>'0','rows'=>'5','where'=>'','order'=>'','by'=>'']); ?>
		<div class="ListArticBox">
		<?php if(defined('LABEL_DEBUG')): ?><!--LISTPAGE <!--news_list_page_listdata01		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>3 )): ?>

<div class="ListArtic">
<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
<ul class="morpic"><a href="<?php echo $rs['url']; ?>">
<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if(($i<5)): ?>
	<li><span><img src="<?php echo $pic['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></span></li>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>
</a></ul>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id']); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</div>
		
<?php elseif(( $rs['picurl']!='' )): ?>
<div class="ListArtic">
<ul class="pic_word">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>" onmouseover="thisimg_over($(this))" onmouseout="thisimg_out($(this))"></span></a></ol>
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['title'],60); ?></a></div>
<p><?php echo get_word($rs['content'],200); ?></p>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id']); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</li>
</ul>
</div>
<?php else: ?>
<div class="ListArtic">
<ul class="pic_word">
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['title'],60); ?></a></div>
<p><?php echo get_word($rs['content'],200); ?></p>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id']); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</li>
</ul>
</div>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> LISTPAGE--><?php endif; $__array__=fun('label@run_listpage_label','news_list_page_listdata01',['mid'=>$mid,'fid'=>$fid,'page'=>$page,'dirname'=>__FILE__,'field'=>'','val'=>'','tpl'=>'','rows'=>'10','where'=>'','status'=>'','order'=>'list','by'=>'desc','cache_time'=>'0']);$pages=$__array__['pages'];$news_list_page_listdata01=$__array__['cfg']; ?>
		</div>
		<div class="ShowMoreArtic" style="display:none"><img src="/public/static/index/toutiao/timg.gif"><!--span onclick="ShowMoreArtic()">内容加载中</span--></div>
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
		<div class="NewMenmbers" style="display: none;">
			<div class="head"><span>作者专栏</span></div>
			<div class="cont">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--member2	member	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul><ol><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['icon']; ?>" onerror="this.src='/public/static/index/toutiao/nobody.gif'"></a></ol><li><div><?php echo $rs['username']; ?></div><p>注册时间：<?php echo $rs['regdate']; ?></p></li></ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $member2 = fun('label@run_label','member2',['val'=>'','list'=>'rs','systype'=>'member','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
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
		<div class="CopyRightBox" style="display: none;">
			<div>Copyright@<?php echo $webdb[www_url]; ?> all rights reserved <br><a href="http://www.miibeian.gov.cn" target="_blank"><?php echo $webdb[miibeian_gov_cn]; ?></a></div>
    		<div>Powered by <a href="http://www.qibosoft.com" target="_blank">qibosoft <?php echo $qibosoft_Edition; ?></a> Code &copy; 2018 <a href="http://bbs.qibosoft.com/" target="_blank">qibosoft</a></div><?php echo $webdb['copyright']; ?>
		</div>
	</div>
</div>
<script>
function doZoomSize(size){
	$('.ArticleContent').css({'font-size':size+'px'});
	if(size>16){
		$('.ArticleContent').css({'line-height':'35px'});
	}else if(size>13){
		$('.ArticleContent').css({'line-height':'25px'});
	}else{
		$('.ArticleContent').css({'line-height':'20px'});
	}
}
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