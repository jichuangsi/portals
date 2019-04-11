<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:74:"D:\web\Education\template/index_style/default/giftshop\content/pc_show.htm";i:1547462930;s:62:"D:\web\Education\template/index_style/toutiao/index/layout.htm";i:1554714292;s:65:"D:\web\Education\template\index_style\default\index\min_login.htm";i:1554707864;s:66:"D:\web\Education\template\index_style\default\cms\content\left.htm";i:1542155677;}*/ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><?php echo $info['title']; ?></title>
<meta name="keywords" content='<?php echo !empty($info['keywords'])?$info['keywords']:$info['title']; ?>  <?php echo $s_info['name']; ?> '>
<meta name="description" content='<?php echo get_word(del_html($info['content']),300); ?>'>
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


<link rel="stylesheet" href="/public/static/index/default/pclist.css">
<div class="ArticlMainContainer">
	<div class="LeftsCnt">
		<link rel="stylesheet" href="/public/static/index/default/left.css">
<div class="LeftBoxInfo">
	<ul class="sorts">
		<?php $_result=getArray(fun('Sort@son',intval($fid))?:fun('Sort@brother',$fid));if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$name): $mod = ($i % 2 );++$i;?>
			<li <?php if($key == $fid): ?>class='ck'<?php endif; ?>><a href="<?php echo urls('content/index',"fid=$key"); ?>"><?php echo $name; ?></a></li>
		<?php endforeach; endif; else: echo "" ;endif; ?>
	</ul>
	<div class="contact">
<?php if((modules_config('qun')&&$qun=fun('qun@getByuid',$info['uid'])[0])): ?>
		<div class="head">信息</div>
		<div class="cnt">
			<ul class="qq">
				<a href="<?php echo urls('qun/content/show',['id'=>$qun['id']]); ?>" style="color:red;" target="_blank"><img src="<?php echo tempdir($qun['picurl']); ?>" style="max-width:180px;" onerror="this.src='/public/static/images/nopic.png'">
				<br>
				<?php echo $qun['title']; ?></a>
			</ul>
			<ul class="time">
				<ol><i class="fa fa-bar-chart-o"></i> 信息</ol>
				<li>圈主：<a href="<?php echo get_url('user',$qun['uid']); ?>" target="_blank"><?php echo get_user_name($qun['uid']); ?></a></li>
				<li>粉丝：<?php echo $qun['usernum']; ?> 人</li>
				<li>人气：<?php echo $qun['view']; ?> 关注度</li>
			</ul>
			<ul class="tel">
				<ol><i class="glyphicon glyphicon-flag"></i> 联系方式</ol>
				<li>电话：<a href="tel:<?php echo $qun['telphone']; ?>"><?php echo $qun['telphone']; ?></a></li>
				<li>地址：<?php echo $qun['address']; ?></li>
			</ul>
		</div>
<?php else: ?>
		<div class="head">联系我们</div>
		<div class="cnt">
		<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--left_address001	text	-->
			<ul class="qq">
				<li><a title="程序购买咨询" href=" http://wpa.qq.com/msgrd?v=3&uin=2680867060&site=qq&menu=yes" target="_blank"><img SRC='http://wpa.qq.com/pa?p=1:2680867060:41' ></a></li>
				<li><a title="程序购买咨询" href=" http://wpa.qq.com/msgrd?v=3&uin=81684210&site=qq&menu=yes" target="_blank"><img SRC='http://wpa.qq.com/pa?p=1:81684210:41'></a></li>
			</ul>
			<ul class="time">
				<ol><i class="glyphicon glyphicon-time"></i> 工作时间</ol>
				<li>周一至周五：09:00-17:30</li>
				<li>周六至周日：10:00-16:00</li>
			</ul>
			<ul class="tel">
				<ol><i class="glyphicon glyphicon-headphones"></i> 联系电话</ol>
				<li>唐先生：<a href="tel:15603012345">15603012345</a></li>
			</ul>
		 QB--><?php endif; $left_address001 = fun('label@run_label','left_address001',['val'=>'','list'=>'rs','systype'=>'text','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
		</div>
	
<?php endif; ?>
	</div>
</div>
	</div>
	<div class="RightCnt">
             
		<!-----商品基本信息开始----->
		<link rel="stylesheet" href="/public/static/css/shopbaseinfo.css">
		<div class="Base_ShopInfo">
			<div class="ImgCnt">
				<div class="Shop_BigImg"><div></div></div>
				<div class="Shop_ListImgs">
					<ul></ul>
					<dl>
						<dt onclick="pravShowImg()"><i class="fa fa-angle-left"></i></dt>
						<dd onclick="nextShowImg()"><i class="fa fa-angle-right"></i></dd>
					</dl>
				</div>
			</div>
			<div class="InfoCnt">
				<h3><?php echo $info['title']; ?></h3>
				<ul>
					<li>发布时间：<span><?php echo date("Y-m-d H:i:s",$info['create_time']); ?></span></li>
					<li>现售价格：<span class="price"> &yen;<em><?php echo $info['price']; ?></em> </span></li>
					<li>所需积分：<span class="price"><?php echo $info['jifen']; ?> 个</em></span></li>
					<li>库存量：<span class="price"><?php echo $info['num']; ?> </em></span></li>
					<li>市场价格：<span class="price" style="text-decoration:line-through;">&yen; <?php echo $info['market_money']; ?> </span></li>					
				</ul>
				<div class="qb_ui_pc_select_shoptype">
<?php 
$field_array=get_field($info['mid']);
$array1=get_shop_type('type1',$info);
$array2=get_shop_type('type2',$info);
$array3=get_shop_type('type3',$info);
 if(!(empty($array1) || (($array1 instanceof \think\Collection || $array1 instanceof \think\Paginator ) && $array1->isEmpty()))): ?>
			<ul class="shoptype1">
				<ol><?php echo $field_array['type1']['title']; ?></ol>
				<li>
				<?php if(is_array($array1) || $array1 instanceof \think\Collection || $array1 instanceof \think\Paginator): $i = 0; $__LIST__ = $array1;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<div data-price="<?php echo $rs['price']; ?>"><?php echo $rs['title']; ?></div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
				</li>
			</ul>
<?php endif; if(!(empty($array2) || (($array2 instanceof \think\Collection || $array2 instanceof \think\Paginator ) && $array2->isEmpty()))): ?>
			<ul class="shoptype2">
				<ol><?php echo $field_array['type2']['title']; ?></ol>
				<li>
				<?php if(is_array($array2) || $array2 instanceof \think\Collection || $array2 instanceof \think\Paginator): $i = 0; $__LIST__ = $array2;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<div><?php echo $rs['title']; ?></div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
				</li>
			</ul>
<?php endif; if(!(empty($array3) || (($array3 instanceof \think\Collection || $array3 instanceof \think\Paginator ) && $array3->isEmpty()))): ?>
			<ul class="shoptype3">
				<ol><?php echo $field_array['type3']['title']; ?></ol>
				<li>
				<?php if(is_array($array3) || $array3 instanceof \think\Collection || $array3 instanceof \think\Paginator): $i = 0; $__LIST__ = $array3;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
					<div><?php echo $rs['title']; ?></div>
				<?php endforeach; endif; else: echo "" ;endif; ?>
				</li>
			</ul>
<?php endif; ?>
			<dl style="display:none;">
				<dt>购买数量</dt>
				<dd class="chnageBuyNum">
					<span class="fa fa-minus"></span>
					<div><input type="text" value="1"/></div>
					<em class="fa fa-plus"></em>
				</dd>
			</dl>
			<div class="butters">
				<span><button onclick="BuyThisShop(3)">立即兑换</button></span>
				<!--<em><button onclick="BuyThisShop(1)">加入购物车</button></em>-->
			</div>			
		</div>
		<script>
			var type1=0;
			var type2=0;
			var type3=0;
			var shopnum=1;
			var shopprice="<?php echo $info['price']; ?>";
			$('.shoptype1 li div').click(function(){
				$('.shoptype1 li div').removeClass('ck');
				$(this).addClass('ck');
				type1=$(this).index()+1;
				var thisprice = $(this).data('price');
				if(thisprice>0){
					$('.Base_ShopInfo .InfoCnt .price em').html(thisprice);
				}else{
					$('.Base_ShopInfo .InfoCnt .price em').html(shopprice);
				}
			});
			$('.shoptype2 li div').click(function(){
				$('.shoptype2 li div').removeClass('ck');
				$(this).addClass('ck');
				type2=$(this).index()+1;
			});
			$('.shoptype3 li div').click(function(){
				$('.shoptype3 li div').removeClass('ck');
				$(this).addClass('ck');
				type3=$(this).index()+1;
			});
			$('.chnageBuyNum em').click(function(){
				shopnum++;
				$('.chnageBuyNum div input').val(shopnum);
			});
			$('.chnageBuyNum span').click(function(){
				shopnum--;
				if(shopnum<1){
					layer.alert('购买数量不能小于1');
					shopnum=1;
				}
				$('.chnageBuyNum div input').val(shopnum);
			});

			function check_login(){
				if("<?php echo $userdb['uid']; ?>"==""){
					layer.confirm('你还没登录,不能购买,你要登录吗？', {
						btn : [ '登录', '取消' ]
					}, function(index) {
						window.location.href = "<?php echo get_url('login'); ?>";
					}); 
					return false;
				}
				return true;
			}

			function BuyThisShop(totype){
				if(check_login()!==true)return ;
				if((type1==0&&$(".shoptype1").length>0)||(type2==0&&$(".shoptype2").length>0)||(type3==0&&$(".shoptype3").length>0)){
					layer.alert('没有选择商品类型');
				}else{
					var gotourl="<?php echo urls('car/add'); ?>?shopid=<?php echo $id; ?>&type1="+type1+"&type2="+type2+"&type3="+type3+"&num="+shopnum;
					$.get(gotourl+"&"+Math.random(),function(res){
						if(res.code==0){			
							if(totype==1){
								layer.msg('成功加入购物车');
							}else if(totype==3){
								window.location.href="<?php echo urls('order/add'); ?>";
							}else{
								window.location.href="<?php echo urls('car/index'); ?>";
							}
						}else{
							layer.alert('出错了:'+res.msg);
						}
					});					
				}				
			}
			$('.chnageBuyNum div input').change(function(){
				shopnum=parseInt($(this).val());
				if(shopnum<1){
					layer.alert('购买数量不能小于1');
					shopnum=1;
					$(this).val(shopnum);
				}
			});
		</script>
			</div>
		</div>
		<script>
		var shopimgs=[
		<?php if(is_array($listdb) || $listdb instanceof \think\Collection || $listdb instanceof \think\Paginator): $i = 0; $__LIST__ = $listdb;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
		'<?php echo $rs['picurl']; ?>',
		<?php endforeach; endif; else: echo "" ;endif; ?>
		];
		</script>
		<script type="text/javascript" src="/public/static/js/shopimgs.js"></script>
		<!-----商品基本信息结束----->
		<link rel="stylesheet" href="/public/static/css/shopotherinfo.css">
		<div class="Other_ShopInfo">
			<div class="changetypes">
				<span>产品详情</span>
				<span>相关评论</span>
				<span>注意事项</span>
			</div>
			<div class="showtypes">
				<div class="Cnt qb_ui_ShowContent"><?php echo $info['content']; ?></div>
				<div class="Cnt">
					<!--引用评论碎片模板common\view\comment\shoppc01.htm每页显示3条评论-->
					<?php if(defined('LABEL_DEBUG')): ?><!--COMMENT<!--commentshoppc01		comment/pc01--> COMMENT--><?php endif; fun('label@run_comment_label','commentshoppc01',$info,['sysid'=>$sysid,'aid'=>$id,'status'=>'','dirname'=>__FILE__,'tpl'=>'comment/pc01','cache_time'=>'0','rows'=>'5','where'=>'','order'=>'','by'=>'']); ?>
				</div>
				<div class="Cnt qb_ui_ShowContent"><?php if(defined('LABEL_DEBUG')): ?><!--QB <!--shop_notice_001	text	-->如果商品同时设置价格的话,那么即要消费积分,还要支付相应的金额! QB--><?php endif; $shop_notice_001 = fun('label@run_label','shop_notice_001',['val'=>'','list'=>'rs','systype'=>'text','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?></div>
			</div>
		</div>
		<script>
			function changeShow(i){
				$('.changetypes span').removeClass('ck');
				$('.changetypes span').eq(i).addClass('ck');
				$('.showtypes .Cnt').hide();
				$('.showtypes .Cnt').eq(i).fadeIn();
			}
			changeShow(0);
			$('.changetypes span').click(function(){
				changeShow($(this).index());
			});
		</script>
	</div>	
</div>

<!-- 微动态自动收录用户感兴趣的主题,时间60代表用户停留60秒将自动收藏 -->
<?php echo fun('sns@fav',$info,60,'系统帮你订阅了本主题,下次本主题有回复,将会通知你'); ?>


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