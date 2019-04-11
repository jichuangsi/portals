DROP TABLE IF EXISTS `qb_givemoney_member`;
DROP TABLE IF EXISTS `qb_givemoney_member`;
CREATE TABLE IF NOT EXISTS `qb_givemoney_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(7) NOT NULL COMMENT '赠送者的ID',
  `touid` int(7) NOT NULL COMMENT '受赠者的UID',
  `create_time` int(10) NOT NULL COMMENT '赠送时间',
  `sysid` mediumint(5) NOT NULL COMMENT '系统ID',
  `aid` mediumint(7) NOT NULL COMMENT '主题ID',
  `rid` int(10) NOT NULL COMMENT '论坛回复ID',
  `cid` int(10) NOT NULL COMMENT '评论ID',
  `money` smallint(4) NOT NULL COMMENT '赠送的积分',
  `about` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '打赏评语',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sysid` (`sysid`,`aid`),
  KEY `touid` (`touid`),
  KEY `rid` (`rid`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='给用户赠送积分的日志' AUTO_INCREMENT=1;