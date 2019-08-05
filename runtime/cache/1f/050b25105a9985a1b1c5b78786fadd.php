<?php
//000000003600
 exit();?>
a:2:{s:14:"hy_waplist_001";a:2:{s:4:"demo";s:233:"<div class="specs clearfix">
                            <div>¥199</div>
                            <div>【趣味体验课】单双人体验</div>
                            <div>已售233</div>
                        </div>";s:3:"tpl";s:4130:" <?php if(is_array($__LIST__) || $__LIST__ instanceof \think\Collection || $__LIST__ instanceof \think\Paginator): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$rs): $mod = ($i % 2 );++$i;?>
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
                    
                    
                     <div class="button" onclick="window.location.href='<?php echo $rs['url']; ?>'">
                           	 查看更多
                    </div>
                    <?php endif; ?>
                   
                </div>
          <?php endforeach; endif; else: echo "" ;endif; ?> ";}s:11:"_filemtime_";i:1564973227;}