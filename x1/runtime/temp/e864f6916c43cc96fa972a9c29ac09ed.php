<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:59:"D:\web\x1\template/admin_style/default/cms\module\index.htm";i:1528503104;s:60:"D:\web\x1\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;s:67:"D:\web\x1\template\admin_style\default\admin\common\module\menu.htm";i:1528503103;s:68:"D:\web\x1\template\admin_style\default\admin\common\module\index.htm";i:1540606496;}*/ ?>
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

<li><a href="<?php echo auto_url('module/index'); ?>">所有模型</a></li>
<li><a href="<?php echo auto_url('module/add'); ?>">创建模型</a></li>

</ul></div>



	<div class="MainContainers">
  <div class="Header"><span class="tag">模型管理</span> </div>
  <div class="Conter">
 
<table class="ListTable">
  <tr> 
    <th width="7%">模型ID</th>
    <th >模型名称</th>
    <th width="18%">内容管理</th>
    <th width="15%">发布内容</th>
    <th width="11%">修改模型</th>
    <th width="10%">字段管理</th>
    <th width="9%">删除模型</th>

  </tr>
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
  <tr> 
    <td><?php echo $rs['id']; ?></td>
      <td>
          <?php echo $rs['title']; ?>
      </td>
      <td><a href="<?php echo auto_url('content/index',['mid'=>$rs['id']]); ?>" title="管理内容"><i class="fa fa-fw fa-file-o"></i></a></td>
    <td> <a href="<?php echo auto_url('content/add',['mid'=>$rs['id']]); ?>" title="添加内容"><i class="fa fa-fw fa-plus"></i></a></td>
    <td>
      <a href="<?php echo auto_url('edit',['id'=>$rs['id']]); ?>" title="修改模型"><i class="fa fa-fw fa-edit"></i></a>
    </td>
    <td>
	<a href="<?php echo auto_url('field/index',['mid'=>$rs['id']]); ?>" title="字段管理"><i class="fa fa-fw fa-th-list"></i></a>
		 
	</td>
	 <td><a href="<?php echo auto_url('delete',['ids'=>$rs['id']]); ?>" onclick="return confirm('你确实要删除<?php echo $rs['title']; ?>吗?不可恢复,请慎重!')" title="删除模型"><i class="fa fa-fw fa-remove"></i></a>   </td>
  </tr>
<?php endforeach; endif; else: echo "" ;endif; ?>
  </table> 
 <?php echo $pages; ?>
</div>
</div>
<div class="MainContainers">
  <div class="Header"><span class="tag">说明</span></div>
  <div class="Conter">
    <ul class="notes">
      <li>默认模型不可删除,否则会发生不可预料的后果,你自己创建的就可以删除</li>
    </ul>
  </div>
</div>
<br />


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

 