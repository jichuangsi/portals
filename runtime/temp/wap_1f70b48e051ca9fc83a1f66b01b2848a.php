<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:81:"D:\web\Education\template/member_style/default/plugins/propagandize/log/index.htm";i:1549937912;s:73:"D:\web\Education\template/member_style/21syx_member/member/wap_layout.htm";i:1548153004;s:69:"D:\web\Education\template\member_style\default\member\common\menu.htm";i:1549867535;s:72:"D:\web\Education\template\member_style\default\member\common\table01.htm";i:1549872832;s:64:"D:\web\Education\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<title> <?php echo $tab_ext['page_title']; ?> </title>

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




	<?php if($tab_ext['top_button']): ?><!--菜单-->
<ul class="qb_ui_page_menu">
	<?php if(is_array($tab_ext['top_button']) || $tab_ext['top_button'] instanceof \think\Collection || $tab_ext['top_button'] instanceof \think\Paginator): $i = 0; $__LIST__ = $tab_ext['top_button'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		<li <?php if(($rs['type']=='add'&&count($tab_ext['top_button'])>1)): ?>style="float:right;"<?php endif; ?>><a class="<?php if($rs['type']=='add'): ?>red<?php elseif(($key==$mid)): ?>blue<?php endif; ?>" href="<?php echo $rs['url']; ?>" target="<?php echo $rs['target']; ?>"><?php echo $rs['title']; ?></a></li>				
	<?php endforeach; endif; else: echo "" ;endif; ?>
</ul>
<?php endif; ?>
	<style type="text/css">
body{
	background: #F5F5F5;
}
.sideBox{
	margin: 0px 10px 10px 10px;
	background: #FFF;
	border-radius: 5px;
	box-shadow: 2px 2px 2px #CCC;
	padding: 0 15px;
	overflow: hidden;
	font-size:16px;
}
.sideBox ul{
	position: relative;
	display: table;
	width: 100%;
	border-bottom: #DDD dotted 1px;
}
.sideBox ul ol,.sideBox ul li{
	display: table-cell;
	padding:10px 5px;
	line-height: 20px;
}
.sideBox ul ol{
	color: #888;	
}
.sideBox ul li{
	text-align: right;
}
.sideBox .showimg,.sideBox .content{
	border-bottom: #DDD dotted 1px;
	padding: 8px 0;
	color: #666;
	font-size: 14px;
	line-height: 20px;
}
.sideBox .showimg img{
	max-width: 100%;
}
.sideBox .actions{
	height: 40px;
	padding: 10px 0;
}
.sideBox .actions a{
	display: block;
	width: 33%;
	line-height: 40px;
	text-align: center;
	float: left;
	color: #777;
	font-size:16px;
}
.sideBox .actions a:before{
	padding-right: 8px;
}
.sideBox .actions a.fa-eye{
	border-left:#DDD solid 1px;
	border-right:#DDD solid 1px;
}
</style>

<script>
	$(function(){
		$('.qb_header').css({'position':'fixed','top':'0','z-index':'9999'});
	});
</script>
<div style="margin-top: 65px;"></div>
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>

<div class="sideBox">
	
	<?php if(!(empty($rs['title']) || (($rs['title'] instanceof \think\Collection || $rs['title'] instanceof \think\Paginator ) && $rs['title']->isEmpty()))): ?><!--标题单独显示-->
		<ul><a href="<?php echo iurl('show',['id'=>$rs['id']]); ?>"><?php echo $rs['title']; ?></a><ol>&nbsp;</ol></ul>
	<?php endif; if(!(empty($rs['picurl']) || (($rs['picurl'] instanceof \think\Collection || $rs['picurl'] instanceof \think\Paginator ) && $rs['picurl']->isEmpty()))): ?><!--图片单独显示-->
		<div class="showimg"><img src="<?php echo tempdir($rs['picurl']); ?>"/></div>
	<?php endif; $_result=fun('field@fields_to_table',$f_array,$rs);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?> <!--自定义字段-->
		<?php if((in_array($vs['type'],['textarea','ueditor']))): ?>	<!--文本内容单独显示-->
			<?php if(!(empty($vs['value']) || (($vs['value'] instanceof \think\Collection || $vs['value'] instanceof \think\Paginator ) && $vs['value']->isEmpty()))): ?>
			<div class="content"><?php echo $vs['value']; ?></div>
			<?php endif; elseif(($vs['value']!==''&&!in_array($vs['name'],['title','picurl','create_time','status']))): ?><!--把标题\图片\时间过滤掉-->
			<ul>
				<?php if(($vs['title']!='uid')): ?>
				<ol><?php echo $vs['title']; ?></ol>
				<li><?php echo $vs['value']; ?></li>
			</ul>
				<?php elseif(($vs['title']=='uid')): ?>
				<div style="display: flex;justify-content: flex-end;padding: 10px 0px;"><button style="border: none;border-radius: 10px;padding: 0 15px;background-color: #FFDD33;font-size: 14px;" onclick="window.location.href='<?php echo url('member/msg/add',['uid'=>$vs['value']]); ?>'">给TA发信息</button></div>
				<?php endif; endif; endforeach; endif; else: echo "" ;endif; if($rs['create_time']): ?><!--时间单独显示-->
		<ul>
			<ol>日期</ol>
			<li><?php echo format_time($rs['create_time'],"Y-m-d H:i"); ?><div></div></li>		
		</ul>
		<?php endif; if(isset($rs['status'])): ?>	
		<ul>
			<ol>状态</ol>
			<li><?php if($rs['status']==0): ?> <i style="color:blue;">未审核</i> <?php elseif(($rs['status']==2)): ?> 精华 <?php else: ?> 已审核 <?php endif; ?><div></div></li>		
		</ul>
		<?php endif; ?>
	

	<div class="actions">
	<?php $_result=fun('field@get_rbtn',$tab_ext['right_button'],$rs,true);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
      <?php echo $vs['value']; endforeach; endif; else: echo "" ;endif; if(empty($f_array)): ?>
		<a href="<?php echo auto_url('delete','ids='.$rs[id]); ?>" class="fa fa-trash">删除</a>
		<a href="<?php echo iurl('show','id='.$rs[id]); ?>" target="_blank" class="fa fa-eye">浏览</a>
		<a href="<?php echo auto_url('edit','id='.$rs[id]); ?>" class="fa fa-edit">修改</a>
	<?php endif; ?>
	</div>
</div>
<?php endforeach; endif; else: echo "" ;endif; ?>

	<?php echo $pages; ?>
<script>
	$(function(){
		$('.actions').hide();
	});
</script>
	<div class="sideBox" style="display: none;">
			<ul>
				<ol>推广方式有以下两种</ol>
				<li> </li>		
			</ul>
			<ul>
				<ol>网址</ol>
				<li><?php echo get_url('home'); ?>?p_uid=<?php echo $userdb['uid']; ?></li>		
			</ul>
			<ul>
				<ol>二维码</ol>
				<li></li>		
			</ul>
			<div class="showimg"><center><img width="250" src="<?php echo get_qrcode('/?p_uid='.$userdb['uid']); ?>"></center></div>
	</div> 


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