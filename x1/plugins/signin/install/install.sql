INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '超过第几名以后,则给少量积分多少个', 'sign_max_minmoney', '2', 'text', '', 0, '', '安慰奖励,可以调为0个,也可以设置为1个,尽量要少点', 6, -20);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '前几名签到才享受正常奖励', 'sign_max_num', '9:00=10,14:30=10', 'text', '', 0, '', '设置为0或者留空则不作人数限制,否则超过多少名后,将不奖励,或者是少奖励，也可以指定时间段才奖励，比如9:30=8,14:30=10,20:00=5', 7, -20);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '连续签到第三天可额外加多积分多少个', 'sign_money_day3', '5', 'text', '', 0, '', '第三天连续签到的话,在原来的基础上再额外加多积分多少个', 8, -20);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '连续签到第二天可额外加多积分多少个', 'sign_money_day2', '3', 'text', '', 0, '', '第二天连续签到的话,在原来的基础上再额外加多积分多少个', 9, -20);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '每天签到可得多个积分', 'sign_money', '5', 'text', '', 0, '', '重复签到无效,如果要设置为随机数,请用逗号隔开,比如:2,10', 10, -20);
INSERT INTO `qb_config` (`id`, `type`, `title`, `c_key`, `c_value`, `form_type`, `options`, `ifsys`, `htmlcode`, `c_descrip`, `list`, `sys_id`) VALUES(0, -1, '签到网址', 'sign_url', '', 'text', '', 0, '', '', 0, -20);

DROP TABLE IF EXISTS `qb_signin_member`;
CREATE TABLE IF NOT EXISTS `qb_signin_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(7) NOT NULL COMMENT '用户ID',
  `create_time` int(10) NOT NULL COMMENT '签到时间',
  `sysid` mediumint(5) NOT NULL COMMENT '系统ID',
  `aid` mediumint(7) NOT NULL COMMENT '内容ID',
  `money` smallint(4) NOT NULL COMMENT '领取的积分',
  `rank` smallint(5) NOT NULL COMMENT '排名',
  `intime` tinyint(1) NOT NULL COMMENT '是否及时签到',
  `ip` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `aid` (`aid`),
  KEY `sysid` (`sysid`),
  KEY `uid` (`uid`,`sysid`,`aid`),
  KEY `create_time` (`create_time`),
  KEY `intime` (`intime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户签到记录' AUTO_INCREMENT=1;


DROP TABLE IF EXISTS `qb_signin_cfg`;
CREATE TABLE IF NOT EXISTS `qb_signin_cfg` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `uid` int(7) NOT NULL COMMENT '群主UID',
  `ext_sys` mediumint(5) NOT NULL COMMENT '系统ID',
  `ext_id` int(7) NOT NULL COMMENT '群ID',
  `day_money` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '每天签到奖励多少积分,若设置为3,5,8则代表连续第二天为5,第三天为8',
  `limit_num` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '限制每天前多少名签到才有奖,若设置9:00=10,14:30=10指定时刻后的前几名才有奖',
  `min_money` smallint(4) NOT NULL COMMENT '晚到的给予多少鼓励积分奖励',
  `url` varchar(150) COLLATE utf8_bin NOT NULL COMMENT '签到成功后跳转网址',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ext_id` (`ext_id`,`ext_sys`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='圈主设定的签到规则' AUTO_INCREMENT=1 ;

ALTER TABLE  `qb_signin_member` ADD INDEX (  `ip` );


ALTER TABLE  `qb_signin_cfg` ADD  `fx_1` VARCHAR( 5 ) NOT NULL COMMENT  '1级推荐人奖励',ADD  `fx_2` VARCHAR( 5 ) NOT NULL COMMENT  '2级推荐人奖励',ADD  `fx_3` VARCHAR( 5 ) NOT NULL COMMENT  '3级推荐人奖励';