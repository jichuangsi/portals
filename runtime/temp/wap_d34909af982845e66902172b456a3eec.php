<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"D:\web\Education\template/index_style/default/giftshop\order\add.htm";i:1552271426;s:66:"D:\web\Education\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>确定购买商品</title>
<meta name="keywords" content='<?php echo $webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo $webdb['seo_description']; ?>'>
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

<div class="body_Hearcont">
	<ul>
	<!--<li>
		<a href="/member.php/member/msg/index.html"><img src="/public/static/index/toutiao/email.png" width="30"></a>
		</li>-->
		<ol><a href="/"><img src="<?php echo (tempdir($webdb['logo']) ?: '/public/static/index/toutiao/wap_logo.png'); ?>"></a></ol>
		<li>
		<a href="/search/"><img src="/public/static/index/toutiao/so.png" width="30"></a>
		</li>
	</ul>
</div> 



<style>
.PostOrder{
	max-width: 640px;
	margin:auto;
	padding: 30px 0;
}
.PostOrder ul{
	display: table;
	width: 90%;
	margin: 0 auto 15px auto;
	border-bottom: #DDD solid 1px;
}
.PostOrder ul ol,.PostOrder ul li{
	display: table-cell;
	padding: 5px;
	vertical-align: middle;
}
.PostOrder ul ol{
	width:50px;
	text-align: center;
	font-size: 20px;
	color: #666;
}
.PostOrder ul li input{
	border: 0px;
	width: 100%;
	outline: none;
}
.PostOrder dl{
	display: table;
	width: 90%;
	margin: 0 auto 15px auto;
}
.PostOrder dl dt,.PostOrder dl dd{
	display: table-cell;
	padding: 5px;
	vertical-align: middle;
}
.PostOrder dl dt{
	width:70px;
}
.PostOrder dl dd input[type="radio"]{
	margin: 0 5px 0 10px;
}
.PostOrder div button{
	display: block;
	width:90%;
	margin: 15px auto 0 auto;
	border: 0px;
	line-height: 50px;
	background: #EBEEF0;
	border-radius: 5px;
	color: #888;
	font-size: 20px;
	cursor: pointer;
}
.PostOrder div button[type=submit]{
	background: #257FED;
	color: #FFF;
}	
</style>
<div class="PostOrder">
	<form action="<?php echo urls('add'); ?>" method="post">
		<ul>
		<select name="address_id">
					<option value="" selected>请选择地址</option>
<?php if(is_array($address) || $address instanceof \think\Collection || $address instanceof \think\Paginator): $i = 0; $__LIST__ = $address;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<option <?php if($rs['often']==1): ?>selected<?php endif; ?> value="<?php echo $rs['id']; ?>" data-user="<?php echo $rs['user']; ?>" data-telphone="<?php echo $rs['telphone']; ?>" data-address="<?php echo $rs['address']; ?>"><?php echo $rs['user']; ?> <?php echo get_word($rs['telphone'],4); ?> <?php echo get_word($rs['address'],12); ?></option>
<?php endforeach; endif; else: echo "" ;endif; ?>
				 </select>
<script type="text/javascript">
$(function(){
	$("select[name='address_id']").change(function(){
		set_address($(this))
	});
	set_address($("select[name='address_id']"));
});
function set_address(that){
	var address = that.find("option:selected").data('address');
	var user = that.find("option:selected").data('user');
	var telphone = that.find("option:selected").data('telphone');
	$("input[name='linkman']").val(user);
	$("input[name='telphone']").val(telphone);
	$("input[name='address']").val(address);
}
</script>
		</ul>
		<ul>
			<ol><i class="si si-user"></i></ol>
			<li><input type="text" name="linkman" placeholder="请输入联系人" ></li>
		</ul>
		<ul>
			<ol><i class="fa fa-volume-control-phone"></i></ol>
			<li><input type="text" name="telphone" placeholder="请输入联系电话" ></li>
		</ul>
		<ul>
			<ol><i class="fa fa-home"></i></ol>
			<li><input type="text" name="address" placeholder="请输入收货地址" ></li>
		</ul>
<?php if($money): ?>
		<dl>
			<dt>注意:你还需要支付 <?php echo $money; ?> 元,请选择支付方式</dt> 
		</dl>
		<dl>
			<dt>支付类型</dt>
			<dd>
				<input type="radio" name="ifolpay" value="1" checked />在线付款
				<!--<input type="radio" name="ifolpay" value="0" />货到付款-->
			</dd>
		</dl>
<?php endif; ?>
		<dl>
			<dt>注意:提交订单将自动扣取你的积分 <?php echo $jifen; ?> 个</dt> 
		</dl>

		<div>
			<button type="submit">提交</button>
			<button type="button" onclick="javascript:history.back(-1);return false;">返回</button>
		</div>
	</form>
</div>
	
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