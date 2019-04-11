<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:68:"D:\web\Education\template/admin_style/default/admin\module\index.htm";i:1547794402;s:67:"D:\web\Education\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;s:67:"D:\web\Education\template\admin_style\default\admin\module\menu.htm";i:1533519453;}*/ ?>
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

	<li><a href="<?php echo url('index'); ?>">已安装的频道</a></li>
<li><a href="<?php echo url('market'); ?>">云市场频道</a></li>
<li><a href="<?php echo url('add'); ?>">本地未安装的频道</a></li>

</ul></div>



<form name="form1" method="post" action="">

<div class="MainContainers">
  <div class="Header"><span class="tag">频道管理</span></div>
  <div class="Conter">
    <table class="ListTable">
	<th width="5%">ID</th>
      <th width="5%">图标</th>
      <th>频道名称</th>
      <th>频道关键字(目录名)</th>   
	  <th width="8%">启用/停用</th>
	  <!--<th width="10%">开发者</th>-->
	  <th width="10%">更新日期</th>
      <th width="10%">排序值</th>
      <th width="8%">卸载</th>
	  <th width="8%">复制</th>
      <th width="8%">设置</th>      
    </tr>
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
    <tr bgcolor="#FFFFFF" class="trA" onmouseover="this.className='trB'" onmouseout="this.className='trA'"> 
      <td><?php echo $rs['id']; ?></td>
      <td><?php if(!(empty($rs['icon']) || (($rs['icon'] instanceof \think\Collection || $rs['icon'] instanceof \think\Paginator ) && $rs['icon']->isEmpty()))): ?><li class="<?php echo $rs['icon']; ?>"></li><?php endif; ?></td>
      <td ><?php echo $rs['name']; ?></td>
      <td ><?php echo $rs['keywords']; ?></td>
	  <td><?php if($rs['ifopen'] == '1'): ?><li style="font-size:20px;color:green;" class='fa fa-fw fa-check-circle-o'></li><?php else: ?><li class='fa fa-fw fa-ban'></li><?php endif; ?> </td>
	  <!--<td><a href="<?php echo $rs['author_url']; ?>" target="_blank"><?php echo $rs['author']; ?></a></td>-->
      <td> 
        <?php echo substr($rs['version'],5,11); ?>
      </td>
      <td><input type="text" name="orderdb[<?php echo $rs['id']; ?>]" size="5" value="<?php echo $rs['list']; ?>"></td>
      <td><a href="<?php echo auto_url('delete',['ids'=>$rs['id']]); ?>" onclick="return confirm('你确实要卸载删除<?php echo $rs['name']; ?>吗?不可恢复,请慎重!')" title="卸载频道"><i class="fa fa-fw fa-remove"></i></a></td>
      <td><?php if($rs['type'] == '1'): ?><a href="<?php echo auto_url('copy',['id'=>$rs['id']]); ?>" title="复制频道"><i class="fa fa-copy"></i><?php endif; ?></td>
	  <td><a href="<?php echo auto_url('edit',['id'=>$rs['id']]); ?>" title="更改配置"><i class="fa fa-fw fa-edit"></i></td>
    </tr>
<?php endforeach; endif; else: echo "" ;endif; ?>
  
  </table>
  <div><?php echo $pages; ?></div>
    <div class='submits'><input type="submit" name="Submit" value="更改排序"></div>
  </div>
</div>
</form>
<div class="MainContainers">
  <div class="Header"><span class="tag">说明</span></div>
  <div class="Conter">
    <ul class="notes">
      <li>卸载删除频道会把数据库及程序相关文件一起删除</li>
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

 