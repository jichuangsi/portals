
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '鼓励奖积分数,可为0', 'dialmoney4', '0', 'text', '', 0, '', '', 6, -22);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '三等奖可得积分多少个', 'dialmoney3', '4', 'text', '', 0, '', '', 7, -22);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '二等奖可得积分多少个', 'dialmoney2', '8', 'text', '', 0, '', '', 8, -22);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '一等奖可得积分多少个', 'dialmoney1', '10', 'text', '', 0, '', '', 9, -22);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '每玩一局需要消费多少积分', 'paymoney', '3', 'text', '', 0, '', '', 10, -22);


DROP TABLE IF EXISTS `qb_gamedial_member`;
CREATE TABLE IF NOT EXISTS `qb_gamedial_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(7) NOT NULL DEFAULT '0' COMMENT '参与者的ID',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `money` smallint(4) NOT NULL DEFAULT '0' COMMENT '抽中的积分',
  `typesize` tinyint(1) NOT NULL DEFAULT '0' COMMENT '多少等奖',
  PRIMARY KEY (`id`),
  KEY `pageid` (`uid`,`create_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='大转盘游戏' AUTO_INCREMENT=1 ;