alter table qb_fenlei_sort add `activityrule` varchar(255) DEFAULT NULL COMMENT '活动规则';
alter table qb_fenlei_sort add `isenable` varchar(255) DEFAULT '0' COMMENT '是否启用（0:是；1:否）';
alter table qb_fenlei_sort add `description` varchar(255) DEFAULT NULL COMMENT '活动描述';

alter table qb_fenlei_content1 add `gid` tinyint(3) DEFAULT '0' COMMENT '机构id';
alter table qb_fenlei_content1 add `namelist` tinyint(3) DEFAULT '0' COMMENT '黑白名单(0：黑；1：白)';