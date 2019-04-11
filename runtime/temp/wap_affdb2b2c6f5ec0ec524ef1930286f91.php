<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"D:\web\Education\template/index_style/default/giftshop\car\index.htm";i:1548139810;s:66:"D:\web\Education\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的购物车</title>
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



<link rel="stylesheet" href="/public/static/css/car.css">
<div class="ShopCarContent">
<style>
.body_Hearcont{
	text-align: center;
	font-weight: bold;
	line-height: 42px;
	font-size: 21px;
}
#slider{
	margin-top: 53px;
}

</style>
<script>
	$(function(){
//		$('.body_Hearcont').find('ul').remove();
		$('.body_Hearcont').text('购物车');
		$('.body_Hearcont').append('<a href="#" style="position: absolute;left: 9px;top: 14px;color: #fff;font-size: 30px;" onclick="window.history.back();" class="fa fa-reply"> </a>');
//		$('.body_Hearcont').append('<a style="position: absolute;right: 10px;color: #000000;" href="<?php echo urls('car/index'); ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>');
	});
</script>
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$array): $mod = ($i % 2 );++$i;?>
	<div class="ListCompany">
		<ul class="h">
			<li class="check"><input type="checkbox" value="1"/></li>
			<li><a href="?uid=$key"><?php echo get_user_name($key); ?></a></li>
			<li class='edit'><span>编辑</span></li>
		</ul>
		<div class="listCar">
	<?php if(is_array($array) || $array instanceof \think\Collection || $array instanceof \think\Paginator): $i = 0; $__LIST__ = $array;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	<script>
		$(function(){
			console.log(<?php echo $rs['jifen']; ?>);
		});
	</script>
			<ul class="shops shops<?php echo $rs['id']; ?>">
				<li class="check"><input type="checkbox" <?php if($rs['_car_']['ifchoose'] == '1'): ?>checked<?php endif; ?> value="<?php echo $rs['id']; ?>"/></li>
				<li class="img"><a href="<?php echo urls('content/show',['id'=>$rs['id']]); ?>"><img src="<?php echo $rs['picurl']; ?>" onError="this.src='/public/static/images/nopic.png'"/></a></li>
				<li class="info">
					<label>
						<h3><a href="<?php echo urls('content/show',['id'=>$rs['id']]); ?>"><?php echo $rs['title']; ?></a></h3>
						<p>
							<?php if(!(empty($rs['_type1']) || (($rs['_type1'] instanceof \think\Collection || $rs['_type1'] instanceof \think\Paginator ) && $rs['_type1']->isEmpty()))): ?><!--<?php echo $rs['_type1_title']; ?>：--><em><?php echo $rs['_type1']; ?></em> <?php endif; if(!(empty($rs['_type2']) || (($rs['_type2'] instanceof \think\Collection || $rs['_type2'] instanceof \think\Paginator ) && $rs['_type2']->isEmpty()))): ?><!--<?php echo $rs['_type2_title']; ?>：--><em><?php echo $rs['_type2']; ?></em> <?php endif; if(!(empty($rs['_type3']) || (($rs['_type3'] instanceof \think\Collection || $rs['_type3'] instanceof \think\Paginator ) && $rs['_type3']->isEmpty()))): ?><!--<?php echo $rs['_type3_title']; ?>：--><em><?php echo $rs['_type3']; ?></em> <?php endif; ?>
						</p>
						<div><em>&yen;<i><?php echo $rs['_price']; ?></i></em><em style="color: red;">&nbsp;+&nbsp;<i class="fa fa-database" style="color: #F90;"></i><span  style="color: #F90;"><?php echo $rs['jifen']; ?></span></em> <span>X<i><?php echo $rs['_num']; ?></i></span></div>
					</label>
					<dl>
						<dt>
							<div><span class="fa fa-minus"></span><i><?php echo $rs['_num']; ?></i><em class="fa fa-plus"></em></div>
							<p>
								价格：<span>&yen;<?php echo $rs['_price']; ?></span>								
							</p>
							<p>
								霸币：<span class="fa fa-database"><?php echo $rs['jifen']; ?></span>								
							</p>
						</dt>
						<dd onclick="DelTheShop(<?php echo $rs['id']; ?>,$(this).parent().parent().parent().parent())">删除</dd>
					</dl>
				</li>
			</ul>
	<?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
	</div>
<?php endforeach; endif; else: echo "" ;endif; ?>


	<ul class="AllJoin">
		<li class='select'><input class="allselect" type="checkbox" value="1"/> 全选</li>
		<li style="font-size: 14px;">合计：<em style="font-size: 15px;"></em> 元+<i style="font-style: normal;font-size: 15px;color: #f30;"></i>&nbsp;霸币</li>
		<li class='but'><a href="javascript:;" onclick="pay_check();">去结算（<span></span>）</a></li>
	</ul>
</div>
<script>

function pay_check(){
	var url = "<?php echo urls('order/check'); ?>";
	$.get(url,function(res){
		if(res.code==0){
			if(res.data>0){
				layer.confirm("本次需要消费霸币 "+res.data+" 个,你是否还要继续?",{btn:['继续','放弃']},function(){
				window.location.href = "<?php echo urls('order/add'); ?>";
				});
			}else{
				layer.alert("请选择商品");
			}
			
		}else{
			layer.alert(res.msg);
		}
	});
}

$('.ListCompany .edit span').click(function(){
	var thisword=$(this).html();
	var Listobj=$(this).parent().parent().parent().find('.listCar');
	if(thisword=='编辑'){
		Listobj.find('.info label').hide();
		Listobj.find('.info dl').show();
		$(this).html('完成');
	}else{		
		Listobj.find('.info dl').hide();
		Listobj.find('.info label').show();
		$(this).html('编辑');
	}
});
$('.listCar .shops .info dl dt div em').click(function(){
	var thisshops=$(this).parent().parent().parent().parent().parent();
	var thisnum=parseInt($(this).parent().find('i').html());
	thisnum++;
	change_shops(thisshops,thisnum);
});
$('.listCar .shops .info dl dt div span').click(function(){
	var thisshops=$(this).parent().parent().parent().parent().parent();
	var thisnum=parseInt($(this).parent().find('i').html());
	thisnum--;
	if(thisnum<1){
		layer.alert('购买数量不能小于1！');
	}else{
		change_shops(thisshops,thisnum);
	}	
});
function change_shops(objs,num){
	var shopid=objs.find('.check input').val();
	$.get("<?php echo urls('car/change_num'); ?>?shopid="+shopid+"&num="+num+"&"+Math.random(),function(res){
		if(res.code==0){
			objs.find('.info label div span i').html(num);
			objs.find('.info dl dt div i').html(num);
			changJoins();
		}else{
			layer.alert(res.msg);
		}
	});	
}
changJoins();
function changJoins(){
	var total_price=0;
	var Join_num=0;
	var Join_num0=0;
	var total_jifen=0;
	$('.shops .check input').each(function(){
		Join_num0++;
		var shopnum=parseInt($(this).parent().parent().find('.info label div span i').html());
		var shopprice=parseFloat($(this).parent().parent().find('.info label div em i').html());
		var shopjifen=parseInt($(this).parent().parent().find('.info label div em span').html());
		var shopid=parseInt($(this).val());
		if($(this).is(':checked')){			
			Join_num++;
			total_price+=parseFloat(shopnum*shopprice);
			total_jifen+=parseInt(shopnum*shopjifen);
			$.get("<?php echo urls('car/choose'); ?>?shopid="+shopid+"&ck=1&"+Math.random());
		}else{
			$.get("<?php echo urls('car/choose'); ?>?shopid="+shopid+"&ck=0&"+Math.random());
		}
	});
	total_price=total_price.toFixed(2);
	$('.AllJoin em').html(total_price);
	$('.AllJoin span').html(Join_num);
	$('.AllJoin i').html(total_jifen);
	if(Join_num0<1){
		layer.alert('购物车没有任何商品！');
	}
}
$('.AllJoin .select input').click(function(){
	if($(this).is(':checked')){
		$('.ListCompany input[type="checkbox"]').prop("checked", true);
	}else{
		$('.ListCompany input[type="checkbox"]').prop("checked", false);
	}
	changJoins();
});
$('.shops .check input').click(function(){
	var checks=1;
	var thisList1=$(this).parent().parent().parent();
	thisList1.find('.check input').each(function(){
		if($(this).is(':checked')){
		}else{
			checks=0;
		}
	});
	if(checks==1){
		$(this).parent().parent().parent().parent().find('.h .check input').prop("checked", true);
	}else{
		$(this).parent().parent().parent().parent().find('.h .check input').prop("checked", false);
	}
	changJoins();
});
$('.ListCompany .h .check input').click(function(){
	if($(this).is(':checked')){
		$(this).parent().parent().parent().find('input[type="checkbox"]').prop("checked", true);
	}else{
		$(this).parent().parent().parent().find('input[type="checkbox"]').prop("checked", false);
	}
	changJoins();
});
function DelTheShop(num,objs){
	$.get("<?php echo urls('car/delete'); ?>?shopid="+num,function(res){
		if(res.code==0){			
			$('.shops'+num).remove();
			if(objs.html().length<20){
				objs.parent().remove();
			}
			changJoins();
		}else{
			layer.alert(res.msg);
		}
	});
}
</script>
	
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