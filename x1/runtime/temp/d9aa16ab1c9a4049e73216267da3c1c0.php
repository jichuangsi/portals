<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:52:"D:\web\x1/application/common/builder/sort/layout.htm";i:1519964959;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>选择栏目</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="stylesheet" href="/public/static/css/base.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>
</head>
<body>
<style>
body{
	background: #F7F7F7;
}
.ChooseSort{
	padding: 30px;
}
.ChooseSort dl dt{
	display: inline-block;
	line-height: 45px;
	background: #32BD8B;
	padding: 0 20px;
	color: #FFF;
	font-size: 18px;
	word-spacing: 5px;
}	
.ChooseSort dl dd{
	padding: 20px;
	background: #FFF;
	box-shadow:2px 2px 2px #DDD;
}
.ChooseSort dl dd ul li{
	height:45px;
	line-height: 45px;
	overflow: hidden;
	border-bottom: #EEE solid 1px;
}
</style>
<div class="ChooseSort">
	<dl>
		<dt><i class="fa fa-arrow-right"></i> 选择栏目</dt>
		<dd>
			<ul>
			<?php if(is_array($sort_list) || $sort_list instanceof \think\Collection || $sort_list instanceof \think\Paginator): $i = 0; $__LIST__ = $sort_list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>		
				<li><a href="<?php echo auto_url('add',['fid'=>$vo['id']]); ?>"><?php echo $vo['title_display']; ?></a></li>				 
			<?php endforeach; endif; else: echo "" ;endif; ?>
			</ul>
		</dd>
	</dl>
</div>
</body>
</html>