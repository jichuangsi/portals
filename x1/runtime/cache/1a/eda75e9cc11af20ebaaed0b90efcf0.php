<?php
//000000003600
 exit();?>
a:2:{s:26:"wap_vote_index_option_list";a:2:{s:4:"demo";s:0:"";s:3:"tpl";s:1105:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	<dl class="sideVote">
		<dt>
			<a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png' "/></a>
		</dt>
		<dd>
			<h3>
				<a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a>
				<span>(<?php echo $rs['agree']; ?>票)</span>
			</h3>
			<p><?php echo get_word($rs['content'],62); ?></p>
			<div onclick="ChangeSelect($(this))">
			<?php if(get_sort($rs['fid'],'type','','vote')==1): ?>
			<em><input type="checkbox" name="ids[]" value="<?php echo $rs['id']; ?>"/></em>
			<?php else: ?>
				<span onclick="AgreeVote(<?php echo $rs['id']; ?>,<?php echo $rs['fid']; ?>,0)"><input type="radio" name="ids[0]" value="<?php echo $rs['id']; ?>"/></span>
			<?php endif; ?>
			
			</div>
		</dd>
	</dl>		
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:11:"_filemtime_";i:1554865530;}