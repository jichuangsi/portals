<?php
	include('./parentfunction.php');
	$r;
	$pid=null;
	if(isset($_GET['pid'])){
		$pid=$_GET['pid'];
	}else{
		$r['errorCode']='0';
		$r['errorstatus']='请输入分类id';
		echo $str=json_encode($r);
		exit();
	}
	$result=$conn->query("select con.* from qb_hy_sort sort inner join qb_hy_content1 con on sort.id=con.fid where domainname = '' and sort.id='$pid' or sort.pid='$pid'");
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