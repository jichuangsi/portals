<?php
//	header("Content-type:text/html;charset=utf-8");
	header("Content-type: application/json");
	//跨域
	header("Access-Control-Allow-Credentials: true");
	header("Access-Control-Allow-Origin: *");
	//CORS
	header("Access-Control-Request-Methods:GET, POST, PUT, DELETE, OPTIONS");
	header('Access-Control-Allow-Headers:x-requested-with,content-type,test-token,test-sessid');//注意头部自定义参数不要用下划线
	$conn = new MySQLi("127.0.0.1","root","root","education");
	$status=null;  //分类
	$pageindex=0;  //页数
	$pagesize=10;  //条数
	if(isset($_GET['status'])){
		$status=$_GET['status'];
	}else{
		 echo '请输入status参数';;
		exit();
	}
	if(isset($_GET['pageindex'])){
		$pageindex=$_GET['pageindex'];
	}
	if(isset($_GET['pagesize'])){
		$pagesize=$_GET['pagesize'];
	} 
	$sql="select id,fid,mid,title,view,agree,create_time,picurl,content,case when replynum >= 0 then '0' else replynum end as replynum  from qb_cms_content1 where 1=1 ";
   	if($status != null){
   		if($status==1){
   			$sql=$sql." and fid!=9 ";
   		}else if($status==2){
   			$sql=$sql." and fid=9 ";
   		}
   	}
   	$page=$pageindex*$pagesize;
   	$sql=$sql." limit $page,$pagesize";
   	$result=$conn->query($sql);
 	
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