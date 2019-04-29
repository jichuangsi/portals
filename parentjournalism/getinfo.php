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
	if(isset($_GET['infoid'])){
		$infoid=$_GET['infoid'];
	}else{
		echo '请输入infoid参数';
		exit();
	}
	$id=$infoid;
	$sql="select id,fid,mid,title,view,agree,create_time,picurl,content from qb_cms_content1";
	if($infoid!=null){
		$sql=$sql." where id='$infoid' ";
	}
	$result=$conn->query($sql);
//	$rs=mysqli_fetch_array($result);
//	$res=json_encode($rs);
//	$jarr = array();
//	echo $res;
	$jarr = array();
	while ($rows=mysqli_fetch_array($result,MYSQL_ASSOC)){
	    $count=count($rows);//不能在循环语句中，由于每次删除 row数组长度都减小  
	    for($i=0;$i<$count;$i++){  
	        unset($rows[$i]);//删除冗余数据  
	    }
	    array_push($jarr,$rows);
	}
	echo $str=json_encode($jarr);
?>