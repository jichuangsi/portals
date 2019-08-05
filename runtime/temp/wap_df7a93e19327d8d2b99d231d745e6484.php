<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:84:"D:\web\Education\portals\template/index_style/default/plugins/signin/index/index.htm";i:1555325357;s:74:"D:\web\Education\portals\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo !empty($info)?$info['title']:$webdb['seo_title']; ?></title>
<meta name="keywords" content='<?php echo !empty($webdb['mseo_keyword'])?$webdb['mseo_keyword']:$webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo !empty($webdb['mseo_description'])?$webdb['mseo_description']:$webdb['seo_description']; ?>'>
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

<div class="qb_wap_header">
	<div class="L" onclick="window.history.back();"><i class="fa fa-reply"> 返回</i></div>
	<?php echo !empty($info)?$info['title']:$webdb['webname']; ?>
	<div class="R" onclick="window.location.href='<?php echo get_url('member'); ?>'"><i class="fa fa-user-circle-o"> 会员</i></div>
</div>



<link rel="stylesheet" href="/public/static/group/member.css">
<style>
	img{
		height: 120px;
		width: 120px;
		border-radius: 60px;
		border: 2px solid #ffdd33;
	}
	.lists{
		text-align: center;
	}
	
</style>
<div class="MainMemberBox ShowContentType" style="margin-top: 10px !important;">
	<div class='TopBox' style="display: flex;background-color: #EFEFEF;">
	  <div class='name sign_btn' style="margin: auto;width: 80%;border-radius: 45px;background: -webkit-linear-gradient(#07EBC8, #357BF5);background: -o-linear-gradient(#07EBC8, #357BF5);background: -moz-linear-gradient(#07EBC8, #357BF5);background: linear-gradient(#07EBC8, #357BF5);line-height: 45px;box-shadow: 5px 6px 4px #888888;"><i class="fa fa-calendar"></i> 立即签到</div>
<script type="text/javascript">
$(function(){
	$(".sign_btn").each(function(){
		var that = $(this);
		that.one("click",function(){
			var url="<?php echo purl('signin/api/sign',['id'=>$id,'type'=>$type],'index'); ?>";
			$.get(url,function(res){
				if(res.code==0){	//成功签到
					layer.alert(res.msg,{icon: 1,title:false});
					that.css('background','#888888');
					that.html('<i class="fa fa-calendar" style="color:red;">+' + res.data.money + '分</i>');
					setTimeout(function(){window.location.reload();},3000);
				}else if(res.code==1){	//已经签过了		
					layer.alert(res.msg);
				}else{
					layer.alert('未知错误');
				}
			}).fail(function(res){layer.alert('网页出错');});
		});

		var url="<?php echo purl('signin/api/check',['id'=>$id,'type'=>$type],'index'); ?>";
		$.get(url,function(res){
			if(res.code==0){
				//已经签到过了
				that.css('background','#888888');
				that.unbind("click");
				that.html('<i class="fa fa-calendar" style="color:#fff;"> 你已签到,请明天再来</i>');
				that.css('box-shadow','');
				that.css('width','100%');
				that.css('border-radius','0');
			}else{				
				//还没签到
			}
		});		
	});
});
</script>
	</div>

	<div class='ShowTypes' style="text-align: center;border-top: 1px solid #ccc;margin-top: 15px;">
	  <div class="ck">今日签到(<?php echo $today_num; ?>人)</div>
	  <div>昨日签到(<?php echo $yesd_num; ?>人)</div>
	</div>

	<div class='listmemberBox wap_signin_index001'>
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--wap_signin_index001		--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	    <div class='lists list<?php echo $rs['rank']; ?>' style="margin-bottom: 15px;">
	      <div class='icon'><a href="<?php echo get_url('user',$rs['uid']); ?>"><img src="<?php echo get_user_icon($rs['uid']); ?>" onerror="this.src='/public/static/images/nobody.gif'"></a></div>
	      <div class='infos'>
	        <div class='name'><div class='num'>NO.<?php echo $rs['rank']; ?></div><text><?php echo get_user_name($rs['uid']); ?></text></div>
	        <div class='more'>
	          <div class='iconfont'><i class="fa fa-database"></i>积分：<text><?php echo $rs['money']; ?>个</text></div>
	          <div class='time fa fa-clock-o'> <?php echo format_time($rs['create_time'],"H:i"); ?></div>
	        </div>
	      </div>
	    </div>
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $wap_signin_index001 = fun('label@run_label','wap_signin_index001',['union'=>'time,aid,sysid','time'=>$time,'aid'=>$id,'sysid'=>$type,'val'=>'','list'=>'rs','systype'=>'','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'plugins\signin\model\Member@get_label','order'=>'id','by'=>'asc','where'=>'time=$time&aid=$id&sysid=$type','whereor'=>'','sql'=>"",'js'=>'wap_signin_index001','cache_time'=>'0'  ]); ?>
	</div>
	<div class='listmemberBox'></div>
	<!--<div class="ShowMores"><span>查看更多</span></div>-->
</div>

<?php if(($info&&$info['uid']==$userdb['uid'])): ?>
<div   style="background:orange;width:40px;height:40px;line-height:40px;font-size:25px;bottom:70px;position:absolute;z-index:10;cursor:pointer;border-radius:100%;-moz-border-radius:100%;opacity:0.7;color:#fff;position:fixed;right:5px;text-align:center;" onclick="window.location.href='<?php echo purl('manage/set',['ext_id'=>$id,'ext_sys'=>$type],'member'); ?>'"><span class="fa fa-cog"></span></div>
<?php endif; ?>

<script type="text/javascript">

var ajax_url_db = ['&time=today','&time=y'];
var choose_i = 0; //选中第几项
var haveshowpage = []; //每一项,作个标志,已经已显示到第几页
    haveshowpage[0] = 1; //第一项就从第二页开始

//显示更多
function showMoreContent(){
	haveshowpage[choose_i]++;
	layer.load(1);
	$.get('<?php fun("label@label_ajax_url","wap_signin_index001",__FILE__); ?>' + haveshowpage[choose_i] + ajax_url_db[choose_i] ,function(res){
		layer.closeAll();
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
			}else{
				scroll_get[choose_i]  = true;
				if(haveshowpage[choose_i]==1){
					$('.ShowContentType .listmemberBox').eq(choose_i).html(res.data);
				}else{
					$('.ShowContentType .listmemberBox').eq(choose_i).append(res.data);
				}
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}


//切换显示
function showContentType(num){

	choose_i = num;
	//$('.ShowMores').off("click");	//先移除,避免重复加多次click事件
	//$('.ShowMores').on("click",showMoreContent);
	//$('.ShowMores span').html('查看更多');
	//$('.ShowMores').css({'background':'orange'});

	if(haveshowpage[num]==undefined){
		haveshowpage[num] = 0;
		showMoreContent();
	}

	$('.ShowContentType .ShowTypes div').removeClass('ck');
	$('.ShowContentType .ShowTypes div').eq(num).addClass('ck');
	$('.ShowContentType .listmemberBox').hide();
	$('.ShowContentType .listmemberBox').eq(num).show();
}
$('.ShowContentType .ShowTypes div').click(function(){
	showContentType( $(this).index() );
});
//showContentType(0);


//滚动显示更多
var scroll_get = [];
$(document).ready(function () {
	if(typeof(scroll_get[choose_i])=='undefined'){
		scroll_get[choose_i] = true;
	}
	$(window).scroll(function () {
		if (scroll_get[choose_i]==true &&  (200 + $(window).scrollTop())>($(document).height() - $(window).height())) {
			scroll_get[choose_i] = false;
			showMoreContent();
		}
	});
});

</script>
	
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