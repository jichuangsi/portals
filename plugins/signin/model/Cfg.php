<?php
namespace plugins\signin\model;
use think\Model;


class Cfg extends Model
{
	
    // 设置当前模型对应的完整数据表名称
    protected $table = '__SIGNIN_CFG__';
    protected $autoWriteTimestamp = false;   // 自动写入时间戳
    protected $dateFormat = false;
    
    
}