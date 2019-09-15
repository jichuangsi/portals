<?php
	include('./parentfunction.php');
	$r;
	$gid=null;
	if(isset($_GET['gid'])){
		$gid=$_GET['gid'];
	}else{
		$r['errorCode']='0';
		$r['errorstatus']='请输入域名参数';
		echo $str=json_encode($r);
		exit();
	}
	$result=$conn->query("select id,name,activityrule,description from qb_fenlei_sort where isenable=0 and (id in (select fid from qb_fenlei_content1 where gid='$gid' and namelist=1) or id not in(select fid from qb_fenlei_content1 where gid='$gid' and namelist=0))");
	$jarr = array();
	while ($rows=mysqli_fetch_array($result,MYSQL_ASSOC)){
	    $count=count($rows);//不能在循环语句中，由于每次删除 row数组长度都减小  
	    for($i=0;$i<$count;$i++){  
	        unset($rows[$i]);//删除冗余数据  
	    }
	    array_push($jarr,$rows);
	}
	$r['errorCode']='1';
	if($r['errorCode']=='1'){
			$r['data']=$jarr;
	} 
	echo $str=json_encode($r);
?>