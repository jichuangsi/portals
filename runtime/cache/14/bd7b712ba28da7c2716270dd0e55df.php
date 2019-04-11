<?php
//000000003600
 exit();?>
a:2:{s:25:"news_list_page_listdata01";s:3695:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>2 )): ?>
<div class="ListMorpic">
<div class="ListMorpic" onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
<a href="<?php echo $rs['url']; ?>"><ul>
<a href="<?php echo $rs['url']; ?>">
<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if(($i<4)): ?>
	<li><span><img src="<?php echo $pic['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></span></li>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>
</a>
</ul>
</a>
</div>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo date("Y-m-d",$rs['create_time']); ?></dd></dl>
</div>	
<?php elseif(( $rs['picurl']!='' )): ?>
	
<?php if(($rs['fid']!=15)): ?>
<ul class="pic_word" onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
	<ol><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>"></span></a></ol>
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a>
		<p onclick="window.location.href='<?php echo $rs['url']; ?>'"><?php echo get_word($rs['content'],94); ?></p>
	</div>
</li>
</ul>
<?php else: ?>
<ul onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
	<ol style="position: relative;"><p style="font-weight: bold;text-align: center;"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></p>
		<a href="<?php echo $rs['url']; ?>"><span style="width: 100%;display: flow-root;text-align: center;margin: 10px 0px;"><img style="width: 80%;max-width: 380px;" src="<?php echo $rs['picurl']; ?>"><div style="width: 50px;height: 50px;background: rgba(0,0,0,0.4);border-radius: 50px;position: absolute;top: 46%;left: 45%;display: flex;"><i style="margin: auto;color: #fff;" class="fa fa-play" aria-hidden="true"></i></div></span></a></ol>
</ul>
<?php endif; ?>
<div>
	<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo date("Y-m-d",$rs['create_time']); ?></dd></dl>
	
</div>
<?php else: ?>
<ul class="pic_word" onclick="xinwenclick(this,<?php echo $rs['id']; ?>)">
	<li><div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
	<p><?php echo get_word($rs['content'],94); ?></p>
</li>
</ul>
<dl class="moreinfo"><dt><i class="fa fa-eye" style="padding: 0px 10px;"><span style="margin-left: 3px;"><?php echo $rs['view']; ?></span></i> <i class="fa fa-commenting-o" style="padding: 0px 10px;" aria-hidden="true"><span style="margin-left: 3px;"><?php echo fun('comment@total',$rs['id'],'cms'); ?></span></i></dt><dd><?php echo date("Y-m-d",$rs['create_time']); ?></dd></dl>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> ";s:11:"_filemtime_";i:1554804772;}