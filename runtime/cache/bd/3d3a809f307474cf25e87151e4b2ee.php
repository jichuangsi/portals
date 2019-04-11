<?php
//000000003600
 exit();?>
a:4:{s:12:"pc_indexpage";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:383:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<li><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></li>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:18:"pc_qun_list_member";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:656:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<li><a href="<?php echo $rs['url']; ?>" target="_blank" title="<?php echo get_word($rs['content'],200); ?>"><span><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"  onmouseover="changeShowImg($(this),'over');" onmouseout="changeShowImg($(this),'out');" ></span><em><?php echo $rs['title']; ?></em></a></li>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:16:"pc_bbsindex_link";a:2:{s:4:"demo";s:511:" 
						<li><a href="http://www.qibomb.com" target="_blank">齐博模板网</a></li>
						<li><a href="http://www.qibomoban.com" target="_blank">齐博模板堂</a></li>
						<li><a href="http://www.admin5.net/" target="_blank">A5站长网</a></li>
						<li><a href="http://www.im286.com/" target="_blank">落伍者</a></li>
						<li><a href="http://www.qibosoft.com" target="_blank">齐博软件</a></li>
						<li><a href="http://www.chinaccnet.com/" target="_blank">中电云集</a></li>
						   ";s:3:"tpl";s:804:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<li><a href="http://www.qibomb.com" target="_blank">齐博模板网</a></li>
						<li><a href="http://www.qibomoban.com" target="_blank">齐博模板堂</a></li>
						<li><a href="http://www.admin5.net/" target="_blank">A5站长网</a></li>
						<li><a href="http://www.im286.com/" target="_blank">落伍者</a></li>
						<li><a href="http://www.qibosoft.com" target="_blank">齐博软件</a></li>
						<li><a href="http://www.chinaccnet.com/" target="_blank">中电云集</a></li>
						  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:11:"_filemtime_";i:1554866052;}