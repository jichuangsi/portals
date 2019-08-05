<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:73:"D:\web\Education\portals\template/index_style/default/hy\content/show.htm";i:1564643917;s:74:"D:\web\Education\portals\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;s:69:"D:\web\Education\portals\template\index_style\default\index\share.htm";i:1542707408;}*/ ?>
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



<link rel="stylesheet" href="/public/static/group/show.css">	
<link rel="stylesheet" href="/public/static/hy/assets/style/details.css">
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
    <div class="top">
        <div class="state clearfix">
            <div class="fl" onclick="window.history.back(-1);">
                <img src="/public/static/hy/assets/images/return.png" alt="">
            </div>
            <div class="fr">
                <img src="/public/static/hy/assets/images/share.png" alt="">
            </div>
            <div class="fr">
                <img src="/public/static/hy/assets/images/xin.png" alt="">
            </div>
        </div>
        <div class="title">
           <?php echo $info['title']; ?>
            <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
            <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
            <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
            <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
            <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
        </div>
        <div class="Diagram">
            <div class="left" style="margin-left: 2rem;">
				<img style="width: 100%;" src="<?php echo $info['picurl']; ?>" />
            </div>
            <div class="right" style="display: none;">

            </div>
        </div>
        <div class="text">电话：<?php echo $info['telphone']; ?></div>
        <div class="text">地址：<?php echo $info['address']; ?></div>
        <!--<div class="text">位于家信商业中心2层</div>-->
    </div>
    <?php echo '<script>var domainname="'.$info['domainname'].'";</script>';?>
   <script>
   	var curriculumlisturl=null;
   	var listpages=2;
   	
   	function qrcodes(qrid){
   		var qrcode = new QRCode(document.getElementById("qr"+qrid), {
				width : 100,
				height : 100
			});
			var domurl=domainname.substring(7,domainname.length);
			console.log(domurl);
			qrcode.makeCode("http://192.168.31.123:82/index.php/cms/content/shareurl/d/"+domurl+"/k/"+qrid+"/u/<?php echo $userdb['uid']; ?>/g/<?php echo $info['id']; ?>");
   	}
   	function errorImg(imgs){
        		imgs.src = "/public/static/images/nopic.png"; imgs.onerror = null; 
     }
   	function curriculumlist(clid){
   		curriculumlisturl=domainname+"/index.php/api/course/courseQuery/r/10/y/"+clid;
   		listpages=2;
   		 $('.curriculum').html('');
   		$.ajax({
			    url:curriculumlisturl+'/p/1',
			    type:"GET",
			    success:function(data){
			    	 var datas=JSON.parse(data);
			    	  console.log(datas);
			    	   var listdata=datas.data;
			    	 var retest="";
			    	  for(var i in listdata){
	  					 retest="";
	  					retest+='<div class="ListBox">';
			        	retest+=' <div class="box">';
			        	retest+='<div class="listtop"><img src="'+listdata[i]['imageurl']+'" onerror="errorImg(this)"   /></div>';
			        	retest+='<div class="listbottom">';
			        	retest+=' <div class="title">'+listdata[i]['title']+'</div>';
			        	retest+=' <div class="text">哒哒哒哒哒哒</div>';
			        	retest+=' <div class="star">点击次数 : '+listdata[i]['view']+'</div>';
			        	retest+=' <div class="money">¥ '+listdata[i]["price"]+'</div>';
			        	retest+='</div>';
			        	retest+='<div class="Sold">已售'+listdata[i]['sold']+'</div>';
			        	retest+=' <a target="_blank" href="'+domainname+'/index.php?s=/live/index/detail/id/'+listdata[i]['id']+'" class="go" style="display:flex;"><i style="margin:auto;color:#fff" class="fa fa-long-arrow-right" aria-hidden="true"></i></a>';
			        	retest+=' <div class="img" id="qr'+listdata[i]['id']+'"></div>';
			        	retest+=' </div> </div>';
			        	$('.curriculum').append(retest);
			    	   	qrcodes(listdata[i]['id']);
			    	  }
			    }
			});	
   		}
   	function nextcurriculumlist(){
   		$.ajax({
			    url:curriculumlisturl+"/p/"+listpages,
			    type:"GET",
			    success:function(data){
			    	 var datas=JSON.parse(data);
			    	  console.log(datas);
			    	   var listdata=datas.data;
			    	    var retest="";
			    	  for(var i in listdata){
			    	  	 retest="";
	  					retest+='<div class="ListBox">';
			        	retest+=' <div class="box">';
			        	retest+='<div class="listtop"><img src="'+listdata[i]['imageurl']+'" onerror="errorImg(this)"   /></div>';
			        	retest+='<div class="listbottom">';
			        	retest+=' <div class="title">'+listdata[i]['title']+'</div>';
			        	retest+=' <div class="text">哒哒哒哒哒哒</div>';
			        	retest+=' <div class="star">点击次数 : '+listdata[i]['view']+'</div>';
			        	retest+=' <div class="money">¥ '+listdata[i]["price"]+'</div>';
			        	retest+='</div>';
			        	retest+='<div class="Sold">已售'+listdata[i]['sold']+'</div>';
			        	retest+=' <div class="go" style="display:flex;"><i style="margin:auto;color:#fff" class="fa fa-long-arrow-right" aria-hidden="true"></i></div>';
			        	retest+=' <div class="img" id="qr'+listdata[i]['id']+'"></div>';
			        	retest+=' </div> </div>';
			        	 $('.curriculum').append(retest);
			        	qrcodes(listdata[i]['id']);
			    	  }
			    	 
			    }
			    
			});
		listpages++;	
   	}
   </script>
    <div class="nav">
            <div class="nav_box clearfix">
               
            </div>
        </div>
         <script>
               	$(function(){
               		if(domainname!=null && domainname!=""){
               			$.ajax({
							    url:domainname+"/index.php/api/course/categoryQuery",
							    type:"GET",
							    success:function(data){
							    	 var datas=JSON.parse(data);
							    	  console.log(datas);
							    	  var listdata=datas.data;
							        for(var i in listdata){
							        	if(i==0){
							        		curriculumlist(listdata[i]['id']);
							        	}
										      console.log(listdata[i]['title']);
										 if(i==0){
										 	$('.nav_box').append('<div class="nav_check" onclick="nav_click(this),curriculumlist('+listdata[i]['id']+')">'+listdata[i]['title']+'</div>');
										 }else{
										 	$('.nav_box').append('<div  onclick="nav_click(this),curriculumlist('+listdata[i]['id']+')">'+listdata[i]['title']+'</div>');
										 }
										      
//										 document.write('<a href="javascript:void(0)" onclick="nav_click(this)">'+datas[i]['title']+'</a>')
									}
							    }
							});	
               		}
               	});
               </script>
    <div class="center">
            <div class="curriculum">
                    <div class="ListBox" style="display: none;">
                        <div class="box">
                            <div class="listtop"></div>
                            <div class="listbottom">
                                <div class="title">RISE 瑞思英语</div>
                                <div class="text">哒哒哒哒哒哒</div>
                                <div class="star">
                                    <img src="/public/static/hy/assets/images/Stars.png" alt="">
                                    <img src="/public/static/hy/assets/images/Stars.png" alt="">
                                    <img src="/public/static/hy/assets/images/Stars.png" alt="">
                                </div>
                                <div class="money">¥ 199元</div>
                            </div>
                            <div class="Sold">已售177</div>
                            <div class="go"></div>
                            <div class="img"></div>
                        </div>
                    </div>
                </div>
                <div class="button" onclick="nextcurriculumlist()">
                            查看更多
                    </div>
            <div class="comment">
                <div class="comment_top">
                    <div class="fl">用户评价（199）</div>
                    <div class="fr">
                        综合评分
                        <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                        <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                        <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                        <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                        <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                    </div>
                </div>
                <div class="comment_bottom">
                    <div class="user">
                        <div class="userimg fl"><img style="width: 100%;border-radius: 50%;" src="/public/static/hy/assets/img/t1.jpg" /></div>
                        <div class="fl">
                            <div class="username">爱潮水</div>
                            <div class="fen">
                                打分
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="time">
                                6月29日
                            </div>
                            <div class="role">
                                乐享课网友
                            </div>
                        </div>
                    </div>
                    <div class="text">
                        很开心被抽中霸王餐，服务态度好，参加的是英语课，很开心 被抽中霸王餐，服务态度好，参加的是英语课
                    </div>
                    <div class="img">
                        <div><img style="width: 100%;" src="/public/static/hy/assets/img/s2.jpg" /> </div>
                        <div><img style="width: 100%;" src="/public/static/hy/assets/img/s3.jpg" /> </div>
                    </div>
                </div>
                <div class="comment_bottom">
                    <div class="user">
                        <div class="userimg fl"><img style="width: 100%;border-radius: 50%;" src="/public/static/hy/assets/img/t2.jpg" /></div>
                        <div class="fl">
                            <div class="username">爱学习的小诗诗</div>
                            <div class="fen">
                                打分
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="time">
                                6月25日
                            </div>
                            <div class="role">
                                乐享课网友
                            </div>
                        </div>
                    </div>
                    <div class="text">
                        在这里学习很开心，老师很贴心，学生学的很舒心
                    </div>
                    <div class="img">
                        <div> <img style="width: 100%;" src="/public/static/hy/assets/img/s1.jpg" /> </div>
                    </div>
                </div>
                <div class="comment_bottom">
                    <div class="user">
                        <div class="userimg fl"><img style="width: 100%;border-radius: 50%;" src="/public/static/hy/assets/img/t3.jpg" /></div>
                        <div class="fl">
                            <div class="username">杰</div>
                            <div class="fen">
                                打分
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="time">
                                6月25日
                            </div>
                            <div class="role">
                                乐享课网友
                            </div>
                        </div>
                    </div>
                    <div class="text">
                       老师非常专业，而且很有耐心，讲课的方式也很新鲜，简单易学易懂
                    </div>
                    <div class="img">
                        <div><img style="width: 100%;" src="/public/static/hy/assets/img/s4.jpg" /> </div>
                        <div><img style="width: 100%;" src="/public/static/hy/assets/img/s5.jpg" /> </div>
                    </div>
                </div>
                
                 <div class="comment_bottom">
                    <div class="user">
                        <div class="userimg fl"><img style="width: 100%;border-radius: 50%;" src="/public/static/hy/assets/img/t4.jpg" /></div>
                        <div class="fl">
                            <div class="username">sukioxu</div>
                            <div class="fen">
                                打分
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="time">
                                7月01日
                            </div>
                            <div class="role">
                                乐享课网友
                            </div>
                        </div>
                    </div>
                    <div class="text">
                       美女老师很有耐心，讲得很仔细，还帮我做了课堂笔记，很感谢。
                    </div>
                    <div class="img">
                        <div><img style="width: 100%;" src="/public/static/hy/assets/img/s6.jpg" /> </div>
                        <div><img style="width: 100%;" src="/public/static/hy/assets/img/s7.jpg" /> </div>
                    </div>
                </div>
                 <div class="comment_bottom">
                    <div class="user">
                        <div class="userimg fl"><img style="width: 100%;border-radius: 50%;" src="/public/static/hy/assets/img/t5.jpg" /></div>
                        <div class="fl">
                            <div class="username">sssnow</div>
                            <div class="fen">
                                打分
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                                <span><img src="/public/static/hy/assets/images/Stars.png" alt=""></span>
                            </div>
                        </div>
                        <div class="fr">
                            <div class="time">
                                7月05日
                            </div>
                            <div class="role">
                                乐享课网友
                            </div>
                        </div>
                    </div>
                    <div class="text">
                       已经是第二次来这里学习啦，感觉很满意，老师都很好，十分推荐喔
                    </div>
                    <div class="img">
                        <div><img style="width: 100%;" src="/public/static/hy/assets/img/s8.jpg" /> </div>
                    </div>
                </div>
            </div>
    </div>
    <script>
    	 function nav_click(e){
            $(e).addClass('nav_check').siblings().removeClass('nav_check')
        }
    </script>
    
    
    
<div class="MainContainer" style="display: none;">
	<div class="ListBox">
		<div class="list">
			<ul>
				<li class="img"><a href="#"><img src="<?php echo $info['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"></a></li>
				<li class="info">
					<div class="title"><a href="#"><?php echo $info['title']; ?></a></div>
					<div class="cnt">商铺人气：<span><?php echo $info['view']; ?></span></div>
					<div class="other">						
						<span onclick="$('.MoreInfoBox').fadeIn();$('.MoreInfoBox').css({'display':'flex'});"><i class="fa fa-fw fa-qrcode"></i></span>
						<?php if($info['uid'] == $userdb['uid']): ?><em onclick="window.location.href='<?php echo murl('qun/content/edit',['id'=>$id]); ?>'"><i class="fa fa-fw fa-gear"></i></em><?php endif; ?>
						<em onclick="window.location.href='<?php echo urls('map/index',['aid'=>$id]); ?>'"><i class="fa fa-fw fa-flag-checkered"></i></em>
						<em onclick="SharShowMsg()"><i class="fa fa-fw fa-share-square-o"></i></em>
					</div>
				</li>
				<li class="join">
					<dl>
						<dt><span onclick="addpost()">发布</span></dt>
						<dd class="MorePost">
							<em><i class="fa fa-angle-up"></i></em>
							<div>
							<a href="<?php echo murl('shop/content/add',['mid'=>1,'ext_id'=>$id]); ?>">商品</a>
							<a href="<?php echo urls('cms/add',['aid'=>$id,'mid'=>1]); ?>">资讯</a>
							<a href="<?php echo urls('cms/add',['aid'=>$id,'mid'=>2]); ?>">图片</a>							
							<a href="<?php echo urls('bbs/add',['aid'=>$id]); ?>">话题</a>
							</div>
						</dd>
					</dl>
				</li>
			</ul>
		</div>
	</div>
	<div class="MainMenu" >
		<ul>
			<li><a href="<?php echo urls('shop/index',['aid'=>$id]); ?>"><span><i class="fa fa-fw fa-shopping-basket"></i></span><em>商品</em></a></li>
			<li><a href="<?php echo urls('cms/index',['aid'=>$id,'mid'=>1]); ?>"><span><i class="fa fa-fw fa-file-o"></i></span><em>资讯</em></a></li>
			<li><a href="<?php echo urls('cms/index',['aid'=>$id,'mid'=>2]); ?>"><span><i class="fa fa-fw fa-photo"></i></span><em>动态</em></a></li>
			<li><a href="<?php echo urls('bbs/index',['aid'=>$id]); ?>"><span><i class="fa fa-fw fa-comments-o"></i></span><em>话题</em></a></li>			
			<!--<li><a href="<?php echo urls('member/index',['id'=>$id]); ?>"><span><i class="fa fa-fw fa-user"></i></span><em>成员</em></a></li>-->
		</ul>
	</div>
	<div class="SideBox">
		<div class="head"><span class="tag">商铺介绍</span></div>
		<div class="aboutcnt">
			<div class="nav">电话: <a href="tel:<?php echo $info['telphone']; ?>"><?php echo $info['telphone']; ?></a></div>	
			<div class="cnt"><?php echo $info['content']; ?></div>
		</div>
	</div>
	<div class="SideBox">
		
		<?php if($gid == ''): ?>
		<div class="JoinBut"><a href="#" onclick="joinGroup(<?php echo $id; ?>)">加入会员</a></div>
		<?php else: ?>
		<div class="JoinBut"><a href="#" onclick="quitGroup(<?php echo $id; ?>)">我要退出</a></div>
		<?php endif; ?>
	</div>
	<div class="SideBox">
		<div class="head"><span class="tag">热销商品</span><a href="<?php echo murl('shop/content/add',['ext_id'=>$id,'mid'=>1]); ?>" class="more">发布</a></div>
		<ul class="listPhoto hy_wapshow_shop001">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_wapshow_shop001	shop	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<li><a href="<?php echo $rs['url']; ?>"><span><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png'"></span><em><?php echo $rs['title']; ?><br>价格:<?php echo $rs['price']; ?> 元</em></a></li>
			  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_wapshow_shop001 = fun('label@run_label','hy_wapshow_shop001',['union'=>'ext_id','ext_id'=>$id,'val'=>'','list'=>'rs','systype'=>'shop','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'2','class'=>'','order'=>'id','by'=>'desc','where'=>'','whereor'=>'','sql'=>"",'js'=>'hy_wapshow_shop001','cache_time'=>'0' ,'mid'=>'1' ]); ?>
		</ul> 
		<div class="qb_ui_showmore" onclick='showMorePhoto("<?php fun("label@label_ajax_url","hy_wapshow_shop001",__FILE__); ?>")'><i class="fa fa-angle-double-down"></i></div>
	</div>
<script type="text/javascript">
var shop_photo_page=1;
function showMorePhoto(url){
	shop_photo_page++;
	$.get(url+shop_photo_page,function(res){
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				//$('.ShowMore1').hide();
				$('.qb_ui_showmore').hide();
			}else{
				$('.hy_wapshow_shop001').append(res.data);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
</script>

	<div class="SideBox" style="display: none;">
		<div class="head"><span class="tag">热门话题</span><a href="<?php echo urls('bbs/add',['aid'=>$id]); ?>" class="more">发表</a></div>
		<div class="listBbs hy_wapshow_bbs001">
			<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--hy_wapshow_bbs001	bbs	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
			<div class="lists">
				<ul>
					<li class="img"><a href="<?php echo $rs['user_url']; ?>"><img src="/public/static/images/3.jpg" onerror="this.src='/public/static/images/nopic.png'"></a></li>
					<li class="info"><span><?php echo $rs['username']; ?></span><em><?php echo $rs['time']; ?></em></li>
					<li class="more"><span><?php if(($rs['status']>1)): ?>精<?php elseif((time()-$rs['create_time']<3600*24)): ?>新<?php elseif(($rs['view']>10)): ?>热<?php endif; ?></span></li>
				</ul>
				<a href="<?php echo $rs['url']; ?>">
				<dl>
					<dt><?php echo $rs['title']; ?></dt>
					<?php if((count($rs['picurls'])>2)): ?>
					<dd>
						<?php if(is_array($rs['picurls']) || $rs['picurls'] instanceof \think\Collection || $rs['picurls'] instanceof \think\Paginator): $i = 0; $__LIST__ = $rs['picurls'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$pic): $mod = ($i % 2 );++$i;if($i < '4'): ?>
								<div><span><img src="<?php echo $pic; ?>"onerror="this.src='/public/static/images/nopic.png'" width="78" height="78" /></span></div>
							<?php endif; endforeach; endif; else: echo "" ;endif; ?>
					</dd>
					<?php endif; ?>
				</dl>
				</a>
				<div class="others">
					<span><i class="fa fa-thumbs-o-up"><?php echo $rs['agree']; ?></i></span>
					<em><i class="fa fa-commenting-o"><?php echo $rs['replynum']; ?></i></em>
				</div>
			</div>
			  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $hy_wapshow_bbs001 = fun('label@run_label','hy_wapshow_bbs001',['union'=>'ext_id','ext_id'=>$id,'val'=>'','list'=>'rs','systype'=>'bbs','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'5','class'=>'','order'=>'id','by'=>'desc','where'=>'','whereor'=>'','sql'=>"",'js'=>'hy_wapshow_bbs001','cache_time'=>'0'  ]); ?>
		</div>
		<div class="ShowMore2" onclick='showMoreBbs("<?php fun("label@label_ajax_url","hy_wapshow_bbs001",__FILE__); ?>")'><span>查看更多</span></div>
<script type="text/javascript">
var shop_bbs_page=1;
function showMoreBbs(url){
	shop_bbs_page++;
	$.get(url+shop_bbs_page,function(res){	
		if(res.code==0){
			if(res.data==''){
				layer.msg("已经显示完了！",{time:500});
				$('.ShowMore2').hide();
			}else{
				$('.hy_wapshow_bbs001').append(res.data);
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}
</script>
	</div>
</div>	
<div class="MoreInfoBox" style="display: none;">
	<div class="BackBox" onclick="$('.MoreInfoBox').fadeOut();"></div>
	<div class="ShowinfoBox"><img src="<?php echo get_qrcode(url('show',['id'=>$id])); ?>"></div>
</div>
<script type="text/javascript">
//加入商铺
function joinGroup(id){
	$.get("<?php echo urls('wxapp.member/join',['id'=>$id]); ?>?"+Math.random(),function(res){
		if(res.code==0){
			layer.alert("加入成功！");
			$(".JoinBut").hide();
		}else{
			layer.alert("加入失败:"+res.msg);
		}	
	});
}

//退出
function quitGroup(id){
	layer.confirm('你确认要退出吗?', {icon: 3, title:'提示'}, function(index){
		layer.close(index);
		$.get("<?php echo urls('wxapp.member/quit',['id'=>$id]); ?>?"+Math.random(),function(res){
			if(res.code==0){
				layer.alert("你已退出！");
				$(".JoinBut").hide();
			}else{
				layer.alert("退出失败:"+res.msg);
			}	
		})		
	});
}

function addpost(){
	/*$.get("<?php echo urls('wxapp.member/addview',['id'=>$id]); ?>?"+Math.random(),function(res){
		if(res.code==0){
			layer.alert("签到成功！");
		}else{
			layer.alert("签到失败:"+res.msg);
		}	
	});**/
	var obj = $('.MorePost');
	obj.is(':hidden') ? obj.show() : obj.hide();
}

$.get("<?php echo urls('wxapp.visit/check_visit',['id'=>$id]); ?>",function(res){
		if(res.code==0){
			//layer.msg("更新浏览量成功!");
		}else{
			//layer.msg("并没有更新到浏览量!");
		}	
});
</script>
<?php 
$share = is_array($share)?array_merge($info?:[],$share):$info;
isset($share['about'])||$share['about'] = get_word(str_replace(["'","\r","\n","\t",' ','　'],'',del_html($share['content'])),150);
isset($share['link'])||$share['link'] = get_url('location');
preg_match('/^(http:|https:)/',$share['link']) || $share['link'] = request()->domain().$share['link'];
preg_match('/^(http:|https:)/',$share['picurl']) || $share['picurl'] = request()->domain().$share['picurl'];
$share['title'] = str_replace(["'","\r","\n","\t",' ','　'],'',$share['title']);
$share['about'] = str_replace(["'","\r","\n","\t",' ','　'],'',$share['about']);
 ?>
<style>
.Share_Message{ 
	position: fixed; 
	width:100%; 
	height: 100%; 
	background: rgba(0,0,0,0.8);
	z-index: 900000; 
	top:0; 
	left: 0; 
	display: none;
}
.Share_Message div{
	background:url(/public/static/images/sharebg.png) no-repeat right center; 
	width:100%; 
	height:350px; 
	background-size:contain; 
	top:0; 
	display: block;
}
</style>
<script type="text/javascript">
function SharShowMsg(){
	var t = $(document).height();
	$('.Share_Message').html('<div></div>');
	$('.Share_Message').height(t).fadeIn();
}
function SharHiddenMsg() {
	$('.Share_Message').fadeOut();
}
</script>
<div class="Share_Message" onClick="SharHiddenMsg();"></div>
<script src="/public/static/js/jweixin.js"></script>
<script type="text/javascript">

function ShareTimeline(){
    wx.onMenuShareTimeline({
      title: '<?php echo $share['title']; ?>',
      link: '<?php echo $share['link']; ?>',
      imgUrl: '<?php echo $share['picurl']; ?>',
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
        //alert('分享到朋友圈后，每进来一位新用户，你都将获得<?php echo $webdb[CommendRegHongBao]; ?>元红包的奖励，你若取消关注公众号，将不派发！');
      },
      success: function (res) {
        layer.msg('成功分享到朋友圈');
		//window.location.reload();
		//window.location.href='?id=$id&hid=$hid&job=have_shareTimeline';
      },
      cancel: function (res) {
        //alert('系统监测到你没有真正分享到朋友圈，请重新分享！');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });
	wx.showOptionMenu();
	//SharShowMsg();
    //alert('请点击左上角的菜单，然后分享到朋友圈去即可');
}

function ShareAppMessage(){
	wx.onMenuShareAppMessage({
      title: '<?php echo $share['title']; ?>',
      desc: '<?php echo $share['about']; ?>',
      link: '<?php echo $share['link']; ?>',
      imgUrl: '<?php echo $share['picurl']; ?>',
      trigger: function (res) {
        // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		//alert('请分享到朋友圈去，分享到微信好友无效！');
      },
      success: function (res) {
		  layer.msg('成功分享到好友');
		//window.location.href='?job=have_shareFriend';
      },
      cancel: function (res) {
        //alert('你已取消操作，建议你重新分享给好友！');
      },
      fail: function (res) {
        alert(JSON.stringify(res));
      }
    });
    //alert('请点击左上角的菜单，发送给朋友');
}


function wx_share_config(){
	wx.config({
		debug: false,
		appId: '<?php echo weixin_share("appId"); ?>',
		timestamp: <?php echo weixin_share("timestamp")?:0; ?>,
		nonceStr: '<?php echo weixin_share("nonceStr"); ?>',
		signature: '<?php echo weixin_share("signature"); ?>',
		jsApiList: [
			'checkJsApi',
			'onMenuShareTimeline',
			'onMenuShareAppMessage', 
			'hideMenuItems',
			'showMenuItems',
		  ]
	});

	wx.ready(function () {
		//wx.hideOptionMenu();
		ShareTimeline();
		ShareAppMessage();
	});

	wx.error(function (res) {
	  //alert(res.errMsg);
	});
}

var have_load_wx_share_config = false;
window.onload = function(){	//避免jweixin.js没有完全加载进来的情况
	have_load_wx_share_config = true;
	wx_share_config();
};

$(function(){
	//处理window.onload被覆盖的情况
	setTimeout(function(){
		if(have_load_wx_share_config==false){
			wx_share_config();
		}
	},5000);
})

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