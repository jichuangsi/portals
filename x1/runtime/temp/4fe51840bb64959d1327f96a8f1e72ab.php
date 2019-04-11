<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:66:"D:\web\x1\template/admin_style/default/admin\group\admin_power.htm";i:1547426888;s:60:"D:\web\x1\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;}*/ ?>
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
.SideBox{
	border-left:#DDD dotted 1px;
	border-right:#DDD dotted 1px;
}
.SideBox .h{
	background: #F5F5F5;
	border-bottom:#DDD dotted 1px;
	line-height: 35px;
}
.SideBox .h span{
	display: inline-block;
	color: #FFF;
	width: 120px;
	padding-left: 20px;
	background: #1E99CB;
	font-size:16px;
}
.SideBox .h span i{
	margin-right: 5px;
}
.SideBox dl{
	border-bottom:#DDD dotted 1px;
	position: relative;
	min-height: 40px;
	padding-left: 140px;
}
.SideBox dl:hover{
	background: #F9F9F9;
}
.SideBox dl dt{
	position:absolute;
	width:120px;
	line-height: 20px;
	font-size: 16px;
	left:10px;
	top:10px;
}
.SideBox dl dd{
	border-left:#DDD dotted 1px;
	min-height: 40px;
	overflow: hidden;
}
.SideBox dl dd ul{
	position: relative;
	min-height: 40px;
	padding-left: 180px;
	font-size: 14px;
}
.SideBox dl dd ul:before{
	content: '';
	display: block;
	width: 100%;
	height: 2px;
	position: absolute;
	border-top:#DDD dotted 1px;
	left:0;
	top:-1px;
}
.SideBox dl dd ul ol{
	position: absolute;
	width: 160px;
	height: 20px;
	line-height: 20px;
	overflow: hidden;
	top:10px;
	left:10px;
}
.SideBox dl dd ul li{
	padding: 5px 0 10px 0;
}
.SideBox dl dd ul li:after{
	content: '';
	display: block;
	clear: both;
}
.SideBox dl dd ul li div{
	width:160px;
	height: 20px;
	line-height: 20px;
	overflow: hidden;
	float: left;
	margin-top: 5px;
	color: #666;
}
</style>
<div class="MainContainers">
  <div class="Header"><span class="tag">修改<span class="red"><?php echo $info['title']; ?></span>后台权限</span> </div>
  <div class="Conter">
  	<form name="form_work" method="post" action="">
  	<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$array): $mod = ($i % 2 );++$i;$_key = $key; ?>
  	<div class="SideBox">
  		<div class="h"><span><i class="<?php echo $array['icon']; ?>"></i><?php echo $array['title']; ?></span></div>
  		<?php if(is_array($array['sons']) || $array['sons'] instanceof \think\Collection || $array['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $array['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
  		<dl>
  			<dt><?php echo $vs['title']; ?> <input type="checkbox" class="blockall">
				 
			</dt>
  			<dd>
  			<?php if(is_array($vs['sons']) || $vs['sons'] instanceof \think\Collection || $vs['sons'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vs['sons'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;
				is_array($rs['link']) && $rs['link'] = $rs['link'][0];
				$k=$_key.'-'.$rs['model'].'-'.$rs['link'];
			 ?>

  				<ul>
  					<ol>
						 <!--<input type="checkbox" class="rowall"> -->
  						<input class="headtitle" type="checkbox" name="powerdb[<?php echo $k; ?>]" value="1" <?php if($info['admindb'][$k] == '1'): ?>checked<?php endif; ?>>
  						<a href="<?php echo $rs['url']; ?>" target="_blank"><?php echo $rs['title']; ?></a>
  					</ol>

  					<li>
  						<?php 
							$rs['power'] = preg_match('/\/index$/',$rs['link'])&&!isset($rs['power'])?['add','edit','delete']:$rs['power'];
							$power = [];
							$_title=['add'=>'新增','edit'=>'修改','delete'=>'删除'];
							foreach($rs['power'] AS $_k=>$_v)$power[is_numeric($_k)?$_v:$_k] = is_numeric($_k)?$_title[$_v]:$_v;
							list($controller) = explode('/',$rs['link']);
							 if(is_array($power) || $power instanceof \think\Collection || $power instanceof \think\Paginator): $i = 0; $__LIST__ = $power;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ps): $mod = ($i % 2 );++$i; $k=$_key.'-'.$rs['model'].'-'.(strstr($key,'/')?'':$controller.'/').$key; ?>
							<div><input type="checkbox" name="powerdb[<?php echo $k; ?>]" value="1" <?php if($info['admindb'][$k] == '1'): ?>checked<?php endif; ?>> <?php echo $ps; ?></div>
							<?php endforeach; endif; else: echo "" ;endif; ?>
  					</li>
  				</ul>
  			<?php endforeach; endif; else: echo "" ;endif; ?>
  			</dd>
  		</dl>
  		<?php endforeach; endif; else: echo "" ;endif; ?>
  	</div>
  	<?php endforeach; endif; else: echo "" ;endif; ?>
  	<div class="submits">
	    <input type="button" onclick="CheckAll('all')" name="Submit2" value="全选" />
	    <input type="button" onClick='CheckAll()' name="Submit2" value="反选" />
	    <input type="submit" name="Submit" value="提交">
	    <input type="hidden" name="id" value="<?php echo $info['id']; ?>">
	  </div>
  	</form>
    </div>
</div>
<SCRIPT LANGUAGE="JavaScript">
<!--
function CheckAll(va){
	form=document.form_work
	for (var i=0;i<form.elements.length;i++){
		var e = form.elements[i];
		if(e.className=='myadgrdb')continue;
		if(va=='all'){
			e.checked = true;
		}else{
			e.checked == true ? e.checked = false : e.checked = true;
		}
	}
}

$('.rowall').on('click',function(){
		var d = $(this).parents('ol').siblings('li');
		var r = $(this).prop("checked"); //获取当前选择的按钮的句柄
		var ht = $(this).parent().siblings(".headtitle");
    		r == true ? ht.prop("checked",true) : ht.prop("checked",false);
		d.find('input[type="checkbox"]').each(function () {
            r == true ? $(this).prop("checked",true) : $(this).prop("checked",false);
        });


});

$('.blockall').on('click',function(){
  		var d = $(this).parents('dl').find('ul');
  		var r = $(this).prop("checked");   //获取当前选择的按钮的句柄
    	d.find('input[type="checkbox"]').each(function () {
        r == true ? $(this).prop("checked",true) : $(this).prop("checked",false);
    });



  		// console.log(d);
});




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

 