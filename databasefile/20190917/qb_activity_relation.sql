# Host: localhost  (Version: 5.5.53)
# Date: 2019-09-17 11:22:16
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "qb_activity_relation"
#

CREATE TABLE `qb_activity_relation` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` smallint(6) DEFAULT NULL COMMENT '机构id',
  `aid` smallint(6) DEFAULT '0' COMMENT '活动id',
  `kid` smallint(6) DEFAULT '0' COMMENT '课程id',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='活动机构关联表';

#
# Data for table "qb_activity_relation"
#

