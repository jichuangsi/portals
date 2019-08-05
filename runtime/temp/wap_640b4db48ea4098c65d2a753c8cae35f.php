<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:75:"D:\web\Education\portals\template/index_style/toutiao/cms\content/show2.htm";i:1550482411;s:74:"D:\web\Education\portals\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $info['title']; ?></title>
<meta name="keywords" content='<?php echo !empty($info['keywords'])?$info['keywords']:$info['title']; ?>  <?php echo $s_info['name']; ?> '>
<meta name="description" content='<?php echo get_word(del_html($info['content']),300); ?>'>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="/public/static/css/base.css">
<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<link rel="stylesheet" type="text/css" href="/public/static/index/toutiao/wap_head.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
<script type="text/javascript" src="/public/static/index/toutiao/iscroll.js"></script>
<script type="text/javascript" src="/public/static/js/BrowsingHistory.js"></script>
</head>
<body>
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_head',$userdb,$webdb,true); ?>

<div class="body_Hearcont">
	<ul>
	<!--<li>
		<a href="/member.php/member/msg/index.html"><img src="/public/static/index/toutiao/email.png" width="30"></a>
		</li>-->
		<ol><a href="/"><img src="<?php echo (tempdir($webdb['logo']) ?: '/public/static/index/toutiao/wap_logo.png'); ?>"></a></ol>
		<li>
		<a href="/search/"><img src="/public/static/index/toutiao/so.png" width="30"></a>
		</li>
	</ul>
</div> 



<div class="BigsortBox" style="display: none;">
	<div class="BoxIn">
		<ul>
			<ol><div><span>
<?php $menu_choose=config('system_dirname')?config('system_dirname'):'index'; ?>
<!--<?php if(is_array(get_web_menu('wap')) || get_web_menu('wap') instanceof \think\Collection || get_web_menu('wap') instanceof \think\Paginator): $i = 0; $__LIST__ = get_web_menu('wap');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<a href="<?php echo $rs['url']; ?>" <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>class="ck"<?php endif; ?>><?php echo $rs['name']; ?></a>
<?php endforeach; endif; else: echo "" ;endif; ?>-->
			<?php if(is_array(get_sort(0,'other')) || get_sort(0,'other') instanceof \think\Collection || get_sort(0,'other') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort(0,'other');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
				<a href="<?php echo urls('content/index',['fid'=>$key]); ?>" <?php if(($key==$fid)): ?>class="ck"<?php endif; ?>><?php echo $vo; ?></a>
			<?php endforeach; endif; else: echo "" ;endif; ?>
			</span></div></ol>
			<li><span>更多</span></li>
		</ul>
	</div>
</div>
<!--弹出更多导航菜单-->
<div class="MoreSorts">
	<div class="BackBox" onClick="HiddenMoreSorts()"></div>
<?php if(is_array(get_sort($fid,'brother')) || get_sort($fid,'brother') instanceof \think\Collection || get_sort($fid,'brother') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort($fid,'brother');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
<dl <?php if($fid==$key): ?>class="ck"<?php endif; ?>>
			<dt><a href="<?php echo urls('index',['fid'=>$key]); ?>"><?php echo $vo; ?></a><span></span></dt>
					<?php if(count(get_sort($key,'name','sons'))>1): ?>
					<dd>
<?php if(!(empty(get_sort($key,'name','sons')) || ((get_sort($key,'name','sons') instanceof \think\Collection || get_sort($key,'name','sons') instanceof \think\Paginator ) && get_sort($key,'name','sons')->isEmpty()))): $_result=get_sort($key,'name','sons');if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vs): $mod = ($i % 2 );++$i;?>
					<a href="<?php echo urls('index',['fid'=>$key]); ?>"><?php echo $vs; ?></a>
			<?php endforeach; endif; else: echo "" ;endif; endif; ?>
	</dd>
	<?php endif; ?>
</dl>
			<?php endforeach; endif; else: echo "" ;endif; ?>
	<div class="exit"><span onClick="HiddenMoreSorts()">关闭</span></div>
</div>
<script>
	$(function(){
		var divwid =$('.BoxIn ul ol div').width();
		$('.BoxIn ul ol div').width((divwid+60));
		$('.BoxIn ul ol div span').prepend('<a href="/index.php/cms/">推荐</a>');
		$('.body_Hearcont ul li:eq(0)').remove();
		$('.body_Hearcont ul ').prepend('<li><a href="javascript:history.go(-1);" style="position: absolute;left: 9px;top: 14px;color: #fff;font-size: 30px;" onclick="window.history.back();" class="fa fa-reply"> </a></li>');
//		$('.BigsortBox').remove();
		var binALength=$('.BoxIn ul ol div span a').length;
		for(var i=0;i<binALength;i++){
			if($('.BoxIn ul ol div span a').eq(i).hasClass('ck')){
				if(i>2){
					 var $one_li =$(".BoxIn ul ol div span a:eq("+i+")");   
					 var $two_li = $(".BoxIn ul ol div span a:eq(2)");    
					 $one_li.insertAfter($two_li);   
				}
			}
		}
	});
</script>
<script type="text/javascript">
<!--
$('.MoreSorts dl dt span').click(function(){
	var thisobj=$(this).parent().parent();
	thisobj.siblings('dl').removeClass('ck');
	if(thisobj.hasClass('ck')){
		thisobj.removeClass('ck');
	}else{
		thisobj.addClass('ck');
	}
});
function HiddenMoreSorts(){
	$('.MoreSorts').fadeOut();
}
$('.BigsortBox .BoxIn ul li').click(function(){
	var scrollTopH=parseInt($(window).scrollTop());
	$('.MoreSorts').css({'top':scrollTopH+'px'});
	$('.MoreSorts').fadeIn();
});
//统计总宽度
//var mysortBoxW=0;
//$('.BigsortBox ul ol div a').each(function(){
	//mysortBoxW+=$(this).width();
//});
var mysortBoxW=$('.BigsortBox ul ol div span').width()+30;
$('.BigsortBox ul ol div').width(mysortBoxW);
var myScroll; 
myScroll = new IScroll('.BigsortBox ul ol', { scrollX: true, scrollY: false, mouseWheel: true,preventDefault: false,preventDefaultException: { tagName: /^(INPUT|TEXTAREA|BUTTON|SELECT|LI)$/ } });
//-->
</script>
<link rel="stylesheet" href="/public/static/index/default/showpic.css">

<!-- mui图片特效 对应DIV里的mui-content-padded类 图片要加参数 data-preview-src="" data-preview-group="1" -->
<link rel="stylesheet" href="/public/static/mui/css/mui.min.css">
<link rel="stylesheet" href="/public/static/mui/css/mui.preview.css">

<div class="ShowPhotoCont">
<style>
	.Navigation{
		margin: 10px 0px;
	}
	.Navigation li a{
		padding: 4px;
	    color: blue;
	}
</style>
<ul class="Navigation">
	<li>
<!-- 频道 -->
<?php $array = config('system_dirname') ? modules_config(config('system_dirname')):''; if($array): $url=iurl(config('system_dirname').'/index/index'); ?>
<a href="<?php echo $url; ?>"><?php echo $array['name']; ?></a>
<?php endif; ?>
<!-- 栏目 -->
<?php $array=[];if($fid&&$_name=sort_config()[$fid]['name'])$array=empty($array=sort_get_father($fid))?[$fid=>$_name]:$array+[$fid=>$_name];foreach($array AS $key=>$name):$url=iurl(config('system_dirname').'/content/index',['fid'=>$key]); ?>
 -&gt; <a href="<?php echo $url; ?>"><?php echo $name; ?></a>
<?php endforeach; ?>
<!-- 自定义标题与链接 -->
<?php if($link_name!=''): $url=$link_url?$link_url:'#'; ?>
<a href="<?php echo $url; ?>"><?php echo $link_name; ?></a>
<?php endif; ?>
	</li>
</ul>	
<?php if(defined('LABEL_DEBUG')): ?><!--SHOWPAGE <!--photo_show_pic0		-->
	<div class="PhotoBox mui-content-padded">
		<div class="BigPic"><span><a href="#"><img src="<?php echo $listdb['0']['picurl']; ?>" data-preview-src="" data-preview-group="1" /></a></span></div>
		<ul class="MorePic">
<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li><span><a href="#"><img src="<?php echo $rs['picurl']; ?>" data-preview-src="" data-preview-group="1"/></a></span></li>
<?php endforeach; endif; else: echo "" ;endif; ?>
		</ul>
	</div>
 SHOWPAGE--><?php endif; fun('label@run_showpage_label','photo_show_pic0',$info,['page'=>$page,'dirname'=>__FILE__,'tpl'=>'','field'=>'','val'=>'info','cache_time'=>'0']); ?>
	<div class="ContentBox">
		
		<div class="title"><?php echo $info['title']; ?></div>
		<div class="Cont">
			<i class="glyphicon glyphicon-paperclip"></i>
			<?php echo $info['content']; ?>
		</div>
	</div>
<style>
	.OtherAct{
		text-align: center;
    	padding: 0px 0px 10px 0px;
	}
	.OtherAct button{
		background: rgba(0,0,0,0.1);
	    padding: 4px 6px;
	    border: 0px;
	    font-size: 14px;
	    border-radius: 5px;
	    margin: 10px 5px;
	}
	
</style>
	<div class="OtherAct">
			<button type="button" ><i class="si si-share"></i> 分享</button>
			<?php if(empty($info['lock']) || (($info['lock'] instanceof \think\Collection || $info['lock'] instanceof \think\Paginator ) && $info['lock']->isEmpty())): ?><button type="button" onclick="post_comment(0)"><i class="fa fa-commenting-o"></i> 评论</button><?php endif; if(!(empty(plugins_config('givemoney')) || ((plugins_config('givemoney') instanceof \think\Collection || plugins_config('givemoney') instanceof \think\Paginator ) && plugins_config('givemoney')->isEmpty()))): ?><button type="button"><i class="si si-present give-money" data-id="<?php echo $id; ?>"> 打赏</i></button><?php endif; ?>
			<button onclick="TopicAgree();"><i class="fa fa-thumbs-o-up"></i>点赞(<em class="topic_agree"><?php echo $info['agree']; ?></em>)</button>
			<!--<button type="button" onclick="gave_rmb(<?php echo $id; ?>,0)">&yen; 赏钱</button>-->
			<button type="button" onclick="add_fav(<?php echo $id; ?>)"><li class="fa fa-fw fa-heart-o"></li>收藏<!--收藏--></button>
	</div><span style="display: none;" onclick="add_fav(<?php echo $id; ?>)"> <li class="fa fa-fw fa-heart"></li>收藏</span>
<script type="text/javascript">

</script>
<script type="text/javascript">
	//收藏
	function add_fav(id){
	var url="<?php echo purl('fav/api/add'); ?>?type=<?php echo config('system_dirname'); ?>&id="+id;
	$.get(url,function(res){
		if(res.code==0){
			layer.msg('收藏成功');
		}else{
			layer.msg(res.msg);
		}
	})
}
	//主题点赞
function TopicAgree(){	
	$.get("<?php echo urls('wxapp.post/agree',['id'=>$id]); ?>?"+Math.random(),function(res){
		if(res.code==0){
			var num =  $('.topic_agree').html();
			num++;
			$('.topic_agree').html(num);
			layer.msg("点赞成功！",{time:500});
			MyFabulous();
		}else{
			layer.msg("点赞失败:"+res.msg,{time:2500});
		}	
	});
}
//点赞后加入我的点赞
function MyFabulous(){
	var Historyarr=JSON.parse(localStorage.getItem("ss2"));
	var Historyarrindex=Historyarr.length-1;
	if(localStorage.getItem("Fabulous")!=null){
		var Fabulous=JSON.parse(localStorage.getItem("Fabulous"));
		if(Fabulous.length>=50){
			Fabulous.splice(0,1);
		}
		for(var i=0;i<Fabulous.length;i++){
			if(Fabulous[i].key==Historyarr[Historyarrindex].key){
				Fabulous.splice(i,1);
			}
		}
		var news={};
		news["key"]=Historyarr[Historyarrindex].key;
		news["val"]=Historyarr[Historyarrindex].val;
		Fabulous.push(Historyarr[Historyarrindex]);
		localStorage.setItem("Fabulous",JSON.stringify(Fabulous));
	}else{
		Fabulous=[];
		var news={};
		news["key"]=Historyarr[Historyarrindex].key;
		news["val"]=Historyarr[Historyarrindex].val;
		Fabulous.push(Historyarr[Historyarrindex]);
		localStorage.setItem("Fabulous",JSON.stringify(Fabulous));
	}
}
//打赏积分
var sys_dirname = "<?php echo config('system_dirname'); ?>";
var give_money_url = "<?php echo purl('givemoney/api/give','index'); ?>";
var count_money_url = "<?php echo purl('givemoney/api/count','index'); ?>";
var getlist_money_url = "<?php echo purl('givemoney/api/getlist','index'); ?>";

function give_jifen(){
	$(".give-money").each(function(){
		var that = $(this);
		var id = that.data('id');
		var rid = typeof(that.data('rid'))=='undefined' ? 0 : that.data('rid');
		var cid = typeof(that.data('cid'))=='undefined' ? 0 : that.data('cid');
		
		that.each(function(){
			var obj = $(this);
			$.post(count_money_url,{'sysname':sys_dirname,'id':id,'rid':rid,'cid':cid},function(res){
				if(res.code==0){	//有人打赏过了
					obj.html(' '+res.data);
					obj.click(function(){
						layer.confirm('请问你是要打赏？还是要查看打赏的用户列表',{btn:['我要打赏','查看用户']},function(){
							layer.closeAll();
							putnum();
						},function(){
							getlist();
						});						
					});
				}else{	//还没人打赏
					obj.click(function(){						
						putnum();
					});					
				}
			});
		});
		
		//显示打赏用户
		var getlist = function(){
			layer.closeAll();
			layer.load(1);
			$.post(getlist_money_url,{'sysname':sys_dirname,'id':id,'rid':rid,'cid':cid},function(res){
				layer.closeAll();
				if(res.code==0){
					var str = '';
					res.data.forEach(function(rs){
						str += '<div style="padding:5px;"><span style="color:blue;">' + rs.username + '</span> 打赏积分: ' + rs.money + ' 个 <span style="color:#666;">['+rs.create_time+']</span></div>';
					});
					layer.open({
					  title:'打赏用户列表',
					  type: 1,
					  area: '98%',
					  content: '<div style="padding:15px;">' + str + '</div>',
					});
				}else{
					layer.alert(res.msg);
				}
			}).fail(function(){layer.closeAll();layer.alert('页面出错了!')});
		}
		
		//打赏输入积分个数
		var putnum = function(){
			layer.prompt({
				  formType: 0,
				  value: '3',
				  title: '请输入要打赏的积分个数',
				  //area: ['100px', '20px'] //formType:2 自定义文本域宽高
				}, function(value, index, elem){
					layer.close(index);
					postdata(value);
				}
			);
		};
		
		//打赏提交数据
		var postdata = function(num){			
			layer.load(1);
			$.post(give_money_url,{'sysname':sys_dirname,'money':num,'id':id,'rid':rid,'cid':cid,'about':''},function(res){
				layer.closeAll();
				if(res.code==0){
					layer.msg('谢谢你的打赏!');
				}else{
					layer.alert(res.msg);
				}
			}).fail(function(){layer.closeAll();layer.alert('页面出错了!')});
		}		
	});
}

$(document).ready(function () {
	give_jifen();
});
</script>
	<!--引用评论碎片-->
	<?php if(defined('LABEL_DEBUG')): ?><!--COMMENT<!--commentwap02		comment/wap01--> COMMENT--><?php endif; fun('label@run_comment_label','commentwap02',$info,['sysid'=>$sysid,'aid'=>$id,'status'=>'','dirname'=>__FILE__,'tpl'=>'comment/wap01','cache_time'=>'0','rows'=>'5','where'=>'','order'=>'','by'=>'']); ?>
</div>

<!-- mui图片特效 -->
<script src="/public/static/mui/js/mui.min.js"></script>
<script src="/public/static/mui/js/mui.zoom.js"></script>
<script src="/public/static/mui/js/mui.previewimage.js"></script>
<script>mui.previewImage();</script>

<!-- 微动态自动收录用户感兴趣的主题,时间60代表用户停留60秒将自动收藏 -->
<?php echo fun('sns@fav',$info,60,'系统帮你订阅了本主题,下次本主题有回复,将会通知你'); ?>

<script>
$('.PhotoBox img').hover(
	function(){
		$(this).animate({"width":"150%"},300);
	},
	function(){
		$(this).animate({"width":"100%"},300);
	}
);
</script>
<script type="text/javascript">mui('body').on('tap','a',function(){document.location.href=this.href;}); </script>
	
<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body',$userdb,$webdb,true); ?>

<link rel="stylesheet" href="/public/static/index/toutiao/wap_foot.css"> 
<div class="body_Footcont">
	<div class="footer">
		<ul>
<!--
			<li><a href="javascript:;history.go(-1);"><i class="si si-arrow-left"></i><span>返回</span></a></li>
			<li><a href="<?php echo iurl('cms/index/index'); ?>"><i class="si si-present"></i><span>资讯</span></a></li>
			<li><a href="<?php echo get_url('index'); ?>"><i class="si si-home"></i><span>首页</span></a></li>
			<li><a href="<?php echo iurl('shop/index/index'); ?>" data="购物车<?php echo iurl('shop/car/index'); ?>"><i class="si si-basket"></i><span>商城</span></a></li>
			<li><a href="<?php echo get_url('member'); ?>"><i class="si si-user"></i><span>会员中心</span></a></li>
-->
<?php if(is_array(get_web_menu('wapfoot')) || get_web_menu('wapfoot') instanceof \think\Collection || get_web_menu('wapfoot') instanceof \think\Paginator): $i = 0; $__LIST__ = get_web_menu('wapfoot');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>class="cur"<?php endif; ?>><a href="<?php echo $rs['url']; ?>"><i class="<?php echo (isset($rs['style']) && ($rs['style'] !== '')?$rs['style']:'glyphicon glyphicon-star'); ?>"></i><span><?php echo $rs['name']; ?></span></a></li>
<?php endforeach; endif; else: echo "" ;endif; ?>

		</ul>
	</div>
</div>

<!--下面是钩子插件,做风格的时候尽量加上,方便扩展-->
<?php echo hook_listen('layout_body_foot',$userdb,$webdb,true); ?>
</body>
</html>