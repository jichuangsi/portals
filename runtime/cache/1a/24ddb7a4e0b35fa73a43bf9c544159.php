<?php
//000000003600
 exit();?>
a:2:{s:17:"shop_show_rollpic";s:2316:" 
<link rel="stylesheet" href="/public/static/mui/css/mui.min.css">
<script type="text/javascript" src="/public/static/mui/js/mui.min.js"></script>
<link rel="stylesheet" href="/public/static/index/default/slider.css">
<div id="slider" class="mui-slider" >
	<div class="mui-slider-group mui-slider-loop">
		<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img style="max-height: 350px;" src="<?php echo end($info['picurls'])['picurl']; ?>"></a></div>
<?php if(is_array($info['picurls']) || $info['picurls'] instanceof \think\Collection || $info['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="mui-slider-item"><a href="#"><img style="max-height: 350px;" src="<?php echo $rs['picurl']; ?>"></a></div>
<?php endforeach; endif; else: echo "" ;endif; ?>
		<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img style="max-height: 350px;" src="<?php echo $info['picurls']['0']['picurl']; ?>"></a></div>
	</div>
	<div class="mui-slider-indicator">
<?php if(is_array($info['picurls']) || $info['picurls'] instanceof \think\Collection || $info['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;?>
		<div  class="mui-indicator <?php if($i == '1'): ?>mui-active<?php endif; ?>"></div>
<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
</div>
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
		$('.body_Hearcont').text('霸币商城');
		$('.body_Hearcont').append('<a href="#" style="position: absolute;left: 9px;top: 14px;color: #fff;font-size: 30px;" onclick="window.history.back();" class="fa fa-reply"> </a>');
		$('.body_Hearcont').append('<a style="position: absolute;right: 10px;color: #000000;" href="<?php echo urls('car/index'); ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>');
	});
</script>
<script type="text/javascript" charset="utf-8">var slider = mui("#slider");</script>
 ";s:11:"_filemtime_";i:1554715854;}