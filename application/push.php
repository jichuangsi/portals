<?php
/**
 *  push.php ��������
 *
 * @copyright			(C) 2005-2010 XTCMS
 * @license				http://www.newsteng.com/license/
 * @lastmodify			2011-3-8
 */
//defined('IN_XTCMS') or exit('No permission resources.');
define('PWD', '123456');
if(PWD != $_GET['pw']) exit('��֤�������');
define('API_URL_GET_KEYWORDS', 'http://tool.phpcms.cn/api/get_keywords.php');
function get_keywords($data, $number = 3) {
	$data = trim(strip_tags($data));
    if(empty($data)) return '';
	$http = pc_base::load_sys_class('http');
	if(CHARSET != 'utf-8') $data = iconv('utf-8', CHARSET, $data);
	else $data = iconv('utf-8', 'gbk', $data);
	$http->post(API_URL_GET_KEYWORDS, array('siteurl'=>SITE_URL, 'charset'=>CHARSET, 'data'=>$data, 'number'=>$number));
	if($http->is_ok()) {
		if(CHARSET != 'utf-8') return $http->get_data();
		else return iconv('gbk', 'utf-8', $http->get_data());
	}
	return '';
}
if(!$_POST['siteid']) exit("վ��ID������");
$categorys = getcache('category_content_'.$_GET['siteid'],'commons');
if($_POST){
	$info['catid'] = isset($_POST['catid']) ? intval($_POST['catid']): exit("���ID������");
	$info['title'] = isset($_POST['title']) ? trim($_POST['title']) : exit('���ⲻ��Ϊ��');
	$info['content'] = isset($_POST['content']) ? trim($_POST['content']) : exit('���ݲ���Ϊ��');
	$db = pc_base::load_model('content_model');
	$category = $categorys[$_POST['catid']];
	$modelid = $category['modelid'];
	$db->set_model($modelid);
	//�������Ŀ�����˹���������ô�����߹������趨
	$setting = string2array($category['setting']);
	$workflowid = $setting['workflowid'];
	$info['status'] = 99;
	$info['keywords'] = !empty($_POST['keywords']) ? $_POST['keywords'] : get_keywords($info['title'], 3);
	$info['description'] = !empty($_POST['description']) ? $_POST['description'] : str_cut(str_replace(array("\r\n","\t",'[page]','[/page]','&ldquo;','&rdquo;','&nbsp;'), '', strip_tags($info['content'])),200);
	$info['username'] = isset($_POST['username']) ? trim($_POST['username']) : '';
	$info['inputtime'] = isset($_POST['date']) ? trim($_POST['date']) : '';
	if($db->add_content($info)) exit('�ɹ�');
	exit('ʧ��');
}else{
	$str = '';
	foreach($categorys as $k=>$v){
		if(!$v['type']) $str .=  $v['catid'].'-'.$v['catname'].'|';
	}
	exit($str);
}
?>