<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:69:"D:\web\Education\template/index_style/default/bbs\content/pc_post.htm";i:1548659155;s:62:"D:\web\Education\template/index_style/toutiao/index/layout.htm";i:1554714292;s:65:"D:\web\Education\template\index_style\default\index\min_login.htm";i:1554707864;s:66:"D:\web\Education\template\index_style\default\index\editor\btn.htm";i:1546761301;s:70:"D:\web\Education\template\index_style\default\bbs\content\post_set.htm";i:1548659155;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo M('name'); ?> 频道主页</title>
<meta name="keywords" content='<?php echo $webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo $webdb['seo_description']; ?>'>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="shortcut icon" type="image/x-icon" href="/public/static/index/toutiao/favicon.ico">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/reset.css">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/cms.css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
<script type="text/javascript" src="/public/static/index/toutiao/kefu.js"></script>
</head>

<body>
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展  -->
<?php echo hook_listen('layout_body_head',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/head.css">
<div class="TopContBox">
	<ul>
		<ol><a href="$webdb[www_url]" class="home"><img src="/public/static/index/toutiao/home.png"></a></ol>
		<li>
<div class="qb_pc_topBox">
	<ul>		
<?php if(!(empty($userdb) || (($userdb instanceof \think\Collection || $userdb instanceof \think\Paginator ) && $userdb->isEmpty()))): ?>
		<ol><?php echo $userdb['username']; ?> 您好！欢迎来到 <a href="/index.php/cms/list-9.html" style="color: blue;"><?php echo $webdb['webname']; ?></a></ol>
		<li><a href="<?php echo get_url('member'); ?>" target="_blank">进入会员中心</a> <a href="<?php echo get_url('quit'); ?>" target="_blank">安全退出</a></li>
<?php else: ?>
		<ol> 您好！欢迎来到<a href="/index.php/cms/list-9.html" style="color: blue;"><?php echo $webdb['webname']; ?></a></ol>
		<li>
			<form action="<?php echo urls('index/login/index'); ?>" method="post">
	<input type="hidden" name="fromurl" value="<?php echo get_url('location'); ?>">
	<div class="qb_ui_TopLoginBox">
		<span>通行证</span>
		<span><input type="text" name="username" minlength="2" placeholder="输入帐号" required/></span>
		<span><input type="password" name="password" minlength="5" placeholder="输入密码" required/></span>
		<span><button type="submit">登录</button></span>
		<span><a href="<?php echo get_url('reg'); ?>">注册</a> | <a href="<?php echo get_url('login'); ?>">登录</a></span>
		<!--<span><a href="<?php echo purl('login/qq/index'); ?>" class="fa fa-qq"> 登录</a></span>
		<span><a href="<?php echo purl('weixin/login/index'); ?>" class="fa fa-weixin"> 登录</a></span>-->
	</div>
</form>
		</li>
<?php endif; ?>
	</ul>
</div>
		</li>
	</ul>
</div>


<link rel="stylesheet" href="/public/static/bbs/pcpost.css">
<div class="MainContainer">
	<div class="qideBox"><a href="<?php echo urls('index/index'); ?>">社区主页</a> -&gt; <?php if(!(empty($fid) || (($fid instanceof \think\Collection || $fid instanceof \think\Paginator ) && $fid->isEmpty()))): ?><a href="<?php echo urls('content/index',['fid'=>$fid]); ?>"><?php echo get_sort($fid); ?></a> &gt;<?php endif; ?> 发表帖子</div>
	<form class="ajax-post" action="" method="post">
	<div class="FormBox">
		<?php echo hook_listen('template_form_head',$info,null,true); ?>
		<dl>
			<dt><input type="text" value="<?php echo $info['title']; ?>" name="title" placeholder="请输入标题" required/></dt>
			<dd>
				<select name="fid">
					<option value="0">请选择栏目</option>
					<?php if(is_array(sort_config('')) || sort_config('') instanceof \think\Collection || sort_config('') instanceof \think\Paginator): $i = 0; $__LIST__ = sort_config('');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $rs['id']; ?>" <?php if($fid == $rs['id']): ?>selected<?php endif; ?>><?php echo $rs['title_prefix']; ?><?php echo $rs['name']; ?></option>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</dd>
<?php if(((empty($id)&&empty($ext_id))||$id)&&getArray($qun=fun('qun@myjoin'))): ?>
			<dd>
				<select name="ext_id">
					<option value="<?php echo (isset($info['ext_id']) && ($info['ext_id'] !== '')?$info['ext_id']:0); ?>">选择</option>
					<?php if(is_array($qun) || $qun instanceof \think\Collection || $qun instanceof \think\Paginator): $i = 0; $__LIST__ = $qun;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<option value="<?php echo $rs['id']; ?>" <?php if($info['ext_id'] == $rs['id']): ?>selected<?php endif; ?>><?php echo $rs['title']; ?></option>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
			</dd>
<?php endif; ?>

		</dl>
		<div class="ueditor">
<script id="content" class="js-ueditor" name="content" type="text/plain"><?php echo $info['content']; ?></script>
<script type="text/javascript"> 
function insertHtml(nums) {
	var strs=$('.stylemode'+nums).html();
	ueditor.execCommand('insertHtml',strs);
	hide_nav($('#editmodes'),$('#fullbg1'));
}
function showEditMode(){
	$.get("<?php echo iurl('index/editor/index'); ?>",function(d){
		$('#editmodes').html(d);
	});
	show_nav($('#editmodes'),$('#fullbg1'));
	$('#fullbg1').height($(window).height());
	$('#editmodes').height($(window).height());
}
function show_nav(node,fullbg){
	fullbg.css({'display':'block'}).stop().animate({'opacity':.6},500,function(){
		node.stop().animate({'width':'300px','padding':'0px 10px 0 10px'},300);
	});
}
function hide_nav(node,fullbg){
	fullbg.animate({'opacity':0},300,function(){
		$(this).css({'display':'none'});
	});
	setTimeout(function(){
		node.html('');
		node.stop().animate({'width':'0px','padding':'0px 0px 0 0px'},300);
	}, 500)
}
</script>

<style type="text/css">
.slectEditMode{
	padding:5px 0 5px 0;
}
.slectEditMode a{
	display:inline-blodk;
	padding:5px 10px;
	background:green;
	border-radius:5px;
	color:#FFF;
}
.fullbg { 
	background-color:#000; 
	opacity:0; 
	top:0; 
	left:0; 
	width:100%; 
	height:100%; 
	z-index:1001; 
	position:fixed;
	display:none;
}
#editmodes{ 
	position:fixed; 
	top:0;  
	right:0; 
	z-index:1002; 
	height:100%;
	width:0px;
	overflow:auto;
	overflow-x:hidden;
	scrollbar-face-color: #FFFFFF;
	scrollbar-shadow-color: #eee;
	scrollbar-highlight-color: #eee;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #D2E5F4; 
	background:#FFF;
}
</style>
<div id="editmodes"></div>
<div class="fullbg" id="fullbg1" onclick="hide_nav($('#editmodes'),$('#fullbg1'))"></div>

<!--<div class="slectEditMode"><a href="javascript:showEditMode();">内容布局模板</a></div>-->
<div class="slectEditMode"><a href="javascript:showEditMode();">内容布局模板</a> <a href="javascript:ueditor.execCommand('insertHtml','[reply] 请在这括号范围内输入要隐藏的内容 [/reply]')" style="background:orange;">设置回复可见</a> <a href="javascript:set_group_view()" style="background:orange;">用户组权限</a> <a href="javascript:set_password_view()" style="background:orange;">密码权限</a> <a href="javascript:set_paymoney_view()" style="background:orange;">积分消费权限</a></div>
<ul class="div_set_group_view" style="display:none;">
<div class="set_group_view" style="padding:10px;line-height:180%;">
<?php $_result=getGroupByid();if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$name): $mod = ($i % 2 );++$i;?>
<input type="checkbox" name="" value="<?php echo $key; ?>"> <?php echo $name; ?><br>
<?php endforeach; endif; else: echo "" ;endif; ?>
</div>
</ul>


<script type="text/javascript">
//设置用户组查看杼
function set_group_view(){
	check_wap_edit();

	layer.open({
		type: 1,
		btn:['确认','取消'],
		yes:function(){
			var gid_array = new Array();
			$(".set_group_view").last().find("input:checkbox:checked").each(function(){
				gid_array.push($(this).val());
			});
			var groups = gid_array.join(',');
			if(groups!=''){
				var str = '[group='+groups+'] 内容区域 [/group]';
				<?php if(IN_WAP===true): ?>
				//v_summernote.summernote('pasteHTML',str)
				put_summernote(str);
				<?php else: ?>
				ueditor.execCommand('insertHtml',str);
				<?php endif; ?>
				layer.closeAll();
			}else{
				layer.alert('你必须选择一个用户组');
			}			
		},
		title:'请选择哪些用户组才有权限查看',
		content:$('.div_set_group_view'),
	},);
}

//密码查看权限
function set_password_view(){
	check_wap_edit();

	layer.prompt({
            title: '请输入访问密码',
            formType: 0
       }, function(value){
		   layer.closeAll();
		   var str = '[password='+value+'] 内容区域 [/password]';
		 <?php if(IN_WAP===true): ?>
			put_summernote(str)
		<?php else: ?>
			ueditor.execCommand('insertHtml',str);
		<?php endif; ?>
    });
}

//积分消费查看权限
function set_paymoney_view(){
	check_wap_edit();

	layer.prompt({
            title: '访问内容需要消费多少积分？',
            formType: 0
       }, function(value){
		   value=parseInt(value);
		   if(value<1){
			   layer.alert('必须大于0');
			   return ;
		   }
		   layer.closeAll();
		   var str = '[paymoney='+value+'] 内容区域 [/paymoney]';
		 <?php if(IN_WAP===true): ?>
			put_summernote(str)
		<?php else: ?>
			ueditor.execCommand('insertHtml',str);
		<?php endif; ?>
    });
}

//设置回复才可看
function set_reply_view(){
	check_wap_edit();
	var str = '[reply] 内容区域 [/reply]';
	//v_summernote.summernote('pasteHTML',str);
	put_summernote(str)
}


function put_summernote(str){
	v_summernote.summernote('code', cache_summernote_code.replace(/<!--#@#@#@#@#-->/, str+'<br>'));
}

function check_wap_edit(){
	<?php if(IN_WAP!==true): ?>
		return ;
	<?php endif; ?>
	//v_summernote.summernote('createRange') 选中区域
	v_summernote.summernote('insertText', ' ');	//焦点获取失败,避免下面的报错
	v_summernote.summernote('pasteHTML', '<!--#@#@#@#@#-->');
	cache_summernote_code = v_summernote.summernote('code');
	if(cache_summernote_code.indexOf('<!--#@#@#@#@#-->')==-1){
		layer.alert("焦点获取失败,请重新点击选择位置,要在哪插入模板!");
		return false;
	}
}

</script><!--浏览权限功能-->
<script type="text/javascript">
var ueditor;	//内容布局模板要用到
jQuery(document).ready(function() {
	//重新定义编辑器的宽度＝表单提交容器标签的宽度
	$('#PostComment .ueditor').width($('#PostComment .submit').width());   
    ueditor =  UE.getEditor($('.js-ueditor').attr('name'), {
            initialFrameHeight:300,  //初始化编辑器高度,默认320
            autoHeightEnabled:false,  //是否自动长高
            maximumWords: 50000, //允许的最大字符数
            serverUrl: '<?php echo urls("index/attachment/upload","dir=images&from=ueditor&module=bbs"); ?>',			 
        }); 
});
</script>
<script src="/public/static/libs/ueditor/ueditor.config.js"></script>
<script src="/public/static/libs/ueditor/ueditor.all.min.js"></script>
		</div>
		<ul class="uploadImg">
			<div style="display:none;">
				<input type="file" name="fileToUpload" id="fileToUpload" accept="image/*" multiple/>
				<input type="text" name="picurl" value="<?php echo $info['picurl']; ?>" id="compressValue"  style="width:100%;" /> 
			</div>
			<ol>点击上传图片</ol>
			<li onclick='$("#fileToUpload").click()'><i class="si si-camera"></i></li>
		</ul>
		<div class="ListImgs">
		</div>
		<?php echo hook_listen('template_form_foot',$info,null,true); ?>
		<div class="button"><button type="submit"><?php if(empty($id) || (($id instanceof \think\Collection || $id instanceof \think\Paginator ) && $id->isEmpty())): ?>发表帖子<?php else: ?>修改帖子<?php endif; ?></button></div>	
	</div>
	</form>
</div>

<script type="text/javascript" src="/public/static/js/base64uppic.js"></script>
<script type="text/javascript">
		var severUrl = "<?php echo urls('index/attachment/upload','dir=images&from=base64&module=bbs'); ?>";
		var pics = [];
        //图片上传change事件
        $('#fileToUpload').change(function(){			
            uploadBtnChange($(this).attr("id"),'compressValue',pics,viewpics);
        });

		function viewpics(url,pic_array){
			var html = '';
			pic_array.forEach(function(f){
				html += '<div><span><img src="/public/'+f+'"></span><em><i class="fa fa-remove"></i></em></div>';
			});
			$(".ListImgs").html(html);
			addclick();
		}
		if($("#compressValue").val()!='')pics = $("#compressValue").val().split(',');
		viewpics('',pics);		
		

		function addclick(){
			$(".ListImgs em").click(function(e){
				//这里删除的图片没有真正从服务器删除
				$(this).parent().remove();
				pics = [];
				var obj = $(".ListImgs img");
				obj.each(function(e){
					var img = $(this).attr("src");
					img = img.replace('/public/','');
					pics.push(img);
					$("#compressValue").val( pics.join(',') );
				});
				if(obj.length==0){
					$("#compressValue").val('');
				}			
			});
		}
		addclick();
</script>

<SCRIPT LANGUAGE='JavaScript'>

function postform(){
	layer.confirm('你确认要提交吗?',{
            btn:['确定','取消']
        },function(index){
			var form_data = $('.ajax-post').serialize();
			postcontent(form_data);
        }
	);
}

var havepost = false;
function postcontent(form_data){
			var that  = ueditor;
			if(that.hasContents()==false){
				layer.alert('内容不能为空')
				return false;
			}
			if(havepost==true){
				layer.msg('请不要重复提交');
				return false;
			}
			havepost = true;
            $.post(url, form_data).success(function (res) {
                if(res.code==0){
					layer.msg("<?php if(empty($id) || (($id instanceof \think\Collection || $id instanceof \think\Paginator ) && $id->isEmpty())): ?>发表成功！<?php else: ?>修改成功<?php endif; ?>");
					location.href="<?php echo urls('content/show'); ?>?id=" + res.data.id;
				}else{
					havepost = false;
					layer.alert('提交失败:' + res.msg);
				}
            }).fail(function () {
				havepost = false;
				layer.open({title: '提示',content: '服务器发生错误'});
            });
}

var url = "<?php if(empty($id) || (($id instanceof \think\Collection || $id instanceof \think\Paginator ) && $id->isEmpty())): ?><?php echo urls('wxapp.post/add',['ext_sys'=>$ext_sys,'ext_id'=>$ext_id]); else: ?><?php echo urls('wxapp.post/edit',['id'=>$id]); endif; ?>";

	$(document).ready(function(){
        $('.ajax-post').submit(function () {
            var form_data = $(this).serialize();
			postcontent(form_data)
            return false;
        });
    });

</SCRIPT>

<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/foot.css">
<div id="copyright" style="display: none;">
    <div>Copyright@<?php echo $webdb[www_url]; ?> all rights reserved <a href="http://www.miibeian.gov.cn" target="_blank"><?php echo $webdb['miibeian_gov_cn']; ?></a></div>
    <div>Powered by <a href="http://www.php168.com" target="_blank">qibosoft <?php echo $webdb['QB_VERSION']; ?></a> Code &copy; 2018 <a href="http://bbs.qibosoft.com/" target="_blank">qibosoft</a></div>
	<?php echo $webdb['copyright']; ?>
</div>
<!-- 在线客服 开始 -->
<div id="top"></div>
<!-- 在线客服 结束 -->
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_foot',$userdb,['webdb'=>$webdb,'info'=>$info],true); ?>
<script type="text/javascript" src="/public/static/js/qibo.js"></script>
</body>
</html>