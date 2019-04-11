<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:74:"D:\web\Education\template/index_style/default/giftshop\content/pc_list.htm";i:1547462930;s:62:"D:\web\Education\template/index_style/toutiao/index/layout.htm";i:1554714292;s:65:"D:\web\Education\template\index_style\default\index\min_login.htm";i:1554707864;s:66:"D:\web\Education\template\index_style\default\cms\content\left.htm";i:1554717156;s:78:"D:\web\Education\template\index_style\default\giftshop\content\pclistshop4.htm";i:1547462930;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo del_html(get_sort($fid,'seo_title')?:get_sort($fid)); ?></title>
<meta name="keywords" content='<?php echo del_html(get_sort($fid,'seo_keywords')?:get_sort($fid)); ?>'>
<meta name="description" content='<?php echo get_sort($fid,'seo_description'); ?>'>
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


<link rel="stylesheet" href="/public/static/index/default/pclist.css">
<div class="ArticlMainContainer">
	<div class="LeftsCnt">
		<link rel="stylesheet" href="/public/static/index/default/left.css">
<div class="LeftBoxInfo">
	<ul class="sorts">
		<?php $_result=getArray(fun('Sort@son',intval($fid))?:fun('Sort@brother',$fid));if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$name): $mod = ($i % 2 );++$i;?>
			<li <?php if($key == $fid): ?>class='ck'<?php endif; ?>><a href="<?php echo urls('content/index',"fid=$key"); ?>"><?php echo $name; ?></a></li>
		<?php endforeach; endif; else: echo "" ;endif; ?>
	</ul>
	<div class="contact">
<?php if((modules_config('qun')&&$qun=fun('qun@getByuid',$info['uid'])[0])): ?>
		<div class="head">信息</div>
		<div class="cnt">
			<ul class="qq">
				<a href="<?php echo urls('qun/content/show',['id'=>$qun['id']]); ?>" style="color:red;" target="_blank"><img src="<?php echo tempdir($qun['picurl']); ?>" style="max-width:180px;" onerror="this.src='/public/static/images/nopic.png'">
				<br>
				<?php echo $qun['title']; ?></a>
			</ul>
			<ul class="time">
				<ol><i class="fa fa-bar-chart-o"></i> 信息</ol>
				<li>圈主：<a href="<?php echo get_url('user',$qun['uid']); ?>" target="_blank"><?php echo get_user_name($qun['uid']); ?></a></li>
				<li>粉丝：<?php echo $qun['usernum']; ?> 人</li>
				<li>人气：<?php echo $qun['view']; ?> 关注度</li>
			</ul>
			<ul class="tel">
				<ol><i class="glyphicon glyphicon-flag"></i> 联系方式</ol>
				<li>电话：<a href="tel:<?php echo $qun['telphone']; ?>"><?php echo $qun['telphone']; ?></a></li>
				<li>地址：<?php echo $qun['address']; ?></li>
			</ul>
		</div>
<?php else: ?>
		<div class="head" style="display: none;">联系我们</div>
		<div class="cnt" style="display: none;">
		<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--left_address001	text	-->
			<ul class="qq">
				<li><a title="程序购买咨询" href=" http://wpa.qq.com/msgrd?v=3&uin=2680867060&site=qq&menu=yes" target="_blank"><img SRC='http://wpa.qq.com/pa?p=1:2680867060:41' ></a></li>
				<li><a title="程序购买咨询" href=" http://wpa.qq.com/msgrd?v=3&uin=81684210&site=qq&menu=yes" target="_blank"><img SRC='http://wpa.qq.com/pa?p=1:81684210:41'></a></li>
			</ul>
			<ul class="time">
				<ol><i class="glyphicon glyphicon-time"></i> 工作时间</ol>
				<li>周一至周五：09:00-17:30</li>
				<li>周六至周日：10:00-16:00</li>
			</ul>
			<ul class="tel">
				<ol><i class="glyphicon glyphicon-headphones"></i> 联系电话</ol>
				<li>唐先生：<a href="tel:15603012345">15603012345</a></li>
			</ul>
		 QB--><?php endif; $left_address001 = fun('label@run_label','left_address001',['val'=>'','list'=>'rs','systype'=>'text','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
		</div>
	
<?php endif; ?>
	</div>
</div>
	</div>
	<div class="RightCnt">
		<!--name是标签名，跟通用标签不能重名，rows取几条数据,order按什么方式排序，list代表可控排序，id即时间,view代表浏览量-->
		<?php if(defined('LABEL_DEBUG')): ?><!--LISTPAGE <!--shop_list01		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="qb_ui_listShop_type4">
	<ul>
		<ol><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"/></a></ol>
		<li>
			<div><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['title'],100); ?></a></div>
			<p><span>需积分:<?php echo $rs['jifen']; ?> 个</span><a href="<?php echo $rs['url']; ?>">兑换</a></p>
		</li>
	</ul>				
</div>
		  <?php endforeach; endif; else: echo "" ;endif; ?> LISTPAGE--><?php endif; $__array__=fun('label@run_listpage_label','shop_list01',['mid'=>$mid,'fid'=>$fid,'page'=>$page,'dirname'=>__FILE__,'field'=>'','val'=>'','tpl'=>'','rows'=>'12','where'=>'','status'=>'','order'=>'list','by'=>'desc','cache_time'=>'0']);$pages=$__array__['pages'];$shop_list01=$__array__['cfg']; ?>
		<div style="clear: both;"></div>
		<?php echo $pages; ?>
	</div>
</div>
<script>
$('.qb_ui_listShop_type4 img').hover(
	function(){
		$(this).animate({"width":"150%"},300);
	},
	function(){
		$(this).animate({"width":"100%"},300);
	}
);
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