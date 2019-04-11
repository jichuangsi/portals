INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '直接推荐人奖励积分', 'propagandize_money_1', '10', 'number', '', 0, '', '也即一级推荐人', 0, -26);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '二级推荐人奖励积分', 'propagandize_money_2', '5', 'number', '', 0, '', '', 0, -26);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '三级推荐人奖励积分', 'propagandize_money_3', '2', 'text', '', 0, '', '', 0, -26);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '只要用户访问就奖励积分', 'propagandize_money_visit', '1', 'number', '', 0, '', '即不注册也奖励积分.不注册就奖励,容易钻空子,所以二级与三级推荐人不做奖励', 0, -26);


INSERT INTO `qb_hook_plugin` (`id`, `hook_key`, `plugin_key`, `hook_class`, `about`, `ifopen`, `list`, `author`, `author_url`, `version`, `version_id`) VALUES(0, 'user_add_end', '', 'plugins\\propagandize\\hook\\Tzr', '推荐人注册会员奖励', 1, 0, '', '', '', 0);
INSERT INTO `qb_hook_plugin` (`id`, `hook_key`, `plugin_key`, `hook_class`, `about`, `ifopen`, `list`, `author`, `author_url`, `version`, `version_id`) VALUES(0, 'index_begin', '', 'plugins\\propagandize\\hook\\Tzr', '记录推荐人信息', 1, 0, '', '', '', 0);
INSERT INTO `qb_hook_plugin` (`id`, `hook_key`, `plugin_key`, `hook_class`, `about`, `ifopen`, `list`, `author`, `author_url`, `version`, `version_id`) VALUES(0, 'layout_body_foot', '', 'plugins\\propagandize\\hook\\Tzr', '推荐人显示分享按钮', 1, 0, '', '', '', 0);
