<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:72:"D:\web\Education\portals\template/index_style/default/hy\index\index.htm";i:1564971252;s:74:"D:\web\Education\portals\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo !empty($webdb['mseo_title'])?$webdb['mseo_title']:$webdb['seo_title']; ?></title>
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



<link rel="stylesheet" href="/public/static/hy/assets/style/index.css">
    <link rel='stylesheet' href='/public/static/hy/assets/style/reset_android.css'>
    <script src="/public/static/hy/assets/js/reset.js"></script>
     <script src="/public/static/hy/assets/js/qrcode.js"></script>
    <style>
    	.body_Hearcont{
    		display: none !important;
    	}
    	.body_Footcont{
    		display: none !important;
    	}
    </style>
<!--幻灯片开始---->
<div class="top">
        <div class="top_box">
            <div class="top_left">
                <select>
                    <option value="广州">广州</option>
                    <option value="中山">中山</option>
                    <option value="南海">南海</option>
                </select>
            </div>
            <div class="top_center">
                <i class="fa fa-search"></i>
                <input type="text" placeholder="请输入关键字">
            </div>
            <div class="top_right">···</div>
        </div>
        <div class="nav">
            <div class="navbox">
                <div class="check" onclick="navclick(this)">推荐</div>
                <div onclick="navclick(this)">分类</div>
            </div>
            <span class="navbottom"></span>
        </div>
        <div class="Carousel">
            <img src="/public/static/hy/assets/images/advertisement_1.png" alt="">
        </div>
        <div class="tab">
            <div class="tab_left">
                <span>
                    <img src="/public/static/hy/assets/images/orangeicon.png" alt="">
                    <img src="/public/static/hy/assets/images/curriculumicon.png" alt="">
                </span>
                精品课程
            </div>
            <div class="tab_right">
                <span>
                    <img src="/public/static/hy/assets/images/blueicon.png" alt="">
                    <img src="/public/static/hy/assets/images/keicon.png" alt="">
                </span>
                好课分享
            </div>
        </div>
    </div>
    <?php echo '<script>var retest; </script>'; ?>
    <div class="center">
        <div class="center_img">
            <img src="/public/static/hy/assets/images/advertisement_2.png" alt="">
        </div>
        <h3 onclick="ssrr()">推荐机构</h3>
        <div class="curriculum">
        	<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_wapindex002	hy	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	            <div class="ListBox">
	                <div class="box" onclick="window.location.href='<?php echo $rs['url']; ?>'">
	                    <div class="listtop" style="display: flex;"> <img src="http://192.168.31.123:82/public/<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"  /> </div>
	                    <div class="listbottom">
	                        <div class="title"><?php echo $rs['title']; ?></div>
	                        <div class="text"><?php echo $rs['content']; ?></div>
	                        <div class="star">
	                            <img src="/public/static/hy/assets/images/Stars.png" alt="">
	                            <img src="/public/static/hy/assets/images/Stars.png" alt="">
	                            <img src="/public/static/hy/assets/images/Stars.png" alt="">
	                        </div>
	                         <script>
//	                        	console.log(<?php echo $rs['domainname']; ?>);
					        	function ssr(domainname){
					        		if(domainname!=undefined&&domainname!=null&&domainname!=''){
						        		$.ajax({
										    url:domainname+"/index.php/api/course/recommendQuery",
										    type:"GET",
										    async:false,
										    success:function(res){
										    	 var datas=JSON.parse(res);
										        console.log(datas);
										        var listdata=datas.data;
										        for(var i in listdata){
										        	retest+='<div class="ListBox">';
										        	retest+=' <div class="box">';
										        	retest+='<div class="listtop"><img src="'+domainname+listdata[i]['imageurl']+'" onerror="errorImg(this)"   /></div>';
										        	retest+='<div class="listbottom">';
										        	retest+=' <div class="title">'+listdata[i]['title']+'</div>';
										        	retest+=' <div class="text">哒哒哒哒哒哒</div>';
										        	retest+=' <div class="star">点击次数 : '+listdata[i]['view']+'</div>';
										        	retest+=' <div class="money">¥ '+listdata[i]["price"]+'</div>';
										        	retest+='</div>';
										        	retest+='<div class="Sold">已售'+listdata[i]['sold']+'</div>';
										        	retest+=' <div class= "go"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></div>';
										        	retest+=' <div class="img" id="qr'+listdata[i]['id']+'"></div>';
										        	retest+=' </div> </div>';
										        }
//										        sessionStorage.setItem('asd',retest)
										    }
										});	
									}
					        	}
					        </script>
	                        <div class="money"><script>ssr('<?php echo $rs['domainname']; ?>')</script></div>
	                    </div>
	                    <div class="Sold">已售177</div>
	                    <div class="go"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></div>
	                </div>
	            </div>
              <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_wapindex002 = fun('label@run_label','hy_wapindex002',['val'=>'','list'=>'rs','systype'=>'hy','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'','order'=>'status','by'=>'desc','where'=>'istop=1','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
        </div>
        <div onclick="window.location.href='/index.php/hy/content/index/fid/9.html'" style="width: 100%;height: 1rem;display: flex;"><div style="margin: auto;background: #FF8522;width: 2.16rem;height: 0.66rem;text-align: center;border-radius: 0.1rem;line-height: 0.66rem;color: #FFFFFF;font-size: 0.3rem;">MORE</div></div>
        <script>
        	function errorImg(imgs){
        		imgs.src = "/public/static/images/nopic.png"; imgs.onerror = null; 
        	}
        	function ssrr(domainname){
        		console.log(domainname);
        		$.ajax({
				    url:"http://192.168.31.108:92/index.php/api/course/recommendQuery",
				    type:"GET",
				    success:function(data){
				    	 var datas=JSON.parse(data);
				        console.log(datas);
				    }
				});	
        	}
        </script>
        <script>
        	$(function(){
        		$('#curriculums').append(retest);
        	});
        </script>
        <h3>推荐课程</h3>
        <div class="curriculum" id="curriculums">
        </div>
        
        
        
        <h3>行业信息</h3>
        <?php if(defined('LABEL_DEBUG')): ?><!--QB <!--cms_wapindex002	cms	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<h1 style="margin: 10px 0px;display: none;"><?php echo $rs['title']; ?>~~<?php echo $rs['picurl']; ?></h1>
		  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $cms_wapindex002 = fun('label@run_label','cms_wapindex002',['val'=>'','list'=>'rs','systype'=>'cms','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'','order'=>'id desc,view desc','by'=>'','where'=>'fid=9','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?> 
        <div class="curriculum industry">
            <div class="ListBox">
                <div class="box">
                    <div class="listtop"></div>
                    <div class="listbottom">
                        <div class="title">RISE 瑞思英语</div>
                        <div class="text">哒哒哒哒哒哒</div>
                        <div class="more">了解更多</div>
                    </div>
                </div>
                <div class="box">
                    <div class="listtop"></div>
                    <div class="listbottom">
                        <div class="title">RISE 瑞思英语</div>
                        <div class="text">哒哒哒哒哒哒</div>
                        <div class="more">了解更多</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="foot">
        <div>
            <img src="/public/static/hy/assets/images/home.png" alt="">
            <span class="check">首页</span>
        </div>
        <div onclick="window.location.href='/index.php/hy/content/ruzhu'">
            <img src="/public/static/hy/assets/images/ruzhus.png" alt="">
            <span>入驻</span>
        </div>
        <div onclick="window.location.href='/index.php/hy/content/personal'">
            <img src="/public/static/hy/assets/images/myde.png" alt="">
            <span>我的</span>
        </div>
    </div>
    <script>
        function navclick(e){
            $(e).addClass('check').siblings().removeClass()
            if($(e).text()=='推荐'){
                $('.navbottom').css('left','0.5rem')
            }else {
                $('.navbottom').css('left','1.6rem')
            }
        }
        // var u = navigator.userAgent;
        // var isAndroid = u.indexOf('Android') > -1 || u.indexOf('Adr') > -1; //android终端
        // var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
        // // alert('是否是Android：'+isAndroid);
        // // alert('是否是iOS：'+isiOS);
        // if(isAndroid){
        //     document.write("<link rel='stylesheet' href='./assets/style/reset_android.css'>")
        // }else if(isiOS){
        //     document.write("<link rel='stylesheet' href='./assets/style/reset_ios.css'>")
        // }
</script>




<script type="text/javascript" src="/public/static/mui/js/mui.min.js"></script>
<link rel="stylesheet" href="/public/static/index/default/slider.css">
<!--幻灯片结束---->
<link rel="stylesheet" href="/public/static/group/index.css">
<div class="MainContainer">
	<div class="HotGroupBox" style="display: none;">
		<div class="head">热门商铺</div>
		<div id="ListGroup">
			<ul>
				<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_wapindex001	hy	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
				<li><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"></span><em><?php echo $rs['title']; ?></em></a></li>
				  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_wapindex001 = fun('label@run_label','hy_wapindex001',['val'=>'','list'=>'rs','systype'=>'hy','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'','order'=>'status','by'=>'desc','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
			</ul>
		</div>
	</div>
</div>

<script type="text/javascript">
var ajax_url_db = ['<?php fun("label@label_ajax_url","hy_wapindex_shop001",__FILE__); ?>','<?php fun("label@label_ajax_url","hy_wapindex_photo001",__FILE__); ?>','<?php fun("label@label_ajax_url","hy_wapindex_bbs001",__FILE__); ?>'];
var choose_i = 0; //选中第几项
var shoppage = 1;
var haveshowpage = []; //每一项,作个标志,已经已显示到第几页
//显示更多
function showMoreContent(){	
	var url = ajax_url_db[choose_i];	//第几项对应的网址
	shoppage++;
	haveshowpage[choose_i] = shoppage;
	layer.msg("加载中...",{time:1000});
	$.get(url+shoppage+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.ShowMores').off("click");
				$('.ShowMores span').html('显示完了');
				$('.ShowMores span').css({'background':'#eee'});
			}else{
				$('.ShowContentType .Contents').eq(choose_i).append(res.data);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}

//切换显示
function showContentType(num){

	choose_i = num;
	shoppage = haveshowpage[choose_i]>1 ? haveshowpage[choose_i] : 1;
	$('.ShowMores').off("click"); //避免出现多次点击事件
	$('.ShowMores').on("click",showMoreContent);
	$('.ShowMores span').html('查看更多');

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