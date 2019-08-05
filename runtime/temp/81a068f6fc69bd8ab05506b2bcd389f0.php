<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:76:"D:\web\Education\portals\template/admin_style/blansj/admin\index\welcome.htm";i:1547800788;}*/ ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台管理</title>
  <meta name="renderer" content="webkit"> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">  
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  <meta name="apple-mobile-web-app-capable" content="yes">  
  <meta name="format-detection" content="telephone=no"> 
	<link rel="stylesheet" type="text/css" href="/public/static/blansj_admin/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="/public/static/blansj_admin/css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="/public/static/blansj_admin/css/global.css">
	<link rel="stylesheet" type="text/css" href="/public/static/blansj_admin/css/main.css" media="all">
	<link rel="stylesheet" href="/public/static/icon/icon.css">	
</head>
<body>
<section class="larry-wrapper">
    <!-- overview -->
	<div class="row state-overview">
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol userblue layui-anim layui-anim-rotate"> <i class="fa fa-fw fa-user-circle-o"></i>
				</div>
				<div class="value">
					<a href="#">
						<h1 id="count1"><?php echo $user_num; ?></h1>
					</a>
					<p>用户总量</p>
				</div>
			</section>
		</div>
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol commred layui-anim layui-anim-rotate"> <i class="fa fa-fw fa-user"></i>
				</div>
				<div class="value">
					<a href="#">
						<h1 id="count2">1</h1>
					</a>
					<p>今日注册用户</p>
				</div>
			</section>
		</div>
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol articlegreen layui-anim layui-anim-rotate">
					<i class="fa fa-fw fa-bar-chart-o"></i>
				</div>
				<div class="value">
					<a href="#">
						<h1 id="count3"><?php echo $cms_num; ?></h1>
					</a>
					<p>文章总数</p>
				</div>
			</section>
		</div>
		<div class="col-lg-3 col-sm-6 layui-anim layui-anim-up">
			<section class="panel">
				<div class="symbol rsswet layui-anim layui-anim-rotate">
					<i class="fa fa-fw fa-book"></i>
				</div>
				<div class="value">
					<a href="#">
						<h1 id="count4">0</h1>
					</a>
					<p>待审文章总数</p>
				</div>
			</section>
		</div>
	</div>
	<!-- overview end -->
	<div class="row">
		<div class="col-lg-6">
			<section class="panel">
				<header class="panel-heading bm0">
					<span class='span-title'>系统概览</span>
					<span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
				</header>
				<div class="panel-body" >
					<table class="table table-hover personal-task">
                         <tbody>
                         	<tr>
                         		<td>
                         			<strong>版本信息</strong>： <a href="http://www.php168.com"><?php echo $webdb['QB_VERSION']; ?></a>

                         		</td>
                         		<td>
                         		</td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>系统设计</strong>：jcs

                                </td>
                                <td></td>
                         	</tr>
                         	<!--<tr>
                         		<td>
                                <strong>支持团队</strong>：<a href="http://www.qibo168.com" target="_blank">suifeng(随风)</a>、石头等版主 
                                </td>
                                <td></td>
                         	</tr>-->
                         	<tr>
                         		<td>
                                <strong>服务端信息</strong>：<?php echo $systemMsg['SERVER_SOFTWARE']; ?>
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>PHP版本</strong>：<?php echo $systemMsg['sysversion']; ?>
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>MYSQL数据库L版本</strong>：<?php echo $systemMsg['mysqlVersion']; ?>
                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>服务器所在时间</strong>： <?php echo $systemMsg['systemtime']; ?>

                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>网站所在磁盘物理位置</strong>： <?php echo $systemMsg['DOCUMENT_ROOT']; ?>

                                </td>
                                <td></td>
                         	</tr>
                         	<tr>
                         		<td>
                                <strong>服务器IP</strong>： <span class="current_user"><?php echo $systemMsg['SERVER_ADDR']; ?></span>

                                </td>
                                <td></td>
                         	</tr>
                         </tbody>
					</table>
				</div>
			</section>
      <!-- 网站信息统计 -->
      <section class="panel">
                  <header class="panel-heading bm0">
                       <span class='span-title'>网站信息统计</span>
                       <span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
                  </header>
                  <div class="panel-body laery-seo-box">
                        <div class="larry-seo-stats" id="larry-seo-stats"></div>
                  </div>
      </section>
		</div>
		<div class="col-lg-6">
		     <!-- 快捷操作 -->
             <!--<section class="panel">
                  <header class="panel-heading bm0">
                        <span class='span-title'>常用功能</span>
                        <span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
                  </header>
                  <div class="panel-body">
                        <table class="table table-hover personal-task">
                             <tbody>
                              <tr>
                                <td>1、/template/这个是模板所在目录,里边有三个子目录,分别是前台、后台、会员中心的模板</td>
                                <td></td>                                
                              </tr>  
							  <tr>
                                <td>2、如果不能进入后台，请修改文件/admin.php,查找define('SUPER_ADMIN',true)把开头的双斜杠去除;即能进入后台,重新设置管理员密码</td>
                                <td></td>                                 
                              </tr>
							  <tr>
                                <td>3、数据库配置文件是/application/database.php,更换数据库帐号后,请修改此文件</td>
                                <td></td>                                   
                              </tr>
							  <tr>
                                <td>4、要修改网页内容显示,在相应的页面双击即可进行标签设置</td>
                                <td></td>                                   
                              </tr>
							  <tr>
                                <td>5、网站在使用过程中,如果更新添加了数据,务必经常备份网站数据库</td>
                                <td></td>                                   
                              </tr>
                             </tbody>
                       </table>
                  </div>
             </section> -->
          <!-- 系统公告 -->
             <section class="panel">
                 <header class="panel-heading bm0">
                        <span class='span-title'>系统公告</span>
                        <span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
                  </header>
                  <div class="panel-body">
                        <table class="table table-hover personal-task shortcut">
                            <tr>
                              <td>
                                <div class="c1">暂无</div>
                                <br>
                              </td>
                            </tr>
                        </table>
                  </div>
             </section>

              <!-- 最新会员 -->
             <section class="panel">
                  <header class="panel-heading bm0">
                        <span class='span-title'>最新会员</span>
                        <span class="badge" style="background-color:#FF3333;"> new </span>
                        <span class="tools pull-right"><a href="javascript:;" class="iconpx-chevron-down"></a></span>
                  </header>
                  <div class="panel-body">
                       <table class="table table-hover personal-task">
                             <tbody>
							 <?php if(defined('LABEL_DEBUG')): ?><!--QB <!--admin_index_002	member	--><?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
                              <tr>
                                <td><?php echo $i; ?>、<a href="<?php echo get_url('user',$rs['uid']); ?>" target="_blank"><?php echo $rs['username']; ?></a></td>
                                <td>
                                  来源IP:<?php echo $rs['regip']; ?>
                                </td>
                                <td class="col-md-5">注册时间：&nbsp;<?php echo $rs['regdate']; ?></td>
                              </tr>
                                <?php endforeach; endif; else: echo "" ;endif; ?> QB--><?php endif; $admin_index_002 = fun('label@run_label','admin_index_002',['val'=>'','list'=>'rs','systype'=>'member','tpl'=>'','ifdata'=>1,'dirname'=>__FILE__,'rows'=>'10','class'=>'','order'=>'','by'=>'','where'=>'','whereor'=>'','sql'=>"",'js'=>'','cache_time'=>'0'  ]); ?>
                             </tbody>
                       </table>
                  </div>
             </section>
		</div>
	</div>

</section>

<script type="text/javascript" src="/public/static/blansj_admin/layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['jquery','layer','element'],function(){
		window.jQuery = window.$ = layui.jquery;
		window.layer = layui.layer;
        window.element = layui.element();

       $('.panel .tools .iconpx-chevron-down').click(function(){
       	   var el = $(this).parents(".panel").children(".panel-body");
       	   if($(this).hasClass("iconpx-chevron-down")){
       	   	   $(this).removeClass("iconpx-chevron-down").addClass("iconpx-chevron-up");
       	   	   el.slideUp(200);
       	   }else{
       	   	   $(this).removeClass("iconpx-chevron-up").addClass("iconpx-chevron-down");
       	   	   el.slideDown(200);
       	   }
       })

	});
</script>
<script type="text/javascript" src="/public/static/blansj_admin/jsplug/echarts.min.js"></script>
<script type="text/javascript">
<?php 
$array = [];
$_array = query('memberdata',['group'=>'groupid','field'=>['count(uid)'=>'NUM','groupid']]);
foreach($_array AS $rs){
	$array[$rs['groupid']] = $rs['NUM'];
}
$group_array = getGroupByid();
 ?>
var myChart = echarts.init(document.getElementById('larry-seo-stats'));
option = {
    title : {
        text: '用户组成员统计',
        subtext: '按用户组来统计',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient: 'vertical',
        left: 'left',
        data: ['<?php echo implode("','",$group_array); ?>']
    },
    series : [
        {
            name: '访问来源',
            type: 'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
			<?php if(is_array($group_array) || $group_array instanceof \think\Collection || $group_array instanceof \think\Paginator): $i = 0; $__LIST__ = $group_array;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
                {value:<?php echo (isset($array[$key]) && ($array[$key] !== '')?$array[$key]:0); ?>, name:'<?php echo $rs; ?>'},
			<?php endforeach; endif; else: echo "" ;endif; ?>
            ],
            itemStyle: {
                emphasis: {
                    shadowBlur: 10,
                    shadowOffsetX: 0,
                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
            }
        }
    ]
};
myChart.setOption(option);
</script>

<script type="text/javascript" src="/public/static/js/core/jquery.min.js"></script>
<script type="text/javascript">
//检查版本更新
<?php 
$array = @include(config('client_upgrade_edition')?:RUNTIME_PATH.'/client_upgrade_edition.php');
 ?>
function check_upgrade(){
	var now_edition = "<?php echo $array['md5']; ?>";
//	$.post("https://x1.php168.com/appstore/upgrade/get_edition.html",{app_edition:"<?php echo fun('upgrade@local_edition'); ?>",sys_edition:now_edition}).success(function(res){
//		if(res.code==0){
//			if(res.data.md5!=now_edition||typeof(res.data.upgrade_msg) != "undefined"){
//				//upgrade_edition = res.data.md5;
//				var msg = typeof(res.data.upgrade_msg) != "undefined" ? res.data.upgrade_msg : '你的系统需要升级<br>云端更新日期:'+res.data.time;
//				layer.confirm(msg, {
//					btn : [ '马上升级', '晚点再升级' ]
//				}, function(index) {
//					window.location.href="<?php echo url('upgrade/index'); ?>";
//				});
//			}
//		}
//	});
}
<?php if($userdb['groupid']==3): ?> check_upgrade(); <?php endif; ?>
</script>

</body>
</html>