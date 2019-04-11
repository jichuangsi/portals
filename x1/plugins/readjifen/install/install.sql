INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES('', -1, '开启的模块', 'read_config', 'cms,shop', 'text', '', 1, '', '多个模块请用,隔开 开启后内容页停留多少秒送积分 阅读次数是所有开启模块的累积', 99, -1);
 INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES('', -1, '停留多少毫秒', 'read_time', '8000', 'text', '', 1, '', '单位是毫秒阅读内容多少毫秒送积分 8000 8秒 区间的就设置8000#10000 8秒-10秒间随机 ', 99, -1);
  INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES('', -1, '阅读多少篇送多少', 'read_cishu', '5|20#10|30', 'text', '', 1, '', '格式：5|20#10|30 表示阅读5篇送20分或者元，阅读10篇送30或者元 阅读次数必须大于1', 99, -1);
  INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES('', -1, '送的币种', 'read_bizhong', 'jifen', 'radio', 'jifen|积分\nrmb|人民币', 1, '', '', 98, -1);
 
INSERT INTO `qb_hook_plugin` (`id`, `hook_key`, `plugin_key`, `hook_class`, `about`, `ifopen`, `list`, `author`, `author_url`) VALUES
('', 'layout_body_foot', 'readjifen', 'plugins\\readjifen\\index\\Read', '', 1, 0, '', '');

CREATE TABLE IF NOT EXISTS `qb_readjifen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `count` tinyint(5) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;