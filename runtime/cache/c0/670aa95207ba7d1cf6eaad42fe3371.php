<?php
//000000003600
 exit();?>
a:3:{s:7:"member2";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:563:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul><ol><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['icon']; ?>" onerror="this.src='/public/static/index/toutiao/nobody.gif'"></a></ol><li><div><?php echo $rs['username']; ?></div><p>注册时间：<?php echo $rs['regdate']; ?></p></li></ul>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:10:"toutiaohot";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:396:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:11:"_filemtime_";i:1554718201;}