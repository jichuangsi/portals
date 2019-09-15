<?php
	include('./parentfunction.php');
	header('access-Control-Allow-Origin:*');
	$r;
	$result=$conn->query("select * from qb_hy_sort where pid=0");
	$results=$conn->query("select * from qb_hy_sort where pid!=0");
	$jarr = array();
	$sonjarr = array();
	while ($rows=mysqli_fetch_array($result,MYSQL_ASSOC)){
	    $count=count($rows);//不能在循环语句中，由于每次删除 row数组长度都减小  
	    for($i=0;$i<$count;$i++){
	        unset($rows[$i]);//删除冗余数据  
	    }
	    array_push($jarr,$rows);
	}
	while ($rows1=mysqli_fetch_array($results,MYSQL_ASSOC)){
	    $count1=count($rows1);//不能在循环语句中，由于每次删除 row数组长度都减小  
	    for($i=0;$i<$count1;$i++){
	        unset($rows1[$i]);//删除冗余数据  
	    }
	    array_push($sonjarr,$rows1);
	}
	$num = count($jarr); 
	$num1 = count($sonjarr);
	for($i=0;$i<$num;$i++){
	  $jarr[$i]['data']=array();
	}
	for($i=0;$i<$num1;$i++){
		for($j=0;$j<$num;$j++){
			if($sonjarr[$i]['pid']==$jarr[$j]['id']){
//				$jarr[$j]['data']=$sonjarr[$i];
				array_push($jarr[$j]['data'],$sonjarr[$i]);
			}
		}
	}
//	for($i=0;$i<$num;$i++){
//	  $jarr[$i]['data']=$arrs;
//	}
	$r['errorCode']='1';
	if($r['errorCode']=='1'){
			$r['data']=$jarr;
	} 
//	echo $sr;
	echo $str=json_encode($r);
?>