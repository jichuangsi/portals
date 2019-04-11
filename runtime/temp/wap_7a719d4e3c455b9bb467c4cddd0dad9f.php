<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:80:"D:\web\Education\template/member_style/default/plugins/marketing/jifen/index.htm";i:1554720260;s:73:"D:\web\Education\template/member_style/21syx_member/member/wap_layout.htm";i:1548153004;s:64:"D:\web\Education\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<title>霸币明细</title>

<link rel="stylesheet" href="/public/static/layui/css/layui.css" media="all">
<link rel="stylesheet" href="/public/static/layui/css/admin.css" media="all">


<link rel="stylesheet" type="text/css" href="/public/static/member/default/wap/global.css">
<link rel="stylesheet" type="text/css" href="/public/static/member/default/wap/wap.css">
<link rel="stylesheet" type="text/css" href="/public/static/css/wapmember.css">

<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>

</head>
<body>


<div class="qb_header">
	<div class="goback"><a href="#" onClick="window.history.back();" class="fa fa-reply"> 返回</a></div>
    <div class="web"></div>
    <div class="member"><a href="/member.php" class="fa fa-user-circle"></a></div>
</div>




<link rel="stylesheet" href="/public/static/icon/iconfont.css">
<style>
	.qb_member_note{
		background: url('/public/static/index/toutiao/Profit.png') no-repeat;
		background-size: 100%;
		height: 53px;
		/*line-height: 53px;*/
		line-height: 2;
		color: #fff;
		margin-top: 45px;
	}
	.web{
		text-align: center;
	}
	.qb_header{
		/*background-color: #ffdd33;*/
		background: -webkit-linear-gradient(#07EBC8, #357BF5);
	    background: -o-linear-gradient(#07EBC8, #357BF5);
	    background: -moz-linear-gradient(#07EBC8, #357BF5);
	    background: linear-gradient(#07EBC8, #357BF5);
		font-weight: bold;
		text-align: center;
		height: 45px;
		line-height: 45px;
		position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 10;
	    font-size: 21px;
	}
</style>
<div class="qb_member_note">
	我的霸币  <br /> <span ><?php echo $userdb['money']; ?><?php echo $userdb['uid']; ?></span> 个
</div>
<div class="qb_member_Cnt" style="display: block;">
	
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	<ul class="qb_member_ListType1">
		<ol>
			<span class="FL">项目：<?php echo get_word($rs['title'],"60"); ?></span>
			<span class="FR <?php if($rs['money'] > '0'): ?>  red<?php else: ?> gray<?php endif; ?>"><?php echo $rs['money']; ?></span>
		</ol>
		<li>
			<span class="FL glyphicon glyphicon-time gray"><?php echo date("Y-m-d H:i:s",$rs['posttime']); ?></span>
			<!--<a href="<?php echo purl('delete',['id'=>$rs['id']]); ?>" class="FR">删除</a>-->
		</li>
	</ul>
<?php endforeach; endif; else: echo "" ;endif; ?>
<?php echo $pages; ?>
</div>
<script>
	$(function(){
		$(".footer a").css('color','#fff');
		$(".footer a[href*='marketing']").css('color','#FFDD33');
		$('.goback').find('a').remove();
		$('.member').find('a').remove();
		$('.qb_header').find('div').remove();
		$('.qb_header').text('霸币明细');
		$('.qb_header').append('<a href="#" style="position: absolute;left: 9px;top: 11px;color: #fff;font-size: 30px;" onclick="window.location.href=\'/member.php/member/plugin/execute/plugin_action/generalization/plugin_controller/jifen/plugin_name/marketing.html\'" class="fa fa-reply"> </a>');
		$('.shares').css({"position":"fixed","top":"13px","bottom":"","z-index":"10"});
	});
</script>
<div id="div_propagandize" style="display:none;">
<div style="padding:20px;line-height:150%;">
<div style="border-bottom:1px solid #ddd;margin-bottom:10px;padding:10px;">
欢迎分享,分享有收益。<br>
1、直接推荐他人注册可获得 10 个积分的奖励<br>
2、间接推荐他人注册可获得 5 个积分的奖励<br>
3、上上级推荐还可获得 2 个积分的奖励<br>
</div>
<!--分享网址：<a href="http://192.168.31.122?p_uid=1">http://192.168.31.122?p_uid=1</a>-->
分享网址：<a href="http://192.168.31.122?p_uid=1"><?php echo get_url('home'); ?>?p_uid=<?php echo $userdb['uid']; ?></a>
<br>
分享二维码如下：
<br><!--<center><img width="200" src="/index.php/index/qrcode/index.html?url=http%3A%2F%2F192.168.31.122%3Fp_uid%3D1"></center>-->
<center><img width="250" src="<?php echo get_qrcode('/?p_uid='.$userdb['uid']); ?>"></center>
</div>
</div>
<script type="text/javascript">
function show_propagandize(){
	layer.open({
		type:1,
		title:false,
		content:$('#div_propagandize'),
		area:['95%','80%'],
	});
}
</script>
<i class="fa fa-share-square-o shares" onclick="show_propagandize()" style="position: fixed; right: 10px; font-size: 20px; color: rgb(102, 102, 102); top: 13px; z-index: 10;">分享</i>
<?php echo hook_listen('layout_body_foot',$userdb,$webdb,true); ?>


<div class="CopyRight">
  <p>@<?php echo $webdb['webname']; ?> 版权所有</p>
  <p><?php echo $webdb['miibeian_gov_cn']; ?></p>
</div>

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


  


<script type="text/javascript" src="/public/static/js/qibo.js"></script>
<script src="/public/static/layui/layui.js"></script>

 
<script type="text/javascript">
layui.use(['form','element'], function(){
  var form = layui.form;
  var element = layui.element;
});
</script>


</body>
</html>