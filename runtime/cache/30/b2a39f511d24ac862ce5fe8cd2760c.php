<?php
//000000003600
 exit();?>
a:2:{s:11:"shop_list02";s:1176:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
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
		  <?php endforeach; endif; else: echo "" ;endif; ?> ";s:11:"_filemtime_";i:1554719665;}