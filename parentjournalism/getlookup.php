<?php
	header("Content-type: application/json");
	//跨域
	header("Access-Control-Allow-Credentials: true");
	header("Access-Control-Allow-Origin: *");
	//CORS
	header("Access-Control-Request-Methods:GET, POST, PUT, DELETE, OPTIONS");
	header('Access-Control-Allow-Headers:x-requested-with,content-type,test-token,test-sessid');//注意头部自定义参数不要用下划线
	$conn = new MySQLi("127.0.0.1","root","root","education");
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
	$sql="select id,fid,mid,title,view,agree,create_time,picurl,content,case when replynum >= 0 then '0' else replynum end as replynum,case when fid = 9 then '2' else 1 end as status from qb_cms_content1 where title like '%$title%' limit $page,$pagesize";
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