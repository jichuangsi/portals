DELETE FROM  `qb_config` WHERE  `c_key` =  'member_style';
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES('', 1, '会员中心风格', 'member_style', 'default', 'select', 'app\\common\\util\\Style@get_style@["member"]', 1, '', '', 98, 0);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES('', 1, '后台风格', 'admin_style', 'layui', 'select', 'app\\common\\util\\Style@get_style@["admin"]', 1, '', '', 97, 0);
