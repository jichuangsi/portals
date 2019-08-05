<?php
namespace app\exam\traits;

trait Content
{
	

	/**
	 * 手工录入试题
	 */
	public function add($fid=0,$mid=0)
	{
		$this->check_power();
		$data = $this->request->post();
		isset($data['fid']) && $fid = $data['fid'];

		if($fid && !$mid){
			$mid = $this->model->getMidByFid($fid);
		}elseif( !$fid && !$mid ){  //栏目与模型都为空
			return self::postnew($mid);
		}elseif( config('post_need_sort') && !$fid ){  //指定必须要选择栏目的频道
			return self::postnew($mid);
		}
		$this->mid = $mid;
		
		//接口
		hook_listen('cms_add_begin',$data);
		if (($result=$this->add_check($mid,$fid,$data))!==true) {
			$this->error($result);
		}
		
		// 保存数据
		if ($this -> request -> isPost()) {
			$data['grade'] = $data['grade'] ? ','.implode(',', $data['grade']).',' : '' ;
			$data['kemu'] = $data['kemu'] ? ','.implode(',', $data['kemu']).',' : '' ;
			$data['step'] = $data['step'] ? ','.implode(',', $data['step']).',' : '' ;
			
			$this->saveAdd($mid,$fid,$data);
		}
		
		$this->form_items = array_merge(
				[
						[ 'checkbox','grade','所属年级','',fun('exam@get_sort','grade')],
						[ 'checkbox','kemu','所属科目','',fun('exam@get_sort','kemu')],
						[ 'checkbox','step','所属章节','',fun('exam@get_sort','step')],
				],
				$this->getEasyFormItems()   //发布表单里的自定义字段
				);
		
		//联动字段
		$this->tab_ext['trigger'] = $this->getEasyFieldTrigger();
		
		$this->tab_ext['page_title'] = '新增试题';
		
		return $this->addContent('index',['fid'=>$fid]);
	}
	
	
	/**
	 * 修改试题
	 * @see \app\common\controller\admin\C::edit()
	 */
	public function edit($id)
	{
		$this->mid = $this->model->getMidById($id);
		
		// 保存数据
		if ($this -> request -> isPost()) {
			//表单数据
			$data = $this->request->post();
			
			$data['grade'] = $data['grade'] ? ','.implode(',', $data['grade']).',' : '' ;
			$data['kemu'] = $data['kemu'] ? ','.implode(',', $data['kemu']).',' : '' ;
			$data['step'] = $data['step'] ? ','.implode(',', $data['step']).',' : '' ;
			
			$this->saveEdit($this->mid,$data);
		}
		
		$this->form_items = array_merge(
				[
						[ 'checkbox','grade','所属年级','',fun('exam@get_sort','grade')],
						[ 'checkbox','kemu','所属科目','',fun('exam@get_sort','kemu')],
						[ 'checkbox','step','所属章节','',fun('exam@get_sort','step')],
				],
				$this->getEasyFormItems()   //发布表单里的自定义字段
				);
		
		//联动字段
		$this->tab_ext['trigger'] = $this->getEasyFieldTrigger();
		
		$this->tab_ext['page_title'] = $this->m_model->getNameById($this->mid);
		
		if(empty($id)) $this->error('缺少参数');
		
		$info = $this->getInfoData($id);
		
		//修改内容后，最好返回到模型列表页，因为有可能修改了栏目
		return $this->editContent($info);
	}

	
	//excel批量导入试题
	public function batchadd(){
		$this->check_power();
		if($this -> request -> isPost()){
			$postdb = $this->request->post();
			
			$excel_file = $postdb[excel_file]; //上传的文件
			if(!preg_match('/\.xls$/',$excel_file)){
				$this->error('只能是.xls结尾的2000版或2003版excel表格');
			}
			$xls = ROOT_PATH.'public/'.$excel_file; //文件路径
			
			$listdb=read_excel($xls);
			
			$vertical_num = count($listdb); //多少行,即多少条记录
			if($vertical_num<1){
				$this->error('没有任何数据!');
			}
			
			$grade = $postdb['grade'] ? ','.implode(',', $postdb['grade']).',' : '' ;
			$kemu = $postdb['kemu'] ? ','.implode(',', $postdb['kemu']).',' : '' ;
			$step = $postdb['step'] ? ','.implode(',', $postdb['step']).',' : '' ;
			$mid = $postdb['mid'];
			$this->mid = $mid;
			isset($postdb['fid']) && $fid = $postdb['fid'];
			$fid = $fid ? $fid : 0;
			
			set_time_limit(0);
			unset($data);
			$fail_num = $succee_num = 0;
			
			//$listdb 是取自excel表格内的记录
			//第一行是标题,不需要入库,从第二行开始入库
			//每行中的第一列的$key为0,第二列的$key为1以此类推
			foreach($listdb AS $i=>$rs){
				if($i==0){
					continue;
				}
				if(!$rs[0]){ //标题不存在直接跳过
					continue;
				}
				
				//单选题 (单选1、多选2)
				if($mid<3){
					$data['grade'] = $grade;
					$data['kemu'] = $kemu;
					$data['step'] = $step;
					$data['mid'] = $mid;
					
					$rs[5] = str_replace(array("a","b","c","d"),array("1","2","3","4"),strtolower($rs[5]));
					$data['title'] = $rs[0];
					$data['answer_a'] = $rs[1];
					$data['answer_b'] = $rs[2];
					$data['answer_c'] = $rs[3];
					$data['answer_d'] = $rs[4];
					$data['answer'] = $rs[5];
					$data['content'] = $rs[6]?:'';
				}else if($mid==3){//判断题
					$data['grade'] = $grade;
					$data['kemu'] = $kemu;
					$data['step'] = $step;
					$data['mid'] = $mid;
					
					$rs[1] = str_replace(array("正确","错误","对","错"),array("1","2","1","2"),$rs[1]);
					$data['title'] = $rs[0];
					$data['answer'] = $rs[1];
					$data['content'] = $rs[2];
				}else{
					$this->error('未知题型，可联系管理员进行处理！');
				}
				
				$save_result = $this->saveAdd($mid,$fid,$data,false);
				if($save_result){
					$succee_num++;
				}
				unset($data);
			}
			
			unlink($xls);
			$this->success("excel成功导入<span style='color:red;'>{$succee_num}</span>条试题", auto_url('index',$fid ? ['fid'=>$fid] : ['mid'=>$mid]) );
			
		}
		
		$this->form_items = [
				[ 'checkbox','grade','所属年级','<script> $(function(){ if($("#atc_grade").children().length<1){ $("#form_group_grade").remove();}  });</script>',fun('exam@get_sort','grade')],
				[ 'checkbox','kemu','所属科目','<script>$(function(){ if($("#atc_kemu").children().length<1){ $("#form_group_kemu").remove();} });</script>',fun('exam@get_sort','kemu')],
				[ 'checkbox','step','所属章节','<script>$(function(){ if($("#atc_step").children().length<1){ $("#form_group_step").remove();}  });</script>',fun('exam@get_sort','step')],
				['radio', 'mid', '题型(必须要与excel表格对应)', '', [1 => '单选题', 2 => '多选题',3 => '判断题'], 1],
				['file', 'excel_file', 'excel表格','注意事项：只能是.xls结尾的2000版或2003版excel表格，请点击下载各种题型的样本，<a href="http://down.qibosoft.com/exam/a.xls" target="_blank">单选题范例</a>、<a href="http://down.qibosoft.com/exam/b.xls" target="_blank">多选题范例</a>、<a href="http://down.qibosoft.com/exam/c.xls" target="_blank">判断题范例</a>'],
		];
		$this->tab_ext['page_title'] = 'excel导入试题';
		return $this->addContent('index');
	}
	
	
    /**
    * 处理提交的新发表数据
    * @param number $mid 模型ID
    * @param number $fid 栏目ID
    * @param array $data POST表单的数据
    */
	protected function saveAdd($mid=0,$fid=0,$data=[],$jump=true){

        //主要针对多选项的数组进行处理
        $data = $this->format_post_data($data);

        if(!empty($this->validate)){
            // 验证
            $result = $this->validate($data, $this->validate);
            if(true !== $result) $this->error($result);
        }
        $data['uid'] = $this->user['uid'];
        $data['mid'] = $this->mid;     

        $id = $this->model->addData($this->mid,$data);  
        
        if(is_numeric($id)){
            //以下两行是接口
            hook_listen('cms_add_end',$id,['data' =>$data, 'module' =>$this->request->module()]);       
            $this->end_add($id,$data);
            if($jump==true){
            	$this->success('新增成功', auto_url('index',$fid ? ['fid'=>$fid] : ['mid'=>$mid]) );
            }else{
            	return $id;
            }
            
        }else{
        	if($jump==true){
        		$this -> error('新增失败:'.$id);
        	}else{
        		return false;
        	}
            
        }
        
    }



    /**
     * 同时适用于前台与后台 新增加后做个性拓展
     * @param number $id 内容ID
     * @param number $data 内容数据
     */
//     protected function end_add($id=0,$data=[]){
//     }
    
    /**
     * 同时适用于前台与后台 修改后做个性拓展
     * @param number $id 内容ID
     * @param array $data 内容数据
     */
//     protected function end_edit($id=0,$data=[]){
//     }
    
    /**
     * 同时适用于前台与后台 删除后做个性拓展
     * @param number $id 内容ID
     * @param array $info 内容数据
     */
//     protected function end_delete($id=0,$info=[]){
//     }
}