<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:76:"D:\web\Education\portals\template/index_style/default/hy\content/pc_show.htm";i:1561028404;s:70:"D:\web\Education\portals\template/index_style/toutiao/index/layout.htm";i:1555325357;s:73:"D:\web\Education\portals\template\index_style\default\index\min_login.htm";i:1554707864;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo $info['title']; ?></title>
<meta name="keywords" content='<?php echo !empty($info['keywords'])?$info['keywords']:$info['title']; ?>  <?php echo $s_info['name']; ?> '>
<meta name="description" content='<?php echo get_word(del_html($info['content']),300); ?>'>
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


<link rel="stylesheet" href="/public/static/group/circle_list/circle_list.css">
<div class="contbox">
	<div class="content">
<script type="text/javascript">
function joinGroup(id){
	$.get("<?php echo urls('wxapp.member/join',['id'=>$id]); ?>?"+Math.random(),function(res){
		if(res.code==0){
			layer.alert("加入成功！");
		}else{
			layer.alert("加入失败:"+res.msg);
		}	
	});
}
</script>	
		<div class="maincont1">
			<div class="main">
				<div class="showimg">
					<div class="img"><img src="<?php echo $info['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'" width="125" height="125" /></div>
					<div class="word">
						<div class="join"><a href="#"><?php echo $info['title']; ?></a><!--<a href="#" class="a_nav">申请加入</a>--></div>
						 <div class="who">电话：<em class="green"><?php echo $info['telphone']; ?></em></div>
						<div class="who">地址：<em class="green"><?php echo $info['address']; ?></em></div>
						<div class="who">访问量：<em class="green"><?php echo $info['view']; ?></em></div>
						<div class="who">入驻时间：<em class="green"><?php echo format_time($info['create_time']); ?></em></div>
					</div>
				</div>
				<div class="how">
					<div class="h_nav">
					<a href="<?php echo murl('shop/content/add',['mid'=>1,'ext_id'=>$id]); ?>" class="R">发布商品</a>						
						<div class="mores">
							<a href="<?php echo urls('cms/add',['aid'=>$id,'mid'=>1]); ?>">发布资讯</a>
							<a href="<?php echo urls('cms/add',['aid'=>$id,'mid'=>2]); ?>">发布图片动态</a>
							<a href="<?php echo urls('bbs/add',['aid'=>$id]); ?>">发布话题</a>
						</div>
					</div>
					<div class="h_nav"><a href="#" onclick="joinGroup(<?php echo $id; ?>)" class="E">加入会员</a></div>
					<div class="h_code">
						<p><img src="<?php echo get_qrcode(); ?>" width="95" height="95" /></p>
						<p>访问手机版</p>
					</div>
				</div>
			</div>
		</div><!--maincont1 end-->
		
		<div class="maincont2">
			<div class="left">
				<div class="main">
					<div class="shead">
						<div class="tag">
							<div class="first" onclick="chagetype(0)"><a href="javascript::;">商品</a></div>
							<div onclick="chagetype(1)"><a href="javascript::;">资讯</a></div>
							<div onclick="chagetype(2)"><a href="javascript::;">图片</a></div> 
							<div onclick="chagetype(3)"><a href="javascript::;">话题</a></div>
						</div>
						 
					</div>
					<div class="listbox">

						<div class="cont hy_pcshow_shop001">
							<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_pcshow_shop001	shop	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
							<div class="product">
								<div class="img"><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'" width="240" height="180" /></a></div>
								<div class="info">
									<div class="w"><img src="<?php echo $rs['user_icon']; ?>" width="50" height="50" /></div>
									<div class="t">
										<div><a href="<?php echo get_url('user',$rs['uid']); ?>" class="green"><?php echo $rs['username']; ?></a></div>
										<div><span style="color:#999999;">价格：</span><span>￥ <?php echo $rs['price']; ?> 元</span></div>
									</div>
								</div>
							</div>
							  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_pcshow_shop001 = fun('label@run_label','hy_pcshow_shop001',['union'=>'ext_id','ext_id'=>$id,'val'=>'','list'=>'rs','systype'=>'shop','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'6','class'=>'','order'=>'id','by'=>'asc','where'=>'','whereor'=>'','sql'=>"",'js'=>'hy_pcshow_shop001','cache_time'=>'0'  ]); ?>
						</div>
						
						<div class="cont hy_pcshow_news001">
								<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_pcshow_news001	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
								<div class="list">
									<div class="list_left">
										<div class="title"><span style="color:orange;"><?php if(($rs['status']>1)): ?>精<?php elseif((time()-$rs['create_time']<3600*24)): ?>新<?php elseif(($rs['view']>10)): ?>热<?php endif; ?></span><a href="<?php echo $rs['url']; ?>"><?php echo get_word($rs['title'],50); ?></a></div>
										<!--<div class="info" style="display:none"><p>这是介绍</p></div>-->
										<?php if((count($rs['picurls'])>2)): ?>
										<div class="pic" style="margin-bottom:0;">
											<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if($i < '6'): ?>
											<a href="<?php echo $rs['url']; ?>" target="_blank"><img src="<?php echo $pic; ?>"onerror="this.src='/public/static/images/nopic.png'" width="78" height="78" /></a>
											<?php endif; endforeach; endif; else: echo "" ;endif; ?>
										</div>
										<?php endif; ?>
									</div>
									<div class="list_right">
										<div class="o"><a href="<?php echo get_url('user',$rs['uid']); ?>" class="orange" target="_blank"><?php echo $rs['username']; ?></a> <span style="float:right;"><?php echo $rs['time']; ?></span></div>
									</div>
								</div>
							   <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_pcshow_news001 = fun('label@run_label','hy_pcshow_news001',['union'=>'ext_id','ext_id'=>$id,'val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'8','class'=>'','order'=>'id','by'=>'asc','where'=>'','whereor'=>'','sql'=>"",'js'=>'hy_pcshow_news001','cache_time'=>'0' ,'mid'=>'1' ]); ?>
						</div>

						<div class="cont hy_pcshow_photo001">
							<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_pcshow_photo001	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
							<div class="product">
								<div class="img"><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'" width="240" height="180" /></a></div>
								<div class="info">
									<div class="w"><img src="<?php echo $rs['user_icon']; ?>" width="50" height="50" /></div>
									<div class="t">
										<div><a href="<?php echo get_url('user',$rs['uid']); ?>" class="green" target="_blank"><?php echo $rs['username']; ?></a></div>
										<div><span style="color:#999999;">时间</span><span> <?php echo $rs['time']; ?></span></div>
									</div>
								</div>
							</div>
							  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_pcshow_photo001 = fun('label@run_label','hy_pcshow_photo001',['union'=>'ext_id','ext_id'=>$id,'val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'6','class'=>'','order'=>'id','by'=>'asc','where'=>'','whereor'=>'','sql'=>"",'js'=>'hy_pcshow_photo001','cache_time'=>'0' ,'mid'=>'2' ]); ?>
						</div>

						<div class="cont hy_pcshow_bbs001">
								<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_pcshow_bbs001	bbs	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
								<div class="list">
									<div class="list_left">
										<div class="title"><span style="color:orange;"><?php if(($rs['status']>1)): ?>精<?php elseif((time()-$rs['create_time']<3600*24)): ?>新<?php elseif(($rs['view']>10)): ?>热<?php else: ?><?php echo $rs['view']; endif; ?></span><a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],50); ?></a></div>
										<!--<div class="info" style="display:none"><p>这是介绍</p></div>-->
										<?php if((count($rs['picurls'])>2)): ?>
										<div class="pic" style="margin-bottom:0;">
											<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if($i < '6'): ?>
											<a href="<?php echo $rs['url']; ?>"><img src="<?php echo $pic; ?>"onerror="this.src='/public/static/images/nopic.png'" width="78" height="78" /></a>
											<?php endif; endforeach; endif; else: echo "" ;endif; ?>
										</div>
										<?php endif; ?>
									</div>
									<div class="list_right">
										<div class="n"><a href="<?php echo get_url('user',$rs['uid']); ?>" target="_blank" class="orange"><?php echo $rs['username']; ?></a></div>
										<div class="o"><span style="background:url(/public/static/group/circle_list/what.png) no-repeat left center; padding-left:25px;"><?php echo $rs['replynum']; ?></span><span style="float:right;"><?php echo $rs['time']; ?></span></div>
									</div>
								</div>
							   <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_pcshow_bbs001 = fun('label@run_label','hy_pcshow_bbs001',['union'=>'ext_id','ext_id'=>$id,'val'=>'','list'=>'rs','systype'=>'bbs','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'8','class'=>'','order'=>'id','by'=>'asc','where'=>'','whereor'=>'','sql'=>"",'js'=>'hy_pcshow_bbs001','cache_time'=>'0'  ]); ?>
						</div>
						
										
					</div>
					<div class="ShowMores" style="background:#eee;text-align:center;padding:10px;">显示更多...</div>
				</div>
<script type="text/javascript">

var ajax_url_db = ['<?php fun("label@label_ajax_url","hy_pcshow_shop001",__FILE__); ?>','<?php fun("label@label_ajax_url","hy_pcshow_news001",__FILE__); ?>','<?php fun("label@label_ajax_url","hy_pcshow_photo001",__FILE__); ?>','<?php fun("label@label_ajax_url","hy_pcshow_bbs001",__FILE__); ?>'];
var content_div_db = ['hy_pcshow_shop001','hy_pcshow_news001','hy_pcshow_photo001','hy_pcshow_bbs001'];
var choose_i = 0; //选中第几项
var shoppage = 1;
var haveshowpage = []; //每一项,作个标志,已经已显示到第几页
//显示更多
function showMoreContent(){	
	var url = ajax_url_db[choose_i];	//第几项对应的网址
	shoppage++;
	haveshowpage[choose_i] = shoppage;
	$.get(url+shoppage+'&'+Math.random(),function(res){	
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.ShowMores').off("click");
				$('.ShowMores').html('显示完了');
				$('.ShowMores').css({'background':'#eee'});
			}else{
				$('.'+content_div_db[choose_i]).append(res.data);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}


function chagetype(num){
	
	$('.ShowMores').off("click"); //避免出现多次点击事件
	$('.ShowMores').on("click",showMoreContent);
	$('.ShowMores').html('显示更多');
	choose_i = num;
	shoppage = haveshowpage[choose_i]>1 ? haveshowpage[choose_i] : 1;

	$('.shead .tag div').removeClass('first');
	$('.shead .tag div').eq(num).addClass('first')
	$('.listbox .cont').hide();
	$('.listbox .cont').eq(num).show();
}
chagetype(0);
</script>
			</div><!--right end-->
			
			<div class="right">
				<div class="main">
					<div class="mhead">
						<div class="third"><a href="#">商家介绍</a></div>
						<div><a href="#">促销信息</a></div>
					</div>
					<div class="tbox">
						<div class="text">
							<p><?php echo $info['content']; ?></p>
						</div>
						<div class="text">
							<p>暂无!!</p>
						</div>
					</div>
<script>
$('.tbox .text').eq(1).hide();;
$(".mhead div").hover(function(){
var thisindex = $(this).index();
$(this).addClass("third").siblings().removeClass("third");
$(".tbox .text").eq(thisindex).show().siblings().hide();
})
</script>					
				</div>
				<div class="main" style="margin-top:25px;">
					<div class="mhead">
						<div class="fourth"><a href="#">活跃会员</a></div>
						<div><a href="#">最新加入</a></div>
					</div>
					<div class="listbox">
						<div class="plist list_member_a">
							 <!--
							<div class="picshow">
								<div class="img"><a href="#"><img src="/public/static/group/circle_list/head2.png" width="88" height="88" /></a></div>
								<div class="info"><a href="#">番茄小王子</a></div>
							</div>
							 -->
						</div>
<script type="text/javascript">
$(document).ready(function(){
	$.get("<?php echo urls('wxapp.member/get_member',['id'=>$id,'rows'=>10]); ?>",function(res){
		if(res.code==0){
			show_member_a(res.data);
		}
	});
});

function show_member_a(ar){
	var htmlcode = '';
	ar.forEach(function(rs){
		htmlcode += '<div class="picshow"><div class="img"><a href="<?php echo get_url('user'); ?>?uid='+rs.uid+'"><img src="' + rs.icon + '" width="88" height="88" onerror="this.src=\'/public/static/images/nobody.gif\'"></a></div><div class="info"><a href="<?php echo get_url('user'); ?>?uid='+rs.uid+'">' + rs.username + '</a></div></div>';
	});
	$(".list_member_a").html(htmlcode);
}
</script>
						<div class="plist list_member_b">
							<!--
							<div class="picshow">
								<div class="img"><a href="#"><img src="/public/static/group/circle_list/head1.png" width="88" height="88" /></a></div>
								<div class="info"><a href="#">番茄小王子</a></div>
							</div>
							-->
						</div>
<script type="text/javascript">
$(document).ready(function(){
	$.get("<?php echo urls('wxapp.member/get_member',['id'=>$id,'rows'=>15,'by'=>'asc']); ?>",function(res){
		if(res.code==0){
			show_member_b(res.data);
		}
	});
});

function show_member_b(ar){
	var htmlcode = '';
	ar.forEach(function(rs){
		htmlcode += '<div class="picshow"><div class="img"><a href="<?php echo get_url('user'); ?>?uid='+rs.uid+'"><img src="' + rs.icon + '" width="88" height="88" onerror="this.src=\'/public/static/images/nobody.gif\'"></a></div><div class="info"><a href="<?php echo get_url('user'); ?>?uid='+rs.uid+'">' + rs.username + '</a></div></div>';
	});
	$(".list_member_b").html(htmlcode);
}
</script>
					</div>
<script>
$('.listbox .plist').eq(1).hide();;
$(".mhead div").hover(function(){
var thisindex = $(this).index();
$(this).addClass("fourth").siblings().removeClass("fourth");
$(".listbox .plist").eq(thisindex).show().siblings().hide();
})
</script>					
				</div>
			</div><!--left end-->
		</div><!--maincont2 end-->
		
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