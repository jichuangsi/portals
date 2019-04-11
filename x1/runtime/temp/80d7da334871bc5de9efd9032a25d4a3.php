<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:65:"D:\web\x1\template/admin_style/default/giftshop\content\index.htm";i:1547462930;s:60:"D:\web\x1\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;s:61:"D:\web\x1\template\admin_style\default\admin\common\table.htm";i:1546567773;}*/ ?>
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



	<form name="form1" method="post" action="">
<div class="MainContainers">
  <div class="Header"><span class="tag"><?php if(($tab_ext['page_title'])): ?> <?php echo $tab_ext['page_title']; else: ?> 内容管理 <?php endif; ?></span></div>

  <div class="Conter">
	
	<!-- 顶部功能按钮 -->	
	<div style="margin-bottom:10px;float:left;">
		<?php if(is_array($tab_ext['top_button']) || $tab_ext['top_button'] instanceof \think\Collection || $tab_ext['top_button'] instanceof \think\Paginator): $i = 0; $__LIST__ = $tab_ext['top_button'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if($rs['type']=='add'): ?>
			<a href="<?php echo (isset($rs['href']) && ($rs['href'] !== '')?$rs['href']:auto_url('add')); ?>" class="layui-btn layui-btn-primary <?php echo $rs['class']; ?>"><li class="<?php echo (isset($rs['icon']) && ($rs['icon'] !== '')?$rs['icon']:'fa fa-plus'); ?>"></li> <?php echo (isset($rs['title']) && ($rs['title'] !== '')?$rs['title']:'新增'); ?></a>
		 <?php elseif(($rs['type']=='delete')): ?>
			<a href="<?php echo auto_url('delete'); ?>" onclick="return delete_all($(this));" class="layui-btn layui-btn-primary <?php echo $rs['class']; ?>"><li class="<?php echo (isset($rs['icon']) && ($rs['icon'] !== '')?$rs['icon']:'fa fa-fw fa-remove'); ?>"></li> <?php echo (isset($rs['title']) && ($rs['title'] !== '')?$rs['title']:'批量删除'); ?></a>
		 
		 <?php else: ?>
			<a href="<?php echo $rs['href']; ?>" class="layui-btn layui-btn-primary <?php echo $rs['class']; ?>" target="<?php echo $rs['target']; ?>" data-ids="<?php echo $rs['target-form']; ?>"><li class="<?php echo (isset($rs['icon']) && ($rs['icon'] !== '')?$rs['icon']:'fa fa-external-link-square'); ?>"></li> <?php echo $rs['title']; ?></a>
		 <?php endif; endforeach; endif; else: echo "" ;endif; ?>
	</div>
	
	
	<!-- 字段搜索功能 -->
	<div style="margin-bottom:10px;float:right;">
		<select name="search_field">
		<option value="" selected>选择字段</option> 
		<?php if(!(empty($tab_ext['id']) || (($tab_ext['id'] instanceof \think\Collection || $tab_ext['id'] instanceof \think\Paginator ) && $tab_ext['id']->isEmpty()))): ?><option value="<?php echo $tab_ext['id']; ?>"><?php echo $tab_ext['id']; ?></option><?php else: ?><option value="id">ID</option><?php endif; if(is_array($tab_ext['search']) || $tab_ext['search'] instanceof \think\Collection || $tab_ext['search'] instanceof \think\Paginator): $i = 0; $__LIST__ = $tab_ext['search'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$name): $mod = ($i % 2 );++$i;?>
			<option value="<?php echo $key; ?>"><?php echo $name; ?></option> 
		<?php endforeach; endif; else: echo "" ;endif; ?>
		</select>
		<input type="text" placeholder='请输入关键字' name="search_word" style="line-height:23px;width:150px;"> <input onclick="search_content()" type="button" name="" value="搜索" class="layui-btn layui-btn-sm">
	</div>
<script type="text/javascript">
function search_content(){
	var field = $("select[name='search_field']").val();
	var keyword = $("input[name='search_word']").val();
	if(field==''){
		layer.alert('请选择搜索字段类型');
		return ;
	}else if(keyword==''){
		layer.alert('关键字不能为空');
		return ;
	}
	var url = location.href.indexOf('?')>0 ? location.href.substr(0,location.href.indexOf('?')) : location.href;
	url +='?search_field=' + field + '&keyword=' +keyword;
	window.location.href = url;
}
</script>

    <table class="ListTable">
	<tr>
	<th width="6%">
	   <input type="checkbox" name="" onclick="choosebox($(this))">			
			<?php $_id=$tab_ext['id']?:'id'; ?>
			<?php echo strtoupper($_id); if(input('_order')==$_id&&input('_by')=='desc'): ?>
				<a href="<?php echo fun('Field@make_admin_filter_url',$_id,'asc',input('search_field'),input('keyword')); ?>"><i style="color:red;" class="glyphicon glyphicon-triangle-bottom"></i></a>
			<?php elseif(input('_order')==$_id&&input('_by')=='asc'): ?>
				<a href="<?php echo fun('Field@make_admin_filter_url',$_id,'desc',input('search_field'),input('keyword')); ?>"><i style="color:red;" class="glyphicon glyphicon-triangle-top"></i></a>
			<?php else: ?>
				<a href="<?php echo fun('Field@make_admin_filter_url',$_id,'asc',input('search_field'),input('keyword')); ?>"><i class="fa fa-unsorted"></i></a>
			<?php endif; ?>			
	</th>
	<!-- 自定义字段头部标题 -->
	<?php $_result=fun('field@fields_to_table',$f_array,[]);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
    <th>
		<!--排序-->
		<?php if(in_array($vs['name'],explode(',',$tab_ext['order']))): if(input('_order')==$vs['name']&&input('_by')=='desc'): ?>
				<a href="<?php echo fun('Field@make_admin_filter_url',$vs['name'],'asc',input('search_field'),input('keyword')); ?>"><i style="color:red;" class="glyphicon glyphicon-triangle-bottom"></i></a>
			<?php elseif(input('_order')==$vs['name']&&input('_by')=='asc'): ?>
				<a href="<?php echo fun('Field@make_admin_filter_url',$vs['name'],'desc',input('search_field'),input('keyword')); ?>"><i style="color:red;" class="glyphicon glyphicon-triangle-top"></i></a>
			<?php else: ?>
				<a href="<?php echo fun('Field@make_admin_filter_url',$vs['name'],'desc',input('search_field'),input('keyword')); ?>"><i class="fa fa-unsorted"></i></a>
			<?php endif; endif; ?>
		<!--筛选项-->
		<?php if($tab_ext['filter_search'][$vs['name']]): ?>
			<i <?php if(input('search_field')==$vs['name']): ?>style="color:red;"<?php endif; ?> class="fa fa-filter" onclick="layer.tips('<a href=\'<?php echo fun('Field@make_admin_filter_url',input('_order'),input('_by')); ?>\' style=\'color:#fff;\'>不限</a><br><?php if(is_array($tab_ext['filter_search'][$vs['name']]) || $tab_ext['filter_search'][$vs['name']] instanceof \think\Collection || $tab_ext['filter_search'][$vs['name']] instanceof \think\Paginator): $i = 0; $__LIST__ = $tab_ext['filter_search'][$vs['name']];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$name): $mod = ($i % 2 );++$i;?><a style=\'<?php if((input('keyword')!=''&&input('keyword')==$key)): ?>color:red;<?php else: ?>color:#fff;<?php endif; ?>\' href=\'<?php echo fun('Field@make_admin_filter_url',input('_order'),input('_by'),$vs['name'],$key); ?>\'><?php echo $name; ?></a><br><?php endforeach; endif; else: echo "" ;endif; ?>', $(this), {tips: [3, '#0FA6D8'],tipsMore: false,time:5000 });"></i>
		<?php endif; ?>
	  <?php echo $vs['title']; ?> 
	</th>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	
	<!-- 更多菜单头部标题 -->
	<?php $_result=fun('field@get_rbtn',$tab_ext['right_button'],[]);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
      <th><?php echo $vs['title']; ?></th>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	
	<!-- 没有特别指定按钮时,就显示默认的修改与删除 -->
	<?php if(!isset($tab_ext['right_button'])): ?>
      <th width="8%">删除</th>
      <th width="8%">修改</th> 
	<?php endif; ?>

    </tr>


<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;$tab_ext['id'] && $rs['id']=$rs[$tab_ext['id']]; ?>
    <tr bgcolor="#FFFFFF" class="trA" onmouseover="this.className='trB'" onmouseout="this.className='trA'"> 
      <td><input type="checkbox" name="ids[]" value="<?php echo $rs['id']; ?>"> <?php echo $rs['id']; ?></td>
	 <!-- 自定义字段数据列表 -->
	<?php $_result=fun('field@fields_to_table',$f_array,$rs);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
      <td class="<?php if($i == '1'): ?>Left<?php endif; ?>"><?php echo $vs['value']; ?></td>
	<?php endforeach; endif; else: echo "" ;endif; ?>
    
	<!-- 更多菜单数据列 -->
	<?php $_result=fun('field@get_rbtn',$tab_ext['right_button'],$rs);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
      <td><?php echo $vs['value']; ?></td>
	<?php endforeach; endif; else: echo "" ;endif; ?>
	
	<!-- 没有特别指定按钮时,就显示默认的修改与删除 -->
	<?php if(!isset($tab_ext['right_button'])): ?>
      <td><a href="<?php echo auto_url('delete','ids='.$rs['id']); ?>" class="_dels" onclick="return confirm('你确实要删除吗?不可恢复,请慎重!')" title="删除"><i class="fa fa-fw fa-remove"></i></a></td>
	  <td><a href="<?php echo auto_url('edit','id='.$rs['id']); ?>" title="修改"><i class="fa fa-fw fa-edit"></i></td>
	<?php endif; ?>

    </tr>
<?php endforeach; endif; else: echo "" ;endif; ?>
  
  </table>

    <!-- <div class='submits'><input type="submit" name="Submit" value="更改排序"></div> -->
	<div class="Showpage"><?php echo $pages; ?></div>
  </div>
</div>
</form>

<script type="text/javascript">
var quickedit_url = "<?php echo auto_url('quickedit'); ?>"; //快速编辑的地址

//全选
function choosebox(that){
	$("input[name='ids[]']").each(function(){
		$(this).prop("checked",that.is(':checked')?true:false);
	});
}

//批量删除
function delete_all(that){
	var ids = [];
	$("input[name='ids[]']").each(function(){
		if( $(this).is(':checked')==true){
			ids.push($(this).val());
		}
	});
	if(ids.length==0){
		layer.alert('你必须选择一项!');
		return false;
	}
	layer.confirm('你要删除吗,不可恢复?',function(){
		var url = that.attr('href');
		$.post(url,{'ids':ids},function(res){
			if(res.code==1){
				layer.closeAll();
				layer.msg('删除成功');
				setTimeout(function(){
					window.location.reload();
				},500);
			}else{
				layer.alert('删除失败,详情如下:'+res.msg);
			}
		}).fail(function (res) {
			layer.alert('系统故障,删除失败!!');
		});

	});
	return false;
}

//快速编辑
function quick_edit(that){
	if(that.val()==that.data('value')){
		//layer.msg('你并没有修改');
		return ;
	}
	layer.load(1);
	$.post(quickedit_url,{
		'pk':that.data('id'),
		'name':that.data('name'),
		'value':that.val(),
	},function(res){
		layer.closeAll();
		if(res.code==1){			
			layer.msg('修改成功');
			setTimeout(function(){
				//window.location.reload();
			},500);
		}else{
			layer.alert('修改失败:'+res.msg);
		}
	}).fail(function (res) {
		layer.closeAll();
		layer.alert('系统故障,删除失败!!');
	});
}


function choose_ids(name){
	var ids = [];
	$("input[name='ids[]']").each(function(){
		if( $(this).is(':checked')==true){
			ids.push($(this).val());
		}
	});
	if(ids.length==0){
		layer.alert('你必须要选择一项!');
		return false;
	}
	str = '';
	ids.forEach(function(v){
		str += name + '[]=' + v + '&';
	});
	return str;
}

//快速更换状态
function change_status(){
	$("._switch").click(function(){
		var that = $(this);
		var value = that.data('value');	
		if(value==1){
			value=0;
		}else{			
			value=1;
		}
		that.data('value',value);
		layer.load(1);
		$.post(quickedit_url,{
			'pk':that.data('id'),
			'name':that.data('name'),
			'value':value,
		},function(res){
			layer.closeAll();
			if(res.code==1){				
				layer.msg('修改成功');
				if(value==0){
					that.css("color","#666666");
					that.removeClass('fa-check-circle');
					that.addClass('fa-ban');
				}else{
					that.css("color","green");
					that.removeClass('fa-ban');
					that.addClass('fa-check-circle');
				}
			}else{
				layer.alert('修改失败:'+res.msg);
			}
		}).fail(function (res) {
			layer.closeAll();
			layer.alert('系统故障,删除失败!!');
		});
	});
}


jQuery(document).ready(function() {
	$(".quick_edit").blur(function(){
		quick_edit($(this))
	});
	$('select.select_edit').change(function(){
		quick_edit($(this));
	});
	
	//其它批量操作
	$("a[data-ids]").click(function(){
		var ids = $(this).data('ids');
		if(ids!=''){
			var str = choose_ids( ids );
			if(str!==false){
				window.location.href = $(this).attr('href') + '?' + str;
			}
			return false;
		}
		
	});
	
	change_status();
});

</script>


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

 