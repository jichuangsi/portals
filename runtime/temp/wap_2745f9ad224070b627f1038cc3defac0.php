<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:71:"D:\web\Education\template/index_style/default/giftshop\content/show.htm";i:1548581336;s:66:"D:\web\Education\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;s:61:"D:\web\Education\template\index_style\default\index\share.htm";i:1542707408;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $info['title']; ?></title>
<meta name="keywords" content='<?php echo !empty($info['keywords'])?$info['keywords']:$info['title']; ?>  <?php echo $s_info['name']; ?> '>
<meta name="description" content='<?php echo get_word(del_html($info['content']),300); ?>'>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="/public/static/css/base.css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/wap_head.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
<script type="text/javascript" src="/public/static/index/toutiao/iscroll.js"></script>
<script type="text/javascript" src="/public/static/js/BrowsingHistory.js"></script>
</head>
<body>
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_head',$userdb,$webdb,true); ?>

<div class="body_Hearcont">
	<ul>
	<!--<li>
		<a href="/member.php/member/msg/index.html"><img src="/public/static/index/toutiao/email.png" width="30"></a>
		</li>-->
		<ol><a href="/"><img src="<?php echo (tempdir($webdb['logo']) ?: '/public/static/index/toutiao/wap_logo.png'); ?>"></a></ol>
		<li>
		<a href="/search/"><img src="/public/static/index/toutiao/so.png" width="30"></a>
		</li>
	</ul>
</div> 



<!--幻灯片开始---->
<?php if(defined('LABEL_DEBUG')): ?><!--SHOWPAGE <!--shop_show_rollpic		-->
<link rel="stylesheet" href="/public/static/mui/css/mui.min.css">
<script type="text/javascript" src="/public/static/mui/js/mui.min.js"></script>
<link rel="stylesheet" href="/public/static/index/default/slider.css">
<div id="slider" class="mui-slider" >
	<div class="mui-slider-group mui-slider-loop">
		<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img style="max-height: 350px;" src="<?php echo end($info['picurls'])['picurl']; ?>"></a></div>
<?php if(is_array($info['picurls']) || $info['picurls'] instanceof \think\Collection || $info['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="mui-slider-item"><a href="#"><img style="max-height: 350px;" src="<?php echo $rs['picurl']; ?>"></a></div>
<?php endforeach; endif; else: echo "" ;endif; ?>
		<div class="mui-slider-item mui-slider-item-duplicate"><a href="#"><img style="max-height: 350px;" src="<?php echo $info['picurls']['0']['picurl']; ?>"></a></div>
	</div>
	<div class="mui-slider-indicator">
<?php if(is_array($info['picurls']) || $info['picurls'] instanceof \think\Collection || $info['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;?>
		<div  class="mui-indicator <?php if($i == '1'): ?>mui-active<?php endif; ?>"></div>
<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
</div>
<style>
.body_Hearcont{
	text-align: center;
	font-weight: bold;
	line-height: 42px;
	font-size: 21px;
}
#slider{
	margin-top: 53px;
}

</style>
<script>
	$(function(){
//		$('.body_Hearcont').find('ul').remove();
		$('.body_Hearcont').text('霸币商城');
		$('.body_Hearcont').append('<a href="#" style="position: absolute;left: 9px;top: 14px;color: #fff;font-size: 30px;" onclick="window.history.back();" class="fa fa-reply"> </a>');
		$('.body_Hearcont').append('<a style="position: absolute;right: 10px;color: #000000;" href="<?php echo urls('car/index'); ?>"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>');
	});
</script>
<script type="text/javascript" charset="utf-8">var slider = mui("#slider");</script>
 SHOWPAGE--><?php endif; fun('label@run_showpage_label','shop_show_rollpic',$info,['page'=>$page,'dirname'=>__FILE__,'tpl'=>'','field'=>'','val'=>'info','cache_time'=>'0']); ?>
<!--幻灯片结束---->
<link rel="stylesheet" href="/public/static/index/default/show.css">
<div class="ShowContBox">
	<div class="BaseInfos">
		<div class="title">
			<a href="#">库存:<?php echo $info['num']; ?></a>
			<span><?php echo $info['title']; ?></span>
		</div>
		<dl class="others">
			<dt>
				<div>现价:<span>&yen;<?php echo $info['price']; ?></span></div>
				<?php if(($info['market_money']>0)): ?>
				<p >市场价:&yen;<?php echo $info['market_money']; ?></p>
				<?php endif; ?>
			</dt>
			<dd>需要积分：<span><i><?php echo $info['jifen']; ?></i> 个</span></dd>
		</dl>
		<!--a href="<?php echo auto_url('order/add',['id'=>$id]); ?>"><button type="butter">立即购买</button></a-->
	</div>
	<div style="background: #FFF;margin-top: 15px;">
		<div class="qb_ui_wap_select_shoptype">
<?php 
$field_array=get_field($info['mid']);
$array1=get_shop_type('type1',$info);
$array2=get_shop_type('type2',$info);
$array3=get_shop_type('type3',$info);
 if(!(empty($array1) || (($array1 instanceof \think\Collection || $array1 instanceof \think\Paginator ) && $array1->isEmpty()))): ?>
			<ul class="shoptype1">
				<ol><?php echo $field_array['type1']['title']; ?></ol>
				<li>
				<?php if(is_array($array1) || $array1 instanceof \think\Collection || $array1 instanceof \think\Paginator): $i = 0; $__LIST__ = $array1;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<div data-price="<?php echo $rs['price']; ?>"><?php echo $rs['title']; ?></div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
				</li>
			</ul>
<?php endif; if(!(empty($array2) || (($array2 instanceof \think\Collection || $array2 instanceof \think\Paginator ) && $array2->isEmpty()))): ?>
			<ul class="shoptype2">
				<ol><?php echo $field_array['type2']['title']; ?></ol>
				<li>
				<?php if(is_array($array2) || $array2 instanceof \think\Collection || $array2 instanceof \think\Paginator): $i = 0; $__LIST__ = $array2;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<div><?php echo $rs['title']; ?></div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
				</li>
			</ul>
<?php endif; if(!(empty($array3) || (($array3 instanceof \think\Collection || $array3 instanceof \think\Paginator ) && $array3->isEmpty()))): ?>
			<ul class="shoptype3">
				<ol><?php echo $field_array['type3']['title']; ?></ol>
				<li>
				<?php if(is_array($array3) || $array3 instanceof \think\Collection || $array3 instanceof \think\Paginator): $i = 0; $__LIST__ = $array3;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<div><?php echo $rs['title']; ?></div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
				</li>
			</ul>
<?php endif; ?>
			<dl style="display:none">
				<dt>购买数量</dt>
				<dd class="chnageBuyNum">
					<span class="fa fa-minus"></span>
					<div><input type="text" value="1"/></div>
					<em class="fa fa-plus"></em>
				</dd>
			</dl>
			<div class="butters">
			<span><button onclick="BuyThisShop(3)">立即兑换</button></span>
				<!--<span><button onclick="BuyThisShop(2)">立即兑换</button></span>-->
				<em><button onclick="BuyThisShop(1)">加入购物车</button></em>
			</div>			
		</div>
		<script>
			var type1=0;
			var type2=0;
			var type3=0;
			var shopnum=1;
			var shopprice="<?php echo $info['price']; ?>";
			$('.shoptype1 li div').click(function(){
				$('.shoptype1 li div').removeClass('ck');
				$(this).addClass('ck');
				type1=$(this).index()+1;
				var thisprice = $(this).data('price');
				if(thisprice>0){
					$('.BaseInfos .others span').html(thisprice);
				}else{
					$('.BaseInfos .others span').html(shopprice);
				}
			});
			$('.shoptype2 li div').click(function(){
				$('.shoptype2 li div').removeClass('ck');
				$(this).addClass('ck');
				type2=$(this).index()+1;
			});
			$('.shoptype3 li div').click(function(){
				$('.shoptype3 li div').removeClass('ck');
				$(this).addClass('ck');
				type3=$(this).index()+1;
			});
			$('.chnageBuyNum em').click(function(){
				shopnum++;
				$('.chnageBuyNum div input').val(shopnum);
			});
			$('.chnageBuyNum span').click(function(){
				shopnum--;
				if(shopnum<1){
					layer.alert('购买数量不能小于1');
					shopnum=1;
				}
				$('.chnageBuyNum div input').val(shopnum);
			});

			function check_login(){
				if("<?php echo $userdb['uid']; ?>"==""){
					layer.confirm('你还没登录,不能购买,你要登录吗？', {
						btn : [ '登录', '取消' ]
					}, function(index) {
						window.location.href = "<?php echo get_url('login'); ?>";
					}); 
					return false;
				}
				return true;
			}

			function BuyThisShop(totype){
				if(check_login()!==true)return ;
				if((type1==0&&$(".shoptype1").length>0)||(type2==0&&$(".shoptype2").length>0)||(type3==0&&$(".shoptype3").length>0)){
					layer.alert('没有选择商品类型');
				}else{
					var gotourl="<?php echo urls('car/add'); ?>?shopid=<?php echo $id; ?>&type1="+type1+"&type2="+type2+"&type3="+type3+"&num="+shopnum;
					$.get(gotourl+"&"+Math.random(),function(res){
						if(res.code==0){		
							if(totype==1){
								layer.msg('成功加入购物车');
							}else if(totype==3){
								window.location.href="<?php echo urls('order/add'); ?>";
							}else{
								window.location.href="<?php echo urls('car/index'); ?>";
							}
						}else{
							layer.alert('出错了:'+res.msg);
						}
					});					
				}				
			}
			$('.chnageBuyNum div input').change(function(){
				shopnum=parseInt($(this).val());
				if(shopnum<1){
					layer.alert('购买数量不能小于1');
					shopnum=1;
					$(this).val(shopnum);
				}
			});
		</script>
	</div>
	<div class="ChangeShowCont">
		<div class="mui-slider">
			<div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
				<a class="mui-control-item" href="#mobileitem1">产品介绍</a>
				<a class="mui-control-item" href="#mobileitem2">购买注意事项</a>
			</div>
			<div class="mui-slider-progress-bar mui-col-xs-6"></div>
			<div class="mui-slider-group">
				<div id="mobileitem1" class="mui-slider-item mui-control-content mui-active">
					<div class="contentinfo">
					<?php echo $info['content']; ?>
					</div>
				</div>
				<div id="mobileitem2" class="mui-slider-item mui-control-content">
					<div class="contentinfo">
					<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--shop_notice_001	text	--> QB--><?php endif; $shop_notice_001 = fun('label@run_label','shop_notice_001',['val'=>'','list'=>'rs','systype'=>'text','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--<div class="TzContBoxs">
		<div class="head"><i class="fa fa-send"></i>特惠推荐</div>
		<div class="ListShops">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--shop_showpage_more001	shop	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="lists">
				<ul>
					<ol><a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onmouseover='thisimg_over($(this))' onmouseout='thisimg_out($(this))'/></a></ol>
					<li>
						<div class="title"><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></div>
						<div class="infos">
							<div class="price">&yen;<span>2480</span><em>起</em></div>
							<p>&yen;3600</p>
						</div>
					</li>
				</ul>
			</div>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $shop_showpage_more001 = fun('label@run_label','shop_showpage_more001',['val'=>'','list'=>'rs','systype'=>'shop','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
		</div>
		<div class="ShowMoreInfo"><button type="butter" onclick="ShowMoreInfo()">查看更多</button></div>
	</div>-->
</div>
 
<script type="text/javascript">
var morepage=1;
var url='<?php fun("label@label_ajax_url","shop_showpage_more001",__FILE__); ?>';//异步获取更多内容的url
function ShowMoreInfo(){	
	morepage++;	
	$.get(url+morepage+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.ShowMoreInfo button').attr('onclick','');
				$('.ShowMoreInfo button').html('显示完了');
				$('.ShowMoreInfo button').css({'background':'#CCC'});
			}else{
				res.data="<span class='pages"+morepage+"'>"+res.data+"</span>";			
				$('.ListShops').append(res.data);
				$('.ListShops .pages'+morepage).hide();
				$('.ListShops .pages'+morepage).show(500);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}

//function thisimg_over(imgobjs){
//	imgobjs.animate({"max-width":"150%","max-height":"150%"},300);
//}
//function thisimg_out(imgobjs){
//	imgobjs.animate({"max-width":"100%","max-height":"100%"},300);
//}

</script>

<!-- 微动态自动收录用户感兴趣的主题,时间60代表用户停留60秒将自动收藏 -->
<?php echo fun('sns@fav',$info,60,'系统帮你订阅了本主题,下次本主题有回复,将会通知你'); ?>

<!-- 微信分享 -->
<?php 
$share = is_array($share)?array_merge($info?:[],$share):$info;
isset($share['about'])||$share['about'] = get_word(str_replace(["'","\r","\n","\t",' ','　'],'',del_html($share['content'])),150);
isset($share['link'])||$share['link'] = get_url('location');
preg_match('/^(http:|https:)/',$share['link']) || $share['link'] = request()->domain().$share['link'];
preg_match('/^(http:|https:)/',$share['picurl']) || $share['picurl'] = request()->domain().$share['picurl'];
$share['title'] = str_replace(["'","\r","\n","\t",' ','　'],'',$share['title']);
$share['about'] = str_replace(["'","\r","\n","\t",' ','　'],'',$share['about']);
 ?>
<style>
.Share_Message{ 
	position: fixed; 
	width:100%; 
	height: 100%; 
	background: rgba(0,0,0,0.8);
	z-index: 900000; 
	top:0; 
	left: 0; 
	display: none;
}
.Share_Message div{
	background:url(/public/static/images/sharebg.png) no-repeat right center; 
	width:100%; 
	height:350px; 
	background-size:contain; 
	top:0; 
	display: block;
}
</style>
<script type="text/javascript">
function SharShowMsg(){
	var t = $(document).height();
	$('.Share_Message').html('<div></div>');
	$('.Share_Message').height(t).fadeIn();
}
function SharHiddenMsg() {
	$('.Share_Message').fadeOut();
}
</script>
<div class="Share_Message" onClick="SharHiddenMsg();"></div>
<script src="/public/static/js/jweixin.js"></script>
<script type="text/javascript">

function ShareTimeline(){
    wx.onMenuShareTimeline({
      title: '<?php echo $share['title']; ?>',
      link: '<?php echo $share['link']; ?>',
      imgUrl: '<?php echo $share['picurl']; ?>',
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
        //alert('分享到朋友圈后，每进来一位新用户，你都将获得<?php echo $webdb[CommendRegHongBao]; ?>元红包的奖励，你若取消关注公众号，将不派发！');
      },
      success: function (res) {
        layer.msg('成功分享到朋友圈');
		//window.location.reload();
		//window.location.href='?id=$id&hid=$hid&job=have_shareTimeline';
      },
      cancel: function (res) {
        //alert('系统监测到你没有真正分享到朋友圈，请重新分享！');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });
	wx.showOptionMenu();
	//SharShowMsg();
    //alert('请点击左上角的菜单，然后分享到朋友圈去即可');
}

function ShareAppMessage(){
	wx.onMenuShareAppMessage({
      title: '<?php echo $share['title']; ?>',
      desc: '<?php echo $share['about']; ?>',
      link: '<?php echo $share['link']; ?>',
      imgUrl: '<?php echo $share['picurl']; ?>',
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		//alert('请分享到朋友圈去，分享到微信好友无效！');
      },
      success: function (res) {
		  layer.msg('成功分享到好友');
		//window.location.href='?job=have_shareFriend';
      },
      cancel: function (res) {
        //alert('你已取消操作，建议你重新分享给好友！');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });
    //alert('请点击左上角的菜单，发送给朋友');
}


function wx_share_config(){
	wx.config({
		debug: false,
		appId: '<?php echo weixin_share("appId"); ?>',
		timestamp: <?php echo weixin_share("timestamp")?:0; ?>,
		nonceStr: '<?php echo weixin_share("nonceStr"); ?>',
		signature: '<?php echo weixin_share("signature"); ?>',
		jsApiList: [
			'checkJsApi',
			'onMenuShareTimeline',
			'onMenuShareAppMessage', 
			'hideMenuItems',
			'showMenuItems',
		  ]
	});

	wx.ready(function () {
		//wx.hideOptionMenu();
		ShareTimeline();
		ShareAppMessage();
	});

	wx.error(function (res) {
	  //alert(res.errMsg);
	});
}

var have_load_wx_share_config = false;
window.onload = function(){	//避免jweixin.js没有完全加载进来的情况
	have_load_wx_share_config = true;
	wx_share_config();
};

$(function(){
	//处理window.onload被覆盖的情况
	setTimeout(function(){
		if(have_load_wx_share_config==false){
			wx_share_config();
		}
	},5000);
})

</script>

	
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,$webdb,true); ?>

<link rel="stylesheet" href="/public/static/index/toutiao/wap_foot.css"> 
<div class="body_Footcont">
	<div class="footer">
		<ul>
<!--
			<li><a href="javascript:;history.go(-1);"><i class="si si-arrow-left"></i><span>返回</span></a></li>
			<li><a href="<?php echo iurl('cms/index/index'); ?>"><i class="si si-present"></i><span>资讯</span></a></li>
			<li><a href="<?php echo get_url('index'); ?>"><i class="si si-home"></i><span>首页</span></a></li>
			<li><a href="<?php echo iurl('shop/index/index'); ?>" data="购物车<?php echo iurl('shop/car/index'); ?>"><i class="si si-basket"></i><span>商城</span></a></li>
			<li><a href="<?php echo get_url('member'); ?>"><i class="si si-user"></i><span>会员中心</span></a></li>
-->
<?php if(is_array(get_web_menu('wapfoot')) || get_web_menu('wapfoot') instanceof \think\Collection || get_web_menu('wapfoot') instanceof \think\Paginator): $i = 0; $__LIST__ = get_web_menu('wapfoot');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>class="cur"<?php endif; ?>><a href="<?php echo $rs['url']; ?>"><i class="<?php echo (isset($rs['style']) && ($rs['style'] !== '')?$rs['style']:'glyphicon glyphicon-star'); ?>"></i><span><?php echo $rs['name']; ?></span></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>

		</ul>
	</div>
</div>

<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_foot',$userdb,$webdb,true); ?>
</body>
</html>