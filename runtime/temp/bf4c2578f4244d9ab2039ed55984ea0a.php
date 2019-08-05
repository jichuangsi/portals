<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:74:"D:/web/Education/portals/template/index_style/default/index/pc_success.htm";i:1524787443;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="/public/static/css/pc_reset.css">
<link rel="stylesheet" type="text/css" href="/public/static/others/refreshto.css">
<title>跳转提示</title>
<meta http-equiv="X-UA-Compatible" content="IE=8"><!-- 强制ie8,for 360 -->
<meta charset="utf-8">
</head>
<body>
<div class="ContBox">
	<div class="Noteword">
		<p>网页正在跳转当中,请稍候...</p>
		<p><?php echo(strip_tags($msg));?></p>
	</div>
	<div class="other">
		<a id="href" href="<?php echo($url);?>">页面自动跳转(<em id="wait"><?php echo($wait);?></em>)</a>
	</div>
</div>
<script>
(function(){
    var wait = document.getElementById('wait'),
        href = document.getElementById('href').href;
    var interval = setInterval(function(){
        var time = --wait.innerHTML;
        if(time <= 0) {
            location.href = href;
            clearInterval(interval);
        };
    }, 1000);
})();
</script>
</body>
</html>