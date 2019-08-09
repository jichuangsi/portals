<?php
namespace app\common\fun;

use think\Db;
use app\common\model\User AS UserModel;

class Xiangke{
	//获取评论综合评分
	public function getcommgradexin($infoid=1){
		 $rs=query("select avg(gradexin) as gradexin from qb_comment_content  where sysid=11 and status=1 and aid=$infoid");
		 return round($rs['0']['gradexin']);
	}
	
}
