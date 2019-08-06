<?php
	include('./parentfunction.php');
	$r;
	$domainname=null;
	if(isset($_GET['domainname'])){
		$domainname=$_GET['domainname'];
	}else{
		$r['errorCode']='0';
		$r['errorstatus']='请输入域名参数';
		echo $str=json_encode($r);
		exit();
	}
	$domainnames='http://'.$domainname;
	$sql="select * from qb_config where c_key='wap_ali_id' or c_key='wap_ali_partner' or c_key='wap_ali_public_keys' or c_key='wap_ali_private_keys' or c_key='wxapp_appid' or c_key='wxapp_paykey' or c_key='wxapp_payid' or c_key='weixin_appid' or c_key='weixin_appsecret' or c_key='weixin_token' or c_key='weixin_payid' or c_key='weixin_paykey'";
	$result=$conn->query($sql);
	$sqls="select * from qb_hy_content1 where domainname='$domainnames'";
	$results=$conn->query($sqls);
	$jarr = array();
	while ($rows=mysqli_fetch_array($result,MYSQL_ASSOC)){
	    $count=count($rows);//不能在循环语句中，由于每次删除 row数组长度都减小  
	    for($i=0;$i<$count;$i++){  
	        unset($rows[$i]);//删除冗余数据  
	    }
	    array_push($jarr,$rows);
	}
	while ($rows=mysqli_fetch_array($results,MYSQL_ASSOC)){
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