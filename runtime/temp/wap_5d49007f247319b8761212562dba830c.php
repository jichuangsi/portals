<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:78:"D:\web\Education\template/member_style/21syx_member/member\index/wap_index.htm";i:1554721929;s:64:"D:\web\Education\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会员中心</title>
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link rel="stylesheet" href="/public/static/icon/icon.css">
	<link rel="stylesheet" href="/public/static/icon/iconfont.css">
	<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
	<script type="text/javascript" src="/public/static/layer/layer.js"></script>
</head>
<body>
<style>
	.aui-palace-grid-icon img{
		width: 30px !important;
		height: 30px !important;
	}
</style>
        <link href="/public/static/verycong/21syx_member/wap_index_style.css" rel="stylesheet" type="text/css"/>


        <section class="aui-flexView">
            <header class="aui-navBar aui-navBar-fixed">
                <a href="/member.php/member/remind/set.html" style="float:left;margin:10px;display: none;"> <i class="si si-settings" style="font-size:24px; color:#FFFFFF;"></i></a>                    
                <a href="/member.php/member/msg/index.html" style="float:left;margin:10px;"><i class="fa fa-fw fa-envelope-o" style="font-size:24px; color:#FFFFFF;"></i></a>
                <div class="aui-center">
                    <span class="aui-center-title"></span>
                </div>
                <a href="<?php echo purl('signin/index/index',[],'index'); ?>" class="aui-navBar-item">
                    <div class="aui-lag-member">
                        <i class="icon icon-vip"></i>
                        签到<?php echo $webdb['MoneyName']; ?>
                   
                    </div>
                </a>
            </header>
           
            <section class="aui-scrollView">
                <div class="aui-head-bg">
                    <div class="aui-head-user">
                        <a href="<?php echo url('member/user/edit'); ?>"><img src="<?php echo tempdir($info['icon']); ?>" onerror="this.src='/public/static/images/nobody.gif'"/></a>
                    </div>
                    <div class="aui-head-name">
                        <h2>
                            <?php echo $info['nickname']; ?><br><em><?php echo getGroupByid($info['groupid']); ?></em>
                        </h2>
                    </div>
                </div>
                <div class="aui-palace">
                    <a href="<?php echo purl('marketing/rmb/index',[],'member'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon" style="padding-top:15px; color:#FF0000; font-weight:300;">
                            <?php echo $info['rmb']; ?>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>余额/元</h2>
                        </div>
                    </a>
                    <a href="javascript:;" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon" style="padding-top:15px;color:#aaaaaa; ">
                            <?php echo $info['rmb_freeze']; ?>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>冻结金额</h2>
                        </div>
                    </a>
                    <a href="<?php echo purl('marketing/jifen/index',[],'member'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon" style="padding-top:15px;">
                            <?php echo $info['money']; ?>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2><?php echo $webdb['MoneyName']; ?>/<?php echo $webdb['MoneyDW']; ?></h2>
                        </div>
                    </a>
                    <a href="<?php echo purl('marketing/rmb/add',[],'member'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i class="iconfont icon-chongzhi1"  style="color:#1E9FFF; font-size:30px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>余额充值</h2>
                        </div>
                    </a>
                    <a href="<?php echo purl('marketing/rmb/getmoney',[],'member'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i class="iconfont icon-tixian" style="color:#1E9FFF; font-size:30px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>余额提现</h2>
                        </div>
                    </a>
                    <a href="<?php echo purl('marketing/rmb/edit',[],'member'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i class="iconfont icon-shoukuan"  style="color:#1E9FFF; font-size:30px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>收款设置</h2>
                        </div>
                    </a>
                </div>
                <div class="divHeight"></div>
                <div class="aui-flex b-line aui-flex-two">
                    <div class="aui-flex-box">基础设置</div>
                    <div class="aui-flex-fr"></div>
                </div>
                <div class="aui-palace aui-palace-two" style="padding-top: 15px;">
                    <a href="<?php echo purl('fav/fav/index',[],'member'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i  style="color:#FF5722; font-size:30px;"><img src="/public/static/member/MyCollection.png" /> </i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>我的收藏</h2>
                        </div>
                    </a>
                    <a href="/index.php/cms/content/mycomment" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i  style="color:#FF5722; font-size:30px;"><img src="/public/static/member/Mycomment.png" /></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>我的评论</h2>
                        </div>
                    </a>
                    <a href="/index.php/cms/content/myfabulous" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i  style="color:#FF5722; font-size:30px;"><img src="/public/static/member/MyFabulous.png" /></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>我的点赞</h2>
                        </div>
                    </a>
                    <a href="/index.php/cms/content/browsinghistory" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i  style="color:#FF5722; font-size:30px;"><img src="/public/static/member/History.png" /></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>浏览历史</h2>
                        </div>
                    </a>
                    <a style="display: none;" href="/member.php/member/bindlogin/weixin.html" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i  style="color:#5FB878; font-size:30px;"><img src="/public/static/member/weixin.png" /></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>其它登录</h2>
                        </div>
                    </a>
                     <a style="display: none;" href="/member.php/member/yz/mob.html" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i  style="color:#5FB878; font-size:30px;"><img src="/public/static/member/Authentication.png" /></i>
                        </div>
                        <div class="aui-palace-grid-text">
							<h2>实名认证</h2>
                        </div>
                    </a>
                    <?php if(($info['groupid'])==11): ?>
	                    <a style="display: none;" href="#" class="aui-palace-grid" onclick="m151()">
	                       <div class="aui-palace-grid-icon" >
	                             <i  style="color:#5FB878; font-size:30px;"><img src="/public/static/member/xinwen.png" /></i>
	                        </div>
	                        <div class="aui-palace-grid-text">
	                            <h2>霸闻资讯</h2>
	                        </div>
	                    </a>
	                    <script>
							function m151(){
								layer.open({
								  type: 1, 
								  title:'版块中心',
								  content: '<center><li class="postlimin"><a href="/member.php/cms/list.html">我发布的内容</a></li><li class="postlimin"><a href="/member.php/cms/content/postnew.html">发布内容</a></li><li class="postlimin"><a href="/member.php/cms/content/copynews.html">采集公众号文章</a></li></center>' //这里content是一个普通的String
								});           
							}
						</script>
                    <?php else: ?>
	                    <a style="display: none;" href="/member.php/member/yz/idcard.html" class="aui-palace-grid">
	                        <div class="aui-palace-grid-icon">
	                            <i  style="color:#5FB878; font-size:30px;"><img src="/public/static/member/media.png" /></i>
	                        </div>
	                        <div class="aui-palace-grid-text">
								<h2>自媒体认证</h2>
	                        </div>
	                    </a>
                    <?php endif; ?>
                    <a href="/index.php/cms/content/contactus" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i  style="color:#5FB878; font-size:30px;"><img src="/public/static/member/ContactUs.png" /></i>
                        </div>
                        <div class="aui-palace-grid-text">
							<h2>联系我们</h2>
                        </div>
                    </a>
                    <?php if(($info['groupid'])==3 || ($info['groupid'])==12): ?>
                    	<a style="display: none;" href="#" class="aui-palace-grid" onclick="m152()">
	                        <div class="aui-palace-grid-icon" >
	                             <i  style="color:#5FB878; font-size:30px;"><img src="/public/static/member/xinwen.png" /></i>
	                        </div>
	                        <div class="aui-palace-grid-text">
	                            <h2>霸闻资讯</h2>
	                        </div>
	                    </a>
	                    <script>
							function m152(){
							layer.open({
							  type: 1, 
							  title:'版块中心',
							  content: '<center><li class="postlimin"><a href="/member.php/cms/list.html">我发布的内容</a></li><li class="postlimin"><a href="/member.php/cms/content/postnew.html">发布内容</a></li><li class="postlimin"><a href="/member.php/cms/content/copynews.html">采集公众号文章</a></li><li class="postlimin"><a href="/member.php/cms/mysort/index.html">分类管理</a></li></center>' //这里content是一个普通的String
							});           
							}
							</script>
                    <?php endif; ?>
                    <!--<a href="/member.php/member/yz/idcard.html" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
						<?php if(!(empty($info['idcard_yz']) || (($info['idcard_yz'] instanceof \think\Collection || $info['idcard_yz'] instanceof \think\Paginator ) && $info['idcard_yz']->isEmpty()))): ?>
                            <i class="iconfont icon-shenfenrenzheng" style="color:#5FB878; font-size:30px;"></i>
						<?php else: ?>
                            <i class="iconfont icon-shenfenrenzheng" style="color:#5FB878; font-size:30px;"></i>
						<?php endif; ?>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2><?php if(!(empty($info['idcard_yz']) || (($info['idcard_yz'] instanceof \think\Collection || $info['idcard_yz'] instanceof \think\Paginator ) && $info['idcard_yz']->isEmpty()))): ?>身份已认证<?php else: ?><font color="#cccccc">身份未认证</font><?php endif; ?></h2>
                        </div>
                    </a>-->
                <!--<a href="<?php echo url('member/user/edit'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i class="si si-user-following" style="color:#1E9FFF; font-size:30px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>资料修改</h2>
                        </div>
                    </a>-->

                    <!--<a href="/member.php/member/group/index.html" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i class="iconfont icon-shengji" style="color:#FF5722; font-size:30px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>升级等级</h2>
                        </div>
                    </a>-->
                    <!--<a href="<?php echo purl('marketing/jifen/index',[],'member'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i class="iconfont icon-log" style="color:#009688; font-size:30px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2><?php echo $webdb['MoneyName']; ?>日志</h2>
                        </div>
                    </a>-->
                    <!--<a href="<?php echo purl('marketing/jifen/add',[],'member'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i class="iconfont icon-chongzhi" style="color:#1E9FFF; font-size:30px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2><?php echo $webdb['MoneyName']; ?>充值</h2>
                        </div>
                    </a>-->
                    <!--<a href="<?php echo iurl('index/login/quit'); ?>" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <i class="iconfont icon-tuichu" style="color:#FF5722; font-size:30px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>帐号退出</h2>
                        </div>
                    </a>-->
                </div>







                <div class="divHeight" style="display: block;"></div>
                 <div class="aui-flex b-line " style="display: block;">
                    <div class="aui-flex-box">更多功能</div>
                    <div class="aui-flex-fr" ></div>
                </div> 
                <div class="aui-palace aui-palace-two" style="display: block;">
    <!--会员个性菜单--> <?php $mli=""; if($menu['often']['sons']): if(is_array($menu['often']['sons']) || $menu['often']['sons'] instanceof \think\Collection || $menu['often']['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $menu['often']['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;++$mli; ?>
                    <a href="#" class="aui-palace-grid" onClick="m<?php echo $mli; ?>()">
                        <div class="aui-palace-grid-icon" style="background-color:#009688;border-radius:5px;">
                            <i class="<?php echo (isset($vo['icon']) && ($vo['icon'] !== '')?$vo['icon']:'fa fa-sun-o'); ?>" style="color:#FFFFFF; font-size:24px;padding:5px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2><?php echo $vo['title']; ?></h2>
                        </div>
                    </a>	
<script>
function m<?php echo $mli; ?>(){
layer.open({
  type: 1, 
  title:'<?php echo $vo['title']; ?>',
  content: '<?php if(is_array($vo['sons']) || $vo['sons'] instanceof \think\Collection || $vo['sons'] instanceof \think\Paginator): if( count($vo['sons'])==0 ) : echo "" ;else: foreach($vo['sons'] as $key=>$rs): ?><li class="postlimin"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>' //这里content是一个普通的String
});           
}
</script>					
    <?php endforeach; endif; else: echo "" ;endif; $menu=[]; ?><!--把默认菜单清除掉--> 
    <?php endif; if(is_array($menu) || $menu instanceof \think\Collection || $menu instanceof \think\Paginator): if( count($menu)==0 ) : echo "" ;else: foreach($menu as $key=>$vo): ++$mli; if(empty($vo['sons']['1']) || (($vo['sons']['1'] instanceof \think\Collection || $vo['sons']['1'] instanceof \think\Paginator ) && $vo['sons']['1']->isEmpty())): ?>
                    <a href="#" class="aui-palace-grid" onClick="m<?php echo $mli; ?>()">
                        <div class="aui-palace-grid-icon" style="background-color:#009688;border-radius:5px;">
                            <i class="<?php echo (isset($vo['icon']) && ($vo['icon'] !== '')?$vo['icon']:'fa fa-sun-o'); ?>" style="color:#FFFFFF; font-size:24px;padding:5px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2><?php echo $vo['title']; ?></h2>
                        </div>
                    </a>	
<script>
function m<?php echo $mli; ?>(){
layer.open({
  type: 1, 
  title:'<?php echo $vo['title']; ?>',
  content: '<?php if(is_array($vo['sons']['0']['sons']) || $vo['sons']['0']['sons'] instanceof \think\Collection || $vo['sons']['0']['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['sons']['0']['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?><li class="postlimin"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>' //这里content是一个普通的String
});           
}
</script>
    <?php else: if(is_array($vo['sons']) || $vo['sons'] instanceof \think\Collection || $vo['sons'] instanceof \think\Paginator): if( count($vo['sons'])==0 ) : echo "" ;else: foreach($vo['sons'] as $key=>$ar): ++$mli; ?>
                    <a href="#" class="aui-palace-grid" onClick="m<?php echo $mli; ?>()">
                        <div class="aui-palace-grid-icon" style="background-color:#1E9FFF;border-radius:25px;">
                            <i class="<?php echo (isset($ar['icon']) && ($ar['icon'] !== '')?$ar['icon']:'si si-layers'); ?>" style="color:#FFFFFF; font-size:24px;padding:5px;"></i>
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2><?php echo $ar['title']; ?></h2>
                        </div>
                    </a>		
<script>
function m<?php echo $mli; ?>(){
layer.open({
  type: 1, 
  title:'<?php echo $vo['title']; ?>',
  content: '<center><?php if(is_array($ar['sons']) || $ar['sons'] instanceof \think\Collection || $ar['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $ar['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?><li class="postlimin"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?></center>' //这里content是一个普通的String
});           
}
</script>
    <?php endforeach; endif; else: echo "" ;endif; endif; endforeach; endif; else: echo "" ;endif; ?>
					
                </div>

					
			
<style>.postlimin{line-height:30px;margin:10px;padding:2px 5px; border:1px solid #CCCCCC;border-radius:5px;text-align:center;}</style>




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


 
<script src="/public/static/mui/js/mui.min.js"></script>
</body>
</html>