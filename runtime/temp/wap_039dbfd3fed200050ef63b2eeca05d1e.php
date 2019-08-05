<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:71:"D:\web\Education\portals\template/index_style/default/hy\cms\index2.htm";i:1561028404;s:74:"D:\web\Education\portals\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;s:72:"D:\web\Education\portals\template\index_style\default\hy\common\head.htm";i:1561028404;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $info['title']; ?> <?php echo M('name'); ?></title>
<meta name="keywords" content='<?php echo $webdb['seo_keyword']; ?>'>
<meta name="description" content='<?php echo $webdb['seo_description']; ?>'>
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



<link rel="stylesheet" href="/public/static/group/index.css">
<div class="MainContainer">
<!--包含的文件在此目录/template/index_style/default/hy/common/-->
	<div class="ListBox">
		<div class="list">
			<ul>
				<li class="img"><a href="<?php echo urls('content/show',['id'=>$info['id']]); ?>"><img src="<?php echo $info['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"></a></li>
				<li class="info">
					<div class="title"><a href="<?php echo urls('content/show',['id'=>$info['id']]); ?>"><?php echo $info['title']; ?></a></div>
					<div class="cnt">商铺人气：<span><?php echo $info['view']; ?></span></div>
					<div class="other">
						<span><i class="fa fa-fw fa-phone-square"><a href="tel:<?php echo $info['telphone']; ?>"><?php echo $info['telphone']; ?></a></i></span>
						 
					</div>
				</li>
				<li class="join">
					<dl>
						<dt><span onclick="addpost()">发布</span></dt>
						<dd class="MorePost">
							<em><i class="fa fa-angle-up"></i></em>
							<div>
							<a href="<?php echo murl('shop/content/add',['mid'=>1,'ext_id'=>$info['id']]); ?>">商品</a>
							<a href="<?php echo urls('cms/add',['aid'=>$info['id'],'mid'=>1]); ?>">资讯</a>
							<a href="<?php echo urls('cms/add',['aid'=>$info['id'],'mid'=>2]); ?>">图片</a>
							<a href="<?php echo urls('bbs/add',['aid'=>$info['id']]); ?>">话题</a>
							</div>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
<script type="text/javascript">
function joinGroup(id){
	$.get("<?php echo urls('wxapp.member/join',['id'=>$info['id']]); ?>?"+Math.random(),function(res){
		if(res.code==0){
			layer.alert("加入成功！");
		}else{
			layer.alert("加入失败:"+res.msg);
		}	
	});
}
</script>
	<div class="MainAction">
		<ul>
			<ol><a href="#" onclick="joinGroup(<?php echo $id; ?>)"><i class="fa fa-object-ungroup"></i> 加入会员</a></ol>
			<li><a href="<?php echo urls('cms/add',['mid'=>2]); ?>"><i class="fa fa-user-plus"></i> 发布图片</a></li>
		</ul>
	</div>
	<div class="ShowContentType">
		<div class="tags"><span class="ck">最新图片</span><span>热门图片</span><span>推荐图片</span></div>
		<div class="Contents">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_wapindex_model002	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="imgs"><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"></span><em><?php echo $rs['title']; ?></em></a></div>
			  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_wapindex_model002 = fun('label@run_label','hy_wapindex_model002',['union'=>'order,by,ext_id','order'=>$order,'by'=>$by,'ext_id'=>$aid,'val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'6','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0' ,'mid'=>'2' ]); ?>
		</div>
		<div class="Contents"></div>		
		
		<div class="Contents"></div>			
		
		<div class="ShowMores"><span>查看更多</span></div>
	</div>
</div>

<script type="text/javascript">
var ajax_url_db = ['&order=id&by=desc&','&order=view&by=desc&','&order=status&by=desc&'];
var choose_i = 0; //选中第几项
var haveshowpage = []; //每一项,作个标志,已经已显示到第几页
//    haveshowpage[0] = 1;

//显示更多
function showMoreContent(){	
	var url = ajax_url_db[choose_i];	//第几项对应的网址
	haveshowpage[choose_i]++;
	$.get('<?php fun("label@label_ajax_url","hy_wapindex_model002",__FILE__); ?>' + haveshowpage[choose_i] + url + Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.ShowMores').off("click");
				$('.ShowMores span').html('显示完了');
				$('.ShowMores span').css({'background':'#eee'});
			}else{
				if(haveshowpage[choose_i]==1){
					$('.ShowContentType .Contents').eq(choose_i).html(res.data);
				}else{
					$('.ShowContentType .Contents').eq(choose_i).append(res.data);
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
	$('.ShowMores').off("click");	//先移除,避免重复加多次click事件
	$('.ShowMores').on("click",showMoreContent);
	$('.ShowMores span').html('查看更多');

	if(haveshowpage[num]==undefined){
		haveshowpage[num] = 0;
		showMoreContent();
	}

	$('.ShowContentType .tags span').removeClass('ck');
	$('.ShowContentType .tags span').eq(num).addClass('ck');
	$('.ShowContentType .Contents').hide();
	$('.ShowContentType .Contents').eq(num).show();
}
$('.ShowContentType .tags span').click(function(){
	var thisnum=$(this).index();
	showContentType(thisnum);
});
showContentType(0);

function addpost(){
	var obj = $('.MorePost');
	obj.is(':hidden') ? obj.show() : obj.hide();
}
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