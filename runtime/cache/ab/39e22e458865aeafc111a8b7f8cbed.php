<?php
//000000003600
 exit();?>
a:2:{s:19:"wap_signin_index001";a:2:{s:4:"demo";s:504:" 
	    <div class='lists list' style="margin-bottom: 15px;">
	      <div class='icon'><a href=""><img src="" onerror="this.src='/public/static/images/nobody.gif'"></a></div>
	      <div class='infos'>
	        <div class='name'><div class='num'>NO.</div><text></text></div>
	        <div class='more'>
	          <div class='iconfont'><i class="fa fa-database"></i>积分：<text>个</text></div>
	          <div class='time fa fa-clock-o'> </div>
	        </div>
	      </div>
	    </div>
   ";s:3:"tpl";s:1049:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	    <div class='lists list<?php echo $rs['rank']; ?>' style="margin-bottom: 15px;">
	      <div class='icon'><a href="<?php echo get_url('user',$rs['uid']); ?>"><img src="<?php echo get_user_icon($rs['uid']); ?>" onerror="this.src='/public/static/images/nobody.gif'"></a></div>
	      <div class='infos'>
	        <div class='name'><div class='num'>NO.<?php echo $rs['rank']; ?></div><text><?php echo get_user_name($rs['uid']); ?></text></div>
	        <div class='more'>
	          <div class='iconfont'><i class="fa fa-database"></i>积分：<text><?php echo $rs['money']; ?>个</text></div>
	          <div class='time fa fa-clock-o'> <?php echo format_time($rs['create_time'],"H:i"); ?></div>
	        </div>
	      </div>
	    </div>
  <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:11:"_filemtime_";i:1554721258;}