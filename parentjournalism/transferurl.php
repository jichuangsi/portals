<?php
	$ssr=$_GET['ssr'];
	if($ssr==0){
		echo "<script>alert(22321)</script>";
	}else if($ssr==1){
		header("Location: http://www.bawenwang.com"); 
	}
		
?>