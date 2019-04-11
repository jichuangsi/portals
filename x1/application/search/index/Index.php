<?php
namespace app\search\index;
use app\common\controller\IndexBase;
use think\Db;
use think\Request;
class Index extends IndexBase{
	/**
	 * 搜索首页
	 * @return mixed
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function index(){
		$resou=Db::name('search_keyword')->order('searchnums desc')->limit(30)->select();
		return $this->fetch('',['resou'=>$resou]);
	}

	/**
	 * 列表显示
	 * @param string $keyword 关键词
	 * @param int $page 分页码
	 * @param string $wap 手机版下一页区分
	 * @param string $type 模块化搜索
	 * @return mixed|string
	 * @throws \think\Exception
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function lists($keyword='',$page=0,$wap='',$type=''){
		$page=intval($page);
		$keyword=filtrate($keyword);
		if(empty($keyword)){
			$this->error('关键词不能为空！');
		}
		
		$map=[];
		$map['data']=['like',"%$keyword%",];
		if(!empty($type)){
			$map['module']=$type;
		}
		$res=Db::name('search_keyword')->where('keyword',$keyword)->count();
		if($res){
			Db::name('search_keyword')->where('keyword',$keyword)->setInc('searchnums');
		}else{
			if(isset($keyword{2})){
				$datakey=['keyword'=>$keyword,'searchnums'=>1];
				Db::name('search_keyword')->insert($datakey);
			}
		}
		$data=Db::name('search_content')->where($map)->order(['id'=>'DESC'])->paginate(30,false,['query'=>request()->param()]);
		foreach($data as $key=>$rs){
			$lists[$key]['id']=$rs['aid'];
			$lists[$key]['module']=$rs['module'];
			$lists[$key]['title']=preg_replace("/($keyword)/i","<em>\\1</em>",$this->get_search($rs['data']));
			$lists[$key]['des']=preg_replace("/($keyword)/i","<em>\\1</em>",$this->get_search($rs['data'],1));
			$lists[$key]['create_time']=date("Y-m-d",$rs['create_time']);
			$lists[$key]['picurl']=$rs['picurl'];
		}
		$resou=Db::name('search_keyword')->order('searchnums desc')->limit(30)->select();
		if($wap){
			if(count($lists)>0){
				foreach($lists AS $key=>$rs){
					$url=url($rs[module].'/content/show',['id'=>$rs[id]],'html',true);
					$show.="<div class=\"g\"><h2><a href=\"$url\" class=\"s\">$rs[title]</a></h2><div class=\"std\">$rs[des]...&nbsp;详细&gt;&gt;</div><span class=\"a\">$url</span></div>";
				}
			}else{
				return '[NONO_NO_NONO]';
			}
			return $show;
		}else{
			return $this->fetch('',['lists'=>$lists,'resou'=>$resou,'keyword'=>$keyword,'data'=>$data,'page'=>$page]);
		}
	}

	/**
	 * 分割data数据
	 * @param $data
	 * @param int $num 0 标题  1 描述
	 * @return mixed
	 */
	public function get_search($data,$num=0){
		$text=explode('####',$data);
		return $text[$num];
	}
}
