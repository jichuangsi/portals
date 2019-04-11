<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"D:\web\Education\template/index_style/default/search\index\lists.htm";i:1548400257;s:66:"D:\web\Education\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo $keyword; ?> - 搜索结果</title>
<meta name="keywords" content='<?php echo $webdb['mseo_keyword']; ?>'>
<meta name="description" content='<?php echo $webdb['mseo_description']; ?>'>
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



<style> 
 .searchbox{height:36px;margin:5px 10px;clear:both;border:1px solid #fc8c1d;position:relative;overflow:hidden;top: 0px;}
.searchbox form{height:38px}
.searchbox .q{display:block;background:#EFEFEF;width:auto;width:95%;height:38px;font-size:16px;color:#333;margin:0;padding:0 0 0 10px;border:0;line-height:38px;border:0;border-right:0;margin-right:20px}
.searchbox .btn{width:55px;height:38px;line-height:38px;border:0;background-color:#fc8c1d;cursor:pointer;display:block;color:#FFF;text-align:center;font-size:16px;position:absolute;top:0;right:0;-webkit-appearance:none;border-radius:0}
.searchbox .btn:hover{background-color:#fc9f38;-webkit-appearance:none;border-radius:0}
#hd_main{margin:55px 0 10px 0;padding:5px 10px 7px 10px;overflow:hidden;clear:both;position:relative;background-color:#EFEFEF;padding-bottom:15px;background-color:#EFEFEF}
#hd_main h1{display:inline;color:#F00}
#resinfo{margin-bottom:10px;color:#999;height:22px;line-height:22px}
#resinfo .fr i{font-style:normal;border-bottom:1px solid #f76007;color:#f76007;line-height:22px;display:inline-block;float:left;margin-right:10px;padding:0 2px}
#resinfo .fr a.wt{display:inline-block;float:left;margin-right:10px}
#resinfo em{color:#2eb50c}
.jc{margin-bottom:8px;display:block}
.res{word-break:break-all;margin-right:0;padding-top:10px;overflow:hidden;font-family:arial}
.res .g h2{font-size:16px;font-weight:normal;margin:0 0 6px 0;overflow:hidden;}
.res .g h2 a{color:#2d374b;font-weight: bold;}
.res .g h2 a:hover{background-color:#f5f5f5}
/*.res .g h2 a:visited{color:#551a8b}*/
.res em{color:#d00;font-style:normal}
.res .g{margin-right:5px;font-size:14px;overflow:hidden;margin-bottom:7px;padding:3px 5px 3px 0;margin-left:0;border-bottom: 1px solid #ccc;margin-bottom: 10px;}
.res .g span.a{color:#008000}
.res .g .view{margin:0 0 0 10px;color:#069;text-decoration:underline;font-size:12px;cursor:pointer}
.res span.num{font-size:16px;margin-right:5px}
.res span.nums{font-size:16px}
.res .std{line-height:150%;font-size:13px}
.res .g strong{color:#F00}
.res .g .std{overflow:hidden;color: #666;font-size: 12px;}
.res .g .pic{width:109px;height:82px;float:left;display:inline;overflow:hidden;margin-right:7px}
.res .g .pic a{width:107px;height:80px;border:1px solid #CCC;display:block}
.res .g .pic a:hover{border:1px solid #F90}
.res .g .listimg img{width:107px;height:80px;margin-right:6px}
.res .g .listimg{float:left;display:none}
#stips{display:none;font-size:16px;margin:15px 0 5px 10px}
#stips em{color:#d00;text-decoration:underline}
.res .g b{color:#d00;font-weight:normal}
.xglist{clear:both;margin:10px 0;padding:10px;background-color:#efefef}
.xglist h4{line-height:30px;font-size:14px;font-weight:bold}
.xglist li{width:150px;float:left;display:inline-block;margin:5px}
.xglist li a{color:#06C;font-size:14px}
.xglist li a:hover{text-decoration:none;background-color:#03C;color:#FFF}
#sopage{text-align:center;margin:10px auto;clear:both；}
#sopage a{border:1px solid #e5e5e5;margin:0 3px;text-decoration:none;font-size:16px;line-height:30px;height:30px;width:30px;text-align:center;color:#03c;font-weight:normal;margin-top:3px;outline:0;overflow:hidden;display:inline-block;float:left}
#sopage a:hover{border:1px solid #f7af84;background-color:#fff;color:#f54a07}
#sopage a.this{border:1px solid #e5e5e5;background-color:#edecec;color:#f73306}
#sopage .n{width:62px}
#plus{margin-bottom:7px;font-size:14px;border:1px dashed #f0fbf1;background-color:#fcfbef;padding:8px}
.bdsug_copy{display:none}
.body_Hearcont{
	display: flex;
}
.top_searchbox{
	display: flex;
	justify-content: center;
	width: 100%;
	margin: auto;
}
.top_searchbox button{
	background-color: rgba(0,0,0,0);
	border: 0;
}
</style>
<!--<div class="searchbox">
  <form action="<?php echo url('search/index/lists'); ?>" method="get">
    <input align="middle" name="keyword" class="q" id="kw" value="<?php echo $keyword; ?>" maxlength="1000" baiduSug="1" autocomplete="off" x-webkit-speech />
    <input id="btn" class="btn" align="middle" value="搜索" type="submit" />
  </form>
</div>-->
<div id="hd_main">
<div class="res">
  <div id="result"> <?php if(is_array($lists) || $lists instanceof \think\Collection || $lists instanceof \think\Paginator): $i = 0; $__LIST__ = $lists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
    <div class="g">
      <h2><a href="<?php echo url($rs['module'].'/content/show',['id'=>$rs['id']],'html',true); ?>" class="s" rel="nofollow"><?php echo $rs['title']; ?></a></h2>
      <div class="std" onclick="window.location.href='<?php echo url($rs['module'].'/content/show',['id'=>$rs['id']],'html',true); ?>'"><?php echo get_word($rs['des'],184); ?></div>
      <!--<span class="a"><?php echo url($rs['module'].'/content/show',['id'=>$rs['id']],'html',true); ?><?php echo $rs['picurl']; ?></span>-->
    </div>
    <?php endforeach; endif; else: echo "" ;endif; ?>
    <div id="moredata"></div>
    <div id="morebtn" style="height:30px; border:1px solid #CCC; background-color:#EDEAEA; text-align:center; line-height:30px; cursor:pointer; overflow:hidden;" onclick="moreData()">点击加载下一页↓</div>
    <div class="cl10"></div>
    <input name="pagenum" id="pagenum" type="hidden" value="<?php echo $page==0 ? '2' : '$page'; ?>" />
    <div class="cl10"></div>
    <div class="cl5"></div>
    <script>
	$(function(){
		$('.body_Hearcont').html('<div class="top_searchbox"><button onclick="window.history.back();" type="button" style="width: 10%;color: #fff;"><i class="fa fa-chevron-left" aria-hidden="true"></i></button> <form style="width: 88%;display: inline;" action="<?php echo url('search/index/lists'); ?>" method="get"><input style="opacity: 0.8;;width: 80%;padding: 4px 0px;border-radius: 8px;border: none;outline: none;text-indent: 8px;" align="middle" name="keyword" class="q" id="kw" value="<?php echo $keyword; ?>" maxlength="1000" baiduSug="1" autocomplete="off" x-webkit-speech /><button type="submit" style="padding: 5px;color: #fff;">搜索</button> </form></div>');
	});
</script>
    <script type="text/javascript">
function moreData(){ 
      var pagenum = parseInt($("#pagenum").val());
	    $("#morebtn").html('加载中...');
		$.get("<?php echo url('search/index/lists'); ?>", {keyword: '<?php echo $keyword; ?>',page: pagenum,wap:'1'},
		 function(data){
			if(data.indexOf('NONO_NO_NONO')>0){
			  layer.msg("已经显示完了！",{time:500});
				$('#morebtn').attr('onclick','');
				$('#morebtn').html('显示完了');
		   }else{
			   if($("#imgload").val()=='b'){
			      data = data.replace(/n\./g,'n1.');
			   }
			   $("#morebtn").html('点击加载下一页↓');
			  $("#moredata").append(data);
		      $("#pagenum").val(pagenum+1); 
		   }
	});
}
</script> 
  </div>
  <!--result-->
  <div class="cl10"></div>
  <div class="searchbox">
    <form action="<?php echo url('search/index/lists'); ?>" method="get">
      <input align="middle" name="keyword" class="q" id="kw" value="<?php echo $keyword; ?>" maxlength="100" autocomplete="off" x-webkit-speech />
      <input id="btn" class="btn" align="middle" value="搜索" type="submit" />
    </form>
  </div>
  <div class="cl10"></div>
  <div class="xglist">
    <h4>实时热搜</h4>
    <ul>
      <?php if(is_array($resou) || $resou instanceof \think\Collection || $resou instanceof \think\Paginator): $k = 0; $__LIST__ = $resou;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($k % 2 );++$k;?>
      <li><a href="<?php echo url('search/index/lists','html',true); ?>?keyword=<?php echo $rs['keyword']; ?>"><?php echo $rs['keyword']; ?></a></li>
      <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    <div class="cl"></div>
  </div>
</div>
	
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