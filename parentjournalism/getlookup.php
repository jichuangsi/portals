<?php
	include('./parentfunction.php');
	$title='';
	$pageindex=0;
	$pagesize=10;
	if(isset($_GET['title'])){
		$title=$_GET['title'];
	}
	if(isset($_GET['pageindex'])){
		$pageindex=$_GET['pageindex'];
	}
	if(isset($_GET['pagesize'])){
		$pagesize=$_GET['pagesize'];
	}
	$page=$pageindex*$pagesize;
	$sql="select id,fid,mid,title,view,agree,create_time,picurl,case when replynum >= 0 then '0' else replynum end as replynum,case when fid = 9 then '2' else 1 end as status from qb_cms_content1 where title like '%$title%' limit $page,$pagesize";
	$result=$conn->query($sql);
	$jarr = array();
	while ($rows=mysqli_fetch_array($result,MYSQL_ASSOC)){
	    $count=count($rows);//不能在循环语句中，由于每次删除 row数组长度都减小  
	    for($i=0;$i<$count;$i++){  
	        unset($rows[$i]);//删除冗余数据  
	    }
	    array_push($jarr,$rows);
	}
	$r;
	$r['errorCode']='1';
	if($r['errorCode']=='1'){
			$r['data']=$jarr;
	} 
	echo $str=json_encode($r);
?>