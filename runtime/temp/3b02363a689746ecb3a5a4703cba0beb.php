<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:78:"D:\web\Education\portals\template/admin_style/default/admin\setting\index2.htm";i:1528515969;s:75:"D:\web\Education\portals\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;}*/ ?>
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



<div class="MainContainers">
<form name="form2" method="post" action="" class="layui-form">

  <div class="Header"><span class="tag"><?php if(($tab_ext['page_title'])): ?> <?php echo $tab_ext['page_title']; elseif((empty($info))): ?>添加<?php else: ?>修改<?php endif; ?></span> </div>
  <div class="Conter">
    <table class="FormTable">
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--d41d8cd98f00b204e9800998ecf8427e	--> <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;if($rs["ifhide"]): ?> <?php echo $rs['value']; else: ?>
	<tr> 
      <td class='tdL'><?php echo $rs['title']; ?>: </td>
      <td class="tdR <?php if(in_array($rs['type'],['text','password','number','select'])): ?>layui-input-inline<?php else: ?>layui-input-block<?php endif; ?>"> 
<?php if(($rs['name']=='waterpos')): $_result=explode('<input',$rs['value']);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;if($key > '0'): ?><input<?php echo $vs; if(($key==1||$key%3==1)): ?><br><?php endif; endif; endforeach; endif; else: echo "" ;endif; else: ?>
		<?php echo $rs['value']; ?><br><?php echo $rs['about']; endif; ?>
      </td>
    </tr>
  <?php endif; endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; fun('label@run_form_label','d41d8cd98f00b204e9800998ecf8427e',['f_array'=>$f_array,'mid'=>$mid,'info'=>$info,'field'=>'title','mod'=>'','dirname'=>__FILE__,]); ?>

    </table>
    <div class='submits'>
		<?php if(!(empty(input('id')) || ((input('id') instanceof \think\Collection || input('id') instanceof \think\Paginator ) && input('id')->isEmpty()))): ?><input type="hidden" name="id" value="<?php echo input('id'); ?>"><?php endif; ?>
		<input type="button" onclick="window.history.back()" style="color:#555;margin-right:30px;" onmouseout="$(this).css({'background':'#eee'})" onmouseover="$(this).css({'background':'orange'})" value="取消返回">

        <input type="submit" name="Submit" value="确认提交">    
    </div>
</div>

</form>
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

 