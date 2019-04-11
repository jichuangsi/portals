<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:71:"D:\web\Education\template/admin_style/default/admin\mysql\showtable.htm";i:1545615547;s:67:"D:\web\Education\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;}*/ ?>
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

</ul></div>




 
<style>
body,h1,h2,h3,h4,h5,h6,hr,p,blockquote,dl,dt,dd,ul,ol,li,pre,form,fieldset,legend,button,input,textarea,th,td{margin:0;padding:0;}
body,button,input,select,textarea{color:#333;font-size:14px;}
h1,h2,h3,h4,h5,h6{font-size:100%;}
address,cite,dfn,em,var{font-style:normal;}
code,kbd,pre,samp{font-family:courier new,courier,monospace;}
small{font-size:12px;}
ul,ol{list-style:none;}
a{text-decoration:none;color:#2d374b;}
a:hover {color:#d00;}
table{border-collapse:collapse;border-spacing:0;}
.ListTable{border-top:#DDD solid 1px;border-left:#DDD solid 1px;}
.ListTable th,.ListTable td{border-bottom:#DDD solid 1px;border-right:#DDD solid 1px;padding:3px;color:666;vertical-align:middle;}
.ListTable th{background:#EFEFEF;color:red;}
.Nodata{line-height:30px;padding-left:20px;color:#F00;}
.ShowPage{text-align:center;line-height:30px;}
.ASC,.DESC{display:block; position:relative; padding-right:15px;}
.ASC:after,.DESC:after{content:''; display:block;width:0;height:0; position:absolute; right:0; top:5px;border:6px solid transparent;}
.DESC:after{border-top: 8px solid #999;border-bottom:0;}
.ASC:after{border-bottom: 8px solid #999;border-top:0;}
.SearchBox{padding:10px;}
.SearchBox input[type=text]{width:100px; margin-right:10px;border:#DDD solid 1px; line-height:25px; text-indent:5px;}
.SearchBox select{border:#DDD solid 1px; height:25px;}
.SearchBox input[type=radio]{margin-left:10px;border:0;}
.SearchBox input[type=submit]{ line-height:25px; border:#DDD solid 1px; padding:0 10px; background:#FFF; cursor:pointer; margin-left:10px;margin-right:10px;}
/*****PC分页样式开始*****/
.pagination{
	text-align: center;
	width: 100%;
	clear: both;
	padding: 10px 0;
}
.pagination li{
	display: inline-block;
	line-height: 30px;	
	margin: 0 5px;	
}
.pagination li a,.pagination li span{
	display: block;
	border: #DDD solid 1px;
	padding: 0 8px;
	color: #666;
}
.pagination li a,.pagination li span{
	color: #999;
}
.pagination li a:hover{
	border:#F30 solid 1px;
	background: #F60;
	color: #FFF;
}
.pagination li.active span{
	border:#21806E solid 1px;
	background: #64C2B0;
	color: #FFF;
}
.MainContainers {
    border: #CCC solid 0px!important;
}
/*****PC分页样式结束*****/
</style>
 

<div class="MainContainers">
<div style="padding:10px;"><button onclick="history.go(-1)" class="layui-btn layui-btn-normal">返回</button> <?php echo $table; ?></div>
<table class="ListTable">
 <tr>
<?php if(is_array($titledb) || $titledb instanceof \think\Collection || $titledb instanceof \think\Paginator): $i = 0; $__LIST__ = $titledb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$value): $mod = ($i % 2 );++$i;?>
 	<th><a href="<?php echo url('showtable',['table'=>$table,'ordertype'=>$value,'orderby'=>($orderby=='desc'?'asc':'desc')]); ?>" <?php if($ordertype == $value): ?>style="color:red;"<?php endif; ?>><?php echo $value; ?></a></th>

<?php endforeach; endif; else: echo "" ;endif; ?>
 </tr>
 
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
  <tr>
	<?php if(is_array($titledb) || $titledb instanceof \think\Collection || $titledb instanceof \think\Paginator): $i = 0; $__LIST__ = $titledb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$value): $mod = ($i % 2 );++$i;?>
    <td><?php echo $rs[$value]; ?></td>
	<?php endforeach; endif; else: echo "" ;endif; ?>
  </tr>
<?php endforeach; endif; else: echo "" ;endif; ?>

</table>

<?php if(empty($listdb) || (($listdb instanceof \think\Collection || $listdb instanceof \think\Paginator ) && $listdb->isEmpty())): ?>
<div class="Nodata">当前数据表没有相应内容,记录为空!!</div>
<?php endif; ?>
<div class="SearchBox">
<form name="form_order" method="get" action="">
	关键词 <input name="keyword" type="text" value="<?php echo $keyword; ?>"/>
	字段
	<select name="field"> 
<?php if(is_array($titledb) || $titledb instanceof \think\Collection || $titledb instanceof \think\Paginator): $i = 0; $__LIST__ = $titledb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$value): $mod = ($i % 2 );++$i;?>
	  <option value="<?php echo $value; ?>" <?php if($field == $value): ?>selected<?php endif; ?>><?php echo $value; ?></option>
<?php endforeach; endif; else: echo "" ;endif; ?>
	</select>
	<input name="types" type="radio" value="0" <?php if(empty($types) || (($types instanceof \think\Collection || $types instanceof \think\Paginator ) && $types->isEmpty())): ?>checked<?php endif; ?> /> 模糊
	<input name="types" type="radio" value="1" <?php if($types == '1'): ?>checked<?php endif; ?> /> 精确
	<input name="" type="submit" value="搜索">
	<a href="<?php echo url('showtable',['table'=>$table]); ?>">查看全部</a>
</form>
</div>
<div class="ShowPage"><?php echo $showpage; ?></div>
<div style="text-align:center;"><button onclick="history.go(-1)" class="layui-btn layui-btn-normal">返回</button></div>
<div><br>数据表结构<br>
<textarea style="width:90%;height:250px;"><?php echo $create_table; ?></textarea>
</div>

</div>

 



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

 