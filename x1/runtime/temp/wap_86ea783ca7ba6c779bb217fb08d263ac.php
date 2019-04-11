<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:60:"D:\web\x1\template/index_style/default/vote\content/list.htm";i:1554865002;s:59:"D:\web\x1\template/index_style/toutiao/index/wap_layout.htm";i:1550039820;}*/ ?>
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



</div>
<link rel="stylesheet" href="/public/static/vote/wap/list.css">
<style>
.topCont img{
max-width:95%;
}
</style>
<div class="ListContnaier" >
	<div class="topCont">
		<div class="name"><a ><?php echo $info['name']; ?></a></div>
		<div class='descrips votes'><?php echo $info['description']; ?>&nbsp;</div>
		<div class="join_but votes"><a href="<?php echo murl('add',['fid'=>$fid]); ?>">我要参加</a></div>
		<div class="times votes"><span>报名结束日期：<?php if($info['joinendtime']): ?><?php echo format_time($info['joinendtime'],'Y-m-d H:i'); else: ?>不限时间<?php endif; ?></span></div>
		<div class="times time2" style="background:#fff; color:#888;"><span>投票结束日期：<?php if($info['endtime']): ?><?php echo format_time($info['endtime'],'Y-m-d H:i'); else: ?>不限时间<?php endif; ?></span></div>
	</div>
	<form name="formvote" id='formvote' method="post" action="<?php echo urls('content/agree_votes'); ?>" style="overflow: scroll;">
	<div class="ListVotes">
	</div>
	<input type="hidden" name='fid' value="<?php echo $fid; ?>">
	<input type="hidden" name='type' value="1">
	<?php if($s_info[type]==1): ?>
	<div class="submits"><span>投票</span></div>
	<?php endif; ?>
	</form>
</div>
 

<!-- 进入页面的投票选项数据 -->
<div id='wrap_votelist' style='display:none;'>
<?php if(defined('LABEL_DEBUG')): ?><!--QB <!--wap_vote_index_option_list	vote	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
	<dl class="sideVote">
		<dt>
			<a href="<?php echo $rs['url']; ?>"><img src="<?php echo $rs['picurl']; ?>" onerror="this.src='/public/static/images/nopic.png' "/></a>
		</dt>
		<dd>
			<h3>
				<a href="<?php echo $rs['url']; ?>"><?php echo $rs['title']; ?></a>
				<span>(<?php echo $rs['agree']; ?>票)</span>
			</h3>
			<p><?php echo get_word($rs['content'],62); ?></p>
			<div onclick="ChangeSelect($(this))">
			<?php if(get_sort($rs['fid'],'type','','vote')==1): ?>
			<em><input type="checkbox" name="ids[]" value="<?php echo $rs['id']; ?>"/></em>
			<?php else: ?>
				<span onclick="AgreeVote(<?php echo $rs['id']; ?>,<?php echo $rs['fid']; ?>,0)"><input type="radio" name="ids[0]" value="<?php echo $rs['id']; ?>"/></span>
			<?php endif; ?>
			
			</div>
		</dd>
	</dl>		
  <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $wap_vote_index_option_list = fun('label@run_label','wap_vote_index_option_list',['union'=>'fid','fid'=>$fid,'val'=>'','list'=>'rs','systype'=>'vote','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'11','class'=>'','order'=>'agree','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
 </div>

 <!-- 投票选项的分页数据 -->
<div id='wrap_votelist_page' style='display:none;'></div>

<div class="WebSeitUrl"><?php fun("label@label_ajax_url","wap_vote_index_option_list",__FILE__); ?></div>


<SCRIPT LANGUAGE="JavaScript">
<!--//
//单选投票
function AgreeVote(ids,fid,type){	
	console.log(ids);
	layer.confirm('是否给所选用户进行投票?', {icon: 3, title:'投票确认'}, function(index){
	 // alert('f');
		// return false;
//		/index.php/vote/content/
		$.get("/index.php/vote/content/agree_vote.html?ids="+ids+"&fid="+fid+"&type="+type+"&"+Math.random(),function(res){
//		$.get("<?php echo urls('content/agree_vote'); ?>?ids="+ids+"&fid="+fid+"&type="+type+"&"+Math.random(),function(res){
			if(res.code==0){
				var num =  $('#topic_agree').html();
				num++;
				$('#topic_agree').html(num);
				layer.msg("投票成功！",{time:1500});
				window.location.reload();
			}else{
				// layer.msg('投票失败:'_res.msg);
				layer.msg("投票失败:"+res.msg,{time:1500});
			}	
		});  
	  layer.close(index);
	});

}

var Listvote = new Array(); 
var iHeight,iTempHeight,thisrow;
$("#wrap_votelist .sideVote").each(function(){
	var new_str='<dl class="sideVote">'+$(this).html()+'</dl>';
	Listvote.push(new_str);
})
// console.log(Listvote);
// console.log(Listvote.length);
for(var i=0; i<Listvote.length; i++){
	iHeight = -1;
	$('.ListVotes ').each(function(){
		iTempHeight = Number( $(this).height() );
		if(iHeight==-1 || iHeight>iTempHeight){
			iHeight = iTempHeight;
			thisrow = $(this);
		}
	});
	thisrow.append("<div class='Lists'>"+Listvote[i]+"</div>");
	
}
$('.body_Hearcont').addClass('votes');
/*$('.Lists').append("<div >123321</div>");*/
function ChangeSelect(objs){
	var thisinput=objs.find('input');
	console.log(thisinput);

	var this_inputype=thisinput.attr('type');
	//单选
	if(this_inputype=='radio'){
		$('.sideVote input').attr('checked',false);
		$('.sideVote dd div').removeClass('select');
		thisinput.attr('checked','checked');
		objs.addClass('select');
	}else{
		if (thisinput.attr('checked')){
			thisinput.attr("checked",false);
			objs.removeClass('select');
		}else{
			thisinput.attr("checked",true);
			objs.addClass('select');
		}		
	}
	// alert('406');


/*	$('.sideVote dd div input').each(function(){
		var thedd=$(this).parent().parent();
		// console.log(thedd);
		if($(this).attr('checked')){
			thedd.addClass('select');
		}else{
			thedd.removeClass('select');
		}
	});*/
}

$(document).ready(function(){
	$('.submits span').click(function(){
		// console.info($(this).serialize());
		var form_data = $('#formvote').serialize();
		// console.log(form_data);
		// // return false;
		postcontent(form_data);
		// $('form[name="formvote"]').submit();
	});
});
var havepost = false;
var url = "<?php echo urls('content/agree_votes'); ?>"
function postcontent(form_data){
	if(havepost==true){
		layer.msg('请不要重复提交');
		return false;
	}
	havepost = true;

            $.post(url, form_data).success(function (res) {
            	console.log(res);
  	      	havepost = false;
                	if(res.code==0){
			layer.msg("投票成功！");
			window.location.reload();
			// location.href="<?php echo urls('content/show'); ?>?id=" + res.data.id;
		}else{
			havepost = false;
			layer.alert('投票失败:' + res.msg);
		}
            }).fail(function () {
				havepost = false;
				layer.open({title: '提示',content: '服务器发生错误'});
            });
}



$(".WebSeitUrl").hide();
/*var page=1,loading=1,WebSeitUrl=$(".WebSeitUrl").html();
$(window).scroll(function(){
	// 当滚动到最底部以上100像素时， 加载新内容
	if ($(document).height() - $(this).scrollTop() <1000 && loading==1){
		// page++;
		loading=0;
		var urls=WebSeitUrl;
		loadMore(urls);
	} 	
});
function loadMore(urls){
	var ListvotePage = new Array();
	page++;
	$('#wrap_votelist_page').html('');
	$.get(urls+page+'&'+Math.random(),function(res){
		if(res.code==0){
			if(res.data==''){
				loading=0;
				layer.msg("已经显示完了！",{time:500});
			}else{
				loading=1;
				$('#wrap_votelist_page').html(res.data);
				$("#wrap_votelist_page .sideVote").each(function(){
					var new_str2='<dl class="sideVote">'+$(this).html()+'</dl>';
					ListvotePage.push(new_str2);
				})
				for(var i=0; i<ListvotePage.length; i++){
					iHeight = -1;
					$('.ListVotes .Lists').each(function(){
						iTempHeight = Number( $(this).height() );
						if(iHeight==-1 || iHeight>iTempHeight){
							iHeight = iTempHeight;
							thisrow = $(this);
						}
					});
					thisrow.append(ListvotePage[i]);
				}
			}
		}else{
			layer.msg(res.msg,{time:2500});
		}
	});
}*/
//-->
</SCRIPT>


<div class="votes"> 	
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