<?php
namespace app\common\fun;

/**
 * 标签用到的相关函数
 */
class Label{
    
    /**
     * 获得标签动态变量参数
     * @param string $code 比如 fid=$fid&uid=$info[uid]&pid=$info.pid
     * @return void|string
     */
    public function get_union($code=''){
        if($code==''){
            return ;
        }
        $detail = strstr($code,'@') ? explode('@',$code) : explode('&',$code);
        foreach($detail AS $str){
            if( !strstr($str,'|') ){
                list($field,$value) = explode('|',preg_replace('/^([-\w\.]+)([<>=\*]+)([^<>=\*]+)/i','\\1|\\3',$str));
            }else{
                list($field,$mod,$value) = explode('|',$str);
            }
            $field = trim($field);
            $value = trim($value);
            if(substr($value,0,1)=='$'){
                if(strstr($value,'.')){
                    $value = str_replace('.','[',$value).']';
                }
                $array[] = $field.'='.substr($value,1);
            }            
        }
        return implode(',',$array);
    }
    
    /**
     * 获取查询语句中的动态变量
     * @param unknown $field
     * @param unknown $value
     * @param unknown $cfg
     * @return string|unknown
     */
    private function get_label_value($field,$value,$cfg){
        if( substr($value,0,1)=='$' ){
            $value = isset($cfg[$field]) ? $cfg[$field] : null ;
        }
        return $value;
    }
    
    /**
     * 查询数据库前, 格式化标签查询语句 
     * 比如 where="fid=$fid&uid=$info[uid]&pid=$info.pid" 多条件查询
     * @param string $code
     * @return unknown
     */
    public function where($code='',$cfg=[]){
        if($code==''){
            return ;
        }
        if(strstr($code,'"')){
            $array = json_decode($code,true);
        }else{
            $detail = strstr($code,'@') ? explode('@',$code) : explode('&',$code);
            foreach($detail AS $str){
                if( !strstr($str,'|') ){
                    $str = str_replace('!=','<>',$str);
                    list($field,$value) = explode('|',preg_replace('/^([-\w\.]+)([<>=\*]+)([^<>=\*]+)/i','\\1|\\3',$str));
                    $mod = preg_replace('/^([-\w\.]+)([<>=\*]+)([^<>=\*]+)/i','\\2',$str);
                    if($value=="''"){
                        $value='';
                    }
                    if( substr($value,0,1)=='$' ){
                        $value = $this->get_label_value(trim($field),$value,$cfg);
                        if ($value===null) {
                            continue;
                        }
                        if($mod=='*'){
                            $array[trim($field)] = ['LIKE',"%$value%"];
                        }elseif( strstr($value,',') ){
                            $array[trim($field)] = [$mod=='='?'in':'not in',explode(',',$value)];
                        }else{
                            $array[trim($field)] = [$mod,$value];
                        }
                    }elseif($mod=='*'){
                        $array[trim($field)] = ['LIKE',"%$value%"];
                    }elseif(strstr($value,',')){
                        $value = explode(',',$value);
                        $array[trim($field)] = [
                                $mod=='<>'?'not in':'in',
                                $value,                                
                        ];
                    }else{
                        $array[trim($field)] =  [$mod,trim($value)];
                    }
                    continue;
                }
                list($field,$mod,$value) = explode('|',$str);
                $field = trim($field);
                $mod = trim($mod);
                $value = trim($value);
                if($value=="''"){
                    $value='';
                }
                if($mod=='='){
                    $array[$field] = $value;
                }else{
                    if( substr($value,0,1)=='$' ){
                        $array[trim($field)] = $this->get_label_value(trim($field),$value,$cfg);
                    }elseif(strstr($value,',')){
                        $value = explode(',',$value);
                    }
                    $array[$field] = [$mod,$value];
                }
            }
        }
        return $array;
    }
    
    /**
     * 通用标签用的
     * @param unknown $tag_name
     * @param unknown $cfg
     */
    public function run_label($tag_name,$cfg){
        return controller('index/labelShow')->get_label($tag_name,$cfg);
    }
    
    /**
     * 圈子黄页店铺专用标签
     * @param unknown $tag_name
     * @param unknown $cfg
     */
    public function run_hy($tag_name,$cfg){
        return controller('index/labelhyShow')->get_label($tag_name,$cfg);
    }
    
    /**
     * 表单标签
     * @param unknown $tag_name
     * @param unknown $cfg
     */
    public function run_form_label($tag_name,$cfg){
        controller('index/labelShow')->get_form_label($tag_name,$cfg);
    }
    
    /**
     * 通用标签的分页AJAX地址
     * @param string $tag_name
     * @param unknown $dirname
     */
    public function label_ajax_url($tag_name='',$dirname){
        controller('index/labelShow')->get_ajax_url($tag_name ,$dirname );
    }
    
    /**
     * 圈子黄页的分页AJAX地址
     * @param string $tag_name
     * @param unknown $dirname
     */
    public function label_hy_ajax_url($tag_name='',$dirname){
        controller('index/labelhyShow')->get_ajax_url($tag_name ,$dirname );
    }
    
    /**
     * 列表页标签
     * @param unknown $tag_name
     * @param unknown $cfg
     * @return unknown
     */
    public function run_listpage_label($tag_name,$cfg){
        return controller('index/labelShow')->listpage_label($tag_name,$cfg);  //返回分页代码
    }
    
    /**
     * 列表页显示分页
     * @param unknown $tag_name
     * @param unknown $info
     * @param unknown $cfg
     * @return unknown
     */
    public function run_showpage_label($tag_name,$info,$cfg){
        return controller('index/labelShow')->showpage_label($tag_name,$info,$cfg);    //返回分页代码
    }
    
    /**
     * 列表页的分页AJAX地址
     * @param string $tag_name
     */
    public function label_listpage_ajax_url($tag_name=''){
        controller('index/labelShow')->get_listpage_ajax_url($tag_name);
    }
    
    /**
     * 评论标签
     * @param unknown $tag_name
     * @param unknown $info
     * @param unknown $cfg
     */
    public function run_comment_label($tag_name,$info,$cfg){
        controller('index/labelShow')->comment_label($tag_name,$info,$cfg);
    }
    
    /**
     * 论坛回复标签
     * @param unknown $tag_name
     * @param unknown $info
     * @param unknown $cfg
     */
    public function reply_label($tag_name,$info,$cfg){
        controller('index/labelShow')->reply_label($tag_name,$info,$cfg);
    }
    
    /**
     * 各频道调用评论的接口
     * @param string $type 参数有三个，分别是 posturl 获取评论提交的地址，pageurl 获取评论的分页，list或留空即代表获取评论内容
     * @param number $aid 频道的内容ID
     * @param unknown $sysid 频道模块的ID，一般可以自动获取
     */
    public function comment_api($type='',$aid=0,$sysid=0,$cfg=[]){
        static $data = null;
        $order = $cfg['order'];
        $by = $cfg['by'];
        $status = $cfg['status'];
        $page = $cfg['page'];
        $rows = $cfg['rows'];
        if(empty($sysid)){
            $array = modules_config(config('system_dirname'));
            $sysid = $array?$array['id']:0;
        }
        $parameter = ['name'=>$cfg['name'],'pagename'=>$cfg['pagename'],'sysid'=>$sysid,'aid'=>$aid,'rows'=>$rows,'order'=>$order,'by'=>$by,'status'=>$status];
        if($type=='posturl'){
            return purl('comment/api/add',$parameter);
        }elseif($type=='pageurl'){
            return purl('comment/api/ajax_get',$parameter);
        }elseif($type=='apiurl'){
            return purl('comment/api/act',$parameter);
        }else{
            $data = controller("plugins\\comment\\index\\Api")->get_list($sysid,$aid,$rows,$status,$order,$by,$page);
            //$data = $data ? getArray($data)['data'] : [];
            return $data;
        }
    }
    
    
    /**
     * 论坛回复
     * @param string $type 参数有三个，分别是 posturl 获取回复提交的地址，pageurl 获取回复的分页，list或留空即代表获取回复内容
     * @param number $aid 频道的内容ID
     */
    public function reply_api($type='',$aid=0,$cfg=[]){
        static $data = null;
        $order = $cfg['order'];
        $by = $cfg['by'];
        $status = $cfg['status'];
        $page = $cfg['page'];
        $rows = $cfg['rows'];
        $parameter = ['name'=>$cfg['name'],'pagename'=>$cfg['pagename'],'aid'=>$aid,'rows'=>$rows,'order'=>$order,'by'=>$by,'status'=>$status];
        if($type=='posturl'){
            return auto_url('reply/add',$parameter);
        }elseif($type=='pageurl'){
            return auto_url('reply/ajax_get',$parameter);
            // if(is_object($data)){
            //return $data->render();   //分页代码
            //}
        }else{
            $data = controller('Reply','index')->get_list($aid,$rows,$status,$order,$by,$page);
            $listdb = $data ? getArray($data)['data'] : [];
            return $listdb;
        }
    }
   
   
}