<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:69:"D:\web\Education\template/member_style/default/shop\address\index.htm";i:1554720740;s:73:"D:\web\Education\template/member_style/21syx_member/member/wap_layout.htm";i:1548153004;s:69:"D:\web\Education\template\member_style\default\member\common\menu.htm";i:1549867535;s:72:"D:\web\Education\template\member_style\default\member\common\table02.htm";i:1534850820;s:64:"D:\web\Education\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
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
	<div class="qb_member_Cnt">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	<ul class="qb_member_ListType1">
		<ol>
		<?php if(!(empty($rs['title']) || (($rs['title'] instanceof \think\Collection || $rs['title'] instanceof \think\Paginator ) && $rs['title']->isEmpty()))): ?><!--标题单独显示-->
			<a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a> 
		<?php endif; $_result=fun('field@fields_to_table',$f_array,$rs);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?> <!--自定义字段-->
			<?php if((!in_array($vs['name'],['title','picurl','create_time','status']))): ?><!--把标题\图片\时间过滤掉-->
				<span style="margin-left:5px;"><?php echo $vs['value']; ?></span>
			<?php endif; endforeach; endif; else: echo "" ;endif; if(isset($rs['status'])): ?>	 <!--状态单独显示-->
				<?php if($rs['status']==0): ?> 
					<i style='color:blue;'>未审核</i> 
				<?php elseif(($rs['status']==2)): ?> 
					<span style='color:orange;'>已推荐</span> 
				<?php else: ?> 
					<span style='color:red;'>已审核</span> 
				<?php endif; endif; ?>
		</ol>

		<li>		
			<?php if(!(empty($rs['create_time']) || (($rs['create_time'] instanceof \think\Collection || $rs['create_time'] instanceof \think\Paginator ) && $rs['create_time']->isEmpty()))): ?><!--时间单独显示-->
				<span class="FL glyphicon glyphicon-time gray"><?php echo format_time($rs['create_time'],"Y-m-d H:i"); ?></span>
			<?php endif; ?>
			<span class="FR buttera">
				<?php $_result=fun('field@get_rbtn',$tab_ext['right_button'],$rs,true);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
				  <?php echo $vs['value']; endforeach; endif; else: echo "" ;endif; if(empty($f_array)): ?>
					<a href="<?php echo urls('delete',['ids'=>$rs['id']]); ?>">删除</a> 
					<a href="<?php echo urls('edit',['id'=>$rs['id']]); ?>">修改</a> 
				<?php endif; ?>
			</span>
		</li>
	</ul>
<?php endforeach; endif; else: echo "" ;endif; ?>
	<?php echo $pages; ?>
</div>	 


	<?php echo $pages; ?>
	<script>
		$(function(){
			$('.goback a').remove();
			$('.goback').append('<a href="/index.php/giftshop/"  class="fa fa-reply"> 返回</a>');
			$('.web').append("我的地址");
		});
	</script>
	<style>
		.qb_header{
			background: -webkit-linear-gradient(#07EBC8, #357BF5);
		    background: -o-linear-gradient(#07EBC8, #357BF5);
		    background: -moz-linear-gradient(#07EBC8, #357BF5);
		    background: linear-gradient(#07EBC8, #357BF5);
		}
		.web{
			font-size: 20px !important;
		}
	</style>


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