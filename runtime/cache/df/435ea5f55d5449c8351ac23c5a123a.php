<?php
//000000003600
 exit();?>
a:2:{s:13:"shop_index001";s:804:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="qb_ui_listShop_type2">
	<ul>
		<ol><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'" onmouseover='thisimg_over($(this))' onmouseout='thisimg_out($(this))'/></a></ol>
		<li>
			<div><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['title'],100); ?></a></div>
			<p><span>&yen;<?php echo $rs['price']; ?></span><a href="<?php echo $rs['url']; ?>">查看</a></p>
		</li>
	</ul>				
</div>			
		  <?php endforeach; endif; else: echo "" ;endif; ?> ";s:11:"_filemtime_";i:1554719654;}