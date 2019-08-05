<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:75:"D:\web\Education\portals\template/index_style/default/hy\index/pc_index.htm";i:1563158317;s:70:"D:\web\Education\portals\template/index_style/toutiao/index/layout.htm";i:1555325357;s:73:"D:\web\Education\portals\template\index_style\default\index\min_login.htm";i:1554707864;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo !empty($webdb['mseo_title'])?$webdb['mseo_title']:$webdb['seo_title']; ?></title>
<meta name="keywords" content='<?php echo !empty($webdb['mseo_keyword'])?$webdb['mseo_keyword']:$webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo !empty($webdb['mseo_description'])?$webdb['mseo_description']:$webdb['seo_description']; ?>'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="shortcut icon" type="image/x-icon" href="/public/static/index/toutiao/favicon.ico">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/reset.css">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/cms.css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
<script type="text/javascript" src="/public/static/index/toutiao/kefu.js"></script>
</head>

<body>
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展  -->
<?php echo hook_listen('layout_body_head',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/head.css">
<div class="TopContBox">
	<ul>
		<ol><a href="$webdb[www_url]" class="home"><img src="/public/static/index/toutiao/home.png"></a></ol>
		<li>
<div class="qb_pc_topBox">
	<ul>		
<?php if(!(empty($userdb) || (($userdb instanceof \think\Collection || $userdb instanceof \think\Paginator ) && $userdb->isEmpty()))): ?>
		<ol><?php echo $userdb['username']; ?> 您好！欢迎来到 <a href="/index.php/cms/list-9.html" style="color: blue;"><?php echo $webdb['webname']; ?></a></ol>
		<li><a href="<?php echo get_url('member'); ?>" target="_blank">进入会员中心</a> <a href="<?php echo get_url('quit'); ?>?quiturl=<?php echo get_url('location'); ?>" >安全退出</a></li>
<?php else: ?>
		<ol> 您好！欢迎来到<a href="/index.php/cms/list-9.html" style="color: blue;"><?php echo $webdb['webname']; ?></a></ol>
		<li>
			<form action="<?php echo urls('index/login/index'); ?>" method="post">
	<input type="hidden" name="fromurl" value="<?php echo get_url('location'); ?>">
	<div class="qb_ui_TopLoginBox">
		<span>通行证</span>
		<span><input type="text" name="username" minlength="2" placeholder="输入帐号" required/></span>
		<span><input type="password" name="password" minlength="5" placeholder="输入密码" required/></span>
		<span><button type="submit">登录</button></span>
		<span><a href="<?php echo get_url('reg'); ?>">注册</a> | <a href="<?php echo get_url('login'); ?>">登录</a></span>
		<!--<span><a href="<?php echo purl('login/qq/index'); ?>" class="fa fa-qq"> 登录</a></span>
		<span><a href="<?php echo purl('weixin/login/index'); ?>" class="fa fa-weixin"> 登录</a></span>-->
	</div>
</form>
		</li>
<?php endif; ?>
	</ul>
</div>
		</li>
	</ul>
</div>


<link rel="stylesheet" href="/public/static/group/circle/circle.css">
<div class="contbox">
	<div class="content">
		<div class="maincont1">
			<div class="cont_banner">
				<div class="images">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_hy_banner_001	image	-->
				<a href="#"><img src="/public/static/group/circle/banner.png" width="790" height="385" /></a>
 QB--><?php endif; $pc_hy_banner_001 = fun('label@run_label','pc_hy_banner_001',['val'=>'','list'=>'rs','systype'=>'image','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?></div>
				<div class="title"><?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_hy_002	text	--><a href="#">共同建设美丽新农村</a> QB--><?php endif; $pc_hy_002 = fun('label@run_label','pc_hy_002',['val'=>'','list'=>'rs','systype'=>'text','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?></div>
			</div>
			<div class="cont_mylist">
				<div class="cont">
					<div class="myinfo">
						<div class="img"><img src="<?php echo get_qrcode(); ?>" width="84" height="84" /></div>
						<div class="word">
							<div class="w">扫一扫,手机访问 <em class="green">附近商家</em></div>
							<div class="g">
								<a href="<?php echo murl('content/postnew'); ?>" class="g_a1 _pop">创建商铺</a>
								<a href="<?php echo murl('content/index'); ?>" class="g_a2 _pop">我的商铺</a>
							</div>
						</div>
					</div>
					<div class="cont_list">
						<ul>
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_pc_index_001	bbs	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
							<li><span style="<?php if($i < '4'): ?>background:#1bb76d;<?php endif; ?>"><?php echo $i; ?></span><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],50); ?></a></li>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_pc_index_001 = fun('label@run_label','hy_pc_index_001',['val'=>'','list'=>'rs','systype'=>'bbs','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'6','class'=>'','order'=>'view','by'=>'desc','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0' ,'mid'=>'1' ]); ?>
						</ul>
					</div>
				</div>
			</div>
		</div><!--maincont1 end-->


		<div class="maincont2">
			<div class="cont_search">
				<div class="mysearch">
					<form class="search_box" action="<?php echo url('search/index/lists'); ?>" method="post">
						<select class="select_box">
							<option value="0">商家</option>
							<option value="1">商品</option>
						</select>
						<div class="text_box"><input type="text" name="keyword" value="请输入搜索关键词"></div>
						<input type="submit" value="" class="button_box">
					</form>
				</div>
				<div class="write_box"><a href="<?php echo murl('content/postnew'); ?>" target="_blank" class="_pop">创建商铺</a></div>
			</div>
		</div>
<!--testcss-->
<!--<link rel="stylesheet" href="/public/static/group/circle/swiper.min.css">-->
<link rel="stylesheet" href="/public/static/libs/swiper/swiper.min.css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css">
		<div class="maincont3">
			<div class="sub_head">
				<div class="tag"><span style="background:url(/public/static/group/circle/cont_hot.png) no-repeat left center;">推荐商家</span></div>
			</div>
			<div class="myvillage">
<!-- Swiper -->
			  <div class="swiper-container">
			    <div class="swiper-wrapper">

			      <div class="swiper-slide">
					<ul class="pc_index_showqun001_1">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_index_showhy001	hy	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<li class="list">
							<div class="mylist">
								<dl>
									<dt>
										<a href="<?php echo $rs['url']; ?>" target="_blank"><img onerror="this.src='/public/static/images/nopic.png'" src="<?php echo $rs['picurl']; ?>" alt="tupian"></a>
									</dt>
									<dd>
										<h2><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a></h2>
										<div>
											<span><i class="fa fa-fw fa-user-o"></i>电话: <em><?php echo $rs['telphone']; ?></em> </span>
											<span><i class="fa fa-fw fa-file-text-o"></i>地址: <?php echo $rs['address']; ?></span>
											 
										</div>
									</dd>
								</dl>
								<div class="mytopic">
									<h3>商家介绍</h3>
									<ul>
										<li style="height:40px;"><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['content'],110); ?></a></li>
										 
									</ul>
								</div>
							</div>
						</li>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $pc_index_showhy001 = fun('label@run_label','pc_index_showhy001',['val'=>'','list'=>'rs','systype'=>'hy','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'6','class'=>'','order'=>'id','by'=>'desc','status'=>'2','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
					</ul>
			      </div>
			     <!--swiper-slide-->

			      <div class="swiper-slide">
					<ul class="pc_index_showqun001_2">
					</ul>
			      </div>
			     <!--swiper-slide-->

			      <div class="swiper-slide">
					<ul class="pc_index_showqun001_3">
					</ul>
			      </div>
			     <!--swiper-slide-->

			    </div>
<!-- Add Pagination -->
			    <div class="swiper-button-next"></div>
    			<div class="swiper-button-prev"></div>
			  </div>
<script type="text/javascript">
function show_qun_index(typeurl,divcode){
	$.get('<?php fun("label@label_ajax_url","pc_index_showhy001",__FILE__); ?>1&'+typeurl+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("内容不存在！",{time:500});
			}else{
				$('.'+divcode).html(res.data);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
show_qun_index("union=order,by&order=replynum&by=desc",'pc_index_showqun001_2');
show_qun_index("union=order,by&order=view&by=desc",'pc_index_showqun001_3');
</script>
<!-- Swiper JS -->
<script type="text/javascript" src="/public/static/group/circle/swiper.min.js"></script>

<!-- Initialize Swiper -->
<script>
var swiper = new Swiper('.swiper-container', {
  slidesPerView: 1,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
  navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
   },
});
</script>
			</div>
<!-- Swiper end -->

		</div>

		
		
		<div class="maincont4">
			<div class="sub_head">
				<div class="tag"><span style="background:url(/public/static/group/circle/cont_good.png) no-repeat left center;">商家动态</span></div>
				<div class="more">
					 
					<div><a href="javascript:;">餐饮</a></div>
					<div><a href="javascript:;">休闲</a></div>
					<div><a href="javascript:;">服务</a></div>
				</div>
			</div>
			<div class="cont">
				<div class="cont_good">
						<div class="prev"><span>上一个</span></div>
						<div class="next"><span>下一个</span></div>
						<div class="piclistbox">
							<ul class="piclist">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_pc_index_003	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
								<li class="list"><a href="<?php echo $rs['url']; ?>"><img onerror="this.src='/public/static/images/nopic.png'" src="<?php echo $rs['picurl']; ?>" height="104" /></a></li>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_pc_index_003 = fun('label@run_label','hy_pc_index_003',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0' ,'mid'=>'2' ]); ?>
							</ul>
						</div>
				</div>
<script>
//////////幻灯片控制开始////////////
var box_width=220;
var slide_length=$('.piclist .list').length;
var max_list=slide_length-4;
var nowList=1;
function next_slide(){
nowList++;
if(nowList>max_list){
	nowList=1;
}
change_slide(nowList);
}
function prev_slide(){
nowList--;
if(nowList<1){
	nowList=max_list;
}
change_slide(nowList);
}
function change_slide(num){
var thisnum=(num-1);
var left_width=box_width*thisnum;
$('.piclistbox .piclist').animate({'left':'-'+left_width+'px'},500);
}
$('.cont_good .prev').click(function(){
prev_slide();
});
$('.cont_good .next').click(function(){
next_slide();
});
//////////幻灯片控制结束////////
</script>
			</div>
		</div><!--maincont4 end-->
		
		<div class="maincont5">
			<div class="side_left">
				<div class="side_mhead">
					<div class="tit"><span>推荐商品</span></div>
				</div>
				<div class="cont shoptopic">
					<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_pc_index_shop_003	shop	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<div class="topics_list">  
						<div class="topics">          
							<div><a href="<?php echo $rs['url']; ?>"><img onerror="this.src='/public/static/images/nopic.png'" src="<?php echo $rs['picurl']; ?>" width="225" height="170" /></a></div>
							<div class="title"><span><?php echo $rs['title']; ?></span></div>
						</div>
						<div><span>价格: <em class="green">￥ <?php echo $rs['price']; ?> 元</em></span></div>
					</div>					
					  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_pc_index_shop_003 = fun('label@run_label','hy_pc_index_shop_003',['val'=>'','list'=>'rs','systype'=>'shop','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'6','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'shoptopic','cache_time'=>'0'  ]); ?>
				</div>
			</div>
			<div class="side_right">
				<div class="side_mhead">
					<div class="tit"><span>最新加入</span></div>
				</div>
				<div class="cont quntopic01">
					<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_pc_index_qun_004	qun	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<dl class="peolist" style="margin-bottom:10px;clear:both;">
						<dt style="margin-bottom:20px;float:left; "><a href="<?php echo $rs['url']; ?>"><img onerror="this.src='/public/static/images/nopic.png'" src="<?php echo $rs['picurl']; ?>" width="90" height="90" /></a></dt>
						<dd style="margin-left:10px;float:left;">
							<div style="padding-bottom:10px;"><a href="<?php echo $rs['url']; ?>" class="orange"><?php echo $rs['title']; ?></a></div>
							<div><span>介绍：</span><?php echo get_word($rs['content'],100); ?></div>
						</dd>
					</dl>
					  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_pc_index_qun_004 = fun('label@run_label','hy_pc_index_qun_004',['val'=>'','list'=>'rs','systype'=>'qun','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'4','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'quntopic01','cache_time'=>'0'  ]); ?>

				</div>
			</div>
		</div><!--maincont5 end-->
		
		<div class="maincont6" style="display:none;">
			<div class="side_mhead">
				<div class="tit"><span>人气村庄</span></div>
			</div>
			<div class="share_left">
				<div class="cont">
					<dl class="peolist">
						<dt><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'" width="90" height="90" /></a></dt>
						<dd>
							<div>
								<p><?php echo get_word($rs['content'],200); ?>
								</p>
							</div>
							<div class="come_from"><span><a href="<?php echo $rs['url']; ?>"><em class="orange"><?php echo $rs['title']; ?></em></a>创建于<em class="green"><?php echo $rs['time']; ?></em></span></div>
						</dd>
					</dl>
					<dl class="peolist">
						<dt><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'" width="90" height="90" /></a></dt>
						<dd>
							<div>
								<p><?php echo get_word($rs['content'],200); ?>
								</p>
							</div>
							<div class="come_from"><span><a href="<?php echo $rs['url']; ?>"><em class="orange"><?php echo $rs['title']; ?></em></a>创建于<em class="green"><?php echo $rs['time']; ?></em></span></div>
						</dd>
					</dl>
					<dl class="peolist">
						<dt><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'" width="90" height="90" /></a></dt>
						<dd>
							<div>
								<p><?php echo get_word($rs['content'],200); ?>
								</p>
							</div>
							<div class="come_from"><span><a href="<?php echo $rs['url']; ?>"><em class="orange"><?php echo $rs['title']; ?></em></a>创建于<em class="green"><?php echo $rs['time']; ?></em></span></div>
						</dd>
					</dl>
				</div>
			</div>
			<div class="share_right">
				<div class="cont">
					<div class="share_head">
						<div class="share_nav" onclick="chagetype(0)"><a href="javascript:;">乡村话题</a></div>
						<div onclick="chagetype(1)"><a href="javascript:;">最新话题</a></div>
						<div onclick="chagetype(2)" style="border:none;"><a href="javascript:;">乡村资讯</a></div>
					</div>
					<div>
						<div class="share_right_cont">
							<div class="share_cont_list">
								<ul>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
								</ul>
							</div>
							<div class="share_cont_list">
								<ul>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
								</ul>
							</div>
							<div class="share_cont_list">
								<ul>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
									<li><a href="#">中国平安积极应对南方洪涝灾害</a><span class="green">创意摄影</span></li>
									<li><a href="#">推荐几款性价比高的微单相机</a><span class="green">创意摄影</span></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
<script>
function chagetype(num){
$('.share_head div').removeClass('share_nav');
$('.share_head div').eq(num).addClass('share_nav');
$('.share_right_cont .share_cont_list').hide();
$('.share_right_cont .share_cont_list').eq(num).show();
}
chagetype(0);
</script>
			</div>
		</div><!--maincont6 end-->
		
	</div><!--content end-->
</div>

<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/foot.css">
<div id="copyright" style="display: none;">
    <div>Copyright@<?php echo $webdb[www_url]; ?> all rights reserved <a href="http://www.miibeian.gov.cn" target="_blank"><?php echo $webdb['miibeian_gov_cn']; ?></a></div>
	<?php echo $webdb['copyright']; ?>
</div>
<!-- 在线客服 开始 -->
<div id="top"></div>
<!-- 在线客服 结束 -->
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_foot',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<script type="text/javascript" src="/public/static/js/qibo.js"></script>
</body>
</html>