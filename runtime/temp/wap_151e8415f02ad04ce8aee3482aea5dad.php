<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:75:"D:\web\Education\portals\template/member_style/default/member\user\edit.htm";i:1549854605;s:81:"D:\web\Education\portals\template/member_style/21syx_member/member/wap_layout.htm";i:1548153004;s:77:"D:\web\Education\portals\template\member_style\default\member\common\form.htm";i:1552270875;s:72:"D:\web\Education\portals\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<title>会员中心</title>

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





	<style type="text/css">
.layui-form .WapFormContainer dl{
	background:#fff;
	margin:8px 0 8px 0;
}
.layui-form .WapFormContainer dl dt{
	padding:3px 10px 0px 10px;
}
.WapFormContainer dl dd{
	padding:2px 10px 10px 10px;
	background:#fefefe;
}
.layui-form .WapFormContainer dl dd input{
	border:1px solid #eee;
}
.layui-form .WapFormContainer .layui-tab{
	background:#fff;
} 
</style>

<form name="" method="post" action="<?php echo request()->url(true); ?>" class="ajax_post <?php if(!(empty($tab_ext['trigger']) || (($tab_ext['trigger'] instanceof \think\Collection || $tab_ext['trigger'] instanceof \think\Paginator ) && $tab_ext['trigger']->isEmpty()))): ?> form-trigger <?php else: ?>  layui-form  <?php endif; ?>">
<div class="WapFormContainer">	
	<div class="tag"><?php if(($tab_ext['page_title'])): ?> <?php echo $tab_ext['page_title']; elseif((empty($info))): ?>添加<?php else: ?>修改<?php endif; ?></div>
	<!-- 功能接口钩子 -->
	<?php echo hook_listen('template_form_head',$form_items,$form_items,true); if(empty($tab_ext['group']) || (($tab_ext['group'] instanceof \think\Collection || $tab_ext['group'] instanceof \think\Paginator ) && $tab_ext['group']->isEmpty())): ?>
	<!--这种是最常用的,表单没做分组显示的-->
	<?php if($tab_ext['area']): ?>
		<!-- 这一段是地区选择 -->
	<dl id="form_group_area"> 
		<dt>地区选择</dt>
		<dd class="layui-input-inline"> 
			<div class="ListArea">
				<select name='province_id' data-title="请选择省份" lay-ignore></select> 
				<select name='city_id' data-title="请选择城市" lay-ignore></select> 
				<select name='zone_id' data-title="请选择区域" lay-ignore></select> 
				<select name='street_id' data-title="请选择街道" lay-ignore></select>
			</div>
		</dd>
	</dl>
	<?php endif; ?>
	
	<!-- 参数 field="pic,tit" 代表过滤哪些字段不显示出来 里边支持TP标签 -->
    <?php if(defined('LABEL_DEBUG')): ?><!--QB <!--d41d8cd98f00b204e9800998ecf8427e	--> <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if($rs["ifhide"]): ?> <?php echo $rs['value']; else: ?>
	<dl id="form_group_<?php echo $rs['name']; ?>">
		<dt><?php echo $rs['title']; ?></dt>
		<dd>
		<div><?php echo $rs['value']; ?></div>
		<?php if(!(empty($rs['about']) || (($rs['about'] instanceof \think\Collection || $rs['about'] instanceof \think\Paginator ) && $rs['about']->isEmpty()))): ?><div><?php echo $rs['about']; ?></div><?php endif; ?>
		</dd>
	</dl>
	  <?php endif; endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; fun('label@run_form_label','d41d8cd98f00b204e9800998ecf8427e',['f_array'=>$f_array,'mid'=>$mid,'info'=>$info,'field'=>'','mod'=>'','dirname'=>__FILE__,]); else: ?>
	<!-- 这是另一种用得很少,针对太多表单,而对他们做分组显示,下面就没做过滤哪些字段不显示的处理了,要自己重新修改做判断处理 -->
    <div class="layui-tab">
	  <ul class="layui-tab-title">
	  	 <!-- 分组标题名称 -->
		 <?php if(is_array($tab_ext['group']) || $tab_ext['group'] instanceof \think\Collection || $tab_ext['group'] instanceof \think\Paginator): $i = 0; $__LIST__ = $tab_ext['group'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li class="<?php if($i == '1'): ?>layui-this<?php endif; ?>"><?php echo $key; ?></li>
		 <?php endforeach; endif; else: echo "" ;endif; ?>
	  </ul>
	  <div class="layui-tab-content">
	   <!-- 分组表单输入选项 -->
	   <?php if(is_array($tab_ext['group']) || $tab_ext['group'] instanceof \think\Collection || $tab_ext['group'] instanceof \think\Paginator): $i = 0; $__LIST__ = $tab_ext['group'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$array): $mod = ($i % 2 );++$i;?>
				<div class="layui-tab-item <?php if($i == '1'): ?>layui-show<?php endif; ?>">
					<?php if($tab_ext['area']&&$i==1): ?>
					<!-- 这一段是地区选择 -->
					<dl id="form_group_area"> 
					  <dt>地区选择</dt>
					  <dd> 
						<div class="ListArea">
							<select name='province_id' data-title="请选择省份" lay-ignore></select> 
							<select name='city_id' data-title="请选择城市" lay-ignore></select> 
							<select name='zone_id' data-title="请选择区域" lay-ignore></select> 
							<select name='street_id' data-title="请选择街道" lay-ignore></select>
						</div>
					  </dd>
					</dl>
					<?php endif; ?>
					<!-- 每一组的所有表单 -->
					<?php $_result=fun('field@fields_to_form',fun('field@field_to_table',$array),$info);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
						<dl id="form_group_<?php echo $rs['name']; ?>">
							<dt><?php echo $rs['title']; ?></dt>
							<dd>
							<div><?php echo $rs['value']; ?></div>
							<?php if(!(empty($rs['about']) || (($rs['about'] instanceof \think\Collection || $rs['about'] instanceof \think\Paginator ) && $rs['about']->isEmpty()))): ?><div><?php echo $rs['about']; ?></div><?php endif; ?>
							</dd>
						</dl>
					<?php endforeach; endif; else: echo "" ;endif; ?>	
				</div>
	   <?php endforeach; endif; else: echo "" ;endif; ?>
	  </div>
	</div>

<?php endif; ?>

	<!-- 功能接口钩子 -->
	<?php echo hook_listen('template_form_foot',$form_items,$form_items,true); if(!(empty(input('id')) || ((input('id') instanceof \think\Collection || input('id') instanceof \think\Paginator ) && input('id')->isEmpty()))): ?><input type="hidden" name="id" value="<?php echo input('id'); ?>"><?php endif; if($tab_ext['addbtn']): ?>
		<style type="text/css">
		.ext_btn{margin:5px;}
		.ext_btn button{width:45%;color:#666;background:#ddd;padding:5px;margin-bottom:5px;border:0px;}
		.ext_btn button.post_btn{background:orange;float:right;color:#fff;}
		</style>
		<div class="ext_btn"><?php echo $tab_ext['addbtn']; ?> <button class="post_btn" type="submit">提交</button> </div>
<?php else: ?>
		<div class='butter'><button type="submit">提交</button></div>
<?php endif; ?>
	
</div>

</form>


<!-- 某些表单的某些选项触发事件,少用 -->
<?php if(!(empty($tab_ext['trigger']) || (($tab_ext['trigger'] instanceof \think\Collection || $tab_ext['trigger'] instanceof \think\Paginator ) && $tab_ext['trigger']->isEmpty()))): ?>
<script type="text/javascript">
var trigger_config = {
	<?php echo fun('field@setTrigger',$tab_ext['trigger']); ?>
}
</script>
<?php endif; ?>

<!-- 表单常用事件,比如无刷新提交 -->
<script LANGUAGE="JavaScript" src="/public/static/js/form/base.js"></script>

<SCRIPT LANGUAGE="JavaScript">
//地区选择事件
<?php $info=getArray($info); ?>
var default_ckid = ["<?php echo $info['province_id']; ?>","<?php echo $info['city_id']; ?>","<?php echo $info['zone_id']; ?>","<?php echo $info['street_id']; ?>"];
var get_area_url = "<?php echo purl('area/api/getlist',[],'index'); ?>";
</SCRIPT>
	<script>
		$(function(){
			$('.qb_header .member').remove();
			$('.qb_header').append(' <a style="line-height: 53px;float: right;margin-right: 10px;color: red;" href="<?php echo iurl('index/login/quit'); ?>" >退出登录</a>');
		});
	</script>


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