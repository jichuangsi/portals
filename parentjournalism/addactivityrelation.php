<?php
	include('./parentfunction.php');
	$r;
	$gid=null;  //机构id
	$aid=null;  //活动id
	$kid=null;  //课程id
	$results=false;
	if(isset($_GET['gid'])){
		$gid=$_GET['gid'];
	}else{
		$r['errorCode']='0';
		$r['errorstatus']='缺少机构id';
		echo $str=json_encode($r);
		exit();
	}
	if(isset($_GET['aid'])){
		$aid=$_GET['aid'];
	}else{
		$r['errorCode']='0';
		$r['errorstatus']='缺少活动id';
		echo $str=json_encode($r);
		exit();
	}
	if(isset($_GET['kid'])){
		$kid=$_GET['kid'];
	}else{
		$r['errorCode']='0';
		$r['errorstatus']='缺少课程id';
		echo $str=json_encode($r);
		exit();
	}
	if($aid>0){
		$result=$conn->query("select count(*) as num from qb_activity_relation where gid='$gid' and kid='$kid' ");
		$jarr = array();
		while ($rows=mysqli_fetch_array($result,MYSQL_ASSOC)){
		    $count=count($rows);//不能在循环语句中，由于每次删除 row数组长度都减小  
		    for($i=0;$i<$count;$i++){  
		        unset($rows[$i]);//删除冗余数据  
		    }
		    array_push($jarr,$rows);
		}
		if($jarr[0]['num']==0){
			$results=$conn->query("insert into qb_activity_relation(gid,aid,kid) values('$gid','$aid','$kid')");
		}else if($jarr[0]['num']>=1){
			$results=$conn->query("update qb_activity_relation set aid='$aid' where gid='$gid' and kid='$kid'");
		}
	}else{
		$results=$conn->query("delete from qb_activity_relation where gid='$gid' and kid='$kid'");
	}
	
	$r['errorCode']='1';
	if($r['errorCode']=='1'){
			$r['data']=$results;
	} 
	echo $str=json_encode($r);
?>