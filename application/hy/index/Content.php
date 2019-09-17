<?php
namespace app\hy\index;

use app\common\controller\index\C; 
use app\hy\model\Member AS QMember;
use app\common\model\User AS UserModel;
include  './config.inc.php';
include  './uc_client/client.php';

//内容页与列表页
class Content extends C
{
    //取消每次刷新都更新点击
    protected function updateView($id){
    }
    
    protected function get_user_group($id){
        $user = $this->user;
        if (empty($user)) {
            return ;
        }
        $map = [
                'aid'=>$id,
                'uid'=>$user['uid']
        ];
        $info = QMember::get($map);
        if(empty($info)){
            return ;
        }
        if(time()-$info['update_time']>60){
            $data['update_time'] = time();
            $data['id'] = $info['id'];
            QMember::update($data);
        }
        if($info['type']==0){
            return -1;
        }else{
            return $info['type'];
        }
    }
	
	/**
	 * 列表页
	 * {@inheritDoc}
	 * @see \app\common\controller\index\C::index()
	 */
	public function index($fid=0,$mid=0,$hytitle=null){
	    return parent::index($fid,$mid,$hytitle);
	}
	
	public function getcommgradexin($infoid=1){
		 $rs=query("select avg(gradexin) as gradexin from qb_comment_content  where sysid=11 and status=1 and aid=$infoid");		 
		 return round($rs['0']['gradexin']);
	}
	/**
	 * 内容详情页
	 * {@inheritDoc}
	 * @see \app\common\controller\index\C::show()
	 */
	public function show($id){
	    $this->assign('gid', $this->get_user_group($id) );
	    return parent::show($id);
	}
	/**
	 *新闻详情页 
	 */
	public function hycmsshow($id){
		 return parent::hycmsshow($id);
	}
	
	/**
	 * 
	 */
	public function lyguide(){
		return $this->fetch();
	} 
	/*
	 * 机构入驻
	 */
	public function ruzhu(){
		return $this->fetch();
	}
	/*
	 * 登陆
	 */
	
	public function lylogin(){
		return $this->fetch();
	}
	/*
	 * 个人中心
	 */
	public function personal(){
		if(!$this->user){
	        return $this->success('你还没登录',url('/hy/content/lylogin'));
	    }
	    $uid=$this->user['uid'];
		$lyuser=query("select * from qb_memberdata where uid='$uid'");
		$this->assign("lyuser",$lyuser[0]);
		return $this->fetch();
	}
	/*
	 * 机构评论
	 */
	public function hycomment($infoid=0){
		if($infoid==0){
			return $this->error("无法获取评论的内容");
		}
		$this->assign("infoid",$infoid);
		return $this->fetch();
	}
	public function getcommgradexins($infoid=1){
		$rs=query("select avg(gradexin) as gradexin from qb_comment_content  where sysid=11 and status=1 and aid=$infoid");
		return round($rs['0']['gradexin']);
	}
	/*
	 * 发表评论
	 */
	public function addcomment($infoid=0,$comminfo=null,$gradexin=3){
		if (empty($this->user)) {
	        $this->error('你还没登录!');
	    }		
	    $uid=$this->user['uid'];
	    $time=time();
		$rs=query("insert into qb_comment_content(pid,sysid,aid,uid,disagree,status,create_time,content,gradexin) values(0,11,$infoid,$uid,0,1,'$time','$comminfo','$gradexin')");
		return $rs;
	}
	/*
	 * 获取评论
	 */
	public function getcomment($infoid=0,$rows=5,$pages=0){
		$limits=($pages-1)*$rows;
		$rs=query("select comm.*,mem.nickname,mem.icon from qb_comment_content comm inner join qb_memberdata mem on comm.uid=mem.uid  where sysid=11 and status=1 and aid='$infoid' order by create_time desc limit $limits,$rows");
		return $rs;
	}
	
	/*
	 * 精品课程列表
	 */
	public function boutique(){
		return $this->fetch();
	}
	/*
	 * 收藏页面
	 */
	public function lycollect(){
		return $this->fetch();
	}
	public function delcollect($id=0){
		$rs=query("delete from qb_fav where id=$id");
		return $rs;
	}
	/*
	 * 订单页面
	 */
	public function lyorder($id=null){
		if($id==null){
			$this->error("该信息不存在");
		}
		$rs=query("select * from qb_hy_content1 where id=$id");
		$this->assign("coninfo",$rs[0]);
		return $this->fetch();
	}
	/*
	 * 存在订单的机构页面
	 */
	public function lyisorder(){
		return $this->fetch();
	}
	public function lyorderdetails($id=null,$orderid=null){
		if($id==null||$orderid==null){
			$this->error("该信息不存在");
		}
		$rs=query("select * from qb_hy_content1 where id=$id");
		$this->assign("coninfo",$rs[0]);
		$this->assign("orderid",$orderid);
		return $this->fetch();
	}
	/**
	 * 获取所有有域名的机构
	 */
	public function gethycontent(){
		$rs=query("select * from qb_hy_content1 where domainname is not null and domainname <> ''");
		return $rs;
	}
	/*
	 * 获取收藏信息
	 */
	public function getcollect($rows=10,$pages=1){
		$uid=$this->user['uid'];
		if($uid==null||$uid==""){
			return 0;
		}
		$limits=($pages-1)*$rows;
		$result=query("select *,fav.id as favid from qb_fav fav inner join qb_hy_content1 hycont on fav.aid=hycont.id where sysid=11 and fav.uid=$uid limit $limits,$rows");
		return $result;
	}
	
	/*
	 * 注册
	 */
	public function lyregister(){
		return $this->fetch();
	}
	/*
	 * 修改邮箱
	 */
	public function lyemail(){
		$uid=$this->user['uid'];
		$lyuser=query("select * from qb_memberdata where uid='$uid'");
		$this->assign("lyuser",$lyuser[0]);
		return $this->fetch();
	}
	public function uplyemail($mail=null,$pwd=null){
		$userid=$this->user['uid'];
		if($pwd!=null){
			list($uid, $username, $password, $email) = uc_user_login($this->user['username'], $pwd);
			if($uid > 0) {
			} elseif($uid == -1) {
				 return $this->error("用户不存在,或者被删除");
			} elseif($uid == -2) {
				return $this->error("密码错误");
			} else {
				return $this->error("未定义");
			}
		}else{
			return $this->error("请输入密码");
		}
		if($mail!=null){
			if(UserModel::get_info($mail,'email') ){
				return $this->error("该邮箱已被注册");
            }else{
//          	 list($uid, $username, $password, $email) = uc_user_login($data['username'], "test125");
            	$uids=uc_user_edit($this->user['username'],$pwd,$pwd,$mail);
//				return $this->error($uids);
				if($uids>=1){
					$rs=query("update qb_memberdata set email='$mail' where uid='$userid'");
					if($rs>=1){
						return $this->success($rs);
					}
				}else if($uids==-4){
					return $this->error("邮箱格式有误");
				}else if($uids==-5){
					return $this->error("该邮箱不允许注册");
				}else if($uids==-6){
					return $this->error("该邮箱已被注册");
				}
				return $this->error("失败");
            }
		}
	}
	/*
	 * 修改号码
	 */
	public function lyphone(){
		return $this->fetch();
	}
	/*
	 * 修改密码
	 */
	public function lypwd(){
		if (empty($this->user)) {
	        $this->error('你还没登录!');
	    }
		return $this->fetch();
	}
	public function uplypwd($oldpwd=null,$newpwd=null){
		$useruid=$this->user['uid'];
		if($oldpwd==null||$newpwd==null){
			 $this->error('密码不能为空');
		}
		list($uid, $username, $password, $email) = uc_user_login($this->user['username'], $oldpwd);
			if($uid > 0) {
			} elseif($uid == -1) {
				  $this->error("用户不存在,或者被删除");
			} elseif($uid == -2) {
				 $this->error("密码错误");
			} else {
				 $this->error("未定义");
			}
			$uids=uc_user_edit($this->user['username'],$oldpwd,$newpwd,$this->user['email']);
			if($uids>=1){
				UserModel::quit($this->user['uid']);
		        $logoout=uc_user_synlogout();
		        echo $logoout;
				$this->success("修改密码需要重新登录","hy/content/personal");
			}
			 $this->error("失败");
	}
	/*
	 * 设置
	 */
	public function lyset(){
		$uid=$this->user['uid'];
		$lyuser=query("select * from qb_memberdata where uid='$uid'");
		$this->assign("lyuser",$lyuser[0]);
		return $this->fetch();
	}
	/*
	 * 修改头像
	 */
	public function upicon($iconurl=null){
		if(!$this->user){
	        return $this->error('你还没登录');
	    }
	    if($iconurl==null){
	    	return $this->error('请选择文件');	
	    }
	    $uid=$this->user['uid'];
	    $rs=query("update qb_memberdata set icon='$iconurl' where uid='$uid'");
	    return $rs;
	}
	/**
	 *活动的机构列表 
	 */
	public function lyglist($aid=null){
		if($aid==null){
			return $this->error("缺少活动id");
		}
		$this->assign('aid',$aid);
		return $this->fetch();
	}
	/*
	 * 获取活动机构列表
	 */
	public function getorgan($aid=0,$rows=10,$pages=1){
		$limits=($pages-1)*$rows;
		$rs=query("select * from qb_hy_content1 hy inner join qb_activity_relation ar on hy.id=ar.gid where hy.status>=1 and ar.aid='$aid' group by hy.id limit $limits,$rows");
		return $rs;
	}
	
	/*
	 * 获取这个机构参与活动的课程列表
	 */
	public function getactivityklist($aid=null,$gid=null){
		if($aid==null){
			return $this->error("缺少活动id");
		}
		if($gid==null){
			return $this->error("缺少机构id");
		}
		$rs=query("select * from qb_hy_content1 where id='$gid'");
		$this->assign('ginfo',$rs);
		$this->assign('aid',$aid);
		return $this->fetch();
	}
	
	/*
	 * 用户协议
	 */
	public function agreement(){
		return $this->fetch();
	}
	/*
	 * 隐私政策
	 */
	public function privacypolicy(){
		return $this->fetch();
	}
	public function add($mid=1){
	    if(!$this->user){
	        return $this->error('你还没登录');
	    }
	    $this->assign('mid',$mid);
	    return $this->fetch('post');
	}
	
	public function my(){
	    if (empty($this->user)) {
	        $this->error('你还没登录!');
	    }
	    $this->assign('uid',$this->user['uid']);
	    return $this->fetch();
	}
	
}
