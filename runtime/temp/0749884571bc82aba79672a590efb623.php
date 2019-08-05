<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:74:"D:\web\Education\portals\template/admin_style/blansj/admin\index\index.htm";i:1548153504;}*/ ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta charset="UTF-8">
	<title>后台管理中心</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" type="text/css" href="/public/static/blansj_admin/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/public/static/blansj_admin/css/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="/public/static/blansj_admin/css/adminstyle.css" media="all">
	<link rel="stylesheet" href="/public/static/icon/icon.css">	
	<style type="text/css">.left_menu{display:none;}</style>
</head>
<body>
	<script>
	</script>
<div class="layui-layout layui-layout-admin" id="layui_layout">
	<!-- 顶部区域 -->
	<div class="layui-header header header-demo">
		<div class="layui-main">
		    <!-- logo区域 -->
			<div class="admin-logo-box">
				<a class="logo" href="<?php echo urls('index/sysinfo'); ?>" target="main-iframe" title="logo"></a>
				<div class="larry-side-menu">
					<i class="fa fa-bars" aria-hidden="true"></i>
				</div>
			</div>
            <!-- 顶级菜单区域 -->
            <div class="layui-larry-menu">
                 <ul class="layui-nav clearfix">
				 <?php if(is_array($base_menu) || $base_menu instanceof \think\Collection || $base_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $base_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                       <li class="layui-nav-item <?php if($i == '1'): ?>layui-this<?php endif; ?>" onclick="choose_menu('<?php echo $key; ?>')">
                 	   	   <a href="javascirpt:;"><i class="<?php echo (isset($vo['icon']) && ($vo['icon'] !== '')?$vo['icon']:'fa fa-list-ul'); ?>"></i><?php echo $vo['title']; ?></a>
                 	   </li>
                 <?php endforeach; endif; else: echo "" ;endif; ?>
                 </ul>
            </div>
            <!-- 右侧导航 -->
            <ul class="layui-nav larry-header-item">
            		<li class="layui-nav-item">
            			账户名：<?php echo $userdb['username']; ?> (<?php echo getGroupByid($userdb['groupid']); ?>)
            		</li>
            		<!--<li class="layui-nav-item first">
						<a href="javascript:;">			
							<cite>终端切换</cite>
							<span class="layui-nav-more"></span>
						</a>
						<dl class="layui-nav-child">
							<dd>
								<a href="<?php echo get_url('home'); ?>?in=wap" target="_blank">WAP前台</a>
							</dd>
							<dd>
								<a href="<?php echo get_url('home'); ?>?in=pc" target="_blank">PC前台</a>
							</dd>
							<dd>
								<a href="<?php echo get_url('member'); ?>?in=wap" target="_blank">WAP会员中心</a>
							</dd>
							<dd>
								<a href="<?php echo get_url('member'); ?>?in=pc" target="_blank">PC会员中心</a>
							</dd>
						</dl>
					</li>-->
					<!--<li class="layui-nav-item">
						<a href="/" target="_blank" id="lock">
                        <i class="fa fa-fw fa-desktop"></i>
						前台</a>
					</li>-->
					<li class="layui-nav-item">
						<a href="<?php echo urls('index/quit'); ?>">
                        <i class="fa fa-fw fa-power-off"></i>
						退出</a>
					</li>
            </ul>
		</div>
	</div>
	<!-- 左侧侧边导航开始 -->
	<div class="layui-side layui-side-bg layui-larry-side" id="larry-side">
        <div class="layui-side-scroll" id="larry-nav-side" lay-filter="side">
		
		<!-- 左侧菜单 -->
		<ul class="layui-nav layui-nav-tree">
			<li class="layui-nav-item layui-this blbottom">
				<a href="javascript:;" data-url="<?php echo urls('welcome'); ?>">
				    <i class="fa fa-fw fa-home" data-icon='icon-home1'></i>
					<span>后台首页</span>
				</a>
			</li>
<?php if(is_array($base_menu) || $base_menu instanceof \think\Collection || $base_menu instanceof \think\Paginator): $i = 0; $__LIST__ = $base_menu;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>		
			<!-- 1级分类开始 -->
			<em class="left_menu" data-type="<?php echo $key; ?>">
			<?php if(is_array($vo['sons']) || $vo['sons'] instanceof \think\Collection || $vo['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ar): $mod = ($i % 2 );++$i;?>
			<li class="layui-nav-item <?php if($key == '0'): ?>layui-nav-itemed<?php endif; ?> blbottom">
				<a href="javascript:;">
					<i class="<?php echo (isset($ar['icon']) && ($ar['icon'] !== '')?$ar['icon']:'fa fa-sun-o'); ?>" ></i>
					<span><?php echo $ar['title']; ?></span>
					<em class="layui-nav-more"></em>
				</a>
				<dl class="layui-nav-child">
					<!-- 2级分类开始 -->
					<?php if(is_array($ar['sons']) || $ar['sons'] instanceof \think\Collection || $ar['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $ar['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
                    <dd>
                        <a href="javascript:;" data-url="<?php echo $rs['url']; ?>">
                            <span><?php echo $rs['title']; ?></span>
                        </a>
                    </dd>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
					<!-- 2级分类结束 -->
                </dl>
			</li>
			<?php endforeach; endif; else: echo "" ;endif; ?>
			</em>
			<!-- 1级分类结束 -->
			
<?php endforeach; endif; else: echo "" ;endif; ?>
			</ul>
	    </div>
	</div>

	<!-- 左侧侧边导航结束 -->
	<!-- 右侧主体内容 -->
	<div class="layui-body" id="larry-body" style="bottom: 0;border-left: solid 2px #2299ee;">
		<div class="layui-tab layui-tab-card larry-tab-box" id="larry-tab" lay-filter="demo" lay-allowclose="true">
			<div class="go-left key-press pressKey" id="titleLeft" title="滚动至最右侧"><i class="larry-icon larry-weibiaoti6-copy"></i></div>
			<ul class="layui-tab-title">
				<li class="layui-this" id="admin-home"><i class="fa fa-fw fa-home"></i><em>后台首页</em></li>
			</ul>
			<div class="go-right key-press pressKey" id="titleRight" title="滚动至最左侧"><i class="larry-icon larry-right"></i></div> 
			<div class="layui-tab-content" style="min-height: 150px; ">
				<div class="layui-tab-item layui-show">
					<iframe class="larry-iframe" name="main-iframe" data-id='0' src="<?php echo urls('welcome'); ?>"></iframe>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部区域 -->
	<!--<div class="layui-footer layui-larry-foot" id="larry-footer">
		<div class="layui-mian">  
		    <p class="p-admin">
		    	Powered by <a href="http://www.php168.com" target="_blank">qibosoft</a> X1.0 Beta Code ©2003-2018
		    </p>
		</div>
	</div>-->
</div>
             
	<script type="text/javascript" src="/public/static/blansj_admin/layui/layui.js"></script> 
	<script type="text/javascript" src="/public/static/blansj_admin/js/larry.js"></script>
	<script type="text/javascript" src="/public/static/blansj_admin/js/index.js"></script>

<!-- 锁屏插件
<div class="lock-screen" style="display: none;">
	<div id="locker" class="lock-wrapper">
		<div id="time"></div>
		<div class="lock-box center">
			<img src="<?php echo get_user_icon($userdb['uid']); ?>" alt="">
			<h1><?php echo $userdb['username']; ?></h1>
			<duv class="form-group col-lg-12">
				<input type="password" placeholder='锁屏状态，请输入密码解锁' id="lock_password" class="form-control lock-input" autofocus name="lock_password">
				<button id="unlock" class="btn btn-lock">解锁</button>
			</duv>
		</div>
	</div>
</div>
-->

</body>
</html>