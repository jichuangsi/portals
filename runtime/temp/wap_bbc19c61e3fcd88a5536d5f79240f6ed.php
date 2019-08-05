<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:75:"D:\web\Education\portals\template/index_style/default/cms\content/show2.htm";i:1543917232;s:70:"D:\web\Education\portals\template/index_style/default/index/layout.htm";i:1547698940;s:72:"D:\web\Education\portals\template\index_style\default\index\footmenu.htm";i:1547610832;s:72:"D:\web\Education\portals\template\index_style\default\index\weixingz.htm";i:1545726949;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $info['title']; ?></title>
<meta name="keywords" content='<?php echo !empty($info['keywords'])?$info['keywords']:$info['title']; ?>  <?php echo $s_info['name']; ?> '>
<meta name="description" content='<?php echo get_word(del_html($info['content']),300); ?>'>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="/public/static/css/base.css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
</head>
<body>
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_head',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>

<style type="text/css">
.qb_wap_header{
	padding:8px;
	background:#62B3E7;
	color:#fff;
	height:26px;
}
.qb_wap_header a{
	color:#fff;
}
.qb_wap_header div{
	float:left;
}
.qb_wap_header{
	text-align:center;
}
.qb_wap_header .R{
	float:right;
}
</style>


<div class="qb_wap_header">
	<div class="L" onclick="Qibo.goBack('/');"><i class="fa fa-reply"> 返回</i></div>
	<?php if(M('name')): ?> <?php echo M('name'); else: ?> <?php echo $webdb['webname']; endif; ?>
	<div class="R" onclick="window.location.href='<?php echo get_url('member'); ?>'"><i class="fa fa-user-circle-o"> 会员</i></div>
</div>
<!--
<link rel="stylesheet" href="/public/static/index/default/header.css">
<div class="body_Hearcont">
	<ul>
		<ol><a href="/"><img src="<?php echo (tempdir($webdb['logo']) ?: '/public/static/index/default/logo.png'); ?>"></a></ol>
		<li>
		<form method="post" action="<?php echo urls('search/index/lists'); ?>">
		<dl>
			<dt><input type="text" name="keyword" placeholder="请输关键字" required/></dt>
			<dd><button type="submit"><i class="fa fa-search"></i></button></dd>
		</dl>
		</form>
			<div class="HeadMoreMenu">
				<div class="tag"><i class="si si-list" onclick="$('.HeadMoreMenu .lists').fadeIn();$('.HeadMoreMenu .lists div').animate({'width':'50%'},300);"></i></div>
				<div class="lists">
					<label onclick="$('.HeadMoreMenu .lists div').animate({'width':'0%'},300,function(){$('.HeadMoreMenu .lists').fadeOut();});"></label>
					<div>
<?php if(is_array(get_web_menu('wap')) || get_web_menu('wap') instanceof \think\Collection || get_web_menu('wap') instanceof \think\Paginator): $i = 0; $__LIST__ = get_web_menu('wap');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<a href="<?php echo $rs['url']; ?>"><?php echo $rs['name']; ?></a>
	<?php if(!(empty($rs['sons']) || (($rs['sons'] instanceof \think\Collection || $rs['sons'] instanceof \think\Paginator ) && $rs['sons']->isEmpty()))): if(is_array($rs['sons']) || $rs['sons'] instanceof \think\Collection || $rs['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
					<a href="<?php echo $vs['url']; ?>">|-- <?php echo $vs['name']; ?></a>
			<?php endforeach; endif; else: echo "" ;endif; endif; endforeach; endif; else: echo "" ;endif; ?>
						
					</div>
				</div>
			</div>
		</li>
	</ul>
</div>
-->




<link rel="stylesheet" href="/public/static/index/default/showpic.css">

<!-- mui图片特效 对应DIV里的mui-content-padded类 图片要加参数 data-preview-src="" data-preview-group="1" -->
<link rel="stylesheet" href="/public/static/mui/css/mui.min.css">
<link rel="stylesheet" href="/public/static/mui/css/mui.preview.css">

<div class="ShowPhotoCont">
<?php if(defined('LABEL_DEBUG')): ?><!--SHOWPAGE <!--photo_show_pic0		-->
	<div class="PhotoBox mui-content-padded">
		<div class="BigPic"><span><a href="#"><img src="<?php echo $listdb['0']['picurl']; ?>" data-preview-src="" data-preview-group="1" /></a></span></div>
		<ul class="MorePic">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li><span><a href="#"><img src="<?php echo $rs['picurl']; ?>" data-preview-src="" data-preview-group="1"/></a></span></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
		</ul>
	</div>
 SHOWPAGE--><?php endif; fun('label@run_showpage_label','photo_show_pic0',$info,['page'=>$page,'dirname'=>__FILE__,'tpl'=>'','field'=>'','val'=>'info','cache_time'=>'0']); ?>
	<div class="ContentBox">
		<div class="title"><?php echo $info['title']; ?></div>
		<div class="Cont">
			<i class="glyphicon glyphicon-paperclip"></i>
			<?php echo $info['content']; ?>
		</div>
	</div>
	<!--引用评论碎片-->
	<?php if(defined('LABEL_DEBUG')): ?><!--COMMENT<!--commentwap02		comment/wap01--> COMMENT--><?php endif; fun('label@run_comment_label','commentwap02',$info,['sysid'=>$sysid,'aid'=>$id,'status'=>'','dirname'=>__FILE__,'tpl'=>'comment/wap01','cache_time'=>'0','rows'=>'5','where'=>'','order'=>'','by'=>'']); ?>
</div>

<!-- mui图片特效 -->
<script src="/public/static/mui/js/mui.min.js"></script>
<script src="/public/static/mui/js/mui.zoom.js"></script>
<script src="/public/static/mui/js/mui.previewimage.js"></script>
<script>mui.previewImage();</script>

<!-- 微动态自动收录用户感兴趣的主题,时间60代表用户停留60秒将自动收藏 -->
<?php echo fun('sns@fav',$info,60,'系统帮你订阅了本主题,下次本主题有回复,将会通知你'); ?>

<script>
$('.PhotoBox img').hover(
	function(){
		$(this).animate({"width":"150%"},300);
	},
	function(){
		$(this).animate({"width":"100%"},300);
	}
);
</script>

<script type="text/javascript">
//解决MUI链接无法点击的问题
mui('body').on('tap','a',function(){
	window.top.location.href=this.href;
});
</script>

	
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>

	<!--<link rel="stylesheet" href="/public/static/index/default/footer.css">--> 
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
<?php $menu_choose=config('system_dirname')?:(ENTRANCE==='member'?'member':'index'); $_result=fun('page@foot_menu');if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li style="position:relative;"><a href="<?php echo $rs['url']; ?>" <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>style="color:#FFDD33;"<?php endif; ?>><i class="<?php echo (isset($rs['style']) && ($rs['style'] !== '')?$rs['style']:'glyphicon glyphicon-star'); ?>"></i><span><?php echo $rs['name']; ?></span></a>
			<?php if(strstr($rs['url'],'weibo/content/show/id/0')): ?><dd  style="color:#fff;background:orange;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="weibo_msg_num">0</dd><?php endif; if(strstr($rs['url'],'member.php/member/index.html')): ?><dd  style="color:#fff;background:red;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="msg-num">0</dd><?php endif; if(strstr($rs['url'],'member.php/tongji/msg/index.html')): ?><dd  style="color:#fff;background:orange;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="tongji-num">0</dd><?php endif; ?>
			</li>
<?php endforeach; endif; else: echo "" ;endif; ?>

		</ul>
	</div>
</div>


 

<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_foot',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<script type="text/javascript" src="/public/static/js/qibo.js"></script>

<?php if($webdb['weixin_type']==3&&$userdb['weixin_api']!=''): ?>
<script type="text/javascript">
if($.cookie('mp_gz_remind')!='no'&&"<?php echo $userdb['uid']; ?>"!=''){
$.get("<?php echo purl('weixin/check/ifgz',[],'index'); ?>",function(res){
	if(res.code==1){
		layer.open({
			type: 1
			,offset: 'rb'
			,anim:2
			,title:'亲!欢迎关注公众号'
			,area:['280px','280px']
			,content: '<div style="padding: 10px;text-align:center;"><span style="font-size:12px;">你还没有关注公众号,请关注可以享受更多权益!</span><br><img src="<?php echo tempdir($webdb['mp_code_img']); ?>" style="width:180px;height:180px;"></div>'        
			,shade: 0 //不显示遮罩 
			,cancel: function(index, layero){
				$.cookie('mp_gz_remind', 'no', { expires: 60, path: '/' });   //60分钟提醒一次用户关注公众号
			}
		});
	}
});
}
</script>
<?php endif; ?><!--若没有关注微信公众号,就做个提醒-->
</body>
</html>