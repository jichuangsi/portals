<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:81:"D:\web\Education\template/member_style/default/plugins/marketing/rmb/getmoney.htm";i:1546956247;s:73:"D:\web\Education\template/member_style/21syx_member/member/wap_layout.htm";i:1548153004;s:64:"D:\web\Education\template\index_style\default\index\footmenu.htm";i:1547610832;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no" />
<meta name="apple-mobile-web-app-status-bar-style" content="black"  />
<meta name="apple-mobile-web-app-capable" content="yes">
<title>充值</title>

<link rel="stylesheet" href="/public/static/layui/css/layui.css" media="all">
<link rel="stylesheet" href="/public/static/layui/css/admin.css" media="all">


<link rel="stylesheet" type="text/css" href="/public/static/member/default/wap/global.css">
<link rel="stylesheet" type="text/css" href="/public/static/member/default/wap/wap.css">
<link rel="stylesheet" type="text/css" href="/public/static/css/wapmember.css">

<link rel="stylesheet" href="/public/static/css/qb_ui.css">
<link rel="stylesheet" href="/public/static/icon/icon.css">
<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript" src="/public/static/layer/layer.js"></script>

</head>
<body>


<div class="qb_header">
	<div class="goback"><a href="#" onClick="window.history.back();" class="fa fa-reply"> 返回</a></div>
    <div class="web"></div>
    <div class="member"><a href="/member.php" class="fa fa-user-circle"></a></div>
</div>




<div class="WapFormContainer">
	<div class="tag">提现 <?php if($getout_percent_money>0): ?>(手续费<span style="color:red;"><?php echo $getout_percent_money; ?>%</span>)<?php endif; ?></div>
	<form name="form1" method="post" action="">
		<ul>
			<ol>可用余额:</ol>
			<li><span class="b red"><?php echo $userdb['rmb']; ?></span>元 </li>
		</ul>
		<ul>
			<ol>提现金额为:(<span class="red">*</span>)</ol>
			<li><input type="text" name="money" placeholder="输入金额"/></li>
		</ul>
		<ul>
			<ol>支付密码:(<span class="red">*</span>)</ol>
			<li><input type="password" name="pwd" placeholder="输入密码"/></li>
		</ul>
		<dl>
            <dt>请选择提现到哪个收款帐户:(<span class="red">*</span>)</dt>
            <dd>
<?php if(!(empty($userdb['weixin_api']) || (($userdb['weixin_api'] instanceof \think\Collection || $userdb['weixin_api'] instanceof \think\Paginator ) && $userdb['weixin_api']->isEmpty()))): ?>
				<div><input type="radio" name="banktype" value="weixin 微信钱包" checked="true">微信钱包 (强烈推荐,即绑定登录的微信)</div>
<?php endif; if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
              <div><input type="radio" name="banktype" value="<?php echo $rs; ?>"><?php echo $rs; ?></div>
<?php endforeach; endif; else: echo "" ;endif; ?>
          	</dd>     
      	</dl>
      	<ul>
			<ol>收款人真实姓名:(<span class="red">*</span>)</ol>
			<li><input type="text" name="truename" placeholder="输入姓名"/></li>
		</ul>
		<ul>
			<ol>联系电话:(选填)</ol>
			<li><input type="text" name="tel" placeholder="输入电话"/></li>
		</ul>
		<dl>
	        <dt>提现备注:(选填)</dt>
	        <dd><textarea name="why" placeholder="输入备注内容"></textarea></dd>
	    </dl>
	    <div class='butter'>
            <button type="submit">提交</button>
            <input type="hidden" name="step" value="2">            
        </div>
        <dl>
			<dt>注意事项</dt>
			<dd>
				<div>1.提现最低金额不小于<span style="color:red;font-weight:bold;"><?php echo (isset($webdb['min_getout_money']) && ($webdb['min_getout_money'] !== '')?$webdb['min_getout_money']:50); ?></span>元,才可提现。<?php if($getout_percent_money>0): ?>提现会从申请的金额当中扣除 <span style="color:red;font-weight:bold;"><?php echo $getout_percent_money; ?>%</span> 作为手续费.<?php endif; ?></div>
			  	<div>2.提现金额将会被冻结不可用.推荐选择微信钱包</div>
				<div>3.资料提交后,需人工审核,要1-3天时间处理(遇节假日会延长),请耐心等待.</div>
				<?php if($webdb['getout_need_join_mp']): ?><div>4.提现需要先关注公众号，以方便接收提现动态提醒。</div><?php endif; if(($webdb['getout_need_join_mp'] && $webdb['mp_code_img'])): ?><div><img style="max-width:80%;" src="<?php echo tempdir($webdb['mp_code_img']); ?>"></div><?php endif; ?>
		  	</dd>          
        </dl>
	</form>
</div>


<div class="CopyRight">
  <p>@<?php echo $webdb['webname']; ?> 版权所有</p>
  <p><?php echo $webdb['miibeian_gov_cn']; ?></p>
</div>

 <!--<link rel="stylesheet" href="/public/static/index/default/footer.css">--> 
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
<?php $menu_choose=config('system_dirname')?:(ENTRANCE==='member'?'member':'index'); $_result=fun('page@foot_menu');if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li style="position:relative;"><a href="<?php echo $rs['url']; ?>" <?php if(($rs['activate']==$menu_choose||$rs['activate']==$menu_choose.'-'.$fid)): ?>style="color:#FFDD33;"<?php endif; ?>><i class="<?php echo (isset($rs['style']) && ($rs['style'] !== '')?$rs['style']:'glyphicon glyphicon-star'); ?>"></i><span><?php echo $rs['name']; ?></span></a>
			<?php if(strstr($rs['url'],'weibo/content/show/id/0')): ?><dd  style="color:#fff;background:orange;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="weibo_msg_num">0</dd><?php endif; if(strstr($rs['url'],'member.php/member/index.html')): ?><dd  style="color:#fff;background:red;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="msg-num">0</dd><?php endif; if(strstr($rs['url'],'member.php/tongji/msg/index.html')): ?><dd  style="color:#fff;background:orange;position:absolute;right:5px;top:5px;font-size:10px;line-height:12px;padding:2px;border-radius:4px;display:none;" class="tongji-num">0</dd><?php endif; ?>
			</li>
<?php endforeach; endif; else: echo "" ;endif; ?>

		</ul>
	</div>
</div>


  


<script type="text/javascript" src="/public/static/js/qibo.js"></script>
<script src="/public/static/layui/layui.js"></script>

 
<script type="text/javascript">
layui.use(['form','element'], function(){
  var form = layui.form;
  var element = layui.element;
});
</script>


</body>
</html>