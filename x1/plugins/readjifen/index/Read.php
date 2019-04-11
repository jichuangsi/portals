<?php
namespace plugins\readjifen\index;
use app\common\controller\IndexBase;
class Read extends IndexBase{
	public function layoutBodyFoot(){
		if(strpos(config('webdb.read_config'),request()->module())!==false&&preg_match('/(\/show)/i',request()->url(true))){
			$read_time=explode('#',config('webdb.read_time'));
			if(count($read_time)>1){
				$shijian=mt_rand($read_time[0],$read_time[1]);
			}else{
				$shijian=config('webdb.read_time');
			}
			$template=ROOT_PATH.'plugins/readjifen/index/read.htm';
			echo $this->fetch($template,['shijian'=>$shijian]);
		}
	}

	public function postajax(){
		if($this->request->isPost()){
			$data=$this->request->param();
			$current=date("Ymd",time());
			$read=db('readjifen')->where('uid',$this->user['uid'])->find();
			if(!$read){
				$data=['uid'=>$this->user['uid'],'count'=>1,'time'=>$current];
				db('readjifen')->insert($data);
			}elseif($read['time']==$current){
				db('readjifen')->where('uid',$this->user['uid'])->setInc('count');
				$num=db('readjifen')->where('uid',$this->user['uid'])->value('count');
				$read_cishu=explode('#',config('webdb.read_cishu'));
				foreach($read_cishu AS $key=>$value){
					$songfen=explode('|',$value);
					if($num==$songfen[0]){
						if(config('webdb.read_bizhong')=='jifen'){
							add_jifen($this->user['uid'],$songfen[1],"在线阅读 $num 篇文章送 $songfen[1] 积分");
							$outArr['info']="在线阅读 $num 篇文章送 $songfen[1] 积分";
						}else{
							add_rmb($this->user['uid'],$songfen[1],0,"在线阅读 $num 篇文章送 $songfen[1] 元");
							$outArr['info']="在线阅读 $num 篇文章送 $songfen[1] 元";
						}
						$outArr['status']=2;
						return (json($outArr));
					}
				}
			}else{
				db('readjifen')->where('uid',$this->user['uid'])->update(['time'=>$current,'count'=>1]);
			}
		}
	}
}