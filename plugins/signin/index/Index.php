<?php
namespace plugins\signin\index;

use app\common\controller\IndexBase;
use plugins\signin\model\Member;

class Index extends IndexBase
{
    /**
     * 签到列表
     * @param number $id    扩展频道ID
     * @param string $type   频道目录名
     * @return mixed|string
     */
    public function index($id=0,$type=''){
        
        $info = [];
        $sysid = 0;
        if ($id) {
            if (empty($type)) {
                $type = 'qun';
            }
            $array = modules_config($type);
            if (empty($array)) {
                $this->error('频道有误');
            }
            $sysid = $array['id'];
            $info = Member::get_info($id,$sysid);
        }
        
        $today = Member::count_sign('d',$id,$sysid);
        
        $yesd = cache('signin_yesd'."-$sysid-$id");
        if (empty($yesd)) {
            $yesd = Member::count_sign('y',$id,$sysid);
            cache('signin_yesd'."-$sysid-$id",$yesd,3600);
        }
        
        $yesd2 = cache('signin_yesd2'."-$sysid-$id");
        if (empty($yesd2)) {
            $yesd2 = Member::count_sign('y2',$id,$sysid);
            cache('signin_yesd2'."-$sysid-$id",$yesd2,3600*12);
        }
        
        $this->assign('today_num',$today);
        $this->assign('yesd_num',$yesd);
        $this->assign('yesd2_num',$yesd2);
        $this->assign('id',$id);
        $this->assign('type',$sysid);
        $this->assign('info',$info);
        return $this->fetch();
    }
}
