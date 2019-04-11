<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:67:"D:\web\Education\template/admin_style/default/admin\mysql\index.htm";i:1545615547;s:67:"D:\web\Education\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;}*/ ?>
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



 
<form name="formlist" method="post" action="<?php echo urls('backup'); ?>">
<div class="MainContainers">
  <div class="Header"><span class="tag">备份数据库</span><span class="more">&gt;&gt;</span></div>
  <div class="Conter">


<table class="ListTable">
   <tr> 
      <th width='6%'>序号</th>
      <th> 表的名称(注释)</th>
      <th width='15%'> 记录数(条)</th>
      <th width='21%'> 占用空间</th>
      <th width='19%'> 请选择</th>
    </tr>
<?php 
if($breakbak){
 ?>
  <tr>
    <td colspan=5 height=30 style="background:#FF0000;">
      <div align=center><A HREF="<?php echo $breakbak; ?>"><b><font color="ffffff">上次备份被中断是否继续,点击继续</font></b></A></div>
    </td>
  </tr>
  
<?php 
}
foreach($listdb AS $key=>$rs){
 ?>
  <tr> 
    <td class='b red'> <?php echo $rs['j']; ?></td>
    <td class='Left'>
		<a href="<?php echo urls('showtable','table='.$rs['Name']); ?>" target="main"><?php echo $rs['Name']; ?></a> <font color="#999"><?php echo $rs['Annotation']; ?></font>
	</td>
    <td> 
		<div align='center'><?php echo $rs['Rows']; ?></div>
    </td>
    <td> <?php echo $rs['Data_length']; ?> K</td>
    <td> 
        <input type='checkbox' name='tabledb[]' value='<?php echo $rs['Name']; ?>' checked>
        <!--<a href="<?php echo urls('yh','table='.$rs['Name']); ?>">优化</a> 
        <a href="<?php echo urls('xf','table='.$rs['Name']); ?>">修复</a>-->
    </td>
  </tr>
<?php 
}
 ?>
<tr>
  <td colspan='5' class='Left'>
       (总共占用空间 <?php echo $totalsize; ?> <b><font color='#0000FF' size=5>M</font></b>) <br /><br />
            每卷大小 
        <input name="baksize" type="text" id="baksize" value="1024" size="5"> K <br /><br />
         是否同时优化数据表 
        <input type="radio" name="repair" value="2">
        是(占资源) 
        <input type="radio" name="repair" value="0" checked>
        否 
        <br /><br />
        备份速度,每次取几条数据
        <input type="text" name="rowsnum" size="5" value="200">
        数值越大.备份越快,但越占服务器资源,如果你的服务器做了限制备份失败,只能把这个数值改为更小,比如50<br /><br />
         </td>
  </td>
</tr>
    <tr bgcolor='#FFFFFF' align="center"> 
      <td colspan='5'>
        <div class='submits'>
          <input type='button' onclick=CheckAll(this.form) name='Submit' value='全选'>
          <input type='submit' name='Submit' value='立刻备份'>          
        </div>
        </td>
  </tr> 
  </table>

  </div>
</div>
</form>

<div class="MainContainers">
  <div class="Header"><span class="tag">帮助说明</span></div>
  <div class="Conter">
    <ul class="notes">
      <li>1、系统默认设置每次取200条数据,能满足一般的服务器,如果你使用的是虚拟主机.那有可能内存占用量被限制得太小的话,就会导致备份不成功.这个时候,就需要把200改为更小,比如100或者是50.就能解决备份不成功的问题。</li>
      <li> 2、一般来说.不管你使用的是高版本数据库,还是低版本数据库.都建议你备份为“4.0.x低版本数据库专用”较好.因为这样备份出来的数据库.不仅能适应低版本数据库,也能适应于高版本数据库。</li>
      <li>3、建议你养成经常备份数据库的习惯.防止网站或服务器出现故障,而方便还原数据。</li>
      <li>4、还原数据库之前,请确认所还原的数据库是完整备份出来的.如果不是完整备份出来的,就会导致弄丢数据.请务必注意。</li>
    </ul>
  </div>
</div>

<script language=JavaScript>
function CheckAll(form){
	for (var i=0;i<form.elements.length;i++){
		var e = form.elements[i];
		e.checked == true ? e.checked = false : e.checked = true;
	}
}
</script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function choose_type(type){
	if(type=='new'){
		get_obj('Charset_type').style.display='';
	}else{
		get_obj('Charset_type').style.display='none';
	}
}
//-->
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

 