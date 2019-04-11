<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:69:"D:\web\Education\template/admin_style/default/admin\upgrade\index.htm";i:1535769938;s:67:"D:\web\Education\template\admin_style\blansj\admin\index\layout.htm";i:1547777444;}*/ ?>
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



<script type="text/javascript">
<!--
if (navigator.userAgent.indexOf("MSIE") >= 0) {
	alert("请使用谷歌或火狐访问.其它浏览器无法操作与使用");
}
//-->
</script>
<form name="formlist" method="post" action="" class="up_files">
<div class="MainContainers">
  <div class="Header"><span class="tag">在线升级</span><span class="more">&gt;&gt;</span></div>
  <div class="Conter">


<table class="ListTable">
   <tr> 
        <th width='11%'>选择</th>
        <th width='32%'>文件名称</th>
      <th width='17%'>升级前时间</th>
      <th width='21%'>更新时间</th>
      <th width='19%'>查看新文件</th>
    </tr>




  <tr id="contents">
    <td colspan=5 height=30 style="background:#eee;">
      <div align="center" style="color:red;" class="upgrade_msg">正在获取云端数据信息,请稍候...</div>
    </td>
  </tr>
 
    <tr bgcolor='#FFFFFF' align="center" class="up_btn" style="display:none;"> 
      <td colspan='5'>
        <div class='submits'>
          <input type='button' onclick="CheckAll(this.form)" name='Submit' value='全选'>
          <input type='button' style="background:red;" onclick="sys_upgrade();" name='Submit' value='立刻升级'>          
        </div>
        </td>
  </tr> 
  </table>

  </div>
</div>
</form>

<div class="MainContainers">
  <div class="Header"><span class="tag">升级说明</span></div>
  <div class="Conter">
    <ul class="notes">
      <li>1、你可以选择哪些文件不升级,不过你最好是在程序目录,把不想升级的文件,做个标志,比如index.htm不想升级,就在对应的目录创建一个文件index.htm.lock</li>
  <li>2、如果网络故障,一次升级不成功,可反复升级</li>
  <li>3、如果你二次开发过的文件被替换了,请进目录/runtime/bakfile/找回来</li>
  
    </ul>
  </div>
</div>
<script language=JavaScript>
var upgrade_edition = '';
var upgrade_data = {};
//检查版本更新
function check_upgrade(){
	var now_edition = "<?php echo $upgrade['md5']; ?>";
	$.post("https://x1.php168.com/appstore/upgrade/get_edition.html?"+Math.random(),{app_edition:"<?php echo fun('upgrade@local_edition'); ?>",sys_edition:now_edition}).success( function(res){
		if(res.code==0){
			upgrade_data = res.data;
			if(res.data.md5!=now_edition||typeof(res.data.upgrade_msg) != "undefined"){
				upgrade_edition = res.data.md5;
				var msg = typeof(res.data.upgrade_msg) != "undefined" ? res.data.upgrade_msg : '你的系统需要升级<br>云端更新日期:'+res.data.time;
				$(".upgrade_msg").html(msg);
				layer.confirm(msg, {
					btn : [ '查看需要升级的文件', '晚点再升级' ]
				}, function(index) {
					down_file_list();
				});
			}else{
				$(".upgrade_msg").html('已经是最新了,无须升级');
			}
		}else{
			layer.alert(res.msg,{time:5500});
		}
	}).fail(function (res) {
		//layer.alert('网络故障,请晚点再偿试升级!!');
		//layer.closeAll();
		layer.open({title: '网络故障,请晚点再偿试升级!!',area:['90%','90%'],content: res.responseText});
	});
}
check_upgrade();

//下载文件列表,核对需要哪些更新
function down_file_list(){
	layer.alert('需要一点时间,请稍候,正在从云端下载升级文件列表');
	var index = layer.load(1,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2
	$.post("<?php echo urls('check_files'); ?>?upgrade_edition="+upgrade_edition,upgrade_data).success(function(res){
		layer.closeAll();
		if(res.code==0){
			var str = '';
			res.data.forEach(function(rs){
				str +='<tr>'+
						  '<td class="b red"> <input type="checkbox" name="filedb[]" value="'+rs.file+','+rs.id+'"checked></td>'+   
						  '<td class="Left">'+rs.showfile+'</td>'+   
						  '<td><div align="center">'+rs.ctime+'</div></td>'+
						  '<td>'+rs.time+'</td>'+
						  '<td><a href="<?php echo urls("view_file"); ?>?filename='+rs.file+'&id='+rs.id+'" target="_blank">查看</a></td>'+
					  '</tr>';
			});
			//$(".contents").html(str);
			document.getElementById('contents').outerHTML=str;
			$(".up_btn").show();
			layer.alert('需要升级的文件列表如下,你可以有选择性的升级');
		}else{
			layer.alert(res.msg,{time:5500});
		}
	}).fail(function (res) {
		layer.closeAll();
		//layer.alert('通信失败,可能你的后台权限不足'); )
		var parsedJson = $.parseJSON(res.responseText.substr(res.responseText.indexOf('{'))); //用户程序中有UTF8 +BOM文件导致的

		if( typeof(parsedJson) == 'object' && parsedJson.code==0){
			var str = '';
			parsedJson.data.forEach(function(rs){
				str +='<tr>'+
						  '<td class="b red"> <input type="checkbox" name="filedb[]" value="'+rs.file+','+rs.id+'"checked></td>'+   
						  '<td class="Left">'+rs.showfile+'</td>'+   
						  '<td><div align="center">'+rs.ctime+'</div></td>'+
						  '<td>'+rs.time+'</td>'+
						  '<td><a href="<?php echo urls("view_file"); ?>?filename='+rs.file+'&id='+rs.id+'" target="_blank">查看</a></td>'+
					  '</tr>';
			});
			//$(".contents").html(str);
			document.getElementById('contents').outerHTML=str;
			$(".up_btn").show();
			layer.alert('需要升级的文件列表如下,你可以有选择性的升级<br>特别提醒:你的系统中有错误的UTF8 +BOM 代码文件,一般情况是新装的风格导致的,请仔细排查!');
			return ;
		}else if( typeof(parsedJson) == 'object' && parsedJson.code==1){
			layer.alert(parsedJson.msg+"<br><br>特别提醒:你的系统中有错误的UTF8 +BOM 代码文件,一般情况是新装的风格导致的,请仔细排查!",{time:5500});
			return ;
		}

		layer.confirm('通信失败,你是否要新开窗口查看一下详情？'+JSON.stringify(res), {
            btn : [ '查看详情', '取消' ]
        }, function(index) {
            window.open("<?php echo urls('check_files'); ?>?upgrade_edition="+upgrade_edition);
        });
	});
}

//开始升级文件
function sys_upgrade(){
	$(".up_files input[type='checkbox']").each(function(i){
		if($(this).is(':checked')==true){
			ckfile_num++;
		}
	});
	
	layer.alert('正在升级文件,请耐心稍候...');
	var index = layer.load(1,{shade: [0.7, '#393D49']}, {shadeClose: true}); //0代表加载的风格，支持0-2

	$(".up_files input[type='checkbox']").each(function(i){
		if($(this).is(':checked')==true){
			upgrade_file($(this).val(),$(this).parent().next());	//一个一个的文件升级
		}
	});
}

//全部升级完毕
function end_up(){
		layer.msg('全部文件升级成功');
		$.post("<?php echo urls('sysup'); ?>?upgrade_edition="+upgrade_edition,upgrade_data).success(function(res){
			if(res.code==0){			
				layer.alert('本次升级完毕,'+ok_num+'个文件升级成功!');
			}else{
				layer.alert('升级信息写入失败');
			}
		}).fail(function (res) {
			layer.open({title: '网络故障,请晚点再偿试升级!!',area:['90%','90%'],content: res.responseText});
		});

}

var ckfile_num = 0;	//选中的升级文件个数
var ok_num = 0;	//成功升级文件个数
//一个一个的文件升级
function upgrade_file(filename,obj){	
	$.post("<?php echo urls('sysup'); ?>?filename="+filename,upgrade_data).success(function(res){
		
		if(res.code==0){			
			//layer.msg('文件:'+filename+' 升级成功');
			var str = obj.html()+' <font color="red">升级成功</font>';
			obj.html(str);
			ok_num++;
			if(ok_num==ckfile_num){	//全部升级完毕
				layer.closeAll();
				end_up();
			}
		}else{
			//layer.msg('文件:'+filename+' 升级失败:'+ res.msg,{time:2500});
			var str = obj.html()+' <font color="blue">升级失败:'+res.msg+'</font>';
			obj.html(str);
		}
	}).fail(function (res) {
		//layer.alert('通信失败,可能你的后台权限不足');
		layer.open({title: '网络故障,请晚点再偿试升级!!',area:['90%','90%'],content: res.responseText});
	});
}



function CheckAll(form){
	for (var i=0;i<form.elements.length;i++){
		var e = form.elements[i];
		e.checked == true ? e.checked = false : e.checked = true;
	}
}

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

 