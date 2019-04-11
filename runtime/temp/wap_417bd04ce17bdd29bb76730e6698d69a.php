<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:89:"D:\web\Education\template/member_style/default/plugins/marketing/jifen/generalization.htm";i:1554720308;s:73:"D:\web\Education\template/member_style/21syx_member/member/wap_layout.htm";i:1548153004;s:64:"D:\web\Education\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<title>我的收益</title>

<link rel="stylesheet" href="/public/static/layui/css/layui.css" media="all">
<link rel="stylesheet" href="/public/static/layui/css/admin.css" media="all">


<link rel="stylesheet" type="text/css" href="/public/static/member/default/wap/global.css">
<link rel="stylesheet" type="text/css" href="/public/static/member/default/wap/wap.css">
<link rel="stylesheet" type="text/css" href="/public/static/css/wapmember.css">

<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>

</head>
<body>


<div class="qb_header">
	<div class="goback"><a href="#" onClick="window.history.back();" class="fa fa-reply"> 返回</a></div>
    <div class="web"></div>
    <div class="member"><a href="/member.php" class="fa fa-user-circle"></a></div>
</div>




<link rel="stylesheet" href="/public/static/icon/iconfont.css">
<style>
	.qb_member_note{
		background: url('/public/static/index/toutiao/Profit.png') no-repeat;
		background-size: 100%;
		height: 53px;
		/*line-height: 53px;*/
		line-height: 2;
		color: #fff;
		margin-top: 45px;
	}
	.web{
		text-align: center;
	}
	.qb_header{
		/*background-color: #ffdd33;*/
		background: -webkit-linear-gradient(#07EBC8, #357BF5); 
	    background: -o-linear-gradient(#07EBC8, #357BF5); 
	    background: -moz-linear-gradient(#07EBC8, #357BF5); 
	    background: linear-gradient(#07EBC8, #357BF5);
		font-weight: bold;
		text-align: center;
		height: 45px;
		line-height: 45px;
		position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 10;
	    font-size: 19px;
	}
	.jifen_list{
		width: 100%;
		display: flex;
		margin-top: 10px;
		justify-content: space-between;
	}
	.aui-palace-grid{
		    position: relative;
		    float: left;
		    padding: 1px;
		    width: 33.333333%;
		    box-sizing: border-box;
		    margin-bottom: 15px;
	}
	.aui-palace-grid-icon{
		width: 35px;
	    height: 35px;
	    margin: 0 auto;
	}
	.aui-palace-grid-text{
		display: block;
	    text-align: center;
	    color: #333333;
	    font-size: 13px;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	}
	a{
		color: #666;
		text-decoration: none;
	}
	.jifen_top{
		width: 100%;
		margin-top: 45px;
		background: url('/public/static/index/toutiao/banner.png') no-repeat;
		background-size: 100%;
		position: relative;
		max-height: 288px;
	}
	.jifenFunctionList{
		width: 90%;
		background-color: #FFFFFF;
		border-radius: 10px;
		position: absolute;
		left: 5%;
		bottom: 0%;
		font-size: 14px;
	}
	.jifenFunctionList img{
		width: 30px;
		height: 30px;
	}
	.MyInfo{
		/*padding-left: 5%;*/
		padding: 10px 5%;
		display: flex;
		font-size: 14px;
	}
	.MyInfo span{
		width: 33.33333%;
		display: block;
	}
	.jifen_div{
		width: 90%;
		margin-left: 5%;
		padding: 20px 0px;
		background-color: #fff;
		border: none;
		border-radius: 9px;
		margin-bottom: 20px;
	}
	.jifen_info ul{
		display: flex;
	}
	.jifen_btn{
		padding: 0px 12px;
		outline: none;
		border: 1px solid #ec6841;
		border-radius: 15px;
		background: #fff;
		font-size: 13px;
	}
</style>

<script>
	$(function(){
		$('.CopyRight').remove();
		$(".footer a").css('color','#fff');
		$(".footer a[href*='marketing']").css('color','#FFDD33');
		$('.goback').find('a').remove();
		$('.member').find('a').remove();
		$('.qb_header').find('div').remove();
		$('.qb_header').text('我的收益');
		$('.shares').css({"position":"fixed","top":"13px","bottom":"","z-index":"10"});
	});
</script>
<div class="jifen_top">
	<div class="ss" style="padding-bottom: 50%;"></div>
	<div class="jifenFunctionList">
		<div style="margin-top: 8%;width: 90%;margin-left: 5%;">
		<a href="/member.php/member/group/index.html" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                            <img src="/public/static/index/toutiao/1_1.png" />
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>升级等级</h2>
                        </div>
		</a>
		<a href="/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/propagandize.html" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                             <img src="/public/static/index/toutiao/2-2.png" />
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>我的代理</h2>
                        </div>
		</a>
		<a href="/member.php/member/plugin/execute/plugin_action/index/plugin_controller/jifen/plugin_name/marketing.html" class="aui-palace-grid">
                        <div class="aui-palace-grid-icon">
                             <img src="/public/static/index/toutiao/3-3.png" />
                        </div>
                        <div class="aui-palace-grid-text">
                            <h2>积分详情</h2>
                        </div>
		</a>
		</div>
	</div>
	
</div>
	<?php $moneyss=0; if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	<ul class="qb_member_ListType1" style="display: none;">
		<ol>
			<span class="FL">项目：<?php echo get_word($rs['title'],"60"); ?></span>
			<span class="FR <?php if($rs['money'] > '0'): ?>  red<?php else: ?> gray<?php endif; ?>"><?php echo $rs['money']; ?></span>
		</ol>
		<li>
			<span class="FL glyphicon glyphicon-time gray"><?php echo date("Y-m-d H:i:s",$rs['posttime']); ?></span>
			<!--<a href="<?php echo purl('delete',['id'=>$rs['id']]); ?>" class="FR">删除</a>-->
		</li>
	</ul>
	<?php  $moneyss += $rs['money'];endforeach; endif; else: echo "" ;endif; ?>
<div class="MyInfo">
	<span  style="text-align: left;">总收益:<?php echo $userdb['money']; ?></span><span  style="text-align: center;"> </span><span  style="text-align:right ;">今日收益:<?php echo $moneyss; ?></span>
</div>
<div class="jifen_div">
	<div class="jifen_info" style="margin: 0px 20px;">
		<div class="info_name">
			<ul>
				<ol>玩游戏赚积分</ol>
				<li style="margin-left: 20px;color: #ff8033;"  onclick="details(this)">以积分赚积分</li>
			</ul>
		</div>
		<div style="margin: 5px 0px;">
			<ul>
				<ol style="flex: 1;padding: 1px 5px;">幸运大转盘</ol>
				<li>
					<button onclick="window.location.href='/index.php/p/gamedial-index-index.html'" class="jifen_btn">玩游戏</button>
				</li>
			</ul>
		</div>
		<div style="margin: 5px 0px;">
			<ul>
				<ol style="flex: 1;padding: 1px 5px;">砸金蛋</ol>
				<li>
					<button onclick="window.location.href='/index.php/p/eggs-index-index.html'" class="jifen_btn">玩游戏</button>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="jifen_div">
	<div class="jifen_info" style="margin: 0px 20px;">
		<div class="info_name">
			<ul>
				<ol>看资讯赚积分</ol>
				<li style="margin-left: 20px;color: #ff8033;" onclick="details(this)" class="detailsBtn">详情&nbsp;<i class="fa fa-caret-down"></i></li>
			</ul>
		</div>
		<div style="margin: 5px 0px;display: none;" class="info_details" >
			<ul>
				<ol style="flex: 1;padding: 1px 17px;font-size: 13px;">看5篇新闻奖励10积分<br />看10篇新闻奖励20积分<br />看15篇新闻奖励30积分<br /> </ol>
				<li style="display: flex;">
					<button style="margin: auto;" onclick="window.location.href='/index.php/cms/'" class="jifen_btn">看资讯</button>
				</li>
			</ul>
		</div>
	</div>
</div>
<div class="jifen_div">
	<div class="jifen_info" style="margin: 0px 20px;">
		<div class="info_name">
			<ul>
				<ol>积分说明</ol>
				<li style="margin-left: 20px;color: #ff8033;"  onclick="details(this)">详情&nbsp;<i class="fa fa-caret-down"></i></li>
			</ul>
		</div>
		<div style="margin: 5px 0px;padding: 0px 15px;display: none;" class="info_details">
			<h3 style="color: #ff8033;">积分怎么获取？</h3>
			<div style="font-size: 12px;padding: 0px 10px;">
				1.每日签到可以获取积分<br />
				2.玩游戏运气好的话也可以获取不同额度的积分喔<br />
				3.每日浏览资讯会有积分奖励<br />
			</div>
			<h3 style="color: #ff8033;">积分有什么用？</h3>
			<div style="font-size: 12px;padding: 0px 10px;">
				1.积分可以到商城兑换商品<br />
			</div>
		</div>
	</div>
</div>

<div id="div_propagandize" style="display:none;">
<div style="padding:20px;line-height:150%;">
<div style="border-bottom:1px solid #ddd;margin-bottom:10px;padding:10px;">
欢迎分享,分享有收益。<br>
1、直接推荐他人注册可获得 10 个积分的奖励<br>
2、间接推荐他人注册可获得 5 个积分的奖励<br>
3、上上级推荐还可获得 2 个积分的奖励<br>
</div>
<!--分享网址：<a href="http://192.168.31.122?p_uid=1">http://192.168.31.122?p_uid=1</a>-->
分享网址：<a href="http://192.168.31.122?p_uid=1"><?php echo get_url('home'); ?>?p_uid=<?php echo $userdb['uid']; ?></a>
<br>
分享二维码如下：
<br><!--<center><img width="200" src="/index.php/index/qrcode/index.html?url=http%3A%2F%2F192.168.31.122%3Fp_uid%3D1"></center>-->
<center><img width="250" src="<?php echo get_qrcode('/?p_uid='.$userdb['uid']); ?>"></center>
</div>
</div>
<script type="text/javascript">
	function details(obj){
		$(obj).parent().parent().siblings().toggle(500);
	}

	function show_propagandize(){
	layer.open({
		type:1,
		title:false,
		content:$('#div_propagandize'),
		area:['95%','80%'],
	});
}
</script>
<i class="fa fa-share-square-o shares" onclick="show_propagandize()" style="position: fixed; right: 10px; font-size: 20px; color: rgb(102, 102, 102); top: 13px; z-index: 10;">分享</i>
<?php echo hook_listen('layout_body_foot',$userdb,$webdb,true); ?>


<div class="CopyRight">
  <p>@<?php echo $webdb['webname']; ?> 版权所有</p>
  <p><?php echo $webdb['miibeian_gov_cn']; ?></p>
</div>

 <!--<link rel="stylesheet" href="/public/static/index/default/footer.css">--> 
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
<?php $menu_choose=config('system_dirname')?:(ENTRANCE==='member'?'member':'index'); $_result=fun('page@foot_menu');if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li style="position:relative;"><a href="<?php echo $rs['url']; ?>" <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>style="color:#FFDD33;"<?php endif; ?>><i class="<?php echo (isset($rs['style']) && ($rs['style'] !== '')?$rs['style']:'glyphicon glyphicon-star'); ?>"></i><span><?php echo $rs['name']; ?></span></a>
			<?php if(strstr($rs['url'],'weibo/content/show/id/0')): ?><dd  style="color:#fff;background:orange;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="weibo_msg_num">0</dd><?php endif; if(strstr($rs['url'],'member.php/member/index.html')): ?><dd  style="color:#fff;background:red;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="msg-num">0</dd><?php endif; if(strstr($rs['url'],'member.php/tongji/msg/index.html')): ?><dd  style="color:#fff;background:orange;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="tongji-num">0</dd><?php endif; ?>
			</li>
<?php endforeach; endif; else: echo "" ;endif; ?>

		</ul>
	</div>
</div>


  


<script type="text/javascript" src="/public/static/js/qibo.js"></script>
<script src="/public/static/layui/layui.js"></script>

 
<script type="text/javascript">
layui.use(['form','element'], function(){
  var form = layui.form;
  var element = layui.element;
});
</script>


</body>
</html>