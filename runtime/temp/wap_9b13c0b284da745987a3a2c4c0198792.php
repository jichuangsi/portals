<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:70:"D:\web\Education\template/member_style/default/giftshop\order\show.htm";i:1554720575;s:73:"D:\web\Education\template/member_style/21syx_member/member/wap_layout.htm";i:1548153004;s:64:"D:\web\Education\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<title>订单资料详情</title>

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




<style>
.OrderInfo{
	background:#FFF;
	width:100%;
	overflow:hidden;
}
.OrderInfo .head{
	line-height:40px;
	position:relative;
	text-indent:30px;
	font-size:20px;
}
.OrderInfo .head:before{
	content:'';
	display:block;
	width:3px;
	height:20px;
	background:#F90;
	position:absolute;
	left:15px;
	top:10px;
	border-radius:2px;
}
.OrderInfo .shop dt,.orderinfo{
	height:35px;
	line-height:35px;
	background:#EFEFEF;
	border-top:#CCC solid 1px;
	text-indent:15px;
}
.OrderInfo .shop dd,.totalnomey,.OrderInfo .infos{
	border-top:#CCC solid 1px;
}
.OrderInfo ul{
	display:table;
	width:100%;
}
.OrderInfo ul ol,.OrderInfo ul li{
	display:table-cell;
	vertical-align:middle;
}
.OrderInfo .shop dd{
	padding:5px 10px;
}
.OrderInfo .shop dd ul ol a{
	display:block;
	line-height:20px;
	color:#369;
	padding:5px 0;
}
.OrderInfo .shop dd ul li{
	width:80px;
	padding:5px 0 5px 5px;
}
.OrderInfo .shop dd ul li span,.OrderInfo .shop dd ul li em{
	display:block;
	height:20px;
	line-height:20px;
	text-align:right;
	overflow:hidden;
}
.OrderInfo .shop dd ul li span{
	color:#AAA;
}
.totalnomey li{
	width:100px;
	text-align:right;
	height:50px;
	color:#F60;
	padding-right:10px;
}
.totalnomey ol{
	padding-left:15px;
}
.OrderInfo .infos ol{
	width:100px;
	height:40px;
	text-indent:15px;
	color:#999;
}
.OrderInfo .infos li{
	padding:5px;
	line-height:20px;
}
.BackBut{
	padding:10px 0 0 0;
}
.BackBut a{
	display:block;
	text-align:center;
	line-height:40px;
	background:#F90;
	color:#FFF;
}
</style> 
<script>
	$('.qb_header .web').text('订单详情');
</script>
<style>
	.qb_header .web{
		font-size: 20px;
	}
	.qb_header{
		position: fixed;
		top: 0;
		z-index: 9999;
		background: -webkit-linear-gradient(#07EBC8, #357BF5);
	    background: -o-linear-gradient(#07EBC8, #357BF5);
	    background: -moz-linear-gradient(#07EBC8, #357BF5);
	    background: linear-gradient(#07EBC8, #357BF5);
	}
	
</style>
<div class="OrderInfo" style="margin-top: 55px;">
	<div style="display: none;" class="head">用户订单详情</div>
	<dl class="shop">
		<dt>产品信息</dt>
		<dd>
<?php if(is_array($info['shop_db']) || $info['shop_db'] instanceof \think\Collection || $info['shop_db'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['shop_db'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
          <ul>
            <ol><a href="<?php echo urls('content/show',['id'=>$rs['id']]); ?>"><?php echo $rs['title']; ?></a></ol>
			<li>
				<span>X<?php echo $rs['_num']; ?></span>
				<em>&yen;<?php echo $rs['_price']; ?></em>
			</li>
          </ul>
<?php endforeach; endif; else: echo "" ;endif; ?>
		</dd>
	</dl>
	<ul class="totalnomey">
		<ol>应付总额</ol>
		<li>&yen;<?php echo $info['totalmoney']; ?></li>
	</ul>
	<ul class="totalnomey">
		<ol>应付积分</ol>
		<li><?php echo $info['user_jf']; ?>个</li>
	</ul>
	<div class="orderinfo">订单信息</div>
	<ul class="infos">
		<ol>订单号:</ol>
		<li><?php echo $info['order_sn']; ?></li>
	</ul>
	<ul class="infos">
		<ol>订购者ID:</ol>
		<li><a href="<?php echo get_url('user',['uid'=>$info['uid']]); ?>" target="_blank"><?php echo get_user_name($info['uid']); ?></a></li>
	</ul>
	<ul class="infos">
		<ol>订购时间:</ol>
		<li><?php echo $info['create_time']; ?></li>
	</ul>
	<ul class="infos">
		<ol>付款与否:</ol>
		<li>
<?php if($info['pay_status'] == '1'): ?>
已付款
<?php else: ?>
 <a href="<?php echo urls('pay',['id'=>$info['id']]); ?>" title="点击在线支付">未付款</a>
<?php endif; ?>
	</li>
	</ul>


	<ul class="infos">
		<ol>联系人:</ol>
		<li><?php echo $info['linkman']; ?></li>
	</ul>
 
	<ul class="infos">
		<ol>联系电话:</ol>
		<li><?php echo $info['telphone']; ?></li>
	</ul>
 
	<ul class="infos">
		<ol>支付方式:</ol>
		<li><?php echo $info['pay_name']; ?></li>
	</ul>

	<ul class="infos">
		<ol>物流单号:</ol>
		<li><?php echo $info['shipping_code']; ?></li>
	</ul>
 
	<ul class="infos">
		<ol>附注留言:</ol>
		<li><?php echo $info['user_note']; ?></li>
	</ul>
 
	<div class="BackBut"><a href="<?php echo urls('index'); ?>">返回</a></div>
</div>



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