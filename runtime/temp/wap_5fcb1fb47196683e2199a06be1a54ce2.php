<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:71:"D:\web\Education\template/index_style/default/giftshop\content/list.htm";i:1548137919;s:66:"D:\web\Education\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;s:74:"D:\web\Education\template\index_style\default\giftshop\content\wapsort.htm";i:1550631024;s:79:"D:\web\Education\template\index_style\default\giftshop\content\waplistshop2.htm";i:1548149160;s:75:"D:\web\Education\template\index_style\default\giftshop\content\showmore.htm";i:1547462930;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo del_html(get_sort($fid,'seo_title')?:get_sort($fid)); ?></title>
<meta name="keywords" content='<?php echo del_html(get_sort($fid,'seo_keywords')?:get_sort($fid)); ?>'>
<meta name="description" content='<?php echo get_sort($fid,'seo_description'); ?>'>
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
.Show_Shop_List{max-width: 640px;margin: 10px auto;}
.Show_Shop_List:after{content: '';display: block;clear: both;}	
</style>
	<script src='/public/static/js/iscroll.js'></script>
<div class="shopMenu" style="display: none;">
	<ul>
		<li><a href="/member.php/giftshop/order/index.html">我的订单</a>  </li>
		<li> <a href="<?php echo urls('car/index'); ?>">我的购物车</a></li>
		<li><a href="/member.php/shop/address/index.html">我的地址</a> </li>
	</ul>
</div>

<div class="qb_ui_wapSortBoxCont">
	<ul>
		<?php if(is_array(get_sort($fid,'other')) || get_sort($fid,'other') instanceof \think\Collection || get_sort($fid,'other') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort($fid,'other');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
		<li <?php if($key == $fid): ?>class='ck'<?php endif; ?>><a href="<?php echo urls('content/index',['fid'=>$key]); ?>"><?php echo $vo; ?></a></li>
		<?php endforeach; endif; else: echo "" ;endif; ?>
	</ul>
</div>
<style>
.shopMenu{
	position: fixed;
	top: 52px;
	right: 0px;
	z-index: 999;
	background: #fff;
	text-align: center;
}
.shopMenu ul{
	margin:0px 10px;
}
.shopMenu li{
	border-bottom:1px solid #ccc;
	padding: 5px 10px;
}
.body_Hearcont{
	text-align: center;
	font-weight: bold;
	line-height: 42px;
	font-size: 21px;
}
</style>
<script>
	$(function(){
		$('.body_Hearcont').find('ul').remove();
		$('.body_Hearcont').text('霸币商城');
		$('.body_Hearcont').append('<a href="javascript:void(0);" style="position: absolute;right: 10px;color: #fff;padding: 0px 10px;" onclick="shopmenu()" ><i class="fa fa-bars" aria-hidden="true"></i></a>');
	});
	function shopmenu(){
		$('.shopMenu').toggle();
	}
</script>
<script>
//统计总宽度
var mysortBoxW=0;
$('.qb_ui_wapSortBoxCont ul li').each(function(){
	mysortBoxW+=$(this).width();
});
$('.qb_ui_wapSortBoxCont ul').width(mysortBoxW+10);
var myScroll; 
myScroll = new IScroll('.qb_ui_wapSortBoxCont', { scrollX: true, scrollY: false, mouseWheel: true,preventDefault: false,preventDefaultException: { tagName: /^(INPUT|TEXTAREA|BUTTON|SELECT|LI)$/ } });
</script>
	<div class="Show_Shop_List">
		<?php if(defined('LABEL_DEBUG')): ?><!--LISTPAGE <!--shop_list02		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="qb_ui_listShop_type2">
	<ul>
		<ol><a href="<?php echo $rs['url']; ?>"><img style="height: 100%;" src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'" onmouseover='thisimg_over($(this))' onmouseout='thisimg_out($(this))'/></a></ol>
		<li>
			<div><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['title'],100); ?></a></div>
			<p style="overflow: inherit;"><span><i class="fa fa-database">&nbsp;</i><?php echo $rs['jifen']; ?> 霸币 <?php if(($rs['price']>0)): ?> </span><span style="color: red;font-size: 24px;">&nbsp;+&nbsp;</span><span>&yen;&nbsp;<?php echo $rs['price']; ?> 元</span><?php endif; ?></p>
			<p style="display: flex;justify-content: space-around;width: 100%;"><a style="background:#ffdd33;padding: 0 35px;" href="<?php echo $rs['url']; ?>">兑换</a></p>
		</li>
	</ul>				
</div>			
		  <?php endforeach; endif; else: echo "" ;endif; ?> LISTPAGE--><?php endif; $__array__=fun('label@run_listpage_label','shop_list02',['mid'=>$mid,'fid'=>$fid,'page'=>$page,'dirname'=>__FILE__,'field'=>'','val'=>'','tpl'=>'','rows'=>'10','where'=>'','status'=>'','order'=>'list','by'=>'desc','cache_time'=>'0']);$pages=$__array__['pages'];$shop_list02=$__array__['cfg']; ?>
	</div>
	<!---异步显示更多调用一个显示更多的碎片模块[shop@content/showmore]，需要预设置如下参数[listurl：访问地址][thispage：开始页][TheListObj：插入对象][ThisRows：条数][listshops：子对象条数]--->
	<script>
		var listurl='<?php fun('label@label_listpage_ajax_url','shop_list02'); ?>';
		var thispage=1;
		var TheListObj=$('.Show_Shop_List');
		var ThisRows=<?php echo $shop_list02['rows']; ?>;	//每页显示几条 务必要注意,这里的变量名shop_list02必须要与上面的标签名一样,并且前面有$
		var listshops=$('.Show_Shop_List').children().length;	//当前页面显示了几条内容
	</script>
	<div class="qb_ui_ShowMores"><button onclick="showMoreInfo()">更多<i class="fa fa-angle-double-down"></i></button></div>
<script>
function showMoreInfo(){
	$('.qb_ui_ShowMores').html('内容加载中……');
	thispage++;
	$.get(listurl+thispage+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.qb_ui_ShowMores').html('');
			}else{
				res.data="<div class='pages"+thispage+"'>"+res.data+"</div>";			
				TheListObj.append(res.data);
				TheListObj.find('.pages'+thispage).hide();
				TheListObj.find('.pages'+thispage).fadeIn();
				$('.qb_ui_ShowMores').html('<button onclick="showMoreInfo()">更多 <i class="fa fa-angle-double-down"></i></button>');
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
function thisimg_over(imgobjs){
	imgobjs.animate({"width":"150%"},300);
}
function thisimg_out(imgobjs){
	imgobjs.animate({"width":"100%"},300);
}
function HiddenShowMores(){		
	if(parseInt(listshops/ThisRows)<1){
		$('.qb_ui_ShowMores').hide();
	}else{
		$('.qb_ui_ShowMores').show();
	}
}
HiddenShowMores();
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