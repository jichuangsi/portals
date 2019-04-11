<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:60:"D:\web\x1\template/index_style/default/vote\content/show.htm";i:1551694811;s:59:"D:\web\x1\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;s:61:"D:\web\x1\template\index_style\default\index\common\field.htm";i:1529628344;s:63:"D:\web\x1\template\index_style\default\vote\content\comment.htm";i:1548730650;s:54:"D:\web\x1\template\index_style\default\index\share.htm";i:1542707408;}*/ ?>
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




<link rel="stylesheet" href="/public/static/vote/wap/bencandy.css">
<div class="qb_header">
	<div class="goback"><a href="#" onclick="window.history.back();" class="fa fa-reply"> 返回</a></div>
    <div class="web">浏览历史</div>
    <div class="member"></div>
</div>
<style>
	.qb_header {
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 999999;
	}
	.qb_header {
	    display: table;
	    background: #ffdd33;
	    border-bottom: #DDD solid 1px;
	    width: 100%;
	}
	.qb_header div.goback {
	    width: 60px;
	}
	.qb_header div {
	    display: table-cell;
	    text-align: center;
	    padding: 15px 5px;
	    font-size: 16px;
	    vertical-align: middle;
	}
	.qb_header div {
	    display: table-cell;
	    text-align: center;
	    padding: 15px 5px;
	    font-size: 16px;
	    vertical-align: middle;
	}
	.web {
	    font-size: 21px !important;
	    font-weight: bold;
	}
	.qb_header div {
	    display: table-cell;
	    text-align: center;
	    padding: 15px 5px;
	    font-size: 16px;
	    vertical-align: middle;
	}
	.qb_header div.member {
	    width: 40px;
	    font-size: 22px;
	}
</style>
<article class="article-container">
	<div class="head" style="margin-top: 51px;">
    	<h1><?php echo $info[title]; ?></h1>
		<div class="lists">
			<div><span><?php echo $info['agree']; ?></span><em>总票数</em></div>
			<div><span><?php echo get_option_ranking($info['mid'],$info['id']); ?></span><em>当前排名</em></div>
			<div><span><?php echo $info['view']; ?></span><em>围观人次</em></div>
		</div>
    </div>
    <section class="votesInfo">
    	<?php echo $info['content']; ?>
    </section>
</article>

<div class="ActionCont">
	<!-- <div class="note" style='display:none;'>备注：投票数据每10分钟更新一次</div> -->
	<div class="butter">
		<a href="javascript:;" onclick="AgreeVote(<?php echo $info['id']; ?>,<?php echo $info['fid']; ?>,0)">我要投票</a>
	</div>
</div>

<style>
.aticle_cont img{
max-width:95%;
}
</style>
<script>
	$(function(){
		$('.votesInfo p span').css('background-color','');
	});
</script>
<section class="aticle">
  <div class="aticle_head">投票项目详情</div>
  <h3><?php echo $s_info['name']; ?></h3>
  <div class="aticle_cont">项目简介:<?php echo $s_info['description']; ?></div>
  <div class="look_bt">查看全文</div>
  <div class="time">
	<p style="display: none;">报名结束时间：<time><?php if($s_info['joinendtime']): ?><?php echo format_time($s_info['joinendtime'],'Y-m-d H:i'); else: ?>不限时间<?php endif; ?></time></p>
	<p>投票结束时间：<time><?php if($s_info['endtime']): ?><?php echo format_time($s_info['endtime'],'Y-m-d H:i'); else: ?>不限时间<?php endif; ?></time></p>
  </div>
  <div style="display: none;" class="aticle_bt"><a href="<?php echo urls('content/index',['fid'=>$fid]); ?>">查看所有参与者</a><a href="<?php echo murl('add',['fid'=>$fid]); ?>">我要报名</a></div>
</section>

	<section class="t_list">
		<div class="h_list"><h3>最近前10位支持者</h3></div>
		<div class="t_contLits">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--vote_member_wapshow		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<dl>
				<dt><p><span><em><img src="<?php echo $rs['icon']; ?>"/></em></span></p></dt>
				<dd><span>投票人：<?php echo $rs['username']; ?></span></dd>
				<dd><time><?php echo $rs['create_time']; ?></time></dd>
			</dl>
			  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $vote_member_wapshow = fun('label@run_label','vote_member_wapshow',['union'=>'aid','aid'=>$id,'val'=>'','list'=>'rs','systype'=>'','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'app\vote\model\Member@get_label','order'=>'create_time','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
		</div>
	</section>

<script>
var H=$(".aticle_cont").height();
if(H>200){
	$(".aticle_cont").addClass("aticle_more")
	$(".look_bt").show();
	$(".look_bt").click(function(){
		$(".aticle_cont").removeClass("aticle_more");
		$(".look_bt").hide("slow");
	});
}else{
	$(".look_bt").hide();
}
</script>
</section>
<script>
//单选投票
function AgreeVote(ids,fid,type){	
	console.log(ids);
	layer.confirm('是否给该用户进行投票?', {icon: 3, title:'投票确认'}, function(index){
		$.get("<?php echo urls('content/agree_vote'); ?>?ids="+ids+"&fid="+fid+"&type="+type+"&"+Math.random(),function(res){
			if(res.code==0){
				var num =  $('#topic_agree').html();
				num++;
				$('#topic_agree').html(num);
				layer.msg("投票成功！",{time:1500});
				window.location.reload();
			}else{
				// layer.msg('投票失败:'_res.msg);
				layer.msg("投票失败:"+res.msg,{time:1500});
			}	
		});  
	  layer.close(index);
	});
}
</script>






<link rel="stylesheet" href="/public/static/index/default/article.css">
<div class="ArticleContBox" style='display:none;'>
<!--显示自定义字段内容 field="picurl,title,content,keywords" 就是过滤掉不在里边重复显示的字段-->
<style type="text/css">.OtherInfos .SideBox{clear:both;}.OtherInfos img{height:100px;float:left;margin:3px;}</style>
  	<div class="OtherInfos">
<?php if(defined('LABEL_DEBUG')): ?><!--SHOWPAGE <!--d41d8cd98f00b204e9800998ecf8427e		--><?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="SideBox">
		<?php if(in_array($rs['type'],['images','images2','image','file','files','files2'])): ?>
			<!-- 组图及多文件的显示方法\template\index_style\default\index\common\field.htm,其实不建议放在这里,影响布局,更多请查阅 http://help.php168.com/665693/  -->
			<div class="tag"><span><?php echo $rs['title']; ?></span></div>
			<?php if(!(empty($rs['value']) || (($rs['value'] instanceof \think\Collection || $rs['value'] instanceof \think\Paginator ) && $rs['value']->isEmpty()))): if($rs['type']=='files'): ?>
	<div class="d_field_files">
	<?php if(is_array($rs['value']) || $rs['value'] instanceof \think\Collection || $rs['value'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['value'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
		<div class="field_<?php echo $rs['name']; ?> field_files"><a href="<?php echo $vs['url']; ?>">下载<?php echo $i; ?></a></div>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
<?php elseif($rs['type']=='files2'): ?>
	<div class="d_field_files2">
	<?php if(is_array($rs['value']) || $rs['value'] instanceof \think\Collection || $rs['value'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['value'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
		<div class="field_<?php echo $rs['name']; ?> field_files2"><a href="<?php echo $vs['url']; ?>"><?php echo $i; ?>、<?php echo $vs['title']; ?></a></div>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
<?php elseif($rs['type']=='images'): ?>
	<div class="d_field_images">
	<?php if(is_array($rs['value']) || $rs['value'] instanceof \think\Collection || $rs['value'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['value'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
		<div class="field_<?php echo $rs['name']; ?> field_images"><a href="<?php echo $vs['picurl']; ?>"><img src="<?php echo $vs['picurl']; ?>"></a></div>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
<?php elseif($rs['type']=='images2'): ?>
	<div class="d_field_field_images2">
	<?php if(is_array($rs['value']) || $rs['value'] instanceof \think\Collection || $rs['value'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['value'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
		<div class="field_<?php echo $rs['name']; ?> field_images2"><a href="<?php echo $vs['url']; ?>"><img alt="<?php echo $vs['about']; ?>" src="<?php echo $vs['picurl']; ?>"></a></div>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	</div>
<?php elseif($rs['type']=='image'): ?>
	<div class="field_<?php echo $rs['name']; ?> field_image"><a href="<?php echo $rs['value']; ?>"><img src="<?php echo $rs['value']; ?>"></a></div>
<?php elseif($rs['type']=='file'): ?>
	<div class="field_<?php echo $rs['name']; ?> field_field"><a href="<?php echo $rs['value']; ?>">点击下载</a></div>
<?php endif; endif; else: ?>
			<div class="tag"><span><?php echo $rs['title']; ?></span></div>
			<div class="cont"><?php echo $rs['value']; ?></div>
		<?php endif; ?>
		</div>
  <?php endforeach; endif; else: echo "" ;endif; ?> SHOWPAGE--><?php endif; fun('label@run_showpage_label','d41d8cd98f00b204e9800998ecf8427e',$info,['page'=>$page,'dirname'=>__FILE__,'tpl'=>'','field'=>'picurl,title,content,keywords,mv_url','val'=>'info','cache_time'=>'0']); ?>
	</div>

	<!--引用评论
	<?php if(defined('LABEL_DEBUG')): ?><!--COMMENT<!--commentwap01		-->
		﻿	<link rel="stylesheet" href="/public/static/css/wapcomment.css"> 
	<div class="WapCommentBox">
		<div class="head">
			<div class="tag">全部评论(<?php echo $total; ?>)</div>
			<div class="more"><button type="butter" onclick="post_comment(0)">发表评论</button></div>
		</div>
		<div class="ListComment">
			<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<ul class="lists">
					<ol class="icon"><a href="/"><img src="<?php echo $rs['icon']; ?>" onerror="this.src='/public/static/images/nobody.gif'"/></a></ol>
					<li class="infos">
						<div class="name"><a href="/"><?php echo $rs['username']; ?></a></div>
						<div class="comment"><?php echo $rs['content']; ?></div>
						<dl><dt><?php echo $rs['time']; ?></dt><dd><em onclick="dingcomment(<?php echo $rs['id']; ?>)"><i class="si si-like"></i> <a class="agree<?php echo $rs['id']; ?>"><?php echo $rs['agree']; ?></a></em> <span onclick="post_comment(<?php echo $rs['id']; ?>)"><i class="fa fa-commenting-o"></i> 回复</span></dd></dl>
						<div class="repalyinfs repalyinfs<?php echo $rs['id']; ?>">
							<?php if(is_array($rs['children']) || $rs['children'] instanceof \think\Collection || $rs['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
							<div><a href="/"><?php echo $vo['username']; ?>：</a><?php echo $vo['content']; ?></div>
							<?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
					</li>
				</ul>
			<?php endforeach; endif; else: echo "" ;endif; ?>
		</div>
		<div class="ShowMoreComment"><button type="butter" onclick="ShowMoreComment()">更多评论 <i class="fa fa-angle-double-down"></i></button></div>
	</div>
	
	<script type="text/javascript">
		var posturl="{posturl}";
		var repalyid=0;
		var commentpage=1;
		function post_comment(pid){			
			if(pid>0){
				repalyid=pid;
				posturl=posturl+"?pid="+pid;
			}
			layer.open({
			  type: 1,
			  skin: 'layui-layer-demo', //样式类名
			  area: ['320px', '280px'], //宽高
			  closeBtn: 0, //不显示关闭按钮
			  anim: 2,
			  shadeClose: true, //开启遮罩关闭
			  content: '<ul class="PostCommentBox"><ol><textarea placeholder="请输入评论内容"></textarea></ol><li><button type="butter" onclick="post_comment1()">发表</button><button type="butter" onclick="layer.closeAll()">取消</button></li></ul>'
			});
		}
		function post_comment1(){
			var contents=$('.PostCommentBox textarea').val();
			if(contents==''){
				layer.alert("请输入评论内容！");
			}else{
				$.post(
					posturl,
					{content:contents},
					function(res,status){
						if(res.code==0){
							if(repalyid>0){
								$('.repalyinfs'+repalyid).html(res.data);
							}else{
								$('.ListComment').html(res.data);
								commentpage=1;
								//$('.ShowMoreComment').fadeIn();
							}
							layer.closeAll(); //疯狂模式，关闭所有层
							layer.msg('发表成功！');
							HiddenShowMoreComment();
						}else{
							layer.alert('评论发表失败:'+res.msg);
						}
					}
				);
			}
		}

		function dingcomment(id){
			var agree=parseInt($('.agree'+id).html());
			$.get('{posturl}?agree=1&id='+id+'&'+Math.random(),function(res){
				if(res.code==0){
					agree++;
					$('.agree'+id).html(agree);
					layer.msg('点赞成功！');
				}else{
					layer.alert('点赞失败:'+res.msg);
				}
			});
		}

		function ShowMoreComment(){
			commentpage++;
			$.get('{pageurl}?page='+commentpage+'&'+Math.random(),function(res){
				if(res.code==0){
					if(res.data==''){
						layer.msg('显示完了！');
						$('.ShowMoreComment').fadeOut();
					}else{
						res.data="<div class='pages"+commentpage+"'>"+res.data+"</div>";			
						$('.ListComment').append(res.data);
						$('.ListComment .pages'+commentpage).hide();
						$('.ListComment .pages'+commentpage).show(500);
					}
				}else{
					layer.msg(res.msg,{time:2500});
				}
			});
		}

		function HiddenShowMoreComment(){
			var Comments=$('.ListComment .lists').length;
			if(parseInt(Comments/<?php echo $cfg_array['rows']; ?>)<1){
				$('.ShowMoreComment').hide();
			}else{
				$('.ShowMoreComment').show();
			}
		}

		HiddenShowMoreComment();
	</script>

	 COMMENT--><?php endif; fun('label@run_comment_label','commentwap01',$info,['sysid'=>$sysid,'aid'=>$id,'status'=>'','dirname'=>__FILE__,'tpl'=>'','cache_time'=>'0','rows'=>'5','where'=>'','order'=>'','by'=>'']); ?>-->
</div>



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