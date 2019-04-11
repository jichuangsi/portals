<?php
//000000003600
 exit();?>
a:2:{s:17:"bbs_list_page_wap";s:2133:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="lists">
			<ul>
				<ol><a href="<?php echo get_url('user',['uid'=>$rs['uid']]); ?>" target="_blank"><img style="border-radius:100%;" src="<?php echo get_user_icon($rs['uid']); ?>" onerror="this.src='/public/static/images/nobody.gif'" ></a><div><span><?php echo get_word($rs['username'],20); ?></span><em><?php echo format_time($rs['create_time'],true); ?> Re: <?php echo get_word($rs['replyuser'],8); ?></em></div></ol>
				<li><i class="fa fa-commenting-o"></i><span><?php echo $rs['replynum']; ?> </span> <label onclick="digg_topic(<?php echo $rs['id']; ?>,this)" style="margin-left:20px;"><i class="fa fa-thumbs-o-up"></i><em><?php echo $rs['agree']; ?></em></label> </li>
			</ul>
			<div class="title" onclick="window.location.href='<?php echo urls('content/show',['id'=>$rs['id']]); ?>'"><a href="<?php echo urls('content/show',['id'=>$rs['id']]); ?>"><?php if(($rs['list']>time())): ?><span>顶</span> <?php elseif(($rs['status']>1)): ?><em>精</em> <?php elseif(($rs['view']>200)): ?><i>热</i>  <?php elseif((time()-$rs['create_time']<3600*24)): ?><i>新</i> <?php endif; ?> <?php echo $rs['title']; ?></a></div>
			<?php $pics=$rs['picurls']?:fun('content@get_images',fun('bbs@getContents',$rs['id'])); if($pics): ?>
			<div class="pics" onclick="window.location.href='<?php echo urls('content/show',['id'=>$rs['id']]); ?>'">
			<?php if(is_array($pics) || $pics instanceof \think\Collection || $pics instanceof \think\Paginator): $i = 0; $__LIST__ = $pics;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;if($i<4): ?><dd style="background:url(<?php echo $vs['picurl']; ?>) no-repeat;background-position:center center;background-size:100% auto;"></dd><?php endif; endforeach; endif; else: echo "" ;endif; ?>
			</div>
			<?php endif; ?>
		</div>
		  <?php endforeach; endif; else: echo "" ;endif; ?> ";s:11:"_filemtime_";i:1554880750;}