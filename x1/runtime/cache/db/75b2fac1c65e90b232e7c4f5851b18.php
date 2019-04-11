<?php
//000000003600
 exit();?>
a:2:{s:18:"wap_bbs_rollpic001";a:2:{s:4:"demo";s:578:"
		<div class="mui-slider-group mui-slider-loop">
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/public/static/group/circle/wapbanner.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/group/circle/wapbanner.jpg"></a></div> 
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/public/static/group/circle/wapbanner.jpg"></a></div>
		</div>
		<div class="mui-slider-indicator">
			<div class="mui-indicator mui-active"></div>
			<div class="mui-indicator"></div> 
		</div>
";s:3:"tpl";s:1129:" 

		<div class="mui-slider-group mui-slider-loop">
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="<?php echo end($picdb)['picurl']; ?>"></a></div>
			<?php if(is_array($picdb) || $picdb instanceof \think\Collection || $picdb instanceof \think\Paginator): $i = 0; $__LIST__ = $picdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?><div class="mui-slider-item"><a href="#"><img src="<?php echo $rs['picurl']; ?>"></a></div> <?php endforeach; endif; else: echo "" ;endif; ?>
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="<?php echo array_shift($picdb)['picurl']; ?>"></a></div>
		</div>
		<div class="mui-slider-indicator">
			<div class="mui-indicator mui-active"></div>
			<?php if(is_array($picdb) || $picdb instanceof \think\Collection || $picdb instanceof \think\Paginator): $i = 0; $__LIST__ = $picdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?><div class="mui-indicator"></div> <?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
 ";}s:11:"_filemtime_";i:1554880750;}