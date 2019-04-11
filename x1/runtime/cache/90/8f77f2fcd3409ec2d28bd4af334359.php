<?php
//000000003600
 exit();?>
a:3:{s:18:"wap_index_rollpic2";a:2:{s:4:"demo";s:1099:"
<link rel="stylesheet" href="/public/static/index/default/slider.css">
<div id="slider" class="mui-slider">
		<div class="mui-slider-group mui-slider-loop">
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/public/static/images/4.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/images/1.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/images/2.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/images/3.jpg"></a></div>
			<div class="mui-slider-item"><a href="#"><img src="/public/static/images/4.jpg"></a></div>
			<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img src="/public/static/images/1.jpg"></a></div>
		</div>
		<div class="mui-slider-indicator">
			<div class="mui-indicator mui-active"></div>
			<div class="mui-indicator"></div>
			<div class="mui-indicator"></div>
			<div class="mui-indicator"></div>
		</div>
</div>
<script type="text/javascript" charset="utf-8">var slider = mui("#slider");</script>
";s:3:"tpl";s:1559:" 

	
	
<link rel="stylesheet" href="/public/static/index/default/slider.css">
<div id="slider" class="mui-slider" >
	 <div class="mui-slider-group mui-slider-loop">
		<div class="mui-slider-item mui-slider-item-duplicate"><a href="<?php echo end($listdb)['url']; ?>"><img alt="<?php echo end($listdb)['title']; ?>" src="<?php echo end($listdb)['picurl']; ?>"></a></div>
		<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="mui-slider-item"><a href="<?php echo $rs['url']; ?>"><img alt="<?php echo $rs['title']; ?>" src="<?php echo $rs['picurl']; ?>"></a></div>
		<?php endforeach; endif; else: echo "" ;endif; ?>
		<div class="mui-slider-item mui-slider-item-duplicate"><a href="<?php echo $listdb['0']['url']; ?>"><img alt="<?php echo $listdb['0']['title']; ?>" src="<?php echo $listdb['0']['picurl']; ?>"></a></div>
	</div>
	<div class="mui-slider-indicator">
		<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="mui-indicator <?php if($i == '1'): ?>mui-active<?php endif; ?>"></div>
		<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
</div>
<script type="text/javascript" charset="utf-8">var slider = mui("#slider");</script>
 ";}s:25:"news_list_page_listdata01";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:2774:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>2 )): ?>
<div class="ListMorpic">
<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
<a href="<?php echo $rs['url']; ?>"><ul>
<a href="<?php echo $rs['url']; ?>">
<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if(($i<4)): ?>
	<li><span><img src="<?php echo $pic['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></span></li>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>
</a>
</ul>
</a>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>
</div>	
<?php elseif(( $rs['picurl']!='' )): ?>
<ul class="pic_word">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>"></span></a></ol>
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a>
		<p onclick="window.location.href='<?php echo $rs['url']; ?>'"><?php echo get_word($rs['content'],94); ?></p>
	</div>
</li>
</ul>
<div>
	<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>
</div>
<?php else: ?>
<ul class="pic_word">
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
	<p><?php echo get_word($rs['content'],94); ?></p>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo gettime($rs['create_time'],time()) ?></dd></dl>
</li>
</ul>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> ";}s:11:"_filemtime_";i:1554803569;}