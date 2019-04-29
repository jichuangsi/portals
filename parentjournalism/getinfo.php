<?php
	header("Content-type: application/json");
	//跨域
	header("Access-Control-Allow-Credentials: true");
	header("Access-Control-Allow-Origin: *");
	//CORS
	header("Access-Control-Request-Methods:GET, POST, PUT, DELETE, OPTIONS");
	header('Access-Control-Allow-Headers:x-requested-with,content-type,test-token,test-sessid');//注意头部自定义参数不要用下划线
	$conn = new MySQLi("127.0.0.1","root","root","education");
	$infoid=null;
	$r;
	if(isset($_GET['infoid'])){
		$infoid=$_GET['infoid'];
	}else{
		$r['errorCode']='0';
		$r['errorstatus']='缺少infoid参数！';
		echo $str=json_encode($r);
		exit();
	}
	$id=$infoid;
	$sql="select id,fid,mid,title,view,agree,create_time,picurl,content from qb_cms_content1";
	if($infoid!=null){
		$sql=$sql." where id='$infoid' ";
	}
	$result=$conn->query($sql);
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