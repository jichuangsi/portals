<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"D:\web\Education\template/admin_style/default/admin\mysql\backup.htm";i:1524787447;s:67:"D:\web\Education\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;}*/ ?>
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




<div class="MainContainers">
  <div class="Header"><span class="tag">说明</span></div>
  <div class="Conter">
    <ul class="notes">
      <li class="">数据库备份完毕,以下文件占用服务器空间为:<b><font color='#FF0000'><?php echo $rsdb['totalsize']; ?> 
        兆(M)</font></b></li>
      <li>
        备份完毕,现在你可以右键点击另存下载。<br>
      不想下载也可以，因为已经自动备份到服务器里了,存放的目录是 <font color="#0000FF"><?php echo $bakdir; ?></font>。<br>
     
      </li>



 
<?php 
//for($j=1;$j<=$rsdb[sqlnum];$j++){
foreach($rsdb['sqlsize'] AS $key=>$size){
 ?>

<li>
  <?php echo $key; ?>、  &nbsp;&nbsp;<input type="checkbox" name="checkbox" value="checkbox"> <a href="<?php echo url('download','path='.$rand_dir.'&name='.$key); ?>" target="_blank"><?php echo $key; ?>.sql</a>&nbsp;&nbsp;   <?php echo $size; ?> (K)
</li>
 
<?php 
}
 ?>

<li>
  以上数据库文件总共占用空间:<b><font color='#FF0000'><?php echo $rsdb['totalsize']; ?>兆(M)</font></b>
</li>
 
    </ul>
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

 