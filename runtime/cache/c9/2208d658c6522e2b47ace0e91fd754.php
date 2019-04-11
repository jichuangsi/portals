<?php
//000000003600
 exit();?>
a:15:{s:8:"showroll";a:2:{s:4:"demo";s:1141:"<ul class="bigimg">
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="/public/static/index/toutiao/1_20170513080535_lh301.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="/public/static/index/toutiao/1_20170426090432_44xrf.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="/public/static/index/toutiao/1_20170426090452_ucyia.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="/public/static/index/toutiao/1_20170426090435_2djvz.jpg"></a></li>
</ul>
<input class="width" type="hidden" value="680">
<input class="height" type="hidden" value="400">
<ul class="ListTitle">
<li style=""><span>像我们一样年轻：绘画梦想</span></li>
<li style=""><span>同学两亿岁：外星女狂追校草</span></li>
<li style=""><span>妈妈是超人收官：安迪嗯哼同框</span></li>
<li style=""><span>爱国者：张鲁一佟丽娅精彩谍战</span></li>
</ul>
<div class="pages"><span class="now">1</span>/<span class="all">4</span></div>
<ul class="changeShow"><ol onclick="parv_changSlide3()"></ol><li onclick="next_changSlide3()"></li></ul>";s:3:"tpl";s:1106:" 


<ul class="bigimg">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="<?php echo $rs['picurl']; ?>"></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<input class="width" type="hidden" value="680">
<input class="height" type="hidden" value="400">
<ul class="ListTitle">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li style=""><span><?php echo $rs['title']; ?></span></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<div class="pages"><span class="now"><?php echo $i; ?></span>/<span class="all">4</span></div>
<ul class="changeShow"><ol onclick="parv_changSlide3()"></ol><li onclick="next_changSlide3()"></li></ul>
 ";}s:25:"news_list_page_listdata01";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:2429:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(( count($rs['picurls'])>3 )): ?>

<div class="ListArtic">
<div class="title"><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></div>
<ul class="morpic"><a href="<?php echo $rs['url']; ?>" target="_blank">
<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if(($i<5)): ?>
	<li><span><img src="<?php echo $pic['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></span></li>
<?php endif; endforeach; endif; else: echo "" ;endif; ?>
</a></ul>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id'],'cms'); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</div>
		
<?php elseif(( $rs['picurl']!='' )): ?>
<div class="ListArtic">
<ul class="pic_word">
	<ol><a href="<?php echo $rs['url']; ?>" target="_blank"><span><img src="<?php echo $rs['picurl']; ?>" onmouseover="thisimg_over($(this))" onmouseout="thisimg_out($(this))"></span></a></ol>
	<li><div class="title" target="_blank"><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],60); ?></a></div>
<p><?php echo get_word($rs['content'],200); ?></p>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id'],'cms'); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</li>
</ul>
</div>
<?php else: ?>
<div class="ListArtic">
<ul class="pic_word">
	<li><div class="title"><a  href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],60); ?></a></div>
<p><?php echo get_word($rs['content'],200); ?></p>
<dl class="moreinfo"><dt>浏览:<span><?php echo $rs['view']; ?></span>次 评论:<span><?php echo fun('comment@total',$rs['id'],'cms'); ?></span>条</dt><dd><?php echo format_time($rs['create_time']); ?></dd></dl>
</li>
</ul>
</div>
<?php endif; endforeach; endif; else: echo "" ;endif; ?> ";}s:5:"jubao";a:2:{s:4:"demo";s:80:" <img src="/public/static/index/toutiao/1_20170424110430_s0csd.png" border="0"> ";s:3:"tpl";s:80:" <img src="/public/static/index/toutiao/1_20170424110430_s0csd.png" border="0"> ";}s:6:"member";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:563:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul><ol><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['icon']; ?>" onerror="this.src='/public/static/index/toutiao/nobody.gif'"></a></ol><li><div><?php echo $rs['username']; ?></div><p>注册时间：<?php echo $rs['regdate']; ?></p></li></ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:10:"toutiaohot";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:399:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
			  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:14:"jingcaizhuanti";a:2:{s:4:"demo";s:786:"<ul class="bigimg">
<li style="opacity: 0; left: 100%;"><a href="#"><img src="/public/static/index/toutiao/1_20170424100456_ht0o6.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#"><img src="/public/static/index/toutiao/2.jpg"></a></li>
<li style="opacity: 0; left: 100%;"><a href="#"><img src="/public/static/index/toutiao/1_20170424100430_wtffg.jpg"></a></li>
</ul>
<input class="width" type="hidden" value="320">
<input class="height" type="hidden" value="200">
<ul class="ListTitle">
<li style="display: list-item;"><span>热身赛-内马尔复出破门 巴西2-0胜</span></li>
<li style="display: none;"><span>收藏版-2018俄罗斯世界杯分组赛程</span></li>
<li style="display: none;"><span>泡沫之夏：三个人的爱情博弈</span></li>
</ul>";s:3:"tpl";s:916:" 

<ul class="bigimg">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li style="opacity: 0; left: 100%;"><a href="#" ><img src="<?php echo $rs['picurl']; ?>"></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<input class="width" type="hidden" value="320">
<input class="height" type="hidden" value="200">
<ul class="ListTitle">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
<li style="display: none;"><span><?php echo $rs['title']; ?></span></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
 ";}s:9:"toutiao01";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:399:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
			  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:9:"toutiao02";a:2:{s:4:"demo";s:49:" <span>精彩视频</span><a href="#">更多</a> ";s:3:"tpl";s:49:" <span>精彩视频</span><a href="#">更多</a> ";}s:9:"toutiao03";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:561:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul> 
<ol><a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $rs['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></a></ol>
<li><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></li>
</ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:9:"toutiao04";a:2:{s:4:"demo";s:49:" <span>精彩图片</span><a href="#">更多</a> ";s:3:"tpl";s:49:" <span>精彩图片</span><a href="#">更多</a> ";}s:9:"toutiao05";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:561:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul> 
<ol><a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $rs['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></a></ol>
<li><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></li>
</ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:9:"toutiao06";a:2:{s:4:"demo";s:49:" <span>推荐商品</span><a href="#">更多</a> ";s:3:"tpl";s:49:" <span>推荐商品</span><a href="#">更多</a> ";}s:9:"toutiao07";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:561:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul> 
<ol><a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $rs['picurl']; ?>" style="max-width: 100%; max-height: 100%;"></a></ol>
<li><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></li>
</ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:5:"links";a:2:{s:4:"demo";s:145:" 
        <li><a href="" target="_blank"><img src="" title="" /></a></li>
        
        <li><a href="" target="_blank"></a></li>
         ";s:3:"tpl";s:744:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if(!(empty($rs['picurl']) || (($rs['picurl'] instanceof \think\Collection || $rs['picurl'] instanceof \think\Paginator ) && $rs['picurl']->isEmpty()))): ?>
        <li><a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $rs['picurl']; ?>" title="<?php echo $rs['title']; ?>" /></a></li>
        <?php else: ?>
        <li><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></li>
        <?php endif; endforeach; endif; else: echo "" ;endif; ?> ";}s:11:"_filemtime_";i:1554724683;}