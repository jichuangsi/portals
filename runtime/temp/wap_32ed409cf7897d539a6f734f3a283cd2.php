<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:71:"D:\web\Education\template/member_style/default/giftshop\order\index.htm";i:1554720520;s:73:"D:\web\Education\template/member_style/21syx_member/member/wap_layout.htm";i:1548153004;s:64:"D:\web\Education\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<title>我购买的商品</title>

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




<?php $type||$type=0; $house[$type]="class='red'"; ?>
<script>
	$('.qb_header .web').text('我的订单');
</script>
<style>
	.qb_header .web{
		font-size: 20px;
	}
	.qb_header{
		position: fixed;
		top: 0;
		z-index: 9999;
	}
	.qb_header{
		background: -webkit-linear-gradient(#07EBC8, #357BF5);
	    background: -o-linear-gradient(#07EBC8, #357BF5);
	    background: -moz-linear-gradient(#07EBC8, #357BF5);
	    background: linear-gradient(#07EBC8, #357BF5);
	}
</style>
<ul class="qb_ui_page_menu" style="margin-top: 51px;">
	<li><a href="<?php echo urls('index'); ?>" <?php echo $house[0]; ?>>全部</a></li>
	<li><a href="?type=ispay" <?php echo $house['ispay']; ?>>已付款</a></li>
	<li><a href="?type=nopay" <?php echo $house['nopay']; ?>>待付款</a></li>
</ul>
<link rel="stylesheet" href="/public/static/css/waporder.css">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<div class="ListOrder">
	<ul class="topinfo">
		<ol><a href="<?php echo get_url('user',['uid'=>$rs['uid']]); ?>"><img src="<?php echo get_user_icon($rs['uid']); ?>" onerror="this.src='/public/static/images/nopic.png';"/><span><?php echo get_user_name($rs['uid']); ?></span></a></ol>
		<script>
			$(function(){
				console.log(<?php echo $rs['user_jf']; ?>);
			});
		</script>
		<li><i class="fa fa-clock-o"></i><?php echo $rs['create_time']; ?></li>		
	</ul>
	<?php if(is_array($rs['shop_db']) || $rs['shop_db'] instanceof \think\Collection || $rs['shop_db'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['shop_db'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
	<ul class="listshop">
		<li class="img"><a href="<?php echo iurl('content/show',['id'=>$vs['id']]); ?>"><img src="<?php echo $vs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png';"/></a></li>
		<li class="infos">
			<div><a href="<?php echo iurl('content/show',['id'=>$vs['id']]); ?>"><?php echo $vs['title']; ?></a></div>
			<p>
				<?php if(!(empty($vs['_type1']) || (($vs['_type1'] instanceof \think\Collection || $vs['_type1'] instanceof \think\Paginator ) && $vs['_type1']->isEmpty()))): ?><?php echo $vs['_type1']; ?> &nbsp; <?php endif; if(!(empty($vs['_type2']) || (($vs['_type2'] instanceof \think\Collection || $vs['_type2'] instanceof \think\Paginator ) && $vs['_type2']->isEmpty()))): ?><?php echo $vs['_type2']; ?> &nbsp; <?php endif; if(!(empty($vs['_type3']) || (($vs['_type3'] instanceof \think\Collection || $vs['_type3'] instanceof \think\Paginator ) && $vs['_type3']->isEmpty()))): ?><?php echo $vs['_type3']; endif; ?>
			</p>
		</li>
		<li class="price"><div>&yen; <?php echo $vs['_price']; ?></div><p>X <?php echo $vs['_num']; ?></p><p style="color: red;">积分:<?php echo $rs['user_jf']; ?></p></li>
	</ul>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	<ul class="otherinfo">
		<ol>合计: <span>&yen;<?php echo $rs['totalmoney']; ?></span>元+<span><?php echo $rs['user_jf']; ?></span>积分</ol>
		<li>订单号: <?php echo $rs['order_sn']; ?></li>
	</ul>
	<div class="actions">
		<?php if($rs['pay_status'] == '1'): ?><span>已付款</span><?php else: ?><a href="<?php echo urls('pay',['id'=>$rs['id']]); ?>" title="点击在线支付">未付款</a><?php endif; ?>
		<a href="<?php echo urls('show',['id'=>$rs['id']]); ?>">查看</a> 
		<!--<a href="<?php echo urls('edit',['id'=>$rs['id']]); ?>">修改</a> 			
		<a href="<?php echo urls('delete',['id'=>$rs['id']]); ?>" class="del">删除</a>-->
	</div>
</div>
<?php endforeach; endif; else: echo "" ;endif; ?>
<?php echo $pages; ?>


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