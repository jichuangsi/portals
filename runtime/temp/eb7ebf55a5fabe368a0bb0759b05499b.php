<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:71:"D:\web\Education\template/member_style/default/member\user/pc_index.htm";i:1554710662;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>个人中心</title>
<meta http-equiv="X-UA-Compatible" content="IE=8"><!-- 强制ie8,for 360 -->
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="/public/static/css/pc_reset.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
</head>
<body>
<link rel="stylesheet" href="/public/static/member/pcuser.css">
<div class="TopContainer">
	<div class="TopBox">
		<div class="logo"><a href="/"><img  src="<?php echo tempdir($webdb['logo']); ?>" onerror="this.src='/public/static/index/default/logo.png'"></a></div>
		<div class="MoreAct">
			<a href="/index.php/cms/list-9.html" class="home">网站首页</a>			
			<?php if(!(empty($userdb['uid']) || (($userdb['uid'] instanceof \think\Collection || $userdb['uid'] instanceof \think\Paginator ) && $userdb['uid']->isEmpty()))): ?>
			<a href="<?php echo get_url('member'); ?>" class='member'>会员中心</a> 
			<a href="<?php echo get_url('quit'); ?>" class='quit'>退出</a>
			<?php else: ?>
			<a href="<?php echo get_url('login'); ?>" class='login'>登录</a> 
			<a href="<?php echo get_url('reg'); ?>" class='reg'>注册</a>
			<?php endif; ?>
		</div>
	</div>
</div>
<div class="SideContainer">
	<div class="BaseInfos">
		<ul>
			<ol>
				<dl>
					<dt>
						<div><img src="<?php echo tempdir($info['icon']); ?>" onerror="this.src='/public/static/images/nobody.gif'"/></div>
						<p><?php echo $info['username']; ?></p>
						<button onclick="send_msg()"><i class="fa fa-fw fa-comment"></i> 给TA发短消息</button>
					</dt>
					<dd>
						<h3>个人基本信息</h3>
						<div>昵称：<?php echo $info['nickname']; ?></div>
						<div>级别：<?php echo getGroupByid($info['groupid']); ?></div>
						<div>UID：<?php echo $info['uid']; ?></div>
						<div>性别：<?php switch($info['sex']): case "1": ?>男<?php break; case "2": ?>女<?php break; default: ?>保密<?php endswitch; ?></div>
						<div>生日：<?php echo $info['bday']; ?></div>						 
						<div>联系QQ：<?php echo $info['oicq']; ?></div>
						<div>注册日期：<?php echo date("Y-m-d H:i:s",$info['regdate']); ?></div>
						<div>最后登录：<?php echo date("Y-m-d H:i:s",$info['lastvist']); ?></div>

					</dd>
				</dl>
			</ol>
			<li>
				<dl>
					<dt><span>个人财务相关信息</span></dt>
					<dd>
						<div>积分： <span><?php echo $info['money']; ?> 个</span> </div>
						<div>可用余额： <em><?php echo $info['rmb']; ?> </em>元 </div>
						<div>冻结余额：<em><?php echo $info['rmb_freeze']; ?> </em>元</div>
						 
					</dd>
				</dl>
				
				<br>
				<dl>
					<dt><span>用户组扩展信息</span></dt>
					<dd>
<!-- field过滤显示的字段,多个用逗号隔开,$f_array跟form表单一样的数组 -->
<?php if($f_array): if(defined('LABEL_DEBUG')): ?><!--SHOWPAGE <!--d41d8cd98f00b204e9800998ecf8427e		--><?php if(is_array($info) || $info instanceof \think\Collection || $info instanceof \think\Paginator): $i = 0; $__LIST__ = $info;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div><?php echo $rs['title']; ?>：<?php echo $rs['value']; ?></div>
  <?php endforeach; endif; else: echo "" ;endif; ?> SHOWPAGE--><?php endif; fun('label@run_showpage_label','d41d8cd98f00b204e9800998ecf8427e',$info,['f_array'=>$f_array,'page'=>$page,'dirname'=>__FILE__,'tpl'=>'','field'=>'test33','val'=>'info','cache_time'=>'0']); endif; ?>		 
					</dd>
				</dl>

			</li>			
		</ul>
	</div>
</div>
<script type="text/javascript">
function send_msg(){
	layer.open({
	  type: 2,
	  title: '给他发消息',
	  shadeClose: true,
	  shade: false,
	  maxmin: true, //开启最大化最小化按钮
	  area: ["850px", "650px"],
	  content: "<?php echo url('member/msg/add',['uid'=>$info['uid']]); ?>",
	});
}
</script>
<div class="SideContainer">
	<div class="head"><i class="fa fa-fw fa-book"></i>我发的文章</div>
	<div class="MoreCnt">
	<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--wap_member_homepage_001	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="list1"><?php echo $i; ?>、<a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],85); ?></a> <span style="float:right;margin-right:10px;">[<?php echo date("y-m-d",$rs['create_time']); ?>]</span></div>
	  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $wap_member_homepage_001 = fun('label@run_label','wap_member_homepage_001',['union'=>'uid','uid'=>$uid,'val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'6','class'=>'','order'=>'id','by'=>'desc','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0' ,'mid'=>'1' ]); ?>
	</div>
</div>

<style type="text/css">
.member_showbbs_title .head{
	padding-left:0;
	height:45px;
}
.member_showbbs_title .head span{
	display:block;
	float:left;
	background:#eee;
	height:45px;
	font-size:18px;
	padding:0 13px 0 13px;
}
.member_showbbs_title .head span.ck{
	background:orange;
	color:#fff;
}

</style>
<?php if(modules_config('bbs')): ?>
<div class="SideContainer member_showbbs_title">
	<div class="head"><span class="ck">我发表的主题</span><span>我回复的主题</span></div>
	<div class="MoreCnt show_content">
	<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_member_homepage_002	bbs	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="list1"><span class="gi"><?php echo $i; ?></span>、<a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],85); ?></a> <span style="float:right;margin-right:10px;">[<?php echo date("y-m-d",$rs['create_time']); ?>]</span></div>
	  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $pc_member_homepage_002 = fun('label@run_label','pc_member_homepage_002',['union'=>'uid','uid'=>$uid,'val'=>'','list'=>'rs','systype'=>'bbs','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'','order'=>'id','by'=>'desc','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0' ,'mid'=>'1' ]); ?>
	</div>
	<div class="MoreCnt show_content bbs_content_reply" style="display:none;">
	<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--pc_member_homepage_reply_002		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<div class="list1"><span class="gi"><?php echo $i; ?></span>、<a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo get_word($rs['title'],85); ?></a> <span style="float:right;margin-right:10px;">[<?php echo date("y-m-d",$rs['create_time']); ?>]</span></div>
	  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $pc_member_homepage_reply_002 = fun('label@run_label','pc_member_homepage_reply_002',['union'=>'uid','uid'=>$uid,'val'=>'','list'=>'rs','systype'=>'','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'app\bbs\model\Content@get_reply_label','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'bbs_content_reply','cache_time'=>'0'  ]); ?>
	</div>
</div>
<?php endif; ?>
<script type="text/javascript">
var type_num = 0; //默认是第一项
$(document).ready(function () {
	$(".member_showbbs_title .head span").click(function(){
		$(".member_showbbs_title .head span").removeClass('ck');
		$(this).addClass('ck');
		type_num = $(this).index();
		$(".member_showbbs_title .show_content").hide();
		$(".member_showbbs_title .show_content").eq(type_num).show();
		scroll_get = true;	//避免其它加载完了,这里却无法加载
	});
});

var Mpage = new Array();	//页码数组
var urldb = new Array('<?php fun("label@label_ajax_url","pc_member_homepage_002",__FILE__); ?>','<?php fun("label@label_ajax_url","pc_member_homepage_reply_002",__FILE__); ?>'); //不同的URL
function ShowMoreBBs(){
	if( typeof Mpage[type_num]=='undefined' ){
		Mpage[type_num] = 1;
	}
	Mpage[type_num]++;
	var url = urldb[type_num] + Mpage[type_num];
	
	$.get(url,function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
			}else{
				$(".member_showbbs_title .show_content").eq(type_num).append(res.data);
				set_i_num();
				scroll_get = true;
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}

//滚动显示更多
var scroll_get = true;	//做个标志,不要反反复复的加载
$(document).ready(function () {
	$(window).scroll(function () {
		if (scroll_get==true &&  (400 + $(window).scrollTop())>($(document).height() - $(window).height())) {
			scroll_get = false;
			layer.msg('内容加截中,请稍候',{time:1000});
			ShowMoreBBs();
		}
	});
});

//设置标题序号
function set_i_num(){
	var j = 0;
	$(".member_showbbs_title .show_content").eq(type_num).find('.list1 .gi').each(function(){
		j++;
		$(this).html(j);
	});
}

</script>

<?php if(($userdb['uid']==$info['uid']||$userdb['groupid']==3)): ?>
<div class="SideContainer">
	<div class="head"><i class="si si-lock"></i>我的私密资料</div>
	<div class="MoreCnt">
		<div class="list1">注册IP：<?php echo $info['regip']; ?></div>
		<div class="list1">真实姓名：<?php echo $info['truename']; ?></div>
		<div class="list1">身份证号码：<?php echo $info['idcard']; ?></div>
		<div class="list1">联系电话：<?php echo $info['mobphone']; ?></div>
		<div class="list1">联系地址：<?php echo $info['address']; ?></div>
		<div class="note">说明：以上私密资料只有本人与管理员才可查看,其它人无法查看!</div>
	</div>
</div>
<?php endif; ?>

<div class="FootContainer" style="display: none;">
	Copyright@www.php168.com all rights reserved <?php echo $webdb['miibeian_gov_cn']; ?><br/>
	Powered by qibosoft Code © 2003-2018
</div>
<script>

</script>
</body>
</html>