<?php
//000000003600
 exit();?>
a:2:{s:25:"news_list_page_listdata01";s:2314:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>3 )): ?>

<div class="ListArtic">
<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
<ul class="morpic"><a href="<?php echo $rs['url']; ?>">
<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if(($i<5)): ?>
	<li><span><img src="<?php echo $pic['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></span></li>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>
</a></ul>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id']); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</div>
		
<?php elseif(( $rs['picurl']!='' )): ?>
<div class="ListArtic">
<ul class="pic_word">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>" onmouseover="thisimg_over($(this))" onmouseout="thisimg_out($(this))"></span></a></ol>
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['title'],60); ?></a></div>
<p><?php echo get_word($rs['content'],200); ?></p>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id']); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</li>
</ul>
</div>
<?php else: ?>
<div class="ListArtic">
<ul class="pic_word">
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['title'],60); ?></a></div>
<p><?php echo get_word($rs['content'],200); ?></p>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id']); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</li>
</ul>
</div>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> ";s:11:"_filemtime_";i:1554718201;}