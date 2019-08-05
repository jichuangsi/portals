<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:78:"D:\web\Education\portals\template/admin_style/default/admin/common\wn_form.htm";i:1529418453;s:75:"D:\web\Education\portals\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;s:75:"D:\web\Education\portals\template\admin_style\default\admin\common\form.htm";i:1542177211;}*/ ?>
<!doctype html>
<html lang="zh_CN">
<head>
<meta charset="uft-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8"><!-- 强制ie8,for 360 -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<title>后台管理</title>
<link rel="stylesheet" href="/public/static/admin/default/style.css" type="text/css">
<link rel="stylesheet" href="/public/static/admin/default/base/base.css" type="text/css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css" type="text/css">
<link rel="stylesheet" href="/public/static/icon/icon.css" type="text/css">
<link rel="stylesheet" href="/public/static/layui/css/layui.css" media="all">
<link rel="stylesheet" href="/public/static/layui/css/admin.css" media="all">
<SCRIPT LANGUAGE="JavaScript" src="/public/static/js/core/jquery.min.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="/public/static/layer/layer.js"></SCRIPT>

</head>
<body>

<div class='ListLinkCont'><ul class="qb_ui_page_menu">

	<?php if(is_array($tab_ext['nav'][0]) || $tab_ext['nav'][0] instanceof \think\Collection || $tab_ext['nav'][0] instanceof \think\Paginator): $i = 0; $__LIST__ = $tab_ext['nav'][0];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?><li><a href="<?php echo $rs['url']; ?>" class="<?php if($tab_ext[nav][1] == $key): ?>blue<?php endif; ?>"><?php echo $rs['title']; ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>

</ul></div>



	<style type="text/css">
.layui-input-inline .layui-input{
	width:500px;
}
</style>
<div class="MainContainers">
<form name="" method="post" action="<?php echo preg_replace('/(http|https):\/\/([^\/]+)\/(.*)/i','/\\3',get_url('location'));/*解决有的服务器无法识别https*/ ?>" class="ajax_post <?php if(!(empty($tab_ext['trigger']) || (($tab_ext['trigger'] instanceof \think\Collection || $tab_ext['trigger'] instanceof \think\Paginator ) && $tab_ext['trigger']->isEmpty()))): ?> form-trigger <?php else: ?>  layui-form  <?php endif; ?>">
  <div class="Header"><span class="tag"><?php if(($tab_ext['page_title'])): ?> <?php echo $tab_ext['page_title']; elseif((empty($info))): ?>添加<?php else: ?>修改<?php endif; ?></span> </div>
  <div class="Conter">	
	<!-- 功能接口钩子 -->
	<?php echo hook_listen('template_form_head',$f_array,$info,true); if(empty($tab_ext['group']) || (($tab_ext['group'] instanceof \think\Collection || $tab_ext['group'] instanceof \think\Paginator ) && $tab_ext['group']->isEmpty())): ?>

	<!-- 这种是最常用的,表单没做分组显示的,如果你复制一个新模板的话,只要这一段就可以了 -->
	<table class="FormTable">
		<?php if($tab_ext['area']): ?>
		<!-- 这一段是地区选择 -->
		<tr id="form_group_area"> 
		  <td class='tdL'>地区选择: </td>
		  <td class="tdR layui-input-inline"> 
			<div class="ListArea">
				<select name='province_id' data-title="请选择省份" lay-ignore></select> 
				<select name='city_id' data-title="请选择城市" lay-ignore></select> 
				<select name='zone_id' data-title="请选择区域" lay-ignore></select> 
				<select name='street_id' data-title="请选择街道" lay-ignore></select>
			</div>
		  </td>
		</tr>
		<?php endif; ?>
		<!-- 参数 field="pic,tit" 代表过滤哪些字段不显示出来 里边支持TP标签 -->
		<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--d41d8cd98f00b204e9800998ecf8427e	--> <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if($rs["ifhide"]): ?> <?php echo $rs['value']; else: ?>
		<tr id="form_group_<?php echo $rs['name']; ?>"> 
		  <td class='tdL'><?php echo $rs['title']; ?>: </td>
		  <td class="tdR <?php if(in_array($rs['type'],['text','password','number','select'])): ?>layui-input-inline<?php else: ?>layui-input-block<?php endif; ?>"> 
			<div><?php echo $rs['value']; ?></div>
			<?php if(!(empty($rs['about']) || (($rs['about'] instanceof \think\Collection || $rs['about'] instanceof \think\Paginator ) && $rs['about']->isEmpty()))): ?><div class="layui-form-mid layui-word-aux"><?php echo $rs['about']; ?></div><?php endif; ?>
		  </td>
		</tr>
		  <?php endif; endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; fun('label@run_form_label','d41d8cd98f00b204e9800998ecf8427e',['f_array'=>$f_array,'mid'=>$mid,'info'=>$info,'field'=>'','mod'=>'','dirname'=>__FILE__,]); ?>
    </table>

<?php else: ?>
	
	<!-- 这是另一种用得很少,如果你复制一个新模板的话,这一段可以全删除,针对太多表单,而对他们做分组显示,下面就没做过滤哪些字段不显示的处理了,要自己重新修改做判断处理 -->
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
			<table class="FormTable">
				<?php if($tab_ext['area']&&$i==1): ?>
				<!-- 这一段是地区选择 -->
				<tr id="form_group_area"> 
				  <td class='tdL'>地区选择: </td>
				  <td class="tdR layui-input-inline"> 
					<div class="ListArea">
						<select name='province_id' data-title="请选择省份" lay-ignore></select> 
						<select name='city_id' data-title="请选择城市" lay-ignore></select> 
						<select name='zone_id' data-title="请选择区域" lay-ignore></select> 
						<select name='street_id' data-title="请选择街道" lay-ignore></select>
					</div>
				  </td>
				</tr>
				<?php endif; ?>
				<!-- 每一组的所有表单 -->
				<?php $_result=fun('field@fields_to_form',fun('field@field_to_table',$array),$info);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<tr id="form_group_<?php echo $rs['name']; ?>"> 
					  <td class='tdL'><?php echo $rs['title']; ?>: </td>
					  <td class="tdR <?php if(in_array($rs['type'],['text','password','number','select'])): ?>layui-input-inline<?php else: ?>layui-input-block<?php endif; ?>"> 
						<div><?php echo $rs['value']; ?></div>
						<?php if(!(empty($rs['about']) || (($rs['about'] instanceof \think\Collection || $rs['about'] instanceof \think\Paginator ) && $rs['about']->isEmpty()))): ?><div class="layui-form-mid layui-word-aux"><?php echo $rs['about']; ?></div><?php endif; ?>
					  </td>
					</tr>
				<?php endforeach; endif; else: echo "" ;endif; ?>
			</table>
		</div>
	   <?php endforeach; endif; else: echo "" ;endif; ?>
	  </div>
	</div>

<?php endif; ?>
	
	<!-- 功能接口钩子 -->
	<?php echo hook_listen('template_form_foot',$f_array,$info,true); ?> 
    <div class='submits'>
		<?php if(!(empty(input('id')) || ((input('id') instanceof \think\Collection || input('id') instanceof \think\Paginator ) && input('id')->isEmpty()))): ?><input type="hidden" name="id" value="<?php echo input('id'); ?>"><?php endif; if($tab_ext['hidebtn']!='back'): ?><input type="button" onclick="window.history.back()" style="color:#555;margin-right:30px;" onmouseout="$(this).css({'background':'#eee'})" onmouseover="$(this).css({'background':'orange'})" value="取消返回"><?php endif; ?>
		<?php echo $tab_ext['addbtn']; ?>
        <input type="submit" name="Submit" value="确认提交">    
    </div>

</div>

</form>
</div>

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


<style>
.footer{background:#fff;padding:20px 0;}.footer ul{overflow:hidden;}.footer ul li{float:left; width:33.3%; height:30px; line-height:30px; }.footer ul li a{position:relative; display:block; width:160px; text-align:center; margin:0 auto; text-decoration:underline;}.footer ul li a:hover{color:#f40;}.footer ul li a:before{content:'';display:block; position:absolute; background:url() no-repeat; width:30px; height:25px; }.footer ul li:first-child a:before{background-position:1px -273px;}.footer ul li:nth-child(2) a:before{background-position:1px -298px;}.footer ul li:last-child a:before{background-position:1px -319px;}.footer ul li a{font-size:16px; color:#666;}
</style>
<!--<div class="footer">
 <ul>
   <li><a href="http://x1.php168.com/">官方动态</a></li>
   <li><a href="http://bbs.qibosoft.com">官方论坛</a></li>
   <li><a href="http://www.qibosoft.com">官方网站</a></li>
 </ul>
</div>-->
<script type="text/javascript" src="/public/static/js/qibo.js"></script>
<script src="/public/static/layui/layui.js"></script>  
<script type="text/javascript">
layui.use(['form','element'], function(){
  var form = layui.form;
  var element = layui.element;
});

if (navigator.userAgent.indexOf("MSIE") >= 0) {
	alert("请使用谷歌或火狐访问后台.其它浏览器兼容性比较差,有些功能会无法操作与使用");
}

$(".ListLinkCont a").each(function(){
	if(location.href.indexOf($(this).attr('href'))>0){
		$(this).addClass('blue');
	}
});

</script>
</body>
</html>

 