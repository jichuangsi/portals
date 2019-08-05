<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:73:"D:\web\Education\portals\template/index_style/default/hy\content/list.htm";i:1564973225;s:74:"D:\web\Education\portals\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title><?php echo !empty($fid)?($info['seo_title']?:$info['name']):$m_info['title']; ?></title>
<meta name="keywords" content='<?php echo !empty($fid)?($info['seo_keywords']?:$info['name']):$m_info['title']; ?>'>
<meta name="description" content='<?php echo $info['seo_description']; ?>'>
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



	<link rel="stylesheet" href="/public/static/hy/assets/style/mechanism.css">
    <link rel='stylesheet' href='/public/static/hy/assets/style/reset_android.css'>
	<link rel="stylesheet" href="/public/static/hy/assets/style/sort.css">
    <script src="/public/static/hy/assets/js/reset.js"></script>
    <style>
    	.body_Hearcont{
    		display: none !important;
    	}
    	.body_Footcont{
    		display: none !important;
    	}
    	body{
    		background: #fff !important;
    	}
    	.sort_div{
			width: 100%;
		    height: 100%;
		    position: fixed;
		    top: 0;
		    background: #fff;
    	}
    </style>
    <div class="top">
        <div class="fl" onclick="javascript:history.back(-1);">
            <img src="/public/static/hy/assets/images/return.png" alt="">
        </div>
        <div style="float: right;padding: 0px 0.2rem;" onclick="showsort()">
           		 分类
        </div>
        <div class="title" onclick="ssrr()">机构列表</div>
        
    </div>
	<?php echo '<script>var retest; </script>'; ?>
    <div class="list_center">
        <div class="nav">
            <div class="nav_box">
                <!--<div class="nav_check" onclick="nav_click(this)">音乐培训</div>-->
                <!--<div onclick="nav_click(this)">美术培训</div>
                <div onclick="nav_click(this)">外语培训</div>
                <div onclick="nav_click(this)">职业技术</div>
                <div onclick="nav_click(this)">驾校</div>-->
                <?php if(is_array(get_sort(0,'other')) || get_sort(0,'other') instanceof \think\Collection || get_sort(0,'other') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort(0,'other');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
					<a href="<?php echo urls('content/index',['fid'=>$key]); ?>" <?php if(($key==$fid)): ?>class="nav_check"<?php endif; ?>><?php echo $vo; ?></a>
				<?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_waplist_001	hy	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
            <div class="curriculum">
                    <div class="ListBox" onclick="window.location.href='<?php echo $rs['url']; ?>'">
                        <div class="box">
                            <div class="listtop"><img src="http://192.168.31.123:82/public/<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"  /> </div>
                            <div class="listbottom">
                                <div class="title"><?php echo $rs['title']; ?></div>
                                <div class="text"><?php echo $rs['content']; ?></div>
                                <div class="star">
                                    <img src="/public/static/hy/assets/images/Stars.png" alt="">
                                    <img src="/public/static/hy/assets/images/Stars.png" alt="">
                                    <img src="/public/static/hy/assets/images/Stars.png" alt="">
                                </div>
                                <div class="money" style="display: none;">¥ 199元</div>
                            </div>
                            <div class="Sold">已售177</div>
                            <div class="go" style="display: none;"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></div>
                            <div class="img" style="display: none;"></div>
                        </div>
                    </div>
                    <script>
					        	function ssr(domainname){
					        		if(domainname!=undefined&&domainname!=null&&domainname!=''){
						        		$.ajax({
										    url:domainname+"/index.php/api/course/courseQuery/p/1/r/5/",
										    type:"GET",
										    async:false,
										    success:function(res){
										    	 var datas=JSON.parse(res);
										        console.log(datas);
										        var listdata=datas.data;
										        for(var i in listdata){
										        	retest+='<div class="specs clearfix">';
										        	retest+='<div>¥'+listdata[i]['price']+'</div>';
										        	retest+='<div>'+listdata[i]['title']+'</div>';
										        	retest+=' <div>已售'+listdata[i]['sold']+'</div>';
										        	retest+='</div>';
										        }
										        $('.specs_box').append(retest);
										    }
										});	
									}
					        	}
					</script>
                    <?php if(($rs['domainname']!=null && $rs['domainname']!='')): ?>
                    <div class="specs_box">
                        <!--<div class="specs clearfix">
                            <div>¥199</div>
                            <div>【趣味体验课】单双人体验</div>
                            <div>已售233</div>
                        </div>-->
                        <script>
                        $.ajax({
										    url:"<?php echo $rs['domainname']; ?>/index.php/api/course/courseQuery/p/1/r/5/",
										    type:"GET",
										    async:false,
										    success:function(res){
										    	 var datas=JSON.parse(res);
										        console.log(datas);
										        var listdata=datas.data;
										        for(var i in listdata){
										        	retest='';
										        	retest+='<div class="specs clearfix">';
										        	retest+='<div>¥'+listdata[i]['price']+'</div>';
										        	retest+='<div>'+listdata[i]['title']+'</div>';
										        	retest+=' <div>已售'+listdata[i]['sold']+'</div>';
										        	retest+='</div>';
										      		document.write(retest);
										        }
//										        $('.specs_box').append(retest);
										    }
						});	
						</script>
                    </div>
                    
                    <!--<script>ssr('<?php echo $rs['domainname']; ?>')</script>-->
                     <div class="button" onclick="window.location.href='<?php echo $rs['url']; ?>'">
                           	 查看更多
                    </div>
                    <?php endif; ?>
                   
                </div>
          <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_waplist_001 = fun('label@run_label','hy_waplist_001',['union'=>'order,by,mid,fid,status','order'=>$order,'by'=>$by,'mid'=>$mid,'fid'=>$fid,'status'=>$status,'val'=>'','list'=>'rs','systype'=>'hy','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'','order'=>'view','by'=>'desc','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
    </div>
    <script>
        function nav_click(e){
            $(e).addClass('nav_check').siblings().removeClass('nav_check')
        }
        function ssrr(domainname){
        		console.log(domainname);
        		$.ajax({
				    url:"http://192.168.31.108:92/index.php/api/course/courseQuery",
				    type:"GET",
				    success:function(data){
				    	 var datas=JSON.parse(data);
				        console.log(datas);
				    }
				});	
        }
        function showsort(){
        	$('.sort_div').fadeIn(500);
        }
        function hidesort(){
        	$('.sort_div').fadeOut(500);
        }
    </script>
	
    <div class="sort_div" style="display: none;">
		  <div class="top">
		        <div class="fl" onclick="hidesort()">
		            <img src="/public/static/hy/assets/images/return.png" alt="">
		        </div>
		        <div class="title">学习培训全部分类</div>
		    </div>
		    <div class="center">
		        <div class="left">
		        	<?php $num=0;if(is_array(get_sort(0,'other')) || get_sort(0,'other') instanceof \think\Collection || get_sort(0,'other') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort(0,'other');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
		        		<div <?php if(($num==0)): ?>class="check"<?php endif; ?> onclick="check(this)"><span><?php echo $vo; ?></span></div>
		        		<?php $_result=sort_config('hy',$key);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$name): $mod = ($i % 2 );++$i;?>
						<!--<div  onclick="check(this)"><span><?php echo $name; ?>s</span></div>-->
						<?php endforeach; endif; else: echo "" ;endif; $num++;endforeach; endif; else: echo "" ;endif; ?>
		            <!--<div class="check" onclick="check(this)"><span>语言培训</span></div>
		            <div onclick="check(this)"><span>留学</span></div>
		            <div onclick="check(this)"><span>升学辅导</span></div>
		            <div onclick="check(this)"><span>音乐培训</span></div>
		            <div onclick="check(this)"><span>美术培训</span></div>
		            <div onclick="check(this)"><span>书法培训</span></div>
		            <div onclick="check(this)"><span>职业培训</span></div>-->
		        </div>
		        <div class="right">
		            <!--<div class="title">语言培训</div>
		            <div class="nav">
		                <div>英语</div>
		                <div>英语</div>
		                <div>英语</div>
		                <div>英语</div>
		                <div>英语</div>
		            </div>-->
		            <?php if(is_array(get_sort(0,'other')) || get_sort(0,'other') instanceof \think\Collection || get_sort(0,'other') instanceof \think\Paginator): $i = 0; $__LIST__ = get_sort(0,'other');if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
		        		 <div class="title"><?php echo $vo; ?></div>
		        		 <div class="nav">
		        		<?php $_result=sort_config('hy',$key);if(is_array($_result) || $_result instanceof \think\Collection || $_result instanceof \think\Paginator): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$name): $mod = ($i % 2 );++$i;?>
							<div onclick="window.location.href='<?php echo urls('content/index',['fid'=>$key]); ?>'"><?php echo $name; ?></div>
						<?php endforeach; endif; else: echo "" ;endif; ?>
						</div>
					<?php endforeach; endif; else: echo "" ;endif; ?>
		        </div>
		    </div>
    </div>
    <script>
        function check(e){
            $(e).addClass('check').siblings().removeClass()
//          $('.right>.title').text($(e).find('span').text())
        }
    </script>

<script type="text/javascript">

var ajax_url_db = ['&order=view&by=desc&','&order=id&by=desc&','&status=2,order=id&by=asc&'];
var choose_i = 0; //选中第几项
var haveshowpage = []; //每一项,作个标志,已经已显示到第几页
    haveshowpage[0] = 1; //第一项就从第二页开始

//显示更多
function showMoreContent(){	
	var url = ajax_url_db[choose_i];	//第几项对应的网址
	haveshowpage[choose_i]++;
	$.get('<?php fun("label@label_ajax_url","hy_waplist_001",__FILE__); ?>' + haveshowpage[choose_i] + url + Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.ShowMores').off("click");
				$('.ShowMores').html('显示完了');
				$('.ShowMores').css({'background':'#eee'});
			}else{
				if(haveshowpage[choose_i]==1){
					$('.ShowContentType .ListBox').eq(choose_i).html(res.data);
				}else{
					$('.ShowContentType .ListBox').eq(choose_i).append(res.data);
				}
				set_i();
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}

function set_i(){
	var j=0;
	$('.ShowContentType .img span').each(function(){
		$(this).html(++j);
		$(this).addClass('num'+j);
	});
}
set_i();

//切换显示
function showContentType(num){

	choose_i = num;
	$('.ShowMores').off("click");	//先移除,避免重复加多次click事件
	$('.ShowMores').on("click",showMoreContent);
	$('.ShowMores').html('查看更多');
	$('.ShowMores').css({'background':'orange'});

	if(haveshowpage[num]==undefined){
		haveshowpage[num] = 0;
		showMoreContent();
	}

	$('.ShowContentType .ShowTypes a').removeClass('ck');
	$('.ShowContentType .ShowTypes a').eq(num).addClass('ck');
	$('.ShowContentType .ListBox').hide();
	$('.ShowContentType .ListBox').eq(num).show();
}
$('.ShowContentType .ShowTypes a').click(function(){
	showContentType( $(this).index() );
});
showContentType(0);


function joinGroup(id){
	$.get("<?php echo urls('wxapp.member/join'); ?>?id=" + id ,function(res){
		if(res.code==0){
			layer.alert("加入成功！");
		}else{
			layer.alert("加入失败:"+res.msg);
		}	
	});
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