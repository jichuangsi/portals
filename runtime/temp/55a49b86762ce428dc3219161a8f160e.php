<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:69:"D:\web\Education\template/index_style/default/bbs\content/pc_show.htm";i:1554191960;s:62:"D:\web\Education\template/index_style/toutiao/index/layout.htm";i:1554714292;s:65:"D:\web\Education\template\index_style\default\index\min_login.htm";i:1554707864;s:71:"D:\web\Education\template\index_style\default\bbs\content\pc_notice.htm";i:1548659155;s:65:"D:\web\Education\template\index_style\default\bbs\scroll_sort.htm";i:1548659155;s:66:"D:\web\Education\template\index_style\default\bbs\content\menu.htm";i:1548659155;}*/ ?>
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
		<li><a href="<?php echo get_url('member'); ?>" target="_blank">进入会员中心</a> <a href="<?php echo get_url('quit'); ?>" target="_blank">安全退出</a></li>
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



<?php if((($ads = fun('qun@adByid',$info['qun']['id'])) || $info['qun']['notice'])): ?>
<style type="text/css">
#drk_colee_left0 a{font-size:45px;font-family:黑体;color:#FFFF00;}
</style>
<div style="width:1200px;line-height:60px;height:60px;margin:auto;background:url(/public/static/group/marquee.png) #666;margin-bottom:10px;">
<div id="drk_colee_left0" style="overflow:hidden;width:100%;margin:5px auto 0 auto;">
	<table>
      <tr>
      	<td id="drk_colee_left1">
        	<div style="white-space:nowrap;">

<?php if($ads['ad']): ?>
	<a href="<?php echo $ads['ad']['url']; ?>"><?php echo $ads['ad']['title']; ?></a>
<?php elseif(($ads['set'])): ?>
	<a href="<?php echo murl('qun/aduser/add',['aid'=>$info['qun']['id']]); ?>">本 广告位招租：<?php echo $ads['set']['price']; ?>元（<?php echo $ads['set']['day']; ?>天），点击购买。</a>
<?php else: ?>	
	<a href="<?php echo urls('qun/content/show',['id'=>$info['qun']['id'],'my_qid'=>$info['qun']['id']]); ?>"><?php echo $info['qun']['notice']; ?></a>
<?php endif; ?>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 
            </div>
        </td>
        <td id="drk_colee_left2"></td>
      </tr>
    </table>
</div>
</div>
<script type="text/javascript">
var drk_colee_left2 = $("#drk_colee_left2").get(0);
var drk_colee_left1 = $("#drk_colee_left1").get(0);
var drk_colee_left0 = $("#drk_colee_left0").get(0);
drk_colee_left2.innerHTML = drk_colee_left1.innerHTML; 
function drk_Marquee3(){
   if(drk_colee_left2.offsetWidth - drk_colee_left0.scrollLeft<=0)
      drk_colee_left0.scrollLeft -= drk_colee_left1.offsetWidth
   else{
      drk_colee_left0.scrollLeft++
   }
}
var drk_MyMar3 = setInterval(drk_Marquee3,50)
drk_colee_left0.onmouseover = function() {clearInterval(drk_MyMar3)}
drk_colee_left0.onmouseout  = function() {drk_MyMar3 = setInterval(drk_Marquee3,50)}
</script>

<?php endif; ?>


<link rel="stylesheet" href="/public/static/bbs/list.css">
<style type="text/css">
pre{padding: 10px 15px;border: 1px solid #D1D7DC;    position: relative; margin: 10px 0; font-size: 12px; border-left: 6px solid #009688;  background-color: #f8f8f8;max-width:700px;overflow-x:auto;}
</style>
<!--<script type="text/javascript" src="/public/static/js/jquery.zclip.min.js"> </script>-->
<script type="text/javascript">
function add_fav(id){
	var url="<?php echo purl('fav/api/add'); ?>?type=<?php echo config('system_dirname'); ?>&id="+id;
	$.get(url,function(res){
		if(res.code==0){
			layer.msg('收藏成功');
		}else{
			layer.alert(res.msg);
		}
	})
}
</script>
<div class="MainContainer">
<!-- 栏目列表 -->
<style type="text/css">
.scroll-sort{
	width:1200px;
	margin:auto;
	margin-bottom:10px;
	background:#FFF;
	height:65px;
}
.scroll-sort span a{
	color:#666;
}
.scroll-sort span{
	border-radius:4px;
	margin-left:15px;
	padding-left:13px;
	padding-right:13px;
	font-size:16px;
	line-height:35px;
	margin-top:15px;
	height:35px;
	background:#efefef;
	display:block;
	float:left;
}
.scroll-sort span:hover{
	background:orange;
}
.scroll-sort span:hover a{
	color:#fff;
}
.scroll-sort .choose{
	background:orange;
}
.scroll-sort .choose a{
	color:#fff;
}
.swiper-slide{width: auto!important;}
</style>
<link href="/public/static/libs/swiper/swiper.min.css" rel="stylesheet">
	<div class="scroll-sort">
		<div class="swiper-container">
			<div class="swiper-wrapper">
			<?php if(is_array(sort_config(0)) || sort_config(0) instanceof \think\Collection || sort_config(0) instanceof \think\Paginator): $i = 0; $__LIST__ = sort_config(0);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<span class='swiper-slide <?php if($fid == $rs['id']): ?>choose<?php endif; ?>'><a href="<?php echo urls('content/index',['fid'=>$rs['id']]); ?>"><?php echo $rs['name']; ?></a></span>
			<?php endforeach; endif; else: echo "" ;endif; ?>
			</div>
		</div>
	</div>
<script src="/public/static/libs/swiper/swiper.min.js"></script>
<script>
    $(function () {
        var swiper = new Swiper('.swiper-container', {
            spaceBetween: 0,
            slidesPerView:'auto',
            freeMode: true
        });
    })
</script>
	<div class="Container">
		<div class="LeftCnt">
			<div class="ShowContent" style="position: relative;">
				<?php if($info['status'] == '2'): ?><div style="position: absolute;left:430px;top:70px;filter: z-index: 1;"><img style="opacity:0.1;filter:alpha(opacity=10);" src="/public/static/images/recom.png"></div><?php endif; ?>
				<div class="topinfo">
					<div class="guide"><a href="<?php echo urls('index/index'); ?>"><i class="fa fa-home">社区主页</i></a>　 
					<?php if(!(empty($info['qun']) || (($info['qun'] instanceof \think\Collection || $info['qun'] instanceof \think\Paginator ) && $info['qun']->isEmpty()))): ?>
					 <a href="<?php echo urls('qun/content/show',['id'=>$info[ext_id]]); ?>"><i class="fa fa-group"><?php echo $info['qun']['title']; ?></i></a>　
					<?php endif; if(!(empty($s_info) || (($s_info instanceof \think\Collection || $s_info instanceof \think\Paginator ) && $s_info->isEmpty()))): ?>
					  <a href="<?php echo urls('content/index',['fid'=>$fid]); ?>"><i class="fa fa-th-list"> <?php echo $s_info['name']; ?></i></a>
					<?php endif; ?>
					</div>
					<dl class="SharBox">
						<dt><span onClick="$('.SharBox dd').fadeIn();" style="margin-right:20px;"><i class="fa fa-share-square-o"></i>分享</span> <span onclick="add_fav(<?php echo $id; ?>)"> <li class="fa fa-fw fa-heart"></li>收藏</span> </dt>
						<dd>
							<div class="bshare-custom">
								<a title="分享到微信" class="bshare-weixin"></a>
								<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
								<a title="分享到Facebook" class="bshare-facebook"></a>
								<a title="分享到QQ空间" class="bshare-qzone"></a>
								<a title="分享到Twitter" class="bshare-twitter"></a>
								<a title="分享到Google+" class="bshare-gplus"></a>
								<a title="分享到QQ好友" class="bshare-qqim"></a>
							</div>
							<div class="exit" onClick="$('.SharBox dd').fadeOut();">X</div>
						</dd>				
					</dl>
					<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
					<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/bshareC0.js"></script>
				</div>
				<div class="title"><?php echo $info['title']; ?></div>
				<div class="thebase" style="background:#F9F9F9;">
					<ul>
						<ol><a href="<?php echo get_url('user',$info['uid']); ?>" target="_blank"><img src="<?php echo get_user_icon($info['uid']); ?>" onerror="this.src='/public/static/images/nobody.gif'"  onmouseover="changeShowImg($(this),'over');" onmouseout="changeShowImg($(this),'out');" ></a></ol>
						<li>
							<div><span onclick="sendmsg('<?php echo get_user_name($info['uid']); ?>')"><?php echo get_user_name($info['uid']); ?></span> <?php if(config('webdb.show_pay_money')): ?><i>消费<?php echo fun('count@rmb',$info['uid']); ?>元</i><?php endif; ?> <em class="si si-speedometer"> <?php echo format_time($info['create_time'],true); ?> <?php echo format_time($info['create_time'],"H:i"); ?></em> <?php if($info['phone_type']): ?> <em class="fa fa-mobile-phone" style="color:#999;">  <?php echo $info['phone_type']; ?></em><?php else: ?> <em class="fa fa-laptop" style="color:#999;"></em><?php endif; ?></div>
							<div><a href="#"><?php echo getGroupByid(get_user($info['uid'])['groupid']?:''); ?></a></div>
						</li>
					</ul>
					<dl>
						<dt><i class="si si-eye"></i><?php echo $info['view']; ?></dt>
						<dd>
						<i class="fa fa-commenting-o"></i><?php echo $info['replynum']; ?> 
						<!--操作菜单-->
						<style type="text/css">
.menu_highlight{
	color:orange;
}
</style>
<script type="text/javascript">
function delete_topic(){
	layer.confirm('确认要删除吗？', {
            btn : [ '确定', '取消' ]
        }, function(index) {
            delinfo(<?php echo $info['id']; ?>,0);
    }); 
}
</script>
<?php if(($admin || $info['uid']==$userdb['uid'])): ?>
	<i onclick="delete_topic()" class="fa fa-trash-o"></i>
	<i onclick="editinfo(<?php echo $info['id']; ?>,0)" class="fa fa-edit"></i>
<?php endif; if($admin): if(empty($info['list'])): ?>
		<i onclick="api_get('<?php echo urls('wxapp.api/recover','id='.$id); ?>','你要取消沉底吗?',this)" class="glyphicon glyphicon-arrow-down menu_highlight" title="取消沉底"></i>
	<?php else: ?>
		<i onclick="api_get('<?php echo urls('wxapp.api/bottom','id='.$id); ?>','你要设置为沉底吗?',this)" title="排序沉底" class="glyphicon glyphicon-arrow-down"></i>
	<?php endif; if($info['list']>time()): ?>
		<i onclick="api_get('<?php echo urls('wxapp.api/recover','id='.$id); ?>','你要取消置顶吗?',this)" class="glyphicon glyphicon-arrow-up menu_highlight" title="取消置顶"></i>
	<?php else: ?>
		<i onclick="set_topic_top('<?php echo urls('wxapp.api/top','id='.$id); ?>',this)" class="glyphicon glyphicon-arrow-up" title="排序置顶"></i>
	<?php endif; if($info['status']>1): ?>
		<i onclick="api_get('<?php echo urls('wxapp.api/unstar','id='.$id); ?>','你要取消推荐吗?',this)" class="fa fa-star menu_highlight" title="取消推荐"></i>
	<?php else: ?>
		<i onclick="api_get('<?php echo urls('wxapp.api/star','id='.$id); ?>','你要设置为推荐吗?',this)" title="推荐" class="fa fa-star-o"></i>
	<?php endif; if($info['lock']>0): ?>
		<i onclick="api_get('<?php echo urls('wxapp.api/unlock','id='.$id); ?>','你要取消锁定吗?',this)" class="fa fa-lock menu_highlight" title="取消锁定"></i>
	<?php else: ?>
		<i onclick="api_get('<?php echo urls('wxapp.api/lock','id='.$id); ?>','你要锁定不给回复吗?',this)" title="锁定" class="fa fa-lock"></i>
	<?php endif; endif; ?>

<script type="text/javascript">

function post_act_menu(url,obj){
	layer.load(1);
	$.get(url,function(res){
		layer.closeAll();
			if(res.code==0){
				layer.msg('操作成功');
				if($(obj).hasClass('menu_highlight')){
					$(obj).removeClass('menu_highlight');
				}else{
					$(obj).addClass('menu_highlight');
				}
			}else if(res.code==1){
				layer.alert(res.msg);
			}else{
				layer.alert('未知错误');
			}
	}).fail(function(){
			layer.alert('页面出错');
	});
}

function api_get(url,msg,obj){
	layer.confirm(msg,{title:false,},function(index){
		post_act_menu(url,obj);
	});
}

function set_topic_top(url,obj){
	layer.prompt({
		  formType: 0,
		  value: '3',
		  title: '请输入要置顶多少天?',
		  //area: ['100px', '20px'] //formType:2 自定义文本域宽高
		}, function(value, index, elem){
			layer.close(index);
			var time = value * 24;	//单位小时
			post_act_menu(url+'?time='+time,obj);
	});
}

	

</script>
						</dd>
					</dl>
				</div>
				<div class="content_html">
					<?php echo $info['content']; if($info['mvurl']): ?><video src="<?php echo tempdir($info['mvurl']); ?>" controls="controls" style="width:100%;">您的浏览器不支持播放该视频！</video><?php endif; if(is_array($info['picurls']) || $info['picurls'] instanceof \think\Collection || $info['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $info['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
</br><img  style="margin-bottom:10px;" src="<?php echo $rs['picurl']; ?>"/>
<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
				<div class="content_act">
					<div onclick="TopicAgree()"><span style="display: flex;"><i style="margin: auto;" class="fa fa-thumbs-o-up"></i></span><em id="topic_agree"><?php echo $info['agree']; ?></em></div>
					<?php if(!(empty(plugins_config('givemoney')) || ((plugins_config('givemoney') instanceof \think\Collection || plugins_config('givemoney') instanceof \think\Paginator ) && plugins_config('givemoney')->isEmpty()))): ?><div><span style="display: flex;" class="give-money" data-id="<?php echo $id; ?>"><i style="margin: auto;" class="si si-present"></i></span><em>打赏</em></div><?php endif; ?>
					<div onclick="add_fav(<?php echo $id; ?>)"><span style="display: flex;"><i style="margin: auto;" class="fa fa-fw fa-star-o"></i></span><em>收藏</em></div>
					<?php if(empty($info['lock']) || (($info['lock'] instanceof \think\Collection || $info['lock'] instanceof \think\Paginator ) && $info['lock']->isEmpty())): ?><div onclick="replyuser(0)"><span style="margin-left:15px;display: flex;"><i style="margin: auto;" class="fa fa-edit"></i></span><em>点击回复</em></div><?php endif; ?>
				</div>
			</div>
<style type="text/css">
.ShowComment .replycontent{
	max-width:700px;
	overflow:hidden;
}
</style>
			<div class="ShowComment">
				<ul class="head"><ol>全部留言</ol><li>共 <span id="commentnum"><?php echo $info['replynum']; ?></span> 条</li></ul>
<?php if(defined('LABEL_DEBUG')): ?><!--REPLY<!--pcbbs_reply		-->
				<div class="ListComment">
				<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<div class="lists">
						<ul>
							<ol><a <?php if(modules_config('weibo')): ?>onclick="pc_view_weibo_msg(<?php echo $rs['uid']; ?>)"<?php else: ?> href="<?php echo get_url('user',$rs['uid']); ?>" target="_blank" <?php endif; ?>><img src="<?php echo $rs['icon']; ?>" onerror="this.src='/public/static/images/nobody.gif'"  onmouseover="changeShowImg($(this),'over');" onmouseout="changeShowImg($(this),'out');" ></a></ol>
							<li>
								<div class="info"><a href="javascript::" onclick="sendmsg('<?php echo $rs['username']; ?>')"><?php echo $rs['username']; ?> </a><span><?php echo getGroupByid(get_user($rs['uid'])['groupid']?:''); ?> </span><em> <?php if(config('webdb.show_pay_money')): ?>消费:<?php echo fun('count@rmb',$rs['uid']); ?>元<?php endif; ?> <?php echo $rs['time']; ?>  <?php echo format_time($rs['create_time'],"H:i"); if($rs['phone_type']): ?> <dd class="fa fa-mobile-phone">  <?php echo $rs['phone_type']; ?></dd><?php endif; ?></em><i class="lou"><?php echo $i; ?>楼</i></div>
								<div class="cnt replycontent" style="word-break:break-all;">
								<?php echo $rs['content']; if($rs['picurls']): if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ps): $mod = ($i % 2 );++$i;?>
										<br><img style="margin-bottom:8px;" src="<?php echo $ps['picurl']; ?>">
									<?php endforeach; endif; else: echo "" ;endif; endif; ?>
								</div>
								<div class="replaycomment repalyinfs<?php echo $rs['id']; ?>">
									<?php if(is_array($rs['children']) || $rs['children'] instanceof \think\Collection || $rs['children'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['children'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
									<dl>
										<dt><a href="javascript::" onclick="sendmsg('<?php echo $vs['username']; ?>')"><?php echo $vs['username']; ?> </a> <?php if(config('webdb.show_pay_money')): ?><i style="color:#888;"> 消费:<?php echo fun('count@rmb',$vs['uid']); ?>元  </i><?php endif; if($vs['phone_type']): ?> <em class="fa fa-mobile-phone">  <?php echo $vs['phone_type']; ?></em><?php endif; ?><em> <?php echo $vs['time']; ?></em></dt>
										<dd style="word-break:break-all;" class="replycontent">
										<?php echo $vs['content']; if($vs['picurls']): if(is_array($vs['picurls']) || $vs['picurls'] instanceof \think\Collection || $vs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ps): $mod = ($i % 2 );++$i;?>
												<br><img style="margin-bottom:8px;" src="<?php echo $ps['picurl']; ?>">
											<?php endforeach; endif; else: echo "" ;endif; endif; ?>
										<i class="fa fa-commenting-o" onclick="replyuser(<?php echo $vs['pid']; ?>,'@<?php echo $vs['username']; ?> ')"></i>
										<?php if(($this->admin || $vs['uid']==$this->user['uid'])): ?><i onclick="layer.confirm('您确定要删除吗?',{btn: ['确定', '取消']}, function(){delinfo(<?php echo $aid; ?>,<?php echo $vs['id']; ?>)});" class="fa fa-trash-o"></i><?php endif; ?> </dd>
									</dl>
									 <?php endforeach; endif; else: echo "" ;endif; ?>
								</div>
							</li>
						</ul>
						<div class="other">
							<i class="fa fa-thumbs-o-up"  onclick="reply_agree(<?php echo $rs['id']; ?>)"></i><span  onclick="reply_agree(<?php echo $rs['id']; ?>)" class="upnum replyAgree<?php echo $rs['id']; ?>"><?php echo $rs['agree']; ?></span>
							<?php if(!(empty(plugins_config('givemoney')) || ((plugins_config('givemoney') instanceof \think\Collection || plugins_config('givemoney') instanceof \think\Paginator ) && plugins_config('givemoney')->isEmpty()))): ?><a href="javascript::"><span class="give-money" data-id="<?php echo $aid; ?>" data-rid="<?php echo $rs['id']; ?>"><i class="si si-present"></i></span><em>打赏</em></a><?php endif; if(empty($info['lock']) || (($info['lock'] instanceof \think\Collection || $info['lock'] instanceof \think\Paginator ) && $info['lock']->isEmpty())): ?><a onclick="replyuser(<?php echo $rs['id']; ?>)" href="javascript::"><i class="fa fa-commenting-o"></i>回复</a><?php endif; if(($this->admin || $rs['uid']==$this->user['uid'])): ?><i onclick="layer.confirm('您确定要删除吗?',{btn: ['确定', '取消']}, function(){delinfo(<?php echo $aid; ?>,<?php echo $rs['id']; ?>)});" class="fa fa-trash-o"></i><?php endif; ?>
						</div>
					</div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
				</div>
				<div class="ShowMoreComment"><span onclick="ShowMoreComment()">更多回复<i class="fa fa-angle-double-down"></i></span></div>
		<script type="text/javascript">
		var posturl="<?php echo fun('label@reply_api','posturl',$aid,$cfg_array); ?>";
		var pageurl="<?php echo fun('label@reply_api','pageurl',$aid,$cfg_array); ?>";
		</script>
 REPLY--><?php endif; reply_label('pcbbs_reply',$info,['aid'=>$id,'status'=>'','dirname'=>__FILE__,'tpl'=>'','cache_time'=>'0','rows'=>'15','where'=>'','order'=>'','by'=>'']); ?>

<!--弹层回复表单-->
<div style="display:none;" class="div-replayBox">
	<ul class="replayBox" style="text-align:center;">
	<ol><textarea onkeydown="keySend(event);" style="width:560px;height:400px;margin:10px;" placeholder="请输入回复内容"></textarea></ol>
	<li style="text-align:left;padding-left:18px;margin-bottom:10px;">
		表情：<?php $__FOR_START_690__=1;$__FOR_END_690__=13;for($i=$__FOR_START_690__;$i < $__FOR_END_690__;$i+=1){ ?>
		<em onclick="choose_face(this,'[face<?php echo $i; ?>]')"><img src="/public/static/images/qqface/<?php echo $i; ?>.gif" width="20" height="20"></em>
		<?php } ?>
	</li>
	<li><button onclick="layer.closeAll();" style="padding:10px;">取消</button>  <button style="margin-left:50px;padding:10px;" onclick="pop_post();">确定提交</button></li>
	</ul>
</div>

<!--表情处理-->
<script src="/public/static/js/insert.js"></script>
<script type="text/javascript">
function choose_face(obj,face){
	$(obj).find('img').css('border','1px solid red');
	$(".replayBox textarea").last().insert({"text":face});
}
</script>

<script type="text/javascript">

//查看用户信息,微动态信息
function pc_view_weibo_msg(uid){
	layer.open({
		  type: 2,
		  title: '查阅消息',
		  shadeClose: true,
		  shade: false,
		  maxmin: true, //开启最大化最小化按钮
		  area: ['1000px', '600px'],
		  content: '<?php echo url("weibo/api/weibo"); ?>?uid='+uid
		});
}

//点击图片查看大图
jQuery(document).ready(function() {
	$(".content_html img").each(function(){
		$(this).click(function(){
			window.open($(this).attr('src'));
		});
	});
	$(".ShowComment .replycontent img").each(function(){
		$(this).click(function(){
			window.open($(this).attr('src'));
		});
		$(this).css({"max-width":'700px',});
	});
	bbslou();
});

//楼层
function bbslou(){
	var lou = 0;
	$(".ShowComment .lou").each(function(){
		lou++;
		$(this).html(lou+'楼')
	});
}

//给用户发短消息
var haveSendMsg = false;
function sendmsg(name,ifsend){
	if(check_jump_login()!=true) return ;
	if(ifsend==true){
		var contents = $(".sendmsgBox textarea").val();
		contents = contents.replace(new RegExp('\n',"g"),'<br>');
		contents = contents.replace(new RegExp(' ',"g"),'&nbsp;');	
		layer.closeAll();
		if(contents==''){
			layer.alert('内容不能为空!');
			return ;
		}
		if(haveSendMsg==true){
			layer.msg('请不要重复提交');
			return ;
		}
		haveSendMsg = true;
		layer.msg('正在发送消息,请稍候...');
        $.post("<?php echo murl('member/wxapp.msg/add'); ?>", {content:contents,touser:name}).success(function (res) {
			haveSendMsg = false;
            if(res.code==0){
				layer.closeAll(); //关闭所有层
				layer.msg('消息发送成功！');
				$(".sendmsgBox textarea").val('');
			}else{
				layer.alert(res.msg);
			}
		}).fail(function () {
			layer.open({title: '提示',content: '服务器发生错误'});
		});
	}else{
		layer.open({
		  type: 1,
		  title:'给 '+name+' 发私信',
		  area: ['600px','450px'], //宽高，高参数忽略
		  content: '<ul class="sendmsgBox" style="text-align:center;"><ol><textarea style="width:560px;height:300px;margin:10px;" placeholder="请输入要对他的私信留言"></textarea></ol><li><button onclick="layer.closeAll();" style="padding:10px;">取消</button>  <button style="margin-left:50px;padding:10px;" onclick="sendmsg(\''+name+'\','+true+');">确认发送</button></li></ul>',
		});
	}
}
</script>

<script type="text/javascript">
var ueditor;

//修改信息
function editinfo(aid,id){
	var url;
	if(id>0){
		url="<?php echo urls('reply/edit'); ?>?id="+id;
	}else{
		url="<?php echo urls('content/edit'); ?>?id="+aid;
	}
	location.href = url;
}

//删除信息
function delinfo(aid,id){
	var url;
	if(id>0){
		url="<?php echo urls('wxapp.reply/delete'); ?>?id="+id;
	}else{
		url="<?php echo urls('wxapp.post/delete'); ?>?id="+aid;
	}
	$.get(url,function(res){
		if(res.code==0){
			layer.alert("删除成功！");			
			if(id==0){
				location.href="<?php echo urls('index/index'); ?>";
			}else{
				location.reload();
			}
		}else{
			layer.msg("删除失败:"+res.msg,{time:1500});
		}	
	});
}

//主题点赞
function TopicAgree(){	
	$.get("<?php echo urls('wxapp.post/agree',['id'=>$id]); ?>?"+Math.random(),function(res){
		if(res.code==0){
			var num =  $('#topic_agree').html();
			num++;
			$('#topic_agree').html(num);
			layer.msg("点赞成功！",{time:1500});
		}else{
			layer.msg("点赞失败:"+res.msg,{time:1500});
		}	
	});
}

//回复点赞
function reply_agree(id){
	$.get("<?php echo urls('wxapp.reply/agree'); ?>?id=" + id + "&" + Math.random(),function(res){
		if(res.code==0){
			var num =  $('.replyAgree'+id).html();
			num++;
			$('.replyAgree'+id).html(num);
			layer.msg("点赞成功！",{time:1500});

		}else{
			layer.msg("点赞失败:"+res.msg,{time:1500});
		}	
	});
}

//显示分页
var page=1;
var check_showMore=1;
var pid = 0;
function ShowMoreComment(){
	page++;
	check_showMore=0;
	$('.ShowMoreComment').fadeIn();
	$.get(pageurl + "?page="+page+"&"+Math.random(),function(res){
		$('.ShowMoreArtic').fadeOut();
		if(res.code==0){
			if(res.data==''){
				layer.msg("没有更多内容了！",{time:500});
				$('.ShowMoreComment').hide();
			}else{
				$('.ListComment').append(res.data);
				check_showMore=1;
				bbslou();	//楼层显示
				give_jifen();	//重置打赏积分事件
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}

//弹出层进行评论
function pop_post(){
	var contents = $(".replayBox textarea").last().val();	//会出现两个元素,只能用最后一个
	contents = contents.replace(new RegExp('\n',"g"),'<br>');
	contents = contents.replace(new RegExp(' ',"g"),'&nbsp;');
	if(contents.replace(/\[(face\d+)\]/g,"")==""){
		layer.alert('不允许只发表情!');
		return false;			
	}
	layer.closeAll();
	if(contents==''){
		layer.alert('评论内容不能为空!');
		return false;
	}
	
	postcontent({'content':contents},true);
	$(".replayBox textarea").val('')
}

//回复
function replyuser(id,touser){
	pid = id;
	//ueditor.focus()
	if(check_jump_login()!=true) return ;
	layer.open({
	  type: 1,
	  title:'给TA回复',
	  area: ['600px','550px'], //宽高，高参数忽略
	  content: $(".div-replayBox").html(),
	});
	if(typeof touser!='undefined'){
		$(".replayBox textarea").last().val(touser);
	}
}

function keySend(event) {
	if (event.ctrlKey && event.keyCode == 13) {
		pop_post();
	}
}

function check_jump_login(){
	if("<?php echo $userdb['uid']; ?>"==""){
		layer.confirm('你还没登录,确认要登录吗？', {
            btn : [ '确定', '取消' ]
        }, function(index) {
            location.href="<?php echo get_url('login'); ?>";
        });		
	}else{
		return true;
	}
}

</script>
			</div>
			
			<!--百度回复框-->
			<?php if(empty($info['lock']) || (($info['lock'] instanceof \think\Collection || $info['lock'] instanceof \think\Paginator ) && $info['lock']->isEmpty())): ?>
			<div id="PostComment">
			<form class="ajax-post" method="post"  action="" onsubmit="return false;">
				<div class="ueditor">
<script id="content" class="js-ueditor" name="content" type="text/plain"></script>
<script type="text/javascript"> 
jQuery(document).ready(function() {
	//重新定义编辑器的宽度＝表单提交容器标签的宽度
	$('#PostComment .ueditor').width($('#PostComment .submit').width());   
    ueditor =  UE.getEditor($('.js-ueditor').attr('name'), {
            initialFrameHeight:300,  //初始化编辑器高度,默认320
            autoHeightEnabled:false,  //是否自动长高
            maximumWords: 50000, //允许的最大字符数
            serverUrl: '<?php echo urls("index/attachment/upload","dir=images&from=ueditor&module=bbs"); ?>',
			toolbars: [
						['fullscreen', 'source', 'removeformat','undo', 'redo', 'forecolor','backcolor','bold','fontsize','insertimage','attachment','link','emotion','pasteplain','insertcode']
					],
        });
 
});

//ctrl+enter 事件
function postform(){
	layer.confirm('你确认要提交吗?',{
            btn:['确定','取消']
        },function(index){
			var form_data = $('.ajax-post').serialize();
			postcontent(form_data);
        }
	);
}

//检查用户登录状态
var user_uid = "<?php echo $userdb['uid']; ?>";
function check_login(){
	if(user_uid!=''){
		return true;
	}
	layer.open({
	  type: 2,
	  title: '用户登录',
	  shadeClose: true,
	  shade: false,
	  maxmin: true, //开启最大化最小化按钮
	  area: ["750px", "780px"],
	  content: "<?php echo get_url('login'); ?>&type=iframe",
	  end: function(){
		  	//window.location.reload();
			$.get("<?php echo urls('index/wxapp.login/web_login_check'); ?>?" + Math.random(),function(res){
				layer.closeAll();
				if(res.code==0){
					user_uid = res.data.uid;
					layer.msg("登录成功,你现在可以发表信息了",{time:1500});
				}else{
					layer.msg("登录失败");
				}	
			});
		}
	});
}



var havepost = false;
function postcontent(form_data,islayer){
	if(check_login()!==true){	//检查用户登录状态
		return false;
	}
			var that  = ueditor;
			var url = posturl;
			if(pid>0){
				url += '?pid='+pid;
			}
			if(islayer!==true && that.hasContents()==false){
				layer.alert('内容不能为空')
				return false;
			}
			if(havepost==true){
				layer.msg('请不要重复提交');
				return ;
			}
			layer.msg('内容提交中,请稍候');
			havepost = true;
            $.post(url, form_data).success(function (res) {
				havepost = false;
                if(res.code==0){
					if(pid>0){
						$('.repalyinfs'+pid).html(res.data);
					}else{
						$('.ListComment').html(res.data);
						//$('.ShowMoreComment').fadeIn();
					}
					give_jifen();	//重置打赏积分事件
					layer.closeAll(); //关闭所有层
					layer.msg('发表成功！');
					//that.hide();
					that.setContent('');					
					//HiddenShowMoreComment();
					//隐藏的内容需要刷新才可见
					if(($(".content_html").html()).indexOf('需要刷新网页才可见')>0){
						window.location.reload();
					}
				}else{
					layer.alert(res.msg);
				}
            }).fail(function () {
				layer.open({title: '提示',content: '服务器发生错误'});
            });            
}

	$(document).ready(function(){
		//$('.ajax-post').attr('action', pid>0 ? posturl+'?pid='+pid : posturl );	//主要是针对编辑器的ctarl+enter发信息用
        $('.ajax-post').submit(function () {
            var form_data = $(this).serialize();
			postcontent(form_data);
			return false;
        });
    });
</script>
<script src="/public/static/libs/ueditor/ueditor.config.js"></script>
<script src="/public/static/libs/ueditor/ueditor.all.min.js"></script>
				</div>
				<div class="submit"><button type="submit">发表回复</button></div>
				</form>
			</div>
			<?php endif; ?>
			<!--百度回复框-->

		</div>
		<div class="RightCnt">
			<div class="RightSide">
<?php if(!(empty($info['qun']) || (($info['qun'] instanceof \think\Collection || $info['qun'] instanceof \think\Paginator ) && $info['qun']->isEmpty()))): ?>
				<dl class="WXcode">
					<dt><?php echo $info['qun']['title']; ?></dt>
					<dd style="position:relative;"><?php if($info['qun']['status']==2): ?><img src="/public/static/group/v.png" style="position:absolute;width:30px;height:30px;z-index:9;"><?php endif; ?><a target="_blank" href="<?php echo urls('qun/content/show',['id'=>$info['ext_id']]); ?>"><img style="width:220px;height:220px;" src="<?php echo tempdir($info['qun']['picurl']); ?>" onerror="this.src='/public/static/images/nopic.png'" /></a>
					</dd>
				</dl>
<?php endif; ?>
				<dl class="RightBase">
					<dt>
					<?php if(!(empty($info['qun']) || (($info['qun'] instanceof \think\Collection || $info['qun'] instanceof \think\Paginator ) && $info['qun']->isEmpty()))): ?>
						<a href="<?php echo urls('add',['fid'=>$info['fid'],'ext_sys'=>$info['ext_sys'],'ext_id'=>$info['ext_id'],]); ?>"><button type="button">发表圈内新贴</button></a>
						<ul><ol><span>圈内贴子</span><em id="div_total_topic"><?php echo $info['qun']['replynum']; ?></em></ol> <li><span>成员</span><em id="div_total_post"><?php echo $info['qun']['usernum']; ?></em></li></ul>
					<?php else: ?>
						<a href="<?php echo urls('add',['fid'=>$info['fid']]); ?>"><button type="button">发表新贴</button></a>
					<?php endif; ?>
					</dt>
					<dd>
						<div class="h"><span>热门分类</span></div>
						<ul>
<?php if(is_array(sort_config(0)) || sort_config(0) instanceof \think\Collection || sort_config(0) instanceof \think\Paginator): $i = 0; $__LIST__ = sort_config(0);if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
							<li><a href="<?php echo urls('content/index',['fid'=>$rs['id']]); ?>" <?php if($info['fid'] == $rs['id']): ?>class="ck"<?php endif; ?>><?php echo $rs['name']; ?></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
						</ul>
					</dd>
				</dl>
				<div class="SideMores">
					<div class="h"><span>精彩内容</span></div>
					<ul class="ListNewfen">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_indexpage	bbs	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<li><a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a></li>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $pc_indexpage = fun('label@run_label','pc_indexpage',['val'=>'','list'=>'rs','systype'=>'bbs','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'8','class'=>'','order'=>'status','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
					</ul>
					<div class="MOreShow msnewfen"><button type="button" onclick="MoreShowNewfen('<?php fun("label@label_ajax_url","pc_indexpage",__FILE__); ?>')">更多<i class="fa fa-chevron-down"></i></button></div>
				</div>
<script type="text/javascript">
var M_s_page = 1;
function MoreShowNewfen(url){
	M_s_page++;
	$.get(url+M_s_page+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.msnewfen').hide();
			}else{
				$('.ListNewfen').append(res.data);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
</script>
				<dl class="WXcode" style="display: none;">
					<dt>扫一扫访问手机版</dt>
					<dd><img src="<?php echo get_qrcode(get_url('location')); ?>"/>
					</dd>
				</dl>
			</div>
		</div>
	</div>
</div>
<div class="topUpCont">
    <ul>
    	<ol><i class="fa fa-angle-double-up"></i></ol>
        <li>回到顶部</li>
    </ul>
</div>
<script type="text/javascript">
//打赏积分
var sys_dirname = "<?php echo config('system_dirname'); ?>";
var give_money_url = "<?php echo purl('givemoney/api/give','index'); ?>";
var count_money_url = "<?php echo purl('givemoney/api/count','index'); ?>";
var getlist_money_url = "<?php echo purl('givemoney/api/getlist','index'); ?>";

function give_jifen(){
	$(".give-money").each(function(){
		var that = $(this);
		var id = that.data('id');
		var rid = typeof(that.data('rid'))=='undefined' ? 0 : that.data('rid');
		var cid = typeof(that.data('cid'))=='undefined' ? 0 : that.data('cid');
		
		//下一个元素显示数值
		that.next().each(function(){
			var obj = $(this);
			$.get(count_money_url,{'sysname':sys_dirname,'id':id,'rid':rid,'cid':cid},function(res){
				if(res.code==0){
					obj.html(''+res.data+'积分');
					obj.mouseenter(function(){
						obj.unbind("mouseenter");
						layer.tips('点击图标可打赏，点击数值可以查看详情', obj, {tips:[3,'#888'],time:1000});
					});
					obj.click(function(){						
						getlist();
					});
				}else{
					obj.click(function(){
						putnum();
					});
				}
			});
		});
		
		//显示打赏用户
		var getlist = function(){
			layer.closeAll();
			layer.load(1);
			$.post(getlist_money_url,{'sysname':sys_dirname,'id':id,'rid':rid,'cid':cid},function(res){
				layer.closeAll();
				if(res.code==0){
					var str = '';
					res.data.forEach(function(rs){
						str += '<div style="padding:5px;"><span style="color:blue;">' + rs.username + '</span> 打赏积分: ' + rs.money + ' 个 　　<span style="color:#666;">['+rs.create_time+']</span></div>';
					});
					layer.open({
					  title:'打赏用户列表',
					  type: 1,
					  area: '400px',
					  content: '<div style="padding:15px;">' + str + '</div>',
					});
				}else{
					layer.alert(res.msg);
				}
			}).fail(function(){layer.closeAll();layer.alert('页面出错了!')});
		}

		//打赏输入积分个数
		var putnum = function(){
			layer.prompt({
				  formType: 0,
				  value: '3',
				  title: '请输入要打赏的积分个数',
				  //area: ['100px', '20px'] //formType:2 自定义文本域宽高
				}, function(value, index, elem){
					layer.close(index);
					postdata(value);
				}
			);
		};
		
		//打赏点击事件
		that.click(function(){
			putnum();
		});
		
		//打赏提交数据
		var postdata = function(num){			
			layer.load(1);
			$.post(give_money_url,{'sysname':sys_dirname,'money':num,'id':id,'rid':rid,'cid':cid,'about':''},function(res){
				layer.closeAll();
				if(res.code==0){
					layer.msg('打赏成功,谢谢你!');
				}else{
					layer.alert(res.msg);
				}
			}).fail(function(){layer.closeAll();layer.alert('页面出错了!')});
		}		
	});
}
$(document).ready(function () {
	give_jifen();
});
</script>

<script type="text/javascript">
$(document).ready(function () {	
	var rightBoxH = $('.RightSide').height();	//右边页面的高度	
	var headBoxH = $('.RightBase').offset().top;	//元素距离网页顶部的距离
	$(window).scroll(function () {
		var scroll_Height = $(window).scrollTop(); //页面滚动的高度距离
		if(scroll_Height>rightBoxH+headBoxH){
			$('.RightBase').addClass('RightBase1'); //让右边漂浮起来
			var thistopH = scroll_Height-headBoxH;	//靠在页面的顶部
			$(".RightBase").css({'top':thistopH+'px'});
		}else{
			$('.RightBase').removeClass('RightBase1');
		}
		if (scroll_Height > 100) {
			$(".topUpCont").show();
		} else {
			$(".topUpCont").hide();
		}		
	});
	$(".topUpCont").click(function () {
		$("html,body").animate({scrollTop:0},500);
	});
});
</script>
<!-- 微动态自动收录用户感兴趣的主题,时间60代表用户停留60秒将自动收藏 -->
<?php echo fun('sns@fav',$info,60,'系统帮你订阅了本主题,下次本主题有回复,将会通知你'); ?>

<script type="text/javascript">
//百度自动推送
(function(){
    var bp = document.createElement('script');
    var curProtocol = window.location.protocol.split(':')[0];
    if (curProtocol === 'https'){
   bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
  }
  else{
  bp.src = 'http://push.zhanzhang.baidu.com/push.js';
  }
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();



//输入密码查看内容
function view_content_password(str){
	layer.prompt({
            title: '请输入访问密码',
            formType: 0
       }, function(value){
		   $.get("<?php echo urls('wxapp.viewcheck/ckpwd'); ?>?pwd="+value+"&md5str="+str,function(res){
			   if(res.code==0){
				   window.location.reload();
			   }else{
					layer.alert('密码不对');
			   }
		   });
    });
}

//消费积分才能查看
function view_content_paymoney(str){
	layer.confirm('你确认支付吗?',{title:'提醒!',btn:['确认支付','取消']},function(){
		$.get("<?php echo urls('wxapp.viewcheck/ckmoney'); ?>?md5str="+str,function(res){
			if(res.code==0){
				 window.location.reload();
			}else{
				layer.alert(res.msg);
			}
		});
	});
}

</script>


<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/foot.css">
<div id="copyright" style="display: none;">
    <div>Copyright@<?php echo $webdb[www_url]; ?> all rights reserved <a href="http://www.miibeian.gov.cn" target="_blank"><?php echo $webdb['miibeian_gov_cn']; ?></a></div>
    <div>Powered by <a href="http://www.php168.com" target="_blank">qibosoft <?php echo $webdb['QB_VERSION']; ?></a> Code &copy; 2018 <a href="http://bbs.qibosoft.com/" target="_blank">qibosoft</a></div>
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