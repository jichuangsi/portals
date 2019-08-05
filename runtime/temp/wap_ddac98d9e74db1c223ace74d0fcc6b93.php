<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:74:"D:\web\Education\portals\template/index_style/default/hy\content\ruzhu.htm";i:1564471491;s:74:"D:\web\Education\portals\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;s:69:"D:\web\Education\portals\template\index_style\default\index\share.htm";i:1542707408;}*/ ?>
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



<link rel="stylesheet" href="/public/static/hy/assets/style/details.css">
<link rel="stylesheet" href="/public/static/hy/assets/style/Entry.css">
    <link rel='stylesheet' href='/public/static/hy/assets/style/reset_android.css'>
    <script src="/public/static/hy/assets/js/reset.js"></script>
    <script src="/public/static/hy/assets/js/qrcode.js"></script>
    <style>
    	.body_Hearcont{
    		display: none !important;
    	}
    	.body_Footcont{
    		display: none !important;
    	}
    </style>
    <div class="top">
        <div class="fl" onclick="javascript:history.back(-1);">
            <img src="/public/static/hy/assets/images/return.png" alt="">
        </div>
        <div class="title">我要入驻</div>
    </div>
    <div class="center">
        <div class="one">
            <div class="q1">
                <div class="q2">
                    <div class="img">
                    </div>
                </div>
            </div>
            <div class="q3">
                <div class="q5"></div>
            </div>
            <div class="q4">
                <div class="q6"></div>
            </div>
            <div class="q7">
                <div class="q8">
                        加入我们
                </div>
            </div>
            <div class="q9">
                <div class="q11"></div>
            </div>
            <div class="q10">
                <div class="q12"></div>
            </div>
        </div>
        <div class="two">
            <div class="text_box">
                <div class="box">
                    <div class="text">
                        你是否觉得租金成本压力越来越大，而招生却越来越难？ 
                    </div>
                    <div class="text">
                        你是否觉得好老师难留住，课程利润也越来越薄？
                    </div>
                    <div class="text">
                        你是否觉得传统的教育模式越做越累，付出与收获不成正比？
                    </div>
                    <div class="text">
                        你是否想解放自己，让机构步入轨道自我运转，而却一直没找到方法？
                    </div>
                    <div class="text">
                        加入乐享课，全球最大的一站式教育资源整合平台，真正实现解放校长，全民推广招生，让每一位家长都成为消费商，实现无忧永动式办学！
                    </div>
                </div>
            </div>
            <div class="z4 fl"></div>
            <div class="text_box">
                    <div class="box">
                        <div class="title">
                            解决行业痛点 
                        </div>
                        <p>
                            一、传统教育机构，运营痛点—租金成本高，业绩下滑，市场饱和      乐享课技术团队助力机构快速步入移动电商时段你是否觉得好老师难留住，课程利润也越来越薄？
                        </p>
                        <p>
                            二、传统教育机构，教学痛点—老师流动性高，课程及课件更新成本高更新速度慢，不能快速响应市场和客户的需求        乐享课强大的资源整合平台，提供更多的师资渠道和课程课件渠道，快速实现课时盈利。你是否觉得传统的教育模式越做越累，付出与收获不成正比？
                        </p>
                        <p>
                            三、传统教育机构，招生销售痛点—招生成本高、同行恶性竞价、生源不稳定       乐享课助力一键招生，让家长成为消费商，转发分享即返利实现粉丝流量红利。你是否想解放自己，让机构步入轨道自我运转，而却一直没找到方法？
                        </p>
                </div>
            </div>
            <div class="z7 fr"></div>
                <div class="text_box">
                    <div class="box">
                        <div class="title">
                            入驻乐享课五大优势
                        </div>
                        <p>
                            1、强大的“享客”团队及“享课”营销技术，为各机构精准引流目标客户
                        </p>
                        <p>
                            2、60度的资源整合平台，全网搜罗课件、师资、招生等资源。
                        </p>
                        <p>
                            3、平台直接输出海外名师，小型机构也可打造为国际学校。
                        </p>
                        <p>
                            4、为机构提供小程序、公众号、APP、在线教学等智能技术。                            
                        </p>
                        <p>
                            5、一次成交，终身返利。
                        </p>
                        <p>
                            乐享课---加入全球最大的一站式教育资源整合平台，家长流量红利从此开始！
                        </p>
                </div>
            </div>
            <div class="z8 fl"></div>
                <div class="text_box">
                    <div class="box">
                        <div class="title">
                            立即入驻
                        </div>
                        <form action="" method="post" id="ruzhuform">
	                        <p>账号</p>
	                        <div class="ipt"><input type="text" name="username" placeholder="请输入已注册账号" onblur="checkuser($(this))"></div>
	                        <p>姓名</p>
	                        <div class="ipt"><input type="text" name="truename" placeholder="请输入您的姓名"></div>
	                        <p>手机号码</p>
	                        <div class="ipt"><input type="text" name="phone" placeholder="请输入您的手机号码"></div>
	                        <p>公司名称</p>
	                        <div class="ipt"><input type="text" name="companyname" placeholder="请输入贵公司名称"></div>
	                        <button onclick="formlick()" type="button" style="margin-top: 0.2rem;">立即提交</button>
                        </form>
                </div>
            </div>
            <div class="a1"></div>
            <div class="a2"></div>
            <div class="a3"></div>
            <div class="z1"></div>
            <div class="z3"></div>
            <div class="z6"></div>
        </div>
    </div>
   <script>
   	var isuser=false;
   	function checkuser(obj){
   		var usernumber=obj.val();
   		console.log(usernumber);
   		if(usernumber!=null && usernumber!=''){
   			$.get('/index.php/cms/content/inspectuser/usernumber/'+usernumber,function(res){
   				console.log(res);
   				if(res<1){
   					layer.msg("该账号还没有注册，请先注册再进行该操作");
   					isuser=false;
   				}else if(res>=1){
   					isuser=true;
   				}
   			});
   		}
   	}
   	function formlick(){
   		if(isuser){
   			$.ajax({
	   			type:"post",
	   			url:"/index.php/cms/content/ruzhu",
	   			data:$("#ruzhuform").serialize(),
	   			dataType:'json',
	   			success:function(data){
	   				layer.msg(data.msg);
	   			},
	   			error:function(data){
	   				console.log(data);
	   			}
   			});
   		}else{
   			layer.msg("该账号还没有注册，请先注册再进行该操作");
   		}
   		
   	}
   </script>
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