DROP TABLE IF EXISTS `qb_address`;
CREATE TABLE `qb_address` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(7) NOT NULL COMMENT '用户UID',
  `user` varchar(30) NOT NULL COMMENT '联系人称呼',
  `sex` tinyint(1) NOT NULL COMMENT '性 别,1是男,2是女',
  `telphone` varchar(30) NOT NULL COMMENT '联系电话',
  `address` varchar(150) NOT NULL COMMENT '收货地址',
  `title` varchar(20) NOT NULL COMMENT '备注:如家里还是公司',
  `often` tinyint(1) NOT NULL COMMENT '是否为常用联系方式',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户收货地址';


DROP TABLE IF EXISTS `qb_admin_menu`;
CREATE TABLE `qb_admin_menu` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(5) NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` tinyint(1) NOT NULL COMMENT '0的话通用,1的话PC专用,2的话WAP专用',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '链接名称',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '链接地址',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0本窗口打开,1新窗口打开',
  `ifshow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1显示,0隐藏',
  `list` smallint(4) NOT NULL DEFAULT '0' COMMENT '排序值',
  `style` varchar(30) NOT NULL DEFAULT '' COMMENT 'CSS类名',
  `groupid` mediumint(5) NOT NULL COMMENT '归属哪个用户组',
  `tier` tinyint(1) NOT NULL COMMENT '是否跟前一个菜单并排一行',
  `icon` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=236 DEFAULT CHARSET=utf8 COMMENT='管理员常用菜单';


DROP TABLE IF EXISTS `qb_alonepage`;
CREATE TABLE `qb_alonepage` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `posttime` int(10) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `template` varchar(255) NOT NULL DEFAULT '' COMMENT '模板',
  `filename` varchar(100) DEFAULT NULL COMMENT '静态文件名',
  `descrip` text NOT NULL COMMENT '分享描述',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '分享标题',
  `content` text NOT NULL COMMENT '内容',
  `view` int(7) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态:1启用0关闭',
  `picurl` varchar(150) NOT NULL DEFAULT '' COMMENT '分享图片',
  `list` int(10) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `list` (`list`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='单篇文章独立页';


DROP TABLE IF EXISTS `qb_area`;
CREATE TABLE `qb_area` (
  `id` mediumint(7) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `level` tinyint(2) NOT NULL DEFAULT '0' COMMENT '第几级',
  `list` int(10) NOT NULL DEFAULT '0' COMMENT '排序值',
  `logo` varchar(100) NOT NULL DEFAULT '' COMMENT '封面图',
  `content` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  KEY `fup` (`pid`),
  KEY `list` (`list`)
) ENGINE=MyISAM AUTO_INCREMENT=3388 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `qb_attachment`;
CREATE TABLE `qb_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='附件表';


DROP TABLE IF EXISTS `qb_bbs_content`;
CREATE TABLE `qb_bbs_content` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `uid` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='主题索引表';


DROP TABLE IF EXISTS `qb_bbs_content1`;
CREATE TABLE `qb_bbs_content1` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `fid` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `ispic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `uid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `view` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：比如审核与否',
  `lock` tinyint(1) NOT NULL COMMENT '是否锁定不给修改,删除,回复',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `picurl` text NOT NULL COMMENT '封面图',
  `mvurl` varchar(255) NOT NULL,
  `province_id` mediumint(5) NOT NULL COMMENT '省会ID',
  `city_id` mediumint(5) NOT NULL COMMENT '城市ID',
  `zone_id` mediumint(5) NOT NULL COMMENT '县级市或所在区ID',
  `street_id` mediumint(5) NOT NULL COMMENT '乡镇或区域街道ID',
  `agree` mediumint(5) NOT NULL COMMENT '点赞',
  `replynum` mediumint(5) NOT NULL COMMENT '评论数',
  `reward` smallint(5) NOT NULL COMMENT '打赏用户数',
  `ext_sys` smallint(5) NOT NULL COMMENT '扩展字段,关联的系统',
  `ext_id` int(8) NOT NULL COMMENT '扩展字段,供其它调用',
  `replyuser` varchar(50) NOT NULL COMMENT '最后评论者',
  `phone_type` varchar(50) NOT NULL COMMENT '发表来自什么手机',
  `qun_status` tinyint(1) NOT NULL COMMENT '圈子扩展状态,比如置顶',
  `buyuser` text NOT NULL COMMENT '消费积分才能浏览的用户',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `fid` (`fid`),
  KEY `view` (`view`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `ext_id` (`ext_id`,`ext_sys`),
  KEY `replynum` (`replynum`),
  KEY `agree` (`agree`),
  KEY `uid` (`uid`),
  KEY `qun_status` (`qun_status`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='论坛标题主表';


DROP TABLE IF EXISTS `qb_bbs_contents`;
CREATE TABLE `qb_bbs_contents` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='主题内容表';


DROP TABLE IF EXISTS `qb_bbs_field`;
CREATE TABLE `qb_bbs_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段名称',
  `name` varchar(32) NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `field_type` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text COMMENT '默认值',
  `options` text COMMENT '额外选项',
  `about` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `mid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属模型id',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `listshow` tinyint(1) NOT NULL COMMENT '是否在列表显示',
  `ifsearch` tinyint(1) NOT NULL COMMENT '是否作为搜索字段',
  `ifmust` tinyint(1) NOT NULL COMMENT '是否必填项',
  `nav` varchar(30) NOT NULL COMMENT '分组名称',
  `input_width` varchar(7) NOT NULL COMMENT '输入表单宽度',
  `input_height` varchar(7) NOT NULL COMMENT '输入表单高度',
  `unit` varchar(20) NOT NULL COMMENT '单位名称',
  `match` varchar(150) NOT NULL COMMENT '表单正则匹配',
  `css` varchar(20) NOT NULL COMMENT '表单CSS类名',
  `script` text NOT NULL COMMENT 'JS脚本',
  `trigger` varchar(255) NOT NULL COMMENT '选择某一项后,联动触发显示其它字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='文档字段表';


DROP TABLE IF EXISTS `qb_bbs_infomsg`;
CREATE TABLE `qb_bbs_infomsg` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `ext_id` int(7) NOT NULL COMMENT '扩展ID,比如可以给圈子统计',
  `ext_sys` smallint(4) NOT NULL COMMENT '扩展字段,关联的系统',
  `posttime` int(10) NOT NULL COMMENT '发贴更新时间',
  `today_post` mediumint(5) NOT NULL COMMENT '今日发贴量',
  `yesterday_post` mediumint(5) NOT NULL COMMENT '昨晚发贴量',
  `total_post` mediumint(7) NOT NULL COMMENT '总发贴量',
  `total_topic` mediumint(6) NOT NULL COMMENT '主题总数',
  `day_top_post` int(11) NOT NULL COMMENT '最高日发贴量',
  PRIMARY KEY (`id`),
  KEY `ext_id` (`ext_id`,`ext_sys`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='论坛的一些辅助信息,比如今日多少贴';


DROP TABLE IF EXISTS `qb_bbs_member`;
CREATE TABLE `qb_bbs_member` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `aid` int(7) NOT NULL COMMENT '贴子ID',
  `rid` int(7) NOT NULL,
  `uid` int(7) NOT NULL COMMENT '用户ID',
  `create_time` int(10) NOT NULL COMMENT '添加时间',
  `money` decimal(7,2) NOT NULL COMMENT '打赏金额',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '扩展字段,可拓展为1是点赞',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `aid` (`aid`),
  KEY `type` (`type`),
  KEY `money` (`money`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='贴子关联的会员信息';


DROP TABLE IF EXISTS `qb_bbs_module`;
CREATE TABLE `qb_bbs_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) NOT NULL DEFAULT '' COMMENT '区分符关键字',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标题',
  `layout` varchar(50) NOT NULL COMMENT '模板路径',
  `icon` varchar(64) NOT NULL,
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模型表';


DROP TABLE IF EXISTS `qb_bbs_reply`;
CREATE TABLE `qb_bbs_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL COMMENT '引用回复上级ID',
  `sysid` int(10) unsigned NOT NULL COMMENT '插件或模块ID',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模块的内容页ID',
  `ispic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `agree` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '支持',
  `disagree` mediumint(7) NOT NULL COMMENT '反对',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：比如审核与否',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `picurl` text NOT NULL COMMENT '封面图',
  `mvurl` varchar(255) NOT NULL,
  `content` text NOT NULL COMMENT '文章内容',
  `reply` mediumint(4) NOT NULL COMMENT '回复数',
  `phone_type` varchar(50) NOT NULL COMMENT '发表来自什么手机',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `sysid` (`sysid`),
  KEY `agree` (`agree`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='回复内容表';


DROP TABLE IF EXISTS `qb_bbs_sort`;
CREATE TABLE `qb_bbs_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` varchar(50) NOT NULL,
  `list` int(10) NOT NULL,
  `logo` varchar(50) NOT NULL COMMENT '封面图',
  `template` varchar(255) NOT NULL COMMENT '模板',
  `allowpost` varchar(100) NOT NULL COMMENT '允许发布信息的用户组',
  `allowview` varchar(100) NOT NULL COMMENT '允许浏览内容的用户组',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_description` varchar(255) NOT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `pid` (`pid`),
  KEY `list` (`list`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='主栏目表';


DROP TABLE IF EXISTS `qb_cms_category`;
CREATE TABLE `qb_cms_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `list` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `list` (`list`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='辅栏目';


DROP TABLE IF EXISTS `qb_cms_content`;
CREATE TABLE `qb_cms_content` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `uid` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='内容索引表';


DROP TABLE IF EXISTS `qb_cms_content1`;
CREATE TABLE `qb_cms_content1` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `fid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `ispic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `uid` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `view` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0未审 1已审 2推荐',
  `agree` mediumint(5) NOT NULL DEFAULT '0' COMMENT '点赞',
  `replynum` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `picurl` text NOT NULL COMMENT '封面图',
  `content` mediumtext NOT NULL COMMENT '文章内容',
  `province_id` mediumint(5) NOT NULL COMMENT '省会ID',
  `city_id` mediumint(5) NOT NULL COMMENT '城市ID',
  `zone_id` mediumint(5) NOT NULL COMMENT '县级市或所在区ID',
  `street_id` mediumint(5) NOT NULL COMMENT '乡镇或区域街道ID',
  `ext_sys` smallint(5) NOT NULL COMMENT '扩展字段,关联的系统',
  `ext_id` int(7) NOT NULL COMMENT '扩展字段,关联的ID',
  `keywords` varchar(128) NOT NULL COMMENT 'SEO关键字',
  `myfid` mediumint(7) NOT NULL COMMENT '我的分类',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `fid` (`fid`),
  KEY `view` (`view`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `ext_id` (`ext_id`,`ext_sys`),
  KEY `ext_id_2` (`ext_id`,`ext_sys`),
  KEY `myfid` (`myfid`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='文章模型模型表';


DROP TABLE IF EXISTS `qb_cms_content2`;
CREATE TABLE `qb_cms_content2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `fid` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `ispic` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `picurl` text NOT NULL COMMENT '封面图',
  `uid` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `view` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0未审 1已审 2推荐',
  `agree` mediumint(5) NOT NULL DEFAULT '0' COMMENT '点赞',
  `replynum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `content` text NOT NULL COMMENT '内容介绍',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `pics` text NOT NULL COMMENT '组图',
  `province_id` mediumint(5) NOT NULL COMMENT '省会ID',
  `city_id` mediumint(5) NOT NULL COMMENT '城市ID',
  `zone_id` mediumint(5) NOT NULL COMMENT '县级市或所在区ID',
  `street_id` mediumint(5) NOT NULL COMMENT '乡镇或区域街道ID',
  `ext_sys` smallint(5) NOT NULL COMMENT '扩展字段,关联的系统',
  `ext_id` mediumint(7) NOT NULL COMMENT '扩展字段,关联的ID',
  `keywords` varchar(128) NOT NULL COMMENT 'SEO关键字',
  `myfid` mediumint(7) NOT NULL COMMENT '我的分类',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `fid` (`fid`),
  KEY `view` (`view`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `ext_id` (`ext_id`,`ext_sys`),
  KEY `ext_id_2` (`ext_id`,`ext_sys`),
  KEY `myfid` (`myfid`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='图片模型模型表';


DROP TABLE IF EXISTS `qb_cms_content3`;
CREATE TABLE `qb_cms_content3` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `fid` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `ispic` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `picurl` text NOT NULL COMMENT '封面图',
  `uid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `view` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0未审 1已审 2推荐',
  `agree` mediumint(5) NOT NULL DEFAULT '0' COMMENT '点赞',
  `replynum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `content` text NOT NULL COMMENT '内容介绍',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `mv_url` varchar(128) NOT NULL COMMENT '视频地址',
  `province_id` mediumint(5) NOT NULL COMMENT '省会ID',
  `city_id` mediumint(5) NOT NULL COMMENT '城市ID',
  `zone_id` mediumint(5) NOT NULL COMMENT '县级市或所在区ID',
  `street_id` mediumint(5) NOT NULL COMMENT '乡镇或区域街道ID',
  `ext_sys` mediumint(5) NOT NULL COMMENT '扩展字段,关联的系统',
  `ext_id` int(8) NOT NULL COMMENT '扩展字段,供其它调用',
  `keywords` varchar(128) NOT NULL COMMENT 'SEO关键字',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `fid` (`fid`),
  KEY `view` (`view`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `ext_id` (`ext_id`,`ext_sys`),
  KEY `ext_id_2` (`ext_id`,`ext_sys`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='视频模型模型表';


DROP TABLE IF EXISTS `qb_cms_field`;
CREATE TABLE `qb_cms_field` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段名称',
  `name` varchar(32) NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `field_type` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text COMMENT '默认值',
  `options` text COMMENT '额外选项',
  `about` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `mid` mediumint(5) NOT NULL DEFAULT '0' COMMENT '所属模型id',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `listshow` tinyint(1) NOT NULL COMMENT '是否在列表显示',
  `ifsearch` tinyint(1) NOT NULL COMMENT '是否作为搜索字段',
  `ifmust` tinyint(1) NOT NULL COMMENT '是否必填项',
  `nav` varchar(30) NOT NULL COMMENT '分组名称',
  `input_width` varchar(7) NOT NULL COMMENT '输入表单宽度',
  `input_height` varchar(7) NOT NULL COMMENT '输入表单高度',
  `unit` varchar(20) NOT NULL COMMENT '单位名称',
  `match` varchar(150) NOT NULL COMMENT '表单正则匹配',
  `css` varchar(20) NOT NULL COMMENT '表单CSS类名',
  `script` text NOT NULL COMMENT 'JS脚本',
  `trigger` varchar(255) NOT NULL COMMENT '选择某一项后,联动触发显示其它字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='文档字段表';


DROP TABLE IF EXISTS `qb_cms_info`;
CREATE TABLE `qb_cms_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '内容ID',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '辅栏目ID',
  `list` int(10) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `mid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容索引表';


DROP TABLE IF EXISTS `qb_cms_module`;
CREATE TABLE `qb_cms_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) NOT NULL DEFAULT '' COMMENT '区分符关键字',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标题',
  `layout` varchar(50) NOT NULL COMMENT '模板路径',
  `icon` varchar(64) NOT NULL,
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='模型表';


DROP TABLE IF EXISTS `qb_cms_mysort`;
CREATE TABLE `qb_cms_mysort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户的UID',
  `name` varchar(80) NOT NULL COMMENT '分类名称',
  `list` int(10) NOT NULL,
  `logo` varchar(50) NOT NULL COMMENT '封面图',
  `ext_sys` smallint(4) NOT NULL COMMENT '扩展字段,关联的系统',
  `ext_id` mediumint(7) NOT NULL COMMENT '扩展字段,关联的系统ID',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `list` (`list`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户自定义分类';


DROP TABLE IF EXISTS `qb_cms_sort`;
CREATE TABLE `qb_cms_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` varchar(50) NOT NULL,
  `list` int(10) NOT NULL,
  `logo` varchar(50) NOT NULL COMMENT '封面图',
  `template` varchar(255) NOT NULL COMMENT '模板',
  `allowpost` varchar(100) NOT NULL COMMENT '允许发布信息的用户组',
  `allowview` varchar(100) NOT NULL COMMENT '允许浏览内容的用户组',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_description` varchar(255) NOT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `pid` (`pid`),
  KEY `list` (`list`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='主栏目表';


DROP TABLE IF EXISTS `qb_comment_content`;
CREATE TABLE `qb_comment_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL COMMENT '引用回复上级ID',
  `sysid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件或模块ID',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模块的内容页ID',
  `ispic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `agree` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '支持',
  `disagree` mediumint(7) NOT NULL COMMENT '反对',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：比如审核与否',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `picurl` text NOT NULL COMMENT '封面图',
  `mvurl` varchar(255) NOT NULL,
  `content` text NOT NULL COMMENT '文章内容',
  `reply` mediumint(4) NOT NULL COMMENT '回复数',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `sysid` (`sysid`),
  KEY `agree` (`agree`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COMMENT='评论内容表';


DROP TABLE IF EXISTS `qb_config`;
CREATE TABLE `qb_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` mediumint(6) NOT NULL COMMENT '分类分组ID,关联表config_group',
  `title` varchar(32) NOT NULL COMMENT '字段名称标题',
  `c_key` varchar(50) NOT NULL DEFAULT '' COMMENT '字段名',
  `c_value` text NOT NULL COMMENT '字段值',
  `form_type` varchar(16) NOT NULL COMMENT '字段表单类型',
  `options` varchar(256) NOT NULL COMMENT '字段参数 比如多选或单选要用到',
  `ifsys` tinyint(1) NOT NULL COMMENT '是否为全局变量',
  `htmlcode` text NOT NULL COMMENT 'html额外代码',
  `c_descrip` varchar(256) NOT NULL COMMENT '选项详细介绍描述',
  `list` int(10) NOT NULL COMMENT '排序值',
  `sys_id` mediumint(7) NOT NULL COMMENT '系统类型，正数是频道模块ID，负数是插件ID',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `list` (`list`),
  KEY `sys_type` (`sys_id`),
  KEY `c_key` (`c_key`)
) ENGINE=MyISAM AUTO_INCREMENT=749 DEFAULT CHARSET=utf8 COMMENT='系统参数配置';


DROP TABLE IF EXISTS `qb_config_group`;
CREATE TABLE `qb_config_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '分组名称',
  `list` int(11) NOT NULL COMMENT '排序值',
  `sys_id` mediumint(9) NOT NULL COMMENT '0为系统，正数为模块频道，负数为插件',
  `ifshow` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否在系统设置那里显示',
  `ifsys` tinyint(1) NOT NULL COMMENT '是否作为系统字段参数，主要是针对插件而言的',
  PRIMARY KEY (`id`),
  KEY `sys_type` (`sys_id`),
  KEY `ifsys` (`ifsys`),
  KEY `ifshow` (`ifshow`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='参数配置分组分类';


DROP TABLE IF EXISTS `qb_eggs_member`;
CREATE TABLE `qb_eggs_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(7) NOT NULL DEFAULT '0' COMMENT '参与者的ID',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `money` smallint(4) NOT NULL DEFAULT '0' COMMENT '砸中的积分',
  `typesize` tinyint(1) NOT NULL DEFAULT '0' COMMENT '多少等奖',
  PRIMARY KEY (`id`),
  KEY `pageid` (`uid`,`create_time`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='砸金蛋游戏';


DROP TABLE IF EXISTS `qb_fav`;
CREATE TABLE `qb_fav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sysid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件或模块ID',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模块的内容页ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `list` (`list`),
  KEY `sysid` (`sysid`),
  KEY `aid` (`aid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='收藏夹';


DROP TABLE IF EXISTS `qb_gamedial_member`;
CREATE TABLE `qb_gamedial_member` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(7) NOT NULL DEFAULT '0' COMMENT '参与者的ID',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `money` smallint(4) NOT NULL DEFAULT '0' COMMENT '抽中的积分',
  `typesize` tinyint(1) NOT NULL DEFAULT '0' COMMENT '多少等奖',
  PRIMARY KEY (`id`),
  KEY `pageid` (`uid`,`create_time`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='大转盘游戏';


DROP TABLE IF EXISTS `qb_giftshop_car`;
CREATE TABLE `qb_giftshop_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增值',
  `shopid` int(10) NOT NULL COMMENT '商品ID',
  `type1` tinyint(2) NOT NULL COMMENT '商品属性1',
  `type2` tinyint(2) NOT NULL COMMENT '商品属性2',
  `type3` tinyint(2) NOT NULL COMMENT '商品属性3',
  `num` mediumint(5) NOT NULL COMMENT '购买数量',
  `create_time` int(10) NOT NULL COMMENT '时间',
  `update_time` int(10) NOT NULL,
  `ifchoose` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否钩选要购买',
  `uid` mediumint(7) NOT NULL COMMENT '用户的UID',
  PRIMARY KEY (`id`),
  KEY `shopid` (`shopid`,`uid`),
  KEY `uid` (`uid`,`update_time`,`ifchoose`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='购物车';


DROP TABLE IF EXISTS `qb_giftshop_content`;
CREATE TABLE `qb_giftshop_content` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `uid` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='内容索引表';


DROP TABLE IF EXISTS `qb_giftshop_content1`;
CREATE TABLE `qb_giftshop_content1` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `ispic` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `uid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `view` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0未审 1已审 2推荐',
  `replynum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `picurl` text NOT NULL COMMENT '封面图',
  `content` text NOT NULL COMMENT '文章内容',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '商品价格',
  `province_id` mediumint(5) NOT NULL COMMENT '省会ID',
  `city_id` mediumint(5) NOT NULL COMMENT '城市ID',
  `zone_id` mediumint(5) NOT NULL COMMENT '县级市或所在区ID',
  `street_id` mediumint(5) NOT NULL COMMENT '乡镇或区域街道ID',
  `ext_sys` smallint(5) NOT NULL COMMENT '扩展字段,关联的系统',
  `type1` varchar(255) NOT NULL COMMENT '商品属性1',
  `type2` varchar(255) NOT NULL COMMENT '商品属性2',
  `type3` varchar(255) NOT NULL COMMENT '商品属性3',
  `ext_id` int(8) NOT NULL COMMENT '扩展字段,供其它调用',
  `jifen` int(7) NOT NULL DEFAULT '0' COMMENT '抵扣积分',
  `market_money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价格',
  `num` mediumint(6) NOT NULL DEFAULT '20' COMMENT '库存量',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `fid` (`fid`),
  KEY `view` (`view`),
  KEY `comment` (`replynum`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `ext_id` (`ext_id`,`ext_sys`),
  KEY `ext_id_2` (`ext_id`,`ext_sys`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='商品内容表';


DROP TABLE IF EXISTS `qb_giftshop_field`;
CREATE TABLE `qb_giftshop_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段名称',
  `name` varchar(32) NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `field_type` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text COMMENT '默认值',
  `options` text COMMENT '额外选项',
  `about` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `show` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `mid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属模型id',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `listshow` tinyint(1) NOT NULL COMMENT '是否在列表显示',
  `ifsearch` tinyint(1) NOT NULL COMMENT '是否作为搜索字段',
  `ifmust` tinyint(1) NOT NULL COMMENT '是否必填项',
  `nav` varchar(30) NOT NULL COMMENT '分组名称',
  `input_width` varchar(7) NOT NULL COMMENT '输入表单宽度',
  `input_height` varchar(7) NOT NULL COMMENT '输入表单高度',
  `unit` varchar(20) NOT NULL COMMENT '单位名称',
  `match` varchar(150) NOT NULL COMMENT '表单正则匹配',
  `css` varchar(20) NOT NULL COMMENT '表单CSS类名',
  `script` text NOT NULL COMMENT 'JS脚本',
  `trigger` varchar(255) NOT NULL COMMENT '选择某一项后,联动触发显示其它字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='文档字段表';


DROP TABLE IF EXISTS `qb_giftshop_module`;
CREATE TABLE `qb_giftshop_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) NOT NULL DEFAULT '' COMMENT '区分符关键字',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标题',
  `layout` varchar(50) NOT NULL COMMENT '模板路径',
  `icon` varchar(64) NOT NULL,
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='模型表';


DROP TABLE IF EXISTS `qb_giftshop_order`;
CREATE TABLE `qb_giftshop_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `shop` varchar(255) NOT NULL COMMENT '购买的商品,存放格式如下:shopid-num-type1-type2-type3 商品ID,购买数量,商品属性1、2、3,多个商品用,号隔开',
  `shop_uid` mediumint(7) NOT NULL COMMENT '店主的UID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '下单客户的uid',
  `totalmoney` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际付款金额',
  `user_rmb` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `user_jf` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用积分',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '付款方式',
  `linkman` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址',
  `telphone` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `shipping_time` int(11) DEFAULT '0' COMMENT '发货时间',
  `receive_time` int(10) DEFAULT '0' COMMENT '收货时间',
  `receive_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '收货状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态',
  `shipping_name` varchar(120) NOT NULL DEFAULT '' COMMENT '物流名称',
  `shipping_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流单号',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) DEFAULT '' COMMENT '管理员备注',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `uid` (`uid`),
  KEY `order_sn` (`order_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='商品订单';


DROP TABLE IF EXISTS `qb_giftshop_sort`;
CREATE TABLE `qb_giftshop_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` varchar(50) NOT NULL,
  `list` int(10) NOT NULL,
  `logo` varchar(50) NOT NULL COMMENT '封面图',
  `template` varchar(255) NOT NULL COMMENT '模板',
  `allowpost` varchar(100) NOT NULL COMMENT '允许发布信息的用户组',
  `allowview` varchar(100) NOT NULL COMMENT '允许浏览内容的用户组',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_description` varchar(255) NOT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `pid` (`pid`),
  KEY `list` (`list`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='主栏目表';


DROP TABLE IF EXISTS `qb_givemoney_member`;
CREATE TABLE `qb_givemoney_member` (
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='给用户赠送积分的日志';


DROP TABLE IF EXISTS `qb_group`;
CREATE TABLE `qb_group` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0是会员组,1是系统组',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `level` mediumint(7) NOT NULL DEFAULT '0' COMMENT '会员组升级所需积分',
  `powerdb` text NOT NULL COMMENT '前台权限',
  `allowadmin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许进进后台',
  `admindb` text COMMENT '后台权限',
  `logo` varchar(150) NOT NULL COMMENT '图标',
  `wap_page` varchar(150) NOT NULL COMMENT 'wap个人主页模板',
  `wap_member` varchar(150) NOT NULL COMMENT 'wap会员中心模板',
  `pc_page` varchar(150) NOT NULL COMMENT 'pc个人主页模板',
  `pc_member` varchar(150) NOT NULL COMMENT 'pc会员中心模板',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='系统会员用户组';


DROP TABLE IF EXISTS `qb_groupcfg`;
CREATE TABLE `qb_groupcfg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` mediumint(6) NOT NULL COMMENT '用户组ID',
  `title` varchar(32) NOT NULL COMMENT '字段名称标题',
  `c_key` varchar(50) NOT NULL DEFAULT '' COMMENT '字段名',
  `c_value` text NOT NULL COMMENT '字段值',
  `form_type` varchar(16) NOT NULL COMMENT '字段表单类型',
  `options` varchar(256) NOT NULL COMMENT '字段参数 比如多选或单选要用到',
  `htmlcode` text NOT NULL COMMENT 'html额外代码',
  `c_descrip` varchar(256) NOT NULL COMMENT '选项详细介绍描述',
  `list` int(10) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `list` (`list`),
  KEY `c_key` (`c_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统参数配置';


DROP TABLE IF EXISTS `qb_hook`;
CREATE TABLE `qb_hook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `about` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `ifopen` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `list` int(10) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='接口(钩子)列表';


DROP TABLE IF EXISTS `qb_hook_plugin`;
CREATE TABLE `qb_hook_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook_key` varchar(50) NOT NULL COMMENT '所归属的接口关键字',
  `plugin_key` varchar(50) NOT NULL COMMENT '所归属的插件关键字,也即目录名',
  `hook_class` varchar(80) NOT NULL COMMENT '钩子运行的类名',
  `about` varchar(255) NOT NULL COMMENT '此钩子插件能实现的功能描述',
  `ifopen` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `list` int(10) NOT NULL COMMENT '执行的先后顺序',
  `author` varchar(80) NOT NULL COMMENT '开发者',
  `author_url` varchar(120) NOT NULL COMMENT '开发者网站',
  `version` varchar(60) NOT NULL COMMENT '版本信息',
  `version_id` mediumint(7) NOT NULL COMMENT '云端对应的ID',
  PRIMARY KEY (`id`),
  KEY `hook_id` (`hook_key`),
  KEY `plugin_id` (`plugin_key`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='可供使用的接口钩子功能';


DROP TABLE IF EXISTS `qb_label`;
CREATE TABLE `qb_label` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自动增值ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标签区分符',
  `pagename` varchar(32) NOT NULL COMMENT '标签所在模板文件',
  `class_cfg` varchar(100) NOT NULL COMMENT '获取标签数据的类名与方法',
  `cfg` text NOT NULL COMMENT '基础参数配置，比如显示哪些栏目，如何排序等等',
  `extend_cfg` text NOT NULL COMMENT '扩展配置，可以是纯代码、图片，也可以是模板数据',
  `type` varchar(25) NOT NULL COMMENT '调用类型，比如图片、代码等',
  `ifdata` tinyint(4) NOT NULL COMMENT '是否只要原始数据，不要直接输出',
  `hide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `cache_time` int(10) NOT NULL DEFAULT '0' COMMENT '缓存时间',
  `uid` mediumint(7) NOT NULL DEFAULT '0' COMMENT '修改者',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '标签创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  `system_id` mediumint(6) NOT NULL DEFAULT '0' COMMENT '所属模块，插件为负数',
  `if_js` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否站外调用,比如APP或小程序或JS',
  `power_cfg` varchar(255) NOT NULL COMMENT '权限扩展',
  `view_tpl` text NOT NULL COMMENT '标签的模板代码',
  `fid` mediumint(5) NOT NULL COMMENT '分类分组',
  `title` varchar(50) NOT NULL COMMENT '标签名称说明',
  `list` int(10) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `module_id` (`system_id`),
  KEY `page` (`pagename`),
  KEY `if_js` (`if_js`),
  KEY `fid` (`fid`,`list`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='数据标签';


DROP TABLE IF EXISTS `qb_labelhy`;
CREATE TABLE `qb_labelhy` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自动增值ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '标签区分符',
  `pagename` varchar(32) NOT NULL COMMENT '标签所在模板文件',
  `class_cfg` varchar(100) NOT NULL COMMENT '获取标签数据的类名与方法',
  `cfg` text NOT NULL COMMENT '基础参数配置，比如显示哪些栏目，如何排序等等',
  `extend_cfg` text NOT NULL COMMENT '扩展配置，可以是纯代码、图片，也可以是模板数据',
  `type` varchar(25) NOT NULL COMMENT '调用类型，比如图片、代码等',
  `ifdata` tinyint(4) NOT NULL COMMENT '是否只要原始数据，不要直接输出',
  `hide` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `cache_time` int(10) NOT NULL DEFAULT '0' COMMENT '缓存时间',
  `uid` mediumint(7) NOT NULL DEFAULT '0' COMMENT '修改者',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '标签创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  `system_id` mediumint(6) NOT NULL DEFAULT '0' COMMENT '所属模块，插件为负数',
  `if_js` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否站外调用,比如APP或小程序或JS,暂时没使用',
  `power_cfg` varchar(255) NOT NULL COMMENT '权限扩展,暂时没使用',
  `view_tpl` text NOT NULL COMMENT '标签的模板代码,暂时没使用',
  `fid` mediumint(5) NOT NULL COMMENT '分类分组,暂时没使用',
  `title` varchar(50) NOT NULL COMMENT '标签名称说明,暂时没,暂时没使用使用',
  `list` int(10) NOT NULL COMMENT '排序值,暂时没使用',
  `ext_sys` smallint(4) NOT NULL COMMENT '扩展字段,关联的系统',
  `ext_id` mediumint(6) NOT NULL COMMENT '扩展字段,关联的系统ID',
  PRIMARY KEY (`id`),
  KEY `module_id` (`system_id`),
  KEY `page` (`pagename`),
  KEY `name` (`name`,`ext_id`,`ext_sys`),
  KEY `ext_id` (`ext_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户可以修改的标签,比如圈子黄页';


DROP TABLE IF EXISTS `qb_log_action`;
CREATE TABLE `qb_log_action` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL COMMENT '用户UID',
  `create_time` int(10) NOT NULL COMMENT '操作时间',
  `ip` varchar(15) NOT NULL COMMENT '用户所在IP',
  `model` varchar(20) NOT NULL COMMENT '模块目录名',
  `controller` varchar(20) NOT NULL COMMENT '控制器名称',
  `action` varchar(20) NOT NULL COMMENT '执行了哪个方法',
  `plugin` varchar(60) NOT NULL COMMENT '插件的名称及控制器及方法',
  `content` text NOT NULL COMMENT '用户提交的内容',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`create_time`)
) ENGINE=MyISAM AUTO_INCREMENT=790 DEFAULT CHARSET=utf8 COMMENT='后台操作日志';


DROP TABLE IF EXISTS `qb_log_login`;
CREATE TABLE `qb_log_login` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `ip` varchar(15) NOT NULL COMMENT '登录IP',
  `create_time` int(10) NOT NULL COMMENT '登录时间',
  `username` varchar(30) NOT NULL COMMENT '登录用户名',
  `password` varchar(32) NOT NULL COMMENT '登录密码,登录成功密码就加密',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='用户登录日志';


DROP TABLE IF EXISTS `qb_market`;
CREATE TABLE `qb_market` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '类型:比如admin_style index_style member_style等等',
  `keywords` varchar(50) NOT NULL COMMENT '关键字',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '安装日期',
  `author` varchar(80) NOT NULL COMMENT '开发者',
  `author_url` varchar(120) NOT NULL COMMENT '开发者网站',
  `version` varchar(60) NOT NULL COMMENT '版本信息',
  `version_id` mediumint(7) NOT NULL DEFAULT '0' COMMENT '云端对应的ID',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `keywords` (`keywords`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='风格';


DROP TABLE IF EXISTS `qb_memberdata`;
CREATE TABLE `qb_memberdata` (
  `uid` mediumint(7) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `password_rand` varchar(10) NOT NULL COMMENT '密码混淆加密字串',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '会员帐号ID',
  `nickname` varchar(80) NOT NULL COMMENT '用户昵称',
  `qq_api` varchar(32) NOT NULL DEFAULT '' COMMENT 'QQ登录接口',
  `weixin_api` varchar(32) NOT NULL DEFAULT '' COMMENT '微信登录接口',
  `wxapp_api` varchar(32) NOT NULL COMMENT '微信小程序登录接口',
  `groupid` smallint(4) NOT NULL DEFAULT '0' COMMENT '会员用户组ID',
  `grouptype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户组扩展字段',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '多用户组,扩展用',
  `yz` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核',
  `money` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '会员积分数',
  `dou` mediumint(9) NOT NULL COMMENT '金豆(另一种形式的积分)',
  `oltime` int(10) NOT NULL DEFAULT '0' COMMENT '在线时长',
  `lastvist` int(10) NOT NULL DEFAULT '0' COMMENT '会员最后一次访问时间',
  `lastip` varchar(15) NOT NULL DEFAULT '' COMMENT '会员最后一次访问IP',
  `regdate` int(10) NOT NULL DEFAULT '0' COMMENT '注册日期',
  `regip` varchar(15) NOT NULL DEFAULT '' COMMENT '注册IP',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别',
  `bday` date NOT NULL DEFAULT '0000-00-00' COMMENT '出生日期',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '会员头像',
  `introduce` varchar(255) NOT NULL COMMENT '签名或自我介绍',
  `qq` varchar(11) NOT NULL DEFAULT '' COMMENT 'QQ号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱帐号',
  `provinceid` mediumint(6) NOT NULL DEFAULT '0' COMMENT '省份ID',
  `cityid` mediumint(7) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '会员联系方式',
  `mobphone` varchar(12) NOT NULL DEFAULT '' COMMENT '联系手机',
  `idcard` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `truename` varchar(20) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `config` text NOT NULL COMMENT '扩展字段',
  `email_yz` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱是否验证',
  `mob_yz` tinyint(1) NOT NULL DEFAULT '0' COMMENT '手机号码是否验证',
  `idcard_yz` tinyint(1) NOT NULL DEFAULT '0' COMMENT '身份证是否验证',
  `rmb` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可用余额',
  `rmb_freeze` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冻结余额',
  `rmb_pwd` varchar(32) NOT NULL DEFAULT '' COMMENT '支付密码',
  `introducer_1` mediumint(7) NOT NULL DEFAULT '0' COMMENT '1级推荐人',
  `introducer_2` mediumint(7) NOT NULL DEFAULT '0' COMMENT '2级推荐人',
  `introducer_3` mediumint(7) NOT NULL DEFAULT '0' COMMENT '3级推荐人',
  `wx_attention` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关注微信',
  `sendmsg` text NOT NULL COMMENT '不接收系统哪些消息',
  `ext_field` text NOT NULL COMMENT '自定义字段参数',
  PRIMARY KEY (`uid`),
  KEY `groups` (`groups`),
  KEY `sex` (`sex`,`bday`,`cityid`),
  KEY `qq_api` (`qq_api`),
  KEY `username` (`username`),
  KEY `weixin_api` (`weixin_api`),
  KEY `lastvist` (`lastvist`),
  KEY `money` (`money`),
  KEY `rmb` (`rmb`),
  KEY `dou` (`dou`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `qb_module`;
CREATE TABLE `qb_module` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL COMMENT '开发者',
  `author_url` varchar(100) NOT NULL COMMENT '开发者网站或演示网址',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '当前频道是否可以复制',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '频道名称',
  `keywords` varchar(30) NOT NULL DEFAULT '' COMMENT '目录名也即关键字',
  `domain` varchar(100) NOT NULL DEFAULT '' COMMENT '频道使用的二级域名',
  `config` text NOT NULL COMMENT '扩展配置',
  `list` mediumint(5) NOT NULL DEFAULT '0' COMMENT '排序值',
  `admingroup` varchar(150) NOT NULL DEFAULT '',
  `adminmember` text NOT NULL,
  `ifopen` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `ifsys` tinyint(1) NOT NULL DEFAULT '0',
  `about` text NOT NULL COMMENT '介绍',
  `version` varchar(60) NOT NULL COMMENT '版本信息',
  `icon` varchar(64) NOT NULL COMMENT '图标',
  `version_id` mediumint(7) NOT NULL COMMENT '对应官方的APP应用ID,升级用来核对',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='频道模块列表';


DROP TABLE IF EXISTS `qb_moneylog`;
CREATE TABLE `qb_moneylog` (
  `id` mediumint(7) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(7) NOT NULL DEFAULT '0',
  `money` mediumint(7) NOT NULL DEFAULT '0',
  `about` varchar(255) NOT NULL DEFAULT '',
  `posttime` int(10) NOT NULL DEFAULT '0',
  `city_id` mediumint(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `city_id` (`city_id`)
) ENGINE=MyISAM AUTO_INCREMENT=355 DEFAULT CHARSET=utf8 COMMENT='会员积分赚取与消费记录';


DROP TABLE IF EXISTS `qb_msg`;
CREATE TABLE `qb_msg` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sysmsg_id` mediumint(7) NOT NULL COMMENT '系统群发消息的内容ID,系统消息的话,就没必要每个用户重复插入标题与内容',
  `touid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '接收者的UID',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '发送者的UID',
  `ifread` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读',
  `title` varchar(130) NOT NULL DEFAULT '' COMMENT '消息标题',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `content` text NOT NULL COMMENT '详情',
  PRIMARY KEY (`id`),
  KEY `fromuid` (`uid`),
  KEY `touid` (`touid`,`ifread`)
) ENGINE=MyISAM AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='站内短消息';


DROP TABLE IF EXISTS `qb_plugin`;
CREATE TABLE `qb_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '是否可复制',
  `keywords` varchar(32) NOT NULL DEFAULT '' COMMENT '目录名也即关键字',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `about` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '开发者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '开发者网站或演示网址',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(60) NOT NULL DEFAULT '' COMMENT '版本信息',
  `admin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `list` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `ifopen` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `ifsys` tinyint(1) NOT NULL COMMENT '是否是系统插件不可删除与复制',
  `version_id` mediumint(7) NOT NULL COMMENT '对应官方的APP应用ID,升级用来核对',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='插件列表';


DROP TABLE IF EXISTS `qb_readjifen`;
CREATE TABLE `qb_readjifen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `count` tinyint(5) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `qb_regnum`;
CREATE TABLE `qb_regnum` (
  `sid` varchar(8) NOT NULL DEFAULT '',
  `num` varchar(6) NOT NULL DEFAULT '',
  `posttime` int(10) NOT NULL DEFAULT '0',
  UNIQUE KEY `sid` (`sid`),
  KEY `posttime` (`num`,`posttime`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='手机注册码';


DROP TABLE IF EXISTS `qb_rmb_consume`;
CREATE TABLE `qb_rmb_consume` (
  `id` mediumint(7) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(7) NOT NULL DEFAULT '0',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `about` varchar(255) NOT NULL DEFAULT '',
  `posttime` int(10) NOT NULL DEFAULT '0',
  `freeze` tinyint(1) NOT NULL DEFAULT '0',
  `fx` tinyint(2) NOT NULL,
  `shopid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `fx` (`fx`),
  KEY `shopid` (`shopid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='会员余额RMB赚取与消费记录';


DROP TABLE IF EXISTS `qb_rmb_getout`;
CREATE TABLE `qb_rmb_getout` (
  `id` mediumint(7) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(7) NOT NULL DEFAULT '0',
  `username` varchar(30) NOT NULL DEFAULT '',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `posttime` int(10) NOT NULL DEFAULT '0',
  `banktype` varchar(20) NOT NULL DEFAULT '',
  `bankname` varchar(100) NOT NULL DEFAULT '',
  `ifpay` tinyint(1) NOT NULL DEFAULT '0',
  `why` varchar(255) NOT NULL DEFAULT '',
  `truename` varchar(30) NOT NULL DEFAULT '',
  `tel` varchar(20) NOT NULL DEFAULT '',
  `quitabout` text NOT NULL,
  `admin` varchar(30) NOT NULL DEFAULT '',
  `replytime` int(10) NOT NULL DEFAULT '0',
  `real_money` decimal(10,2) NOT NULL COMMENT '实际申请提现金额',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ifpay` (`ifpay`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='会员余额申请提现记录';


DROP TABLE IF EXISTS `qb_rmb_infull`;
CREATE TABLE `qb_rmb_infull` (
  `id` mediumint(7) NOT NULL AUTO_INCREMENT,
  `numcode` varchar(32) NOT NULL DEFAULT '' COMMENT '订单号',
  `money` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `ifpay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已付款',
  `posttime` int(10) NOT NULL DEFAULT '0' COMMENT '订单提交时间',
  `uid` mediumint(7) NOT NULL DEFAULT '0' COMMENT '用户的UID',
  `banktype` varchar(15) NOT NULL DEFAULT '' COMMENT '付款方式',
  `paytime` varchar(20) NOT NULL DEFAULT '' COMMENT '支付时间',
  `callback_class` varchar(80) NOT NULL COMMENT '支付成功后 后台执行的类',
  PRIMARY KEY (`id`),
  KEY `numcode` (`numcode`),
  KEY `uid` (`uid`,`ifpay`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='人民币充值';


DROP TABLE IF EXISTS `qb_scanlogin`;
CREATE TABLE `qb_scanlogin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(7) NOT NULL COMMENT '登录成功的用户ID',
  `sid` varchar(32) NOT NULL COMMENT '用户生成的随机字串',
  `ip` varchar(15) NOT NULL COMMENT '安全起见同一IP才能登录',
  `posttime` int(10) NOT NULL COMMENT '时间有效期',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='微信扫码PC登录';


DROP TABLE IF EXISTS `qb_search_content`;
CREATE TABLE `qb_search_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户uid',
  `aid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '信息id',
  `module` varchar(30) NOT NULL COMMENT '模型',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `data` text NOT NULL COMMENT '数据',
  `picurl` text COMMENT '缩略图',
  PRIMARY KEY (`id`),
  KEY `modelid` (`module`),
  KEY `uid` (`uid`),
  KEY `create_time` (`create_time`),
  KEY `aid` (`aid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8 COMMENT='全站搜索数据表';


DROP TABLE IF EXISTS `qb_search_keyword`;
CREATE TABLE `qb_search_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` char(30) NOT NULL COMMENT '关键字',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '搜索次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='搜索关键字表';


DROP TABLE IF EXISTS `qb_shop_car`;
CREATE TABLE `qb_shop_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增值',
  `shopid` int(10) NOT NULL COMMENT '商品ID',
  `type1` tinyint(2) NOT NULL COMMENT '商品属性1',
  `type2` tinyint(2) NOT NULL COMMENT '商品属性2',
  `type3` tinyint(2) NOT NULL COMMENT '商品属性3',
  `num` mediumint(5) NOT NULL COMMENT '购买数量',
  `create_time` int(10) NOT NULL COMMENT '时间',
  `update_time` int(10) NOT NULL,
  `ifchoose` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否钩选要购买',
  `uid` mediumint(7) NOT NULL COMMENT '用户的UID',
  PRIMARY KEY (`id`),
  KEY `shopid` (`shopid`,`uid`),
  KEY `uid` (`uid`,`update_time`,`ifchoose`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='购物车';


DROP TABLE IF EXISTS `qb_shop_content`;
CREATE TABLE `qb_shop_content` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `uid` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='内容索引表';


DROP TABLE IF EXISTS `qb_shop_content1`;
CREATE TABLE `qb_shop_content1` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `ispic` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `uid` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `view` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0未审 1已审 2推荐',
  `replynum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `picurl` text NOT NULL COMMENT '封面图',
  `content` text NOT NULL COMMENT '文章内容',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '商品价格',
  `province_id` mediumint(5) NOT NULL COMMENT '省会ID',
  `city_id` mediumint(5) NOT NULL COMMENT '城市ID',
  `zone_id` mediumint(5) NOT NULL COMMENT '县级市或所在区ID',
  `street_id` mediumint(5) NOT NULL COMMENT '乡镇或区域街道ID',
  `ext_sys` smallint(5) NOT NULL COMMENT '扩展字段,关联的系统',
  `type1` varchar(255) NOT NULL COMMENT '商品属性1',
  `type2` varchar(255) NOT NULL COMMENT '商品属性2',
  `type3` varchar(255) NOT NULL COMMENT '商品属性3',
  `ext_id` int(8) NOT NULL COMMENT '扩展字段,供其它调用',
  `myfid` int(7) NOT NULL DEFAULT '0' COMMENT '我的分类',
  `market_price` decimal(10,2) unsigned NOT NULL COMMENT '市场价格',
  `num` mediumint(7) NOT NULL DEFAULT '0' COMMENT '库存量',
  `order_num` mediumint(7) NOT NULL COMMENT '下订数量,不确定是否已付款',
  `pay_num` mediumint(7) NOT NULL COMMENT '付款数量',
  `jifen` int(7) NOT NULL DEFAULT '0' COMMENT '积分',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `fid` (`fid`),
  KEY `view` (`view`),
  KEY `comment` (`replynum`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `ext_id` (`ext_id`,`ext_sys`),
  KEY `ext_id_2` (`ext_id`,`ext_sys`),
  KEY `myfid` (`myfid`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='商品内容表';


DROP TABLE IF EXISTS `qb_shop_field`;
CREATE TABLE `qb_shop_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段名称',
  `name` varchar(32) NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `field_type` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text COMMENT '默认值',
  `options` text COMMENT '额外选项',
  `about` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `show` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `mid` mediumint(5) NOT NULL DEFAULT '0' COMMENT '所属模型id',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `listshow` tinyint(1) NOT NULL COMMENT '是否在列表显示',
  `ifsearch` tinyint(1) NOT NULL COMMENT '是否作为搜索字段',
  `ifmust` tinyint(1) NOT NULL COMMENT '是否必填项',
  `nav` varchar(30) NOT NULL COMMENT '分组名称',
  `input_width` varchar(7) NOT NULL COMMENT '输入表单宽度',
  `input_height` varchar(7) NOT NULL COMMENT '输入表单高度',
  `unit` varchar(20) NOT NULL COMMENT '单位名称',
  `match` varchar(150) NOT NULL COMMENT '表单正则匹配',
  `css` varchar(20) NOT NULL COMMENT '表单CSS类名',
  `script` text NOT NULL COMMENT 'JS脚本',
  `trigger` varchar(255) NOT NULL COMMENT '选择某一项后,联动触发显示其它字段',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='文档字段表';


DROP TABLE IF EXISTS `qb_shop_module`;
CREATE TABLE `qb_shop_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) NOT NULL DEFAULT '' COMMENT '区分符关键字',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标题',
  `layout` varchar(50) NOT NULL COMMENT '模板路径',
  `icon` varchar(64) NOT NULL,
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='模型表';


DROP TABLE IF EXISTS `qb_shop_mysort`;
CREATE TABLE `qb_shop_mysort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户的UID',
  `name` varchar(80) NOT NULL COMMENT '分类名称',
  `list` int(10) NOT NULL,
  `logo` varchar(50) NOT NULL COMMENT '封面图',
  `ext_sys` smallint(4) NOT NULL COMMENT '扩展字段,关联的系统',
  `ext_id` mediumint(7) NOT NULL COMMENT '扩展字段,关联的系统ID',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `list` (`list`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户自定义分类';


DROP TABLE IF EXISTS `qb_shop_order`;
CREATE TABLE `qb_shop_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `mid` mediumint(5) NOT NULL DEFAULT '-1' COMMENT '模型ID,只能是负数,避免跟主题相冲突',
  `order_sn` varchar(20) NOT NULL DEFAULT '' COMMENT '订单编号',
  `shop` varchar(255) NOT NULL COMMENT '购买的商品,存放格式如下:shopid-num-type1-type2-type3 商品ID,购买数量,商品属性1、2、3,多个商品用,号隔开',
  `shop_uid` mediumint(7) NOT NULL COMMENT '店主的UID',
  `shopid` mediumint(7) NOT NULL COMMENT '商品ID,扩展使用',
  `shopnum` mediumint(7) NOT NULL COMMENT '购买数量,扩展使用',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '下单客户的uid',
  `totalmoney` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总金额',
  `shipping_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `pay_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际付款金额',
  `user_rmb` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '使用余额',
  `user_jf` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用积分',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态',
  `pay_name` varchar(120) NOT NULL DEFAULT '' COMMENT '付款方式',
  `linkman` varchar(60) NOT NULL DEFAULT '' COMMENT '收货人',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货地址',
  `telphone` varchar(60) NOT NULL DEFAULT '' COMMENT '手机',
  `shipping_time` int(11) DEFAULT '0' COMMENT '发货时间',
  `receive_time` int(10) DEFAULT '0' COMMENT '收货时间',
  `receive_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '收货状态',
  `shipping_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态',
  `shipping_name` varchar(120) NOT NULL DEFAULT '' COMMENT '物流名称',
  `shipping_code` varchar(32) NOT NULL DEFAULT '' COMMENT '物流单号',
  `user_note` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `admin_note` varchar(255) DEFAULT '' COMMENT '管理员备注',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `uid` (`uid`),
  KEY `order_sn` (`order_sn`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='商品订单';


DROP TABLE IF EXISTS `qb_shop_sort`;
CREATE TABLE `qb_shop_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` varchar(50) NOT NULL,
  `list` int(10) NOT NULL,
  `logo` varchar(50) NOT NULL COMMENT '封面图',
  `template` varchar(255) NOT NULL COMMENT '模板',
  `allowpost` varchar(100) NOT NULL COMMENT '允许发布信息的用户组',
  `allowview` varchar(100) NOT NULL COMMENT '允许浏览内容的用户组',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_description` varchar(255) NOT NULL COMMENT 'SEO描述',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `pid` (`pid`),
  KEY `list` (`list`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='主栏目表';


DROP TABLE IF EXISTS `qb_signin_cfg`;
CREATE TABLE `qb_signin_cfg` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `uid` int(7) NOT NULL COMMENT '群主UID',
  `ext_sys` mediumint(5) NOT NULL COMMENT '系统ID',
  `ext_id` int(7) NOT NULL COMMENT '群ID',
  `day_money` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '每天签到奖励多少积分,若设置为3,5,8则代表连续第二天为5,第三天为8',
  `limit_num` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '限制每天前多少名签到才有奖,若设置9:00=10,14:30=10指定时刻后的前几名才有奖',
  `min_money` smallint(4) NOT NULL COMMENT '晚到的给予多少鼓励积分奖励',
  `url` varchar(150) COLLATE utf8_bin NOT NULL COMMENT '签到成功后跳转网址',
  `fx_1` varchar(5) COLLATE utf8_bin NOT NULL COMMENT '1级推荐人奖励',
  `fx_2` varchar(5) COLLATE utf8_bin NOT NULL COMMENT '2级推荐人奖励',
  `fx_3` varchar(5) COLLATE utf8_bin NOT NULL COMMENT '3级推荐人奖励',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `ext_id` (`ext_id`,`ext_sys`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='圈主设定的签到规则';


DROP TABLE IF EXISTS `qb_signin_member`;
CREATE TABLE `qb_signin_member` (
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
  KEY `intime` (`intime`),
  KEY `ip_2` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户签到记录';


DROP TABLE IF EXISTS `qb_vote_category`;
CREATE TABLE `qb_vote_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `list` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `list` (`list`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='辅栏目';


DROP TABLE IF EXISTS `qb_vote_content`;
CREATE TABLE `qb_vote_content` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `uid` int(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='内容索引表';


DROP TABLE IF EXISTS `qb_vote_content1`;
CREATE TABLE `qb_vote_content1` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `mid` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `fid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `title` varchar(256) NOT NULL DEFAULT '' COMMENT '标题',
  `ispic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否带组图',
  `uid` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `view` mediumint(7) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0未审 1已审 2推荐',
  `agree` mediumint(5) NOT NULL DEFAULT '0' COMMENT '点赞',
  `replynum` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `list` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序值',
  `picurl` text NOT NULL COMMENT '封面图',
  `content` text NOT NULL COMMENT '文章内容',
  `province_id` mediumint(5) NOT NULL COMMENT '省会ID',
  `city_id` mediumint(5) NOT NULL COMMENT '城市ID',
  `zone_id` mediumint(5) NOT NULL COMMENT '县级市或所在区ID',
  `street_id` mediumint(5) NOT NULL COMMENT '乡镇或区域街道ID',
  `ext_sys` smallint(5) NOT NULL COMMENT '扩展字段,关联的系统',
  `ext_id` int(7) NOT NULL COMMENT '扩展字段,关联的ID',
  `mobphone` varchar(12) DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `fid` (`fid`),
  KEY `view` (`view`),
  KEY `status` (`status`),
  KEY `list` (`list`),
  KEY `ispic` (`ispic`),
  KEY `province_id` (`province_id`),
  KEY `city_id` (`city_id`),
  KEY `ext_id` (`ext_id`,`ext_sys`),
  KEY `ext_id_2` (`ext_id`,`ext_sys`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='投票模型模型表';


DROP TABLE IF EXISTS `qb_vote_field`;
CREATE TABLE `qb_vote_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '字段名称',
  `name` varchar(32) NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '字段标题',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '字段类型',
  `field_type` varchar(128) NOT NULL DEFAULT '' COMMENT '字段定义',
  `value` text COMMENT '默认值',
  `options` text COMMENT '额外选项',
  `about` varchar(256) NOT NULL DEFAULT '' COMMENT '提示说明',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `mid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属模型id',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `listshow` tinyint(1) NOT NULL COMMENT '是否在列表显示',
  `ifsearch` tinyint(1) NOT NULL COMMENT '是否作为搜索字段',
  `ifmust` tinyint(1) NOT NULL COMMENT '是否必填项',
  `nav` varchar(30) NOT NULL COMMENT '分组名称',
  `input_width` varchar(7) NOT NULL COMMENT '输入表单宽度',
  `input_height` varchar(7) NOT NULL COMMENT '输入表单高度',
  `unit` varchar(20) NOT NULL COMMENT '单位名称',
  `match` varchar(150) NOT NULL COMMENT '表单正则匹配',
  `css` varchar(20) NOT NULL COMMENT '表单CSS类名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='文档字段表';


DROP TABLE IF EXISTS `qb_vote_info`;
CREATE TABLE `qb_vote_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL COMMENT '内容ID',
  `cid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '辅栏目ID',
  `list` int(10) NOT NULL COMMENT '排序值',
  PRIMARY KEY (`id`),
  KEY `mid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容索引表';


DROP TABLE IF EXISTS `qb_vote_member`;
CREATE TABLE `qb_vote_member` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `aid` int(7) NOT NULL COMMENT '投票选项ID',
  `fid` int(7) NOT NULL COMMENT '投票项目ID',
  `uid` int(7) NOT NULL COMMENT '投票用户ID',
  `create_time` int(10) NOT NULL COMMENT '投票时间时间',
  `ip` varchar(15) COLLATE utf8_bin NOT NULL COMMENT '投票所在IP',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '扩展字段,可拓展为1是投票',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `aid` (`aid`),
  KEY `type` (`type`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户投票记录';


DROP TABLE IF EXISTS `qb_vote_module`;
CREATE TABLE `qb_vote_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyword` varchar(32) NOT NULL DEFAULT '' COMMENT '区分符关键字',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模型标题',
  `layout` varchar(50) NOT NULL COMMENT '模板路径',
  `icon` varchar(64) NOT NULL,
  `list` int(10) NOT NULL DEFAULT '100' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='模型表';


DROP TABLE IF EXISTS `qb_vote_sort`;
CREATE TABLE `qb_vote_sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `mid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `name` varchar(50) NOT NULL COMMENT '投票项目名称',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '投票选项:0单选,1多选',
  `limittime` int(10) NOT NULL DEFAULT '0' COMMENT '每次投票时间间隔,0不限,单位分钟',
  `limitip` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否限制IP重复投票:0不限,1限制',
  `forbidguestvote` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否禁止游客投票:0不限,1限制',
  `repeatjoinvote` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否禁止重复报名:0不限,1限制',
  `joinbegintime` int(10) NOT NULL DEFAULT '0' COMMENT '报名开始时间',
  `joinendtime` int(10) NOT NULL DEFAULT '0' COMMENT '报名结束时间',
  `begintime` int(10) NOT NULL DEFAULT '0' COMMENT '投票开始时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '投票结束时间',
  `description` text NOT NULL COMMENT '投票内容描述',
  `list` int(10) NOT NULL,
  `logo` varchar(50) NOT NULL COMMENT '封面图',
  `template` varchar(255) NOT NULL COMMENT '模板',
  `allowpost` varchar(100) NOT NULL COMMENT '允许发布信息的用户组',
  `allowpostyz` varchar(100) NOT NULL COMMENT '允许报名自动通过审核的用户组',
  `allowview` varchar(100) NOT NULL COMMENT '允许浏览内容的用户组',
  `seo_title` varchar(255) NOT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(255) NOT NULL COMMENT 'SEO关键字',
  `seo_description` varchar(255) NOT NULL COMMENT 'SEO描述',
  `ips` text NOT NULL COMMENT '已投票的IP',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `pid` (`pid`),
  KEY `list` (`list`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='主栏目表';


DROP TABLE IF EXISTS `qb_webmenu`;
CREATE TABLE `qb_webmenu` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(5) NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` tinyint(1) NOT NULL COMMENT '0的话通用,1的话PC专用,2的话WAP专用',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '链接名称',
  `url` varchar(150) NOT NULL DEFAULT '' COMMENT '链接地址',
  `target` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0本窗口打开,1新窗口打开',
  `ifshow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1显示,0隐藏',
  `list` smallint(4) NOT NULL DEFAULT '0' COMMENT '排序值',
  `style` varchar(30) NOT NULL DEFAULT '' COMMENT 'CSS类名',
  `activate` varchar(20) NOT NULL COMMENT '频道等于这个值就代表当前在该链接下',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='网站导航菜单';


DROP TABLE IF EXISTS `qb_weixinmenu`;
CREATE TABLE `qb_weixinmenu` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `uid` int(7) NOT NULL DEFAULT '0',
  `fid` mediumint(5) NOT NULL DEFAULT '0',
  `name` varchar(80) NOT NULL DEFAULT '',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `linkurl` varchar(150) NOT NULL DEFAULT '',
  `type` tinyint(2) NOT NULL DEFAULT '0',
  `hide` tinyint(1) NOT NULL DEFAULT '0',
  `list` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='微信公众号菜单';


DROP TABLE IF EXISTS `qb_weixinmsg`;
CREATE TABLE `qb_weixinmsg` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fid` int(10) NOT NULL DEFAULT '0',
  `appid` varchar(32) NOT NULL DEFAULT '',
  `uid` int(7) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `posttime` int(10) NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公众号用户回复的消息';


DROP TABLE IF EXISTS `qb_weixinword`;
CREATE TABLE `qb_weixinword` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ask` varchar(150) NOT NULL DEFAULT '',
  `answer` text NOT NULL,
  `list` int(10) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `list` (`list`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='公众号回复关键字响应的内容';


INSERT INTO `qb_address` VALUES ('1','2','ss','0','18319657546','1111','','1');
INSERT INTO `qb_address` VALUES ('2','2','','0','','','','0');
INSERT INTO `qb_address` VALUES ('3','2','11','0','18319657546','33','','0');
INSERT INTO `qb_address` VALUES ('5','4','xx','0','1231231','1111111111111111123','','1');
INSERT INTO `qb_address` VALUES ('6','4','试试','0','555555555','8888888888','','1');
INSERT INTO `qb_address` VALUES ('7','1','wer','0','123321123','11111111111111111111','','1');
INSERT INTO `qb_address` VALUES ('9','5','test','0','12345678912','广州荔湾区芳村','','1');
INSERT INTO `qb_admin_menu` VALUES ('1','0','0','基础功能设置','','0','1','100','','3','0','fa fa-fw fa-gear');
INSERT INTO `qb_admin_menu` VALUES ('2','1','0','网站参数设置','/admin.php/admin/setting/index.html','0','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('3','1','0','网站菜单设置','/admin.php/admin/webmenu/index.html','0','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('4','0','0','用户与权限设置','','0','1','0','','3','0','fa fa-fw fa-user');
INSERT INTO `qb_admin_menu` VALUES ('5','4','0','用户资料管理','/admin.php/admin/member/index.html','0','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('6','0','0','应用市场','','0','1','0','','3','0','fa fa-fw fa-skyatlas');
INSERT INTO `qb_admin_menu` VALUES ('7','6','0','频道应用市场','/admin.php/admin/module/market.html','0','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('8','6','0','插件应用市场','/admin.php/admin/plugin/market.html','0','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('9','6','0','钩子接口应用市场','/admin.php/admin/hook_plugin/market.html','0','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('10','6','0','风格市场','/admin.php/admin/style/market.html','0','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('11','0','0','标签设置','','0','1','99','','3','0','fa fa-fw fa-crosshairs');
INSERT INTO `qb_admin_menu` VALUES ('12','11','0','PC主页标签','/index.php?label_set=set&in=pc','1','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('13','11','0','WAP主页标签','/index.php?label_set=set&in=wap','1','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('14','11','0','退出标签管理','/index.php?label_set=quit&in=pc','1','1','0','','3','0','');
INSERT INTO `qb_admin_menu` VALUES ('78','77','1','我发布的内容','/member.php/cms/list.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('79','77','1','发布内容','/member.php/cms/content/postnew.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('80','77','1','采集公众号文章','/member.php/cms/content/copynews.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('81','77','1','分类管理','/member.php/cms/mysort/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('115','0','1','会员基础设置','','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('116','115','1','修改个人资料','/member.php/member/user/edit.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('117','115','1','站内短消息','/member.php/member/msg/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('210','115','1','消息提醒设置','/member.php/member/remind/set.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('119','115','1','绑定第三方登录','/member.php/member/bindlogin/weixin.html','0','0','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('120','115','1','升级会员等级','/member.php/member/group/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('121','115','1','身份验证','/member.php/member/yz/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('122','0','1','好友','','0','1','0','','8','0','fa fa-sitemap');
INSERT INTO `qb_admin_menu` VALUES ('123','122','1','我推荐的用户','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/propagandize.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('124','0','1','砸金蛋游戏','','0','1','0','','8','0','fa fa-fw fa-legal');
INSERT INTO `qb_admin_menu` VALUES ('125','124','1','我的砸金蛋日志','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/eggs.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('126','0','1','会员签到','','0','1','0','','8','0','fa fa-calendar-check-o');
INSERT INTO `qb_admin_menu` VALUES ('127','126','1','我的签到日志','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/signin.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('129','0','1','大转盘游戏','','0','1','0','','8','0','fa fa-bullseye');
INSERT INTO `qb_admin_menu` VALUES ('130','129','1','我的抽奖日志','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/gamedial.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('131','0','1','积分打赏','','0','1','0','','8','0','fa fa-database');
INSERT INTO `qb_admin_menu` VALUES ('132','131','1','我受赠的积分','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/givemoney.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('133','0','1','财务与积分功能','','0','1','0','','8','0','fa fa-fw fa-database');
INSERT INTO `qb_admin_menu` VALUES ('134','133','1','积分日志','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/jifen/plugin_name/marketing.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('135','133','1','积分充值','/member.php/member/plugin/execute/plugin_action/add/plugin_controller/jifen/plugin_name/marketing.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('136','133','1','我的财务信息','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/rmb/plugin_name/marketing.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('137','133','1','收款帐号设置','/member.php/member/plugin/execute/plugin_action/edit/plugin_controller/rmb/plugin_name/marketing.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('139','138','1','商品管理','/member.php/giftshop/content/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('140','138','1','发布商品','/member.php/giftshop/content/postnew.html','0','0','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('141','138','1','我订购的商品','/member.php/giftshop/order/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('142','138','1','客户的订单','/member.php/giftshop/kehu_order/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('143','0','1','霸闻资讯','','0','1','0','','8','0','fa fa-fw fa-file-text');
INSERT INTO `qb_admin_menu` VALUES ('144','143','1','我发布的内容','/member.php/cms/list.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('145','143','1','发布内容','/member.php/cms/content/postnew.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('146','143','1','采集公众号文章','/member.php/cms/content/copynews.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('147','143','1','分类管理','/member.php/cms/mysort/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('149','0','1','会员基础设置','','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('150','149','1','修改个人资料','/member.php/member/user/edit.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('151','149','1','站内短消息','/member.php/member/msg/index.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('152','149','1','消息提醒设置','/member.php/member/remind/set.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('153','149','1','绑定第三方登录','/member.php/member/bindlogin/weixin.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('154','149','1','升级会员等级','/member.php/member/group/index.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('155','149','1','身份验证','/member.php/member/yz/index.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('156','0','1','分销宣传推广','','0','1','0','','13','0','fa fa-sitemap');
INSERT INTO `qb_admin_menu` VALUES ('157','156','1','我推荐的用户','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/propagandize.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('158','0','1','砸金蛋游戏','','0','1','0','','13','0','fa fa-fw fa-legal');
INSERT INTO `qb_admin_menu` VALUES ('159','158','1','我的砸金蛋日志','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/eggs.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('160','0','1','会员签到','','0','1','0','','13','0','fa fa-calendar-check-o');
INSERT INTO `qb_admin_menu` VALUES ('161','160','1','我的签到日志','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/signin.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('163','0','1','大转盘游戏','','0','1','0','','13','0','fa fa-bullseye');
INSERT INTO `qb_admin_menu` VALUES ('164','163','1','我的抽奖日志','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/gamedial.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('165','0','1','积分打赏','','0','1','0','','13','0','fa fa-database');
INSERT INTO `qb_admin_menu` VALUES ('166','165','1','我受赠的积分','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/givemoney.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('167','0','1','财务与积分功能','','0','1','0','','13','0','fa fa-fw fa-database');
INSERT INTO `qb_admin_menu` VALUES ('168','167','1','积分日志','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/jifen/plugin_name/marketing.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('169','167','1','积分充值','/member.php/member/plugin/execute/plugin_action/add/plugin_controller/jifen/plugin_name/marketing.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('170','167','1','我的财务信息','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/rmb/plugin_name/marketing.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('171','167','1','收款帐号设置','/member.php/member/plugin/execute/plugin_action/edit/plugin_controller/rmb/plugin_name/marketing.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('172','0','1','霸币商城','','0','1','0','','13','0','fa fa-gift');
INSERT INTO `qb_admin_menu` VALUES ('173','172','1','商品管理','/member.php/giftshop/content/index.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('174','172','1','发布商品','/member.php/giftshop/content/postnew.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('175','172','1','我订购的商品','/member.php/giftshop/order/index.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('176','172','1','客户的订单','/member.php/giftshop/kehu_order/index.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('177','0','1','霸闻资讯','','0','1','0','','13','0','fa fa-fw fa-file-text');
INSERT INTO `qb_admin_menu` VALUES ('178','177','1','我发布的内容','/member.php/cms/list.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('179','177','1','发布内容','/member.php/cms/content/postnew.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('180','177','1','采集公众号文章','/member.php/cms/content/copynews.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('183','182','1','我的收藏夹','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/fav/plugin_name/fav.html','0','1','0','','13','0','');
INSERT INTO `qb_admin_menu` VALUES ('184','0','1','收徒中心','','0','1','0','','8','0','fa fa-sitemap');
INSERT INTO `qb_admin_menu` VALUES ('185','184','1','我推荐的用户','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/propagandize.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('186','0','1','霸币商城','','0','1','0','','8','0','fa fa-gift');
INSERT INTO `qb_admin_menu` VALUES ('189','186','1','我订购的商品','/member.php/giftshop/order/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('192','191','1','我的收藏夹','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/fav/plugin_name/fav.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('211','115','1','绑定第三方登录','/member.php/member/bindlogin/weixin.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('212','115','1','升级会员等级','/member.php/member/group/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('213','115','1','身份验证','/member.php/member/yz/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('214','0','1','收藏夹','','0','1','0','','8','0','fa fa-fw fa-heart');
INSERT INTO `qb_admin_menu` VALUES ('215','214','1','我的收藏夹','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/fav/plugin_name/fav.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('216','0','1','代理','','0','1','0','','8','0','fa fa-sitemap');
INSERT INTO `qb_admin_menu` VALUES ('217','216','1','我推荐的用户','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/log/plugin_name/propagandize.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('218','126','1','签到设置','/member.php/member/plugin/execute/plugin_action/index/plugin_controller/manage/plugin_name/signin.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('220','219','1','我报名的投票','/member.php/vote/content/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('221','219','1','我要报名','/member.php/vote/content/postnew.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('222','0','1','论坛系统','','0','1','0','','8','0','fa fa-fw fa-group');
INSERT INTO `qb_admin_menu` VALUES ('223','222','1','我发布的内容','/member.php/bbs/list.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('224','222','1','发布内容','/member.php/bbs/content/postnew.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('225','186','1','商品管理','/member.php/giftshop/content/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('226','186','1','发布商品','/member.php/giftshop/content/postnew.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('227','186','1','我订购的商品','/member.php/giftshop/order/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('228','186','1','客户的订单','/member.php/giftshop/kehu_order/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('229','0','1','商城系统','','0','1','0','','8','0','fa fa-shopping-bag');
INSERT INTO `qb_admin_menu` VALUES ('230','229','1','商品管理','/member.php/shop/content/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('231','229','1','发布商品','/member.php/shop/content/postnew.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('232','229','1','我订购的商品','/member.php/shop/order/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('233','229','1','客户的订单','/member.php/shop/kehu_order/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('234','229','1','收货地址管理','/member.php/shop/address/index.html','0','1','0','','8','0','');
INSERT INTO `qb_admin_menu` VALUES ('235','229','1','分类管理','/member.php/shop/mysort/index.html','0','1','0','','8','0','');
INSERT INTO `qb_alonepage` VALUES ('1','欢迎关注官方微信','欢迎关注公众号','1447747983','','do/weixin.htm','','','<p style=\"text-align:center;\"><br/></p><p>亲爱的会员，</p><p>&nbsp; 本站会员微信官方账号现已开通，您可以通过“扫一扫”功能或查找公众号中输入“齐博软件”即可添加。最新、最热的活动资讯将第一时间通知到您！</p><p><br/></p><p style=\"text-align:center;\"><img src=\"http://bbs.qibosoft.com/attachment123456br666vh00/Day_140402/10312_243423_d93579d4987ee55.jpg\" width=\"430\" height=\"430\"/><br/></p>','36','1','','0');
INSERT INTO `qb_area` VALUES ('18','0','北京市','1','0','','110000');
INSERT INTO `qb_area` VALUES ('19','0','天津市','1','0','','120000');
INSERT INTO `qb_area` VALUES ('20','0','河北省','1','0','','130000');
INSERT INTO `qb_area` VALUES ('21','0','山西省','1','0','','140000');
INSERT INTO `qb_area` VALUES ('22','0','内蒙古自治区','1','0','','150000');
INSERT INTO `qb_area` VALUES ('23','0','辽宁省','1','0','','210000');
INSERT INTO `qb_area` VALUES ('24','0','吉林省','1','0','','220000');
INSERT INTO `qb_area` VALUES ('25','0','黑龙江省','1','0','','230000');
INSERT INTO `qb_area` VALUES ('26','0','上海市','1','0','','310000');
INSERT INTO `qb_area` VALUES ('27','0','江苏省','1','0','','320000');
INSERT INTO `qb_area` VALUES ('28','0','浙江省','1','0','','330000');
INSERT INTO `qb_area` VALUES ('29','0','安徽省','1','0','','340000');
INSERT INTO `qb_area` VALUES ('30','0','福建省','1','0','','350000');
INSERT INTO `qb_area` VALUES ('31','0','江西省','1','0','','360000');
INSERT INTO `qb_area` VALUES ('32','0','山东省','1','0','','370000');
INSERT INTO `qb_area` VALUES ('33','0','河南省','1','0','','410000');
INSERT INTO `qb_area` VALUES ('34','0','湖北省','1','0','','420000');
INSERT INTO `qb_area` VALUES ('35','0','湖南省','1','0','','430000');
INSERT INTO `qb_area` VALUES ('36','0','广东省','1','0','','440000');
INSERT INTO `qb_area` VALUES ('37','0','广西壮族自治区','1','0','','450000');
INSERT INTO `qb_area` VALUES ('38','0','海南省','1','0','','460000');
INSERT INTO `qb_area` VALUES ('39','0','重庆市','1','0','','500000');
INSERT INTO `qb_area` VALUES ('40','0','四川省','1','0','','510000');
INSERT INTO `qb_area` VALUES ('41','0','贵州省','1','0','','520000');
INSERT INTO `qb_area` VALUES ('42','0','云南省','1','0','','530000');
INSERT INTO `qb_area` VALUES ('43','0','西藏自治区','1','0','','540000');
INSERT INTO `qb_area` VALUES ('44','0','陕西省','1','0','','610000');
INSERT INTO `qb_area` VALUES ('45','0','甘肃省','1','0','','620000');
INSERT INTO `qb_area` VALUES ('46','0','青海省','1','0','','630000');
INSERT INTO `qb_area` VALUES ('47','0','宁夏回族自治区','1','0','','640000');
INSERT INTO `qb_area` VALUES ('48','0','新疆维吾尔自治区','1','0','','650000');
INSERT INTO `qb_area` VALUES ('49','0','香港特别行政区','1','0','','810000');
INSERT INTO `qb_area` VALUES ('50','0','澳门特别行政区','1','0','','820000');
INSERT INTO `qb_area` VALUES ('51','0','台湾省','1','0','','830000');
INSERT INTO `qb_area` VALUES ('52','20','石家庄市','2','0','','130100');
INSERT INTO `qb_area` VALUES ('53','20','唐山市','2','0','','130200');
INSERT INTO `qb_area` VALUES ('54','20','秦皇岛市','2','0','','130300');
INSERT INTO `qb_area` VALUES ('55','20','邯郸市','2','0','','130400');
INSERT INTO `qb_area` VALUES ('56','20','邢台市','2','0','','130500');
INSERT INTO `qb_area` VALUES ('57','20','保定市','2','0','','130600');
INSERT INTO `qb_area` VALUES ('58','20','张家口市','2','0','','130700');
INSERT INTO `qb_area` VALUES ('59','20','承德市','2','0','','130800');
INSERT INTO `qb_area` VALUES ('60','20','沧州市','2','0','','130900');
INSERT INTO `qb_area` VALUES ('61','20','廊坊市','2','0','','131000');
INSERT INTO `qb_area` VALUES ('62','20','衡水市','2','0','','131100');
INSERT INTO `qb_area` VALUES ('63','21','太原市','2','0','','140100');
INSERT INTO `qb_area` VALUES ('64','21','大同市','2','0','','140200');
INSERT INTO `qb_area` VALUES ('65','21','阳泉市','2','0','','140300');
INSERT INTO `qb_area` VALUES ('66','21','长治市','2','0','','140400');
INSERT INTO `qb_area` VALUES ('67','21','晋城市','2','0','','140500');
INSERT INTO `qb_area` VALUES ('68','21','朔州市','2','0','','140600');
INSERT INTO `qb_area` VALUES ('69','21','晋中市','2','0','','140700');
INSERT INTO `qb_area` VALUES ('70','21','运城市','2','0','','140800');
INSERT INTO `qb_area` VALUES ('71','21','忻州市','2','0','','140900');
INSERT INTO `qb_area` VALUES ('72','21','临汾市','2','0','','141000');
INSERT INTO `qb_area` VALUES ('73','21','吕梁市','2','0','','141100');
INSERT INTO `qb_area` VALUES ('74','22','呼和浩特市','2','0','','150100');
INSERT INTO `qb_area` VALUES ('75','22','包头市','2','0','','150200');
INSERT INTO `qb_area` VALUES ('76','22','乌海市','2','0','','150300');
INSERT INTO `qb_area` VALUES ('77','22','赤峰市','2','0','','150400');
INSERT INTO `qb_area` VALUES ('78','22','通辽市','2','0','','150500');
INSERT INTO `qb_area` VALUES ('79','22','鄂尔多斯市','2','0','','150600');
INSERT INTO `qb_area` VALUES ('80','22','呼伦贝尔市','2','0','','150700');
INSERT INTO `qb_area` VALUES ('81','22','巴彦淖尔市','2','0','','150800');
INSERT INTO `qb_area` VALUES ('82','22','乌兰察布市','2','0','','150900');
INSERT INTO `qb_area` VALUES ('83','22','兴安盟','2','0','','152200');
INSERT INTO `qb_area` VALUES ('84','22','锡林郭勒盟','2','0','','152500');
INSERT INTO `qb_area` VALUES ('85','22','阿拉善盟','2','0','','152900');
INSERT INTO `qb_area` VALUES ('86','23','沈阳市','2','0','','210100');
INSERT INTO `qb_area` VALUES ('87','23','大连市','2','0','','210200');
INSERT INTO `qb_area` VALUES ('88','23','鞍山市','2','0','','210300');
INSERT INTO `qb_area` VALUES ('89','23','抚顺市','2','0','','210400');
INSERT INTO `qb_area` VALUES ('90','23','本溪市','2','0','','210500');
INSERT INTO `qb_area` VALUES ('91','23','丹东市','2','0','','210600');
INSERT INTO `qb_area` VALUES ('92','23','锦州市','2','0','','210700');
INSERT INTO `qb_area` VALUES ('93','23','营口市','2','0','','210800');
INSERT INTO `qb_area` VALUES ('94','23','阜新市','2','0','','210900');
INSERT INTO `qb_area` VALUES ('95','23','辽阳市','2','0','','211000');
INSERT INTO `qb_area` VALUES ('96','23','盘锦市','2','0','','211100');
INSERT INTO `qb_area` VALUES ('97','23','铁岭市','2','0','','211200');
INSERT INTO `qb_area` VALUES ('98','23','朝阳市','2','0','','211300');
INSERT INTO `qb_area` VALUES ('99','23','葫芦岛市','2','0','','211400');
INSERT INTO `qb_area` VALUES ('100','24','长春市','2','0','','220100');
INSERT INTO `qb_area` VALUES ('101','24','吉林市','2','0','','220200');
INSERT INTO `qb_area` VALUES ('102','24','四平市','2','0','','220300');
INSERT INTO `qb_area` VALUES ('103','24','辽源市','2','0','','220400');
INSERT INTO `qb_area` VALUES ('104','24','通化市','2','0','','220500');
INSERT INTO `qb_area` VALUES ('105','24','白山市','2','0','','220600');
INSERT INTO `qb_area` VALUES ('106','24','松原市','2','0','','220700');
INSERT INTO `qb_area` VALUES ('107','24','白城市','2','0','','220800');
INSERT INTO `qb_area` VALUES ('108','24','延边朝鲜族自治州','2','0','','222400');
INSERT INTO `qb_area` VALUES ('109','25','哈尔滨市','2','0','','230100');
INSERT INTO `qb_area` VALUES ('110','25','齐齐哈尔市','2','0','','230200');
INSERT INTO `qb_area` VALUES ('111','25','鸡西市','2','0','','230300');
INSERT INTO `qb_area` VALUES ('112','25','鹤岗市','2','0','','230400');
INSERT INTO `qb_area` VALUES ('113','25','双鸭山市','2','0','','230500');
INSERT INTO `qb_area` VALUES ('114','25','大庆市','2','0','','230600');
INSERT INTO `qb_area` VALUES ('115','25','伊春市','2','0','','230700');
INSERT INTO `qb_area` VALUES ('116','25','佳木斯市','2','0','','230800');
INSERT INTO `qb_area` VALUES ('117','25','七台河市','2','0','','230900');
INSERT INTO `qb_area` VALUES ('118','25','牡丹江市','2','0','','231000');
INSERT INTO `qb_area` VALUES ('119','25','黑河市','2','0','','231100');
INSERT INTO `qb_area` VALUES ('120','25','绥化市','2','0','','231200');
INSERT INTO `qb_area` VALUES ('121','25','大兴安岭地区','2','0','','232700');
INSERT INTO `qb_area` VALUES ('122','27','南京市','2','0','','320100');
INSERT INTO `qb_area` VALUES ('123','27','无锡市','2','0','','320200');
INSERT INTO `qb_area` VALUES ('124','27','徐州市','2','0','','320300');
INSERT INTO `qb_area` VALUES ('125','27','常州市','2','0','','320400');
INSERT INTO `qb_area` VALUES ('126','27','苏州市','2','0','','320500');
INSERT INTO `qb_area` VALUES ('127','27','南通市','2','0','','320600');
INSERT INTO `qb_area` VALUES ('128','27','连云港市','2','0','','320700');
INSERT INTO `qb_area` VALUES ('129','27','淮安市','2','0','','320800');
INSERT INTO `qb_area` VALUES ('130','27','盐城市','2','0','','320900');
INSERT INTO `qb_area` VALUES ('131','27','扬州市','2','0','','321000');
INSERT INTO `qb_area` VALUES ('132','27','镇江市','2','0','','321100');
INSERT INTO `qb_area` VALUES ('133','27','泰州市','2','0','','321200');
INSERT INTO `qb_area` VALUES ('134','27','宿迁市','2','0','','321300');
INSERT INTO `qb_area` VALUES ('135','28','杭州市','2','0','','330100');
INSERT INTO `qb_area` VALUES ('136','28','宁波市','2','0','','330200');
INSERT INTO `qb_area` VALUES ('137','28','温州市','2','0','','330300');
INSERT INTO `qb_area` VALUES ('138','28','嘉兴市','2','0','','330400');
INSERT INTO `qb_area` VALUES ('139','28','湖州市','2','0','','330500');
INSERT INTO `qb_area` VALUES ('140','28','绍兴市','2','0','','330600');
INSERT INTO `qb_area` VALUES ('141','28','金华市','2','0','','330700');
INSERT INTO `qb_area` VALUES ('142','28','衢州市','2','0','','330800');
INSERT INTO `qb_area` VALUES ('143','28','舟山市','2','0','','330900');
INSERT INTO `qb_area` VALUES ('144','28','台州市','2','0','','331000');
INSERT INTO `qb_area` VALUES ('145','28','丽水市','2','0','','331100');
INSERT INTO `qb_area` VALUES ('146','29','合肥市','2','0','','340100');
INSERT INTO `qb_area` VALUES ('147','29','芜湖市','2','0','','340200');
INSERT INTO `qb_area` VALUES ('148','29','蚌埠市','2','0','','340300');
INSERT INTO `qb_area` VALUES ('149','29','淮南市','2','0','','340400');
INSERT INTO `qb_area` VALUES ('150','29','马鞍山市','2','0','','340500');
INSERT INTO `qb_area` VALUES ('151','29','淮北市','2','0','','340600');
INSERT INTO `qb_area` VALUES ('152','29','铜陵市','2','0','','340700');
INSERT INTO `qb_area` VALUES ('153','29','安庆市','2','0','','340800');
INSERT INTO `qb_area` VALUES ('154','29','黄山市','2','0','','341000');
INSERT INTO `qb_area` VALUES ('155','29','滁州市','2','0','','341100');
INSERT INTO `qb_area` VALUES ('156','29','阜阳市','2','0','','341200');
INSERT INTO `qb_area` VALUES ('157','29','宿州市','2','0','','341300');
INSERT INTO `qb_area` VALUES ('158','29','六安市','2','0','','341500');
INSERT INTO `qb_area` VALUES ('159','29','亳州市','2','0','','341600');
INSERT INTO `qb_area` VALUES ('160','29','池州市','2','0','','341700');
INSERT INTO `qb_area` VALUES ('161','29','宣城市','2','0','','341800');
INSERT INTO `qb_area` VALUES ('162','30','福州市','2','0','','350100');
INSERT INTO `qb_area` VALUES ('163','30','厦门市','2','0','','350200');
INSERT INTO `qb_area` VALUES ('164','30','莆田市','2','0','','350300');
INSERT INTO `qb_area` VALUES ('165','30','三明市','2','0','','350400');
INSERT INTO `qb_area` VALUES ('166','30','泉州市','2','0','','350500');
INSERT INTO `qb_area` VALUES ('167','30','漳州市','2','0','','350600');
INSERT INTO `qb_area` VALUES ('168','30','南平市','2','0','','350700');
INSERT INTO `qb_area` VALUES ('169','30','龙岩市','2','0','','350800');
INSERT INTO `qb_area` VALUES ('170','30','宁德市','2','0','','350900');
INSERT INTO `qb_area` VALUES ('171','31','南昌市','2','0','','360100');
INSERT INTO `qb_area` VALUES ('172','31','景德镇市','2','0','','360200');
INSERT INTO `qb_area` VALUES ('173','31','萍乡市','2','0','','360300');
INSERT INTO `qb_area` VALUES ('174','31','九江市','2','0','','360400');
INSERT INTO `qb_area` VALUES ('175','31','新余市','2','0','','360500');
INSERT INTO `qb_area` VALUES ('176','31','鹰潭市','2','0','','360600');
INSERT INTO `qb_area` VALUES ('177','31','赣州市','2','0','','360700');
INSERT INTO `qb_area` VALUES ('178','31','吉安市','2','0','','360800');
INSERT INTO `qb_area` VALUES ('179','31','宜春市','2','0','','360900');
INSERT INTO `qb_area` VALUES ('180','31','抚州市','2','0','','361000');
INSERT INTO `qb_area` VALUES ('181','31','上饶市','2','0','','361100');
INSERT INTO `qb_area` VALUES ('182','32','济南市','2','0','','370100');
INSERT INTO `qb_area` VALUES ('183','32','青岛市','2','0','','370200');
INSERT INTO `qb_area` VALUES ('184','32','淄博市','2','0','','370300');
INSERT INTO `qb_area` VALUES ('185','32','枣庄市','2','0','','370400');
INSERT INTO `qb_area` VALUES ('186','32','东营市','2','0','','370500');
INSERT INTO `qb_area` VALUES ('187','32','烟台市','2','0','','370600');
INSERT INTO `qb_area` VALUES ('188','32','潍坊市','2','0','','370700');
INSERT INTO `qb_area` VALUES ('189','32','济宁市','2','0','','370800');
INSERT INTO `qb_area` VALUES ('190','32','泰安市','2','0','','370900');
INSERT INTO `qb_area` VALUES ('191','32','威海市','2','0','','371000');
INSERT INTO `qb_area` VALUES ('192','32','日照市','2','0','','371100');
INSERT INTO `qb_area` VALUES ('193','32','莱芜市','2','0','','371200');
INSERT INTO `qb_area` VALUES ('194','32','临沂市','2','0','','371300');
INSERT INTO `qb_area` VALUES ('195','32','德州市','2','0','','371400');
INSERT INTO `qb_area` VALUES ('196','32','聊城市','2','0','','371500');
INSERT INTO `qb_area` VALUES ('197','32','滨州市','2','0','','371600');
INSERT INTO `qb_area` VALUES ('198','32','菏泽市','2','0','','371700');
INSERT INTO `qb_area` VALUES ('199','33','郑州市','2','0','','410100');
INSERT INTO `qb_area` VALUES ('200','33','开封市','2','0','','410200');
INSERT INTO `qb_area` VALUES ('201','33','洛阳市','2','0','','410300');
INSERT INTO `qb_area` VALUES ('202','33','平顶山市','2','0','','410400');
INSERT INTO `qb_area` VALUES ('203','33','安阳市','2','0','','410500');
INSERT INTO `qb_area` VALUES ('204','33','鹤壁市','2','0','','410600');
INSERT INTO `qb_area` VALUES ('205','33','新乡市','2','0','','410700');
INSERT INTO `qb_area` VALUES ('206','33','焦作市','2','0','','410800');
INSERT INTO `qb_area` VALUES ('207','33','濮阳市','2','0','','410900');
INSERT INTO `qb_area` VALUES ('208','33','许昌市','2','0','','411000');
INSERT INTO `qb_area` VALUES ('209','33','漯河市','2','0','','411100');
INSERT INTO `qb_area` VALUES ('210','33','三门峡市','2','0','','411200');
INSERT INTO `qb_area` VALUES ('211','33','南阳市','2','0','','411300');
INSERT INTO `qb_area` VALUES ('212','33','商丘市','2','0','','411400');
INSERT INTO `qb_area` VALUES ('213','33','信阳市','2','0','','411500');
INSERT INTO `qb_area` VALUES ('214','33','周口市','2','0','','411600');
INSERT INTO `qb_area` VALUES ('215','33','驻马店市','2','0','','411700');
INSERT INTO `qb_area` VALUES ('216','34','武汉市','2','0','','420100');
INSERT INTO `qb_area` VALUES ('217','34','黄石市','2','0','','420200');
INSERT INTO `qb_area` VALUES ('218','34','十堰市','2','0','','420300');
INSERT INTO `qb_area` VALUES ('219','34','宜昌市','2','0','','420500');
INSERT INTO `qb_area` VALUES ('220','34','襄阳市','2','0','','420600');
INSERT INTO `qb_area` VALUES ('221','34','鄂州市','2','0','','420700');
INSERT INTO `qb_area` VALUES ('222','34','荆门市','2','0','','420800');
INSERT INTO `qb_area` VALUES ('223','34','孝感市','2','0','','420900');
INSERT INTO `qb_area` VALUES ('224','34','荆州市','2','0','','421000');
INSERT INTO `qb_area` VALUES ('225','34','黄冈市','2','0','','421100');
INSERT INTO `qb_area` VALUES ('226','34','咸宁市','2','0','','421200');
INSERT INTO `qb_area` VALUES ('227','34','随州市','2','0','','421300');
INSERT INTO `qb_area` VALUES ('228','34','恩施土家族苗族自治州','2','0','','422800');
INSERT INTO `qb_area` VALUES ('229','35','长沙市','2','0','','430100');
INSERT INTO `qb_area` VALUES ('230','35','株洲市','2','0','','430200');
INSERT INTO `qb_area` VALUES ('231','35','湘潭市','2','0','','430300');
INSERT INTO `qb_area` VALUES ('232','35','衡阳市','2','0','','430400');
INSERT INTO `qb_area` VALUES ('233','35','邵阳市','2','0','','430500');
INSERT INTO `qb_area` VALUES ('234','35','岳阳市','2','0','','430600');
INSERT INTO `qb_area` VALUES ('235','35','常德市','2','0','','430700');
INSERT INTO `qb_area` VALUES ('236','35','张家界市','2','0','','430800');
INSERT INTO `qb_area` VALUES ('237','35','益阳市','2','0','','430900');
INSERT INTO `qb_area` VALUES ('238','35','郴州市','2','0','','431000');
INSERT INTO `qb_area` VALUES ('239','35','永州市','2','0','','431100');
INSERT INTO `qb_area` VALUES ('240','35','怀化市','2','0','','431200');
INSERT INTO `qb_area` VALUES ('241','35','娄底市','2','0','','431300');
INSERT INTO `qb_area` VALUES ('242','35','湘西土家族苗族自治州','2','0','','433100');
INSERT INTO `qb_area` VALUES ('243','36','广州市','2','0','','440100');
INSERT INTO `qb_area` VALUES ('244','36','韶关市','2','0','','440200');
INSERT INTO `qb_area` VALUES ('245','36','深圳市','2','0','','440300');
INSERT INTO `qb_area` VALUES ('246','36','珠海市','2','0','','440400');
INSERT INTO `qb_area` VALUES ('247','36','汕头市','2','0','','440500');
INSERT INTO `qb_area` VALUES ('248','36','佛山市','2','0','','440600');
INSERT INTO `qb_area` VALUES ('249','36','江门市','2','0','','440700');
INSERT INTO `qb_area` VALUES ('250','36','湛江市','2','0','','440800');
INSERT INTO `qb_area` VALUES ('251','36','茂名市','2','0','','440900');
INSERT INTO `qb_area` VALUES ('252','36','肇庆市','2','0','','441200');
INSERT INTO `qb_area` VALUES ('253','36','惠州市','2','0','','441300');
INSERT INTO `qb_area` VALUES ('254','36','梅州市','2','0','','441400');
INSERT INTO `qb_area` VALUES ('255','36','汕尾市','2','0','','441500');
INSERT INTO `qb_area` VALUES ('256','36','河源市','2','0','','441600');
INSERT INTO `qb_area` VALUES ('257','36','阳江市','2','0','','441700');
INSERT INTO `qb_area` VALUES ('258','36','清远市','2','0','','441800');
INSERT INTO `qb_area` VALUES ('259','36','东莞市','2','0','','441900');
INSERT INTO `qb_area` VALUES ('260','36','中山市','2','0','','442000');
INSERT INTO `qb_area` VALUES ('261','36','潮州市','2','0','','445100');
INSERT INTO `qb_area` VALUES ('262','36','揭阳市','2','0','','445200');
INSERT INTO `qb_area` VALUES ('263','36','云浮市','2','0','','445300');
INSERT INTO `qb_area` VALUES ('264','37','南宁市','2','0','','450100');
INSERT INTO `qb_area` VALUES ('265','37','柳州市','2','0','','450200');
INSERT INTO `qb_area` VALUES ('266','37','桂林市','2','0','','450300');
INSERT INTO `qb_area` VALUES ('267','37','梧州市','2','0','','450400');
INSERT INTO `qb_area` VALUES ('268','37','北海市','2','0','','450500');
INSERT INTO `qb_area` VALUES ('269','37','防城港市','2','0','','450600');
INSERT INTO `qb_area` VALUES ('270','37','钦州市','2','0','','450700');
INSERT INTO `qb_area` VALUES ('271','37','贵港市','2','0','','450800');
INSERT INTO `qb_area` VALUES ('272','37','玉林市','2','0','','450900');
INSERT INTO `qb_area` VALUES ('273','37','百色市','2','0','','451000');
INSERT INTO `qb_area` VALUES ('274','37','贺州市','2','0','','451100');
INSERT INTO `qb_area` VALUES ('275','37','河池市','2','0','','451200');
INSERT INTO `qb_area` VALUES ('276','37','来宾市','2','0','','451300');
INSERT INTO `qb_area` VALUES ('277','37','崇左市','2','0','','451400');
INSERT INTO `qb_area` VALUES ('278','38','海口市','2','0','','460100');
INSERT INTO `qb_area` VALUES ('279','38','三亚市','2','0','','460200');
INSERT INTO `qb_area` VALUES ('280','38','三沙市','2','0','','460300');
INSERT INTO `qb_area` VALUES ('281','38','儋州市','2','0','','460400');
INSERT INTO `qb_area` VALUES ('282','40','成都市','2','0','','510100');
INSERT INTO `qb_area` VALUES ('283','40','自贡市','2','0','','510300');
INSERT INTO `qb_area` VALUES ('284','40','攀枝花市','2','0','','510400');
INSERT INTO `qb_area` VALUES ('285','40','泸州市','2','0','','510500');
INSERT INTO `qb_area` VALUES ('286','40','德阳市','2','0','','510600');
INSERT INTO `qb_area` VALUES ('287','40','绵阳市','2','0','','510700');
INSERT INTO `qb_area` VALUES ('288','40','广元市','2','0','','510800');
INSERT INTO `qb_area` VALUES ('289','40','遂宁市','2','0','','510900');
INSERT INTO `qb_area` VALUES ('290','40','内江市','2','0','','511000');
INSERT INTO `qb_area` VALUES ('291','40','乐山市','2','0','','511100');
INSERT INTO `qb_area` VALUES ('292','40','南充市','2','0','','511300');
INSERT INTO `qb_area` VALUES ('293','40','眉山市','2','0','','511400');
INSERT INTO `qb_area` VALUES ('294','40','宜宾市','2','0','','511500');
INSERT INTO `qb_area` VALUES ('295','40','广安市','2','0','','511600');
INSERT INTO `qb_area` VALUES ('296','40','达州市','2','0','','511700');
INSERT INTO `qb_area` VALUES ('297','40','雅安市','2','0','','511800');
INSERT INTO `qb_area` VALUES ('298','40','巴中市','2','0','','511900');
INSERT INTO `qb_area` VALUES ('299','40','资阳市','2','0','','512000');
INSERT INTO `qb_area` VALUES ('300','40','阿坝藏族羌族自治州','2','0','','513200');
INSERT INTO `qb_area` VALUES ('301','40','甘孜藏族自治州','2','0','','513300');
INSERT INTO `qb_area` VALUES ('302','40','凉山彝族自治州','2','0','','513400');
INSERT INTO `qb_area` VALUES ('303','41','贵阳市','2','0','','520100');
INSERT INTO `qb_area` VALUES ('304','41','六盘水市','2','0','','520200');
INSERT INTO `qb_area` VALUES ('305','41','遵义市','2','0','','520300');
INSERT INTO `qb_area` VALUES ('306','41','安顺市','2','0','','520400');
INSERT INTO `qb_area` VALUES ('307','41','毕节市','2','0','','520500');
INSERT INTO `qb_area` VALUES ('308','41','铜仁市','2','0','','520600');
INSERT INTO `qb_area` VALUES ('309','41','黔西南布依族苗族自治州','2','0','','522300');
INSERT INTO `qb_area` VALUES ('310','41','黔东南苗族侗族自治州','2','0','','522600');
INSERT INTO `qb_area` VALUES ('311','41','黔南布依族苗族自治州','2','0','','522700');
INSERT INTO `qb_area` VALUES ('312','42','昆明市','2','0','','530100');
INSERT INTO `qb_area` VALUES ('313','42','曲靖市','2','0','','530300');
INSERT INTO `qb_area` VALUES ('314','42','玉溪市','2','0','','530400');
INSERT INTO `qb_area` VALUES ('315','42','保山市','2','0','','530500');
INSERT INTO `qb_area` VALUES ('316','42','昭通市','2','0','','530600');
INSERT INTO `qb_area` VALUES ('317','42','丽江市','2','0','','530700');
INSERT INTO `qb_area` VALUES ('318','42','普洱市','2','0','','530800');
INSERT INTO `qb_area` VALUES ('319','42','临沧市','2','0','','530900');
INSERT INTO `qb_area` VALUES ('320','42','楚雄彝族自治州','2','0','','532300');
INSERT INTO `qb_area` VALUES ('321','42','红河哈尼族彝族自治州','2','0','','532500');
INSERT INTO `qb_area` VALUES ('322','42','文山壮族苗族自治州','2','0','','532600');
INSERT INTO `qb_area` VALUES ('323','42','西双版纳傣族自治州','2','0','','532800');
INSERT INTO `qb_area` VALUES ('324','42','大理白族自治州','2','0','','532900');
INSERT INTO `qb_area` VALUES ('325','42','德宏傣族景颇族自治州','2','0','','533100');
INSERT INTO `qb_area` VALUES ('326','42','怒江傈僳族自治州','2','0','','533300');
INSERT INTO `qb_area` VALUES ('327','42','迪庆藏族自治州','2','0','','533400');
INSERT INTO `qb_area` VALUES ('328','43','拉萨市','2','0','','540100');
INSERT INTO `qb_area` VALUES ('329','43','日喀则市','2','0','','540200');
INSERT INTO `qb_area` VALUES ('330','43','昌都市','2','0','','540300');
INSERT INTO `qb_area` VALUES ('331','43','林芝市','2','0','','540400');
INSERT INTO `qb_area` VALUES ('332','43','山南市','2','0','','540500');
INSERT INTO `qb_area` VALUES ('333','43','那曲市','2','0','','540600');
INSERT INTO `qb_area` VALUES ('334','43','阿里地区','2','0','','542500');
INSERT INTO `qb_area` VALUES ('335','44','西安市','2','0','','610100');
INSERT INTO `qb_area` VALUES ('336','44','铜川市','2','0','','610200');
INSERT INTO `qb_area` VALUES ('337','44','宝鸡市','2','0','','610300');
INSERT INTO `qb_area` VALUES ('338','44','咸阳市','2','0','','610400');
INSERT INTO `qb_area` VALUES ('339','44','渭南市','2','0','','610500');
INSERT INTO `qb_area` VALUES ('340','44','延安市','2','0','','610600');
INSERT INTO `qb_area` VALUES ('341','44','汉中市','2','0','','610700');
INSERT INTO `qb_area` VALUES ('342','44','榆林市','2','0','','610800');
INSERT INTO `qb_area` VALUES ('343','44','安康市','2','0','','610900');
INSERT INTO `qb_area` VALUES ('344','44','商洛市','2','0','','611000');
INSERT INTO `qb_area` VALUES ('345','45','兰州市','2','0','','620100');
INSERT INTO `qb_area` VALUES ('346','45','嘉峪关市','2','0','','620200');
INSERT INTO `qb_area` VALUES ('347','45','金昌市','2','0','','620300');
INSERT INTO `qb_area` VALUES ('348','45','白银市','2','0','','620400');
INSERT INTO `qb_area` VALUES ('349','45','天水市','2','0','','620500');
INSERT INTO `qb_area` VALUES ('350','45','武威市','2','0','','620600');
INSERT INTO `qb_area` VALUES ('351','45','张掖市','2','0','','620700');
INSERT INTO `qb_area` VALUES ('352','45','平凉市','2','0','','620800');
INSERT INTO `qb_area` VALUES ('353','45','酒泉市','2','0','','620900');
INSERT INTO `qb_area` VALUES ('354','45','庆阳市','2','0','','621000');
INSERT INTO `qb_area` VALUES ('355','45','定西市','2','0','','621100');
INSERT INTO `qb_area` VALUES ('356','45','陇南市','2','0','','621200');
INSERT INTO `qb_area` VALUES ('357','45','临夏回族自治州','2','0','','622900');
INSERT INTO `qb_area` VALUES ('358','45','甘南藏族自治州','2','0','','623000');
INSERT INTO `qb_area` VALUES ('359','46','西宁市','2','0','','630100');
INSERT INTO `qb_area` VALUES ('360','46','海东市','2','0','','630200');
INSERT INTO `qb_area` VALUES ('361','46','海北藏族自治州','2','0','','632200');
INSERT INTO `qb_area` VALUES ('362','46','黄南藏族自治州','2','0','','632300');
INSERT INTO `qb_area` VALUES ('363','46','海南藏族自治州','2','0','','632500');
INSERT INTO `qb_area` VALUES ('364','46','果洛藏族自治州','2','0','','632600');
INSERT INTO `qb_area` VALUES ('365','46','玉树藏族自治州','2','0','','632700');
INSERT INTO `qb_area` VALUES ('366','46','海西蒙古族藏族自治州','2','0','','632800');
INSERT INTO `qb_area` VALUES ('367','47','银川市','2','0','','640100');
INSERT INTO `qb_area` VALUES ('368','47','石嘴山市','2','0','','640200');
INSERT INTO `qb_area` VALUES ('369','47','吴忠市','2','0','','640300');
INSERT INTO `qb_area` VALUES ('370','47','固原市','2','0','','640400');
INSERT INTO `qb_area` VALUES ('371','47','中卫市','2','0','','640500');
INSERT INTO `qb_area` VALUES ('372','48','乌鲁木齐市','2','0','','650100');
INSERT INTO `qb_area` VALUES ('373','48','克拉玛依市','2','0','','650200');
INSERT INTO `qb_area` VALUES ('374','48','吐鲁番市','2','0','','650400');
INSERT INTO `qb_area` VALUES ('375','48','哈密市','2','0','','650500');
INSERT INTO `qb_area` VALUES ('376','48','昌吉回族自治州','2','0','','652300');
INSERT INTO `qb_area` VALUES ('377','48','博尔塔拉蒙古自治州','2','0','','652700');
INSERT INTO `qb_area` VALUES ('378','48','巴音郭楞蒙古自治州','2','0','','652800');
INSERT INTO `qb_area` VALUES ('379','48','阿克苏地区','2','0','','652900');
INSERT INTO `qb_area` VALUES ('380','48','克孜勒苏柯尔克孜自治州','2','0','','653000');
INSERT INTO `qb_area` VALUES ('381','48','喀什地区','2','0','','653100');
INSERT INTO `qb_area` VALUES ('382','48','和田地区','2','0','','653200');
INSERT INTO `qb_area` VALUES ('383','48','伊犁哈萨克自治州','2','0','','654000');
INSERT INTO `qb_area` VALUES ('384','48','塔城地区','2','0','','654200');
INSERT INTO `qb_area` VALUES ('385','48','阿勒泰地区','2','0','','654300');
INSERT INTO `qb_area` VALUES ('386','51','台北市','2','0','','830100');
INSERT INTO `qb_area` VALUES ('387','51','新北市','2','0','','830200');
INSERT INTO `qb_area` VALUES ('388','51','桃园市','2','0','','830300');
INSERT INTO `qb_area` VALUES ('389','51','台中市','2','0','','830400');
INSERT INTO `qb_area` VALUES ('390','51','台南市','2','0','','830500');
INSERT INTO `qb_area` VALUES ('391','51','高雄市','2','0','','830600');
INSERT INTO `qb_area` VALUES ('392','51','基隆市','2','0','','830700');
INSERT INTO `qb_area` VALUES ('393','51','新竹市','2','0','','830800');
INSERT INTO `qb_area` VALUES ('394','51','嘉义市','2','0','','830900');
INSERT INTO `qb_area` VALUES ('395','18','东城区','2','0','','');
INSERT INTO `qb_area` VALUES ('396','18','西城区','2','0','','');
INSERT INTO `qb_area` VALUES ('397','18','朝阳区','2','0','','');
INSERT INTO `qb_area` VALUES ('398','18','丰台区','2','0','','');
INSERT INTO `qb_area` VALUES ('399','18','石景山区','2','0','','');
INSERT INTO `qb_area` VALUES ('400','18','海淀区','2','0','','');
INSERT INTO `qb_area` VALUES ('401','18','门头沟区','2','0','','');
INSERT INTO `qb_area` VALUES ('402','18','房山区','2','0','','');
INSERT INTO `qb_area` VALUES ('403','18','通州区','2','0','','');
INSERT INTO `qb_area` VALUES ('404','18','顺义区','2','0','','');
INSERT INTO `qb_area` VALUES ('405','18','昌平区','2','0','','');
INSERT INTO `qb_area` VALUES ('406','18','大兴区','2','0','','');
INSERT INTO `qb_area` VALUES ('407','18','怀柔区','2','0','','');
INSERT INTO `qb_area` VALUES ('408','18','平谷区','2','0','','');
INSERT INTO `qb_area` VALUES ('409','18','密云区','2','0','','');
INSERT INTO `qb_area` VALUES ('410','18','延庆区','2','0','','');
INSERT INTO `qb_area` VALUES ('411','19','和平区','2','0','','');
INSERT INTO `qb_area` VALUES ('412','19','河东区','2','0','','');
INSERT INTO `qb_area` VALUES ('413','19','河西区','2','0','','');
INSERT INTO `qb_area` VALUES ('414','19','南开区','2','0','','');
INSERT INTO `qb_area` VALUES ('415','19','河北区','2','0','','');
INSERT INTO `qb_area` VALUES ('416','19','红桥区','2','0','','');
INSERT INTO `qb_area` VALUES ('417','19','东丽区','2','0','','');
INSERT INTO `qb_area` VALUES ('418','19','西青区','2','0','','');
INSERT INTO `qb_area` VALUES ('419','19','津南区','2','0','','');
INSERT INTO `qb_area` VALUES ('420','19','北辰区','2','0','','');
INSERT INTO `qb_area` VALUES ('421','19','武清区','2','0','','');
INSERT INTO `qb_area` VALUES ('422','19','宝坻区','2','0','','');
INSERT INTO `qb_area` VALUES ('423','19','滨海新区','2','0','','');
INSERT INTO `qb_area` VALUES ('424','19','宁河区','2','0','','');
INSERT INTO `qb_area` VALUES ('425','19','静海区','2','0','','');
INSERT INTO `qb_area` VALUES ('426','19','蓟州区','2','0','','');
INSERT INTO `qb_area` VALUES ('427','26','黄浦区','2','0','','');
INSERT INTO `qb_area` VALUES ('428','26','徐汇区','2','0','','');
INSERT INTO `qb_area` VALUES ('429','26','长宁区','2','0','','');
INSERT INTO `qb_area` VALUES ('430','26','静安区','2','0','','');
INSERT INTO `qb_area` VALUES ('431','26','普陀区','2','0','','');
INSERT INTO `qb_area` VALUES ('432','26','虹口区','2','0','','');
INSERT INTO `qb_area` VALUES ('433','26','杨浦区','2','0','','');
INSERT INTO `qb_area` VALUES ('434','26','闵行区','2','0','','');
INSERT INTO `qb_area` VALUES ('435','26','宝山区','2','0','','');
INSERT INTO `qb_area` VALUES ('436','26','嘉定区','2','0','','');
INSERT INTO `qb_area` VALUES ('437','26','浦东新区','2','0','','');
INSERT INTO `qb_area` VALUES ('438','26','金山区','2','0','','');
INSERT INTO `qb_area` VALUES ('439','26','松江区','2','0','','');
INSERT INTO `qb_area` VALUES ('440','26','青浦区','2','0','','');
INSERT INTO `qb_area` VALUES ('441','26','奉贤区','2','0','','');
INSERT INTO `qb_area` VALUES ('442','26','崇明区','2','0','','');
INSERT INTO `qb_area` VALUES ('443','39','万州区','2','0','','');
INSERT INTO `qb_area` VALUES ('444','39','涪陵区','2','0','','');
INSERT INTO `qb_area` VALUES ('445','39','渝中区','2','0','','');
INSERT INTO `qb_area` VALUES ('446','39','大渡口区','2','0','','');
INSERT INTO `qb_area` VALUES ('447','39','江北区','2','0','','');
INSERT INTO `qb_area` VALUES ('448','39','沙坪坝区','2','0','','');
INSERT INTO `qb_area` VALUES ('449','39','九龙坡区','2','0','','');
INSERT INTO `qb_area` VALUES ('450','39','南岸区','2','0','','');
INSERT INTO `qb_area` VALUES ('451','39','北碚区','2','0','','');
INSERT INTO `qb_area` VALUES ('452','39','綦江区','2','0','','');
INSERT INTO `qb_area` VALUES ('453','39','大足区','2','0','','');
INSERT INTO `qb_area` VALUES ('454','39','渝北区','2','0','','');
INSERT INTO `qb_area` VALUES ('455','39','巴南区','2','0','','');
INSERT INTO `qb_area` VALUES ('456','39','黔江区','2','0','','');
INSERT INTO `qb_area` VALUES ('457','39','长寿区','2','0','','');
INSERT INTO `qb_area` VALUES ('458','39','江津区','2','0','','');
INSERT INTO `qb_area` VALUES ('459','39','合川区','2','0','','');
INSERT INTO `qb_area` VALUES ('460','39','永川区','2','0','','');
INSERT INTO `qb_area` VALUES ('461','39','南川区','2','0','','');
INSERT INTO `qb_area` VALUES ('462','39','璧山区','2','0','','');
INSERT INTO `qb_area` VALUES ('463','39','铜梁区','2','0','','');
INSERT INTO `qb_area` VALUES ('464','39','潼南区','2','0','','');
INSERT INTO `qb_area` VALUES ('465','39','荣昌区','2','0','','');
INSERT INTO `qb_area` VALUES ('466','39','开州区','2','0','','');
INSERT INTO `qb_area` VALUES ('467','39','梁平区','2','0','','');
INSERT INTO `qb_area` VALUES ('468','39','武隆区','2','0','','');
INSERT INTO `qb_area` VALUES ('469','39','城口县','2','0','','');
INSERT INTO `qb_area` VALUES ('470','39','丰都县','2','0','','');
INSERT INTO `qb_area` VALUES ('471','39','垫江县','2','0','','');
INSERT INTO `qb_area` VALUES ('472','39','忠县','2','0','','');
INSERT INTO `qb_area` VALUES ('473','39','云阳县','2','0','','');
INSERT INTO `qb_area` VALUES ('474','39','奉节县','2','0','','');
INSERT INTO `qb_area` VALUES ('475','39','巫山县','2','0','','');
INSERT INTO `qb_area` VALUES ('476','39','巫溪县','2','0','','');
INSERT INTO `qb_area` VALUES ('477','39','石柱土家族自治县','2','0','','');
INSERT INTO `qb_area` VALUES ('478','39','秀山土家族苗族自治县','2','0','','');
INSERT INTO `qb_area` VALUES ('479','39','酉阳土家族苗族自治县','2','0','','');
INSERT INTO `qb_area` VALUES ('480','39','彭水苗族土家族自治县','2','0','','');
INSERT INTO `qb_area` VALUES ('481','52','长安区','3','0','','130102');
INSERT INTO `qb_area` VALUES ('482','52','桥西区','3','0','','130104');
INSERT INTO `qb_area` VALUES ('483','52','新华区','3','0','','130105');
INSERT INTO `qb_area` VALUES ('484','52','井陉矿区','3','0','','130107');
INSERT INTO `qb_area` VALUES ('485','52','裕华区','3','0','','130108');
INSERT INTO `qb_area` VALUES ('486','52','藁城区','3','0','','130109');
INSERT INTO `qb_area` VALUES ('487','52','鹿泉区','3','0','','130110');
INSERT INTO `qb_area` VALUES ('488','52','栾城区','3','0','','130111');
INSERT INTO `qb_area` VALUES ('489','52','井陉县','3','0','','130121');
INSERT INTO `qb_area` VALUES ('490','52','正定县','3','0','','130123');
INSERT INTO `qb_area` VALUES ('491','52','行唐县','3','0','','130125');
INSERT INTO `qb_area` VALUES ('492','52','灵寿县','3','0','','130126');
INSERT INTO `qb_area` VALUES ('493','52','高邑县','3','0','','130127');
INSERT INTO `qb_area` VALUES ('494','52','深泽县','3','0','','130128');
INSERT INTO `qb_area` VALUES ('495','52','赞皇县','3','0','','130129');
INSERT INTO `qb_area` VALUES ('496','52','无极县','3','0','','130130');
INSERT INTO `qb_area` VALUES ('497','52','平山县','3','0','','130131');
INSERT INTO `qb_area` VALUES ('498','52','元氏县','3','0','','130132');
INSERT INTO `qb_area` VALUES ('499','52','赵县','3','0','','130133');
INSERT INTO `qb_area` VALUES ('500','52','辛集市','3','0','','130181');
INSERT INTO `qb_area` VALUES ('501','52','晋州市','3','0','','130183');
INSERT INTO `qb_area` VALUES ('502','52','新乐市','3','0','','130184');
INSERT INTO `qb_area` VALUES ('503','53','路南区','3','0','','130202');
INSERT INTO `qb_area` VALUES ('504','53','路北区','3','0','','130203');
INSERT INTO `qb_area` VALUES ('505','53','古冶区','3','0','','130204');
INSERT INTO `qb_area` VALUES ('506','53','开平区','3','0','','130205');
INSERT INTO `qb_area` VALUES ('507','53','丰南区','3','0','','130207');
INSERT INTO `qb_area` VALUES ('508','53','丰润区','3','0','','130208');
INSERT INTO `qb_area` VALUES ('509','53','曹妃甸区','3','0','','130209');
INSERT INTO `qb_area` VALUES ('510','53','滦县','3','0','','130223');
INSERT INTO `qb_area` VALUES ('511','53','滦南县','3','0','','130224');
INSERT INTO `qb_area` VALUES ('512','53','乐亭县','3','0','','130225');
INSERT INTO `qb_area` VALUES ('513','53','迁西县','3','0','','130227');
INSERT INTO `qb_area` VALUES ('514','53','玉田县','3','0','','130229');
INSERT INTO `qb_area` VALUES ('515','53','遵化市','3','0','','130281');
INSERT INTO `qb_area` VALUES ('516','53','迁安市','3','0','','130283');
INSERT INTO `qb_area` VALUES ('517','54','海港区','3','0','','130302');
INSERT INTO `qb_area` VALUES ('518','54','山海关区','3','0','','130303');
INSERT INTO `qb_area` VALUES ('519','54','北戴河区','3','0','','130304');
INSERT INTO `qb_area` VALUES ('520','54','抚宁区','3','0','','130306');
INSERT INTO `qb_area` VALUES ('521','54','青龙满族自治县','3','0','','130321');
INSERT INTO `qb_area` VALUES ('522','54','昌黎县','3','0','','130322');
INSERT INTO `qb_area` VALUES ('523','54','卢龙县','3','0','','130324');
INSERT INTO `qb_area` VALUES ('524','55','邯山区','3','0','','130402');
INSERT INTO `qb_area` VALUES ('525','55','丛台区','3','0','','130403');
INSERT INTO `qb_area` VALUES ('526','55','复兴区','3','0','','130404');
INSERT INTO `qb_area` VALUES ('527','55','峰峰矿区','3','0','','130406');
INSERT INTO `qb_area` VALUES ('528','55','肥乡区','3','0','','130407');
INSERT INTO `qb_area` VALUES ('529','55','永年区','3','0','','130408');
INSERT INTO `qb_area` VALUES ('530','55','临漳县','3','0','','130423');
INSERT INTO `qb_area` VALUES ('531','55','成安县','3','0','','130424');
INSERT INTO `qb_area` VALUES ('532','55','大名县','3','0','','130425');
INSERT INTO `qb_area` VALUES ('533','55','涉县','3','0','','130426');
INSERT INTO `qb_area` VALUES ('534','55','磁县','3','0','','130427');
INSERT INTO `qb_area` VALUES ('535','55','邱县','3','0','','130430');
INSERT INTO `qb_area` VALUES ('536','55','鸡泽县','3','0','','130431');
INSERT INTO `qb_area` VALUES ('537','55','广平县','3','0','','130432');
INSERT INTO `qb_area` VALUES ('538','55','馆陶县','3','0','','130433');
INSERT INTO `qb_area` VALUES ('539','55','魏县','3','0','','130434');
INSERT INTO `qb_area` VALUES ('540','55','曲周县','3','0','','130435');
INSERT INTO `qb_area` VALUES ('541','55','武安市','3','0','','130481');
INSERT INTO `qb_area` VALUES ('542','56','桥东区','3','0','','130502');
INSERT INTO `qb_area` VALUES ('543','56','桥西区','3','0','','130503');
INSERT INTO `qb_area` VALUES ('544','56','邢台县','3','0','','130521');
INSERT INTO `qb_area` VALUES ('545','56','临城县','3','0','','130522');
INSERT INTO `qb_area` VALUES ('546','56','内丘县','3','0','','130523');
INSERT INTO `qb_area` VALUES ('547','56','柏乡县','3','0','','130524');
INSERT INTO `qb_area` VALUES ('548','56','隆尧县','3','0','','130525');
INSERT INTO `qb_area` VALUES ('549','56','任县','3','0','','130526');
INSERT INTO `qb_area` VALUES ('550','56','南和县','3','0','','130527');
INSERT INTO `qb_area` VALUES ('551','56','宁晋县','3','0','','130528');
INSERT INTO `qb_area` VALUES ('552','56','巨鹿县','3','0','','130529');
INSERT INTO `qb_area` VALUES ('553','56','新河县','3','0','','130530');
INSERT INTO `qb_area` VALUES ('554','56','广宗县','3','0','','130531');
INSERT INTO `qb_area` VALUES ('555','56','平乡县','3','0','','130532');
INSERT INTO `qb_area` VALUES ('556','56','威县','3','0','','130533');
INSERT INTO `qb_area` VALUES ('557','56','清河县','3','0','','130534');
INSERT INTO `qb_area` VALUES ('558','56','临西县','3','0','','130535');
INSERT INTO `qb_area` VALUES ('559','56','南宫市','3','0','','130581');
INSERT INTO `qb_area` VALUES ('560','56','沙河市','3','0','','130582');
INSERT INTO `qb_area` VALUES ('561','57','竞秀区','3','0','','130602');
INSERT INTO `qb_area` VALUES ('562','57','莲池区','3','0','','130606');
INSERT INTO `qb_area` VALUES ('563','57','满城区','3','0','','130607');
INSERT INTO `qb_area` VALUES ('564','57','清苑区','3','0','','130608');
INSERT INTO `qb_area` VALUES ('565','57','徐水区','3','0','','130609');
INSERT INTO `qb_area` VALUES ('566','57','涞水县','3','0','','130623');
INSERT INTO `qb_area` VALUES ('567','57','阜平县','3','0','','130624');
INSERT INTO `qb_area` VALUES ('568','57','定兴县','3','0','','130626');
INSERT INTO `qb_area` VALUES ('569','57','唐县','3','0','','130627');
INSERT INTO `qb_area` VALUES ('570','57','高阳县','3','0','','130628');
INSERT INTO `qb_area` VALUES ('571','57','容城县','3','0','','130629');
INSERT INTO `qb_area` VALUES ('572','57','涞源县','3','0','','130630');
INSERT INTO `qb_area` VALUES ('573','57','望都县','3','0','','130631');
INSERT INTO `qb_area` VALUES ('574','57','安新县','3','0','','130632');
INSERT INTO `qb_area` VALUES ('575','57','易县','3','0','','130633');
INSERT INTO `qb_area` VALUES ('576','57','曲阳县','3','0','','130634');
INSERT INTO `qb_area` VALUES ('577','57','蠡县','3','0','','130635');
INSERT INTO `qb_area` VALUES ('578','57','顺平县','3','0','','130636');
INSERT INTO `qb_area` VALUES ('579','57','博野县','3','0','','130637');
INSERT INTO `qb_area` VALUES ('580','57','雄县','3','0','','130638');
INSERT INTO `qb_area` VALUES ('581','57','涿州市','3','0','','130681');
INSERT INTO `qb_area` VALUES ('582','57','定州市','3','0','','130682');
INSERT INTO `qb_area` VALUES ('583','57','安国市','3','0','','130683');
INSERT INTO `qb_area` VALUES ('584','57','高碑店市','3','0','','130684');
INSERT INTO `qb_area` VALUES ('585','58','桥东区','3','0','','130702');
INSERT INTO `qb_area` VALUES ('586','58','桥西区','3','0','','130703');
INSERT INTO `qb_area` VALUES ('587','58','宣化区','3','0','','130705');
INSERT INTO `qb_area` VALUES ('588','58','下花园区','3','0','','130706');
INSERT INTO `qb_area` VALUES ('589','58','万全区','3','0','','130708');
INSERT INTO `qb_area` VALUES ('590','58','崇礼区','3','0','','130709');
INSERT INTO `qb_area` VALUES ('591','58','张北县','3','0','','130722');
INSERT INTO `qb_area` VALUES ('592','58','康保县','3','0','','130723');
INSERT INTO `qb_area` VALUES ('593','58','沽源县','3','0','','130724');
INSERT INTO `qb_area` VALUES ('594','58','尚义县','3','0','','130725');
INSERT INTO `qb_area` VALUES ('595','58','蔚县','3','0','','130726');
INSERT INTO `qb_area` VALUES ('596','58','阳原县','3','0','','130727');
INSERT INTO `qb_area` VALUES ('597','58','怀安县','3','0','','130728');
INSERT INTO `qb_area` VALUES ('598','58','怀来县','3','0','','130730');
INSERT INTO `qb_area` VALUES ('599','58','涿鹿县','3','0','','130731');
INSERT INTO `qb_area` VALUES ('600','58','赤城县','3','0','','130732');
INSERT INTO `qb_area` VALUES ('601','59','双桥区','3','0','','130802');
INSERT INTO `qb_area` VALUES ('602','59','双滦区','3','0','','130803');
INSERT INTO `qb_area` VALUES ('603','59','鹰手营子矿区','3','0','','130804');
INSERT INTO `qb_area` VALUES ('604','59','承德县','3','0','','130821');
INSERT INTO `qb_area` VALUES ('605','59','兴隆县','3','0','','130822');
INSERT INTO `qb_area` VALUES ('606','59','滦平县','3','0','','130824');
INSERT INTO `qb_area` VALUES ('607','59','隆化县','3','0','','130825');
INSERT INTO `qb_area` VALUES ('608','59','丰宁满族自治县','3','0','','130826');
INSERT INTO `qb_area` VALUES ('609','59','宽城满族自治县','3','0','','130827');
INSERT INTO `qb_area` VALUES ('610','59','围场满族蒙古族自治县','3','0','','130828');
INSERT INTO `qb_area` VALUES ('611','59','平泉市','3','0','','130881');
INSERT INTO `qb_area` VALUES ('612','60','新华区','3','0','','130902');
INSERT INTO `qb_area` VALUES ('613','60','运河区','3','0','','130903');
INSERT INTO `qb_area` VALUES ('614','60','沧县','3','0','','130921');
INSERT INTO `qb_area` VALUES ('615','60','青县','3','0','','130922');
INSERT INTO `qb_area` VALUES ('616','60','东光县','3','0','','130923');
INSERT INTO `qb_area` VALUES ('617','60','海兴县','3','0','','130924');
INSERT INTO `qb_area` VALUES ('618','60','盐山县','3','0','','130925');
INSERT INTO `qb_area` VALUES ('619','60','肃宁县','3','0','','130926');
INSERT INTO `qb_area` VALUES ('620','60','南皮县','3','0','','130927');
INSERT INTO `qb_area` VALUES ('621','60','吴桥县','3','0','','130928');
INSERT INTO `qb_area` VALUES ('622','60','献县','3','0','','130929');
INSERT INTO `qb_area` VALUES ('623','60','孟村回族自治县','3','0','','130930');
INSERT INTO `qb_area` VALUES ('624','60','泊头市','3','0','','130981');
INSERT INTO `qb_area` VALUES ('625','60','任丘市','3','0','','130982');
INSERT INTO `qb_area` VALUES ('626','60','黄骅市','3','0','','130983');
INSERT INTO `qb_area` VALUES ('627','60','河间市','3','0','','130984');
INSERT INTO `qb_area` VALUES ('628','61','安次区','3','0','','131002');
INSERT INTO `qb_area` VALUES ('629','61','广阳区','3','0','','131003');
INSERT INTO `qb_area` VALUES ('630','61','固安县','3','0','','131022');
INSERT INTO `qb_area` VALUES ('631','61','永清县','3','0','','131023');
INSERT INTO `qb_area` VALUES ('632','61','香河县','3','0','','131024');
INSERT INTO `qb_area` VALUES ('633','61','大城县','3','0','','131025');
INSERT INTO `qb_area` VALUES ('634','61','文安县','3','0','','131026');
INSERT INTO `qb_area` VALUES ('635','61','大厂回族自治县','3','0','','131028');
INSERT INTO `qb_area` VALUES ('636','61','霸州市','3','0','','131081');
INSERT INTO `qb_area` VALUES ('637','61','三河市','3','0','','131082');
INSERT INTO `qb_area` VALUES ('638','62','桃城区','3','0','','131102');
INSERT INTO `qb_area` VALUES ('639','62','冀州区','3','0','','131103');
INSERT INTO `qb_area` VALUES ('640','62','枣强县','3','0','','131121');
INSERT INTO `qb_area` VALUES ('641','62','武邑县','3','0','','131122');
INSERT INTO `qb_area` VALUES ('642','62','武强县','3','0','','131123');
INSERT INTO `qb_area` VALUES ('643','62','饶阳县','3','0','','131124');
INSERT INTO `qb_area` VALUES ('644','62','安平县','3','0','','131125');
INSERT INTO `qb_area` VALUES ('645','62','故城县','3','0','','131126');
INSERT INTO `qb_area` VALUES ('646','62','景县','3','0','','131127');
INSERT INTO `qb_area` VALUES ('647','62','阜城县','3','0','','131128');
INSERT INTO `qb_area` VALUES ('648','62','深州市','3','0','','131182');
INSERT INTO `qb_area` VALUES ('649','63','小店区','3','0','','140105');
INSERT INTO `qb_area` VALUES ('650','63','迎泽区','3','0','','140106');
INSERT INTO `qb_area` VALUES ('651','63','杏花岭区','3','0','','140107');
INSERT INTO `qb_area` VALUES ('652','63','尖草坪区','3','0','','140108');
INSERT INTO `qb_area` VALUES ('653','63','万柏林区','3','0','','140109');
INSERT INTO `qb_area` VALUES ('654','63','晋源区','3','0','','140110');
INSERT INTO `qb_area` VALUES ('655','63','清徐县','3','0','','140121');
INSERT INTO `qb_area` VALUES ('656','63','阳曲县','3','0','','140122');
INSERT INTO `qb_area` VALUES ('657','63','娄烦县','3','0','','140123');
INSERT INTO `qb_area` VALUES ('658','63','古交市','3','0','','140181');
INSERT INTO `qb_area` VALUES ('659','64','新荣区','3','0','','140212');
INSERT INTO `qb_area` VALUES ('660','64','平城区','3','0','','140213');
INSERT INTO `qb_area` VALUES ('661','64','云冈区','3','0','','140214');
INSERT INTO `qb_area` VALUES ('662','64','云州区','3','0','','140215');
INSERT INTO `qb_area` VALUES ('663','64','阳高县','3','0','','140221');
INSERT INTO `qb_area` VALUES ('664','64','天镇县','3','0','','140222');
INSERT INTO `qb_area` VALUES ('665','64','广灵县','3','0','','140223');
INSERT INTO `qb_area` VALUES ('666','64','灵丘县','3','0','','140224');
INSERT INTO `qb_area` VALUES ('667','64','浑源县','3','0','','140225');
INSERT INTO `qb_area` VALUES ('668','64','左云县','3','0','','140226');
INSERT INTO `qb_area` VALUES ('669','65','城区','3','0','','140302');
INSERT INTO `qb_area` VALUES ('670','65','矿区','3','0','','140303');
INSERT INTO `qb_area` VALUES ('671','65','郊区','3','0','','140311');
INSERT INTO `qb_area` VALUES ('672','65','平定县','3','0','','140321');
INSERT INTO `qb_area` VALUES ('673','65','盂县','3','0','','140322');
INSERT INTO `qb_area` VALUES ('674','66','潞州区','3','0','','140402');
INSERT INTO `qb_area` VALUES ('675','66','上党区','3','0','','140421');
INSERT INTO `qb_area` VALUES ('676','66','屯留区','3','0','','140424');
INSERT INTO `qb_area` VALUES ('677','66','潞城区','3','0','','140481');
INSERT INTO `qb_area` VALUES ('678','66','襄垣县','3','0','','140423');
INSERT INTO `qb_area` VALUES ('679','66','平顺县','3','0','','140425');
INSERT INTO `qb_area` VALUES ('680','66','黎城县','3','0','','140426');
INSERT INTO `qb_area` VALUES ('681','66','壶关县','3','0','','140427');
INSERT INTO `qb_area` VALUES ('682','66','长子县','3','0','','140428');
INSERT INTO `qb_area` VALUES ('683','66','武乡县','3','0','','140429');
INSERT INTO `qb_area` VALUES ('684','66','沁县','3','0','','140430');
INSERT INTO `qb_area` VALUES ('685','66','沁源县','3','0','','140431');
INSERT INTO `qb_area` VALUES ('686','67','城区','3','0','','140502');
INSERT INTO `qb_area` VALUES ('687','67','沁水县','3','0','','140521');
INSERT INTO `qb_area` VALUES ('688','67','阳城县','3','0','','140522');
INSERT INTO `qb_area` VALUES ('689','67','陵川县','3','0','','140524');
INSERT INTO `qb_area` VALUES ('690','67','泽州县','3','0','','140525');
INSERT INTO `qb_area` VALUES ('691','67','高平市','3','0','','140581');
INSERT INTO `qb_area` VALUES ('692','68','朔城区','3','0','','140602');
INSERT INTO `qb_area` VALUES ('693','68','平鲁区','3','0','','140603');
INSERT INTO `qb_area` VALUES ('694','68','山阴县','3','0','','140621');
INSERT INTO `qb_area` VALUES ('695','68','应县','3','0','','140622');
INSERT INTO `qb_area` VALUES ('696','68','右玉县','3','0','','140623');
INSERT INTO `qb_area` VALUES ('697','68','怀仁县','3','0','','140624');
INSERT INTO `qb_area` VALUES ('698','69','榆次区','3','0','','140702');
INSERT INTO `qb_area` VALUES ('699','69','榆社县','3','0','','140721');
INSERT INTO `qb_area` VALUES ('700','69','左权县','3','0','','140722');
INSERT INTO `qb_area` VALUES ('701','69','和顺县','3','0','','140723');
INSERT INTO `qb_area` VALUES ('702','69','昔阳县','3','0','','140724');
INSERT INTO `qb_area` VALUES ('703','69','寿阳县','3','0','','140725');
INSERT INTO `qb_area` VALUES ('704','69','太谷县','3','0','','140726');
INSERT INTO `qb_area` VALUES ('705','69','祁县','3','0','','140727');
INSERT INTO `qb_area` VALUES ('706','69','平遥县','3','0','','140728');
INSERT INTO `qb_area` VALUES ('707','69','灵石县','3','0','','140729');
INSERT INTO `qb_area` VALUES ('708','69','介休市','3','0','','140781');
INSERT INTO `qb_area` VALUES ('709','70','盐湖区','3','0','','140802');
INSERT INTO `qb_area` VALUES ('710','70','临猗县','3','0','','140821');
INSERT INTO `qb_area` VALUES ('711','70','万荣县','3','0','','140822');
INSERT INTO `qb_area` VALUES ('712','70','闻喜县','3','0','','140823');
INSERT INTO `qb_area` VALUES ('713','70','稷山县','3','0','','140824');
INSERT INTO `qb_area` VALUES ('714','70','新绛县','3','0','','140825');
INSERT INTO `qb_area` VALUES ('715','70','绛县','3','0','','140826');
INSERT INTO `qb_area` VALUES ('716','70','垣曲县','3','0','','140827');
INSERT INTO `qb_area` VALUES ('717','70','夏县','3','0','','140828');
INSERT INTO `qb_area` VALUES ('718','70','平陆县','3','0','','140829');
INSERT INTO `qb_area` VALUES ('719','70','芮城县','3','0','','140830');
INSERT INTO `qb_area` VALUES ('720','70','永济市','3','0','','140881');
INSERT INTO `qb_area` VALUES ('721','70','河津市','3','0','','140882');
INSERT INTO `qb_area` VALUES ('722','71','忻府区','3','0','','140902');
INSERT INTO `qb_area` VALUES ('723','71','定襄县','3','0','','140921');
INSERT INTO `qb_area` VALUES ('724','71','五台县','3','0','','140922');
INSERT INTO `qb_area` VALUES ('725','71','代县','3','0','','140923');
INSERT INTO `qb_area` VALUES ('726','71','繁峙县','3','0','','140924');
INSERT INTO `qb_area` VALUES ('727','71','宁武县','3','0','','140925');
INSERT INTO `qb_area` VALUES ('728','71','静乐县','3','0','','140926');
INSERT INTO `qb_area` VALUES ('729','71','神池县','3','0','','140927');
INSERT INTO `qb_area` VALUES ('730','71','五寨县','3','0','','140928');
INSERT INTO `qb_area` VALUES ('731','71','岢岚县','3','0','','140929');
INSERT INTO `qb_area` VALUES ('732','71','河曲县','3','0','','140930');
INSERT INTO `qb_area` VALUES ('733','71','保德县','3','0','','140931');
INSERT INTO `qb_area` VALUES ('734','71','偏关县','3','0','','140932');
INSERT INTO `qb_area` VALUES ('735','71','原平市','3','0','','140981');
INSERT INTO `qb_area` VALUES ('736','72','尧都区','3','0','','141002');
INSERT INTO `qb_area` VALUES ('737','72','曲沃县','3','0','','141021');
INSERT INTO `qb_area` VALUES ('738','72','翼城县','3','0','','141022');
INSERT INTO `qb_area` VALUES ('739','72','襄汾县','3','0','','141023');
INSERT INTO `qb_area` VALUES ('740','72','洪洞县','3','0','','141024');
INSERT INTO `qb_area` VALUES ('741','72','古县','3','0','','141025');
INSERT INTO `qb_area` VALUES ('742','72','安泽县','3','0','','141026');
INSERT INTO `qb_area` VALUES ('743','72','浮山县','3','0','','141027');
INSERT INTO `qb_area` VALUES ('744','72','吉县','3','0','','141028');
INSERT INTO `qb_area` VALUES ('745','72','乡宁县','3','0','','141029');
INSERT INTO `qb_area` VALUES ('746','72','大宁县','3','0','','141030');
INSERT INTO `qb_area` VALUES ('747','72','隰县','3','0','','141031');
INSERT INTO `qb_area` VALUES ('748','72','永和县','3','0','','141032');
INSERT INTO `qb_area` VALUES ('749','72','蒲县','3','0','','141033');
INSERT INTO `qb_area` VALUES ('750','72','汾西县','3','0','','141034');
INSERT INTO `qb_area` VALUES ('751','72','侯马市','3','0','','141081');
INSERT INTO `qb_area` VALUES ('752','72','霍州市','3','0','','141082');
INSERT INTO `qb_area` VALUES ('753','73','离石区','3','0','','141102');
INSERT INTO `qb_area` VALUES ('754','73','文水县','3','0','','141121');
INSERT INTO `qb_area` VALUES ('755','73','交城县','3','0','','141122');
INSERT INTO `qb_area` VALUES ('756','73','兴县','3','0','','141123');
INSERT INTO `qb_area` VALUES ('757','73','临县','3','0','','141124');
INSERT INTO `qb_area` VALUES ('758','73','柳林县','3','0','','141125');
INSERT INTO `qb_area` VALUES ('759','73','石楼县','3','0','','141126');
INSERT INTO `qb_area` VALUES ('760','73','岚县','3','0','','141127');
INSERT INTO `qb_area` VALUES ('761','73','方山县','3','0','','141128');
INSERT INTO `qb_area` VALUES ('762','73','中阳县','3','0','','141129');
INSERT INTO `qb_area` VALUES ('763','73','交口县','3','0','','141130');
INSERT INTO `qb_area` VALUES ('764','73','孝义市','3','0','','141181');
INSERT INTO `qb_area` VALUES ('765','73','汾阳市','3','0','','141182');
INSERT INTO `qb_area` VALUES ('766','74','新城区','3','0','','150102');
INSERT INTO `qb_area` VALUES ('767','74','回民区','3','0','','150103');
INSERT INTO `qb_area` VALUES ('768','74','玉泉区','3','0','','150104');
INSERT INTO `qb_area` VALUES ('769','74','赛罕区','3','0','','150105');
INSERT INTO `qb_area` VALUES ('770','74','土默特左旗','3','0','','150121');
INSERT INTO `qb_area` VALUES ('771','74','托克托县','3','0','','150122');
INSERT INTO `qb_area` VALUES ('772','74','和林格尔县','3','0','','150123');
INSERT INTO `qb_area` VALUES ('773','74','清水河县','3','0','','150124');
INSERT INTO `qb_area` VALUES ('774','74','武川县','3','0','','150125');
INSERT INTO `qb_area` VALUES ('775','75','东河区','3','0','','150202');
INSERT INTO `qb_area` VALUES ('776','75','昆都仑区','3','0','','150203');
INSERT INTO `qb_area` VALUES ('777','75','青山区','3','0','','150204');
INSERT INTO `qb_area` VALUES ('778','75','石拐区','3','0','','150205');
INSERT INTO `qb_area` VALUES ('779','75','白云鄂博矿区','3','0','','150206');
INSERT INTO `qb_area` VALUES ('780','75','九原区','3','0','','150207');
INSERT INTO `qb_area` VALUES ('781','75','土默特右旗','3','0','','150221');
INSERT INTO `qb_area` VALUES ('782','75','固阳县','3','0','','150222');
INSERT INTO `qb_area` VALUES ('783','75','达尔罕茂明安联合旗','3','0','','150223');
INSERT INTO `qb_area` VALUES ('784','76','海勃湾区','3','0','','150302');
INSERT INTO `qb_area` VALUES ('785','76','海南区','3','0','','150303');
INSERT INTO `qb_area` VALUES ('786','76','乌达区','3','0','','150304');
INSERT INTO `qb_area` VALUES ('787','77','红山区','3','0','','150402');
INSERT INTO `qb_area` VALUES ('788','77','元宝山区','3','0','','150403');
INSERT INTO `qb_area` VALUES ('789','77','松山区','3','0','','150404');
INSERT INTO `qb_area` VALUES ('790','77','阿鲁科尔沁旗','3','0','','150421');
INSERT INTO `qb_area` VALUES ('791','77','巴林左旗','3','0','','150422');
INSERT INTO `qb_area` VALUES ('792','77','巴林右旗','3','0','','150423');
INSERT INTO `qb_area` VALUES ('793','77','林西县','3','0','','150424');
INSERT INTO `qb_area` VALUES ('794','77','克什克腾旗','3','0','','150425');
INSERT INTO `qb_area` VALUES ('795','77','翁牛特旗','3','0','','150426');
INSERT INTO `qb_area` VALUES ('796','77','喀喇沁旗','3','0','','150428');
INSERT INTO `qb_area` VALUES ('797','77','宁城县','3','0','','150429');
INSERT INTO `qb_area` VALUES ('798','77','敖汉旗','3','0','','150430');
INSERT INTO `qb_area` VALUES ('799','78','科尔沁区','3','0','','150502');
INSERT INTO `qb_area` VALUES ('800','78','科尔沁左翼中旗','3','0','','150521');
INSERT INTO `qb_area` VALUES ('801','78','科尔沁左翼后旗','3','0','','150522');
INSERT INTO `qb_area` VALUES ('802','78','开鲁县','3','0','','150523');
INSERT INTO `qb_area` VALUES ('803','78','库伦旗','3','0','','150524');
INSERT INTO `qb_area` VALUES ('804','78','奈曼旗','3','0','','150525');
INSERT INTO `qb_area` VALUES ('805','78','扎鲁特旗','3','0','','150526');
INSERT INTO `qb_area` VALUES ('806','78','霍林郭勒市','3','0','','150581');
INSERT INTO `qb_area` VALUES ('807','79','东胜区','3','0','','150602');
INSERT INTO `qb_area` VALUES ('808','79','康巴什区','3','0','','150603');
INSERT INTO `qb_area` VALUES ('809','79','达拉特旗','3','0','','150621');
INSERT INTO `qb_area` VALUES ('810','79','准格尔旗','3','0','','150622');
INSERT INTO `qb_area` VALUES ('811','79','鄂托克前旗','3','0','','150623');
INSERT INTO `qb_area` VALUES ('812','79','鄂托克旗','3','0','','150624');
INSERT INTO `qb_area` VALUES ('813','79','杭锦旗','3','0','','150625');
INSERT INTO `qb_area` VALUES ('814','79','乌审旗','3','0','','150626');
INSERT INTO `qb_area` VALUES ('815','79','伊金霍洛旗','3','0','','150627');
INSERT INTO `qb_area` VALUES ('816','80','海拉尔区','3','0','','150702');
INSERT INTO `qb_area` VALUES ('817','80','扎赉诺尔区','3','0','','150703');
INSERT INTO `qb_area` VALUES ('818','80','阿荣旗','3','0','','150721');
INSERT INTO `qb_area` VALUES ('819','80','莫力达瓦达斡尔族自治旗','3','0','','150722');
INSERT INTO `qb_area` VALUES ('820','80','鄂伦春自治旗','3','0','','150723');
INSERT INTO `qb_area` VALUES ('821','80','鄂温克族自治旗','3','0','','150724');
INSERT INTO `qb_area` VALUES ('822','80','陈巴尔虎旗','3','0','','150725');
INSERT INTO `qb_area` VALUES ('823','80','新巴尔虎左旗','3','0','','150726');
INSERT INTO `qb_area` VALUES ('824','80','新巴尔虎右旗','3','0','','150727');
INSERT INTO `qb_area` VALUES ('825','80','满洲里市','3','0','','150781');
INSERT INTO `qb_area` VALUES ('826','80','牙克石市','3','0','','150782');
INSERT INTO `qb_area` VALUES ('827','80','扎兰屯市','3','0','','150783');
INSERT INTO `qb_area` VALUES ('828','80','额尔古纳市','3','0','','150784');
INSERT INTO `qb_area` VALUES ('829','80','根河市','3','0','','150785');
INSERT INTO `qb_area` VALUES ('830','81','临河区','3','0','','150802');
INSERT INTO `qb_area` VALUES ('831','81','五原县','3','0','','150821');
INSERT INTO `qb_area` VALUES ('832','81','磴口县','3','0','','150822');
INSERT INTO `qb_area` VALUES ('833','81','乌拉特前旗','3','0','','150823');
INSERT INTO `qb_area` VALUES ('834','81','乌拉特中旗','3','0','','150824');
INSERT INTO `qb_area` VALUES ('835','81','乌拉特后旗','3','0','','150825');
INSERT INTO `qb_area` VALUES ('836','81','杭锦后旗','3','0','','150826');
INSERT INTO `qb_area` VALUES ('837','82','集宁区','3','0','','150902');
INSERT INTO `qb_area` VALUES ('838','82','卓资县','3','0','','150921');
INSERT INTO `qb_area` VALUES ('839','82','化德县','3','0','','150922');
INSERT INTO `qb_area` VALUES ('840','82','商都县','3','0','','150923');
INSERT INTO `qb_area` VALUES ('841','82','兴和县','3','0','','150924');
INSERT INTO `qb_area` VALUES ('842','82','凉城县','3','0','','150925');
INSERT INTO `qb_area` VALUES ('843','82','察哈尔右翼前旗','3','0','','150926');
INSERT INTO `qb_area` VALUES ('844','82','察哈尔右翼中旗','3','0','','150927');
INSERT INTO `qb_area` VALUES ('845','82','察哈尔右翼后旗','3','0','','150928');
INSERT INTO `qb_area` VALUES ('846','82','四子王旗','3','0','','150929');
INSERT INTO `qb_area` VALUES ('847','82','丰镇市','3','0','','150981');
INSERT INTO `qb_area` VALUES ('848','83','乌兰浩特市','3','0','','152201');
INSERT INTO `qb_area` VALUES ('849','83','阿尔山市','3','0','','152202');
INSERT INTO `qb_area` VALUES ('850','83','科尔沁右翼前旗','3','0','','152221');
INSERT INTO `qb_area` VALUES ('851','83','科尔沁右翼中旗','3','0','','152222');
INSERT INTO `qb_area` VALUES ('852','83','扎赉特旗','3','0','','152223');
INSERT INTO `qb_area` VALUES ('853','83','突泉县','3','0','','152224');
INSERT INTO `qb_area` VALUES ('854','84','二连浩特市','3','0','','152501');
INSERT INTO `qb_area` VALUES ('855','84','锡林浩特市','3','0','','152502');
INSERT INTO `qb_area` VALUES ('856','84','阿巴嘎旗','3','0','','152522');
INSERT INTO `qb_area` VALUES ('857','84','苏尼特左旗','3','0','','152523');
INSERT INTO `qb_area` VALUES ('858','84','苏尼特右旗','3','0','','152524');
INSERT INTO `qb_area` VALUES ('859','84','东乌珠穆沁旗','3','0','','152525');
INSERT INTO `qb_area` VALUES ('860','84','西乌珠穆沁旗','3','0','','152526');
INSERT INTO `qb_area` VALUES ('861','84','太仆寺旗','3','0','','152527');
INSERT INTO `qb_area` VALUES ('862','84','镶黄旗','3','0','','152528');
INSERT INTO `qb_area` VALUES ('863','84','正镶白旗','3','0','','152529');
INSERT INTO `qb_area` VALUES ('864','84','正蓝旗','3','0','','152530');
INSERT INTO `qb_area` VALUES ('865','84','多伦县','3','0','','152531');
INSERT INTO `qb_area` VALUES ('866','85','阿拉善左旗','3','0','','152921');
INSERT INTO `qb_area` VALUES ('867','85','阿拉善右旗','3','0','','152922');
INSERT INTO `qb_area` VALUES ('868','85','额济纳旗','3','0','','152923');
INSERT INTO `qb_area` VALUES ('869','86','和平区','3','0','','210102');
INSERT INTO `qb_area` VALUES ('870','86','沈河区','3','0','','210103');
INSERT INTO `qb_area` VALUES ('871','86','大东区','3','0','','210104');
INSERT INTO `qb_area` VALUES ('872','86','皇姑区','3','0','','210105');
INSERT INTO `qb_area` VALUES ('873','86','铁西区','3','0','','210106');
INSERT INTO `qb_area` VALUES ('874','86','苏家屯区','3','0','','210111');
INSERT INTO `qb_area` VALUES ('875','86','浑南区','3','0','','210112');
INSERT INTO `qb_area` VALUES ('876','86','沈北新区','3','0','','210113');
INSERT INTO `qb_area` VALUES ('877','86','于洪区','3','0','','210114');
INSERT INTO `qb_area` VALUES ('878','86','辽中区','3','0','','210115');
INSERT INTO `qb_area` VALUES ('879','86','康平县','3','0','','210123');
INSERT INTO `qb_area` VALUES ('880','86','法库县','3','0','','210124');
INSERT INTO `qb_area` VALUES ('881','86','新民市','3','0','','210181');
INSERT INTO `qb_area` VALUES ('882','87','中山区','3','0','','210202');
INSERT INTO `qb_area` VALUES ('883','87','西岗区','3','0','','210203');
INSERT INTO `qb_area` VALUES ('884','87','沙河口区','3','0','','210204');
INSERT INTO `qb_area` VALUES ('885','87','甘井子区','3','0','','210211');
INSERT INTO `qb_area` VALUES ('886','87','旅顺口区','3','0','','210212');
INSERT INTO `qb_area` VALUES ('887','87','金州区','3','0','','210213');
INSERT INTO `qb_area` VALUES ('888','87','普兰店区','3','0','','210214');
INSERT INTO `qb_area` VALUES ('889','87','长海县','3','0','','210224');
INSERT INTO `qb_area` VALUES ('890','87','瓦房店市','3','0','','210281');
INSERT INTO `qb_area` VALUES ('891','87','庄河市','3','0','','210283');
INSERT INTO `qb_area` VALUES ('892','88','铁东区','3','0','','210302');
INSERT INTO `qb_area` VALUES ('893','88','铁西区','3','0','','210303');
INSERT INTO `qb_area` VALUES ('894','88','立山区','3','0','','210304');
INSERT INTO `qb_area` VALUES ('895','88','千山区','3','0','','210311');
INSERT INTO `qb_area` VALUES ('896','88','台安县','3','0','','210321');
INSERT INTO `qb_area` VALUES ('897','88','岫岩满族自治县','3','0','','210323');
INSERT INTO `qb_area` VALUES ('898','88','海城市','3','0','','210381');
INSERT INTO `qb_area` VALUES ('899','89','新抚区','3','0','','210402');
INSERT INTO `qb_area` VALUES ('900','89','东洲区','3','0','','210403');
INSERT INTO `qb_area` VALUES ('901','89','望花区','3','0','','210404');
INSERT INTO `qb_area` VALUES ('902','89','顺城区','3','0','','210411');
INSERT INTO `qb_area` VALUES ('903','89','抚顺县','3','0','','210421');
INSERT INTO `qb_area` VALUES ('904','89','新宾满族自治县','3','0','','210422');
INSERT INTO `qb_area` VALUES ('905','89','清原满族自治县','3','0','','210423');
INSERT INTO `qb_area` VALUES ('906','90','平山区','3','0','','210502');
INSERT INTO `qb_area` VALUES ('907','90','溪湖区','3','0','','210503');
INSERT INTO `qb_area` VALUES ('908','90','明山区','3','0','','210504');
INSERT INTO `qb_area` VALUES ('909','90','南芬区','3','0','','210505');
INSERT INTO `qb_area` VALUES ('910','90','本溪满族自治县','3','0','','210521');
INSERT INTO `qb_area` VALUES ('911','90','桓仁满族自治县','3','0','','210522');
INSERT INTO `qb_area` VALUES ('912','91','元宝区','3','0','','210602');
INSERT INTO `qb_area` VALUES ('913','91','振兴区','3','0','','210603');
INSERT INTO `qb_area` VALUES ('914','91','振安区','3','0','','210604');
INSERT INTO `qb_area` VALUES ('915','91','宽甸满族自治县','3','0','','210624');
INSERT INTO `qb_area` VALUES ('916','91','东港市','3','0','','210681');
INSERT INTO `qb_area` VALUES ('917','91','凤城市','3','0','','210682');
INSERT INTO `qb_area` VALUES ('918','92','古塔区','3','0','','210702');
INSERT INTO `qb_area` VALUES ('919','92','凌河区','3','0','','210703');
INSERT INTO `qb_area` VALUES ('920','92','太和区','3','0','','210711');
INSERT INTO `qb_area` VALUES ('921','92','黑山县','3','0','','210726');
INSERT INTO `qb_area` VALUES ('922','92','义县','3','0','','210727');
INSERT INTO `qb_area` VALUES ('923','92','凌海市','3','0','','210781');
INSERT INTO `qb_area` VALUES ('924','92','北镇市','3','0','','210782');
INSERT INTO `qb_area` VALUES ('925','93','站前区','3','0','','210802');
INSERT INTO `qb_area` VALUES ('926','93','西市区','3','0','','210803');
INSERT INTO `qb_area` VALUES ('927','93','鲅鱼圈区','3','0','','210804');
INSERT INTO `qb_area` VALUES ('928','93','老边区','3','0','','210811');
INSERT INTO `qb_area` VALUES ('929','93','盖州市','3','0','','210881');
INSERT INTO `qb_area` VALUES ('930','93','大石桥市','3','0','','210882');
INSERT INTO `qb_area` VALUES ('931','94','海州区','3','0','','210902');
INSERT INTO `qb_area` VALUES ('932','94','新邱区','3','0','','210903');
INSERT INTO `qb_area` VALUES ('933','94','太平区','3','0','','210904');
INSERT INTO `qb_area` VALUES ('934','94','清河门区','3','0','','210905');
INSERT INTO `qb_area` VALUES ('935','94','细河区','3','0','','210911');
INSERT INTO `qb_area` VALUES ('936','94','阜新蒙古族自治县','3','0','','210921');
INSERT INTO `qb_area` VALUES ('937','94','彰武县','3','0','','210922');
INSERT INTO `qb_area` VALUES ('938','95','白塔区','3','0','','211002');
INSERT INTO `qb_area` VALUES ('939','95','文圣区','3','0','','211003');
INSERT INTO `qb_area` VALUES ('940','95','宏伟区','3','0','','211004');
INSERT INTO `qb_area` VALUES ('941','95','弓长岭区','3','0','','211005');
INSERT INTO `qb_area` VALUES ('942','95','太子河区','3','0','','211011');
INSERT INTO `qb_area` VALUES ('943','95','辽阳县','3','0','','211021');
INSERT INTO `qb_area` VALUES ('944','95','灯塔市','3','0','','211081');
INSERT INTO `qb_area` VALUES ('945','96','双台子区','3','0','','211102');
INSERT INTO `qb_area` VALUES ('946','96','兴隆台区','3','0','','211103');
INSERT INTO `qb_area` VALUES ('947','96','大洼区','3','0','','211104');
INSERT INTO `qb_area` VALUES ('948','96','盘山县','3','0','','211122');
INSERT INTO `qb_area` VALUES ('949','97','银州区','3','0','','211202');
INSERT INTO `qb_area` VALUES ('950','97','清河区','3','0','','211204');
INSERT INTO `qb_area` VALUES ('951','97','铁岭县','3','0','','211221');
INSERT INTO `qb_area` VALUES ('952','97','西丰县','3','0','','211223');
INSERT INTO `qb_area` VALUES ('953','97','昌图县','3','0','','211224');
INSERT INTO `qb_area` VALUES ('954','97','调兵山市','3','0','','211281');
INSERT INTO `qb_area` VALUES ('955','97','开原市','3','0','','211282');
INSERT INTO `qb_area` VALUES ('956','98','双塔区','3','0','','211302');
INSERT INTO `qb_area` VALUES ('957','98','龙城区','3','0','','211303');
INSERT INTO `qb_area` VALUES ('958','98','朝阳县','3','0','','211321');
INSERT INTO `qb_area` VALUES ('959','98','建平县','3','0','','211322');
INSERT INTO `qb_area` VALUES ('960','98','喀喇沁左翼蒙古族自治县','3','0','','211324');
INSERT INTO `qb_area` VALUES ('961','98','北票市','3','0','','211381');
INSERT INTO `qb_area` VALUES ('962','98','凌源市','3','0','','211382');
INSERT INTO `qb_area` VALUES ('963','99','连山区','3','0','','211402');
INSERT INTO `qb_area` VALUES ('964','99','龙港区','3','0','','211403');
INSERT INTO `qb_area` VALUES ('965','99','南票区','3','0','','211404');
INSERT INTO `qb_area` VALUES ('966','99','绥中县','3','0','','211421');
INSERT INTO `qb_area` VALUES ('967','99','建昌县','3','0','','211422');
INSERT INTO `qb_area` VALUES ('968','99','兴城市','3','0','','211481');
INSERT INTO `qb_area` VALUES ('969','100','南关区','3','0','','220102');
INSERT INTO `qb_area` VALUES ('970','100','宽城区','3','0','','220103');
INSERT INTO `qb_area` VALUES ('971','100','朝阳区','3','0','','220104');
INSERT INTO `qb_area` VALUES ('972','100','二道区','3','0','','220105');
INSERT INTO `qb_area` VALUES ('973','100','绿园区','3','0','','220106');
INSERT INTO `qb_area` VALUES ('974','100','双阳区','3','0','','220112');
INSERT INTO `qb_area` VALUES ('975','100','九台区','3','0','','220113');
INSERT INTO `qb_area` VALUES ('976','100','农安县','3','0','','220122');
INSERT INTO `qb_area` VALUES ('977','100','榆树市','3','0','','220182');
INSERT INTO `qb_area` VALUES ('978','100','德惠市','3','0','','220183');
INSERT INTO `qb_area` VALUES ('979','101','昌邑区','3','0','','220202');
INSERT INTO `qb_area` VALUES ('980','101','龙潭区','3','0','','220203');
INSERT INTO `qb_area` VALUES ('981','101','船营区','3','0','','220204');
INSERT INTO `qb_area` VALUES ('982','101','丰满区','3','0','','220211');
INSERT INTO `qb_area` VALUES ('983','101','永吉县','3','0','','220221');
INSERT INTO `qb_area` VALUES ('984','101','蛟河市','3','0','','220281');
INSERT INTO `qb_area` VALUES ('985','101','桦甸市','3','0','','220282');
INSERT INTO `qb_area` VALUES ('986','101','舒兰市','3','0','','220283');
INSERT INTO `qb_area` VALUES ('987','101','磐石市','3','0','','220284');
INSERT INTO `qb_area` VALUES ('988','102','铁西区','3','0','','220302');
INSERT INTO `qb_area` VALUES ('989','102','铁东区','3','0','','220303');
INSERT INTO `qb_area` VALUES ('990','102','梨树县','3','0','','220322');
INSERT INTO `qb_area` VALUES ('991','102','伊通满族自治县','3','0','','220323');
INSERT INTO `qb_area` VALUES ('992','102','公主岭市','3','0','','220381');
INSERT INTO `qb_area` VALUES ('993','102','双辽市','3','0','','220382');
INSERT INTO `qb_area` VALUES ('994','103','龙山区','3','0','','220402');
INSERT INTO `qb_area` VALUES ('995','103','西安区','3','0','','220403');
INSERT INTO `qb_area` VALUES ('996','103','东丰县','3','0','','220421');
INSERT INTO `qb_area` VALUES ('997','103','东辽县','3','0','','220422');
INSERT INTO `qb_area` VALUES ('998','104','东昌区','3','0','','220502');
INSERT INTO `qb_area` VALUES ('999','104','二道江区','3','0','','220503');
INSERT INTO `qb_area` VALUES ('1000','104','通化县','3','0','','220521');
INSERT INTO `qb_area` VALUES ('1001','104','辉南县','3','0','','220523');
INSERT INTO `qb_area` VALUES ('1002','104','柳河县','3','0','','220524');
INSERT INTO `qb_area` VALUES ('1003','104','梅河口市','3','0','','220581');
INSERT INTO `qb_area` VALUES ('1004','104','集安市','3','0','','220582');
INSERT INTO `qb_area` VALUES ('1005','105','浑江区','3','0','','220602');
INSERT INTO `qb_area` VALUES ('1006','105','江源区','3','0','','220605');
INSERT INTO `qb_area` VALUES ('1007','105','抚松县','3','0','','220621');
INSERT INTO `qb_area` VALUES ('1008','105','靖宇县','3','0','','220622');
INSERT INTO `qb_area` VALUES ('1009','105','长白朝鲜族自治县','3','0','','220623');
INSERT INTO `qb_area` VALUES ('1010','105','临江市','3','0','','220681');
INSERT INTO `qb_area` VALUES ('1011','106','宁江区','3','0','','220702');
INSERT INTO `qb_area` VALUES ('1012','106','前郭尔罗斯蒙古族自治县','3','0','','220721');
INSERT INTO `qb_area` VALUES ('1013','106','长岭县','3','0','','220722');
INSERT INTO `qb_area` VALUES ('1014','106','乾安县','3','0','','220723');
INSERT INTO `qb_area` VALUES ('1015','106','扶余市','3','0','','220781');
INSERT INTO `qb_area` VALUES ('1016','107','洮北区','3','0','','220802');
INSERT INTO `qb_area` VALUES ('1017','107','镇赉县','3','0','','220821');
INSERT INTO `qb_area` VALUES ('1018','107','通榆县','3','0','','220822');
INSERT INTO `qb_area` VALUES ('1019','107','洮南市','3','0','','220881');
INSERT INTO `qb_area` VALUES ('1020','107','大安市','3','0','','220882');
INSERT INTO `qb_area` VALUES ('1021','108','延吉市','3','0','','222401');
INSERT INTO `qb_area` VALUES ('1022','108','图们市','3','0','','222402');
INSERT INTO `qb_area` VALUES ('1023','108','敦化市','3','0','','222403');
INSERT INTO `qb_area` VALUES ('1024','108','珲春市','3','0','','222404');
INSERT INTO `qb_area` VALUES ('1025','108','龙井市','3','0','','222405');
INSERT INTO `qb_area` VALUES ('1026','108','和龙市','3','0','','222406');
INSERT INTO `qb_area` VALUES ('1027','108','汪清县','3','0','','222424');
INSERT INTO `qb_area` VALUES ('1028','108','安图县','3','0','','222426');
INSERT INTO `qb_area` VALUES ('1029','109','道里区','3','0','','230102');
INSERT INTO `qb_area` VALUES ('1030','109','南岗区','3','0','','230103');
INSERT INTO `qb_area` VALUES ('1031','109','道外区','3','0','','230104');
INSERT INTO `qb_area` VALUES ('1032','109','平房区','3','0','','230108');
INSERT INTO `qb_area` VALUES ('1033','109','松北区','3','0','','230109');
INSERT INTO `qb_area` VALUES ('1034','109','香坊区','3','0','','230110');
INSERT INTO `qb_area` VALUES ('1035','109','呼兰区','3','0','','230111');
INSERT INTO `qb_area` VALUES ('1036','109','阿城区','3','0','','230112');
INSERT INTO `qb_area` VALUES ('1037','109','双城区','3','0','','230113');
INSERT INTO `qb_area` VALUES ('1038','109','依兰县','3','0','','230123');
INSERT INTO `qb_area` VALUES ('1039','109','方正县','3','0','','230124');
INSERT INTO `qb_area` VALUES ('1040','109','宾县','3','0','','230125');
INSERT INTO `qb_area` VALUES ('1041','109','巴彦县','3','0','','230126');
INSERT INTO `qb_area` VALUES ('1042','109','木兰县','3','0','','230127');
INSERT INTO `qb_area` VALUES ('1043','109','通河县','3','0','','230128');
INSERT INTO `qb_area` VALUES ('1044','109','延寿县','3','0','','230129');
INSERT INTO `qb_area` VALUES ('1045','109','尚志市','3','0','','230183');
INSERT INTO `qb_area` VALUES ('1046','109','五常市','3','0','','230184');
INSERT INTO `qb_area` VALUES ('1047','110','龙沙区','3','0','','230202');
INSERT INTO `qb_area` VALUES ('1048','110','建华区','3','0','','230203');
INSERT INTO `qb_area` VALUES ('1049','110','铁锋区','3','0','','230204');
INSERT INTO `qb_area` VALUES ('1050','110','昂昂溪区','3','0','','230205');
INSERT INTO `qb_area` VALUES ('1051','110','富拉尔基区','3','0','','230206');
INSERT INTO `qb_area` VALUES ('1052','110','碾子山区','3','0','','230207');
INSERT INTO `qb_area` VALUES ('1053','110','梅里斯达斡尔族区','3','0','','230208');
INSERT INTO `qb_area` VALUES ('1054','110','龙江县','3','0','','230221');
INSERT INTO `qb_area` VALUES ('1055','110','依安县','3','0','','230223');
INSERT INTO `qb_area` VALUES ('1056','110','泰来县','3','0','','230224');
INSERT INTO `qb_area` VALUES ('1057','110','甘南县','3','0','','230225');
INSERT INTO `qb_area` VALUES ('1058','110','富裕县','3','0','','230227');
INSERT INTO `qb_area` VALUES ('1059','110','克山县','3','0','','230229');
INSERT INTO `qb_area` VALUES ('1060','110','克东县','3','0','','230230');
INSERT INTO `qb_area` VALUES ('1061','110','拜泉县','3','0','','230231');
INSERT INTO `qb_area` VALUES ('1062','110','讷河市','3','0','','230281');
INSERT INTO `qb_area` VALUES ('1063','111','鸡冠区','3','0','','230302');
INSERT INTO `qb_area` VALUES ('1064','111','恒山区','3','0','','230303');
INSERT INTO `qb_area` VALUES ('1065','111','滴道区','3','0','','230304');
INSERT INTO `qb_area` VALUES ('1066','111','梨树区','3','0','','230305');
INSERT INTO `qb_area` VALUES ('1067','111','城子河区','3','0','','230306');
INSERT INTO `qb_area` VALUES ('1068','111','麻山区','3','0','','230307');
INSERT INTO `qb_area` VALUES ('1069','111','鸡东县','3','0','','230321');
INSERT INTO `qb_area` VALUES ('1070','111','虎林市','3','0','','230381');
INSERT INTO `qb_area` VALUES ('1071','111','密山市','3','0','','230382');
INSERT INTO `qb_area` VALUES ('1072','112','向阳区','3','0','','230402');
INSERT INTO `qb_area` VALUES ('1073','112','工农区','3','0','','230403');
INSERT INTO `qb_area` VALUES ('1074','112','南山区','3','0','','230404');
INSERT INTO `qb_area` VALUES ('1075','112','兴安区','3','0','','230405');
INSERT INTO `qb_area` VALUES ('1076','112','东山区','3','0','','230406');
INSERT INTO `qb_area` VALUES ('1077','112','兴山区','3','0','','230407');
INSERT INTO `qb_area` VALUES ('1078','112','萝北县','3','0','','230421');
INSERT INTO `qb_area` VALUES ('1079','112','绥滨县','3','0','','230422');
INSERT INTO `qb_area` VALUES ('1080','113','尖山区','3','0','','230502');
INSERT INTO `qb_area` VALUES ('1081','113','岭东区','3','0','','230503');
INSERT INTO `qb_area` VALUES ('1082','113','四方台区','3','0','','230505');
INSERT INTO `qb_area` VALUES ('1083','113','宝山区','3','0','','230506');
INSERT INTO `qb_area` VALUES ('1084','113','集贤县','3','0','','230521');
INSERT INTO `qb_area` VALUES ('1085','113','友谊县','3','0','','230522');
INSERT INTO `qb_area` VALUES ('1086','113','宝清县','3','0','','230523');
INSERT INTO `qb_area` VALUES ('1087','113','饶河县','3','0','','230524');
INSERT INTO `qb_area` VALUES ('1088','114','萨尔图区','3','0','','230602');
INSERT INTO `qb_area` VALUES ('1089','114','龙凤区','3','0','','230603');
INSERT INTO `qb_area` VALUES ('1090','114','让胡路区','3','0','','230604');
INSERT INTO `qb_area` VALUES ('1091','114','红岗区','3','0','','230605');
INSERT INTO `qb_area` VALUES ('1092','114','大同区','3','0','','230606');
INSERT INTO `qb_area` VALUES ('1093','114','肇州县','3','0','','230621');
INSERT INTO `qb_area` VALUES ('1094','114','肇源县','3','0','','230622');
INSERT INTO `qb_area` VALUES ('1095','114','林甸县','3','0','','230623');
INSERT INTO `qb_area` VALUES ('1096','114','杜尔伯特蒙古族自治县','3','0','','230624');
INSERT INTO `qb_area` VALUES ('1097','115','伊春区','3','0','','230702');
INSERT INTO `qb_area` VALUES ('1098','115','南岔区','3','0','','230703');
INSERT INTO `qb_area` VALUES ('1099','115','友好区','3','0','','230704');
INSERT INTO `qb_area` VALUES ('1100','115','西林区','3','0','','230705');
INSERT INTO `qb_area` VALUES ('1101','115','翠峦区','3','0','','230706');
INSERT INTO `qb_area` VALUES ('1102','115','新青区','3','0','','230707');
INSERT INTO `qb_area` VALUES ('1103','115','美溪区','3','0','','230708');
INSERT INTO `qb_area` VALUES ('1104','115','金山屯区','3','0','','230709');
INSERT INTO `qb_area` VALUES ('1105','115','五营区','3','0','','230710');
INSERT INTO `qb_area` VALUES ('1106','115','乌马河区','3','0','','230711');
INSERT INTO `qb_area` VALUES ('1107','115','汤旺河区','3','0','','230712');
INSERT INTO `qb_area` VALUES ('1108','115','带岭区','3','0','','230713');
INSERT INTO `qb_area` VALUES ('1109','115','乌伊岭区','3','0','','230714');
INSERT INTO `qb_area` VALUES ('1110','115','红星区','3','0','','230715');
INSERT INTO `qb_area` VALUES ('1111','115','上甘岭区','3','0','','230716');
INSERT INTO `qb_area` VALUES ('1112','115','嘉荫县','3','0','','230722');
INSERT INTO `qb_area` VALUES ('1113','115','铁力市','3','0','','230781');
INSERT INTO `qb_area` VALUES ('1114','116','向阳区','3','0','','230803');
INSERT INTO `qb_area` VALUES ('1115','116','前进区','3','0','','230804');
INSERT INTO `qb_area` VALUES ('1116','116','东风区','3','0','','230805');
INSERT INTO `qb_area` VALUES ('1117','116','郊区','3','0','','230811');
INSERT INTO `qb_area` VALUES ('1118','116','桦南县','3','0','','230822');
INSERT INTO `qb_area` VALUES ('1119','116','桦川县','3','0','','230826');
INSERT INTO `qb_area` VALUES ('1120','116','汤原县','3','0','','230828');
INSERT INTO `qb_area` VALUES ('1121','116','同江市','3','0','','230881');
INSERT INTO `qb_area` VALUES ('1122','116','富锦市','3','0','','230882');
INSERT INTO `qb_area` VALUES ('1123','116','抚远市','3','0','','230883');
INSERT INTO `qb_area` VALUES ('1124','117','新兴区','3','0','','230902');
INSERT INTO `qb_area` VALUES ('1125','117','桃山区','3','0','','230903');
INSERT INTO `qb_area` VALUES ('1126','117','茄子河区','3','0','','230904');
INSERT INTO `qb_area` VALUES ('1127','117','勃利县','3','0','','230921');
INSERT INTO `qb_area` VALUES ('1128','118','东安区','3','0','','231002');
INSERT INTO `qb_area` VALUES ('1129','118','阳明区','3','0','','231003');
INSERT INTO `qb_area` VALUES ('1130','118','爱民区','3','0','','231004');
INSERT INTO `qb_area` VALUES ('1131','118','西安区','3','0','','231005');
INSERT INTO `qb_area` VALUES ('1132','118','林口县','3','0','','231025');
INSERT INTO `qb_area` VALUES ('1133','118','绥芬河市','3','0','','231081');
INSERT INTO `qb_area` VALUES ('1134','118','海林市','3','0','','231083');
INSERT INTO `qb_area` VALUES ('1135','118','宁安市','3','0','','231084');
INSERT INTO `qb_area` VALUES ('1136','118','穆棱市','3','0','','231085');
INSERT INTO `qb_area` VALUES ('1137','118','东宁市','3','0','','231086');
INSERT INTO `qb_area` VALUES ('1138','119','爱辉区','3','0','','231102');
INSERT INTO `qb_area` VALUES ('1139','119','嫩江县','3','0','','231121');
INSERT INTO `qb_area` VALUES ('1140','119','逊克县','3','0','','231123');
INSERT INTO `qb_area` VALUES ('1141','119','孙吴县','3','0','','231124');
INSERT INTO `qb_area` VALUES ('1142','119','北安市','3','0','','231181');
INSERT INTO `qb_area` VALUES ('1143','119','五大连池市','3','0','','231182');
INSERT INTO `qb_area` VALUES ('1144','120','北林区','3','0','','231202');
INSERT INTO `qb_area` VALUES ('1145','120','望奎县','3','0','','231221');
INSERT INTO `qb_area` VALUES ('1146','120','兰西县','3','0','','231222');
INSERT INTO `qb_area` VALUES ('1147','120','青冈县','3','0','','231223');
INSERT INTO `qb_area` VALUES ('1148','120','庆安县','3','0','','231224');
INSERT INTO `qb_area` VALUES ('1149','120','明水县','3','0','','231225');
INSERT INTO `qb_area` VALUES ('1150','120','绥棱县','3','0','','231226');
INSERT INTO `qb_area` VALUES ('1151','120','安达市','3','0','','231281');
INSERT INTO `qb_area` VALUES ('1152','120','肇东市','3','0','','231282');
INSERT INTO `qb_area` VALUES ('1153','120','海伦市','3','0','','231283');
INSERT INTO `qb_area` VALUES ('1154','121','呼玛县','3','0','','232721');
INSERT INTO `qb_area` VALUES ('1155','121','塔河县','3','0','','232722');
INSERT INTO `qb_area` VALUES ('1156','121','漠河市','3','0','','232723');
INSERT INTO `qb_area` VALUES ('1157','122','玄武区','3','0','','320102');
INSERT INTO `qb_area` VALUES ('1158','122','秦淮区','3','0','','320104');
INSERT INTO `qb_area` VALUES ('1159','122','建邺区','3','0','','320105');
INSERT INTO `qb_area` VALUES ('1160','122','鼓楼区','3','0','','320106');
INSERT INTO `qb_area` VALUES ('1161','122','浦口区','3','0','','320111');
INSERT INTO `qb_area` VALUES ('1162','122','栖霞区','3','0','','320113');
INSERT INTO `qb_area` VALUES ('1163','122','雨花台区','3','0','','320114');
INSERT INTO `qb_area` VALUES ('1164','122','江宁区','3','0','','320115');
INSERT INTO `qb_area` VALUES ('1165','122','六合区','3','0','','320116');
INSERT INTO `qb_area` VALUES ('1166','122','溧水区','3','0','','320117');
INSERT INTO `qb_area` VALUES ('1167','122','高淳区','3','0','','320118');
INSERT INTO `qb_area` VALUES ('1168','123','锡山区','3','0','','320205');
INSERT INTO `qb_area` VALUES ('1169','123','惠山区','3','0','','320206');
INSERT INTO `qb_area` VALUES ('1170','123','滨湖区','3','0','','320211');
INSERT INTO `qb_area` VALUES ('1171','123','梁溪区','3','0','','320213');
INSERT INTO `qb_area` VALUES ('1172','123','新吴区','3','0','','320214');
INSERT INTO `qb_area` VALUES ('1173','123','江阴市','3','0','','320281');
INSERT INTO `qb_area` VALUES ('1174','123','宜兴市','3','0','','320282');
INSERT INTO `qb_area` VALUES ('1175','124','鼓楼区','3','0','','320302');
INSERT INTO `qb_area` VALUES ('1176','124','云龙区','3','0','','320303');
INSERT INTO `qb_area` VALUES ('1177','124','贾汪区','3','0','','320305');
INSERT INTO `qb_area` VALUES ('1178','124','泉山区','3','0','','320311');
INSERT INTO `qb_area` VALUES ('1179','124','铜山区','3','0','','320312');
INSERT INTO `qb_area` VALUES ('1180','124','丰县','3','0','','320321');
INSERT INTO `qb_area` VALUES ('1181','124','沛县','3','0','','320322');
INSERT INTO `qb_area` VALUES ('1182','124','睢宁县','3','0','','320324');
INSERT INTO `qb_area` VALUES ('1183','124','新沂市','3','0','','320381');
INSERT INTO `qb_area` VALUES ('1184','124','邳州市','3','0','','320382');
INSERT INTO `qb_area` VALUES ('1185','125','天宁区','3','0','','320402');
INSERT INTO `qb_area` VALUES ('1186','125','钟楼区','3','0','','320404');
INSERT INTO `qb_area` VALUES ('1187','125','新北区','3','0','','320411');
INSERT INTO `qb_area` VALUES ('1188','125','武进区','3','0','','320412');
INSERT INTO `qb_area` VALUES ('1189','125','金坛区','3','0','','320413');
INSERT INTO `qb_area` VALUES ('1190','125','溧阳市','3','0','','320481');
INSERT INTO `qb_area` VALUES ('1191','126','虎丘区','3','0','','320505');
INSERT INTO `qb_area` VALUES ('1192','126','吴中区','3','0','','320506');
INSERT INTO `qb_area` VALUES ('1193','126','相城区','3','0','','320507');
INSERT INTO `qb_area` VALUES ('1194','126','姑苏区','3','0','','320508');
INSERT INTO `qb_area` VALUES ('1195','126','吴江区','3','0','','320509');
INSERT INTO `qb_area` VALUES ('1196','126','常熟市','3','0','','320581');
INSERT INTO `qb_area` VALUES ('1197','126','张家港市','3','0','','320582');
INSERT INTO `qb_area` VALUES ('1198','126','昆山市','3','0','','320583');
INSERT INTO `qb_area` VALUES ('1199','126','太仓市','3','0','','320585');
INSERT INTO `qb_area` VALUES ('1200','127','崇川区','3','0','','320602');
INSERT INTO `qb_area` VALUES ('1201','127','港闸区','3','0','','320611');
INSERT INTO `qb_area` VALUES ('1202','127','通州区','3','0','','320612');
INSERT INTO `qb_area` VALUES ('1203','127','海安市','3','0','','320621');
INSERT INTO `qb_area` VALUES ('1204','127','如东县','3','0','','320623');
INSERT INTO `qb_area` VALUES ('1205','127','启东市','3','0','','320681');
INSERT INTO `qb_area` VALUES ('1206','127','如皋市','3','0','','320682');
INSERT INTO `qb_area` VALUES ('1207','127','海门市','3','0','','320684');
INSERT INTO `qb_area` VALUES ('1208','128','连云区','3','0','','320703');
INSERT INTO `qb_area` VALUES ('1209','128','海州区','3','0','','320706');
INSERT INTO `qb_area` VALUES ('1210','128','赣榆区','3','0','','320707');
INSERT INTO `qb_area` VALUES ('1211','128','东海县','3','0','','320722');
INSERT INTO `qb_area` VALUES ('1212','128','灌云县','3','0','','320723');
INSERT INTO `qb_area` VALUES ('1213','128','灌南县','3','0','','320724');
INSERT INTO `qb_area` VALUES ('1214','129','淮安区','3','0','','320803');
INSERT INTO `qb_area` VALUES ('1215','129','淮阴区','3','0','','320804');
INSERT INTO `qb_area` VALUES ('1216','129','清江浦区','3','0','','320812');
INSERT INTO `qb_area` VALUES ('1217','129','洪泽区','3','0','','320813');
INSERT INTO `qb_area` VALUES ('1218','129','涟水县','3','0','','320826');
INSERT INTO `qb_area` VALUES ('1219','129','盱眙县','3','0','','320830');
INSERT INTO `qb_area` VALUES ('1220','129','金湖县','3','0','','320831');
INSERT INTO `qb_area` VALUES ('1221','130','亭湖区','3','0','','320902');
INSERT INTO `qb_area` VALUES ('1222','130','盐都区','3','0','','320903');
INSERT INTO `qb_area` VALUES ('1223','130','大丰区','3','0','','320904');
INSERT INTO `qb_area` VALUES ('1224','130','响水县','3','0','','320921');
INSERT INTO `qb_area` VALUES ('1225','130','滨海县','3','0','','320922');
INSERT INTO `qb_area` VALUES ('1226','130','阜宁县','3','0','','320923');
INSERT INTO `qb_area` VALUES ('1227','130','射阳县','3','0','','320924');
INSERT INTO `qb_area` VALUES ('1228','130','建湖县','3','0','','320925');
INSERT INTO `qb_area` VALUES ('1229','130','东台市','3','0','','320981');
INSERT INTO `qb_area` VALUES ('1230','131','广陵区','3','0','','321002');
INSERT INTO `qb_area` VALUES ('1231','131','邗江区','3','0','','321003');
INSERT INTO `qb_area` VALUES ('1232','131','江都区','3','0','','321012');
INSERT INTO `qb_area` VALUES ('1233','131','宝应县','3','0','','321023');
INSERT INTO `qb_area` VALUES ('1234','131','仪征市','3','0','','321081');
INSERT INTO `qb_area` VALUES ('1235','131','高邮市','3','0','','321084');
INSERT INTO `qb_area` VALUES ('1236','132','京口区','3','0','','321102');
INSERT INTO `qb_area` VALUES ('1237','132','润州区','3','0','','321111');
INSERT INTO `qb_area` VALUES ('1238','132','丹徒区','3','0','','321112');
INSERT INTO `qb_area` VALUES ('1239','132','丹阳市','3','0','','321181');
INSERT INTO `qb_area` VALUES ('1240','132','扬中市','3','0','','321182');
INSERT INTO `qb_area` VALUES ('1241','132','句容市','3','0','','321183');
INSERT INTO `qb_area` VALUES ('1242','133','海陵区','3','0','','321202');
INSERT INTO `qb_area` VALUES ('1243','133','高港区','3','0','','321203');
INSERT INTO `qb_area` VALUES ('1244','133','姜堰区','3','0','','321204');
INSERT INTO `qb_area` VALUES ('1245','133','兴化市','3','0','','321281');
INSERT INTO `qb_area` VALUES ('1246','133','靖江市','3','0','','321282');
INSERT INTO `qb_area` VALUES ('1247','133','泰兴市','3','0','','321283');
INSERT INTO `qb_area` VALUES ('1248','134','宿城区','3','0','','321302');
INSERT INTO `qb_area` VALUES ('1249','134','宿豫区','3','0','','321311');
INSERT INTO `qb_area` VALUES ('1250','134','沭阳县','3','0','','321322');
INSERT INTO `qb_area` VALUES ('1251','134','泗阳县','3','0','','321323');
INSERT INTO `qb_area` VALUES ('1252','134','泗洪县','3','0','','321324');
INSERT INTO `qb_area` VALUES ('1253','135','上城区','3','0','','330102');
INSERT INTO `qb_area` VALUES ('1254','135','下城区','3','0','','330103');
INSERT INTO `qb_area` VALUES ('1255','135','江干区','3','0','','330104');
INSERT INTO `qb_area` VALUES ('1256','135','拱墅区','3','0','','330105');
INSERT INTO `qb_area` VALUES ('1257','135','西湖区','3','0','','330106');
INSERT INTO `qb_area` VALUES ('1258','135','滨江区','3','0','','330108');
INSERT INTO `qb_area` VALUES ('1259','135','萧山区','3','0','','330109');
INSERT INTO `qb_area` VALUES ('1260','135','余杭区','3','0','','330110');
INSERT INTO `qb_area` VALUES ('1261','135','富阳区','3','0','','330111');
INSERT INTO `qb_area` VALUES ('1262','135','临安区','3','0','','330112');
INSERT INTO `qb_area` VALUES ('1263','135','桐庐县','3','0','','330122');
INSERT INTO `qb_area` VALUES ('1264','135','淳安县','3','0','','330127');
INSERT INTO `qb_area` VALUES ('1265','135','建德市','3','0','','330182');
INSERT INTO `qb_area` VALUES ('1266','136','海曙区','3','0','','330203');
INSERT INTO `qb_area` VALUES ('1267','136','江北区','3','0','','330205');
INSERT INTO `qb_area` VALUES ('1268','136','北仑区','3','0','','330206');
INSERT INTO `qb_area` VALUES ('1269','136','镇海区','3','0','','330211');
INSERT INTO `qb_area` VALUES ('1270','136','鄞州区','3','0','','330212');
INSERT INTO `qb_area` VALUES ('1271','136','奉化区','3','0','','330213');
INSERT INTO `qb_area` VALUES ('1272','136','象山县','3','0','','330225');
INSERT INTO `qb_area` VALUES ('1273','136','宁海县','3','0','','330226');
INSERT INTO `qb_area` VALUES ('1274','136','余姚市','3','0','','330281');
INSERT INTO `qb_area` VALUES ('1275','136','慈溪市','3','0','','330282');
INSERT INTO `qb_area` VALUES ('1276','137','鹿城区','3','0','','330302');
INSERT INTO `qb_area` VALUES ('1277','137','龙湾区','3','0','','330303');
INSERT INTO `qb_area` VALUES ('1278','137','瓯海区','3','0','','330304');
INSERT INTO `qb_area` VALUES ('1279','137','洞头区','3','0','','330305');
INSERT INTO `qb_area` VALUES ('1280','137','永嘉县','3','0','','330324');
INSERT INTO `qb_area` VALUES ('1281','137','平阳县','3','0','','330326');
INSERT INTO `qb_area` VALUES ('1282','137','苍南县','3','0','','330327');
INSERT INTO `qb_area` VALUES ('1283','137','文成县','3','0','','330328');
INSERT INTO `qb_area` VALUES ('1284','137','泰顺县','3','0','','330329');
INSERT INTO `qb_area` VALUES ('1285','137','瑞安市','3','0','','330381');
INSERT INTO `qb_area` VALUES ('1286','137','乐清市','3','0','','330382');
INSERT INTO `qb_area` VALUES ('1287','138','南湖区','3','0','','330402');
INSERT INTO `qb_area` VALUES ('1288','138','秀洲区','3','0','','330411');
INSERT INTO `qb_area` VALUES ('1289','138','嘉善县','3','0','','330421');
INSERT INTO `qb_area` VALUES ('1290','138','海盐县','3','0','','330424');
INSERT INTO `qb_area` VALUES ('1291','138','海宁市','3','0','','330481');
INSERT INTO `qb_area` VALUES ('1292','138','平湖市','3','0','','330482');
INSERT INTO `qb_area` VALUES ('1293','138','桐乡市','3','0','','330483');
INSERT INTO `qb_area` VALUES ('1294','139','吴兴区','3','0','','330502');
INSERT INTO `qb_area` VALUES ('1295','139','南浔区','3','0','','330503');
INSERT INTO `qb_area` VALUES ('1296','139','德清县','3','0','','330521');
INSERT INTO `qb_area` VALUES ('1297','139','长兴县','3','0','','330522');
INSERT INTO `qb_area` VALUES ('1298','139','安吉县','3','0','','330523');
INSERT INTO `qb_area` VALUES ('1299','140','越城区','3','0','','330602');
INSERT INTO `qb_area` VALUES ('1300','140','柯桥区','3','0','','330603');
INSERT INTO `qb_area` VALUES ('1301','140','上虞区','3','0','','330604');
INSERT INTO `qb_area` VALUES ('1302','140','新昌县','3','0','','330624');
INSERT INTO `qb_area` VALUES ('1303','140','诸暨市','3','0','','330681');
INSERT INTO `qb_area` VALUES ('1304','140','嵊州市','3','0','','330683');
INSERT INTO `qb_area` VALUES ('1305','141','婺城区','3','0','','330702');
INSERT INTO `qb_area` VALUES ('1306','141','金东区','3','0','','330703');
INSERT INTO `qb_area` VALUES ('1307','141','武义县','3','0','','330723');
INSERT INTO `qb_area` VALUES ('1308','141','浦江县','3','0','','330726');
INSERT INTO `qb_area` VALUES ('1309','141','磐安县','3','0','','330727');
INSERT INTO `qb_area` VALUES ('1310','141','兰溪市','3','0','','330781');
INSERT INTO `qb_area` VALUES ('1311','141','义乌市','3','0','','330782');
INSERT INTO `qb_area` VALUES ('1312','141','东阳市','3','0','','330783');
INSERT INTO `qb_area` VALUES ('1313','141','永康市','3','0','','330784');
INSERT INTO `qb_area` VALUES ('1314','142','柯城区','3','0','','330802');
INSERT INTO `qb_area` VALUES ('1315','142','衢江区','3','0','','330803');
INSERT INTO `qb_area` VALUES ('1316','142','常山县','3','0','','330822');
INSERT INTO `qb_area` VALUES ('1317','142','开化县','3','0','','330824');
INSERT INTO `qb_area` VALUES ('1318','142','龙游县','3','0','','330825');
INSERT INTO `qb_area` VALUES ('1319','142','江山市','3','0','','330881');
INSERT INTO `qb_area` VALUES ('1320','143','定海区','3','0','','330902');
INSERT INTO `qb_area` VALUES ('1321','143','普陀区','3','0','','330903');
INSERT INTO `qb_area` VALUES ('1322','143','岱山县','3','0','','330921');
INSERT INTO `qb_area` VALUES ('1323','143','嵊泗县','3','0','','330922');
INSERT INTO `qb_area` VALUES ('1324','144','椒江区','3','0','','331002');
INSERT INTO `qb_area` VALUES ('1325','144','黄岩区','3','0','','331003');
INSERT INTO `qb_area` VALUES ('1326','144','路桥区','3','0','','331004');
INSERT INTO `qb_area` VALUES ('1327','144','三门县','3','0','','331022');
INSERT INTO `qb_area` VALUES ('1328','144','天台县','3','0','','331023');
INSERT INTO `qb_area` VALUES ('1329','144','仙居县','3','0','','331024');
INSERT INTO `qb_area` VALUES ('1330','144','温岭市','3','0','','331081');
INSERT INTO `qb_area` VALUES ('1331','144','临海市','3','0','','331082');
INSERT INTO `qb_area` VALUES ('1332','144','玉环市','3','0','','331083');
INSERT INTO `qb_area` VALUES ('1333','145','莲都区','3','0','','331102');
INSERT INTO `qb_area` VALUES ('1334','145','青田县','3','0','','331121');
INSERT INTO `qb_area` VALUES ('1335','145','缙云县','3','0','','331122');
INSERT INTO `qb_area` VALUES ('1336','145','遂昌县','3','0','','331123');
INSERT INTO `qb_area` VALUES ('1337','145','松阳县','3','0','','331124');
INSERT INTO `qb_area` VALUES ('1338','145','云和县','3','0','','331125');
INSERT INTO `qb_area` VALUES ('1339','145','庆元县','3','0','','331126');
INSERT INTO `qb_area` VALUES ('1340','145','景宁畲族自治县','3','0','','331127');
INSERT INTO `qb_area` VALUES ('1341','145','龙泉市','3','0','','331181');
INSERT INTO `qb_area` VALUES ('1342','146','瑶海区','3','0','','340102');
INSERT INTO `qb_area` VALUES ('1343','146','庐阳区','3','0','','340103');
INSERT INTO `qb_area` VALUES ('1344','146','蜀山区','3','0','','340104');
INSERT INTO `qb_area` VALUES ('1345','146','包河区','3','0','','340111');
INSERT INTO `qb_area` VALUES ('1346','146','长丰县','3','0','','340121');
INSERT INTO `qb_area` VALUES ('1347','146','肥东县','3','0','','340122');
INSERT INTO `qb_area` VALUES ('1348','146','肥西县','3','0','','340123');
INSERT INTO `qb_area` VALUES ('1349','146','庐江县','3','0','','340124');
INSERT INTO `qb_area` VALUES ('1350','146','巢湖市','3','0','','340181');
INSERT INTO `qb_area` VALUES ('1351','147','镜湖区','3','0','','340202');
INSERT INTO `qb_area` VALUES ('1352','147','弋江区','3','0','','340203');
INSERT INTO `qb_area` VALUES ('1353','147','鸠江区','3','0','','340207');
INSERT INTO `qb_area` VALUES ('1354','147','三山区','3','0','','340208');
INSERT INTO `qb_area` VALUES ('1355','147','芜湖县','3','0','','340221');
INSERT INTO `qb_area` VALUES ('1356','147','繁昌县','3','0','','340222');
INSERT INTO `qb_area` VALUES ('1357','147','南陵县','3','0','','340223');
INSERT INTO `qb_area` VALUES ('1358','147','无为县','3','0','','340225');
INSERT INTO `qb_area` VALUES ('1359','148','龙子湖区','3','0','','340302');
INSERT INTO `qb_area` VALUES ('1360','148','蚌山区','3','0','','340303');
INSERT INTO `qb_area` VALUES ('1361','148','禹会区','3','0','','340304');
INSERT INTO `qb_area` VALUES ('1362','148','淮上区','3','0','','340311');
INSERT INTO `qb_area` VALUES ('1363','148','怀远县','3','0','','340321');
INSERT INTO `qb_area` VALUES ('1364','148','五河县','3','0','','340322');
INSERT INTO `qb_area` VALUES ('1365','148','固镇县','3','0','','340323');
INSERT INTO `qb_area` VALUES ('1366','149','大通区','3','0','','340402');
INSERT INTO `qb_area` VALUES ('1367','149','田家庵区','3','0','','340403');
INSERT INTO `qb_area` VALUES ('1368','149','谢家集区','3','0','','340404');
INSERT INTO `qb_area` VALUES ('1369','149','八公山区','3','0','','340405');
INSERT INTO `qb_area` VALUES ('1370','149','潘集区','3','0','','340406');
INSERT INTO `qb_area` VALUES ('1371','149','凤台县','3','0','','340421');
INSERT INTO `qb_area` VALUES ('1372','149','寿县','3','0','','340422');
INSERT INTO `qb_area` VALUES ('1373','150','花山区','3','0','','340503');
INSERT INTO `qb_area` VALUES ('1374','150','雨山区','3','0','','340504');
INSERT INTO `qb_area` VALUES ('1375','150','博望区','3','0','','340506');
INSERT INTO `qb_area` VALUES ('1376','150','当涂县','3','0','','340521');
INSERT INTO `qb_area` VALUES ('1377','150','含山县','3','0','','340522');
INSERT INTO `qb_area` VALUES ('1378','150','和县','3','0','','340523');
INSERT INTO `qb_area` VALUES ('1379','151','杜集区','3','0','','340602');
INSERT INTO `qb_area` VALUES ('1380','151','相山区','3','0','','340603');
INSERT INTO `qb_area` VALUES ('1381','151','烈山区','3','0','','340604');
INSERT INTO `qb_area` VALUES ('1382','151','濉溪县','3','0','','340621');
INSERT INTO `qb_area` VALUES ('1383','152','铜官区','3','0','','340705');
INSERT INTO `qb_area` VALUES ('1384','152','义安区','3','0','','340706');
INSERT INTO `qb_area` VALUES ('1385','152','郊区','3','0','','340711');
INSERT INTO `qb_area` VALUES ('1386','152','枞阳县','3','0','','340722');
INSERT INTO `qb_area` VALUES ('1387','153','迎江区','3','0','','340802');
INSERT INTO `qb_area` VALUES ('1388','153','大观区','3','0','','340803');
INSERT INTO `qb_area` VALUES ('1389','153','宜秀区','3','0','','340811');
INSERT INTO `qb_area` VALUES ('1390','153','怀宁县','3','0','','340822');
INSERT INTO `qb_area` VALUES ('1391','153','潜山市','3','0','','340824');
INSERT INTO `qb_area` VALUES ('1392','153','太湖县','3','0','','340825');
INSERT INTO `qb_area` VALUES ('1393','153','宿松县','3','0','','340826');
INSERT INTO `qb_area` VALUES ('1394','153','望江县','3','0','','340827');
INSERT INTO `qb_area` VALUES ('1395','153','岳西县','3','0','','340828');
INSERT INTO `qb_area` VALUES ('1396','153','桐城市','3','0','','340881');
INSERT INTO `qb_area` VALUES ('1397','154','屯溪区','3','0','','341002');
INSERT INTO `qb_area` VALUES ('1398','154','黄山区','3','0','','341003');
INSERT INTO `qb_area` VALUES ('1399','154','徽州区','3','0','','341004');
INSERT INTO `qb_area` VALUES ('1400','154','歙县','3','0','','341021');
INSERT INTO `qb_area` VALUES ('1401','154','休宁县','3','0','','341022');
INSERT INTO `qb_area` VALUES ('1402','154','黟县','3','0','','341023');
INSERT INTO `qb_area` VALUES ('1403','154','祁门县','3','0','','341024');
INSERT INTO `qb_area` VALUES ('1404','155','琅琊区','3','0','','341102');
INSERT INTO `qb_area` VALUES ('1405','155','南谯区','3','0','','341103');
INSERT INTO `qb_area` VALUES ('1406','155','来安县','3','0','','341122');
INSERT INTO `qb_area` VALUES ('1407','155','全椒县','3','0','','341124');
INSERT INTO `qb_area` VALUES ('1408','155','定远县','3','0','','341125');
INSERT INTO `qb_area` VALUES ('1409','155','凤阳县','3','0','','341126');
INSERT INTO `qb_area` VALUES ('1410','155','天长市','3','0','','341181');
INSERT INTO `qb_area` VALUES ('1411','155','明光市','3','0','','341182');
INSERT INTO `qb_area` VALUES ('1412','156','颍州区','3','0','','341202');
INSERT INTO `qb_area` VALUES ('1413','156','颍东区','3','0','','341203');
INSERT INTO `qb_area` VALUES ('1414','156','颍泉区','3','0','','341204');
INSERT INTO `qb_area` VALUES ('1415','156','临泉县','3','0','','341221');
INSERT INTO `qb_area` VALUES ('1416','156','太和县','3','0','','341222');
INSERT INTO `qb_area` VALUES ('1417','156','阜南县','3','0','','341225');
INSERT INTO `qb_area` VALUES ('1418','156','颍上县','3','0','','341226');
INSERT INTO `qb_area` VALUES ('1419','156','界首市','3','0','','341282');
INSERT INTO `qb_area` VALUES ('1420','157','埇桥区','3','0','','341302');
INSERT INTO `qb_area` VALUES ('1421','157','砀山县','3','0','','341321');
INSERT INTO `qb_area` VALUES ('1422','157','萧县','3','0','','341322');
INSERT INTO `qb_area` VALUES ('1423','157','灵璧县','3','0','','341323');
INSERT INTO `qb_area` VALUES ('1424','157','泗县','3','0','','341324');
INSERT INTO `qb_area` VALUES ('1425','158','金安区','3','0','','341502');
INSERT INTO `qb_area` VALUES ('1426','158','裕安区','3','0','','341503');
INSERT INTO `qb_area` VALUES ('1427','158','叶集区','3','0','','341504');
INSERT INTO `qb_area` VALUES ('1428','158','霍邱县','3','0','','341522');
INSERT INTO `qb_area` VALUES ('1429','158','舒城县','3','0','','341523');
INSERT INTO `qb_area` VALUES ('1430','158','金寨县','3','0','','341524');
INSERT INTO `qb_area` VALUES ('1431','158','霍山县','3','0','','341525');
INSERT INTO `qb_area` VALUES ('1432','159','谯城区','3','0','','341602');
INSERT INTO `qb_area` VALUES ('1433','159','涡阳县','3','0','','341621');
INSERT INTO `qb_area` VALUES ('1434','159','蒙城县','3','0','','341622');
INSERT INTO `qb_area` VALUES ('1435','159','利辛县','3','0','','341623');
INSERT INTO `qb_area` VALUES ('1436','160','贵池区','3','0','','341702');
INSERT INTO `qb_area` VALUES ('1437','160','东至县','3','0','','341721');
INSERT INTO `qb_area` VALUES ('1438','160','石台县','3','0','','341722');
INSERT INTO `qb_area` VALUES ('1439','160','青阳县','3','0','','341723');
INSERT INTO `qb_area` VALUES ('1440','161','宣州区','3','0','','341802');
INSERT INTO `qb_area` VALUES ('1441','161','郎溪县','3','0','','341821');
INSERT INTO `qb_area` VALUES ('1442','161','广德县','3','0','','341822');
INSERT INTO `qb_area` VALUES ('1443','161','泾县','3','0','','341823');
INSERT INTO `qb_area` VALUES ('1444','161','绩溪县','3','0','','341824');
INSERT INTO `qb_area` VALUES ('1445','161','旌德县','3','0','','341825');
INSERT INTO `qb_area` VALUES ('1446','161','宁国市','3','0','','341881');
INSERT INTO `qb_area` VALUES ('1447','162','鼓楼区','3','0','','350102');
INSERT INTO `qb_area` VALUES ('1448','162','台江区','3','0','','350103');
INSERT INTO `qb_area` VALUES ('1449','162','仓山区','3','0','','350104');
INSERT INTO `qb_area` VALUES ('1450','162','马尾区','3','0','','350105');
INSERT INTO `qb_area` VALUES ('1451','162','晋安区','3','0','','350111');
INSERT INTO `qb_area` VALUES ('1452','162','长乐区','3','0','','350112');
INSERT INTO `qb_area` VALUES ('1453','162','闽侯县','3','0','','350121');
INSERT INTO `qb_area` VALUES ('1454','162','连江县','3','0','','350122');
INSERT INTO `qb_area` VALUES ('1455','162','罗源县','3','0','','350123');
INSERT INTO `qb_area` VALUES ('1456','162','闽清县','3','0','','350124');
INSERT INTO `qb_area` VALUES ('1457','162','永泰县','3','0','','350125');
INSERT INTO `qb_area` VALUES ('1458','162','平潭县','3','0','','350128');
INSERT INTO `qb_area` VALUES ('1459','162','福清市','3','0','','350181');
INSERT INTO `qb_area` VALUES ('1460','163','思明区','3','0','','350203');
INSERT INTO `qb_area` VALUES ('1461','163','海沧区','3','0','','350205');
INSERT INTO `qb_area` VALUES ('1462','163','湖里区','3','0','','350206');
INSERT INTO `qb_area` VALUES ('1463','163','集美区','3','0','','350211');
INSERT INTO `qb_area` VALUES ('1464','163','同安区','3','0','','350212');
INSERT INTO `qb_area` VALUES ('1465','163','翔安区','3','0','','350213');
INSERT INTO `qb_area` VALUES ('1466','164','城厢区','3','0','','350302');
INSERT INTO `qb_area` VALUES ('1467','164','涵江区','3','0','','350303');
INSERT INTO `qb_area` VALUES ('1468','164','荔城区','3','0','','350304');
INSERT INTO `qb_area` VALUES ('1469','164','秀屿区','3','0','','350305');
INSERT INTO `qb_area` VALUES ('1470','164','仙游县','3','0','','350322');
INSERT INTO `qb_area` VALUES ('1471','165','梅列区','3','0','','350402');
INSERT INTO `qb_area` VALUES ('1472','165','三元区','3','0','','350403');
INSERT INTO `qb_area` VALUES ('1473','165','明溪县','3','0','','350421');
INSERT INTO `qb_area` VALUES ('1474','165','清流县','3','0','','350423');
INSERT INTO `qb_area` VALUES ('1475','165','宁化县','3','0','','350424');
INSERT INTO `qb_area` VALUES ('1476','165','大田县','3','0','','350425');
INSERT INTO `qb_area` VALUES ('1477','165','尤溪县','3','0','','350426');
INSERT INTO `qb_area` VALUES ('1478','165','沙县','3','0','','350427');
INSERT INTO `qb_area` VALUES ('1479','165','将乐县','3','0','','350428');
INSERT INTO `qb_area` VALUES ('1480','165','泰宁县','3','0','','350429');
INSERT INTO `qb_area` VALUES ('1481','165','建宁县','3','0','','350430');
INSERT INTO `qb_area` VALUES ('1482','165','永安市','3','0','','350481');
INSERT INTO `qb_area` VALUES ('1483','166','鲤城区','3','0','','350502');
INSERT INTO `qb_area` VALUES ('1484','166','丰泽区','3','0','','350503');
INSERT INTO `qb_area` VALUES ('1485','166','洛江区','3','0','','350504');
INSERT INTO `qb_area` VALUES ('1486','166','泉港区','3','0','','350505');
INSERT INTO `qb_area` VALUES ('1487','166','惠安县','3','0','','350521');
INSERT INTO `qb_area` VALUES ('1488','166','安溪县','3','0','','350524');
INSERT INTO `qb_area` VALUES ('1489','166','永春县','3','0','','350525');
INSERT INTO `qb_area` VALUES ('1490','166','德化县','3','0','','350526');
INSERT INTO `qb_area` VALUES ('1491','166','金门县','3','0','','350527');
INSERT INTO `qb_area` VALUES ('1492','166','石狮市','3','0','','350581');
INSERT INTO `qb_area` VALUES ('1493','166','晋江市','3','0','','350582');
INSERT INTO `qb_area` VALUES ('1494','166','南安市','3','0','','350583');
INSERT INTO `qb_area` VALUES ('1495','167','芗城区','3','0','','350602');
INSERT INTO `qb_area` VALUES ('1496','167','龙文区','3','0','','350603');
INSERT INTO `qb_area` VALUES ('1497','167','云霄县','3','0','','350622');
INSERT INTO `qb_area` VALUES ('1498','167','漳浦县','3','0','','350623');
INSERT INTO `qb_area` VALUES ('1499','167','诏安县','3','0','','350624');
INSERT INTO `qb_area` VALUES ('1500','167','长泰县','3','0','','350625');
INSERT INTO `qb_area` VALUES ('1501','167','东山县','3','0','','350626');
INSERT INTO `qb_area` VALUES ('1502','167','南靖县','3','0','','350627');
INSERT INTO `qb_area` VALUES ('1503','167','平和县','3','0','','350628');
INSERT INTO `qb_area` VALUES ('1504','167','华安县','3','0','','350629');
INSERT INTO `qb_area` VALUES ('1505','167','龙海市','3','0','','350681');
INSERT INTO `qb_area` VALUES ('1506','168','延平区','3','0','','350702');
INSERT INTO `qb_area` VALUES ('1507','168','建阳区','3','0','','350703');
INSERT INTO `qb_area` VALUES ('1508','168','顺昌县','3','0','','350721');
INSERT INTO `qb_area` VALUES ('1509','168','浦城县','3','0','','350722');
INSERT INTO `qb_area` VALUES ('1510','168','光泽县','3','0','','350723');
INSERT INTO `qb_area` VALUES ('1511','168','松溪县','3','0','','350724');
INSERT INTO `qb_area` VALUES ('1512','168','政和县','3','0','','350725');
INSERT INTO `qb_area` VALUES ('1513','168','邵武市','3','0','','350781');
INSERT INTO `qb_area` VALUES ('1514','168','武夷山市','3','0','','350782');
INSERT INTO `qb_area` VALUES ('1515','168','建瓯市','3','0','','350783');
INSERT INTO `qb_area` VALUES ('1516','169','新罗区','3','0','','350802');
INSERT INTO `qb_area` VALUES ('1517','169','永定区','3','0','','350803');
INSERT INTO `qb_area` VALUES ('1518','169','长汀县','3','0','','350821');
INSERT INTO `qb_area` VALUES ('1519','169','上杭县','3','0','','350823');
INSERT INTO `qb_area` VALUES ('1520','169','武平县','3','0','','350824');
INSERT INTO `qb_area` VALUES ('1521','169','连城县','3','0','','350825');
INSERT INTO `qb_area` VALUES ('1522','169','漳平市','3','0','','350881');
INSERT INTO `qb_area` VALUES ('1523','170','蕉城区','3','0','','350902');
INSERT INTO `qb_area` VALUES ('1524','170','霞浦县','3','0','','350921');
INSERT INTO `qb_area` VALUES ('1525','170','古田县','3','0','','350922');
INSERT INTO `qb_area` VALUES ('1526','170','屏南县','3','0','','350923');
INSERT INTO `qb_area` VALUES ('1527','170','寿宁县','3','0','','350924');
INSERT INTO `qb_area` VALUES ('1528','170','周宁县','3','0','','350925');
INSERT INTO `qb_area` VALUES ('1529','170','柘荣县','3','0','','350926');
INSERT INTO `qb_area` VALUES ('1530','170','福安市','3','0','','350981');
INSERT INTO `qb_area` VALUES ('1531','170','福鼎市','3','0','','350982');
INSERT INTO `qb_area` VALUES ('1532','171','东湖区','3','0','','360102');
INSERT INTO `qb_area` VALUES ('1533','171','西湖区','3','0','','360103');
INSERT INTO `qb_area` VALUES ('1534','171','青云谱区','3','0','','360104');
INSERT INTO `qb_area` VALUES ('1535','171','湾里区','3','0','','360105');
INSERT INTO `qb_area` VALUES ('1536','171','青山湖区','3','0','','360111');
INSERT INTO `qb_area` VALUES ('1537','171','新建区','3','0','','360112');
INSERT INTO `qb_area` VALUES ('1538','171','南昌县','3','0','','360121');
INSERT INTO `qb_area` VALUES ('1539','171','安义县','3','0','','360123');
INSERT INTO `qb_area` VALUES ('1540','171','进贤县','3','0','','360124');
INSERT INTO `qb_area` VALUES ('1541','172','昌江区','3','0','','360202');
INSERT INTO `qb_area` VALUES ('1542','172','珠山区','3','0','','360203');
INSERT INTO `qb_area` VALUES ('1543','172','浮梁县','3','0','','360222');
INSERT INTO `qb_area` VALUES ('1544','172','乐平市','3','0','','360281');
INSERT INTO `qb_area` VALUES ('1545','173','安源区','3','0','','360302');
INSERT INTO `qb_area` VALUES ('1546','173','湘东区','3','0','','360313');
INSERT INTO `qb_area` VALUES ('1547','173','莲花县','3','0','','360321');
INSERT INTO `qb_area` VALUES ('1548','173','上栗县','3','0','','360322');
INSERT INTO `qb_area` VALUES ('1549','173','芦溪县','3','0','','360323');
INSERT INTO `qb_area` VALUES ('1550','174','濂溪区','3','0','','360402');
INSERT INTO `qb_area` VALUES ('1551','174','浔阳区','3','0','','360403');
INSERT INTO `qb_area` VALUES ('1552','174','柴桑区','3','0','','360404');
INSERT INTO `qb_area` VALUES ('1553','174','武宁县','3','0','','360423');
INSERT INTO `qb_area` VALUES ('1554','174','修水县','3','0','','360424');
INSERT INTO `qb_area` VALUES ('1555','174','永修县','3','0','','360425');
INSERT INTO `qb_area` VALUES ('1556','174','德安县','3','0','','360426');
INSERT INTO `qb_area` VALUES ('1557','174','都昌县','3','0','','360428');
INSERT INTO `qb_area` VALUES ('1558','174','湖口县','3','0','','360429');
INSERT INTO `qb_area` VALUES ('1559','174','彭泽县','3','0','','360430');
INSERT INTO `qb_area` VALUES ('1560','174','瑞昌市','3','0','','360481');
INSERT INTO `qb_area` VALUES ('1561','174','共青城市','3','0','','360482');
INSERT INTO `qb_area` VALUES ('1562','174','庐山市','3','0','','360483');
INSERT INTO `qb_area` VALUES ('1563','175','渝水区','3','0','','360502');
INSERT INTO `qb_area` VALUES ('1564','175','分宜县','3','0','','360521');
INSERT INTO `qb_area` VALUES ('1565','176','月湖区','3','0','','360602');
INSERT INTO `qb_area` VALUES ('1566','176','余江区','3','0','','360622');
INSERT INTO `qb_area` VALUES ('1567','176','贵溪市','3','0','','360681');
INSERT INTO `qb_area` VALUES ('1568','177','章贡区','3','0','','360702');
INSERT INTO `qb_area` VALUES ('1569','177','南康区','3','0','','360703');
INSERT INTO `qb_area` VALUES ('1570','177','赣县区','3','0','','360704');
INSERT INTO `qb_area` VALUES ('1571','177','信丰县','3','0','','360722');
INSERT INTO `qb_area` VALUES ('1572','177','大余县','3','0','','360723');
INSERT INTO `qb_area` VALUES ('1573','177','上犹县','3','0','','360724');
INSERT INTO `qb_area` VALUES ('1574','177','崇义县','3','0','','360725');
INSERT INTO `qb_area` VALUES ('1575','177','安远县','3','0','','360726');
INSERT INTO `qb_area` VALUES ('1576','177','龙南县','3','0','','360727');
INSERT INTO `qb_area` VALUES ('1577','177','定南县','3','0','','360728');
INSERT INTO `qb_area` VALUES ('1578','177','全南县','3','0','','360729');
INSERT INTO `qb_area` VALUES ('1579','177','宁都县','3','0','','360730');
INSERT INTO `qb_area` VALUES ('1580','177','于都县','3','0','','360731');
INSERT INTO `qb_area` VALUES ('1581','177','兴国县','3','0','','360732');
INSERT INTO `qb_area` VALUES ('1582','177','会昌县','3','0','','360733');
INSERT INTO `qb_area` VALUES ('1583','177','寻乌县','3','0','','360734');
INSERT INTO `qb_area` VALUES ('1584','177','石城县','3','0','','360735');
INSERT INTO `qb_area` VALUES ('1585','177','瑞金市','3','0','','360781');
INSERT INTO `qb_area` VALUES ('1586','178','吉州区','3','0','','360802');
INSERT INTO `qb_area` VALUES ('1587','178','青原区','3','0','','360803');
INSERT INTO `qb_area` VALUES ('1588','178','吉安县','3','0','','360821');
INSERT INTO `qb_area` VALUES ('1589','178','吉水县','3','0','','360822');
INSERT INTO `qb_area` VALUES ('1590','178','峡江县','3','0','','360823');
INSERT INTO `qb_area` VALUES ('1591','178','新干县','3','0','','360824');
INSERT INTO `qb_area` VALUES ('1592','178','永丰县','3','0','','360825');
INSERT INTO `qb_area` VALUES ('1593','178','泰和县','3','0','','360826');
INSERT INTO `qb_area` VALUES ('1594','178','遂川县','3','0','','360827');
INSERT INTO `qb_area` VALUES ('1595','178','万安县','3','0','','360828');
INSERT INTO `qb_area` VALUES ('1596','178','安福县','3','0','','360829');
INSERT INTO `qb_area` VALUES ('1597','178','永新县','3','0','','360830');
INSERT INTO `qb_area` VALUES ('1598','178','井冈山市','3','0','','360881');
INSERT INTO `qb_area` VALUES ('1599','179','袁州区','3','0','','360902');
INSERT INTO `qb_area` VALUES ('1600','179','奉新县','3','0','','360921');
INSERT INTO `qb_area` VALUES ('1601','179','万载县','3','0','','360922');
INSERT INTO `qb_area` VALUES ('1602','179','上高县','3','0','','360923');
INSERT INTO `qb_area` VALUES ('1603','179','宜丰县','3','0','','360924');
INSERT INTO `qb_area` VALUES ('1604','179','靖安县','3','0','','360925');
INSERT INTO `qb_area` VALUES ('1605','179','铜鼓县','3','0','','360926');
INSERT INTO `qb_area` VALUES ('1606','179','丰城市','3','0','','360981');
INSERT INTO `qb_area` VALUES ('1607','179','樟树市','3','0','','360982');
INSERT INTO `qb_area` VALUES ('1608','179','高安市','3','0','','360983');
INSERT INTO `qb_area` VALUES ('1609','180','临川区','3','0','','361002');
INSERT INTO `qb_area` VALUES ('1610','180','东乡区','3','0','','361003');
INSERT INTO `qb_area` VALUES ('1611','180','南城县','3','0','','361021');
INSERT INTO `qb_area` VALUES ('1612','180','黎川县','3','0','','361022');
INSERT INTO `qb_area` VALUES ('1613','180','南丰县','3','0','','361023');
INSERT INTO `qb_area` VALUES ('1614','180','崇仁县','3','0','','361024');
INSERT INTO `qb_area` VALUES ('1615','180','乐安县','3','0','','361025');
INSERT INTO `qb_area` VALUES ('1616','180','宜黄县','3','0','','361026');
INSERT INTO `qb_area` VALUES ('1617','180','金溪县','3','0','','361027');
INSERT INTO `qb_area` VALUES ('1618','180','资溪县','3','0','','361028');
INSERT INTO `qb_area` VALUES ('1619','180','广昌县','3','0','','361030');
INSERT INTO `qb_area` VALUES ('1620','181','信州区','3','0','','361102');
INSERT INTO `qb_area` VALUES ('1621','181','广丰区','3','0','','361103');
INSERT INTO `qb_area` VALUES ('1622','181','上饶县','3','0','','361121');
INSERT INTO `qb_area` VALUES ('1623','181','玉山县','3','0','','361123');
INSERT INTO `qb_area` VALUES ('1624','181','铅山县','3','0','','361124');
INSERT INTO `qb_area` VALUES ('1625','181','横峰县','3','0','','361125');
INSERT INTO `qb_area` VALUES ('1626','181','弋阳县','3','0','','361126');
INSERT INTO `qb_area` VALUES ('1627','181','余干县','3','0','','361127');
INSERT INTO `qb_area` VALUES ('1628','181','鄱阳县','3','0','','361128');
INSERT INTO `qb_area` VALUES ('1629','181','万年县','3','0','','361129');
INSERT INTO `qb_area` VALUES ('1630','181','婺源县','3','0','','361130');
INSERT INTO `qb_area` VALUES ('1631','181','德兴市','3','0','','361181');
INSERT INTO `qb_area` VALUES ('1632','182','历下区','3','0','','370102');
INSERT INTO `qb_area` VALUES ('1633','182','市中区','3','0','','370103');
INSERT INTO `qb_area` VALUES ('1634','182','槐荫区','3','0','','370104');
INSERT INTO `qb_area` VALUES ('1635','182','天桥区','3','0','','370105');
INSERT INTO `qb_area` VALUES ('1636','182','历城区','3','0','','370112');
INSERT INTO `qb_area` VALUES ('1637','182','长清区','3','0','','370113');
INSERT INTO `qb_area` VALUES ('1638','182','章丘区','3','0','','370114');
INSERT INTO `qb_area` VALUES ('1639','182','平阴县','3','0','','370124');
INSERT INTO `qb_area` VALUES ('1640','182','济阳市','3','0','','370125');
INSERT INTO `qb_area` VALUES ('1641','182','商河县','3','0','','370126');
INSERT INTO `qb_area` VALUES ('1642','183','市南区','3','0','','370202');
INSERT INTO `qb_area` VALUES ('1643','183','市北区','3','0','','370203');
INSERT INTO `qb_area` VALUES ('1644','183','黄岛区','3','0','','370211');
INSERT INTO `qb_area` VALUES ('1645','183','崂山区','3','0','','370212');
INSERT INTO `qb_area` VALUES ('1646','183','李沧区','3','0','','370213');
INSERT INTO `qb_area` VALUES ('1647','183','城阳区','3','0','','370214');
INSERT INTO `qb_area` VALUES ('1648','183','即墨区','3','0','','370215');
INSERT INTO `qb_area` VALUES ('1649','183','胶州市','3','0','','370281');
INSERT INTO `qb_area` VALUES ('1650','183','平度市','3','0','','370283');
INSERT INTO `qb_area` VALUES ('1651','183','莱西市','3','0','','370285');
INSERT INTO `qb_area` VALUES ('1652','184','淄川区','3','0','','370302');
INSERT INTO `qb_area` VALUES ('1653','184','张店区','3','0','','370303');
INSERT INTO `qb_area` VALUES ('1654','184','博山区','3','0','','370304');
INSERT INTO `qb_area` VALUES ('1655','184','临淄区','3','0','','370305');
INSERT INTO `qb_area` VALUES ('1656','184','周村区','3','0','','370306');
INSERT INTO `qb_area` VALUES ('1657','184','桓台县','3','0','','370321');
INSERT INTO `qb_area` VALUES ('1658','184','高青县','3','0','','370322');
INSERT INTO `qb_area` VALUES ('1659','184','沂源县','3','0','','370323');
INSERT INTO `qb_area` VALUES ('1660','185','市中区','3','0','','370402');
INSERT INTO `qb_area` VALUES ('1661','185','薛城区','3','0','','370403');
INSERT INTO `qb_area` VALUES ('1662','185','峄城区','3','0','','370404');
INSERT INTO `qb_area` VALUES ('1663','185','台儿庄区','3','0','','370405');
INSERT INTO `qb_area` VALUES ('1664','185','山亭区','3','0','','370406');
INSERT INTO `qb_area` VALUES ('1665','185','滕州市','3','0','','370481');
INSERT INTO `qb_area` VALUES ('1666','186','东营区','3','0','','370502');
INSERT INTO `qb_area` VALUES ('1667','186','河口区','3','0','','370503');
INSERT INTO `qb_area` VALUES ('1668','186','垦利区','3','0','','370505');
INSERT INTO `qb_area` VALUES ('1669','186','利津县','3','0','','370522');
INSERT INTO `qb_area` VALUES ('1670','186','广饶县','3','0','','370523');
INSERT INTO `qb_area` VALUES ('1671','187','芝罘区','3','0','','370602');
INSERT INTO `qb_area` VALUES ('1672','187','福山区','3','0','','370611');
INSERT INTO `qb_area` VALUES ('1673','187','牟平区','3','0','','370612');
INSERT INTO `qb_area` VALUES ('1674','187','莱山区','3','0','','370613');
INSERT INTO `qb_area` VALUES ('1675','187','蓬莱区','3','0','','370614');
INSERT INTO `qb_area` VALUES ('1676','187','龙口市','3','0','','370681');
INSERT INTO `qb_area` VALUES ('1677','187','莱阳市','3','0','','370682');
INSERT INTO `qb_area` VALUES ('1678','187','莱州市','3','0','','370683');
INSERT INTO `qb_area` VALUES ('1679','187','招远市','3','0','','370685');
INSERT INTO `qb_area` VALUES ('1680','187','栖霞市','3','0','','370686');
INSERT INTO `qb_area` VALUES ('1681','187','海阳市','3','0','','370687');
INSERT INTO `qb_area` VALUES ('1682','188','潍城区','3','0','','370702');
INSERT INTO `qb_area` VALUES ('1683','188','寒亭区','3','0','','370703');
INSERT INTO `qb_area` VALUES ('1684','188','坊子区','3','0','','370704');
INSERT INTO `qb_area` VALUES ('1685','188','奎文区','3','0','','370705');
INSERT INTO `qb_area` VALUES ('1686','188','临朐县','3','0','','370724');
INSERT INTO `qb_area` VALUES ('1687','188','昌乐县','3','0','','370725');
INSERT INTO `qb_area` VALUES ('1688','188','青州市','3','0','','370781');
INSERT INTO `qb_area` VALUES ('1689','188','诸城市','3','0','','370782');
INSERT INTO `qb_area` VALUES ('1690','188','寿光市','3','0','','370783');
INSERT INTO `qb_area` VALUES ('1691','188','安丘市','3','0','','370784');
INSERT INTO `qb_area` VALUES ('1692','188','高密市','3','0','','370785');
INSERT INTO `qb_area` VALUES ('1693','188','昌邑市','3','0','','370786');
INSERT INTO `qb_area` VALUES ('1694','189','任城区','3','0','','370811');
INSERT INTO `qb_area` VALUES ('1695','189','兖州区','3','0','','370812');
INSERT INTO `qb_area` VALUES ('1696','189','微山县','3','0','','370826');
INSERT INTO `qb_area` VALUES ('1697','189','鱼台县','3','0','','370827');
INSERT INTO `qb_area` VALUES ('1698','189','金乡县','3','0','','370828');
INSERT INTO `qb_area` VALUES ('1699','189','嘉祥县','3','0','','370829');
INSERT INTO `qb_area` VALUES ('1700','189','汶上县','3','0','','370830');
INSERT INTO `qb_area` VALUES ('1701','189','泗水县','3','0','','370831');
INSERT INTO `qb_area` VALUES ('1702','189','梁山县','3','0','','370832');
INSERT INTO `qb_area` VALUES ('1703','189','曲阜市','3','0','','370881');
INSERT INTO `qb_area` VALUES ('1704','189','邹城市','3','0','','370883');
INSERT INTO `qb_area` VALUES ('1705','190','泰山区','3','0','','370902');
INSERT INTO `qb_area` VALUES ('1706','190','岱岳区','3','0','','370911');
INSERT INTO `qb_area` VALUES ('1707','190','宁阳县','3','0','','370921');
INSERT INTO `qb_area` VALUES ('1708','190','东平县','3','0','','370923');
INSERT INTO `qb_area` VALUES ('1709','190','新泰市','3','0','','370982');
INSERT INTO `qb_area` VALUES ('1710','190','肥城市','3','0','','370983');
INSERT INTO `qb_area` VALUES ('1711','191','环翠区','3','0','','371002');
INSERT INTO `qb_area` VALUES ('1712','191','文登区','3','0','','371003');
INSERT INTO `qb_area` VALUES ('1713','191','荣成市','3','0','','371082');
INSERT INTO `qb_area` VALUES ('1714','191','乳山市','3','0','','371083');
INSERT INTO `qb_area` VALUES ('1715','192','东港区','3','0','','371102');
INSERT INTO `qb_area` VALUES ('1716','192','岚山区','3','0','','371103');
INSERT INTO `qb_area` VALUES ('1717','192','五莲县','3','0','','371121');
INSERT INTO `qb_area` VALUES ('1718','192','莒县','3','0','','371122');
INSERT INTO `qb_area` VALUES ('1719','193','莱城区','3','0','','371202');
INSERT INTO `qb_area` VALUES ('1720','193','钢城区','3','0','','371203');
INSERT INTO `qb_area` VALUES ('1721','194','兰山区','3','0','','371302');
INSERT INTO `qb_area` VALUES ('1722','194','罗庄区','3','0','','371311');
INSERT INTO `qb_area` VALUES ('1723','194','河东区','3','0','','371312');
INSERT INTO `qb_area` VALUES ('1724','194','沂南县','3','0','','371321');
INSERT INTO `qb_area` VALUES ('1725','194','郯城县','3','0','','371322');
INSERT INTO `qb_area` VALUES ('1726','194','沂水县','3','0','','371323');
INSERT INTO `qb_area` VALUES ('1727','194','兰陵县','3','0','','371324');
INSERT INTO `qb_area` VALUES ('1728','194','费县','3','0','','371325');
INSERT INTO `qb_area` VALUES ('1729','194','平邑县','3','0','','371326');
INSERT INTO `qb_area` VALUES ('1730','194','莒南县','3','0','','371327');
INSERT INTO `qb_area` VALUES ('1731','194','蒙阴县','3','0','','371328');
INSERT INTO `qb_area` VALUES ('1732','194','临沭县','3','0','','371329');
INSERT INTO `qb_area` VALUES ('1733','195','德城区','3','0','','371402');
INSERT INTO `qb_area` VALUES ('1734','195','陵城区','3','0','','371403');
INSERT INTO `qb_area` VALUES ('1735','195','宁津县','3','0','','371422');
INSERT INTO `qb_area` VALUES ('1736','195','庆云县','3','0','','371423');
INSERT INTO `qb_area` VALUES ('1737','195','临邑县','3','0','','371424');
INSERT INTO `qb_area` VALUES ('1738','195','齐河县','3','0','','371425');
INSERT INTO `qb_area` VALUES ('1739','195','平原县','3','0','','371426');
INSERT INTO `qb_area` VALUES ('1740','195','夏津县','3','0','','371427');
INSERT INTO `qb_area` VALUES ('1741','195','武城县','3','0','','371428');
INSERT INTO `qb_area` VALUES ('1742','195','乐陵市','3','0','','371481');
INSERT INTO `qb_area` VALUES ('1743','195','禹城市','3','0','','371482');
INSERT INTO `qb_area` VALUES ('1744','196','东昌府区','3','0','','371502');
INSERT INTO `qb_area` VALUES ('1745','196','阳谷县','3','0','','371521');
INSERT INTO `qb_area` VALUES ('1746','196','莘县','3','0','','371522');
INSERT INTO `qb_area` VALUES ('1747','196','茌平县','3','0','','371523');
INSERT INTO `qb_area` VALUES ('1748','196','东阿县','3','0','','371524');
INSERT INTO `qb_area` VALUES ('1749','196','冠县','3','0','','371525');
INSERT INTO `qb_area` VALUES ('1750','196','高唐县','3','0','','371526');
INSERT INTO `qb_area` VALUES ('1751','196','临清市','3','0','','371581');
INSERT INTO `qb_area` VALUES ('1752','197','滨城区','3','0','','371602');
INSERT INTO `qb_area` VALUES ('1753','197','沾化区','3','0','','371603');
INSERT INTO `qb_area` VALUES ('1754','197','惠民县','3','0','','371621');
INSERT INTO `qb_area` VALUES ('1755','197','阳信县','3','0','','371622');
INSERT INTO `qb_area` VALUES ('1756','197','无棣县','3','0','','371623');
INSERT INTO `qb_area` VALUES ('1757','197','博兴县','3','0','','371625');
INSERT INTO `qb_area` VALUES ('1758','197','邹平市','3','0','','371626');
INSERT INTO `qb_area` VALUES ('1759','198','牡丹区','3','0','','371702');
INSERT INTO `qb_area` VALUES ('1760','198','定陶区','3','0','','371703');
INSERT INTO `qb_area` VALUES ('1761','198','曹县','3','0','','371721');
INSERT INTO `qb_area` VALUES ('1762','198','单县','3','0','','371722');
INSERT INTO `qb_area` VALUES ('1763','198','成武县','3','0','','371723');
INSERT INTO `qb_area` VALUES ('1764','198','巨野县','3','0','','371724');
INSERT INTO `qb_area` VALUES ('1765','198','郓城县','3','0','','371725');
INSERT INTO `qb_area` VALUES ('1766','198','鄄城县','3','0','','371726');
INSERT INTO `qb_area` VALUES ('1767','198','东明县','3','0','','371728');
INSERT INTO `qb_area` VALUES ('1768','199','中原区','3','0','','410102');
INSERT INTO `qb_area` VALUES ('1769','199','二七区','3','0','','410103');
INSERT INTO `qb_area` VALUES ('1770','199','管城回族区','3','0','','410104');
INSERT INTO `qb_area` VALUES ('1771','199','金水区','3','0','','410105');
INSERT INTO `qb_area` VALUES ('1772','199','上街区','3','0','','410106');
INSERT INTO `qb_area` VALUES ('1773','199','惠济区','3','0','','410108');
INSERT INTO `qb_area` VALUES ('1774','199','中牟县','3','0','','410122');
INSERT INTO `qb_area` VALUES ('1775','199','巩义市','3','0','','410181');
INSERT INTO `qb_area` VALUES ('1776','199','荥阳市','3','0','','410182');
INSERT INTO `qb_area` VALUES ('1777','199','新密市','3','0','','410183');
INSERT INTO `qb_area` VALUES ('1778','199','新郑市','3','0','','410184');
INSERT INTO `qb_area` VALUES ('1779','199','登封市','3','0','','410185');
INSERT INTO `qb_area` VALUES ('1780','200','龙亭区','3','0','','410202');
INSERT INTO `qb_area` VALUES ('1781','200','顺河回族区','3','0','','410203');
INSERT INTO `qb_area` VALUES ('1782','200','鼓楼区','3','0','','410204');
INSERT INTO `qb_area` VALUES ('1783','200','禹王台区','3','0','','410205');
INSERT INTO `qb_area` VALUES ('1784','200','祥符区','3','0','','410212');
INSERT INTO `qb_area` VALUES ('1785','200','杞县','3','0','','410221');
INSERT INTO `qb_area` VALUES ('1786','200','通许县','3','0','','410222');
INSERT INTO `qb_area` VALUES ('1787','200','尉氏县','3','0','','410223');
INSERT INTO `qb_area` VALUES ('1788','200','兰考县','3','0','','410225');
INSERT INTO `qb_area` VALUES ('1789','201','老城区','3','0','','410302');
INSERT INTO `qb_area` VALUES ('1790','201','西工区','3','0','','410303');
INSERT INTO `qb_area` VALUES ('1791','201','瀍河回族区','3','0','','410304');
INSERT INTO `qb_area` VALUES ('1792','201','涧西区','3','0','','410305');
INSERT INTO `qb_area` VALUES ('1793','201','吉利区','3','0','','410306');
INSERT INTO `qb_area` VALUES ('1794','201','洛龙区','3','0','','410311');
INSERT INTO `qb_area` VALUES ('1795','201','孟津县','3','0','','410322');
INSERT INTO `qb_area` VALUES ('1796','201','新安县','3','0','','410323');
INSERT INTO `qb_area` VALUES ('1797','201','栾川县','3','0','','410324');
INSERT INTO `qb_area` VALUES ('1798','201','嵩县','3','0','','410325');
INSERT INTO `qb_area` VALUES ('1799','201','汝阳县','3','0','','410326');
INSERT INTO `qb_area` VALUES ('1800','201','宜阳县','3','0','','410327');
INSERT INTO `qb_area` VALUES ('1801','201','洛宁县','3','0','','410328');
INSERT INTO `qb_area` VALUES ('1802','201','伊川县','3','0','','410329');
INSERT INTO `qb_area` VALUES ('1803','201','偃师市','3','0','','410381');
INSERT INTO `qb_area` VALUES ('1804','202','新华区','3','0','','410402');
INSERT INTO `qb_area` VALUES ('1805','202','卫东区','3','0','','410403');
INSERT INTO `qb_area` VALUES ('1806','202','石龙区','3','0','','410404');
INSERT INTO `qb_area` VALUES ('1807','202','湛河区','3','0','','410411');
INSERT INTO `qb_area` VALUES ('1808','202','宝丰县','3','0','','410421');
INSERT INTO `qb_area` VALUES ('1809','202','叶县','3','0','','410422');
INSERT INTO `qb_area` VALUES ('1810','202','鲁山县','3','0','','410423');
INSERT INTO `qb_area` VALUES ('1811','202','郏县','3','0','','410425');
INSERT INTO `qb_area` VALUES ('1812','202','舞钢市','3','0','','410481');
INSERT INTO `qb_area` VALUES ('1813','202','汝州市','3','0','','410482');
INSERT INTO `qb_area` VALUES ('1814','203','文峰区','3','0','','410502');
INSERT INTO `qb_area` VALUES ('1815','203','北关区','3','0','','410503');
INSERT INTO `qb_area` VALUES ('1816','203','殷都区','3','0','','410505');
INSERT INTO `qb_area` VALUES ('1817','203','龙安区','3','0','','410506');
INSERT INTO `qb_area` VALUES ('1818','203','安阳县','3','0','','410522');
INSERT INTO `qb_area` VALUES ('1819','203','汤阴县','3','0','','410523');
INSERT INTO `qb_area` VALUES ('1820','203','滑县','3','0','','410526');
INSERT INTO `qb_area` VALUES ('1821','203','内黄县','3','0','','410527');
INSERT INTO `qb_area` VALUES ('1822','203','林州市','3','0','','410581');
INSERT INTO `qb_area` VALUES ('1823','204','鹤山区','3','0','','410602');
INSERT INTO `qb_area` VALUES ('1824','204','山城区','3','0','','410603');
INSERT INTO `qb_area` VALUES ('1825','204','淇滨区','3','0','','410611');
INSERT INTO `qb_area` VALUES ('1826','204','浚县','3','0','','410621');
INSERT INTO `qb_area` VALUES ('1827','204','淇县','3','0','','410622');
INSERT INTO `qb_area` VALUES ('1828','205','红旗区','3','0','','410702');
INSERT INTO `qb_area` VALUES ('1829','205','卫滨区','3','0','','410703');
INSERT INTO `qb_area` VALUES ('1830','205','凤泉区','3','0','','410704');
INSERT INTO `qb_area` VALUES ('1831','205','牧野区','3','0','','410711');
INSERT INTO `qb_area` VALUES ('1832','205','新乡县','3','0','','410721');
INSERT INTO `qb_area` VALUES ('1833','205','获嘉县','3','0','','410724');
INSERT INTO `qb_area` VALUES ('1834','205','原阳县','3','0','','410725');
INSERT INTO `qb_area` VALUES ('1835','205','延津县','3','0','','410726');
INSERT INTO `qb_area` VALUES ('1836','205','封丘县','3','0','','410727');
INSERT INTO `qb_area` VALUES ('1837','205','长垣县','3','0','','410728');
INSERT INTO `qb_area` VALUES ('1838','205','卫辉市','3','0','','410781');
INSERT INTO `qb_area` VALUES ('1839','205','辉县市','3','0','','410782');
INSERT INTO `qb_area` VALUES ('1840','206','解放区','3','0','','410802');
INSERT INTO `qb_area` VALUES ('1841','206','中站区','3','0','','410803');
INSERT INTO `qb_area` VALUES ('1842','206','马村区','3','0','','410804');
INSERT INTO `qb_area` VALUES ('1843','206','山阳区','3','0','','410811');
INSERT INTO `qb_area` VALUES ('1844','206','修武县','3','0','','410821');
INSERT INTO `qb_area` VALUES ('1845','206','博爱县','3','0','','410822');
INSERT INTO `qb_area` VALUES ('1846','206','武陟县','3','0','','410823');
INSERT INTO `qb_area` VALUES ('1847','206','温县','3','0','','410825');
INSERT INTO `qb_area` VALUES ('1848','206','沁阳市','3','0','','410882');
INSERT INTO `qb_area` VALUES ('1849','206','孟州市','3','0','','410883');
INSERT INTO `qb_area` VALUES ('1850','207','华龙区','3','0','','410902');
INSERT INTO `qb_area` VALUES ('1851','207','清丰县','3','0','','410922');
INSERT INTO `qb_area` VALUES ('1852','207','南乐县','3','0','','410923');
INSERT INTO `qb_area` VALUES ('1853','207','范县','3','0','','410926');
INSERT INTO `qb_area` VALUES ('1854','207','台前县','3','0','','410927');
INSERT INTO `qb_area` VALUES ('1855','207','濮阳县','3','0','','410928');
INSERT INTO `qb_area` VALUES ('1856','208','魏都区','3','0','','411002');
INSERT INTO `qb_area` VALUES ('1857','208','建安区','3','0','','411003');
INSERT INTO `qb_area` VALUES ('1858','208','鄢陵县','3','0','','411024');
INSERT INTO `qb_area` VALUES ('1859','208','襄城县','3','0','','411025');
INSERT INTO `qb_area` VALUES ('1860','208','禹州市','3','0','','411081');
INSERT INTO `qb_area` VALUES ('1861','208','长葛市','3','0','','411082');
INSERT INTO `qb_area` VALUES ('1862','209','源汇区','3','0','','411102');
INSERT INTO `qb_area` VALUES ('1863','209','郾城区','3','0','','411103');
INSERT INTO `qb_area` VALUES ('1864','209','召陵区','3','0','','411104');
INSERT INTO `qb_area` VALUES ('1865','209','舞阳县','3','0','','411121');
INSERT INTO `qb_area` VALUES ('1866','209','临颍县','3','0','','411122');
INSERT INTO `qb_area` VALUES ('1867','210','湖滨区','3','0','','411202');
INSERT INTO `qb_area` VALUES ('1868','210','陕州区','3','0','','411203');
INSERT INTO `qb_area` VALUES ('1869','210','渑池县','3','0','','411221');
INSERT INTO `qb_area` VALUES ('1870','210','卢氏县','3','0','','411224');
INSERT INTO `qb_area` VALUES ('1871','210','义马市','3','0','','411281');
INSERT INTO `qb_area` VALUES ('1872','210','灵宝市','3','0','','411282');
INSERT INTO `qb_area` VALUES ('1873','211','宛城区','3','0','','411302');
INSERT INTO `qb_area` VALUES ('1874','211','卧龙区','3','0','','411303');
INSERT INTO `qb_area` VALUES ('1875','211','南召县','3','0','','411321');
INSERT INTO `qb_area` VALUES ('1876','211','方城县','3','0','','411322');
INSERT INTO `qb_area` VALUES ('1877','211','西峡县','3','0','','411323');
INSERT INTO `qb_area` VALUES ('1878','211','镇平县','3','0','','411324');
INSERT INTO `qb_area` VALUES ('1879','211','内乡县','3','0','','411325');
INSERT INTO `qb_area` VALUES ('1880','211','淅川县','3','0','','411326');
INSERT INTO `qb_area` VALUES ('1881','211','社旗县','3','0','','411327');
INSERT INTO `qb_area` VALUES ('1882','211','唐河县','3','0','','411328');
INSERT INTO `qb_area` VALUES ('1883','211','新野县','3','0','','411329');
INSERT INTO `qb_area` VALUES ('1884','211','桐柏县','3','0','','411330');
INSERT INTO `qb_area` VALUES ('1885','211','邓州市','3','0','','411381');
INSERT INTO `qb_area` VALUES ('1886','212','梁园区','3','0','','411402');
INSERT INTO `qb_area` VALUES ('1887','212','睢阳区','3','0','','411403');
INSERT INTO `qb_area` VALUES ('1888','212','民权县','3','0','','411421');
INSERT INTO `qb_area` VALUES ('1889','212','睢县','3','0','','411422');
INSERT INTO `qb_area` VALUES ('1890','212','宁陵县','3','0','','411423');
INSERT INTO `qb_area` VALUES ('1891','212','柘城县','3','0','','411424');
INSERT INTO `qb_area` VALUES ('1892','212','虞城县','3','0','','411425');
INSERT INTO `qb_area` VALUES ('1893','212','夏邑县','3','0','','411426');
INSERT INTO `qb_area` VALUES ('1894','212','永城市','3','0','','411481');
INSERT INTO `qb_area` VALUES ('1895','213','浉河区','3','0','','411502');
INSERT INTO `qb_area` VALUES ('1896','213','平桥区','3','0','','411503');
INSERT INTO `qb_area` VALUES ('1897','213','罗山县','3','0','','411521');
INSERT INTO `qb_area` VALUES ('1898','213','光山县','3','0','','411522');
INSERT INTO `qb_area` VALUES ('1899','213','新县','3','0','','411523');
INSERT INTO `qb_area` VALUES ('1900','213','商城县','3','0','','411524');
INSERT INTO `qb_area` VALUES ('1901','213','固始县','3','0','','411525');
INSERT INTO `qb_area` VALUES ('1902','213','潢川县','3','0','','411526');
INSERT INTO `qb_area` VALUES ('1903','213','淮滨县','3','0','','411527');
INSERT INTO `qb_area` VALUES ('1904','213','息县','3','0','','411528');
INSERT INTO `qb_area` VALUES ('1905','214','川汇区','3','0','','411602');
INSERT INTO `qb_area` VALUES ('1906','214','扶沟县','3','0','','411621');
INSERT INTO `qb_area` VALUES ('1907','214','西华县','3','0','','411622');
INSERT INTO `qb_area` VALUES ('1908','214','商水县','3','0','','411623');
INSERT INTO `qb_area` VALUES ('1909','214','沈丘县','3','0','','411624');
INSERT INTO `qb_area` VALUES ('1910','214','郸城县','3','0','','411625');
INSERT INTO `qb_area` VALUES ('1911','214','淮阳县','3','0','','411626');
INSERT INTO `qb_area` VALUES ('1912','214','太康县','3','0','','411627');
INSERT INTO `qb_area` VALUES ('1913','214','鹿邑县','3','0','','411628');
INSERT INTO `qb_area` VALUES ('1914','214','项城市','3','0','','411681');
INSERT INTO `qb_area` VALUES ('1915','215','驿城区','3','0','','411702');
INSERT INTO `qb_area` VALUES ('1916','215','西平县','3','0','','411721');
INSERT INTO `qb_area` VALUES ('1917','215','上蔡县','3','0','','411722');
INSERT INTO `qb_area` VALUES ('1918','215','平舆县','3','0','','411723');
INSERT INTO `qb_area` VALUES ('1919','215','正阳县','3','0','','411724');
INSERT INTO `qb_area` VALUES ('1920','215','确山县','3','0','','411725');
INSERT INTO `qb_area` VALUES ('1921','215','泌阳县','3','0','','411726');
INSERT INTO `qb_area` VALUES ('1922','215','汝南县','3','0','','411727');
INSERT INTO `qb_area` VALUES ('1923','215','遂平县','3','0','','411728');
INSERT INTO `qb_area` VALUES ('1924','215','新蔡县','3','0','','411729');
INSERT INTO `qb_area` VALUES ('1925','216','江岸区','3','0','','420102');
INSERT INTO `qb_area` VALUES ('1926','216','江汉区','3','0','','420103');
INSERT INTO `qb_area` VALUES ('1927','216','硚口区','3','0','','420104');
INSERT INTO `qb_area` VALUES ('1928','216','汉阳区','3','0','','420105');
INSERT INTO `qb_area` VALUES ('1929','216','武昌区','3','0','','420106');
INSERT INTO `qb_area` VALUES ('1930','216','青山区','3','0','','420107');
INSERT INTO `qb_area` VALUES ('1931','216','洪山区','3','0','','420111');
INSERT INTO `qb_area` VALUES ('1932','216','东西湖区','3','0','','420112');
INSERT INTO `qb_area` VALUES ('1933','216','汉南区','3','0','','420113');
INSERT INTO `qb_area` VALUES ('1934','216','蔡甸区','3','0','','420114');
INSERT INTO `qb_area` VALUES ('1935','216','江夏区','3','0','','420115');
INSERT INTO `qb_area` VALUES ('1936','216','黄陂区','3','0','','420116');
INSERT INTO `qb_area` VALUES ('1937','216','新洲区','3','0','','420117');
INSERT INTO `qb_area` VALUES ('1938','217','黄石港区','3','0','','420202');
INSERT INTO `qb_area` VALUES ('1939','217','西塞山区','3','0','','420203');
INSERT INTO `qb_area` VALUES ('1940','217','下陆区','3','0','','420204');
INSERT INTO `qb_area` VALUES ('1941','217','铁山区','3','0','','420205');
INSERT INTO `qb_area` VALUES ('1942','217','阳新县','3','0','','420222');
INSERT INTO `qb_area` VALUES ('1943','217','大冶市','3','0','','420281');
INSERT INTO `qb_area` VALUES ('1944','218','茅箭区','3','0','','420302');
INSERT INTO `qb_area` VALUES ('1945','218','张湾区','3','0','','420303');
INSERT INTO `qb_area` VALUES ('1946','218','郧阳区','3','0','','420304');
INSERT INTO `qb_area` VALUES ('1947','218','郧西县','3','0','','420322');
INSERT INTO `qb_area` VALUES ('1948','218','竹山县','3','0','','420323');
INSERT INTO `qb_area` VALUES ('1949','218','竹溪县','3','0','','420324');
INSERT INTO `qb_area` VALUES ('1950','218','房县','3','0','','420325');
INSERT INTO `qb_area` VALUES ('1951','218','丹江口市','3','0','','420381');
INSERT INTO `qb_area` VALUES ('1952','219','西陵区','3','0','','420502');
INSERT INTO `qb_area` VALUES ('1953','219','伍家岗区','3','0','','420503');
INSERT INTO `qb_area` VALUES ('1954','219','点军区','3','0','','420504');
INSERT INTO `qb_area` VALUES ('1955','219','猇亭区','3','0','','420505');
INSERT INTO `qb_area` VALUES ('1956','219','夷陵区','3','0','','420506');
INSERT INTO `qb_area` VALUES ('1957','219','远安县','3','0','','420525');
INSERT INTO `qb_area` VALUES ('1958','219','兴山县','3','0','','420526');
INSERT INTO `qb_area` VALUES ('1959','219','秭归县','3','0','','420527');
INSERT INTO `qb_area` VALUES ('1960','219','长阳土家族自治县','3','0','','420528');
INSERT INTO `qb_area` VALUES ('1961','219','五峰土家族自治县','3','0','','420529');
INSERT INTO `qb_area` VALUES ('1962','219','宜都市','3','0','','420581');
INSERT INTO `qb_area` VALUES ('1963','219','当阳市','3','0','','420582');
INSERT INTO `qb_area` VALUES ('1964','219','枝江市','3','0','','420583');
INSERT INTO `qb_area` VALUES ('1965','220','襄城区','3','0','','420602');
INSERT INTO `qb_area` VALUES ('1966','220','樊城区','3','0','','420606');
INSERT INTO `qb_area` VALUES ('1967','220','襄州区','3','0','','420607');
INSERT INTO `qb_area` VALUES ('1968','220','南漳县','3','0','','420624');
INSERT INTO `qb_area` VALUES ('1969','220','谷城县','3','0','','420625');
INSERT INTO `qb_area` VALUES ('1970','220','保康县','3','0','','420626');
INSERT INTO `qb_area` VALUES ('1971','220','老河口市','3','0','','420682');
INSERT INTO `qb_area` VALUES ('1972','220','枣阳市','3','0','','420683');
INSERT INTO `qb_area` VALUES ('1973','220','宜城市','3','0','','420684');
INSERT INTO `qb_area` VALUES ('1974','221','梁子湖区','3','0','','420702');
INSERT INTO `qb_area` VALUES ('1975','221','华容区','3','0','','420703');
INSERT INTO `qb_area` VALUES ('1976','221','鄂城区','3','0','','420704');
INSERT INTO `qb_area` VALUES ('1977','222','东宝区','3','0','','420802');
INSERT INTO `qb_area` VALUES ('1978','222','掇刀区','3','0','','420804');
INSERT INTO `qb_area` VALUES ('1979','222','京山市','3','0','','420821');
INSERT INTO `qb_area` VALUES ('1980','222','沙洋县','3','0','','420822');
INSERT INTO `qb_area` VALUES ('1981','222','钟祥市','3','0','','420881');
INSERT INTO `qb_area` VALUES ('1982','223','孝南区','3','0','','420902');
INSERT INTO `qb_area` VALUES ('1983','223','孝昌县','3','0','','420921');
INSERT INTO `qb_area` VALUES ('1984','223','大悟县','3','0','','420922');
INSERT INTO `qb_area` VALUES ('1985','223','云梦县','3','0','','420923');
INSERT INTO `qb_area` VALUES ('1986','223','应城市','3','0','','420981');
INSERT INTO `qb_area` VALUES ('1987','223','安陆市','3','0','','420982');
INSERT INTO `qb_area` VALUES ('1988','223','汉川市','3','0','','420984');
INSERT INTO `qb_area` VALUES ('1989','224','沙市区','3','0','','421002');
INSERT INTO `qb_area` VALUES ('1990','224','荆州区','3','0','','421003');
INSERT INTO `qb_area` VALUES ('1991','224','公安县','3','0','','421022');
INSERT INTO `qb_area` VALUES ('1992','224','监利县','3','0','','421023');
INSERT INTO `qb_area` VALUES ('1993','224','江陵县','3','0','','421024');
INSERT INTO `qb_area` VALUES ('1994','224','石首市','3','0','','421081');
INSERT INTO `qb_area` VALUES ('1995','224','洪湖市','3','0','','421083');
INSERT INTO `qb_area` VALUES ('1996','224','松滋市','3','0','','421087');
INSERT INTO `qb_area` VALUES ('1997','225','黄州区','3','0','','421102');
INSERT INTO `qb_area` VALUES ('1998','225','团风县','3','0','','421121');
INSERT INTO `qb_area` VALUES ('1999','225','红安县','3','0','','421122');
INSERT INTO `qb_area` VALUES ('2000','225','罗田县','3','0','','421123');
INSERT INTO `qb_area` VALUES ('2001','225','英山县','3','0','','421124');
INSERT INTO `qb_area` VALUES ('2002','225','浠水县','3','0','','421125');
INSERT INTO `qb_area` VALUES ('2003','225','蕲春县','3','0','','421126');
INSERT INTO `qb_area` VALUES ('2004','225','黄梅县','3','0','','421127');
INSERT INTO `qb_area` VALUES ('2005','225','麻城市','3','0','','421181');
INSERT INTO `qb_area` VALUES ('2006','225','武穴市','3','0','','421182');
INSERT INTO `qb_area` VALUES ('2007','226','咸安区','3','0','','421202');
INSERT INTO `qb_area` VALUES ('2008','226','嘉鱼县','3','0','','421221');
INSERT INTO `qb_area` VALUES ('2009','226','通城县','3','0','','421222');
INSERT INTO `qb_area` VALUES ('2010','226','崇阳县','3','0','','421223');
INSERT INTO `qb_area` VALUES ('2011','226','通山县','3','0','','421224');
INSERT INTO `qb_area` VALUES ('2012','226','赤壁市','3','0','','421281');
INSERT INTO `qb_area` VALUES ('2013','227','曾都区','3','0','','421303');
INSERT INTO `qb_area` VALUES ('2014','227','随县','3','0','','421321');
INSERT INTO `qb_area` VALUES ('2015','227','广水市','3','0','','421381');
INSERT INTO `qb_area` VALUES ('2016','228','恩施市','3','0','','422801');
INSERT INTO `qb_area` VALUES ('2017','228','利川市','3','0','','422802');
INSERT INTO `qb_area` VALUES ('2018','228','建始县','3','0','','422822');
INSERT INTO `qb_area` VALUES ('2019','228','巴东县','3','0','','422823');
INSERT INTO `qb_area` VALUES ('2020','228','宣恩县','3','0','','422825');
INSERT INTO `qb_area` VALUES ('2021','228','咸丰县','3','0','','422826');
INSERT INTO `qb_area` VALUES ('2022','228','来凤县','3','0','','422827');
INSERT INTO `qb_area` VALUES ('2023','228','鹤峰县','3','0','','422828');
INSERT INTO `qb_area` VALUES ('2024','229','芙蓉区','3','0','','430102');
INSERT INTO `qb_area` VALUES ('2025','229','天心区','3','0','','430103');
INSERT INTO `qb_area` VALUES ('2026','229','岳麓区','3','0','','430104');
INSERT INTO `qb_area` VALUES ('2027','229','开福区','3','0','','430105');
INSERT INTO `qb_area` VALUES ('2028','229','雨花区','3','0','','430111');
INSERT INTO `qb_area` VALUES ('2029','229','望城区','3','0','','430112');
INSERT INTO `qb_area` VALUES ('2030','229','长沙县','3','0','','430121');
INSERT INTO `qb_area` VALUES ('2031','229','浏阳市','3','0','','430181');
INSERT INTO `qb_area` VALUES ('2032','229','宁乡市','3','0','','430182');
INSERT INTO `qb_area` VALUES ('2033','230','荷塘区','3','0','','430202');
INSERT INTO `qb_area` VALUES ('2034','230','芦淞区','3','0','','430203');
INSERT INTO `qb_area` VALUES ('2035','230','石峰区','3','0','','430204');
INSERT INTO `qb_area` VALUES ('2036','230','天元区','3','0','','430211');
INSERT INTO `qb_area` VALUES ('2037','230','渌口区','3','0','','430221');
INSERT INTO `qb_area` VALUES ('2038','230','攸县','3','0','','430223');
INSERT INTO `qb_area` VALUES ('2039','230','茶陵县','3','0','','430224');
INSERT INTO `qb_area` VALUES ('2040','230','炎陵县','3','0','','430225');
INSERT INTO `qb_area` VALUES ('2041','230','醴陵市','3','0','','430281');
INSERT INTO `qb_area` VALUES ('2042','231','雨湖区','3','0','','430302');
INSERT INTO `qb_area` VALUES ('2043','231','岳塘区','3','0','','430304');
INSERT INTO `qb_area` VALUES ('2044','231','湘潭县','3','0','','430321');
INSERT INTO `qb_area` VALUES ('2045','231','湘乡市','3','0','','430381');
INSERT INTO `qb_area` VALUES ('2046','231','韶山市','3','0','','430382');
INSERT INTO `qb_area` VALUES ('2047','232','珠晖区','3','0','','430405');
INSERT INTO `qb_area` VALUES ('2048','232','雁峰区','3','0','','430406');
INSERT INTO `qb_area` VALUES ('2049','232','石鼓区','3','0','','430407');
INSERT INTO `qb_area` VALUES ('2050','232','蒸湘区','3','0','','430408');
INSERT INTO `qb_area` VALUES ('2051','232','南岳区','3','0','','430412');
INSERT INTO `qb_area` VALUES ('2052','232','衡阳县','3','0','','430421');
INSERT INTO `qb_area` VALUES ('2053','232','衡南县','3','0','','430422');
INSERT INTO `qb_area` VALUES ('2054','232','衡山县','3','0','','430423');
INSERT INTO `qb_area` VALUES ('2055','232','衡东县','3','0','','430424');
INSERT INTO `qb_area` VALUES ('2056','232','祁东县','3','0','','430426');
INSERT INTO `qb_area` VALUES ('2057','232','耒阳市','3','0','','430481');
INSERT INTO `qb_area` VALUES ('2058','232','常宁市','3','0','','430482');
INSERT INTO `qb_area` VALUES ('2059','233','双清区','3','0','','430502');
INSERT INTO `qb_area` VALUES ('2060','233','大祥区','3','0','','430503');
INSERT INTO `qb_area` VALUES ('2061','233','北塔区','3','0','','430511');
INSERT INTO `qb_area` VALUES ('2062','233','邵东县','3','0','','430521');
INSERT INTO `qb_area` VALUES ('2063','233','新邵县','3','0','','430522');
INSERT INTO `qb_area` VALUES ('2064','233','邵阳县','3','0','','430523');
INSERT INTO `qb_area` VALUES ('2065','233','隆回县','3','0','','430524');
INSERT INTO `qb_area` VALUES ('2066','233','洞口县','3','0','','430525');
INSERT INTO `qb_area` VALUES ('2067','233','绥宁县','3','0','','430527');
INSERT INTO `qb_area` VALUES ('2068','233','新宁县','3','0','','430528');
INSERT INTO `qb_area` VALUES ('2069','233','城步苗族自治县','3','0','','430529');
INSERT INTO `qb_area` VALUES ('2070','233','武冈市','3','0','','430581');
INSERT INTO `qb_area` VALUES ('2071','234','岳阳楼区','3','0','','430602');
INSERT INTO `qb_area` VALUES ('2072','234','云溪区','3','0','','430603');
INSERT INTO `qb_area` VALUES ('2073','234','君山区','3','0','','430611');
INSERT INTO `qb_area` VALUES ('2074','234','岳阳县','3','0','','430621');
INSERT INTO `qb_area` VALUES ('2075','234','华容县','3','0','','430623');
INSERT INTO `qb_area` VALUES ('2076','234','湘阴县','3','0','','430624');
INSERT INTO `qb_area` VALUES ('2077','234','平江县','3','0','','430626');
INSERT INTO `qb_area` VALUES ('2078','234','汨罗市','3','0','','430681');
INSERT INTO `qb_area` VALUES ('2079','234','临湘市','3','0','','430682');
INSERT INTO `qb_area` VALUES ('2080','235','武陵区','3','0','','430702');
INSERT INTO `qb_area` VALUES ('2081','235','鼎城区','3','0','','430703');
INSERT INTO `qb_area` VALUES ('2082','235','安乡县','3','0','','430721');
INSERT INTO `qb_area` VALUES ('2083','235','汉寿县','3','0','','430722');
INSERT INTO `qb_area` VALUES ('2084','235','澧县','3','0','','430723');
INSERT INTO `qb_area` VALUES ('2085','235','临澧县','3','0','','430724');
INSERT INTO `qb_area` VALUES ('2086','235','桃源县','3','0','','430725');
INSERT INTO `qb_area` VALUES ('2087','235','石门县','3','0','','430726');
INSERT INTO `qb_area` VALUES ('2088','235','津市市','3','0','','430781');
INSERT INTO `qb_area` VALUES ('2089','236','永定区','3','0','','430802');
INSERT INTO `qb_area` VALUES ('2090','236','武陵源区','3','0','','430811');
INSERT INTO `qb_area` VALUES ('2091','236','慈利县','3','0','','430821');
INSERT INTO `qb_area` VALUES ('2092','236','桑植县','3','0','','430822');
INSERT INTO `qb_area` VALUES ('2093','237','资阳区','3','0','','430902');
INSERT INTO `qb_area` VALUES ('2094','237','赫山区','3','0','','430903');
INSERT INTO `qb_area` VALUES ('2095','237','南县','3','0','','430921');
INSERT INTO `qb_area` VALUES ('2096','237','桃江县','3','0','','430922');
INSERT INTO `qb_area` VALUES ('2097','237','安化县','3','0','','430923');
INSERT INTO `qb_area` VALUES ('2098','237','沅江市','3','0','','430981');
INSERT INTO `qb_area` VALUES ('2099','238','北湖区','3','0','','431002');
INSERT INTO `qb_area` VALUES ('2100','238','苏仙区','3','0','','431003');
INSERT INTO `qb_area` VALUES ('2101','238','桂阳县','3','0','','431021');
INSERT INTO `qb_area` VALUES ('2102','238','宜章县','3','0','','431022');
INSERT INTO `qb_area` VALUES ('2103','238','永兴县','3','0','','431023');
INSERT INTO `qb_area` VALUES ('2104','238','嘉禾县','3','0','','431024');
INSERT INTO `qb_area` VALUES ('2105','238','临武县','3','0','','431025');
INSERT INTO `qb_area` VALUES ('2106','238','汝城县','3','0','','431026');
INSERT INTO `qb_area` VALUES ('2107','238','桂东县','3','0','','431027');
INSERT INTO `qb_area` VALUES ('2108','238','安仁县','3','0','','431028');
INSERT INTO `qb_area` VALUES ('2109','238','资兴市','3','0','','431081');
INSERT INTO `qb_area` VALUES ('2110','239','零陵区','3','0','','431102');
INSERT INTO `qb_area` VALUES ('2111','239','冷水滩区','3','0','','431103');
INSERT INTO `qb_area` VALUES ('2112','239','祁阳县','3','0','','431121');
INSERT INTO `qb_area` VALUES ('2113','239','东安县','3','0','','431122');
INSERT INTO `qb_area` VALUES ('2114','239','双牌县','3','0','','431123');
INSERT INTO `qb_area` VALUES ('2115','239','道县','3','0','','431124');
INSERT INTO `qb_area` VALUES ('2116','239','江永县','3','0','','431125');
INSERT INTO `qb_area` VALUES ('2117','239','宁远县','3','0','','431126');
INSERT INTO `qb_area` VALUES ('2118','239','蓝山县','3','0','','431127');
INSERT INTO `qb_area` VALUES ('2119','239','新田县','3','0','','431128');
INSERT INTO `qb_area` VALUES ('2120','239','江华瑶族自治县','3','0','','431129');
INSERT INTO `qb_area` VALUES ('2121','240','鹤城区','3','0','','431202');
INSERT INTO `qb_area` VALUES ('2122','240','中方县','3','0','','431221');
INSERT INTO `qb_area` VALUES ('2123','240','沅陵县','3','0','','431222');
INSERT INTO `qb_area` VALUES ('2124','240','辰溪县','3','0','','431223');
INSERT INTO `qb_area` VALUES ('2125','240','溆浦县','3','0','','431224');
INSERT INTO `qb_area` VALUES ('2126','240','会同县','3','0','','431225');
INSERT INTO `qb_area` VALUES ('2127','240','麻阳苗族自治县','3','0','','431226');
INSERT INTO `qb_area` VALUES ('2128','240','新晃侗族自治县','3','0','','431227');
INSERT INTO `qb_area` VALUES ('2129','240','芷江侗族自治县','3','0','','431228');
INSERT INTO `qb_area` VALUES ('2130','240','靖州苗族侗族自治县','3','0','','431229');
INSERT INTO `qb_area` VALUES ('2131','240','通道侗族自治县','3','0','','431230');
INSERT INTO `qb_area` VALUES ('2132','240','洪江市','3','0','','431281');
INSERT INTO `qb_area` VALUES ('2133','241','娄星区','3','0','','431302');
INSERT INTO `qb_area` VALUES ('2134','241','双峰县','3','0','','431321');
INSERT INTO `qb_area` VALUES ('2135','241','新化县','3','0','','431322');
INSERT INTO `qb_area` VALUES ('2136','241','冷水江市','3','0','','431381');
INSERT INTO `qb_area` VALUES ('2137','241','涟源市','3','0','','431382');
INSERT INTO `qb_area` VALUES ('2138','242','吉首市','3','0','','433101');
INSERT INTO `qb_area` VALUES ('2139','242','泸溪县','3','0','','433122');
INSERT INTO `qb_area` VALUES ('2140','242','凤凰县','3','0','','433123');
INSERT INTO `qb_area` VALUES ('2141','242','花垣县','3','0','','433124');
INSERT INTO `qb_area` VALUES ('2142','242','保靖县','3','0','','433125');
INSERT INTO `qb_area` VALUES ('2143','242','古丈县','3','0','','433126');
INSERT INTO `qb_area` VALUES ('2144','242','永顺县','3','0','','433127');
INSERT INTO `qb_area` VALUES ('2145','242','龙山县','3','0','','433130');
INSERT INTO `qb_area` VALUES ('2146','243','荔湾区','3','0','','440103');
INSERT INTO `qb_area` VALUES ('2147','243','越秀区','3','0','','440104');
INSERT INTO `qb_area` VALUES ('2148','243','海珠区','3','0','','440105');
INSERT INTO `qb_area` VALUES ('2149','243','天河区','3','0','','440106');
INSERT INTO `qb_area` VALUES ('2150','243','白云区','3','0','','440111');
INSERT INTO `qb_area` VALUES ('2151','243','黄埔区','3','0','','440112');
INSERT INTO `qb_area` VALUES ('2152','243','番禺区','3','0','','440113');
INSERT INTO `qb_area` VALUES ('2153','243','花都区','3','0','','440114');
INSERT INTO `qb_area` VALUES ('2154','243','南沙区','3','0','','440115');
INSERT INTO `qb_area` VALUES ('2155','243','从化区','3','0','','440117');
INSERT INTO `qb_area` VALUES ('2156','243','增城区','3','0','','440118');
INSERT INTO `qb_area` VALUES ('2157','244','武江区','3','0','','440203');
INSERT INTO `qb_area` VALUES ('2158','244','浈江区','3','0','','440204');
INSERT INTO `qb_area` VALUES ('2159','244','曲江区','3','0','','440205');
INSERT INTO `qb_area` VALUES ('2160','244','始兴县','3','0','','440222');
INSERT INTO `qb_area` VALUES ('2161','244','仁化县','3','0','','440224');
INSERT INTO `qb_area` VALUES ('2162','244','翁源县','3','0','','440229');
INSERT INTO `qb_area` VALUES ('2163','244','乳源瑶族自治县','3','0','','440232');
INSERT INTO `qb_area` VALUES ('2164','244','新丰县','3','0','','440233');
INSERT INTO `qb_area` VALUES ('2165','244','乐昌市','3','0','','440281');
INSERT INTO `qb_area` VALUES ('2166','244','南雄市','3','0','','440282');
INSERT INTO `qb_area` VALUES ('2167','245','罗湖区','3','0','','440303');
INSERT INTO `qb_area` VALUES ('2168','245','福田区','3','0','','440304');
INSERT INTO `qb_area` VALUES ('2169','245','南山区','3','0','','440305');
INSERT INTO `qb_area` VALUES ('2170','245','宝安区','3','0','','440306');
INSERT INTO `qb_area` VALUES ('2171','245','龙岗区','3','0','','440307');
INSERT INTO `qb_area` VALUES ('2172','245','盐田区','3','0','','440308');
INSERT INTO `qb_area` VALUES ('2173','245','龙华区','3','0','','440309');
INSERT INTO `qb_area` VALUES ('2174','245','坪山区','3','0','','440310');
INSERT INTO `qb_area` VALUES ('2175','245','光明区','3','0','','440311');
INSERT INTO `qb_area` VALUES ('2176','246','香洲区','3','0','','440402');
INSERT INTO `qb_area` VALUES ('2177','246','斗门区','3','0','','440403');
INSERT INTO `qb_area` VALUES ('2178','246','金湾区','3','0','','440404');
INSERT INTO `qb_area` VALUES ('2179','247','龙湖区','3','0','','440507');
INSERT INTO `qb_area` VALUES ('2180','247','金平区','3','0','','440511');
INSERT INTO `qb_area` VALUES ('2181','247','濠江区','3','0','','440512');
INSERT INTO `qb_area` VALUES ('2182','247','潮阳区','3','0','','440513');
INSERT INTO `qb_area` VALUES ('2183','247','潮南区','3','0','','440514');
INSERT INTO `qb_area` VALUES ('2184','247','澄海区','3','0','','440515');
INSERT INTO `qb_area` VALUES ('2185','247','南澳县','3','0','','440523');
INSERT INTO `qb_area` VALUES ('2186','248','禅城区','3','0','','440604');
INSERT INTO `qb_area` VALUES ('2187','248','南海区','3','0','','440605');
INSERT INTO `qb_area` VALUES ('2188','248','顺德区','3','0','','440606');
INSERT INTO `qb_area` VALUES ('2189','248','三水区','3','0','','440607');
INSERT INTO `qb_area` VALUES ('2190','248','高明区','3','0','','440608');
INSERT INTO `qb_area` VALUES ('2191','249','蓬江区','3','0','','440703');
INSERT INTO `qb_area` VALUES ('2192','249','江海区','3','0','','440704');
INSERT INTO `qb_area` VALUES ('2193','249','新会区','3','0','','440705');
INSERT INTO `qb_area` VALUES ('2194','249','台山市','3','0','','440781');
INSERT INTO `qb_area` VALUES ('2195','249','开平市','3','0','','440783');
INSERT INTO `qb_area` VALUES ('2196','249','鹤山市','3','0','','440784');
INSERT INTO `qb_area` VALUES ('2197','249','恩平市','3','0','','440785');
INSERT INTO `qb_area` VALUES ('2198','250','赤坎区','3','0','','440802');
INSERT INTO `qb_area` VALUES ('2199','250','霞山区','3','0','','440803');
INSERT INTO `qb_area` VALUES ('2200','250','坡头区','3','0','','440804');
INSERT INTO `qb_area` VALUES ('2201','250','麻章区','3','0','','440811');
INSERT INTO `qb_area` VALUES ('2202','250','遂溪县','3','0','','440823');
INSERT INTO `qb_area` VALUES ('2203','250','徐闻县','3','0','','440825');
INSERT INTO `qb_area` VALUES ('2204','250','廉江市','3','0','','440881');
INSERT INTO `qb_area` VALUES ('2205','250','雷州市','3','0','','440882');
INSERT INTO `qb_area` VALUES ('2206','250','吴川市','3','0','','440883');
INSERT INTO `qb_area` VALUES ('2207','251','茂南区','3','0','','440902');
INSERT INTO `qb_area` VALUES ('2208','251','电白区','3','0','','440904');
INSERT INTO `qb_area` VALUES ('2209','251','高州市','3','0','','440981');
INSERT INTO `qb_area` VALUES ('2210','251','化州市','3','0','','440982');
INSERT INTO `qb_area` VALUES ('2211','251','信宜市','3','0','','440983');
INSERT INTO `qb_area` VALUES ('2212','252','端州区','3','0','','441202');
INSERT INTO `qb_area` VALUES ('2213','252','鼎湖区','3','0','','441203');
INSERT INTO `qb_area` VALUES ('2214','252','高要区','3','0','','441204');
INSERT INTO `qb_area` VALUES ('2215','252','广宁县','3','0','','441223');
INSERT INTO `qb_area` VALUES ('2216','252','怀集县','3','0','','441224');
INSERT INTO `qb_area` VALUES ('2217','252','封开县','3','0','','441225');
INSERT INTO `qb_area` VALUES ('2218','252','德庆县','3','0','','441226');
INSERT INTO `qb_area` VALUES ('2219','252','四会市','3','0','','441284');
INSERT INTO `qb_area` VALUES ('2220','253','惠城区','3','0','','441302');
INSERT INTO `qb_area` VALUES ('2221','253','惠阳区','3','0','','441303');
INSERT INTO `qb_area` VALUES ('2222','253','博罗县','3','0','','441322');
INSERT INTO `qb_area` VALUES ('2223','253','惠东县','3','0','','441323');
INSERT INTO `qb_area` VALUES ('2224','253','龙门县','3','0','','441324');
INSERT INTO `qb_area` VALUES ('2225','254','梅江区','3','0','','441402');
INSERT INTO `qb_area` VALUES ('2226','254','梅县区','3','0','','441403');
INSERT INTO `qb_area` VALUES ('2227','254','大埔县','3','0','','441422');
INSERT INTO `qb_area` VALUES ('2228','254','丰顺县','3','0','','441423');
INSERT INTO `qb_area` VALUES ('2229','254','五华县','3','0','','441424');
INSERT INTO `qb_area` VALUES ('2230','254','平远县','3','0','','441426');
INSERT INTO `qb_area` VALUES ('2231','254','蕉岭县','3','0','','441427');
INSERT INTO `qb_area` VALUES ('2232','254','兴宁市','3','0','','441481');
INSERT INTO `qb_area` VALUES ('2233','255','城区','3','0','','441502');
INSERT INTO `qb_area` VALUES ('2234','255','海丰县','3','0','','441521');
INSERT INTO `qb_area` VALUES ('2235','255','陆河县','3','0','','441523');
INSERT INTO `qb_area` VALUES ('2236','255','陆丰市','3','0','','441581');
INSERT INTO `qb_area` VALUES ('2237','256','源城区','3','0','','441602');
INSERT INTO `qb_area` VALUES ('2238','256','紫金县','3','0','','441621');
INSERT INTO `qb_area` VALUES ('2239','256','龙川县','3','0','','441622');
INSERT INTO `qb_area` VALUES ('2240','256','连平县','3','0','','441623');
INSERT INTO `qb_area` VALUES ('2241','256','和平县','3','0','','441624');
INSERT INTO `qb_area` VALUES ('2242','256','东源县','3','0','','441625');
INSERT INTO `qb_area` VALUES ('2243','257','江城区','3','0','','441702');
INSERT INTO `qb_area` VALUES ('2244','257','阳东区','3','0','','441704');
INSERT INTO `qb_area` VALUES ('2245','257','阳西县','3','0','','441721');
INSERT INTO `qb_area` VALUES ('2246','257','阳春市','3','0','','441781');
INSERT INTO `qb_area` VALUES ('2247','258','清城区','3','0','','441802');
INSERT INTO `qb_area` VALUES ('2248','258','清新区','3','0','','441803');
INSERT INTO `qb_area` VALUES ('2249','258','佛冈县','3','0','','441821');
INSERT INTO `qb_area` VALUES ('2250','258','阳山县','3','0','','441823');
INSERT INTO `qb_area` VALUES ('2251','258','连山壮族瑶族自治县','3','0','','441825');
INSERT INTO `qb_area` VALUES ('2252','258','连南瑶族自治县','3','0','','441826');
INSERT INTO `qb_area` VALUES ('2253','258','英德市','3','0','','441881');
INSERT INTO `qb_area` VALUES ('2254','258','连州市','3','0','','441882');
INSERT INTO `qb_area` VALUES ('2255','261','湘桥区','3','0','','445102');
INSERT INTO `qb_area` VALUES ('2256','261','潮安区','3','0','','445103');
INSERT INTO `qb_area` VALUES ('2257','261','饶平县','3','0','','445122');
INSERT INTO `qb_area` VALUES ('2258','262','榕城区','3','0','','445202');
INSERT INTO `qb_area` VALUES ('2259','262','揭东区','3','0','','445203');
INSERT INTO `qb_area` VALUES ('2260','262','揭西县','3','0','','445222');
INSERT INTO `qb_area` VALUES ('2261','262','惠来县','3','0','','445224');
INSERT INTO `qb_area` VALUES ('2262','262','普宁市','3','0','','445281');
INSERT INTO `qb_area` VALUES ('2263','263','云城区','3','0','','445302');
INSERT INTO `qb_area` VALUES ('2264','263','云安区','3','0','','445303');
INSERT INTO `qb_area` VALUES ('2265','263','新兴县','3','0','','445321');
INSERT INTO `qb_area` VALUES ('2266','263','郁南县','3','0','','445322');
INSERT INTO `qb_area` VALUES ('2267','263','罗定市','3','0','','445381');
INSERT INTO `qb_area` VALUES ('2268','264','兴宁区','3','0','','450102');
INSERT INTO `qb_area` VALUES ('2269','264','青秀区','3','0','','450103');
INSERT INTO `qb_area` VALUES ('2270','264','江南区','3','0','','450105');
INSERT INTO `qb_area` VALUES ('2271','264','西乡塘区','3','0','','450107');
INSERT INTO `qb_area` VALUES ('2272','264','良庆区','3','0','','450108');
INSERT INTO `qb_area` VALUES ('2273','264','邕宁区','3','0','','450109');
INSERT INTO `qb_area` VALUES ('2274','264','武鸣区','3','0','','450110');
INSERT INTO `qb_area` VALUES ('2275','264','隆安县','3','0','','450123');
INSERT INTO `qb_area` VALUES ('2276','264','马山县','3','0','','450124');
INSERT INTO `qb_area` VALUES ('2277','264','上林县','3','0','','450125');
INSERT INTO `qb_area` VALUES ('2278','264','宾阳县','3','0','','450126');
INSERT INTO `qb_area` VALUES ('2279','264','横县','3','0','','450127');
INSERT INTO `qb_area` VALUES ('2280','265','城中区','3','0','','450202');
INSERT INTO `qb_area` VALUES ('2281','265','鱼峰区','3','0','','450203');
INSERT INTO `qb_area` VALUES ('2282','265','柳南区','3','0','','450204');
INSERT INTO `qb_area` VALUES ('2283','265','柳北区','3','0','','450205');
INSERT INTO `qb_area` VALUES ('2284','265','柳江区','3','0','','450206');
INSERT INTO `qb_area` VALUES ('2285','265','柳城县','3','0','','450222');
INSERT INTO `qb_area` VALUES ('2286','265','鹿寨县','3','0','','450223');
INSERT INTO `qb_area` VALUES ('2287','265','融安县','3','0','','450224');
INSERT INTO `qb_area` VALUES ('2288','265','融水苗族自治县','3','0','','450225');
INSERT INTO `qb_area` VALUES ('2289','265','三江侗族自治县','3','0','','450226');
INSERT INTO `qb_area` VALUES ('2290','266','秀峰区','3','0','','450302');
INSERT INTO `qb_area` VALUES ('2291','266','叠彩区','3','0','','450303');
INSERT INTO `qb_area` VALUES ('2292','266','象山区','3','0','','450304');
INSERT INTO `qb_area` VALUES ('2293','266','七星区','3','0','','450305');
INSERT INTO `qb_area` VALUES ('2294','266','雁山区','3','0','','450311');
INSERT INTO `qb_area` VALUES ('2295','266','临桂区','3','0','','450312');
INSERT INTO `qb_area` VALUES ('2296','266','阳朔县','3','0','','450321');
INSERT INTO `qb_area` VALUES ('2297','266','灵川县','3','0','','450323');
INSERT INTO `qb_area` VALUES ('2298','266','全州县','3','0','','450324');
INSERT INTO `qb_area` VALUES ('2299','266','兴安县','3','0','','450325');
INSERT INTO `qb_area` VALUES ('2300','266','永福县','3','0','','450326');
INSERT INTO `qb_area` VALUES ('2301','266','灌阳县','3','0','','450327');
INSERT INTO `qb_area` VALUES ('2302','266','龙胜各族自治县','3','0','','450328');
INSERT INTO `qb_area` VALUES ('2303','266','资源县','3','0','','450329');
INSERT INTO `qb_area` VALUES ('2304','266','平乐县','3','0','','450330');
INSERT INTO `qb_area` VALUES ('2305','266','荔浦市','3','0','','450331');
INSERT INTO `qb_area` VALUES ('2306','266','恭城瑶族自治县','3','0','','450332');
INSERT INTO `qb_area` VALUES ('2307','267','万秀区','3','0','','450403');
INSERT INTO `qb_area` VALUES ('2308','267','长洲区','3','0','','450405');
INSERT INTO `qb_area` VALUES ('2309','267','龙圩区','3','0','','450406');
INSERT INTO `qb_area` VALUES ('2310','267','苍梧县','3','0','','450421');
INSERT INTO `qb_area` VALUES ('2311','267','藤县','3','0','','450422');
INSERT INTO `qb_area` VALUES ('2312','267','蒙山县','3','0','','450423');
INSERT INTO `qb_area` VALUES ('2313','267','岑溪市','3','0','','450481');
INSERT INTO `qb_area` VALUES ('2314','268','海城区','3','0','','450502');
INSERT INTO `qb_area` VALUES ('2315','268','银海区','3','0','','450503');
INSERT INTO `qb_area` VALUES ('2316','268','铁山港区','3','0','','450512');
INSERT INTO `qb_area` VALUES ('2317','268','合浦县','3','0','','450521');
INSERT INTO `qb_area` VALUES ('2318','269','港口区','3','0','','450602');
INSERT INTO `qb_area` VALUES ('2319','269','防城区','3','0','','450603');
INSERT INTO `qb_area` VALUES ('2320','269','上思县','3','0','','450621');
INSERT INTO `qb_area` VALUES ('2321','269','东兴市','3','0','','450681');
INSERT INTO `qb_area` VALUES ('2322','270','钦南区','3','0','','450702');
INSERT INTO `qb_area` VALUES ('2323','270','钦北区','3','0','','450703');
INSERT INTO `qb_area` VALUES ('2324','270','灵山县','3','0','','450721');
INSERT INTO `qb_area` VALUES ('2325','270','浦北县','3','0','','450722');
INSERT INTO `qb_area` VALUES ('2326','271','港北区','3','0','','450802');
INSERT INTO `qb_area` VALUES ('2327','271','港南区','3','0','','450803');
INSERT INTO `qb_area` VALUES ('2328','271','覃塘区','3','0','','450804');
INSERT INTO `qb_area` VALUES ('2329','271','平南县','3','0','','450821');
INSERT INTO `qb_area` VALUES ('2330','271','桂平市','3','0','','450881');
INSERT INTO `qb_area` VALUES ('2331','272','玉州区','3','0','','450902');
INSERT INTO `qb_area` VALUES ('2332','272','福绵区','3','0','','450903');
INSERT INTO `qb_area` VALUES ('2333','272','容县','3','0','','450921');
INSERT INTO `qb_area` VALUES ('2334','272','陆川县','3','0','','450922');
INSERT INTO `qb_area` VALUES ('2335','272','博白县','3','0','','450923');
INSERT INTO `qb_area` VALUES ('2336','272','兴业县','3','0','','450924');
INSERT INTO `qb_area` VALUES ('2337','272','北流市','3','0','','450981');
INSERT INTO `qb_area` VALUES ('2338','273','右江区','3','0','','451002');
INSERT INTO `qb_area` VALUES ('2339','273','田阳县','3','0','','451021');
INSERT INTO `qb_area` VALUES ('2340','273','田东县','3','0','','451022');
INSERT INTO `qb_area` VALUES ('2341','273','平果县','3','0','','451023');
INSERT INTO `qb_area` VALUES ('2342','273','德保县','3','0','','451024');
INSERT INTO `qb_area` VALUES ('2343','273','那坡县','3','0','','451026');
INSERT INTO `qb_area` VALUES ('2344','273','凌云县','3','0','','451027');
INSERT INTO `qb_area` VALUES ('2345','273','乐业县','3','0','','451028');
INSERT INTO `qb_area` VALUES ('2346','273','田林县','3','0','','451029');
INSERT INTO `qb_area` VALUES ('2347','273','西林县','3','0','','451030');
INSERT INTO `qb_area` VALUES ('2348','273','隆林各族自治县','3','0','','451031');
INSERT INTO `qb_area` VALUES ('2349','273','靖西市','3','0','','451081');
INSERT INTO `qb_area` VALUES ('2350','274','八步区','3','0','','451102');
INSERT INTO `qb_area` VALUES ('2351','274','平桂区','3','0','','451103');
INSERT INTO `qb_area` VALUES ('2352','274','昭平县','3','0','','451121');
INSERT INTO `qb_area` VALUES ('2353','274','钟山县','3','0','','451122');
INSERT INTO `qb_area` VALUES ('2354','274','富川瑶族自治县','3','0','','451123');
INSERT INTO `qb_area` VALUES ('2355','275','金城江区','3','0','','451202');
INSERT INTO `qb_area` VALUES ('2356','275','宜州区','3','0','','451203');
INSERT INTO `qb_area` VALUES ('2357','275','南丹县','3','0','','451221');
INSERT INTO `qb_area` VALUES ('2358','275','天峨县','3','0','','451222');
INSERT INTO `qb_area` VALUES ('2359','275','凤山县','3','0','','451223');
INSERT INTO `qb_area` VALUES ('2360','275','东兰县','3','0','','451224');
INSERT INTO `qb_area` VALUES ('2361','275','罗城仫佬族自治县','3','0','','451225');
INSERT INTO `qb_area` VALUES ('2362','275','环江毛南族自治县','3','0','','451226');
INSERT INTO `qb_area` VALUES ('2363','275','巴马瑶族自治县','3','0','','451227');
INSERT INTO `qb_area` VALUES ('2364','275','都安瑶族自治县','3','0','','451228');
INSERT INTO `qb_area` VALUES ('2365','275','大化瑶族自治县','3','0','','451229');
INSERT INTO `qb_area` VALUES ('2366','276','兴宾区','3','0','','451302');
INSERT INTO `qb_area` VALUES ('2367','276','忻城县','3','0','','451321');
INSERT INTO `qb_area` VALUES ('2368','276','象州县','3','0','','451322');
INSERT INTO `qb_area` VALUES ('2369','276','武宣县','3','0','','451323');
INSERT INTO `qb_area` VALUES ('2370','276','金秀瑶族自治县','3','0','','451324');
INSERT INTO `qb_area` VALUES ('2371','276','合山市','3','0','','451381');
INSERT INTO `qb_area` VALUES ('2372','277','江州区','3','0','','451402');
INSERT INTO `qb_area` VALUES ('2373','277','扶绥县','3','0','','451421');
INSERT INTO `qb_area` VALUES ('2374','277','宁明县','3','0','','451422');
INSERT INTO `qb_area` VALUES ('2375','277','龙州县','3','0','','451423');
INSERT INTO `qb_area` VALUES ('2376','277','大新县','3','0','','451424');
INSERT INTO `qb_area` VALUES ('2377','277','天等县','3','0','','451425');
INSERT INTO `qb_area` VALUES ('2378','277','凭祥市','3','0','','451481');
INSERT INTO `qb_area` VALUES ('2379','278','秀英区','3','0','','460105');
INSERT INTO `qb_area` VALUES ('2380','278','龙华区','3','0','','460106');
INSERT INTO `qb_area` VALUES ('2381','278','琼山区','3','0','','460107');
INSERT INTO `qb_area` VALUES ('2382','278','美兰区','3','0','','460108');
INSERT INTO `qb_area` VALUES ('2383','279','海棠区','3','0','','460202');
INSERT INTO `qb_area` VALUES ('2384','279','吉阳区','3','0','','460203');
INSERT INTO `qb_area` VALUES ('2385','279','天涯区','3','0','','460204');
INSERT INTO `qb_area` VALUES ('2386','279','崖州区','3','0','','460205');
INSERT INTO `qb_area` VALUES ('2387','280','西沙群岛','3','0','','460321');
INSERT INTO `qb_area` VALUES ('2388','280','南沙群岛','3','0','','460322');
INSERT INTO `qb_area` VALUES ('2389','280','中沙群岛的岛礁及其海域','3','0','','460323');
INSERT INTO `qb_area` VALUES ('2390','280','永乐群岛','3','0','','460324');
INSERT INTO `qb_area` VALUES ('2391','282','锦江区','3','0','','510104');
INSERT INTO `qb_area` VALUES ('2392','282','青羊区','3','0','','510105');
INSERT INTO `qb_area` VALUES ('2393','282','金牛区','3','0','','510106');
INSERT INTO `qb_area` VALUES ('2394','282','武侯区','3','0','','510107');
INSERT INTO `qb_area` VALUES ('2395','282','成华区','3','0','','510108');
INSERT INTO `qb_area` VALUES ('2396','282','龙泉驿区','3','0','','510112');
INSERT INTO `qb_area` VALUES ('2397','282','青白江区','3','0','','510113');
INSERT INTO `qb_area` VALUES ('2398','282','新都区','3','0','','510114');
INSERT INTO `qb_area` VALUES ('2399','282','温江区','3','0','','510115');
INSERT INTO `qb_area` VALUES ('2400','282','双流区','3','0','','510116');
INSERT INTO `qb_area` VALUES ('2401','282','郫都区','3','0','','510117');
INSERT INTO `qb_area` VALUES ('2402','282','金堂县','3','0','','510121');
INSERT INTO `qb_area` VALUES ('2403','282','大邑县','3','0','','510129');
INSERT INTO `qb_area` VALUES ('2404','282','蒲江县','3','0','','510131');
INSERT INTO `qb_area` VALUES ('2405','282','新津县','3','0','','510132');
INSERT INTO `qb_area` VALUES ('2406','282','都江堰市','3','0','','510181');
INSERT INTO `qb_area` VALUES ('2407','282','彭州市','3','0','','510182');
INSERT INTO `qb_area` VALUES ('2408','282','邛崃市','3','0','','510183');
INSERT INTO `qb_area` VALUES ('2409','282','崇州市','3','0','','510184');
INSERT INTO `qb_area` VALUES ('2410','282','简阳市','3','0','','510185');
INSERT INTO `qb_area` VALUES ('2411','283','自流井区','3','0','','510302');
INSERT INTO `qb_area` VALUES ('2412','283','贡井区','3','0','','510303');
INSERT INTO `qb_area` VALUES ('2413','283','大安区','3','0','','510304');
INSERT INTO `qb_area` VALUES ('2414','283','沿滩区','3','0','','510311');
INSERT INTO `qb_area` VALUES ('2415','283','荣县','3','0','','510321');
INSERT INTO `qb_area` VALUES ('2416','283','富顺县','3','0','','510322');
INSERT INTO `qb_area` VALUES ('2417','284','东区','3','0','','510402');
INSERT INTO `qb_area` VALUES ('2418','284','西区','3','0','','510403');
INSERT INTO `qb_area` VALUES ('2419','284','仁和区','3','0','','510411');
INSERT INTO `qb_area` VALUES ('2420','284','米易县','3','0','','510421');
INSERT INTO `qb_area` VALUES ('2421','284','盐边县','3','0','','510422');
INSERT INTO `qb_area` VALUES ('2422','285','江阳区','3','0','','510502');
INSERT INTO `qb_area` VALUES ('2423','285','纳溪区','3','0','','510503');
INSERT INTO `qb_area` VALUES ('2424','285','龙马潭区','3','0','','510504');
INSERT INTO `qb_area` VALUES ('2425','285','泸县','3','0','','510521');
INSERT INTO `qb_area` VALUES ('2426','285','合江县','3','0','','510522');
INSERT INTO `qb_area` VALUES ('2427','285','叙永县','3','0','','510524');
INSERT INTO `qb_area` VALUES ('2428','285','古蔺县','3','0','','510525');
INSERT INTO `qb_area` VALUES ('2429','286','旌阳区','3','0','','510603');
INSERT INTO `qb_area` VALUES ('2430','286','罗江区','3','0','','510604');
INSERT INTO `qb_area` VALUES ('2431','286','中江县','3','0','','510623');
INSERT INTO `qb_area` VALUES ('2432','286','广汉市','3','0','','510681');
INSERT INTO `qb_area` VALUES ('2433','286','什邡市','3','0','','510682');
INSERT INTO `qb_area` VALUES ('2434','286','绵竹市','3','0','','510683');
INSERT INTO `qb_area` VALUES ('2435','287','涪城区','3','0','','510703');
INSERT INTO `qb_area` VALUES ('2436','287','游仙区','3','0','','510704');
INSERT INTO `qb_area` VALUES ('2437','287','安州区','3','0','','510705');
INSERT INTO `qb_area` VALUES ('2438','287','三台县','3','0','','510722');
INSERT INTO `qb_area` VALUES ('2439','287','盐亭县','3','0','','510723');
INSERT INTO `qb_area` VALUES ('2440','287','梓潼县','3','0','','510725');
INSERT INTO `qb_area` VALUES ('2441','287','北川羌族自治县','3','0','','510726');
INSERT INTO `qb_area` VALUES ('2442','287','平武县','3','0','','510727');
INSERT INTO `qb_area` VALUES ('2443','287','江油市','3','0','','510781');
INSERT INTO `qb_area` VALUES ('2444','288','利州区','3','0','','510802');
INSERT INTO `qb_area` VALUES ('2445','288','昭化区','3','0','','510811');
INSERT INTO `qb_area` VALUES ('2446','288','朝天区','3','0','','510812');
INSERT INTO `qb_area` VALUES ('2447','288','旺苍县','3','0','','510821');
INSERT INTO `qb_area` VALUES ('2448','288','青川县','3','0','','510822');
INSERT INTO `qb_area` VALUES ('2449','288','剑阁县','3','0','','510823');
INSERT INTO `qb_area` VALUES ('2450','288','苍溪县','3','0','','510824');
INSERT INTO `qb_area` VALUES ('2451','289','船山区','3','0','','510903');
INSERT INTO `qb_area` VALUES ('2452','289','安居区','3','0','','510904');
INSERT INTO `qb_area` VALUES ('2453','289','蓬溪县','3','0','','510921');
INSERT INTO `qb_area` VALUES ('2454','289','射洪县','3','0','','510922');
INSERT INTO `qb_area` VALUES ('2455','289','大英县','3','0','','510923');
INSERT INTO `qb_area` VALUES ('2456','290','市中区','3','0','','511002');
INSERT INTO `qb_area` VALUES ('2457','290','东兴区','3','0','','511011');
INSERT INTO `qb_area` VALUES ('2458','290','威远县','3','0','','511024');
INSERT INTO `qb_area` VALUES ('2459','290','资中县','3','0','','511025');
INSERT INTO `qb_area` VALUES ('2460','290','隆昌市','3','0','','511083');
INSERT INTO `qb_area` VALUES ('2461','291','市中区','3','0','','511102');
INSERT INTO `qb_area` VALUES ('2462','291','沙湾区','3','0','','511111');
INSERT INTO `qb_area` VALUES ('2463','291','五通桥区','3','0','','511112');
INSERT INTO `qb_area` VALUES ('2464','291','金口河区','3','0','','511113');
INSERT INTO `qb_area` VALUES ('2465','291','犍为县','3','0','','511123');
INSERT INTO `qb_area` VALUES ('2466','291','井研县','3','0','','511124');
INSERT INTO `qb_area` VALUES ('2467','291','夹江县','3','0','','511126');
INSERT INTO `qb_area` VALUES ('2468','291','沐川县','3','0','','511129');
INSERT INTO `qb_area` VALUES ('2469','291','峨边彝族自治县','3','0','','511132');
INSERT INTO `qb_area` VALUES ('2470','291','马边彝族自治县','3','0','','511133');
INSERT INTO `qb_area` VALUES ('2471','291','峨眉山市','3','0','','511181');
INSERT INTO `qb_area` VALUES ('2472','292','顺庆区','3','0','','511302');
INSERT INTO `qb_area` VALUES ('2473','292','高坪区','3','0','','511303');
INSERT INTO `qb_area` VALUES ('2474','292','嘉陵区','3','0','','511304');
INSERT INTO `qb_area` VALUES ('2475','292','南部县','3','0','','511321');
INSERT INTO `qb_area` VALUES ('2476','292','营山县','3','0','','511322');
INSERT INTO `qb_area` VALUES ('2477','292','蓬安县','3','0','','511323');
INSERT INTO `qb_area` VALUES ('2478','292','仪陇县','3','0','','511324');
INSERT INTO `qb_area` VALUES ('2479','292','西充县','3','0','','511325');
INSERT INTO `qb_area` VALUES ('2480','292','阆中市','3','0','','511381');
INSERT INTO `qb_area` VALUES ('2481','293','东坡区','3','0','','511402');
INSERT INTO `qb_area` VALUES ('2482','293','彭山区','3','0','','511403');
INSERT INTO `qb_area` VALUES ('2483','293','仁寿县','3','0','','511421');
INSERT INTO `qb_area` VALUES ('2484','293','洪雅县','3','0','','511423');
INSERT INTO `qb_area` VALUES ('2485','293','丹棱县','3','0','','511424');
INSERT INTO `qb_area` VALUES ('2486','293','青神县','3','0','','511425');
INSERT INTO `qb_area` VALUES ('2487','294','翠屏区','3','0','','511502');
INSERT INTO `qb_area` VALUES ('2488','294','南溪区','3','0','','511503');
INSERT INTO `qb_area` VALUES ('2489','294','叙州区','3','0','','511504');
INSERT INTO `qb_area` VALUES ('2490','294','江安县','3','0','','511523');
INSERT INTO `qb_area` VALUES ('2491','294','长宁县','3','0','','511524');
INSERT INTO `qb_area` VALUES ('2492','294','高县','3','0','','511525');
INSERT INTO `qb_area` VALUES ('2493','294','珙县','3','0','','511526');
INSERT INTO `qb_area` VALUES ('2494','294','筠连县','3','0','','511527');
INSERT INTO `qb_area` VALUES ('2495','294','兴文县','3','0','','511528');
INSERT INTO `qb_area` VALUES ('2496','294','屏山县','3','0','','511529');
INSERT INTO `qb_area` VALUES ('2497','295','广安区','3','0','','511602');
INSERT INTO `qb_area` VALUES ('2498','295','前锋区','3','0','','511603');
INSERT INTO `qb_area` VALUES ('2499','295','岳池县','3','0','','511621');
INSERT INTO `qb_area` VALUES ('2500','295','武胜县','3','0','','511622');
INSERT INTO `qb_area` VALUES ('2501','295','邻水县','3','0','','511623');
INSERT INTO `qb_area` VALUES ('2502','295','华蓥市','3','0','','511681');
INSERT INTO `qb_area` VALUES ('2503','296','通川区','3','0','','511702');
INSERT INTO `qb_area` VALUES ('2504','296','达川区','3','0','','511703');
INSERT INTO `qb_area` VALUES ('2505','296','宣汉县','3','0','','511722');
INSERT INTO `qb_area` VALUES ('2506','296','开江县','3','0','','511723');
INSERT INTO `qb_area` VALUES ('2507','296','大竹县','3','0','','511724');
INSERT INTO `qb_area` VALUES ('2508','296','渠县','3','0','','511725');
INSERT INTO `qb_area` VALUES ('2509','296','万源市','3','0','','511781');
INSERT INTO `qb_area` VALUES ('2510','297','雨城区','3','0','','511802');
INSERT INTO `qb_area` VALUES ('2511','297','名山区','3','0','','511803');
INSERT INTO `qb_area` VALUES ('2512','297','荥经县','3','0','','511822');
INSERT INTO `qb_area` VALUES ('2513','297','汉源县','3','0','','511823');
INSERT INTO `qb_area` VALUES ('2514','297','石棉县','3','0','','511824');
INSERT INTO `qb_area` VALUES ('2515','297','天全县','3','0','','511825');
INSERT INTO `qb_area` VALUES ('2516','297','芦山县','3','0','','511826');
INSERT INTO `qb_area` VALUES ('2517','297','宝兴县','3','0','','511827');
INSERT INTO `qb_area` VALUES ('2518','298','巴州区','3','0','','511902');
INSERT INTO `qb_area` VALUES ('2519','298','恩阳区','3','0','','511903');
INSERT INTO `qb_area` VALUES ('2520','298','通江县','3','0','','511921');
INSERT INTO `qb_area` VALUES ('2521','298','南江县','3','0','','511922');
INSERT INTO `qb_area` VALUES ('2522','298','平昌县','3','0','','511923');
INSERT INTO `qb_area` VALUES ('2523','299','雁江区','3','0','','512002');
INSERT INTO `qb_area` VALUES ('2524','299','安岳县','3','0','','512021');
INSERT INTO `qb_area` VALUES ('2525','299','乐至县','3','0','','512022');
INSERT INTO `qb_area` VALUES ('2526','300','马尔康市','3','0','','513201');
INSERT INTO `qb_area` VALUES ('2527','300','汶川县','3','0','','513221');
INSERT INTO `qb_area` VALUES ('2528','300','理县','3','0','','513222');
INSERT INTO `qb_area` VALUES ('2529','300','茂县','3','0','','513223');
INSERT INTO `qb_area` VALUES ('2530','300','松潘县','3','0','','513224');
INSERT INTO `qb_area` VALUES ('2531','300','九寨沟县','3','0','','513225');
INSERT INTO `qb_area` VALUES ('2532','300','金川县','3','0','','513226');
INSERT INTO `qb_area` VALUES ('2533','300','小金县','3','0','','513227');
INSERT INTO `qb_area` VALUES ('2534','300','黑水县','3','0','','513228');
INSERT INTO `qb_area` VALUES ('2535','300','壤塘县','3','0','','513230');
INSERT INTO `qb_area` VALUES ('2536','300','阿坝县','3','0','','513231');
INSERT INTO `qb_area` VALUES ('2537','300','若尔盖县','3','0','','513232');
INSERT INTO `qb_area` VALUES ('2538','300','红原县','3','0','','513233');
INSERT INTO `qb_area` VALUES ('2539','301','康定市','3','0','','513301');
INSERT INTO `qb_area` VALUES ('2540','301','泸定县','3','0','','513322');
INSERT INTO `qb_area` VALUES ('2541','301','丹巴县','3','0','','513323');
INSERT INTO `qb_area` VALUES ('2542','301','九龙县','3','0','','513324');
INSERT INTO `qb_area` VALUES ('2543','301','雅江县','3','0','','513325');
INSERT INTO `qb_area` VALUES ('2544','301','道孚县','3','0','','513326');
INSERT INTO `qb_area` VALUES ('2545','301','炉霍县','3','0','','513327');
INSERT INTO `qb_area` VALUES ('2546','301','甘孜县','3','0','','513328');
INSERT INTO `qb_area` VALUES ('2547','301','新龙县','3','0','','513329');
INSERT INTO `qb_area` VALUES ('2548','301','德格县','3','0','','513330');
INSERT INTO `qb_area` VALUES ('2549','301','白玉县','3','0','','513331');
INSERT INTO `qb_area` VALUES ('2550','301','石渠县','3','0','','513332');
INSERT INTO `qb_area` VALUES ('2551','301','色达县','3','0','','513333');
INSERT INTO `qb_area` VALUES ('2552','301','理塘县','3','0','','513334');
INSERT INTO `qb_area` VALUES ('2553','301','巴塘县','3','0','','513335');
INSERT INTO `qb_area` VALUES ('2554','301','乡城县','3','0','','513336');
INSERT INTO `qb_area` VALUES ('2555','301','稻城县','3','0','','513337');
INSERT INTO `qb_area` VALUES ('2556','301','得荣县','3','0','','513338');
INSERT INTO `qb_area` VALUES ('2557','302','西昌市','3','0','','513401');
INSERT INTO `qb_area` VALUES ('2558','302','木里藏族自治县','3','0','','513422');
INSERT INTO `qb_area` VALUES ('2559','302','盐源县','3','0','','513423');
INSERT INTO `qb_area` VALUES ('2560','302','德昌县','3','0','','513424');
INSERT INTO `qb_area` VALUES ('2561','302','会理县','3','0','','513425');
INSERT INTO `qb_area` VALUES ('2562','302','会东县','3','0','','513426');
INSERT INTO `qb_area` VALUES ('2563','302','宁南县','3','0','','513427');
INSERT INTO `qb_area` VALUES ('2564','302','普格县','3','0','','513428');
INSERT INTO `qb_area` VALUES ('2565','302','布拖县','3','0','','513429');
INSERT INTO `qb_area` VALUES ('2566','302','金阳县','3','0','','513430');
INSERT INTO `qb_area` VALUES ('2567','302','昭觉县','3','0','','513431');
INSERT INTO `qb_area` VALUES ('2568','302','喜德县','3','0','','513432');
INSERT INTO `qb_area` VALUES ('2569','302','冕宁县','3','0','','513433');
INSERT INTO `qb_area` VALUES ('2570','302','越西县','3','0','','513434');
INSERT INTO `qb_area` VALUES ('2571','302','甘洛县','3','0','','513435');
INSERT INTO `qb_area` VALUES ('2572','302','美姑县','3','0','','513436');
INSERT INTO `qb_area` VALUES ('2573','302','雷波县','3','0','','513437');
INSERT INTO `qb_area` VALUES ('2574','303','南明区','3','0','','520102');
INSERT INTO `qb_area` VALUES ('2575','303','云岩区','3','0','','520103');
INSERT INTO `qb_area` VALUES ('2576','303','花溪区','3','0','','520111');
INSERT INTO `qb_area` VALUES ('2577','303','乌当区','3','0','','520112');
INSERT INTO `qb_area` VALUES ('2578','303','白云区','3','0','','520113');
INSERT INTO `qb_area` VALUES ('2579','303','观山湖区','3','0','','520115');
INSERT INTO `qb_area` VALUES ('2580','303','开阳县','3','0','','520121');
INSERT INTO `qb_area` VALUES ('2581','303','息烽县','3','0','','520122');
INSERT INTO `qb_area` VALUES ('2582','303','修文县','3','0','','520123');
INSERT INTO `qb_area` VALUES ('2583','303','清镇市','3','0','','520181');
INSERT INTO `qb_area` VALUES ('2584','304','钟山区','3','0','','520201');
INSERT INTO `qb_area` VALUES ('2585','304','六枝特区','3','0','','520203');
INSERT INTO `qb_area` VALUES ('2586','304','水城县','3','0','','520221');
INSERT INTO `qb_area` VALUES ('2587','304','盘州市','3','0','','520281');
INSERT INTO `qb_area` VALUES ('2588','305','红花岗区','3','0','','520302');
INSERT INTO `qb_area` VALUES ('2589','305','汇川区','3','0','','520303');
INSERT INTO `qb_area` VALUES ('2590','305','播州区','3','0','','520304');
INSERT INTO `qb_area` VALUES ('2591','305','桐梓县','3','0','','520322');
INSERT INTO `qb_area` VALUES ('2592','305','绥阳县','3','0','','520323');
INSERT INTO `qb_area` VALUES ('2593','305','正安县','3','0','','520324');
INSERT INTO `qb_area` VALUES ('2594','305','道真仡佬族苗族自治县','3','0','','520325');
INSERT INTO `qb_area` VALUES ('2595','305','务川仡佬族苗族自治县','3','0','','520326');
INSERT INTO `qb_area` VALUES ('2596','305','凤冈县','3','0','','520327');
INSERT INTO `qb_area` VALUES ('2597','305','湄潭县','3','0','','520328');
INSERT INTO `qb_area` VALUES ('2598','305','余庆县','3','0','','520329');
INSERT INTO `qb_area` VALUES ('2599','305','习水县','3','0','','520330');
INSERT INTO `qb_area` VALUES ('2600','305','赤水市','3','0','','520381');
INSERT INTO `qb_area` VALUES ('2601','305','仁怀市','3','0','','520382');
INSERT INTO `qb_area` VALUES ('2602','306','西秀区','3','0','','520402');
INSERT INTO `qb_area` VALUES ('2603','306','平坝区','3','0','','520403');
INSERT INTO `qb_area` VALUES ('2604','306','普定县','3','0','','520422');
INSERT INTO `qb_area` VALUES ('2605','306','镇宁布依族苗族自治县','3','0','','520423');
INSERT INTO `qb_area` VALUES ('2606','306','关岭布依族苗族自治县','3','0','','520424');
INSERT INTO `qb_area` VALUES ('2607','306','紫云苗族布依族自治县','3','0','','520425');
INSERT INTO `qb_area` VALUES ('2608','307','七星关区','3','0','','520502');
INSERT INTO `qb_area` VALUES ('2609','307','大方县','3','0','','520521');
INSERT INTO `qb_area` VALUES ('2610','307','黔西县','3','0','','520522');
INSERT INTO `qb_area` VALUES ('2611','307','金沙县','3','0','','520523');
INSERT INTO `qb_area` VALUES ('2612','307','织金县','3','0','','520524');
INSERT INTO `qb_area` VALUES ('2613','307','纳雍县','3','0','','520525');
INSERT INTO `qb_area` VALUES ('2614','307','威宁彝族回族苗族自治县','3','0','','520526');
INSERT INTO `qb_area` VALUES ('2615','307','赫章县','3','0','','520527');
INSERT INTO `qb_area` VALUES ('2616','308','碧江区','3','0','','520602');
INSERT INTO `qb_area` VALUES ('2617','308','万山区','3','0','','520603');
INSERT INTO `qb_area` VALUES ('2618','308','江口县','3','0','','520621');
INSERT INTO `qb_area` VALUES ('2619','308','玉屏侗族自治县','3','0','','520622');
INSERT INTO `qb_area` VALUES ('2620','308','石阡县','3','0','','520623');
INSERT INTO `qb_area` VALUES ('2621','308','思南县','3','0','','520624');
INSERT INTO `qb_area` VALUES ('2622','308','印江土家族苗族自治县','3','0','','520625');
INSERT INTO `qb_area` VALUES ('2623','308','德江县','3','0','','520626');
INSERT INTO `qb_area` VALUES ('2624','308','沿河土家族自治县','3','0','','520627');
INSERT INTO `qb_area` VALUES ('2625','308','松桃苗族自治县','3','0','','520628');
INSERT INTO `qb_area` VALUES ('2626','309','兴义市','3','0','','522301');
INSERT INTO `qb_area` VALUES ('2627','309','兴仁市','3','0','','522322');
INSERT INTO `qb_area` VALUES ('2628','309','普安县','3','0','','522323');
INSERT INTO `qb_area` VALUES ('2629','309','晴隆县','3','0','','522324');
INSERT INTO `qb_area` VALUES ('2630','309','贞丰县','3','0','','522325');
INSERT INTO `qb_area` VALUES ('2631','309','望谟县','3','0','','522326');
INSERT INTO `qb_area` VALUES ('2632','309','册亨县','3','0','','522327');
INSERT INTO `qb_area` VALUES ('2633','309','安龙县','3','0','','522328');
INSERT INTO `qb_area` VALUES ('2634','310','凯里市','3','0','','522601');
INSERT INTO `qb_area` VALUES ('2635','310','黄平县','3','0','','522622');
INSERT INTO `qb_area` VALUES ('2636','310','施秉县','3','0','','522623');
INSERT INTO `qb_area` VALUES ('2637','310','三穗县','3','0','','522624');
INSERT INTO `qb_area` VALUES ('2638','310','镇远县','3','0','','522625');
INSERT INTO `qb_area` VALUES ('2639','310','岑巩县','3','0','','522626');
INSERT INTO `qb_area` VALUES ('2640','310','天柱县','3','0','','522627');
INSERT INTO `qb_area` VALUES ('2641','310','锦屏县','3','0','','522628');
INSERT INTO `qb_area` VALUES ('2642','310','剑河县','3','0','','522629');
INSERT INTO `qb_area` VALUES ('2643','310','台江县','3','0','','522630');
INSERT INTO `qb_area` VALUES ('2644','310','黎平县','3','0','','522631');
INSERT INTO `qb_area` VALUES ('2645','310','榕江县','3','0','','522632');
INSERT INTO `qb_area` VALUES ('2646','310','从江县','3','0','','522633');
INSERT INTO `qb_area` VALUES ('2647','310','雷山县','3','0','','522634');
INSERT INTO `qb_area` VALUES ('2648','310','麻江县','3','0','','522635');
INSERT INTO `qb_area` VALUES ('2649','310','丹寨县','3','0','','522636');
INSERT INTO `qb_area` VALUES ('2650','311','都匀市','3','0','','522701');
INSERT INTO `qb_area` VALUES ('2651','311','福泉市','3','0','','522702');
INSERT INTO `qb_area` VALUES ('2652','311','荔波县','3','0','','522722');
INSERT INTO `qb_area` VALUES ('2653','311','贵定县','3','0','','522723');
INSERT INTO `qb_area` VALUES ('2654','311','瓮安县','3','0','','522725');
INSERT INTO `qb_area` VALUES ('2655','311','独山县','3','0','','522726');
INSERT INTO `qb_area` VALUES ('2656','311','平塘县','3','0','','522727');
INSERT INTO `qb_area` VALUES ('2657','311','罗甸县','3','0','','522728');
INSERT INTO `qb_area` VALUES ('2658','311','长顺县','3','0','','522729');
INSERT INTO `qb_area` VALUES ('2659','311','龙里县','3','0','','522730');
INSERT INTO `qb_area` VALUES ('2660','311','惠水县','3','0','','522731');
INSERT INTO `qb_area` VALUES ('2661','311','三都水族自治县','3','0','','522732');
INSERT INTO `qb_area` VALUES ('2662','312','五华区','3','0','','530102');
INSERT INTO `qb_area` VALUES ('2663','312','盘龙区','3','0','','530103');
INSERT INTO `qb_area` VALUES ('2664','312','官渡区','3','0','','530111');
INSERT INTO `qb_area` VALUES ('2665','312','西山区','3','0','','530112');
INSERT INTO `qb_area` VALUES ('2666','312','东川区','3','0','','530113');
INSERT INTO `qb_area` VALUES ('2667','312','呈贡区','3','0','','530114');
INSERT INTO `qb_area` VALUES ('2668','312','晋宁区','3','0','','530115');
INSERT INTO `qb_area` VALUES ('2669','312','富民县','3','0','','530124');
INSERT INTO `qb_area` VALUES ('2670','312','宜良县','3','0','','530125');
INSERT INTO `qb_area` VALUES ('2671','312','石林彝族自治县','3','0','','530126');
INSERT INTO `qb_area` VALUES ('2672','312','嵩明县','3','0','','530127');
INSERT INTO `qb_area` VALUES ('2673','312','禄劝彝族苗族自治县','3','0','','530128');
INSERT INTO `qb_area` VALUES ('2674','312','寻甸回族彝族自治县','3','0','','530129');
INSERT INTO `qb_area` VALUES ('2675','312','安宁市','3','0','','530181');
INSERT INTO `qb_area` VALUES ('2676','313','麒麟区','3','0','','530302');
INSERT INTO `qb_area` VALUES ('2677','313','沾益区','3','0','','530303');
INSERT INTO `qb_area` VALUES ('2678','313','马龙区','3','0','','530304');
INSERT INTO `qb_area` VALUES ('2679','313','陆良县','3','0','','530322');
INSERT INTO `qb_area` VALUES ('2680','313','师宗县','3','0','','530323');
INSERT INTO `qb_area` VALUES ('2681','313','罗平县','3','0','','530324');
INSERT INTO `qb_area` VALUES ('2682','313','富源县','3','0','','530325');
INSERT INTO `qb_area` VALUES ('2683','313','会泽县','3','0','','530326');
INSERT INTO `qb_area` VALUES ('2684','313','宣威市','3','0','','530381');
INSERT INTO `qb_area` VALUES ('2685','314','红塔区','3','0','','530402');
INSERT INTO `qb_area` VALUES ('2686','314','江川区','3','0','','530403');
INSERT INTO `qb_area` VALUES ('2687','314','澄江县','3','0','','530422');
INSERT INTO `qb_area` VALUES ('2688','314','通海县','3','0','','530423');
INSERT INTO `qb_area` VALUES ('2689','314','华宁县','3','0','','530424');
INSERT INTO `qb_area` VALUES ('2690','314','易门县','3','0','','530425');
INSERT INTO `qb_area` VALUES ('2691','314','峨山彝族自治县','3','0','','530426');
INSERT INTO `qb_area` VALUES ('2692','314','新平彝族傣族自治县','3','0','','530427');
INSERT INTO `qb_area` VALUES ('2693','314','元江哈尼族彝族傣族自治县','3','0','','530428');
INSERT INTO `qb_area` VALUES ('2694','315','隆阳区','3','0','','530502');
INSERT INTO `qb_area` VALUES ('2695','315','施甸县','3','0','','530521');
INSERT INTO `qb_area` VALUES ('2696','315','龙陵县','3','0','','530523');
INSERT INTO `qb_area` VALUES ('2697','315','昌宁县','3','0','','530524');
INSERT INTO `qb_area` VALUES ('2698','315','腾冲市','3','0','','530581');
INSERT INTO `qb_area` VALUES ('2699','316','昭阳区','3','0','','530602');
INSERT INTO `qb_area` VALUES ('2700','316','鲁甸县','3','0','','530621');
INSERT INTO `qb_area` VALUES ('2701','316','巧家县','3','0','','530622');
INSERT INTO `qb_area` VALUES ('2702','316','盐津县','3','0','','530623');
INSERT INTO `qb_area` VALUES ('2703','316','大关县','3','0','','530624');
INSERT INTO `qb_area` VALUES ('2704','316','永善县','3','0','','530625');
INSERT INTO `qb_area` VALUES ('2705','316','绥江县','3','0','','530626');
INSERT INTO `qb_area` VALUES ('2706','316','镇雄县','3','0','','530627');
INSERT INTO `qb_area` VALUES ('2707','316','彝良县','3','0','','530628');
INSERT INTO `qb_area` VALUES ('2708','316','威信县','3','0','','530629');
INSERT INTO `qb_area` VALUES ('2709','316','水富市','3','0','','530630');
INSERT INTO `qb_area` VALUES ('2710','317','古城区','3','0','','530702');
INSERT INTO `qb_area` VALUES ('2711','317','玉龙纳西族自治县','3','0','','530721');
INSERT INTO `qb_area` VALUES ('2712','317','永胜县','3','0','','530722');
INSERT INTO `qb_area` VALUES ('2713','317','华坪县','3','0','','530723');
INSERT INTO `qb_area` VALUES ('2714','317','宁蒗彝族自治县','3','0','','530724');
INSERT INTO `qb_area` VALUES ('2715','318','思茅区','3','0','','530802');
INSERT INTO `qb_area` VALUES ('2716','318','宁洱哈尼族彝族自治县','3','0','','530821');
INSERT INTO `qb_area` VALUES ('2717','318','墨江哈尼族自治县','3','0','','530822');
INSERT INTO `qb_area` VALUES ('2718','318','景东彝族自治县','3','0','','530823');
INSERT INTO `qb_area` VALUES ('2719','318','景谷傣族彝族自治县','3','0','','530824');
INSERT INTO `qb_area` VALUES ('2720','318','镇沅彝族哈尼族拉祜族自治县','3','0','','530825');
INSERT INTO `qb_area` VALUES ('2721','318','江城哈尼族彝族自治县','3','0','','530826');
INSERT INTO `qb_area` VALUES ('2722','318','孟连傣族拉祜族佤族自治县','3','0','','530827');
INSERT INTO `qb_area` VALUES ('2723','318','澜沧拉祜族自治县','3','0','','530828');
INSERT INTO `qb_area` VALUES ('2724','318','西盟佤族自治县','3','0','','530829');
INSERT INTO `qb_area` VALUES ('2725','319','临翔区','3','0','','530902');
INSERT INTO `qb_area` VALUES ('2726','319','凤庆县','3','0','','530921');
INSERT INTO `qb_area` VALUES ('2727','319','云县','3','0','','530922');
INSERT INTO `qb_area` VALUES ('2728','319','永德县','3','0','','530923');
INSERT INTO `qb_area` VALUES ('2729','319','镇康县','3','0','','530924');
INSERT INTO `qb_area` VALUES ('2730','319','双江拉祜族佤族布朗族傣族自治县','3','0','','530925');
INSERT INTO `qb_area` VALUES ('2731','319','耿马傣族佤族自治县','3','0','','530926');
INSERT INTO `qb_area` VALUES ('2732','319','沧源佤族自治县','3','0','','530927');
INSERT INTO `qb_area` VALUES ('2733','320','楚雄市','3','0','','532301');
INSERT INTO `qb_area` VALUES ('2734','320','双柏县','3','0','','532322');
INSERT INTO `qb_area` VALUES ('2735','320','牟定县','3','0','','532323');
INSERT INTO `qb_area` VALUES ('2736','320','南华县','3','0','','532324');
INSERT INTO `qb_area` VALUES ('2737','320','姚安县','3','0','','532325');
INSERT INTO `qb_area` VALUES ('2738','320','大姚县','3','0','','532326');
INSERT INTO `qb_area` VALUES ('2739','320','永仁县','3','0','','532327');
INSERT INTO `qb_area` VALUES ('2740','320','元谋县','3','0','','532328');
INSERT INTO `qb_area` VALUES ('2741','320','武定县','3','0','','532329');
INSERT INTO `qb_area` VALUES ('2742','320','禄丰县','3','0','','532331');
INSERT INTO `qb_area` VALUES ('2743','321','个旧市','3','0','','532501');
INSERT INTO `qb_area` VALUES ('2744','321','开远市','3','0','','532502');
INSERT INTO `qb_area` VALUES ('2745','321','蒙自市','3','0','','532503');
INSERT INTO `qb_area` VALUES ('2746','321','弥勒市','3','0','','532504');
INSERT INTO `qb_area` VALUES ('2747','321','屏边苗族自治县','3','0','','532523');
INSERT INTO `qb_area` VALUES ('2748','321','建水县','3','0','','532524');
INSERT INTO `qb_area` VALUES ('2749','321','石屏县','3','0','','532525');
INSERT INTO `qb_area` VALUES ('2750','321','泸西县','3','0','','532527');
INSERT INTO `qb_area` VALUES ('2751','321','元阳县','3','0','','532528');
INSERT INTO `qb_area` VALUES ('2752','321','红河县','3','0','','532529');
INSERT INTO `qb_area` VALUES ('2753','321','金平苗族瑶族傣族自治县','3','0','','532530');
INSERT INTO `qb_area` VALUES ('2754','321','绿春县','3','0','','532531');
INSERT INTO `qb_area` VALUES ('2755','321','河口瑶族自治县','3','0','','532532');
INSERT INTO `qb_area` VALUES ('2756','322','文山市','3','0','','532601');
INSERT INTO `qb_area` VALUES ('2757','322','砚山县','3','0','','532622');
INSERT INTO `qb_area` VALUES ('2758','322','西畴县','3','0','','532623');
INSERT INTO `qb_area` VALUES ('2759','322','麻栗坡县','3','0','','532624');
INSERT INTO `qb_area` VALUES ('2760','322','马关县','3','0','','532625');
INSERT INTO `qb_area` VALUES ('2761','322','丘北县','3','0','','532626');
INSERT INTO `qb_area` VALUES ('2762','322','广南县','3','0','','532627');
INSERT INTO `qb_area` VALUES ('2763','322','富宁县','3','0','','532628');
INSERT INTO `qb_area` VALUES ('2764','323','景洪市','3','0','','532801');
INSERT INTO `qb_area` VALUES ('2765','323','勐海县','3','0','','532822');
INSERT INTO `qb_area` VALUES ('2766','323','勐腊县','3','0','','532823');
INSERT INTO `qb_area` VALUES ('2767','324','大理市','3','0','','532901');
INSERT INTO `qb_area` VALUES ('2768','324','漾濞彝族自治县','3','0','','532922');
INSERT INTO `qb_area` VALUES ('2769','324','祥云县','3','0','','532923');
INSERT INTO `qb_area` VALUES ('2770','324','宾川县','3','0','','532924');
INSERT INTO `qb_area` VALUES ('2771','324','弥渡县','3','0','','532925');
INSERT INTO `qb_area` VALUES ('2772','324','南涧彝族自治县','3','0','','532926');
INSERT INTO `qb_area` VALUES ('2773','324','巍山彝族回族自治县','3','0','','532927');
INSERT INTO `qb_area` VALUES ('2774','324','永平县','3','0','','532928');
INSERT INTO `qb_area` VALUES ('2775','324','云龙县','3','0','','532929');
INSERT INTO `qb_area` VALUES ('2776','324','洱源县','3','0','','532930');
INSERT INTO `qb_area` VALUES ('2777','324','剑川县','3','0','','532931');
INSERT INTO `qb_area` VALUES ('2778','324','鹤庆县','3','0','','532932');
INSERT INTO `qb_area` VALUES ('2779','325','瑞丽市','3','0','','533102');
INSERT INTO `qb_area` VALUES ('2780','325','芒市','3','0','','533103');
INSERT INTO `qb_area` VALUES ('2781','325','梁河县','3','0','','533122');
INSERT INTO `qb_area` VALUES ('2782','325','盈江县','3','0','','533123');
INSERT INTO `qb_area` VALUES ('2783','325','陇川县','3','0','','533124');
INSERT INTO `qb_area` VALUES ('2784','326','泸水市','3','0','','533301');
INSERT INTO `qb_area` VALUES ('2785','326','福贡县','3','0','','533323');
INSERT INTO `qb_area` VALUES ('2786','326','贡山独龙族怒族自治县','3','0','','533324');
INSERT INTO `qb_area` VALUES ('2787','326','兰坪白族普米族自治县','3','0','','533325');
INSERT INTO `qb_area` VALUES ('2788','327','香格里拉市','3','0','','533401');
INSERT INTO `qb_area` VALUES ('2789','327','德钦县','3','0','','533422');
INSERT INTO `qb_area` VALUES ('2790','327','维西傈僳族自治县','3','0','','533423');
INSERT INTO `qb_area` VALUES ('2791','328','城关区','3','0','','540102');
INSERT INTO `qb_area` VALUES ('2792','328','堆龙德庆区','3','0','','540103');
INSERT INTO `qb_area` VALUES ('2793','328','达孜区','3','0','','540104');
INSERT INTO `qb_area` VALUES ('2794','328','林周县','3','0','','540121');
INSERT INTO `qb_area` VALUES ('2795','328','当雄县','3','0','','540122');
INSERT INTO `qb_area` VALUES ('2796','328','尼木县','3','0','','540123');
INSERT INTO `qb_area` VALUES ('2797','328','曲水县','3','0','','540124');
INSERT INTO `qb_area` VALUES ('2798','328','墨竹工卡县','3','0','','540127');
INSERT INTO `qb_area` VALUES ('2799','329','桑珠孜区','3','0','','540202');
INSERT INTO `qb_area` VALUES ('2800','329','南木林县','3','0','','540221');
INSERT INTO `qb_area` VALUES ('2801','329','江孜县','3','0','','540222');
INSERT INTO `qb_area` VALUES ('2802','329','定日县','3','0','','540223');
INSERT INTO `qb_area` VALUES ('2803','329','萨迦县','3','0','','540224');
INSERT INTO `qb_area` VALUES ('2804','329','拉孜县','3','0','','540225');
INSERT INTO `qb_area` VALUES ('2805','329','昂仁县','3','0','','540226');
INSERT INTO `qb_area` VALUES ('2806','329','谢通门县','3','0','','540227');
INSERT INTO `qb_area` VALUES ('2807','329','白朗县','3','0','','540228');
INSERT INTO `qb_area` VALUES ('2808','329','仁布县','3','0','','540229');
INSERT INTO `qb_area` VALUES ('2809','329','康马县','3','0','','540230');
INSERT INTO `qb_area` VALUES ('2810','329','定结县','3','0','','540231');
INSERT INTO `qb_area` VALUES ('2811','329','仲巴县','3','0','','540232');
INSERT INTO `qb_area` VALUES ('2812','329','亚东县','3','0','','540233');
INSERT INTO `qb_area` VALUES ('2813','329','吉隆县','3','0','','540234');
INSERT INTO `qb_area` VALUES ('2814','329','聂拉木县','3','0','','540235');
INSERT INTO `qb_area` VALUES ('2815','329','萨嘎县','3','0','','540236');
INSERT INTO `qb_area` VALUES ('2816','329','岗巴县','3','0','','540237');
INSERT INTO `qb_area` VALUES ('2817','330','卡若区','3','0','','540302');
INSERT INTO `qb_area` VALUES ('2818','330','江达县','3','0','','540321');
INSERT INTO `qb_area` VALUES ('2819','330','贡觉县','3','0','','540322');
INSERT INTO `qb_area` VALUES ('2820','330','类乌齐县','3','0','','540323');
INSERT INTO `qb_area` VALUES ('2821','330','丁青县','3','0','','540324');
INSERT INTO `qb_area` VALUES ('2822','330','察雅县','3','0','','540325');
INSERT INTO `qb_area` VALUES ('2823','330','八宿县','3','0','','540326');
INSERT INTO `qb_area` VALUES ('2824','330','左贡县','3','0','','540327');
INSERT INTO `qb_area` VALUES ('2825','330','芒康县','3','0','','540328');
INSERT INTO `qb_area` VALUES ('2826','330','洛隆县','3','0','','540329');
INSERT INTO `qb_area` VALUES ('2827','330','边坝县','3','0','','540330');
INSERT INTO `qb_area` VALUES ('2828','331','巴宜区','3','0','','540402');
INSERT INTO `qb_area` VALUES ('2829','331','工布江达县','3','0','','540421');
INSERT INTO `qb_area` VALUES ('2830','331','米林县','3','0','','540422');
INSERT INTO `qb_area` VALUES ('2831','331','墨脱县','3','0','','540423');
INSERT INTO `qb_area` VALUES ('2832','331','波密县','3','0','','540424');
INSERT INTO `qb_area` VALUES ('2833','331','察隅县','3','0','','540425');
INSERT INTO `qb_area` VALUES ('2834','331','朗县','3','0','','540426');
INSERT INTO `qb_area` VALUES ('2835','332','乃东区','3','0','','540502');
INSERT INTO `qb_area` VALUES ('2836','332','扎囊县','3','0','','540521');
INSERT INTO `qb_area` VALUES ('2837','332','贡嘎县','3','0','','540522');
INSERT INTO `qb_area` VALUES ('2838','332','桑日县','3','0','','540523');
INSERT INTO `qb_area` VALUES ('2839','332','琼结县','3','0','','540524');
INSERT INTO `qb_area` VALUES ('2840','332','曲松县','3','0','','540525');
INSERT INTO `qb_area` VALUES ('2841','332','措美县','3','0','','540526');
INSERT INTO `qb_area` VALUES ('2842','332','洛扎县','3','0','','540527');
INSERT INTO `qb_area` VALUES ('2843','332','加查县','3','0','','540528');
INSERT INTO `qb_area` VALUES ('2844','332','隆子县','3','0','','540529');
INSERT INTO `qb_area` VALUES ('2845','332','错那县','3','0','','540530');
INSERT INTO `qb_area` VALUES ('2846','332','浪卡子县','3','0','','540531');
INSERT INTO `qb_area` VALUES ('2847','333','色尼区','3','0','','540602');
INSERT INTO `qb_area` VALUES ('2848','333','嘉黎县','3','0','','540621');
INSERT INTO `qb_area` VALUES ('2849','333','比如县','3','0','','540622');
INSERT INTO `qb_area` VALUES ('2850','333','聂荣县','3','0','','540623');
INSERT INTO `qb_area` VALUES ('2851','333','安多县','3','0','','540624');
INSERT INTO `qb_area` VALUES ('2852','333','申扎县','3','0','','540625');
INSERT INTO `qb_area` VALUES ('2853','333','索县','3','0','','540626');
INSERT INTO `qb_area` VALUES ('2854','333','班戈县','3','0','','540627');
INSERT INTO `qb_area` VALUES ('2855','333','巴青县','3','0','','540628');
INSERT INTO `qb_area` VALUES ('2856','333','尼玛县','3','0','','540629');
INSERT INTO `qb_area` VALUES ('2857','333','双湖县','3','0','','540630');
INSERT INTO `qb_area` VALUES ('2858','334','普兰县','3','0','','542521');
INSERT INTO `qb_area` VALUES ('2859','334','札达县','3','0','','542522');
INSERT INTO `qb_area` VALUES ('2860','334','噶尔县','3','0','','542523');
INSERT INTO `qb_area` VALUES ('2861','334','日土县','3','0','','542524');
INSERT INTO `qb_area` VALUES ('2862','334','革吉县','3','0','','542525');
INSERT INTO `qb_area` VALUES ('2863','334','改则县','3','0','','542526');
INSERT INTO `qb_area` VALUES ('2864','334','措勤县','3','0','','542527');
INSERT INTO `qb_area` VALUES ('2865','335','新城区','3','0','','610102');
INSERT INTO `qb_area` VALUES ('2866','335','碑林区','3','0','','610103');
INSERT INTO `qb_area` VALUES ('2867','335','莲湖区','3','0','','610104');
INSERT INTO `qb_area` VALUES ('2868','335','灞桥区','3','0','','610111');
INSERT INTO `qb_area` VALUES ('2869','335','未央区','3','0','','610112');
INSERT INTO `qb_area` VALUES ('2870','335','雁塔区','3','0','','610113');
INSERT INTO `qb_area` VALUES ('2871','335','阎良区','3','0','','610114');
INSERT INTO `qb_area` VALUES ('2872','335','临潼区','3','0','','610115');
INSERT INTO `qb_area` VALUES ('2873','335','长安区','3','0','','610116');
INSERT INTO `qb_area` VALUES ('2874','335','高陵区','3','0','','610117');
INSERT INTO `qb_area` VALUES ('2875','335','鄠邑区','3','0','','610118');
INSERT INTO `qb_area` VALUES ('2876','335','蓝田县','3','0','','610122');
INSERT INTO `qb_area` VALUES ('2877','335','周至县','3','0','','610124');
INSERT INTO `qb_area` VALUES ('2878','336','王益区','3','0','','610202');
INSERT INTO `qb_area` VALUES ('2879','336','印台区','3','0','','610203');
INSERT INTO `qb_area` VALUES ('2880','336','耀州区','3','0','','610204');
INSERT INTO `qb_area` VALUES ('2881','336','宜君县','3','0','','610222');
INSERT INTO `qb_area` VALUES ('2882','337','渭滨区','3','0','','610302');
INSERT INTO `qb_area` VALUES ('2883','337','金台区','3','0','','610303');
INSERT INTO `qb_area` VALUES ('2884','337','陈仓区','3','0','','610304');
INSERT INTO `qb_area` VALUES ('2885','337','凤翔县','3','0','','610322');
INSERT INTO `qb_area` VALUES ('2886','337','岐山县','3','0','','610323');
INSERT INTO `qb_area` VALUES ('2887','337','扶风县','3','0','','610324');
INSERT INTO `qb_area` VALUES ('2888','337','眉县','3','0','','610326');
INSERT INTO `qb_area` VALUES ('2889','337','陇县','3','0','','610327');
INSERT INTO `qb_area` VALUES ('2890','337','千阳县','3','0','','610328');
INSERT INTO `qb_area` VALUES ('2891','337','麟游县','3','0','','610329');
INSERT INTO `qb_area` VALUES ('2892','337','凤县','3','0','','610330');
INSERT INTO `qb_area` VALUES ('2893','337','太白县','3','0','','610331');
INSERT INTO `qb_area` VALUES ('2894','338','秦都区','3','0','','610402');
INSERT INTO `qb_area` VALUES ('2895','338','杨陵区','3','0','','610403');
INSERT INTO `qb_area` VALUES ('2896','338','渭城区','3','0','','610404');
INSERT INTO `qb_area` VALUES ('2897','338','三原县','3','0','','610422');
INSERT INTO `qb_area` VALUES ('2898','338','泾阳县','3','0','','610423');
INSERT INTO `qb_area` VALUES ('2899','338','乾县','3','0','','610424');
INSERT INTO `qb_area` VALUES ('2900','338','礼泉县','3','0','','610425');
INSERT INTO `qb_area` VALUES ('2901','338','永寿县','3','0','','610426');
INSERT INTO `qb_area` VALUES ('2902','338','长武县','3','0','','610428');
INSERT INTO `qb_area` VALUES ('2903','338','旬邑县','3','0','','610429');
INSERT INTO `qb_area` VALUES ('2904','338','淳化县','3','0','','610430');
INSERT INTO `qb_area` VALUES ('2905','338','武功县','3','0','','610431');
INSERT INTO `qb_area` VALUES ('2906','338','兴平市','3','0','','610481');
INSERT INTO `qb_area` VALUES ('2907','338','彬州市','3','0','','610482');
INSERT INTO `qb_area` VALUES ('2908','339','临渭区','3','0','','610502');
INSERT INTO `qb_area` VALUES ('2909','339','华州区','3','0','','610503');
INSERT INTO `qb_area` VALUES ('2910','339','潼关县','3','0','','610522');
INSERT INTO `qb_area` VALUES ('2911','339','大荔县','3','0','','610523');
INSERT INTO `qb_area` VALUES ('2912','339','合阳县','3','0','','610524');
INSERT INTO `qb_area` VALUES ('2913','339','澄城县','3','0','','610525');
INSERT INTO `qb_area` VALUES ('2914','339','蒲城县','3','0','','610526');
INSERT INTO `qb_area` VALUES ('2915','339','白水县','3','0','','610527');
INSERT INTO `qb_area` VALUES ('2916','339','富平县','3','0','','610528');
INSERT INTO `qb_area` VALUES ('2917','339','韩城市','3','0','','610581');
INSERT INTO `qb_area` VALUES ('2918','339','华阴市','3','0','','610582');
INSERT INTO `qb_area` VALUES ('2919','340','宝塔区','3','0','','610602');
INSERT INTO `qb_area` VALUES ('2920','340','安塞区','3','0','','610603');
INSERT INTO `qb_area` VALUES ('2921','340','延长县','3','0','','610621');
INSERT INTO `qb_area` VALUES ('2922','340','延川县','3','0','','610622');
INSERT INTO `qb_area` VALUES ('2923','340','子长县','3','0','','610623');
INSERT INTO `qb_area` VALUES ('2924','340','志丹县','3','0','','610625');
INSERT INTO `qb_area` VALUES ('2925','340','吴起县','3','0','','610626');
INSERT INTO `qb_area` VALUES ('2926','340','甘泉县','3','0','','610627');
INSERT INTO `qb_area` VALUES ('2927','340','富县','3','0','','610628');
INSERT INTO `qb_area` VALUES ('2928','340','洛川县','3','0','','610629');
INSERT INTO `qb_area` VALUES ('2929','340','宜川县','3','0','','610630');
INSERT INTO `qb_area` VALUES ('2930','340','黄龙县','3','0','','610631');
INSERT INTO `qb_area` VALUES ('2931','340','黄陵县','3','0','','610632');
INSERT INTO `qb_area` VALUES ('2932','341','汉台区','3','0','','610702');
INSERT INTO `qb_area` VALUES ('2933','341','南郑区','3','0','','610703');
INSERT INTO `qb_area` VALUES ('2934','341','城固县','3','0','','610722');
INSERT INTO `qb_area` VALUES ('2935','341','洋县','3','0','','610723');
INSERT INTO `qb_area` VALUES ('2936','341','西乡县','3','0','','610724');
INSERT INTO `qb_area` VALUES ('2937','341','勉县','3','0','','610725');
INSERT INTO `qb_area` VALUES ('2938','341','宁强县','3','0','','610726');
INSERT INTO `qb_area` VALUES ('2939','341','略阳县','3','0','','610727');
INSERT INTO `qb_area` VALUES ('2940','341','镇巴县','3','0','','610728');
INSERT INTO `qb_area` VALUES ('2941','341','留坝县','3','0','','610729');
INSERT INTO `qb_area` VALUES ('2942','341','佛坪县','3','0','','610730');
INSERT INTO `qb_area` VALUES ('2943','342','榆阳区','3','0','','610802');
INSERT INTO `qb_area` VALUES ('2944','342','横山区','3','0','','610803');
INSERT INTO `qb_area` VALUES ('2945','342','府谷县','3','0','','610822');
INSERT INTO `qb_area` VALUES ('2946','342','靖边县','3','0','','610824');
INSERT INTO `qb_area` VALUES ('2947','342','定边县','3','0','','610825');
INSERT INTO `qb_area` VALUES ('2948','342','绥德县','3','0','','610826');
INSERT INTO `qb_area` VALUES ('2949','342','米脂县','3','0','','610827');
INSERT INTO `qb_area` VALUES ('2950','342','佳县','3','0','','610828');
INSERT INTO `qb_area` VALUES ('2951','342','吴堡县','3','0','','610829');
INSERT INTO `qb_area` VALUES ('2952','342','清涧县','3','0','','610830');
INSERT INTO `qb_area` VALUES ('2953','342','子洲县','3','0','','610831');
INSERT INTO `qb_area` VALUES ('2954','342','神木市','3','0','','610881');
INSERT INTO `qb_area` VALUES ('2955','343','汉滨区','3','0','','610902');
INSERT INTO `qb_area` VALUES ('2956','343','汉阴县','3','0','','610921');
INSERT INTO `qb_area` VALUES ('2957','343','石泉县','3','0','','610922');
INSERT INTO `qb_area` VALUES ('2958','343','宁陕县','3','0','','610923');
INSERT INTO `qb_area` VALUES ('2959','343','紫阳县','3','0','','610924');
INSERT INTO `qb_area` VALUES ('2960','343','岚皋县','3','0','','610925');
INSERT INTO `qb_area` VALUES ('2961','343','平利县','3','0','','610926');
INSERT INTO `qb_area` VALUES ('2962','343','镇坪县','3','0','','610927');
INSERT INTO `qb_area` VALUES ('2963','343','旬阳县','3','0','','610928');
INSERT INTO `qb_area` VALUES ('2964','343','白河县','3','0','','610929');
INSERT INTO `qb_area` VALUES ('2965','344','商州区','3','0','','611002');
INSERT INTO `qb_area` VALUES ('2966','344','洛南县','3','0','','611021');
INSERT INTO `qb_area` VALUES ('2967','344','丹凤县','3','0','','611022');
INSERT INTO `qb_area` VALUES ('2968','344','商南县','3','0','','611023');
INSERT INTO `qb_area` VALUES ('2969','344','山阳县','3','0','','611024');
INSERT INTO `qb_area` VALUES ('2970','344','镇安县','3','0','','611025');
INSERT INTO `qb_area` VALUES ('2971','344','柞水县','3','0','','611026');
INSERT INTO `qb_area` VALUES ('2972','345','城关区','3','0','','620102');
INSERT INTO `qb_area` VALUES ('2973','345','七里河区','3','0','','620103');
INSERT INTO `qb_area` VALUES ('2974','345','西固区','3','0','','620104');
INSERT INTO `qb_area` VALUES ('2975','345','安宁区','3','0','','620105');
INSERT INTO `qb_area` VALUES ('2976','345','红古区','3','0','','620111');
INSERT INTO `qb_area` VALUES ('2977','345','永登县','3','0','','620121');
INSERT INTO `qb_area` VALUES ('2978','345','皋兰县','3','0','','620122');
INSERT INTO `qb_area` VALUES ('2979','345','榆中县','3','0','','620123');
INSERT INTO `qb_area` VALUES ('2980','347','金川区','3','0','','620302');
INSERT INTO `qb_area` VALUES ('2981','347','永昌县','3','0','','620321');
INSERT INTO `qb_area` VALUES ('2982','348','白银区','3','0','','620402');
INSERT INTO `qb_area` VALUES ('2983','348','平川区','3','0','','620403');
INSERT INTO `qb_area` VALUES ('2984','348','靖远县','3','0','','620421');
INSERT INTO `qb_area` VALUES ('2985','348','会宁县','3','0','','620422');
INSERT INTO `qb_area` VALUES ('2986','348','景泰县','3','0','','620423');
INSERT INTO `qb_area` VALUES ('2987','349','秦州区','3','0','','620502');
INSERT INTO `qb_area` VALUES ('2988','349','麦积区','3','0','','620503');
INSERT INTO `qb_area` VALUES ('2989','349','清水县','3','0','','620521');
INSERT INTO `qb_area` VALUES ('2990','349','秦安县','3','0','','620522');
INSERT INTO `qb_area` VALUES ('2991','349','甘谷县','3','0','','620523');
INSERT INTO `qb_area` VALUES ('2992','349','武山县','3','0','','620524');
INSERT INTO `qb_area` VALUES ('2993','349','张家川回族自治县','3','0','','620525');
INSERT INTO `qb_area` VALUES ('2994','350','凉州区','3','0','','620602');
INSERT INTO `qb_area` VALUES ('2995','350','民勤县','3','0','','620621');
INSERT INTO `qb_area` VALUES ('2996','350','古浪县','3','0','','620622');
INSERT INTO `qb_area` VALUES ('2997','350','天祝藏族自治县','3','0','','620623');
INSERT INTO `qb_area` VALUES ('2998','351','甘州区','3','0','','620702');
INSERT INTO `qb_area` VALUES ('2999','351','肃南裕固族自治县','3','0','','620721');
INSERT INTO `qb_area` VALUES ('3000','351','民乐县','3','0','','620722');
INSERT INTO `qb_area` VALUES ('3001','351','临泽县','3','0','','620723');
INSERT INTO `qb_area` VALUES ('3002','351','高台县','3','0','','620724');
INSERT INTO `qb_area` VALUES ('3003','351','山丹县','3','0','','620725');
INSERT INTO `qb_area` VALUES ('3004','352','崆峒区','3','0','','620802');
INSERT INTO `qb_area` VALUES ('3005','352','泾川县','3','0','','620821');
INSERT INTO `qb_area` VALUES ('3006','352','灵台县','3','0','','620822');
INSERT INTO `qb_area` VALUES ('3007','352','崇信县','3','0','','620823');
INSERT INTO `qb_area` VALUES ('3008','352','华亭市','3','0','','620824');
INSERT INTO `qb_area` VALUES ('3009','352','庄浪县','3','0','','620825');
INSERT INTO `qb_area` VALUES ('3010','352','静宁县','3','0','','620826');
INSERT INTO `qb_area` VALUES ('3011','353','肃州区','3','0','','620902');
INSERT INTO `qb_area` VALUES ('3012','353','金塔县','3','0','','620921');
INSERT INTO `qb_area` VALUES ('3013','353','瓜州县','3','0','','620922');
INSERT INTO `qb_area` VALUES ('3014','353','肃北蒙古族自治县','3','0','','620923');
INSERT INTO `qb_area` VALUES ('3015','353','阿克塞哈萨克族自治县','3','0','','620924');
INSERT INTO `qb_area` VALUES ('3016','353','玉门市','3','0','','620981');
INSERT INTO `qb_area` VALUES ('3017','353','敦煌市','3','0','','620982');
INSERT INTO `qb_area` VALUES ('3018','354','西峰区','3','0','','621002');
INSERT INTO `qb_area` VALUES ('3019','354','庆城县','3','0','','621021');
INSERT INTO `qb_area` VALUES ('3020','354','环县','3','0','','621022');
INSERT INTO `qb_area` VALUES ('3021','354','华池县','3','0','','621023');
INSERT INTO `qb_area` VALUES ('3022','354','合水县','3','0','','621024');
INSERT INTO `qb_area` VALUES ('3023','354','正宁县','3','0','','621025');
INSERT INTO `qb_area` VALUES ('3024','354','宁县','3','0','','621026');
INSERT INTO `qb_area` VALUES ('3025','354','镇原县','3','0','','621027');
INSERT INTO `qb_area` VALUES ('3026','355','安定区','3','0','','621102');
INSERT INTO `qb_area` VALUES ('3027','355','通渭县','3','0','','621121');
INSERT INTO `qb_area` VALUES ('3028','355','陇西县','3','0','','621122');
INSERT INTO `qb_area` VALUES ('3029','355','渭源县','3','0','','621123');
INSERT INTO `qb_area` VALUES ('3030','355','临洮县','3','0','','621124');
INSERT INTO `qb_area` VALUES ('3031','355','漳县','3','0','','621125');
INSERT INTO `qb_area` VALUES ('3032','355','岷县','3','0','','621126');
INSERT INTO `qb_area` VALUES ('3033','356','武都区','3','0','','621202');
INSERT INTO `qb_area` VALUES ('3034','356','成县','3','0','','621221');
INSERT INTO `qb_area` VALUES ('3035','356','文县','3','0','','621222');
INSERT INTO `qb_area` VALUES ('3036','356','宕昌县','3','0','','621223');
INSERT INTO `qb_area` VALUES ('3037','356','康县','3','0','','621224');
INSERT INTO `qb_area` VALUES ('3038','356','西和县','3','0','','621225');
INSERT INTO `qb_area` VALUES ('3039','356','礼县','3','0','','621226');
INSERT INTO `qb_area` VALUES ('3040','356','徽县','3','0','','621227');
INSERT INTO `qb_area` VALUES ('3041','356','两当县','3','0','','621228');
INSERT INTO `qb_area` VALUES ('3042','357','临夏市','3','0','','622901');
INSERT INTO `qb_area` VALUES ('3043','357','临夏县','3','0','','622921');
INSERT INTO `qb_area` VALUES ('3044','357','康乐县','3','0','','622922');
INSERT INTO `qb_area` VALUES ('3045','357','永靖县','3','0','','622923');
INSERT INTO `qb_area` VALUES ('3046','357','广河县','3','0','','622924');
INSERT INTO `qb_area` VALUES ('3047','357','和政县','3','0','','622925');
INSERT INTO `qb_area` VALUES ('3048','357','东乡族自治县','3','0','','622926');
INSERT INTO `qb_area` VALUES ('3049','357','积石山保安族东乡族撒拉族自治县','3','0','','622927');
INSERT INTO `qb_area` VALUES ('3050','358','合作市','3','0','','623001');
INSERT INTO `qb_area` VALUES ('3051','358','临潭县','3','0','','623021');
INSERT INTO `qb_area` VALUES ('3052','358','卓尼县','3','0','','623022');
INSERT INTO `qb_area` VALUES ('3053','358','舟曲县','3','0','','623023');
INSERT INTO `qb_area` VALUES ('3054','358','迭部县','3','0','','623024');
INSERT INTO `qb_area` VALUES ('3055','358','玛曲县','3','0','','623025');
INSERT INTO `qb_area` VALUES ('3056','358','碌曲县','3','0','','623026');
INSERT INTO `qb_area` VALUES ('3057','358','夏河县','3','0','','623027');
INSERT INTO `qb_area` VALUES ('3058','359','城东区','3','0','','630102');
INSERT INTO `qb_area` VALUES ('3059','359','城中区','3','0','','630103');
INSERT INTO `qb_area` VALUES ('3060','359','城西区','3','0','','630104');
INSERT INTO `qb_area` VALUES ('3061','359','城北区','3','0','','630105');
INSERT INTO `qb_area` VALUES ('3062','359','大通回族土族自治县','3','0','','630121');
INSERT INTO `qb_area` VALUES ('3063','359','湟中县','3','0','','630122');
INSERT INTO `qb_area` VALUES ('3064','359','湟源县','3','0','','630123');
INSERT INTO `qb_area` VALUES ('3065','360','乐都区','3','0','','630202');
INSERT INTO `qb_area` VALUES ('3066','360','平安区','3','0','','630203');
INSERT INTO `qb_area` VALUES ('3067','360','民和回族土族自治县','3','0','','630222');
INSERT INTO `qb_area` VALUES ('3068','360','互助土族自治县','3','0','','630223');
INSERT INTO `qb_area` VALUES ('3069','360','化隆回族自治县','3','0','','630224');
INSERT INTO `qb_area` VALUES ('3070','360','循化撒拉族自治县','3','0','','630225');
INSERT INTO `qb_area` VALUES ('3071','361','门源回族自治县','3','0','','632221');
INSERT INTO `qb_area` VALUES ('3072','361','祁连县','3','0','','632222');
INSERT INTO `qb_area` VALUES ('3073','361','海晏县','3','0','','632223');
INSERT INTO `qb_area` VALUES ('3074','361','刚察县','3','0','','632224');
INSERT INTO `qb_area` VALUES ('3075','362','同仁县','3','0','','632321');
INSERT INTO `qb_area` VALUES ('3076','362','尖扎县','3','0','','632322');
INSERT INTO `qb_area` VALUES ('3077','362','泽库县','3','0','','632323');
INSERT INTO `qb_area` VALUES ('3078','362','河南蒙古族自治县','3','0','','632324');
INSERT INTO `qb_area` VALUES ('3079','363','共和县','3','0','','632521');
INSERT INTO `qb_area` VALUES ('3080','363','同德县','3','0','','632522');
INSERT INTO `qb_area` VALUES ('3081','363','贵德县','3','0','','632523');
INSERT INTO `qb_area` VALUES ('3082','363','兴海县','3','0','','632524');
INSERT INTO `qb_area` VALUES ('3083','363','贵南县','3','0','','632525');
INSERT INTO `qb_area` VALUES ('3084','364','玛沁县','3','0','','632621');
INSERT INTO `qb_area` VALUES ('3085','364','班玛县','3','0','','632622');
INSERT INTO `qb_area` VALUES ('3086','364','甘德县','3','0','','632623');
INSERT INTO `qb_area` VALUES ('3087','364','达日县','3','0','','632624');
INSERT INTO `qb_area` VALUES ('3088','364','久治县','3','0','','632625');
INSERT INTO `qb_area` VALUES ('3089','364','玛多县','3','0','','632626');
INSERT INTO `qb_area` VALUES ('3090','365','玉树市','3','0','','632701');
INSERT INTO `qb_area` VALUES ('3091','365','杂多县','3','0','','632722');
INSERT INTO `qb_area` VALUES ('3092','365','称多县','3','0','','632723');
INSERT INTO `qb_area` VALUES ('3093','365','治多县','3','0','','632724');
INSERT INTO `qb_area` VALUES ('3094','365','囊谦县','3','0','','632725');
INSERT INTO `qb_area` VALUES ('3095','365','曲麻莱县','3','0','','632726');
INSERT INTO `qb_area` VALUES ('3096','366','格尔木市','3','0','','632801');
INSERT INTO `qb_area` VALUES ('3097','366','德令哈市','3','0','','632802');
INSERT INTO `qb_area` VALUES ('3098','366','乌兰县','3','0','','632821');
INSERT INTO `qb_area` VALUES ('3099','366','都兰县','3','0','','632822');
INSERT INTO `qb_area` VALUES ('3100','366','天峻县','3','0','','632823');
INSERT INTO `qb_area` VALUES ('3101','367','兴庆区','3','0','','640104');
INSERT INTO `qb_area` VALUES ('3102','367','西夏区','3','0','','640105');
INSERT INTO `qb_area` VALUES ('3103','367','金凤区','3','0','','640106');
INSERT INTO `qb_area` VALUES ('3104','367','永宁县','3','0','','640121');
INSERT INTO `qb_area` VALUES ('3105','367','贺兰县','3','0','','640122');
INSERT INTO `qb_area` VALUES ('3106','367','灵武市','3','0','','640181');
INSERT INTO `qb_area` VALUES ('3107','368','大武口区','3','0','','640202');
INSERT INTO `qb_area` VALUES ('3108','368','惠农区','3','0','','640205');
INSERT INTO `qb_area` VALUES ('3109','368','平罗县','3','0','','640221');
INSERT INTO `qb_area` VALUES ('3110','369','利通区','3','0','','640302');
INSERT INTO `qb_area` VALUES ('3111','369','红寺堡区','3','0','','640303');
INSERT INTO `qb_area` VALUES ('3112','369','盐池县','3','0','','640323');
INSERT INTO `qb_area` VALUES ('3113','369','同心县','3','0','','640324');
INSERT INTO `qb_area` VALUES ('3114','369','青铜峡市','3','0','','640381');
INSERT INTO `qb_area` VALUES ('3115','370','原州区','3','0','','640402');
INSERT INTO `qb_area` VALUES ('3116','370','西吉县','3','0','','640422');
INSERT INTO `qb_area` VALUES ('3117','370','隆德县','3','0','','640423');
INSERT INTO `qb_area` VALUES ('3118','370','泾源县','3','0','','640424');
INSERT INTO `qb_area` VALUES ('3119','370','彭阳县','3','0','','640425');
INSERT INTO `qb_area` VALUES ('3120','371','沙坡头区','3','0','','640502');
INSERT INTO `qb_area` VALUES ('3121','371','中宁县','3','0','','640521');
INSERT INTO `qb_area` VALUES ('3122','371','海原县','3','0','','640522');
INSERT INTO `qb_area` VALUES ('3123','372','天山区','3','0','','650102');
INSERT INTO `qb_area` VALUES ('3124','372','沙依巴克区','3','0','','650103');
INSERT INTO `qb_area` VALUES ('3125','372','新市区','3','0','','650104');
INSERT INTO `qb_area` VALUES ('3126','372','水磨沟区','3','0','','650105');
INSERT INTO `qb_area` VALUES ('3127','372','头屯河区','3','0','','650106');
INSERT INTO `qb_area` VALUES ('3128','372','达坂城区','3','0','','650107');
INSERT INTO `qb_area` VALUES ('3129','372','米东区','3','0','','650109');
INSERT INTO `qb_area` VALUES ('3130','372','乌鲁木齐县','3','0','','650121');
INSERT INTO `qb_area` VALUES ('3131','373','独山子区','3','0','','650202');
INSERT INTO `qb_area` VALUES ('3132','373','克拉玛依区','3','0','','650203');
INSERT INTO `qb_area` VALUES ('3133','373','白碱滩区','3','0','','650204');
INSERT INTO `qb_area` VALUES ('3134','373','乌尔禾区','3','0','','650205');
INSERT INTO `qb_area` VALUES ('3135','374','高昌区','3','0','','650402');
INSERT INTO `qb_area` VALUES ('3136','374','鄯善县','3','0','','650421');
INSERT INTO `qb_area` VALUES ('3137','374','托克逊县','3','0','','650422');
INSERT INTO `qb_area` VALUES ('3138','375','伊州区','3','0','','650502');
INSERT INTO `qb_area` VALUES ('3139','375','巴里坤哈萨克自治县','3','0','','650521');
INSERT INTO `qb_area` VALUES ('3140','375','伊吾县','3','0','','650522');
INSERT INTO `qb_area` VALUES ('3141','376','昌吉市','3','0','','652301');
INSERT INTO `qb_area` VALUES ('3142','376','阜康市','3','0','','652302');
INSERT INTO `qb_area` VALUES ('3143','376','呼图壁县','3','0','','652323');
INSERT INTO `qb_area` VALUES ('3144','376','玛纳斯县','3','0','','652324');
INSERT INTO `qb_area` VALUES ('3145','376','奇台县','3','0','','652325');
INSERT INTO `qb_area` VALUES ('3146','376','吉木萨尔县','3','0','','652327');
INSERT INTO `qb_area` VALUES ('3147','376','木垒哈萨克自治县','3','0','','652328');
INSERT INTO `qb_area` VALUES ('3148','377','博乐市','3','0','','652701');
INSERT INTO `qb_area` VALUES ('3149','377','阿拉山口市','3','0','','652702');
INSERT INTO `qb_area` VALUES ('3150','377','精河县','3','0','','652722');
INSERT INTO `qb_area` VALUES ('3151','377','温泉县','3','0','','652723');
INSERT INTO `qb_area` VALUES ('3152','378','库尔勒市','3','0','','652801');
INSERT INTO `qb_area` VALUES ('3153','378','轮台县','3','0','','652822');
INSERT INTO `qb_area` VALUES ('3154','378','尉犁县','3','0','','652823');
INSERT INTO `qb_area` VALUES ('3155','378','若羌县','3','0','','652824');
INSERT INTO `qb_area` VALUES ('3156','378','且末县','3','0','','652825');
INSERT INTO `qb_area` VALUES ('3157','378','焉耆回族自治县','3','0','','652826');
INSERT INTO `qb_area` VALUES ('3158','378','和静县','3','0','','652827');
INSERT INTO `qb_area` VALUES ('3159','378','和硕县','3','0','','652828');
INSERT INTO `qb_area` VALUES ('3160','378','博湖县','3','0','','652829');
INSERT INTO `qb_area` VALUES ('3161','379','阿克苏市','3','0','','652901');
INSERT INTO `qb_area` VALUES ('3162','379','温宿县','3','0','','652922');
INSERT INTO `qb_area` VALUES ('3163','379','库车县','3','0','','652923');
INSERT INTO `qb_area` VALUES ('3164','379','沙雅县','3','0','','652924');
INSERT INTO `qb_area` VALUES ('3165','379','新和县','3','0','','652925');
INSERT INTO `qb_area` VALUES ('3166','379','拜城县','3','0','','652926');
INSERT INTO `qb_area` VALUES ('3167','379','乌什县','3','0','','652927');
INSERT INTO `qb_area` VALUES ('3168','379','阿瓦提县','3','0','','652928');
INSERT INTO `qb_area` VALUES ('3169','379','柯坪县','3','0','','652929');
INSERT INTO `qb_area` VALUES ('3170','380','阿图什市','3','0','','653001');
INSERT INTO `qb_area` VALUES ('3171','380','阿克陶县','3','0','','653022');
INSERT INTO `qb_area` VALUES ('3172','380','阿合奇县','3','0','','653023');
INSERT INTO `qb_area` VALUES ('3173','380','乌恰县','3','0','','653024');
INSERT INTO `qb_area` VALUES ('3174','381','喀什市','3','0','','653101');
INSERT INTO `qb_area` VALUES ('3175','381','疏附县','3','0','','653121');
INSERT INTO `qb_area` VALUES ('3176','381','疏勒县','3','0','','653122');
INSERT INTO `qb_area` VALUES ('3177','381','英吉沙县','3','0','','653123');
INSERT INTO `qb_area` VALUES ('3178','381','泽普县','3','0','','653124');
INSERT INTO `qb_area` VALUES ('3179','381','莎车县','3','0','','653125');
INSERT INTO `qb_area` VALUES ('3180','381','叶城县','3','0','','653126');
INSERT INTO `qb_area` VALUES ('3181','381','麦盖提县','3','0','','653127');
INSERT INTO `qb_area` VALUES ('3182','381','岳普湖县','3','0','','653128');
INSERT INTO `qb_area` VALUES ('3183','381','伽师县','3','0','','653129');
INSERT INTO `qb_area` VALUES ('3184','381','巴楚县','3','0','','653130');
INSERT INTO `qb_area` VALUES ('3185','381','塔什库尔干塔吉克自治县','3','0','','653131');
INSERT INTO `qb_area` VALUES ('3186','382','和田市','3','0','','653201');
INSERT INTO `qb_area` VALUES ('3187','382','和田县','3','0','','653221');
INSERT INTO `qb_area` VALUES ('3188','382','墨玉县','3','0','','653222');
INSERT INTO `qb_area` VALUES ('3189','382','皮山县','3','0','','653223');
INSERT INTO `qb_area` VALUES ('3190','382','洛浦县','3','0','','653224');
INSERT INTO `qb_area` VALUES ('3191','382','策勒县','3','0','','653225');
INSERT INTO `qb_area` VALUES ('3192','382','于田县','3','0','','653226');
INSERT INTO `qb_area` VALUES ('3193','382','民丰县','3','0','','653227');
INSERT INTO `qb_area` VALUES ('3194','383','伊宁市','3','0','','654002');
INSERT INTO `qb_area` VALUES ('3195','383','奎屯市','3','0','','654003');
INSERT INTO `qb_area` VALUES ('3196','383','霍尔果斯市','3','0','','654004');
INSERT INTO `qb_area` VALUES ('3197','383','伊宁县','3','0','','654021');
INSERT INTO `qb_area` VALUES ('3198','383','察布查尔锡伯自治县','3','0','','654022');
INSERT INTO `qb_area` VALUES ('3199','383','霍城县','3','0','','654023');
INSERT INTO `qb_area` VALUES ('3200','383','巩留县','3','0','','654024');
INSERT INTO `qb_area` VALUES ('3201','383','新源县','3','0','','654025');
INSERT INTO `qb_area` VALUES ('3202','383','昭苏县','3','0','','654026');
INSERT INTO `qb_area` VALUES ('3203','383','特克斯县','3','0','','654027');
INSERT INTO `qb_area` VALUES ('3204','383','尼勒克县','3','0','','654028');
INSERT INTO `qb_area` VALUES ('3205','384','塔城市','3','0','','654201');
INSERT INTO `qb_area` VALUES ('3206','384','乌苏市','3','0','','654202');
INSERT INTO `qb_area` VALUES ('3207','384','额敏县','3','0','','654221');
INSERT INTO `qb_area` VALUES ('3208','384','沙湾县','3','0','','654223');
INSERT INTO `qb_area` VALUES ('3209','384','托里县','3','0','','654224');
INSERT INTO `qb_area` VALUES ('3210','384','裕民县','3','0','','654225');
INSERT INTO `qb_area` VALUES ('3211','384','和布克赛尔蒙古自治县','3','0','','654226');
INSERT INTO `qb_area` VALUES ('3212','385','阿勒泰市','3','0','','654301');
INSERT INTO `qb_area` VALUES ('3213','385','布尔津县','3','0','','654321');
INSERT INTO `qb_area` VALUES ('3214','385','富蕴县','3','0','','654322');
INSERT INTO `qb_area` VALUES ('3215','385','福海县','3','0','','654323');
INSERT INTO `qb_area` VALUES ('3216','385','哈巴河县','3','0','','654324');
INSERT INTO `qb_area` VALUES ('3217','385','青河县','3','0','','654325');
INSERT INTO `qb_area` VALUES ('3218','385','吉木乃县','3','0','','654326');
INSERT INTO `qb_area` VALUES ('3219','386','中正区','3','0','','830101');
INSERT INTO `qb_area` VALUES ('3220','386','大同区','3','0','','830102');
INSERT INTO `qb_area` VALUES ('3221','386','中山区','3','0','','830103');
INSERT INTO `qb_area` VALUES ('3222','386','万华区','3','0','','830104');
INSERT INTO `qb_area` VALUES ('3223','386','信义区','3','0','','830105');
INSERT INTO `qb_area` VALUES ('3224','386','松山区','3','0','','830106');
INSERT INTO `qb_area` VALUES ('3225','386','大安区','3','0','','830107');
INSERT INTO `qb_area` VALUES ('3226','386','南港区','3','0','','830108');
INSERT INTO `qb_area` VALUES ('3227','386','北投区','3','0','','830109');
INSERT INTO `qb_area` VALUES ('3228','386','内湖区','3','0','','830110');
INSERT INTO `qb_area` VALUES ('3229','386','士林区','3','0','','830111');
INSERT INTO `qb_area` VALUES ('3230','386','文山区','3','0','','830112');
INSERT INTO `qb_area` VALUES ('3231','387','板桥区','3','0','','830201');
INSERT INTO `qb_area` VALUES ('3232','387','土城区','3','0','','830202');
INSERT INTO `qb_area` VALUES ('3233','387','新庄区','3','0','','830203');
INSERT INTO `qb_area` VALUES ('3234','387','新店区','3','0','','830204');
INSERT INTO `qb_area` VALUES ('3235','387','深坑区','3','0','','830205');
INSERT INTO `qb_area` VALUES ('3236','387','石碇区','3','0','','830206');
INSERT INTO `qb_area` VALUES ('3237','387','坪林区','3','0','','830207');
INSERT INTO `qb_area` VALUES ('3238','387','乌来区','3','0','','830208');
INSERT INTO `qb_area` VALUES ('3239','387','五股区','3','0','','830209');
INSERT INTO `qb_area` VALUES ('3240','387','八里区','3','0','','830210');
INSERT INTO `qb_area` VALUES ('3241','387','林口区','3','0','','830211');
INSERT INTO `qb_area` VALUES ('3242','387','淡水区','3','0','','830212');
INSERT INTO `qb_area` VALUES ('3243','387','中和区','3','0','','830213');
INSERT INTO `qb_area` VALUES ('3244','387','永和区','3','0','','830214');
INSERT INTO `qb_area` VALUES ('3245','387','三重区','3','0','','830215');
INSERT INTO `qb_area` VALUES ('3246','387','芦洲区','3','0','','830216');
INSERT INTO `qb_area` VALUES ('3247','387','泰山区','3','0','','830217');
INSERT INTO `qb_area` VALUES ('3248','387','树林区','3','0','','830218');
INSERT INTO `qb_area` VALUES ('3249','387','莺歌区','3','0','','830219');
INSERT INTO `qb_area` VALUES ('3250','387','三峡区','3','0','','830220');
INSERT INTO `qb_area` VALUES ('3251','387','汐止区','3','0','','830221');
INSERT INTO `qb_area` VALUES ('3252','387','金山区','3','0','','830222');
INSERT INTO `qb_area` VALUES ('3253','387','万里区','3','0','','830223');
INSERT INTO `qb_area` VALUES ('3254','387','三芝区','3','0','','830224');
INSERT INTO `qb_area` VALUES ('3255','387','石门区','3','0','','830225');
INSERT INTO `qb_area` VALUES ('3256','387','瑞芳区','3','0','','830226');
INSERT INTO `qb_area` VALUES ('3257','387','贡寮区','3','0','','830227');
INSERT INTO `qb_area` VALUES ('3258','387','双溪区','3','0','','830228');
INSERT INTO `qb_area` VALUES ('3259','387','平溪区','3','0','','830229');
INSERT INTO `qb_area` VALUES ('3260','388','桃园区','3','0','','830301');
INSERT INTO `qb_area` VALUES ('3261','388','中坜区','3','0','','830302');
INSERT INTO `qb_area` VALUES ('3262','388','平镇区','3','0','','830303');
INSERT INTO `qb_area` VALUES ('3263','388','八德区','3','0','','830304');
INSERT INTO `qb_area` VALUES ('3264','388','杨梅区','3','0','','830305');
INSERT INTO `qb_area` VALUES ('3265','388','芦竹区','3','0','','830306');
INSERT INTO `qb_area` VALUES ('3266','388','大溪区','3','0','','830307');
INSERT INTO `qb_area` VALUES ('3267','388','龙潭区','3','0','','830308');
INSERT INTO `qb_area` VALUES ('3268','388','龟山区','3','0','','830309');
INSERT INTO `qb_area` VALUES ('3269','388','大园区','3','0','','830310');
INSERT INTO `qb_area` VALUES ('3270','388','观音区','3','0','','830311');
INSERT INTO `qb_area` VALUES ('3271','388','新屋区','3','0','','830312');
INSERT INTO `qb_area` VALUES ('3272','388','复兴区','3','0','','830313');
INSERT INTO `qb_area` VALUES ('3273','389','中区','3','0','','830401');
INSERT INTO `qb_area` VALUES ('3274','389','东区','3','0','','830402');
INSERT INTO `qb_area` VALUES ('3275','389','西区','3','0','','830403');
INSERT INTO `qb_area` VALUES ('3276','389','南区','3','0','','830404');
INSERT INTO `qb_area` VALUES ('3277','389','北区','3','0','','830405');
INSERT INTO `qb_area` VALUES ('3278','389','西屯区','3','0','','830406');
INSERT INTO `qb_area` VALUES ('3279','389','南屯区','3','0','','830407');
INSERT INTO `qb_area` VALUES ('3280','389','北屯区','3','0','','830408');
INSERT INTO `qb_area` VALUES ('3281','389','丰原区','3','0','','830409');
INSERT INTO `qb_area` VALUES ('3282','389','大里区','3','0','','830410');
INSERT INTO `qb_area` VALUES ('3283','389','太平区','3','0','','830411');
INSERT INTO `qb_area` VALUES ('3284','389','东势区','3','0','','830412');
INSERT INTO `qb_area` VALUES ('3285','389','大甲区','3','0','','830413');
INSERT INTO `qb_area` VALUES ('3286','389','清水区','3','0','','830414');
INSERT INTO `qb_area` VALUES ('3287','389','沙鹿区','3','0','','830415');
INSERT INTO `qb_area` VALUES ('3288','389','梧栖区','3','0','','830416');
INSERT INTO `qb_area` VALUES ('3289','389','后里区','3','0','','830417');
INSERT INTO `qb_area` VALUES ('3290','389','神冈区','3','0','','830418');
INSERT INTO `qb_area` VALUES ('3291','389','潭子区','3','0','','830419');
INSERT INTO `qb_area` VALUES ('3292','389','大雅区','3','0','','830420');
INSERT INTO `qb_area` VALUES ('3293','389','新小区','3','0','','830421');
INSERT INTO `qb_area` VALUES ('3294','389','石冈区','3','0','','830422');
INSERT INTO `qb_area` VALUES ('3295','389','外埔区','3','0','','830423');
INSERT INTO `qb_area` VALUES ('3296','389','大安区','3','0','','830424');
INSERT INTO `qb_area` VALUES ('3297','389','乌日区','3','0','','830425');
INSERT INTO `qb_area` VALUES ('3298','389','大肚区','3','0','','830426');
INSERT INTO `qb_area` VALUES ('3299','389','龙井区','3','0','','830427');
INSERT INTO `qb_area` VALUES ('3300','389','雾峰区','3','0','','830428');
INSERT INTO `qb_area` VALUES ('3301','389','和平区','3','0','','830429');
INSERT INTO `qb_area` VALUES ('3302','390','中西区','3','0','','830501');
INSERT INTO `qb_area` VALUES ('3303','390','东区','3','0','','830502');
INSERT INTO `qb_area` VALUES ('3304','390','南区','3','0','','830503');
INSERT INTO `qb_area` VALUES ('3305','390','北区','3','0','','830504');
INSERT INTO `qb_area` VALUES ('3306','390','安平区','3','0','','830505');
INSERT INTO `qb_area` VALUES ('3307','390','安南区','3','0','','830506');
INSERT INTO `qb_area` VALUES ('3308','390','永康区','3','0','','830507');
INSERT INTO `qb_area` VALUES ('3309','390','归仁区','3','0','','830508');
INSERT INTO `qb_area` VALUES ('3310','390','新化区','3','0','','830509');
INSERT INTO `qb_area` VALUES ('3311','390','左镇区','3','0','','830510');
INSERT INTO `qb_area` VALUES ('3312','390','玉井区','3','0','','830511');
INSERT INTO `qb_area` VALUES ('3313','390','楠西区','3','0','','830512');
INSERT INTO `qb_area` VALUES ('3314','390','南化区','3','0','','830513');
INSERT INTO `qb_area` VALUES ('3315','390','仁德区','3','0','','830514');
INSERT INTO `qb_area` VALUES ('3316','390','关庙区','3','0','','830515');
INSERT INTO `qb_area` VALUES ('3317','390','龙崎区','3','0','','830516');
INSERT INTO `qb_area` VALUES ('3318','390','官田区','3','0','','830517');
INSERT INTO `qb_area` VALUES ('3319','390','麻豆区','3','0','','830518');
INSERT INTO `qb_area` VALUES ('3320','390','佳里区','3','0','','830519');
INSERT INTO `qb_area` VALUES ('3321','390','西港区','3','0','','830520');
INSERT INTO `qb_area` VALUES ('3322','390','七股区','3','0','','830521');
INSERT INTO `qb_area` VALUES ('3323','390','将军区','3','0','','830522');
INSERT INTO `qb_area` VALUES ('3324','390','学甲区','3','0','','830523');
INSERT INTO `qb_area` VALUES ('3325','390','北门区','3','0','','830524');
INSERT INTO `qb_area` VALUES ('3326','390','新营区','3','0','','830525');
INSERT INTO `qb_area` VALUES ('3327','390','后壁区','3','0','','830526');
INSERT INTO `qb_area` VALUES ('3328','390','白河区','3','0','','830527');
INSERT INTO `qb_area` VALUES ('3329','390','东山区','3','0','','830528');
INSERT INTO `qb_area` VALUES ('3330','390','六甲区','3','0','','830529');
INSERT INTO `qb_area` VALUES ('3331','390','下营区','3','0','','830530');
INSERT INTO `qb_area` VALUES ('3332','390','柳营区','3','0','','830531');
INSERT INTO `qb_area` VALUES ('3333','390','盐水区','3','0','','830532');
INSERT INTO `qb_area` VALUES ('3334','390','善化区','3','0','','830533');
INSERT INTO `qb_area` VALUES ('3335','390','大内区','3','0','','830534');
INSERT INTO `qb_area` VALUES ('3336','390','山上区','3','0','','830535');
INSERT INTO `qb_area` VALUES ('3337','390','新市区','3','0','','830536');
INSERT INTO `qb_area` VALUES ('3338','390','安定区','3','0','','830537');
INSERT INTO `qb_area` VALUES ('3339','391','楠梓区','3','0','','830601');
INSERT INTO `qb_area` VALUES ('3340','391','左营区','3','0','','830602');
INSERT INTO `qb_area` VALUES ('3341','391','鼓山区','3','0','','830603');
INSERT INTO `qb_area` VALUES ('3342','391','三民区','3','0','','830604');
INSERT INTO `qb_area` VALUES ('3343','391','盐埕区','3','0','','830605');
INSERT INTO `qb_area` VALUES ('3344','391','前金区','3','0','','830606');
INSERT INTO `qb_area` VALUES ('3345','391','新兴区','3','0','','830607');
INSERT INTO `qb_area` VALUES ('3346','391','苓雅区','3','0','','830608');
INSERT INTO `qb_area` VALUES ('3347','391','前镇区','3','0','','830609');
INSERT INTO `qb_area` VALUES ('3348','391','旗津区','3','0','','830610');
INSERT INTO `qb_area` VALUES ('3349','391','小港区','3','0','','830611');
INSERT INTO `qb_area` VALUES ('3350','391','凤山区','3','0','','830612');
INSERT INTO `qb_area` VALUES ('3351','391','大寮区','3','0','','830613');
INSERT INTO `qb_area` VALUES ('3352','391','鸟松区','3','0','','830614');
INSERT INTO `qb_area` VALUES ('3353','391','林园区','3','0','','830615');
INSERT INTO `qb_area` VALUES ('3354','391','仁武区','3','0','','830616');
INSERT INTO `qb_area` VALUES ('3355','391','大树区','3','0','','830617');
INSERT INTO `qb_area` VALUES ('3356','391','大社区','3','0','','830618');
INSERT INTO `qb_area` VALUES ('3357','391','冈山区','3','0','','830619');
INSERT INTO `qb_area` VALUES ('3358','391','路竹区','3','0','','830620');
INSERT INTO `qb_area` VALUES ('3359','391','桥头区','3','0','','830621');
INSERT INTO `qb_area` VALUES ('3360','391','梓官区','3','0','','830622');
INSERT INTO `qb_area` VALUES ('3361','391','弥陀区','3','0','','830623');
INSERT INTO `qb_area` VALUES ('3362','391','永安区','3','0','','830624');
INSERT INTO `qb_area` VALUES ('3363','391','燕巢区','3','0','','830625');
INSERT INTO `qb_area` VALUES ('3364','391','阿莲区','3','0','','830626');
INSERT INTO `qb_area` VALUES ('3365','391','茄萣区','3','0','','830627');
INSERT INTO `qb_area` VALUES ('3366','391','湖内区','3','0','','830628');
INSERT INTO `qb_area` VALUES ('3367','391','旗山区','3','0','','830629');
INSERT INTO `qb_area` VALUES ('3368','391','美浓区','3','0','','830630');
INSERT INTO `qb_area` VALUES ('3369','391','内门区','3','0','','830631');
INSERT INTO `qb_area` VALUES ('3370','391','杉林区','3','0','','830632');
INSERT INTO `qb_area` VALUES ('3371','391','甲仙区','3','0','','830633');
INSERT INTO `qb_area` VALUES ('3372','391','六龟区','3','0','','830634');
INSERT INTO `qb_area` VALUES ('3373','391','茂林区','3','0','','830635');
INSERT INTO `qb_area` VALUES ('3374','391','桃源区','3','0','','830636');
INSERT INTO `qb_area` VALUES ('3375','391','那玛夏区','3','0','','830637');
INSERT INTO `qb_area` VALUES ('3376','392','中正区','3','0','','830701');
INSERT INTO `qb_area` VALUES ('3377','392','七堵区','3','0','','830702');
INSERT INTO `qb_area` VALUES ('3378','392','暖暖区','3','0','','830703');
INSERT INTO `qb_area` VALUES ('3379','392','仁爱区','3','0','','830704');
INSERT INTO `qb_area` VALUES ('3380','392','中山区','3','0','','830705');
INSERT INTO `qb_area` VALUES ('3381','392','安乐区','3','0','','830706');
INSERT INTO `qb_area` VALUES ('3382','392','信义区','3','0','','830707');
INSERT INTO `qb_area` VALUES ('3383','393','东区','3','0','','830801');
INSERT INTO `qb_area` VALUES ('3384','393','北区','3','0','','830802');
INSERT INTO `qb_area` VALUES ('3385','393','香山区','3','0','','830803');
INSERT INTO `qb_area` VALUES ('3386','394','东区','3','0','','830901');
INSERT INTO `qb_area` VALUES ('3387','394','西区','3','0','','830902');
INSERT INTO `qb_attachment` VALUES ('1','1','1_201901141955042f45a.jpeg','cms','uploads/images/20190114/1_201901141955042f45a.jpeg','','','image/jpeg','jpeg','84168','4cae7a9c62cf074cc87e016fcbe11089','fed17dcde7489f273e5515af54e7d05fbc56de90','local','0','1547466905','1547466905','100','1');
INSERT INTO `qb_attachment` VALUES ('2','1','bdaa228505b2ae6500cb0899e519299e.mp4','cms','uploads/files/20190116/1_20190116135440d4d6e.mp4','','','video/mp4','mp4','1048897','d37a37c82017b00f4659f3ff6665a1da','0c9564efec9bfe857650991623f52a256028331b','local','0','1547618080','1547618080','100','1');
INSERT INTO `qb_attachment` VALUES ('3','2','2_201901161824427a118.jpeg','cms','uploads/images/20190116/2_201901161824427a118.jpeg','','','image/jpeg','jpeg','52233','c3a3b1f094410b18734f524fde8713b8','d696366f56ece1d948c0251c3954cd544081b6f3','local','0','1547634282','1547634282','100','1');
INSERT INTO `qb_attachment` VALUES ('4','1','TB22bPInH1YBuNjSszhXXcUsFXa_!!2651467722.jpg','','uploads/images/20190121/1_2019012111570919c2f.jpg','','','image/jpeg','jpg','253972','a3f8171bddeb28df83e7cb2c88b9d465','46d70231549003db05472473b510e61ef3b69cc0','local','0','1548043029','1548043029','100','1');
INSERT INTO `qb_attachment` VALUES ('5','1','TB2fOKcfvuSBuNkHFqDXXXfhVXa_!!2651467722.jpg','','uploads/images/20190121/1_2019012111570958ef5.jpg','','','image/jpeg','jpg','191524','69cfb1524a2163167c81f1ad18623c10','d937315fcc69d20b24ba4e62074d556f350457d6','local','0','1548043029','1548043029','100','1');
INSERT INTO `qb_attachment` VALUES ('6','1','TB2B6YznQyWBuNjy0FpXXassXXa_!!2651467722.jpg','','uploads/images/20190121/1_20190121115710c7a4d.jpg','','','image/jpeg','jpg','188984','4dce01a95c66e46f78def46e5ed23349','ab813956b83a94a693b37c4e992920a29091685c','local','0','1548043030','1548043030','100','1');
INSERT INTO `qb_attachment` VALUES ('7','1','TB2zNP0nNWYBuNjy1zkXXXGGpXa_!!2651467722.jpg','','uploads/images/20190121/1_201901211157103777b.jpg','','','image/jpeg','jpg','133876','cfb72b875a5b2136ac43661ed7a4149b','8a63e63e4dc752c81b37e7690a2de990383d7098','local','0','1548043030','1548043030','100','1');
INSERT INTO `qb_attachment` VALUES ('8','1','TB2M5h4fviSBuNkSnhJXXbDcpXa_!!2651467722.jpg','','uploads/images/20190121/1_201901211157103776b.jpg','','','image/jpeg','jpg','173262','7d934448c85e738710cf45c7c1a2348f','b614c8d79ae662843a37d74c7635d362a0b81c6a','local','0','1548043030','1548043030','100','1');
INSERT INTO `qb_attachment` VALUES ('9','1','TB2v0Wpb22H8KJjy0FcXXaDlFXa_!!811194503.jpg','','uploads/images/20190121/1_201901211205577ea14.jpg','','','image/jpeg','jpg','285295','9f31b8eb1ad4a8a533c3dbc6d07e8115','01ba94afc53955286c782a128e5a89f209b8e948','local','0','1548043557','1548043557','100','1');
INSERT INTO `qb_attachment` VALUES ('10','1','TB2Po3oalLN8KJjSZPhXXc.spXa_!!811194503.jpg','','uploads/images/20190121/1_20190121120557d1eca.jpg','','','image/jpeg','jpg','251798','143f213099041a6ed35d3a3000c7e0fb','57143d8c71c5936cb8c10b9d10acdeab2675e47e','local','0','1548043557','1548043557','100','1');
INSERT INTO `qb_attachment` VALUES ('11','1','TB2MjUgbJbJ8KJjy1zjXXaqapXa_!!811194503.jpg','','uploads/images/20190121/1_20190121120557b40f0.jpg','','','image/jpeg','jpg','165898','b9d6a82bf3fe54c8de3990e456f85f8c','b6de8a4eb8d8234810569ea09a37a570957c9007','local','0','1548043557','1548043557','100','1');
INSERT INTO `qb_attachment` VALUES ('12','1','TB2vAkyalfM8KJjSZFhXXcRyFXa_!!811194503.jpg','','uploads/images/20190121/1_20190121120557b790f.jpg','','','image/jpeg','jpg','119796','e1c300b6a40acc23c2c29a21cb7495be','0ebebe1033d0c33fafa7a641df647672f3cbc537','local','0','1548043557','1548043557','100','1');
INSERT INTO `qb_attachment` VALUES ('13','1','TB2uOwxXAfb_uJkSnaVXXXFmVXa_!!811194503.jpg','','uploads/images/20190121/1_20190121120558e7051.jpg','','','image/jpeg','jpg','130773','f6b1c778130b4205e2fd9bfda1edb2b5','86f76737d239810a0ed8663a9a0af5ef90c98f53','local','0','1548043558','1548043558','100','1');
INSERT INTO `qb_attachment` VALUES ('14','1','TB2T1UBadHO8KJjSZFtXXchfXXa_!!811194503.jpg','','uploads/images/20190121/1_20190121120558ec19d.jpg','','','image/jpeg','jpg','81574','6b66e44a3114525431805d6cde1c5768','fb598a05ad92485ad31193860ebb4f2943e0cde6','local','0','1548043558','1548043558','100','1');
INSERT INTO `qb_attachment` VALUES ('15','1','TB2vKl_J7KWBuNjy1zjXXcOypXa_!!2534156366.jpg','','uploads/images/20190121/1_20190121141414f94d6.jpg','','','image/jpeg','jpg','119487','637f3672e5c6010ce083b39799607e50','0ff558fa4f0c0f38c930539039808b625ce37b7b','local','0','1548051254','1548051254','100','1');
INSERT INTO `qb_attachment` VALUES ('16','1','TB2C_FQBLiSBuNkSnhJXXbDcpXa_!!2534156366.jpg','','uploads/images/20190121/1_2019012114141524575.jpg','','','image/jpeg','jpg','108682','b3f325759a3100a96e58463d7c543a9d','cb02ccd14bbf971f24e8bf16cc0cd1a0281616cb','local','0','1548051255','1548051255','100','1');
INSERT INTO `qb_attachment` VALUES ('17','1','TB2oHBBJ4SYBuNjSsphXXbGvVXa_!!2534156366.jpg','','uploads/images/20190121/1_2019012114141585c24.jpg','','','image/jpeg','jpg','272473','c1945211150726979dd938b06d4ff861','17513d9d9ece841144a6a0ce29d8d38d9557f274','local','0','1548051255','1548051255','100','1');
INSERT INTO `qb_attachment` VALUES ('18','1','TB24EquBRmWBuNkSndVXXcsApXa_!!2534156366.jpg','','uploads/images/20190121/1_20190121141415d4f0f.jpg','','','image/jpeg','jpg','101923','1af8a76a8acc19589633c862bfb99367','d00d0a0ff7015127cfd212ba5489e8a44f2cc61f','local','0','1548051255','1548051255','100','1');
INSERT INTO `qb_attachment` VALUES ('19','1','TB26fssJ7SWBuNjSszdXXbeSpXa_!!2534156366.jpg','','uploads/images/20190121/1_201901211414151feca.jpg','','','image/jpeg','jpg','100332','6bf1325557fe47ce3eba18431d5ea769','9b1dac328be9fa296aaa14513a6daf4a9676dd9d','local','0','1548051255','1548051255','100','1');
INSERT INTO `qb_attachment` VALUES ('20','1','TB2O0lnJVmWBuNjSspdXXbugXXa_!!2534156366.jpg','','uploads/images/20190121/1_2019012114141521c38.jpg','','','image/jpeg','jpg','198867','cfb768df4d3ff40e218d08cfdb6f5d9a','2132445be86bf52d22a2c6717fbf0dd060e8fca5','local','0','1548051255','1548051255','100','1');
INSERT INTO `qb_attachment` VALUES ('21','1','TB2XdFWJ3aTBuNjSszfXXXgfpXa_!!2534156366.jpg','','uploads/images/20190121/1_201901211414165b2ec.jpg','','','image/jpeg','jpg','144134','7ba67fcffab80acf52a57b32803aa0d8','74e19ff30add755485005bb6acbf9acfee6792ef','local','0','1548051256','1548051256','100','1');
INSERT INTO `qb_attachment` VALUES ('22','1','TB2as9KJ7yWBuNjy0FpXXassXXa_!!2534156366.jpg','','uploads/images/20190121/1_20190121141416c7a04.jpg','','','image/jpeg','jpg','202698','e527947781825f03f343423f7c3e7e73','bfc0150609f807dd1eff6e188b472cfa20802d29','local','0','1548051256','1548051256','100','1');
INSERT INTO `qb_attachment` VALUES ('23','1','TB2XuiVmL6TBKNjSZJiXXbKVFXa_!!2534156366.jpg','','uploads/images/20190121/1_20190121141416de132.jpg','','','image/jpeg','jpg','121006','b876a064b065415b897b640226d13f9a','52555c37cbad0b28da8707ff2fafe9a10334cc89','local','0','1548051256','1548051256','100','1');
INSERT INTO `qb_attachment` VALUES ('24','1','2ef484dfba004f58b3d3f33ceff362ad.jpg','','uploads/pop/20190126/1_201901261024295da16.jpg','','','image/jpeg','jpg','4962','62d2516ec93de20ab7b38171f8e1231b','68d1e4bbc2618d2e652f2a6340150ecab673aa6f','local','0','1548469469','1548469469','100','1');
INSERT INTO `qb_attachment` VALUES ('25','1','3dce1f388c6642e485555637a7ac51c2.jpg','','uploads/pop/20190126/1_20190126102432fa156.jpg','','','image/jpeg','jpg','8519','ca9702ed5a6a1ac05261db3b3b5d1b68','f95b1532b8c18d859e1dd90ceac8198a988e5096','local','0','1548469472','1548469472','100','1');
INSERT INTO `qb_attachment` VALUES ('26','1','1_20190127141131629be.jpeg','cms','uploads/images/20190127/1_20190127141131629be.jpeg','','','image/jpeg','jpeg','5100','8ecf04cdba9d923b495aa3e253486d86','a3a83ec2cbd34f51047d0fc6de58e3e98d236759','local','0','1548569491','1548569491','100','1');
INSERT INTO `qb_attachment` VALUES ('27','1','1_2019012714140696ad1.jpeg','cms','uploads/images/20190127/1_2019012714140696ad1.jpeg','','','image/jpeg','jpeg','14527','c0073af8f255a135f1f645787c632f4d','c59ef45bd07bb7f956342c9854991e2c634f78a4','local','0','1548569646','1548569646','100','1');
INSERT INTO `qb_attachment` VALUES ('28','1','1_201901271416583ac75.jpeg','cms','uploads/images/20190127/1_201901271416583ac75.jpeg','','','image/jpeg','jpeg','159693','ab1b8989b3a5178cbd96d23b561eefeb','5d03d8c9582e0314cea87f1dc2bf1500424fab9e','local','0','1548569819','1548569819','100','1');
INSERT INTO `qb_attachment` VALUES ('29','1','TB1nZfjcCYH8KJjSspdXXcRgVXa_!!0-item_pic.jpg_60x60q90.jpg','','uploads/images/20190128/1_201901281547486f065.jpg','','','image/jpeg','jpg','1675','cbbc4b038ad3a09066fbfe52562d4fff','aa68c0f0fee3250ad69e3ba28dfe34ac85fc562b','local','0','1548661668','1548661668','100','1');
INSERT INTO `qb_attachment` VALUES ('30','1','TB254eobxolyKJjSZPfXXawNpXa_!!3210207250.jpg_60x60q90.jpg','','uploads/images/20190128/1_20190128154748c673e.jpg','','','image/jpeg','jpg','1242','6d86a3cec3916ca798e80a1aa716a561','f19b18bca7793a286f5fc367ceafe3a06ba683f1','local','0','1548661668','1548661668','100','1');
INSERT INTO `qb_attachment` VALUES ('31','1','TB2DI2rXRUSMeJjSspfXXX0VFXa_!!3210207250.jpg_60x60q90.jpg','','uploads/images/20190128/1_2019012815474926393.jpg','','','image/jpeg','jpg','1936','dabafb2b851b4b5c49ca09fb6d3231e1','f0b208f79a8094539eec8e14a3870d12e846a1fe','local','0','1548661669','1548661669','100','1');
INSERT INTO `qb_attachment` VALUES ('32','1','TB2UPOJbrAlyKJjSZFBXXbtiFXa_!!3210207250.jpg_60x60q90.jpg','','uploads/images/20190128/1_20190128154749f9cd3.jpg','','','image/jpeg','jpg','1376','4cd3465813fd00dd4e7ac9958c0c94c1','7e2d6f661ea2615567d2c1d5d531502347678cf1','local','0','1548661669','1548661669','100','1');
INSERT INTO `qb_attachment` VALUES ('33','1','9ab8f75d-8ed3-4479-8d67-59dbafc076fe.jpg','','uploads/pop/20190218/1_20190218180434b61f1.jpg','','','image/jpeg','jpg','9158','2918a79cdb7e6243b20b540182f97317','c99c8ecf85786bcc91d26ffebcaab5a9d72dfe1e','local','0','1550484274','1550484274','100','1');
INSERT INTO `qb_attachment` VALUES ('34','1','20ea7dab15fb488aa130296e7409767c.jpg','','uploads/pop/20190218/1_2019021818060246ec5.jpg','','','image/jpeg','jpg','6460','46e555305463a50b734f813467fc9443','bfa4b05c15d19c8ba8593c77f19d627411624372','local','0','1550484362','1550484362','100','1');
INSERT INTO `qb_attachment` VALUES ('35','1','02e16e825e664c5893258abaf890b8f0.jpg','','uploads/pop/20190219/1_2019021912001732b72.jpg','','','image/jpeg','jpg','5934','eca8e46875ae366f17d910cc974e54d2','ceaf673704f0306c768263f473294e188a97c628','local','0','1550548817','1550548817','100','1');
INSERT INTO `qb_attachment` VALUES ('36','1','4b6644135f8049b1bc44ee80456f77c6.jpg','','uploads/pop/20190219/1_2019021912002133d37.jpg','','','image/jpeg','jpg','7757','2df865118dcbd4d6ac3eb0b9d9a7404f','4dc788280a4813c09526df922e5813d084ddae05','local','0','1550548821','1550548821','100','1');
INSERT INTO `qb_attachment` VALUES ('37','1','1_20190307135240256ab.jpeg','cms','uploads/images/20190307/1_20190307135240256ab.jpeg','','','image/jpeg','jpeg','160194','a5d2d2960c6656171ef026f62c88f9fc','c2b184104969358f85aad59d64f7afa3673d8cc0','local','0','1551937961','1551937961','100','1');
INSERT INTO `qb_bbs_content` VALUES ('1','1','1');
INSERT INTO `qb_bbs_content` VALUES ('2','1','1');
INSERT INTO `qb_bbs_content` VALUES ('3','1','1');
INSERT INTO `qb_bbs_content` VALUES ('4','1','8');
INSERT INTO `qb_bbs_content` VALUES ('5','1','6');
INSERT INTO `qb_bbs_content1` VALUES ('1','1','19','123123','1','1','19','1','0','1548659704','1548663508','1548663508','uploads/images/20190128/1_20190128151456cf3d9.jpeg','','0','0','0','0','1','1','1','0','0','asd','','0','');
INSERT INTO `qb_bbs_content1` VALUES ('2','1','19','顺丰控股回应&quot;负债300亿&quot;：直营模式问题；王欣社交APP疑去掉“马桶”','1','1','50','1','0','1548661671','1550129511','1550129511','uploads/images/20190128/1_201901281547200a690.jpeg','','0','0','0','0','5','8','2','0','0','admin','','0','');
INSERT INTO `qb_bbs_content1` VALUES ('3','1','19','123123','0','1','26','1','0','1548662837','1554717206','1554717206','','','0','0','0','0','2','5','1','0','0','admin','其他手机','0','aabb、qqww、asd、');
INSERT INTO `qb_bbs_content1` VALUES ('4','1','19','888888888','0','8','62','1','0','1548662973','1554190757','1554190757','','','0','0','0','0','3','1','1','0','0','admin','其他手机','0','qqww、');
INSERT INTO `qb_bbs_content1` VALUES ('5','1','19','888888','0','6','6','1','0','1550128570','1550128644','1550128570','','','0','0','0','0','2','0','0','0','0','','其他手机','0','asd、');
INSERT INTO `qb_bbs_contents` VALUES ('1','<p>123213123133213123123</p>');
INSERT INTO `qb_bbs_contents` VALUES ('2','<p>1111111111111111111111111111111123</p><p><img src=\"/public/uploads/images/20190128/1_201901281547486f065.jpg\" style=\"\" title=\"TB1nZfjcCYH8KJjSspdXXcRgVXa_!!0-item_pic.jpg_60x60q90.jpg\"/></p><p><img src=\"/public/uploads/images/20190128/1_20190128154748c673e.jpg\" style=\"\" title=\"TB254eobxolyKJjSZPfXXawNpXa_!!3210207250.jpg_60x60q90.jpg\"/></p><p><img src=\"/public/uploads/images/20190128/1_2019012815474926393.jpg\" style=\"\" title=\"TB2DI2rXRUSMeJjSspfXXX0VFXa_!!3210207250.jpg_60x60q90.jpg\"/></p><p><img src=\"/public/uploads/images/20190128/1_20190128154749f9cd3.jpg\" style=\"\" title=\"TB2UPOJbrAlyKJjSZFBXXbtiFXa_!!3210207250.jpg_60x60q90.jpg\"/></p><p><br/></p>');
INSERT INTO `qb_bbs_contents` VALUES ('3','<p>1233333333333333333333333322222222222222 [paymoney=2] 内容区域 [/paymoney]<br></p>');
INSERT INTO `qb_bbs_contents` VALUES ('4','<p> [paymoney=1] 内容区域 [/paymoney]<br>777777777777</p>');
INSERT INTO `qb_bbs_contents` VALUES ('5','<p> </p><p>123548978523123156</p><p>[paymoney=5] 4564878115[/paymoney]<br><br></p>');
INSERT INTO `qb_bbs_field` VALUES ('10','title','标题','text','varchar(256) NOT NULL',NULL,NULL,'','0','1','','','','','','2','','','','100','1','1','1','','','','','','','','');
INSERT INTO `qb_bbs_field` VALUES ('11','picurl','组图','images','text NOT NULL','','','','0','1','','','','','','2','','','','100','0','0','0','','','','','','','','');
INSERT INTO `qb_bbs_field` VALUES ('12','content','内容','ueditor','text NOT NULL','','','','0','1','','','','','','2','','','','100','0','0','0','','','','','','','','');
INSERT INTO `qb_bbs_infomsg` VALUES ('1','0','0','1554717207','1','4','240','28','9');
INSERT INTO `qb_bbs_member` VALUES ('1','2','0','1','1548661779','1.00','1');
INSERT INTO `qb_bbs_member` VALUES ('2','1','0','1','1548662765','77.00','1');
INSERT INTO `qb_bbs_member` VALUES ('3','4','0','1','1548663060','2.00','1');
INSERT INTO `qb_bbs_member` VALUES ('4','3','0','8','1548663255','1.00','1');
INSERT INTO `qb_bbs_member` VALUES ('5','2','0','1','1548667474','2.00','1');
INSERT INTO `qb_bbs_module` VALUES ('1','','论坛模型','','','100','1515221331','0');
INSERT INTO `qb_bbs_reply` VALUES ('1','0','5','2','0','1','0','0','1','1548662224','1550129511','','','[face4][face8][face11]123','6','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('2','0','5','3','0','1','0','0','1','1548663416','1548663416','uploads/images/20190128/1_2019012816164896f11.jpeg','','[face3][face5]123[face10]','0','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('3','0','5','1','0','8','0','0','1','1548663508','1548663508','','','[face7][face3][face2]1，，','0','华为');
INSERT INTO `qb_bbs_reply` VALUES ('4','1','5','2','0','1','0','0','1','1548668458','1548668458','','','123','0','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('5','1','5','2','0','1','0','0','1','1548668463','1548668463','','','@admin&nbsp;123','0','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('6','0','5','2','0','1','1','0','1','1548747809','1548747809','','','[face2][face4][face7][face10][face12][face11][face7][face8][face6][face5][face3][face1][face9]123','0','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('7','1','5','2','0','1','0','0','1','1550127580','1550127580','','','@admin&nbsp;3213','0','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('8','1','5','2','0','1','0','0','1','1550127588','1550127588','','','@admin&nbsp;ewq','0','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('9','1','5','2','0','1','0','0','1','1550129502','1550129502','','','321','0','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('10','1','5','2','0','1','0','0','1','1550129511','1550129511','','','@admin&nbsp;3[face10]','0','其他手机');
INSERT INTO `qb_bbs_reply` VALUES ('11','0','5','4','0','1','0','0','1','1554190757','1554190757','','','<p><img src=\"http://img.baidu.com/hi/ldw/w_0036.gif\"/></p>','0','');
INSERT INTO `qb_bbs_reply` VALUES ('12','0','5','3','0','1','0','0','1','1554192835','1554192835','','','sdf','0','');
INSERT INTO `qb_bbs_reply` VALUES ('13','0','5','3','0','1','0','0','1','1554193643','1554193643','','','<p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/></p>','0','');
INSERT INTO `qb_bbs_reply` VALUES ('14','0','5','3','0','1','0','0','1','1554193647','1554193647','','','<p>sdf</p>','0','');
INSERT INTO `qb_bbs_reply` VALUES ('15','0','5','3','0','1','0','0','1','1554717206','1554717206','','','<p><img src=\"http://img.baidu.com/hi/jx2/j_0013.gif\"/><img src=\"http://img.baidu.com/hi/jx2/j_0026.gif\"/></p>','0','');
INSERT INTO `qb_bbs_sort` VALUES ('16','0','1','村人村事','0','','','2,8','','','','');
INSERT INTO `qb_bbs_sort` VALUES ('17','0','1','家乡特产','0','','','','','','','');
INSERT INTO `qb_bbs_sort` VALUES ('18','0','1','务工话题','0','','','','','','','');
INSERT INTO `qb_bbs_sort` VALUES ('19','0','1','家乡图片','0','','','','','这是标题','这是关键字','这是描述');
INSERT INTO `qb_bbs_sort` VALUES ('22','0','1','科技','0','','','','','','','');
INSERT INTO `qb_cms_content` VALUES ('12','1','1');
INSERT INTO `qb_cms_content` VALUES ('13','1','1');
INSERT INTO `qb_cms_content` VALUES ('14','1','1');
INSERT INTO `qb_cms_content` VALUES ('15','1','1');
INSERT INTO `qb_cms_content` VALUES ('16','1','1');
INSERT INTO `qb_cms_content` VALUES ('17','1','1');
INSERT INTO `qb_cms_content` VALUES ('18','2','1');
INSERT INTO `qb_cms_content` VALUES ('19','2','1');
INSERT INTO `qb_cms_content` VALUES ('20','1','1');
INSERT INTO `qb_cms_content` VALUES ('22','1','1');
INSERT INTO `qb_cms_content` VALUES ('23','1','1');
INSERT INTO `qb_cms_content` VALUES ('25','1','1');
INSERT INTO `qb_cms_content` VALUES ('26','1','1');
INSERT INTO `qb_cms_content` VALUES ('27','1','1');
INSERT INTO `qb_cms_content` VALUES ('28','1','1');
INSERT INTO `qb_cms_content` VALUES ('29','1','1');
INSERT INTO `qb_cms_content` VALUES ('30','1','1');
INSERT INTO `qb_cms_content` VALUES ('31','1','1');
INSERT INTO `qb_cms_content` VALUES ('32','1','1');
INSERT INTO `qb_cms_content` VALUES ('33','1','1');
INSERT INTO `qb_cms_content` VALUES ('34','1','1');
INSERT INTO `qb_cms_content` VALUES ('35','1','1');
INSERT INTO `qb_cms_content` VALUES ('36','1','1');
INSERT INTO `qb_cms_content` VALUES ('37','1','1');
INSERT INTO `qb_cms_content` VALUES ('38','1','1');
INSERT INTO `qb_cms_content` VALUES ('39','1','1');
INSERT INTO `qb_cms_content` VALUES ('40','1','1');
INSERT INTO `qb_cms_content` VALUES ('41','1','1');
INSERT INTO `qb_cms_content` VALUES ('42','2','1');
INSERT INTO `qb_cms_content` VALUES ('43','2','1');
INSERT INTO `qb_cms_content` VALUES ('44','3','1');
INSERT INTO `qb_cms_content` VALUES ('45','3','1');
INSERT INTO `qb_cms_content` VALUES ('46','3','1');
INSERT INTO `qb_cms_content` VALUES ('47','1','1');
INSERT INTO `qb_cms_content` VALUES ('48','1','1');
INSERT INTO `qb_cms_content` VALUES ('49','1','1');
INSERT INTO `qb_cms_content` VALUES ('50','1','1');
INSERT INTO `qb_cms_content` VALUES ('51','1','1');
INSERT INTO `qb_cms_content` VALUES ('52','1','1');
INSERT INTO `qb_cms_content` VALUES ('53','1','1');
INSERT INTO `qb_cms_content` VALUES ('54','1','1');
INSERT INTO `qb_cms_content` VALUES ('55','1','1');
INSERT INTO `qb_cms_content` VALUES ('56','1','1');
INSERT INTO `qb_cms_content` VALUES ('57','1','1');
INSERT INTO `qb_cms_content` VALUES ('58','1','1');
INSERT INTO `qb_cms_content` VALUES ('59','1','1');
INSERT INTO `qb_cms_content` VALUES ('66','1','1');
INSERT INTO `qb_cms_content` VALUES ('68','1','1');
INSERT INTO `qb_cms_content` VALUES ('69','1','1');
INSERT INTO `qb_cms_content` VALUES ('70','1','1');
INSERT INTO `qb_cms_content` VALUES ('71','1','1');
INSERT INTO `qb_cms_content` VALUES ('72','1','1');
INSERT INTO `qb_cms_content` VALUES ('73','1','1');
INSERT INTO `qb_cms_content` VALUES ('74','1','1');
INSERT INTO `qb_cms_content` VALUES ('75','1','1');
INSERT INTO `qb_cms_content1` VALUES ('12','1','9','曾是阿里旗下的猛将，马云挥泪斩“马谡”，将他送入五年牢狱','1','1','140','2','1','0','1517533498','1548225261','0','uploads/images/20180302/acc5222477f61f1791a5f1c3e1029a33.jpg','<p style=\"text-align: left;\">细数中国商业史，在某个时刻被命运抛入深谷，或一夜之间锒铛入狱者不在少数，但能经历成功——失败——再成功三部曲者寥寥无几。马云曾梦想着阿里“猛将如云,美女如潮”,但人多了最难管。阿里巴巴是个大江湖，马云按员工入职先后定工牌编号。阎利珉和他带领的聚划算员工，都是80后新人，这些员工是整个阿里巴巴集团和旗下子公司最拼命、最辛苦、最具有创新能力的一群人。</p><p style=\"text-align:center\"><img src=\"http://p1.pstatp.com/large/46de0005a4f54342df06\" alt=\"曾是阿里旗下的猛将，马云挥泪斩“马谡”，将他送入五年牢狱\"/></p><p>阎利珉2002年毕业于四川大学，拥有八年的互联网软件和电子商务的从业经验，2006年加入阿里巴巴。2009年其所在业务板块并入淘宝，其后便在阿里实现了”火箭式上升”，主要依靠的是两大业绩：一是推动了淘江湖的建立，第二发起了聚划算项目，这两个项目都被阿里巴巴内部评为&quot;金旺旺奖&quot;。</p><p>阎利珉在加入阿里巴巴之后，一开始是做产品经理，后来转做运营，这种大跨度的转型也让他的能力越来越全面。阿里内部人士评价称，阿里能出阎利珉这样的人不多，真正能做事拿结果的创新型专业人才。</p><p><img src=\"http://p3.pstatp.com/large/46e000055cb666bbaaf9\" alt=\"曾是阿里旗下的猛将，马云挥泪斩“马谡”，将他送入五年牢狱\"/></p><p>自聚划算平台成立后担任平台总监，2011年10月聚划算从淘宝独立出来后，阎利珉出任聚划算总经理。<br/></p><p>背靠淘宝系资源，聚划算发展迅猛。根据团800在2013年6月份的统计数据，聚划算（本地单）成交额6733万元，聚划算（商品单）成交额1.64亿元。业内人士表示，对于参加聚划算平台活动的淘宝网店主来说，能够进入聚划算平台亮相，意味着巨大的流量和购买量的保证。</p><p>但随着聚划算业务的迅速扩张，团队的管理和制度的规范却相对滞后。自2011年年中起，有关聚划算在招商过程中存在不规范、甚至有小二谋取不当利益的举报就接连出现。</p><p><img src=\"http://p1.pstatp.com/large/46e30002f441db0b1009\" alt=\"曾是阿里旗下的猛将，马云挥泪斩“马谡”，将他送入五年牢狱\"/></p><p>阿里巴巴方面介绍，在调查过程中发现，聚划算在制度规范和团队管理上存在很大漏洞，是导致出现上述情况的重要原因。作为聚划算的负责人，阎利珉负有重要管理责任，必须对此负责。阿里巴巴对聚划算“放养”式的管理，带来业绩腾飞，也成为滋生腐败的温床。成为王被捧，败为寇受辱。阎利珉和其团队成了风箱中的老鼠。</p><p>阎利珉爱帮忙，凡有求于他，尽量满足，但不能满足的心生抱怨。聚划算团队中，员工也摸准他的脾气，即便背后和商家达成隐秘利益交换，也有办法通过说法、正常的工作流程让这位年轻老板“批准”。</p><p><img src=\"http://p3.pstatp.com/large/46e1000548e3fea75179\" alt=\"曾是阿里旗下的猛将，马云挥泪斩“马谡”，将他送入五年牢狱\"/></p><p>他先是被阿里巴巴集团宣布免去了总经理职务，后因涉嫌非国家工作人员受贿罪被杭州警方刑事拘留，再后来就是一纸有期徒刑7年的判决书。现如今，曾经风光无限的聚划算早已被并入天猫，而已经走出人生最低谷的阎利珉正准备重新出发，不管怎样，重启不易，祝福之。</p><p><br/></p>','0','0','0','0','0','0','','0');
INSERT INTO `qb_cms_content1` VALUES ('13','1','9','死在公司倒闭之前的茅侃侃，和一批从高处坠落的明星创业者们','0','1','56','2','0','0','1517533576','1548225019','0','','<p style=\"text-align: left;\">茅侃侃之死</p><p style=\"text-align: left;\">2006年，四个80后创业者登上了罗永浩主持的《对话》节目。央视舞台上的聚光灯让他们一夜爆红。名气随着搜索率一路飙升，让茅侃侃，李想、高燃、戴志康这四个二十出头的男孩兴奋不已。</p><p style=\"text-align: left;\">二十一世纪初，那是个充满可能性的时期，非典之后，万物开始复苏。大家还不认识什么马化腾，张朝阳，年度经纪人物榜上挂着的还是郭广昌，王宪章。</p><p style=\"text-align: left;\">彼时，茅侃侃创立的MaJoy，头顶真人CS业内第一的帽子一路开挂，轰轰烈烈朝着融资的方向驶去；李想的汽车之家，刚挤进国内汽车网站访问量前五名；高燃的P2P流媒体平台Mysee赶上了互联网视频元年的快车，顺风顺水；戴志康的“Discuz！”成为了国内领先的网络社区软件。</p><p style=\"text-align:center\"><img src=\"http://p1.pstatp.com/large/5b54000271990c0ae1b5\" alt=\"死在公司倒闭之前的茅侃侃，和一批从高处坠落的明星创业者们\"/></p><p>茅侃侃</p><p>那时候的茅侃侃是媒体的重点关注对象，媒体一边大肆强调他的初中文凭，一边赞扬着他的才华，把这场不易的创业之旅标榜为一场华丽的逆袭。</p><p>谁也想不到，2018的开年，茅侃侃三个字再次出现在热搜和头条里，带来的却是他煤气自杀的消息。</p><p><img src=\"http://p1.pstatp.com/large/5b5700000b3005f20359\" alt=\"死在公司倒闭之前的茅侃侃，和一批从高处坠落的明星创业者们\"/></p><p>回头再去观望当初被冠以“京城IT四少”的他们：李想带着汽车之家，在2013年12月，敲响了纽交所的大钟，如今已是上亿身价；高燃被免去公司CEO之为之后，MySee也于不久后倒闭。戴志康的“Discuz！”于2010年成功变现，但在把“儿子”交付腾讯之后，老戴曾三个月未曾出门，轻度抑郁。这些曾被捧为80后明星的创业者们，大多正在以各种方式回归平淡。</p><p>茅侃侃是不愿倒下的那个，2013年，创业十年之际，茅侃侃选择了出任GTV（游戏竞技频道）的副总裁，2015年，茅侃侃出任其和万家文化成立的合资公司，万家电竞的CEO。31岁的这年，他希望还能搏一把。但正是这一把，把他带入了无尽的深渊。</p><p>2017，赵薇收购万家文化的闹剧结束，万家电竞成为了牺牲品之一，同年8月，万家文化卖身祥源集团，祥源不愿意接受万家电竞背后的6000万债务。茅侃侃开始了抵押房车的生活。10月，万家电竞员工因为工资拖欠，集体去了朝阳区劳动局进行劳动仲裁。</p><p>2017年的最后一天，茅侃侃发了一条朋友圈：2017失去了所有的所有。这些所有，不仅代表了创业路上的困境，也代表了资本圈的无法控制的风险。他到那个时候都没有放弃努力，付出一切代价苦苦支撑。</p><p>但仅仅一个多月之后，就传来了他自杀的消息。</p><p>有人说他不堪资金压力放弃挣扎，也有人言之凿凿说他被股权交易的黑手玩弄致死，但我想不管怎样，压死骆驼的最后一根稻草，应该是他最终认命凭一己之力真的无法挽救一腔心血的那刻。</p><p>于无声处，茅侃侃带着遗憾归入创业大军溃退的洪流之中，留下一片唏嘘和惋惜。</p><p>被捧上天又摔的无比惨的明星创业者们</p><p>茅侃侃之死，之所以获得那么多人关注，很大原因是因为，他曾经被媒体捧得很高，他的成功失败都在放大镜下一览无遗。茅侃侃不是唯一一个被捧上创业天才宝座的人，也不是唯一一个从聚光灯处摔落的人。有太多被或主动或被动打上追光灯的创业者，在逆流而行的路途中死于船漏，死于巨浪，最终湮灭于路人目送中。</p><p>前些时间，小蓝被叫停，留下一地鸡毛。最终，小蓝单车被滴滴接管。小蓝单车曾是被开启复用最多的共享单车，一度超过膜拜和OFO，如今却只能依附于滴滴发展。但这对于小蓝单车创始人李刚来说，这场创业，从某种程度上来说，到底还是失败了。</p><p><img src=\"http://p3.pstatp.com/large/5b53000289ddf233db1e\" alt=\"死在公司倒闭之前的茅侃侃，和一批从高处坠落的明星创业者们\"/></p><p>小蓝单车创始人：李刚</p><p>我想对于创业者来说，最痛苦的不是倒在血泊中，而是你曾在鲜花掌声中意气风发，如今却只能臣服于强者。李刚在滴滴托管小蓝单车之后坦言：那时候压力很大，可我没有勇气走那最坏的一条路，小蓝单车危机中，我看到了人性中善良的一面，我选择相信希望。</p><p>李刚是幸运的，他没有拧开煤气罐，事情也没有糟到一发不可收拾。</p><p>比起80后，被资本偏爱的90后，创业之路要顺得多。如徐小平一类的投资人，希望通过投资强劲的新鲜血液，获得主流网民的支持。创业大潮如火如荼，方兴未艾，投资人的支持，加上媒体的吹捧，资本开始疯狂押注90后创业者，甚至过分在乎他们的影响力而忽视创业产品和商业模式，这为这一批创业者的覆灭埋下了伏笔。</p><p>2016年，90后创业者尹桑宣布公司解散。尹桑曾是90后创业大军的代表者。他曾赴美读书，又被宾利商学院全奖录取，先前的几次创业也都以成功收尾。2012年，他选择大二辍学回国开发APP“一起唱”，企图颠覆线下KTV。“一起唱”先后获得IDG三次融资，曾入选福布斯。那时的尹桑也被封为90后高材生创业典范，被无数人看好，但没几年，尹桑就遗憾宣布公司因投资人延缓投资，现金流告急，不得不面临员工遣散公司倒闭的结局。</p><p><img src=\"http://p3.pstatp.com/large/5b550001e81040450cfe\" alt=\"死在公司倒闭之前的茅侃侃，和一批从高处坠落的明星创业者们\"/></p><p>尹桑</p><p>不同于茅侃侃的努力无果戛然而止，尹桑的结束倒更像是一场明哲保身触地溜走的滑稽戏。在尹桑发布声明之后，公司员工在知乎上将尹桑推上了风口浪尖。员工集体指责尹桑满篇情怀，丝毫不提员工补偿和工资的裁员公告信，质问尹桑为何不在年前召集员工宣布该消息而是通过邮件遣散员工，更对尹桑解散和禁言员工群的行为十分不满。</p><p>一个匿名的用户po出了尹桑在Facebook上计划年后夏威夷旅游的动态，以及尹桑在发完遣散信还在德州扑克牌桌上的消息。他称自己与尹桑相熟，但并不确认他是否是真的没钱了。</p><p>发布公告信没几天，公司人事给员工发了正式邮件，希望员工主动离职。主动离职信一写，意味着第一员工拿不到N+1的补偿金，第二也拿不到失业保险，无法劳动仲裁。比起茅侃侃变卖家产补齐员工工资，尹桑冷冰冰的一纸算计，于一起创业打拼的团队心里，恐颇有卸磨杀驴的寒心之感。</p><p>尹桑的退场，真的算不上是一场体面的全身而退。</p><p>同样不算体面而退的创业者，还有很多。1990年出生的美女学霸马佳佳，是90后创业者中的绝对话题人物。她毕业于中国传媒大学，传言还是云南省高考语文状元，她是《非诚勿扰》女嘉宾，中欧商学院创业演讲者，两会期间媒体代言人，徐小平曾评价她说，她身上“有中国企业家缺乏的直击心灵的力量”。但也有人指责她逻辑混乱，只会炒作，商业天赋不高。</p><p>太多的光环加身于这个胆大出格的女生身上，她带着情趣用品商店“泡否”在一路非议中横冲直撞，霸占了某一时期的创业板头条。而仅仅2年过去，热度消失的马佳佳，被人发现人气店“泡否”已经倒闭，泡否科技融资状态也在2014年年初再没变化过。</p><p><img src=\"http://p3.pstatp.com/large/5b550001e8d669dc8e90\" alt=\"死在公司倒闭之前的茅侃侃，和一批从高处坠落的明星创业者们\"/></p><p>马佳佳</p><p>2017年10月，网易上线“春风”情趣用品品牌时，曾邀请过马佳佳参与直播。再次回到公众视线的马佳佳微博简介已经变成了”少女实验室“品牌的创始人，她不承认自己的创业之路已断，但没有资本临幸，仅靠标榜“性、美女、成人用品、营销天才”光环的话题女王马佳佳，鲜有媒体愿意再给与她关注度。</p><p>除了马佳佳，被捧杀高坠的还有王凯歆。或许时至今日，很多人都忘了这个名字，但提起神奇百货，还是有人会发出“噢~”的一声，恍然大悟的同时报以轻蔑一笑。王凯歆，1998年出生，创业时候才15岁，17岁就获得天使轮投资，18岁拿到千万A轮，真的是件让人很骄傲的事情。但这个最初做做小生意起家的孩子，在面临千万投资和嗷嗷待哺的团队时，还是显现出了致命的缺陷：经验不足且品质堪忧。</p><p>拿到千万投资的那一年，神奇百货因为盲目扩张、大幅增员，现金流告急。投资人在这个时候发现了王凯歆公司存在数据造假的问题，这还不是最重要的，最致命的是，王凯歆拿着投资人的钱请保姆，买奢侈品，还威胁员工保密，种种心思无一花在公司经营之上。最终，王凯歆被爆出侵吞公款600万，投资人忍无可忍，将其列入死亡名单之中。</p><p>2017年7月，王凯歆被指其新做的保健品微商项目涉嫌诈骗，一天之内，其公众号被迅速封杀。8月，她还为“华茵”健康饮品宣传，但8月之后，再未有过创业相关的消息。</p><p>小小年纪的王凯歆，算是近几年创业者中，谢幕姿势最难看的一位了。</p><p>和生命赛跑的创业之路</p><p>创业之路是残酷的，账上没钱是每个创业者的噩梦。无论是刚刚离去的茅侃侃，还是以上90后中的谁谁谁，这批曾被媒体推上风口浪尖的创业明星们，承受着不同他人的压力，这是省不去的代价。</p><p>在80后创业者身上，我看到了更多的是谨慎和稳重，中产的压力逼着他们无法停下脚步，“被收割”的恐惧支撑着他们必须上岸的决心，他们的试错成本太高了。自杀和猝死的新闻不断传来，但从来没成为他们止步不前的理由。在茅侃侃去世之前，厦门维信科技董事长黄国斌因故去世，时年32岁，重庆游戏界元老，手游开发公司老总冒朝华突然脑溢血，时年37岁。</p><p>在90后创业者身上，我看到更多的是勇气和张扬，以及怎么都要折腾到最后一秒的执着，这不是贬义的评价。无论是因为自身能力不足停止发展也好，负隅顽抗，坚守未遂也好，他们都曾是一个优秀而光荣的创业者，曾在高处享受过注目礼的成功者。</p><p>创业是一场征程，生在这最好也是最坏的时代，如果因为怕有朝一日的高坠，而放弃登高，那才真是比失败落幕还要让人不屑的愚蠢。</p><p><br/></p>','0','0','0','0','0','0','','0');
INSERT INTO `qb_cms_content1` VALUES ('14','1','9','茅侃侃昨日在家中自杀 前合作伙伴：太遗憾','0','1','59','1','0','0','1517533674','1547468393','0','uploads/images/20180302/acc5222477f61f1791a5f1c3e1029a33.jpg','<p style=\"text-align: left;\">法制晚报·看法新闻（记者 张蕊 李阳煜）今日上午，有媒体曝出<a href=\"http://money.163.com/keywords/0/3/00380030540e/1.html\" title=\"80后\" target=\"_blank\">80后</a><a href=\"http://money.163.com/keywords/5/1/521b4e1a/1.html\" title=\"创业\" target=\"_blank\">创业</a>代表人物<a href=\"http://money.163.com/keywords/8/0/83054f834f83/1.html\" title=\"茅侃侃\" target=\"_blank\">茅侃侃</a><a href=\"http://money.163.com/keywords/8/e/81ea6740/1.html\" title=\"自杀\" target=\"_blank\">自杀</a>身亡。法制晚报·看法新闻记者经核实，茅侃侃自杀一事属实。</p><p style=\"text-align:center\"><img alt=\"茅侃侃昨日在家中自杀 前合作伙伴：太遗憾\" src=\"http://cms-bucket.nosdn.127.net/catchpic/c/ca/ca88a9b263f1746f96ccaa058bb135b0.jpg?imageView&thumbnail=550x0\"/></p><p>茅侃侃资料图</p><p>据跟茅侃侃公司有交集的人士称，茅侃侃的公司近期遇到很大的经营困难。法制晚报·看法新闻记者采访了一位茅侃侃曾经的合伙人，据其介绍，茅侃侃有时会为了开发“找灵感”而短期失联，对于其自杀身亡，“遗憾，他还是太年轻了”。</p><p>在多家公司担任法人、董事 其中一家公司员工证实自杀</p><p>茅侃侃出生于1983年，被称为80后创业代表人物，曾被媒体和大众狂热追捧。2004年底，茅侃侃开始运营MaJoy，他把网络游戏搬到线下、模仿其后台数据运行，但用实景、由玩家实际扮演。此后，茅侃侃又先后做了移动医疗领域的APP以及提供实时路况信息APP“哪儿堵”；2013年，茅侃侃加入GTV，踏入电竞圈；2015年，茅侃侃与万家文化成立合资公司万家电竞，并出任CEO。</p><p>法制晚报·看法新闻记者查询发现，茅侃侃目前仍是北京万好万家<a href=\"http://money.163.com/keywords/7/3/75355b507ade6280/1.html\" title=\"电子竞技\" target=\"_blank\">电子竞技</a>传媒有限公司和海南万好万家电子竞技传媒有限公司的法人，同时也是多家公司的股东、董事。</p><p>今天上午，法制晚报·看法新闻记者致电其担任法人的北京万好万家电子竞技传媒有限公司和海南万好万家电子竞技传媒有限公司，电话均无人接听。</p><p>而在茅侃侃为董事的北京鸣鹤鸣和文化传媒有限公司中，公司工作人员向记者证实了茅侃侃的死讯。“在北京家中自杀，昨天的事情。”工作人员称，家人发现茅侃侃的时候，其已经去世，没有遗书。</p><p>对于茅侃侃自杀的原因，该人士称不知情。但记者从一名曾经和茅侃侃公司有关交集的相关人士处获悉，茅侃侃的公司经营困难，“前段时间和他们公司的员工聊天时，曾听对方说他们公司目前处于很困难的阶段。”但这究竟是不是导致茅侃侃自杀的原因，目前还没有答案。</p><p><img alt=\"茅侃侃昨日在家中自杀 前合作伙伴：太遗憾\" src=\"http://cms-bucket.nosdn.127.net/catchpic/c/c6/c6c06abc63db6aba53853bfe9d0ad243.jpg?imageView&thumbnail=550x0\"/></p><p>茅侃侃担任董事的一家公司，并没有员工上班，门口贴满小广告 摄/法制晚报·看法新闻记者 李阳煜</p><p>1月25日上午，记者来到位于朝阳区建国路北岸1292三间房创意生活园区的北京鸣鹤鸣和文化传媒有限公司，多次敲门无人应答。其邻居称，该栋楼内有公司也有住户，邻里之间很少交往，偶尔见到有人出入该公司所在处，但从未交流过。记者注意到，该楼层内大多数房间较小，部分用作单身公寓用户租住。</p><p>负责片区送货的某快递公司快递员称，每次给这家公司送快递都是一个女生接电话，“让把快递送到快递站，有人自己去取”。园区物业查询得知，公司所在房间面积有25平米，对于该公司是否租用此地办公，物业称没有去房间看过。</p><p>曾经的合作者：太遗憾，还是太年轻</p><p>10年前，Majoy的茅侃侃、泡泡网的李想、康盛创想的戴志康、Mysee的高燃，4个出生在80年代，20岁出头便有公司，成了当时80后年轻人的创业偶像。</p><p>这时候的茅侃侃应该正值青春年少，踌躇满志。</p><p>许昌（化名）是茅侃侃曾经的合作伙伴，2007年的一个晚上，他在一档电视节目中看到和李想坐在一起侃侃而谈的茅侃侃，“当时电视节目把他定性为怪才，奇才。”看着年纪不大，但一脸沉着的茅侃侃，许昌想，是不是可以和他一起合作开个公司呢？</p><p>第二天，许昌就开始托人找茅侃侃的联系方式，辗转找了很多人，终于联系到了茅侃侃。</p><p>第一次见茅侃侃，许昌觉得和电视上不太一样，“怎么说呢，电视中，他还是比较善谈的，但是私下里其实并不太喜欢说话。”许昌说自己当时想开发一款关于大学生就业指导的软件，就和茅侃侃聊了自己的想法。并说自己想和茅侃侃一起开公司来做这个事情，没想到茅侃侃很爽快的就同意了，“他当时就说，好啊。”</p><p>这让许昌多少有些意外，要知道当时的茅侃侃在互联网界还是挺有名的，接下来的一切就顺理成章了，许昌注册了公司，自己和茅侃侃都是股东，记者注意到，茅侃侃在这家公司的职位是总经理，占45%的股权，“他当时没有钱，注册公司都是我出的钱。”许昌告诉法制晚报·看法新闻记者说，之所以给茅侃侃股份，就是觉得有点儿股份，能让他踏实在公司呆着做事。</p><p>但之后的一切让许昌有些始料未及，按照许昌的说法，他主外，茅侃侃主内，“我当时都联系好了不少单位，就等软件开发出来就可以合作了，但东西迟迟出不了，我也着急。”许昌说，茅侃侃和他的合作最后只持续了一年多，“最后软件一直没开发出来，项目就不了了之了。”</p><p>在许昌的印象当中，茅侃侃是个比较随意的人，这不仅表现在穿着上，性格上、工作上亦是如此，“有时候，他要找灵感，就会一连十几天，二十天不出现，也联系不上。”第一次遇到这样的情况，许昌还紧张了很长时间，但后来，渐渐也就习惯了，许昌将这总结为性格所致。</p><p><br/></p><p><a target=\"_self\"></a></p><p>许昌告诉法制晚报·看法新闻记者，茅侃侃没有上过大学，是自学成才，这一度让许昌特别佩服，所以在当时开公司的时候，许昌也很少过问软件开发的进度，“我也不懂，偶尔问一次，他就说正在弄。”</p><p>那时候的许昌是相信茅侃侃的，因为他相信茅侃侃“怪才”、“奇才”的称谓，“他确实还是比较有才的，但是太年轻了。”</p><p>2009年，软件一直没有开发出来，许昌觉得两人无法继续合作下去了，“忘了当时什么情况，反正就是不联系了。”</p><p>这些年来，许昌没有再关注过茅侃侃，只是偶尔看到他的消息。</p><p>得知茅侃侃自杀的消息，许昌特别震惊，对此他觉得很遗憾，“还是太年轻了。”</p><p><br/></p>','0','0','0','0','0','0','','0');
INSERT INTO `qb_cms_content1` VALUES ('15','1','9','茅侃侃之死：成年人的生活里没有容易二字','1','1','87','2','2','0','1517533725','1548225176','0','uploads/images/20180302/f4cb941062607e7ece08699e2955eaf3.jpg,uploads/images/20180302/d27a7a45c3fcd543a5a5dc4b1cb22d16.jpg','<p style=\"text-align: left;\">昨天，有一个80后的创业偶像自杀死了。说实话，作为一个90后，我真的没有听过他，倒是我那个80后的总监一下子就激动的从座位上面炸了起来，大嚎了一句：天啦，茅侃侃居然死了。</p><p style=\"text-align: left;\">出于好奇和尊重，我去百度了这个人的故事。他被誉为第一批 80 后创业者、京城 IT 四少之一。他从小学五年级开始玩电脑，14岁开始在《大众软件》等杂志发表数篇文章。</p><p style=\"text-align: left;\">高一辍学后，他把全部的精力投入到了计算机和英语的学习中，在两个月内的时间里，拿下微软MCP（微软认证专家）、MCSE（微软认证系统工程师）、MCDBA（微软认证数据库管理员）三项认证。</p><p style=\"text-align: left;\">当年在全亚洲18岁拿下三本证书的，只有两人。2006年，在换了一打工作后开始创业的茅侃侃，接受了《中国企业家》的采访，并登上封面，标题为《生于八零年代》。</p><p style=\"text-align: left;\">当时尚在央视工作的罗振宇深受触动，于是邀请了茅侃侃、李想、高燃、戴志康四位80后创业者参加央视的《对谈》节目。节目播出后，第二天，“茅侃侃”一词的搜索，从1000名外直线上升至81名。<br/></p><p style=\"text-align:center\"><img src=\"http://p1.pstatp.com/large/5b560001bab72d3272ff\" alt=\"茅侃侃之死：成年人的生活里没有容易二字\"/></p><p>在“京城IT四少”中，茅侃侃是最小的，他的个人经历和当时的普世价值，冲突也最大。他每月的花销也比其他3位似乎要多一些。“不多，两三万吧。”侃侃说得很轻松，那时他穿着时尚，烫卷的黑发，自曝爱好是逛夜店。</p><p>在网上的照片我看到了这样的一个形象：染着一头黄毛，加上两条大花臂，特别扎眼——看上去“很社会”，一点也不像是那个我想象中的创业家。</p><p>“他可是我中学时的偶像啊，居然那么年轻就自杀了。”我总监一脸的惋惜和无奈。</p><p>而我想起了另外一个人，前不久自杀的韩国艺人金钟铉。据说他是一个人跑到酒店，给姐姐发了条“我好累”的信息，随后点燃了准备好的炭，被人发现送到医院抢救无效后死亡，年仅27岁。而仅仅在十天前，他刚刚结束自己的个人演唱会。</p><p><img src=\"http://p3.pstatp.com/large/5b5000063314559c49e3\" alt=\"茅侃侃之死：成年人的生活里没有容易二字\"/></p><p>直到他的遗书曝光，在很多人意料之中，他的离开是长期遭受抑郁症的困扰。</p><p>在遗书里面有一段话格外让人心痛：</p><blockquote><p>“我从里面开始出了故障。</p><p>一点点啃噬着我的抑郁最终将我吞噬。</p><p>我无法战胜它。</p><p>我厌恶我自己。</p><p>断开的记忆抓住我，不管怎么对自己说要打起来精神来，也找不到答案。”</p></blockquote><p>他们，一个创业大神，一个韩国偶像，在我们普通人的眼里，都是神一样的存在，对我们来说，他们根本不用像我们一样天天思考着茶米油盐，有钱有名有人脉有前途。人生走到这个阶段，已经是完美了。</p><p>可是他们却选择了在三十而立的时间段，选择了离开。</p><p>如果是你，你真的有那样的勇气站上那个最高点吗？你一边在埋怨人生，一边在厌恶社会，可是你有没有想过，当你还年轻的时候，你的确有尝试一切的资本，但是当你不在年轻的时候，你还能做什么呢？</p><p><img src=\"http://p1.pstatp.com/large/5b53000278c1231becc5\" alt=\"茅侃侃之死：成年人的生活里没有容易二字\"/></p><p>我今年25岁，我刚毕业的时候，工资只有2500，在深圳这座城市，我住着500块的床位，和一群做清洁工的阿姨在一个房间，阿姨们每天晚上都很晚睡觉，呼噜声还打得像雷一样，我基本每天都睡不好。每天下班就去超市，买特价的面包，作为第二天的早餐，吃5快钱一份的炒粉。这不是电视剧，这就是我们的生活。</p><p>有一天我回宿舍的时候发现房间被锁住了，开了很久都打不开，后来房东来了，说我的床位到期了，有一个人下午来看房子就立刻租出去了。我拿着我的行李在门口呆住了，那一个瞬间我不知道该怎么办。我以为以前看的偶像剧那种狗血的剧情都是假的，没想到会发生在我自己的身上。</p><p>后来，我找了一个青旅，把身上所有的人都拿了出来，租了半个月。那天晚上，我一个人在回家的那条路上的一个天桥上面，哭了很久。我不知道能找谁，也不想找谁，一个人最彻底的崩溃，就是这样，悄无声息地，毫无生机地默默流泪。</p><p>这让我想起来，以前看过一个热门微博：“现代人的崩溃是一种默不作声的崩溃。看起来很正常，会说笑、会打闹、会社交，表面平静，实际上心里的糟心事已经积累到一定程度了。</p><p>不会摔门砸东西，不会流眼泪或歇斯底里。但可能某一秒突然就积累到极致了，也不说话，也不真的崩溃，也不太想活，也不敢去死。”</p><p>曾经有张动图流传很广，在日本地铁里，有一个男生，坐在那里啃着面包，强忍着委屈，眼泪似乎就要夺眶而出。谁也不知道他发生了什么，但那份心酸，每个人都理解。</p><p><img src=\"http://p1.pstatp.com/large/5b550001cff6a3d1bca6\" alt=\"茅侃侃之死：成年人的生活里没有容易二字\"/></p><p>谁身后都有一堆不可说的故事。但他的那身打扮，给他定位了一个体面的身份。这个身份，让他除了忍住不哭，毫无办法。</p><p>《这个杀手不太冷》里有一句特别著名的台词，马蒂尔德问：“生活是一直这么艰辛，还是只有童年如此。”里昂说：“一直如此。”</p><p><img src=\"http://p3.pstatp.com/large/5b560001bee30924499e\" alt=\"茅侃侃之死：成年人的生活里没有容易二字\"/></p><h1>每个人的生活，从来都是不容易的。</h1><p>三十而立，这将是一道坎。</p><p>这个时间点上，你的职业规划，和你前半生学到的技能，往往会决定着今后数十年一直到你退休那一天的职业方向。</p><p>这个年纪，大部分人都已结婚生子，都已承担起支撑整个家庭的责任。你职场中的每一个决定，都不会再像你年轻时那样轻狂。你的生活如履薄冰，战战兢兢。</p><p>你我都失败不起。</p><p><img src=\"http://p1.pstatp.com/large/5b54000263c2eacdbfc8\" alt=\"茅侃侃之死：成年人的生活里没有容易二字\"/></p><p>成年人的生活，没有容易二字。不容易在，你明明知道，真正的自己，早就被这些社会身份包装到被遗弃，甚至埋葬。但你却没有退路，没有第二个选择，你只能哭着爬着把那些被人寄予厚望的身份扮演下去。</p><p>可每个人，无论爬得多辛苦，演得多艰难，内心深处，还都会有一个微弱到快熄灭的声音，不停地拷问自己：生活的意义到底是什么？是身在红尘的体验，还是看破红尘的顿悟。山的那头，到底有什么？我们只有爬过去才知道。</p><p>我特别喜欢一首歌《What’ up》有句歌词：25年的人生就这样过去了，我仍要努力去翻越那希望的高山，为了让人生有意义。</p><p>我不想说，泥沼总会过去，星辰大海在向你招手。甚至，我都不觉得吃苦是有必要的。但是，找到生活的意义的时刻，恰恰是在，当你熬过去，撑下去后，可以用上帝视角去审视当年那个奋斗到呲牙列嘴的自己的时候。</p><p>人生就真的像爬山一样。山脚下的我们，就是小时候，天真无邪，井底之蛙。爬到半山腰才发现，体力费光，下山已经没有路，还恐高不敢回头看；往上爬，手脚并用都不见得能再挪一步。但是能爬过去的，就是那些，能挺住的人。</p><p>在压力面前，有些人能承受九分，但像我们普通人，光是活着就快花光了所有力气。</p><p>死者为大，愿茅侃侃安息，愿所有的你们都能过的好。</p><p><br/></p>','0','0','0','0','0','0','','0');
INSERT INTO `qb_cms_content1` VALUES ('16','1','9','马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！','1','1','282','2','5','0','1517533788','1548247727','0','uploads/images/20180302/e04c0b963510abd7a6a75770ac73cfe5.jpg','<p>大家都知道，阿里巴巴“18罗汉”是阿里草创时的18位创始人，他们当时大都默默无名，跟着屌丝马云创业，一起把阿里做到了今天的辉煌。</p><p>蔡崇信，放下年薪70万美元的工作，跟着马云领月薪500，现在是阿里执行副主席；</p><p><img src=\"http://p1.pstatp.com/large/5e710003f37705c10d44\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>彭蕾，当年的HR，现在是蚂蚁金服董事长；</p><p><img src=\"http://p3.pstatp.com/large/5e6f00032791bd8a9271\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>童文红，当年的前台小妹，帮忙订咖啡、做客服，现在是阿里集团资深副总裁兼菜鸟首席运营官；</p><p><img src=\"http://p1.pstatp.com/large/5e710003f373496ee250\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>除此之外，还有孙彤宇、吴泳铭、盛一飞等人，后来也成为阿里集团的骨干。</p><p>然而，最近马云透露，原来当年那批创始人，曾经被开掉一个！</p><p>到底是谁被开掉了，为什么开掉的？这里面又看出马云什么样的用人哲学？</p><p><img src=\"http://p3.pstatp.com/large/5b5c0004c48c8ea342bb\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>“阿里只有一个人可以叽叽哇哇”</p><p>在湖畔大学上，马云曾经提过这个人，不说名字，只说他当时的表现：</p><p>他是马云从硅谷带回来的，人也聪明，技术也算不错，在美国待了七八年，他总喜欢叽叽歪歪，干不干就蔫了，问他有什么主意，他也说不出。</p><p>马云抱怨：</p><p>“这个人是我们当时最厉害的，又是18个创始人之一，但永远不做决定，永远叽叽歪歪。”</p><p><img src=\"http://p3.pstatp.com/large/5e710003f3740fcb9c21\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>后来有人开玩笑：阿里巴巴只能有一个人叽叽哇哇，那就是马云！</p><p>马云本来还想“拯救”他，有一天和他谈事情，一直和他谈到凌晨两点，终于说服他应该怎么办，马云才去睡觉。</p><p>谁知道三点钟不到，时任阿里COO关明生打来电话：“我已经把他开除了！”</p><p>马云惊呆了，我刚和他谈好，你就开除他了？关明生说：“这样对我们好，也对他好，没必要浪费时间。”</p><p><img src=\"http://p3.pstatp.com/large/5e700003274b9abeed11\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>视频在这里：</p><p>当时，马云还有点不理解，但后来一看，开除他实在太对了！</p><p>阿里“18罗汉”现在很出名，但只是阿里成功后大家编的高帽，当时这群创始人只是“乌合之众”。</p><p>吴晓波就曾很不客气地指出：</p><blockquote><p>“当时只要愿意跟着马云干，愿意每个月只领600块钱工资，就可以成为创始人。”</p></blockquote><p><img src=\"http://p1.pstatp.com/large/5b5a0005426bf9cd5eb6\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>所以，大家工作都不上心，老员工各自为政，能自己解决就自己解决；新员工来了也不知道干什么，就在工位上假装工作，甚至能假装一周。</p><p>当马云连最出名、官最大的那个创始人都开除了，其他人一下子打起精神了：“真的会开除啊？”</p><p>公司的氛围一下子积极起来，再加上公司架构的完善，阿里巴巴才总算有了一个公司的样子。</p><p><img src=\"http://p3.pstatp.com/large/5b590005541f701bf437\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>虽说这次开除是关明生主导的，但好好给马云上了一课：</p><p>合适的人就要放在合适的岗位，不合适就赶紧换，拖得越久越麻烦。</p><p>后来几次人员调动，都显示出了马云的用人手段。</p><p>2006年，上任仅40天的雅虎中国总经理谢文辞职，据报道，他为人过于强硬，没法融合雅虎中国内部的派系，所以只能离开；</p><p><img src=\"http://p3.pstatp.com/large/5e710003f372196c273b\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>谢文</p><p>2007年，阿里二号人物，淘宝创始人孙彤宇被宣布“离岗进修”，他是创业老臣，马云工号是“1”，他的工号是“2”，地位举足轻重。</p><p>据说，他是因为和马云对淘宝的未来的设想不合而离开。</p><p><img src=\"http://p1.pstatp.com/large/5b5c0004c48d6bc15a96\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>孙彤宇</p><p>2011年，阿里CEO卫哲、COO李旭晖辞职，原因是前一年阿里查出平台有0.8%的“中国供应商”客户涉嫌欺诈，这两人引咎辞职。</p><p>马云发邮件直言：“我们必须刮骨疗毒。”</p><p><img src=\"http://p3.pstatp.com/large/5e710003f375af6c7026\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>卫哲</p><p>后来，马云曾在电视节目上这么说：</p><p>“我曾经开除过阿里的创始人，课间有人问我，你们在大年三十开除人，的确是有点残忍，我说，开除人，要心好，要刀快。</p><p>有时候开除一个人，对他也是帮助。你离过婚，破过产，进过监狱，还能乐观的面对，这样的人一辈子就没有白活。”</p><p><img src=\"http://p3.pstatp.com/large/5b590005541e001c699b\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>马云的7大用人原则</p><p>老板们开公司，总爱感叹：千金易得，一将难求。</p><p>员工们找工作，总爱抱怨：怀才不遇，天赋埋没。</p><p>一边想要人才，一边想被赏识，两者之间的复杂关系可见一斑。</p><p>所谓用人，其实只是用在所长，避其所短。那么，作为中国最知名的企业，马云和阿里巴巴究竟是怎么用人的？</p><p>读过了与马云和阿里巴巴相关的大量资料，我们给你总结出七条：</p><p>1、人才不是招来的，而是培养出来的</p><p>上面也说了，阿里巴巴的创始人们，其实都是“乌合之众”，许多都是因为在市场上找不到工作，才被马云招到阿里巴巴。</p><p>但这样一群人，却为阿里巴巴打下了最初的根基，后来他们也在阿里集团身居高位。</p><p>这就是马云的理念：用人的最高境界就是提升人。</p><p>2002年互联网寒冬，阿里巴巴陷入绝境，但马云依然狠砸100万元，为员工办了两个培训班。</p><p><img src=\"http://p9.pstatp.com/large/5e710003f37650608f86\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>100万元，对当时的阿里来说是一笔不小的开支，但马云坚持：</p><p>“人是最关键的产品，所以，我们要在三年内锻炼我们的队伍。我们盼望着三年内培养出最优秀的互联网员工。”</p><p>马云不仅砸钱请人培训，还自己带着高管去讲课：他和关明生讲价值观、彭蕾讲阿里巴巴的历史、李旭晖和孙彤宇讲产品和销售技巧。</p><p>在这样的培训下，阿里巴巴才从游击队变成正规军，员工也跟着企业一起成长。</p><p>2、少招应届生，多招社会人</p><p>从2015年起，阿里取消了招聘应届毕业生的要求，每年最多不超过300人，这是阿里不同于其他任何大企业的用人法则。</p><p>马云觉得，应届毕业生初入职场，只是一张白纸，虽然标准化、容易管理，但3到5年就会成为管理者，15年后都会成为一样的人。</p><p>与此相比，阿里更喜欢社招，他们更有经验、更有想法，虽然不容易管理，不过碰撞就能出火花。</p><p><img src=\"http://p3.pstatp.com/large/5e6f000327933119ca57\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>3、永远不找最完美的人</p><p>马云曾说：</p><blockquote><p>“我永远不选最好的员工，只选最合适的员工。选最好的员工是个灾难。</p><p>我喜欢这样的人：他会说，1、I am a man （我是个普通人），我有缺点，但我想努力；2、我有梦想。我讨厌人说 This is a job ...（这只是工作），智商高的人情商一般都低。”</p></blockquote><p>因为员工不完美，你就能指导他、帮助他，让他的成长，带动公司的成长，实现双赢。</p><p>4、知人善用，合适的人放在合适的位置</p><p>马云作为阿里巴巴的创始人，清楚地知道自己的位置，他不需要懂管理、业务、财务，他需要调兵遣将，把合适的人放在合适的位置上。</p><p>马云不懂管理，就请来通用高管关明生担任COO；不懂财务，就找来国际专家蔡崇信当CEO；不懂技术，就从雅虎挖来吴炯担任CTO...</p><p>知道自己和员工的长处和短处，每一个人放在合适的位置上，才能把大家的潜能最大化。</p><p><img src=\"http://p3.pstatp.com/large/5b5900055420eb358b22\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>5、不要野狗和小白兔</p><p>什么是野狗？业绩很好，每年都能销售出很多产品，但价值观很差，不讲究团队精神，也不讲究质量、服务。</p><p>什么是小白兔？人特别善良，特别热情，但业绩好不起来了。</p><p>这两种人，马云说，一定不能手软，一定要杀。野狗对团队的伤害很大，小白兔根本创造不出价值。</p><p>不过，小白兔离开公司三个月后，还有机会再回来，只要他能把业绩搞上，野狗就没有这个机会了。</p><p><img src=\"http://p3.pstatp.com/large/5e700003274c851a2312\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>6、用人要疑、疑人要用</p><p>有些人讲究“用人不疑”，有什么工作只订个目标，让手下去做，也不过问过程。</p><p>马云说，这样做是不对的，用人也要疑。</p><p>譬如你在年初给手下定了目标，年末要达到多少目标，到年中时，你也要检查一下进度，这不是不信任，而是监督、鞭策。这就是“用人要疑”。</p><p>如果他的进度不如人意，向你解释了原因，你心存疑惑，但也要让他继续下去，这就是“疑人要用”。</p><p>这才是真正的信任，哪怕你也摸不准他的做法是对是错，也会用他，让他去做。为什么允许自己失败，却不允许别人失败呢？这就是“用人要疑，疑人要用”。</p><p><img src=\"http://p1.pstatp.com/large/5b5a0005426c26c8a0f2\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>7、保持乐观心态</p><p>很多老板遇到员工出错，就会大发雷霆，事情没解决，自己还伤身体。</p><p>马云觉得，凡是要放轻松，多点经历，就会平淡地看待这个世界，都有好、都有坏，了解人性是什么、世界是什么。</p><p>员工总会出错，关键是如果帮助他成长、修补制度，让类似事情不再发生；</p><p>公司总会遭受挫折，关键是跌倒了如何爬起来，继续前进。</p><p>心态一定要乐观，如果不乐观，人就很容易走偏，公司的氛围也会很糟糕。</p><p><img src=\"http://p3.pstatp.com/large/5b5c0004c48b59a598cc\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>用人八字诀：</p><p>“惜马用牛赶猪打狗”</p><p>企业用人，其实是重中之重，但怎么用人，各位企业家就头疼了。</p><p>其实，所谓“人”，虽然千差万别，但拿动物做比喻，无外乎“马、牛、猪、狗”四类，因此，有古语云：“惜马用牛赶猪打狗。”</p><p>精髓就是：用其所长，避其所短。</p><p>马云也说：</p><p>“我脸上的每部分拆开来看还可以，但是合起来就那么难看，有的人每个部位都不漂亮，但合在一起就很漂亮了。”</p><p><img src=\"http://p1.pstatp.com/large/5b59000554212e7bdc67\" alt=\"马云：18罗汉当年曾被开掉一个！马云用人7大原则，老板必看！\"/></p><p>找准每个人的位置，让大家都能发挥自己的最大潜质，把一个人的小能量，汇集成所有人的大能量，公司才能迎来长足的进步！</p><p>所以，如果你是企业家，在抱怨底下的人太糟糕时，请扪心自问，你把人用对了吗？你把人放对地方了吗？</p><p>再好的千里马，放在不识货的人手里，也只能终于困在马房之中，郁郁不得志。千里马常有，而伯乐不常有。老板们想要得到人才，自己先做个伯乐吧！</p><p><br/></p>','0','0','0','0','0','0','马云','0');
INSERT INTO `qb_cms_content1` VALUES ('17','1','12','李小龙的儿子李国豪究竟是被谁谋杀的？这三个人嫌疑最大！','1','1','227','2','3','0','1517533867','1548247622','0','uploads/images/20180302/1cb8ca8badefa49403b56d02365b5246.JPG,uploads/images/20180302/1271aa70880157872ecd4c1cac3f6eca.jpg,uploads/images/20190114/1_20190114214014e44bf.jpeg','<p style=\"text-align:center\"><img src=\"http://p1.pstatp.com/large/5e7c000294983680cce9\" alt=\"李小龙的儿子李国豪究竟是被谁谋杀的？这三个人嫌疑最大！\"/></p><p>一代功夫巨星李小龙于1973年7月20日死在好友丁佩家中，死前无任何征兆，李小龙的突然死亡让所有人震惊，尽管众说纷纭，但是李小龙的死至今还是一个谜团，其好友丁佩几十年来也遭受了巨大的压力，指责和谩骂如影随形，让她每一天都过的心惊胆战，正当大家都已经对李小龙的死逐渐淡忘的时候，又一爆炸性的消息瞬间出现在了世界各大媒体报刊上，时隔二十年之后，李小龙的儿子李国豪同样突然死亡，而且死的不明不白，这一切还要从李国豪当时正在拍摄的电影《乌鸦》说起。</p><p><img src=\"http://p3.pstatp.com/large/5e780003390d1a44e98c\" alt=\"李小龙的儿子李国豪究竟是被谁谋杀的？这三个人嫌疑最大！\"/></p><p>当时，李国豪正在美国北卡罗莱纳州威尔明顿市的电影片场拍摄《乌鸦》，这是一部枪战剧，而李国豪所饰演的角色在电影中被人一枪毙命，但让李国豪没想到的是他自己本人真的死在了剧组的道具枪下，枪声一响，李国豪应声而倒，鲜血四溅，当大家发现异常时，所有人都吓坏了，于是大家七手八脚的将李国豪抬到医院，可是由于抢救不及时加上受伤太重，李国豪最终抢救无效死亡。</p><p><img src=\"http://p3.pstatp.com/large/5e830000d9d2a5ae4524\" alt=\"李小龙的儿子李国豪究竟是被谁谋杀的？这三个人嫌疑最大！\"/></p><p>李国豪的死和当年李小龙的死马上就被大家联系到了一起，天下难道还会有如此巧合的事情吗？或者这就是命运的安排？一时之间李小龙当年的死因又被挖掘出来，成了当时最大的谜团，后来警方对剧组的道具枪进行了检查，发现其他子弹都是空子弹，而只有射向李国豪身体的那一刻子弹是实弹，于是警方顺藤摸瓜，找出了杀害李国豪嫌疑最大的三个人，他们分别是演员麦西，在剧中正是他向李国豪开枪，很自然他被当成了杀害李国豪的第一嫌疑人，但是麦西却大喊自己冤枉，因为自己在演出之前并没有接触到枪支，他是按照剧情开枪的，他认为其中装的是空子弹，而枪是开拍前剧组道具总管交给他的。所以道具总管很自然的就成了第二嫌疑人。</p><p><img src=\"http://p3.pstatp.com/large/5e7b0002f8f9d108e83c\" alt=\"李小龙的儿子李国豪究竟是被谁谋杀的？这三个人嫌疑最大！\"/></p><p>剧组道具总管同样摸不着头脑，因为在剧组中，他只管保管枪支，而装弹药这种活是由特技人员来干的，所以特技人员就是第三嫌疑人，但特技人员说自己装的都是空子弹，装完后交给了道具总管，按照程序来说，道具总管在收到枪之后应该进行检查，但是由于当时道具总管的粗心，这支枪没被检查就用上了，美国警方排查来排查去，觉得这三个人任何一个都可能暗杀李国豪，到最后也没能理出个头绪，而这场谋杀案就这样不了了之了，其实这三人不一定非要提前将实弹装入枪支，只要其中任何一人准备一颗实弹，李国豪就必死无疑，所有人都忽略了这一点，可能连李国豪自己都没有想到他的仇人会用这种方式来谋杀自己。</p><p><img src=\"http://p3.pstatp.com/large/5e7a00032b53b07369d0\" alt=\"李小龙的儿子李国豪究竟是被谁谋杀的？这三个人嫌疑最大！\"/></p><p>后来警方放过了这三名嫌疑人，当然也放弃了对真凶的追捕，李国豪的死亡就此成为了一个新的谜团，但实际上凶手肯定就是这三人其中的一个，因为剧组在拍戏之前只有这三人接触过枪支，可是因为证据不足，所以只能不了了之，李国豪去世的时候仅仅二十八岁，比他的父亲还年轻，他本来可以成为和他父亲一样优秀的电影演员，但是却因为一次组织周密的谋杀失去了生命，实在是非常遗憾，二十多年前，李国豪曾经在李小龙的葬礼上指着父亲的遗照叫喊“电影，电影”，他以为父亲的死是虚假的，只是拍摄的一个电影镜头而已，但没想到自己二十年之后死在了电影中，这难道真是冥冥中注定吗</p><p><br/></p>','0','0','0','0','0','0','','0');
INSERT INTO `qb_cms_content1` VALUES ('20','1','9','王健林感谢政府，将剥离所有房地产业务，一平米都不留','1','1','29','1','0','0','1547472777','1548225009','1547783151','uploads/images/20190114/1_20190114213237a7758.jpeg','<div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/0a2ce28b32d548edb6d7e55719053afc\" img_width=\"1080\" img_height=\"720\" alt=\"王健林感谢政府，将剥离所有房地产业务，一平米都不留\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">低调了两年多的王健林，在周末万达的会议上，终于高调了一回。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">过去两年，因为深陷舆论的质疑和资金链的危机之中，王健林的日子可以说不太好过。只有不断甩卖旗下的资产，才能够活下去了。根据不完全统计，万达甩卖了自的酒店业务给富力地产，文化旅游项目给了融创地产，海外地产项目也几乎抛售一空，电商业务也基本上停止了发展。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/7aaf48ce6b5e41d494cc8c8bf842f001\" img_width=\"800\" img_height=\"567\" alt=\"王健林感谢政府，将剥离所有房地产业务，一平米都不留\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这也被人称作是“断臂求生”，通过一番整顿之后，万达在去年依然保持了很不错的盈利，当然，营业收入略微有下滑。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">周末，王健林表示，发自内心感谢国家，感谢改革开放。这个表态和当年恒大的许家印如出一撤。更重要的是，王健林宣布，将全面剥离房地产开发业务，一平米都不留。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/0ca12d5ba962419c923bea96f66543e4\" img_width=\"850\" img_height=\"500\" alt=\"王健林感谢政府，将剥离所有房地产业务，一平米都不留\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这不仅是在表明自己的态度，从商业上也是一种考虑，毕竟，房地产最好的日子从去年开始已经结束了。没有哪个国家在城市化水平如此之高的情况下，房地产依然享有这么高的利润收入。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这个时候，急流勇退，不仅仅是勇气，更是一种智慧。</p><p><br/></p>','0','0','0','0','0','0','王健林感谢政府，将剥离所有房地产业务，一平米都不留','0');
INSERT INTO `qb_cms_content1` VALUES ('22','1','10','顺丰控股回应&quot;负债300亿&quot;：直营模式问题；王欣社交APP疑去掉“马桶”','1','1','5','1','0','0','1547783252','0','1547783252','uploads/images/20190118/1_20190118114709ae99b.jpeg','<div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/653a7d90af734be785888ac1f000eb60\" img_width=\"640\" img_height=\"329\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/5f8123c989b84e26b528482c2f266a2f\" img_width=\"246\" img_height=\"56\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">顺丰控股回应负债300亿：直营模式财务数据与轻资产公司不可比</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/dfic-imagehandler/2a449020-7ba3-4c7a-b167-86f5e78a8321\" img_width=\"1200\" img_height=\"800\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">据金融界消息，截至2018年三季度末，顺丰控股负债总额已达308.74亿元，比2017年同期大幅提高23.25%；资产负债率达到46.77%。对此，顺丰控股董秘甘玲对e公司记者表示，直营模式经营的财务数据与轻资产公司不可比。顺丰2018年三季度末资产规模660亿，负债率和全球著名直营快递企业相比仍属较低水平，德国邮政DHL等全球前三大快递公司资产负债率均在70%左右。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此外甘玲还表示，公司拟在境内外发行不超160亿债券只是申请额度，不意味全部发行，新发债券会有部分置换已有债务。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">去掉“马桶”？王欣的社交APP疑改名“MT”</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/920968b0de824b428b50a39031f077af\" img_width=\"801\" img_height=\"386\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月17日，快播创始人王欣发文称，“MT（magical truch）希望成为一个更开放更真实的朋友圈，同时解决从信息到人的连接难题。”记者发现，在“马桶MT”官网中，原有的“马桶MT”字样均已改为“MT”。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">王欣于1月15日发布马桶MT社交软件，主打匿名社交，该产品目前只有聊聊和话题两个功能，“话题”是基于地理位置发起的匿名社区，“聊聊”板块可看到自己参与的话题。不过，该APP一上线便被微信屏蔽，用户分享到微信的链接无法打开。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">拼多多回应将进军快递业：我们是重要参与者，永远不会成为介入者</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/dfic-imagehandler/65c0ce07-a3b9-4269-b2a5-b11c83222f38\" img_width=\"1200\" img_height=\"799\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">日前，拼多多向商家发布通知指出，为了更好的满足商家发货需求，在线下单可以在商家后台使用的基础上，已逐步向ISV(打单软件、ERP)开放。商家使用在线下单联系快递公司，平台会对揽收时效进行监控、降低发货违规风险。平台也在规划使用在线下单因物流原因引起的发货违规，商家免处罚的方案。稳定使用在线下单的商家将优先体验”。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">有自媒体据此分析称拼多多将进军物流快递行业。1月17日晚，拼多多回应表示，此消息系善意误读。拼多多表示，虽然公司已成为物流快递行业重要的参与者，但永远不会成为介入者。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此前，拼多多创始人黄峥在接受采访时透露，拼多多应该是农产品最大的电商平台，每天产生的快递要占整个中国快递总量的20%以上，并且有能力去解决上游和中间环节的物流问题。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">即刻CEO回应央视网络索赔500万：发动图若算侵权请给我支付宝账号</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/324ae7450a93408d990f0b6d8c7a11b2\" img_width=\"703\" img_height=\"307\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月17日，针对近日央视网络起诉即刻APP索赔500万一事，即刻CEO瓦恁在微头条发文回应称：即刻app在世界杯期间没有任何视频直播，甚至主动屏蔽了所有第三方直播链接；即刻app没有提供世界杯视频点播服务；从来没听说过动图点播这个说法；即友发的ugc动图，如果也涉及侵权央视，请给我个支付宝账号。即刻和我一定尊重法律，也愿意推动中国互联网法律在动图上有法可依。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">北京海淀法院网1月16日发布消息称，因认为“即刻”APP未经其授权，擅自向公众提供2018年俄罗斯世界杯比赛画面动图点播服务，构成不正当竞争，央视国际网络有限公司将该APP运营商上海若友网络科技有限公司诉至法院，要求赔偿经济损失及为维权支出的合理费用合计500万元。目前海淀法院受理了此案。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">中兴通讯：董事会提名李自学等人为非独立董事候选人</span></h1><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中兴通讯17日发布公告称，公司第七届董事会提名李自学、徐子阳、李步青、顾军营、诸为民、方榕为公司第八届董事会非独立董事候选人。任期将于批准委任的股东决议案通过后从2019年3月30日起至2022年3月29日止。此外，公司第七届董事会提名蔡曼莉、Yuming Bao（鲍毓明）、吴君栋为公司第八届董事会独立非执行董事候选人。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">小米以每股9.7625港元回购614万股B类股份，有股东套现21.8亿港元</span></h1><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月18日，小米发布公告称：于2019年1月，董事会正式议决适当时于公开市场运用购回授权。于2019年1月17日，本公司于公开市场购回6140000股B类股份，平均价为每股B类股9.7625港元。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">近期小米股价持续低迷，1月9日小米上市满半年，部分股票开始解禁，虽然雷军等股东承诺在一年之内不会出售持有的所有股票，但小米股价下跌的情况并没有好转。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月16日，金融界报道称，有未披露的投资者以每股9.45港元的价格出售了2.31亿股B类股票，据计算，该股东套现了约21.8亿港元，这是小米早期股东首次出售小米股票。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">截至1月17日收盘，小米股价报9.74港元。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/a18bf5c2f407429bb6e738e06f1020d9\" img_width=\"723\" img_height=\"330\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/74a843d11eef47eab041b4b1f5375792\" img_width=\"246\" img_height=\"56\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">任正非：从来不支持“自主创新”这个词，科技要踏在前人肩膀上前进</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/ce21f8f6171447af900a4131464c2051\" img_width=\"1080\" img_height=\"720\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月17日下午，华为创始人任正非在深圳坂田总部接受国内媒体采访。任正非说，外面的变化对华为没有这么大的影响。因为华为有信心，把产品做得比别人都好，让别人不想买都不行。所以，华为没有像外界想像中的那么担忧。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在接受采访时谈到自主创新，任正非说：我从来不支持“自主创新”这个词，我认为，科学技术是人类共同财富，我们一定要踏在前人的肩膀上前进，这样才能缩短我们进入世界领先的进程。什么都要自己做，除了农民，其他人不应该有这种想法。自主创新若是精神层面我是支持的。也就是说，别人已经创新，我们要尊重别人的知识产权，得到别人的许可，付钱就行。如果我们重做一遍，做完一遍，也要得到许可，还是要付钱，这是法律。当然科学家都是自主创新的，我指的是我们这种公司的工程创新。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">腾讯张军发文斥责“某些忙着做社交产品的公司”：花钱发黑稿，下作</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/91c7bb782fa84315849bc68d1135d453\" img_width=\"1242\" img_height=\"1062\" alt=\"顺丰控股回应\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">近日，马桶MT、多闪、聊天宝三款新社交APP同日上线，不过，三款APP刚一上线就被微信屏蔽，分享到微信的链接都显示不能打开。王欣，罗永浩都对此表示不满。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月17日消息，腾讯张军在朋友圈发布动态称“某着急忙慌做社交产品的公司”放下了豪言壮语，四处找人写黑稿。张军直言这种行为很“下作”：有这些钱干嘛不拿去好好做产品。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此前，张军表示，媒体在批评的同时应当尊重事实，“我们尊重所有理性讨论问题，别上来就上纲上线，我们都不是卫道士。”张军说，“随便做个什么东西过来就叫挑战什么霸权。拿堆红包出来骗用户下载，留存，也好意思叫产品。”</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">张军称，也没有哪个领域是谁的专利，每个领域谁都可以做，用产品说话。“被人无端骂了半天，我也得说说话，要不然有人还真当腾讯佛性到家，怎么捏都是软柿子。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8dc73a52d78648c7b9223820b23a565e\" img_width=\"246\" img_height=\"56\" alt=\"顺丰控股回应\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">蛋壳2亿美元收购爱上租成业内最大收购案，此前曾被传资金紧张</span></h1><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">知名长租公寓品牌蛋壳公寓1月17日宣布，以2亿美元（包含现金和债务）全资战略收购知名长租公寓运营商爱上租，涉及原爱上租的全部资产、100%股权并入蛋壳公寓，交易完成后，蛋壳公寓管理房间数量接近40万间。蛋壳公寓和爱上租均为分散式长租公寓领域排名前三的企业，此次交易也因此成为业内迄今最大的一桩收购案。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">公开资料显示，爱上租成立于2015年7月，创始人为原我爱我家联合创始人、盛世管家创始人童浩。该公司创立于浙江杭州，目前的业务范围在杭州、上海、南京、苏州四个城市，管理房间总数超过8万间。蛋壳公寓创始人兼CEO高靖表示，未来会延续双品牌战略，爱上租也会保持独立运营。</p><p><br/></p>','0','0','0','0','0','0','顺丰','0');
INSERT INTO `qb_cms_content1` VALUES ('23','1','10','万达宣布彻底退出房地产，那些接盘侠，你们还好吗？','1','1','17','1','0','0','1547783348','1548224875','1547783348','uploads/images/20190118/1_20190118114844f5d17.jpeg','<p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">刚刚，万达，高调宣布：<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">2019年将彻底退出房地产！1平方米也不能有！</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">转型2年多以来，万达在不断卖卖卖：文旅城、酒店、万达商业、海外资产……</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">收购阵营也在不断扩大：<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">融创、富力、腾讯、苏宁、珠江人寿……</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">那些接盘侠们，你们还好吗？</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/2a8263bc9935456b85aee2b708e0ae60\" img_width=\"1080\" img_height=\"610\" alt=\"万达宣布彻底退出房地产，那些接盘侠，你们还好吗？\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2018年，经历一系列风波的万达再次登上头条。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">刚刚，在年终总结会上，万达宣布：</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">2019年万达将彻底退出房地产业务！1平方米开发也不能有。</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">退出了房地产，万达还能玩什么？</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">大健康、大影视、大娱乐？</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">转型的代价无疑是巨大的，</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">在这一年里，王健林的财富缩水高达109亿美元。</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/d40dab8c4d31465380fa209a5346e2aa\" img_width=\"1080\" img_height=\"706\" alt=\"万达宣布彻底退出房地产，那些接盘侠，你们还好吗？\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">你看不懂万达的卖卖卖</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">万达的买卖不是所有人都能看明白的，要是这样，那我们这些人就没价值了。</span>这种战略调整肯定不舒服，甚至是痛苦的，但万达一定要“咬定青山不放松，任尔东西南北风”。<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">——王健林</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><blockquote style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 1em 0px; padding: 12px 10px; position: relative; line-height: 1.5; color: rgb(153, 153, 153); background: rgb(244, 245, 246); border: 1px solid rgb(232, 232, 232); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal;\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">当年的接盘侠们，你们还好吗 ？</span></blockquote><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2017年</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">2017年开始，融创孙宏斌三度接盘文旅城项目，规模高达3000亿。</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2017年7月19日，融创以438.44亿元收购西双版纳万达城、南昌万达城等13个万达城91%股权，并由交割后项目承担现有全部贷款约454亿元。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">融创要连续20年，每年每个项目付5000万元品牌许可使用费给万达，共计130亿元！</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">如此大的资金规模，即便融创不缺钱，拿下了万达城是否是一件合算的买卖呢？</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2017年，富力地产200亿“豪迈”接盘万达酒店。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">现状：债台高筑，不得不发债融资输血</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2017年万达、在融创、富力的世纪大交易中，富力以200亿元价格拿下万达旗下77家酒店。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/df588ca242fe4ebdbda0af26cab9ea01\" img_width=\"1080\" img_height=\"591\" alt=\"万达宣布彻底退出房地产，那些接盘侠，你们还好吗？\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">当时外界最关注是声明更响亮的王健林和孙宏斌，三个男人中，李思廉标准配角。<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">接下来的半年，富力连续两次接盘万达的海外资产，分别涉及万达在英国伦敦的两个地产项目。</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">被称为“华南五虎”之一的富力地产曾名噪一时，是首家纳入恒生中国企业指数的民营房企。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">但<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">收购万达酒店后，富力地产也债台高筑</span>，已沦落地产第二梯队，业绩平平。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/be52f6f0801e4ae29d916bbdd53c2fc8\" img_width=\"1080\" img_height=\"542\" alt=\"万达宣布彻底退出房地产，那些接盘侠，你们还好吗？\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2018年</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">2018年1月，腾讯、苏宁、京东加入阵营，收购万达商业退市股份</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">腾讯控股作为主发起方，联合苏宁云商、京东、融创中国与万达商业在北京签订战略投资协议，计划投资约340亿元，收购万达商业香港H股退市时引入的投资人持有的约14%股份。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">详见复利姐报道：</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">340亿“拯救”万达：腾讯、京东都出手了</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">2018年8月，保险公司珠江人寿加入收购</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2018年8月，珠江人寿开始接盘万达系公司，主要是房地产开发公司。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">包括大同万达房地产开发有限公司、南昌西湖万达广场投资有限公司、崇州万达广场置业有限公司、益阳万达广场投资有限公司、平顶山万达广场投资有限公司。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">从此以后，万达不再是房企了，那么，因为看上万达光环而买了万达商业区房子的投资者们，房子会烂在手里吗？</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">曾经说过<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">“一个亿小目标”的王首富，一夜之间跌下神坛</span>：国家点名批评、银行断贷、股债双杀、资产大缩水、“贱卖”资产、宣布彻底告别房地产…….</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">别了！王健林！别了！万达地产！</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/7157b34ba38641e79ec0174809ded70f\" img_width=\"1080\" img_height=\"841\" alt=\"万达宣布彻底退出房地产，那些接盘侠，你们还好吗？\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">另，<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">据说万达商业今年全面剥离房产业务，将进军大健康。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“以顶级医院为核心，综合医药、康养、商业、培训多种产业为一体，走创新健康产业新模式”。</p><p><br/></p>','0','0','0','0','0','0','万达，房地产','0');
INSERT INTO `qb_cms_content1` VALUES ('25','1','9','2019，跟对人，走对路，做对事！','1','1','16','1','0','0','1547807249','0','1547807249','http://mmbiz.qpic.cn/mmbiz_jpg/0M95mibkllHh8yOmkEgYiaicHx3XlY8K17vHtbR9Dk7CicchD8QHiaczPzhtRkS46CqOJGFAfxyRAFibFfcavBApZu1g/0?wx_fmt=jpeg','<div>\n                    \n\n                    \n\n                    \n                    \n                    <p style=\"text-align: center;\"><img class=\"\" data-copyright=\"0\" data-ratio=\"0.11875\" src=\"http://wz.php168.com/wxpic.php?id=0&fid=9&url=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz_gif%2F0M95mibkllHh2fCib2ibPn6MzsU9QPjM9SsJPXRakgOVEzicBpFAgFGYubJBJIclXYP8wwPOhQTXcHfqeUQSB9DC6g%2F640%3Fwx_fmt%3Dgif%26amp%3Btp%3Dgif%26amp%3Bwxfrom%3D5%26amp%3Bwx_lazy%3D1\" data-type=\"gif\" data-w=\"640\" style=\"\"></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;line-height: 27.2px;widows: 1;box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;color: rgb(0, 32, 96);font-family: 宋体;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\">跟对人真的很重要，跟什么样的人就成为什么样的人！</span></strong><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1.5em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(0, 32, 96);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\">让我们跟对人，走对路，做对事！</span></strong><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span></p><p style=\"max-width: 100%;min-height: 1.5em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(0, 32, 96);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;font-size: 18px;box-sizing: border-box !important;word-wrap: break-word !important;\"><img class=\"\" data-ratio=\"0.6666666666666666\" data-type=\"jpeg\" data-w=\"640\" width=\"500px\" src=\"http://wz.php168.com/wxpic.php?id=0&fid=9&url=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz%2FqdMdQQdVQ0YtDecqNucjOGjO7jialHOYiaNIiapR8Ov5icU3XEicnzw6uH18qsGhAxNXGug9lkucB8XMfibrp4POhGFw%2F640%3Fwx_fmt%3Djpeg%26amp%3Btp%3Djpg%26amp%3Bwxfrom%3D5%26amp%3Bwx_lazy%3D1\" style=\"vertical-align: top;box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;\"  /></span></strong></span></p><p style=\"max-width: 100%;min-height: 1.5em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\"><br  /></p><p style=\"max-width: 100%;min-height: 1.5em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">1.普通人的圈子，</span></strong></span><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">谈论的是闲事，赚的是 工资，想的是明天。</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">2.生意人的圈子，</span></strong></span><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">谈论的是项目，赚的是 利润，想的是下一年。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">3.事业人的圈子，</span></strong></span><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">谈论的是机会，赚的是 财富，想到的是未来和保障。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">4.智慧人的圈子，</span></strong></span><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">谈论是给予，交流的是 奉献，遵道而行，一切将会自然富足。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;line-height: 1.6;widows: 1;box-sizing: border-box !important;word-wrap: break-word !important;\"><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><img class=\"\" data-ratio=\"0.6666666666666666\" data-type=\"jpeg\" data-w=\"500\" width=\"auto\" src=\"http://wz.php168.com/wxpic.php?id=0&fid=9&url=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz%2Faic8BFKAgJCYm8EFYSUHD1Qib1KzmnQKiaeq3DwYK0grLq3x1lV9a1qwoibcGdl6Y2sSucjGLbVia9o6JnGsdic8F7ZQ%2F640%3Fwx_fmt%3Djpeg%26amp%3Btp%3Djpg%26amp%3Bwxfrom%3D5%26amp%3Bwx_lazy%3D1\" style=\"vertical-align: top;box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;\"  /><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">在现实生活中，您和谁在一起的确很重要，甚至能改变您的成长轨迹，决定您的人生成败。</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">和什么样的人在一起，就会有什么样的人生。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />● 和</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">勤奋</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">的人在一起，您不会懒惰；<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />● 和</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">积极</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">的人在一起，您不会消沉；<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />● 与</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">智者</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">同行，你会不同凡响；<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />● 与</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">高人</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">为伍，您能登上巅峰。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />●&nbsp;</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">积极</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">的人像太阳，照到哪里哪里亮；<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />●&nbsp;</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">消极</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">的人像月亮，初一十五都一样。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />●&nbsp;</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">态度决定一切。</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">有什么态度，就有什么 样的未来；<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />●&nbsp;</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">性格决定命运。</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">有怎样的性格，就有怎 样的人生。</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><img class=\"\" data-ratio=\"0.6666666666666666\" data-type=\"jpeg\" data-w=\"500\" width=\"auto\" src=\"http://wz.php168.com/wxpic.php?id=0&fid=9&url=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz%2Faic8BFKAgJCYm8EFYSUHD1Qib1KzmnQKiaeZxw6WGZG50GAJpKpys39g7Dhy5h4DldOOpRhQqP8hntHCmXabzr9MQ%2F640%3Fwx_fmt%3Djpeg%26amp%3Btp%3Djpg%26amp%3Bwxfrom%3D5%26amp%3Bwx_lazy%3D1\" style=\"vertical-align: top;box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;\"  /><span style=\"max-width: 100%;font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\"><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />　　</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">生活中最不幸的是：由于您身边缺乏积极进取的人，缺少远见卓识的人，使您的 人生变得平平庸庸，黯然失色。</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">● 如果您想</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">聪明</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">，那您就要和聪明的人在 一起，您才会更加睿智； 如果您想</span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">优秀</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">， 那您就要和优秀的人在一起，您才会出类 拔萃。</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">●&nbsp;</span><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">读好书，交高人，</span></strong></span><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">乃人生两大幸事。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;line-height: 1.6;widows: 1;box-sizing: border-box !important;word-wrap: break-word !important;\"><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">一个人的身份的高低，是由他周围的朋友决定的。</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">朋友越多，意味着您的价值越高，对您的事业帮助越大。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />朋友是您一生不可缺的宝贵财富。因为朋友的激励和相助，您才会战无不胜，一往无前。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />人生的奥妙之处就在于与人相处，携手同行。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  />生活的美好之处则在于送人玫瑰，手留余香。</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: normal;box-sizing: border-box !important;word-wrap: break-word !important;\"><br  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><img class=\"\" data-ratio=\"0.6666666666666666\" data-type=\"jpeg\" data-w=\"640\" width=\"500px\" src=\"http://wz.php168.com/wxpic.php?id=0&fid=9&url=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz%2FzSiayYtDrmBB2V0VldqdWcIXG1Jmic3q08ibLgpIic6xezMAWqg6JpxvoKHwMDdQQYibAEWsYEwOw7Ua330JFVN6FkQ%2F640%3Fwx_fmt%3Djpeg%26amp%3Btp%3Djpg%26amp%3Bwxfrom%3D5%26amp%3Bwx_lazy%3D1\" style=\"vertical-align: top;box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;\"  /><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;box-sizing: border-box !important;word-wrap: break-word !important;\"><br  /></p><h2 style=\"margin-top: 5px;margin-bottom: 13px;padding-right: 10px;padding-left: 10px;max-width: 100%;font-family: inherit;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 2em;border-width: 0px 0px 0px 5px;border-left-style: solid;border-color: rgb(55, 74, 174);-webkit-font-smoothing: antialiased;color: rgb(55, 74, 174);box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(0, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;white-space: pre-wrap;line-height: 1.6;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">凡人六悟</span></strong></span></h2><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 25.6px;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">&nbsp;</span></strong></span><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">①心甘情愿吃亏的人，终究吃不了亏。</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">能吃亏的人，人缘必然好，人缘好的人机会自然多，人的一生能抓住一两次关键机会，足矣！<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">②爱占便宜的人，终究占不了便宜。</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">捡到一棵草，失去一片森林，你看那些一到买单就上厕所或钱包半天掏不出来的聪明人，基本上都没啥特别成就。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">③心眼小的人，天地大不了。</span></strong></span><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">朋友聚会时，三句话不离自己和自家的人，是蜗牛转世，内心空虚、自私。心里只有自家的事，其他的事慢慢也就与他无关。</span></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 25.6px;box-sizing: border-box !important;word-wrap: break-word !important;\"><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 25.6px;box-sizing: border-box !important;word-wrap: break-word !important;\"><img class=\"\" data-ratio=\"0.6666666666666666\" data-type=\"jpeg\" data-w=\"500\" width=\"auto\" src=\"http://wz.php168.com/wxpic.php?id=0&fid=9&url=http%3A%2F%2Fmmbiz.qpic.cn%2Fmmbiz%2Faic8BFKAgJCYm8EFYSUHD1Qib1KzmnQKiaeFlgfXPqTpWV0hlBGeclia1zgQxwQ1NtBick2bTxSl48shQhsrTY3W35w%2F640%3Fwx_fmt%3Djpeg%26amp%3Btp%3Djpg%26amp%3Bwxfrom%3D5%26amp%3Bwx_lazy%3D1\" style=\"vertical-align: top;box-sizing: border-box !important;word-wrap: break-word !important;visibility: visible !important;width: auto !important;\"  /><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></p><p style=\"max-width: 100%;min-height: 1em;white-space: normal;background-color: rgb(255, 255, 255);letter-spacing: 0.544px;widows: 1;line-height: 25.6px;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">④只有惜缘才能续缘。</span></strong></span><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">在人生的路上我们会遇到很多人，其实:有缘才能相聚，亲人多半是前世的好友，好友多半是前世的亲人，给你带来烦恼的多半是你前世伤害过的。所以，一定要善待身边的亲人，关心身边的朋友，宽恕那些伤害你的人。也许，这就是因果。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">⑤心中无缺叫富,被人需要叫贵。</span></strong><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">快乐不是一种性格,而是一种能力。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">⑥笑看风云淡，坐看云起时。</span></strong></span><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">不争就是慈悲，不辩就是智慧，不闻就是清净，不看就是自在，原谅就是解脱，知足就是放下。<br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /></span></strong><br style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"  /><span style=\"max-width: 100%;color: rgb(63, 63, 63);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">今生注定我们什么也带不走，所以应该：</span><span style=\"max-width: 100%;color: rgb(255, 0, 0);box-sizing: border-box !important;word-wrap: break-word !important;\"><strong style=\"max-width: 100%;box-sizing: border-box !important;word-wrap: break-word !important;\"><span style=\"max-width: 100%;color: rgb(192, 0, 0);font-family: 宋体;box-sizing: border-box !important;word-wrap: break-word !important;\">活在当下、笑在当下、悟在当下</span></strong></span></p><p></p><p><br  /></p>\n                </div>\n                ','0','0','0','0','0','0','','0');
INSERT INTO `qb_cms_content1` VALUES ('26','1','9','陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波','1','1','14','1','0','0','1548223796','0','1548223796','uploads/images/20190123/1_20190123140934e2487.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">陈昱霖最近成为了风口浪尖的人物，而她的社交媒体被扒，发现当初那个在横店楚楚可怜任劳任怨的形象一下子毁了，因为大家发现陈昱霖的生活真的太滋润了，简直就是富家千金的活法啊！</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这些首饰，动辄都是几十万，甚至还有上百万的。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/84db0829679441a39be0e431deaf0915\" img_width=\"651\" img_height=\"717\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/395752b30eb54d76a085779507ca1f2c\" img_width=\"655\" img_height=\"636\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/be6a071db32f455a898b9fbe0ec43689\" img_width=\"648\" img_height=\"652\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/27a1039171e744298faf8490bad1a9ec\" img_width=\"660\" img_height=\"566\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">爱马仕不计其数</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/542acd47d36546619c64de297d4437d1\" img_width=\"652\" img_height=\"741\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">私人飞机随便坐</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/e5b5fec10b11459fa33ec9721a4a7f26\" img_width=\"637\" img_height=\"684\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">全世界各地随便去</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/3d5056091ec24547ae66b6a65ed1d5e2\" img_width=\"647\" img_height=\"732\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">好莱坞名人随随便便就可以贴面合影</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/0456503146ef49359fc5cdaefdc65e2c\" img_width=\"657\" img_height=\"762\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/aafef47506fa4af486978ef92f97545e\" img_width=\"655\" img_height=\"742\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">一个出身普通家庭的38线明星，居然可以有钱到这个地步，也真的是很让人瞠目结舌了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而近日，一组陈昱霖的旧照遭扒，是当时她主演的电视剧吉祥天宝的发布会照片，这是她的第一部当女主角的电视剧。就是这张图，大家应该很熟悉吧？</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/5fbe736501d4407ebeb0817506aa3ed8\" img_width=\"555\" img_height=\"576\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">当年这部剧举行记者发布会时的一系列照片再度被扒，女主角陈昱霖站在了C位，赵丽颖作为女二号站在了侧边。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/e9f4a07c5e1e484d9ea8a21fbca87bf5\" img_width=\"717\" img_height=\"691\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">当年的陈昱霖，其貌不扬，看上去有点黑跟壮实，身材跟样貌也算不上好，看上去还有点土土的……</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/34f661a4180943d39e5b73819bfd0a06\" img_width=\"539\" img_height=\"672\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/484b6165e09f4370b20fe5702999000a\" img_width=\"592\" img_height=\"714\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">开机仪式的照片也随之曝光，她作为女主角，站在导演的旁边，旁边的赵丽颖戴着墨镜，个头也比她高，气质什么的真的是赢太多了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/3ff95a74e6dd40afa5fb6fca607d60a0\" img_width=\"885\" img_height=\"597\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/a67419ec9c1a4a5abfd4ef71e03315e4\" img_width=\"991\" img_height=\"545\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">吉祥天宝其实2013年就拍完了，但是直到2016年才播出，豆瓣评分5.8，而且评1星的多达36.2%，5星的也有30.3%，这两个极端的评分占据了一半多。我觉得1星应该是吴秀波事件后，网友们才抵达战场去打分的。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/31ecbb09b47f496fb11a8e71db69b525\" img_width=\"914\" img_height=\"377\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而今天，网上也曝光了吴秀波当年去探班陈昱霖的视频，他还亲自上阵教陈昱霖表演。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">穿着戏服的陈昱霖跟吴秀波，两人坐在台阶上，吴秀波大概是在跟她说戏。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/20dce906d5f7473a96f6d14656be235f\" img_width=\"932\" img_height=\"520\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">当时电视剧的官博还cue了吴秀波，说有他的支持，陈昱霖信心满满。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/d9d8966f1bd6460789b5ecd9f5fb0cda\" img_width=\"995\" img_height=\"668\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">吴秀波说看这个戏特别的紧张，因为这个戏里有一个特别小特别小的姑娘是自己的同门，看她演戏就像看自己孩子演戏一样，恨不得自己亲身上阵。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/9512ad6b1eb445a2afcfb90090cb69c6\" img_width=\"928\" img_height=\"475\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/33b78328f16642efbd25e26786ac9deb\" img_width=\"931\" img_height=\"513\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/92146e01d70b4ca0ae95b38aa467c993\" img_width=\"905\" img_height=\"481\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/c36bc042bd6948d4b0a656e3d75ecc78\" img_width=\"944\" img_height=\"512\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">吴秀波还在片场认真指导陈昱霖拍戏，因为这戏是2013年拍的，而据陈昱霖去年说她跟了吴秀波7年，所以那个时候她已经 跟吴秀波在一起了。倒是看不出一点端倪啊，两人的相处十分的自然客气。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/c4fb5cb9eeb24c10b1c84e7d4bc6ac88\" img_width=\"442\" img_height=\"242\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">去年9月份陈昱霖在爆料里也曾经提到过吴秀波去探班这件事，还说后来有两个女的分别给她发信息，她当头一棒，根本拍不了戏，强撑着去拍完自己第一部女主角的戏，然后就再也不想去拍任何戏了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8bef3a55389a4d98974c5ca1fc5a4d14\" img_width=\"528\" img_height=\"309\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">翻看了一下陈昱霖的履历，她在2014年之后，就全面停止拍戏了，到现在也有4年的时间了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">其是陈昱霖的出身还算不错，毕业于武汉音乐学院，然后我发现她改了年龄，她是88年出生的，而不是外界传的今年才25岁。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/c1cdfc49f0c6405fb8a2d5ea9ba8a3b0\" img_width=\"558\" img_height=\"671\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2006年参加过央视的星光大道，07年又参加一个湖北卫视的一个唱歌选秀，09年还参加过快乐女声，同年还去香港参加一个歌唱比赛拿了亚军。其实按照这个轨迹走，热爱唱歌，也不会完全没有出路，而且可以看出来陈昱霖并非花瓶，音乐科班出身，是有一定的实力的。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/46a3e268d1cb4f20a9e2366115dcb72c\" img_width=\"662\" img_height=\"437\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">当年她还曾在张峻宁的MV小飞侠里跑了龙套，只有短短几秒的镜头。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/e91e08cadf4f46648b12bc52521d8a42\" img_width=\"1200\" img_height=\"670\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2011年之后，她认识了吴秀波，于是开始拍戏，我们看到她微博上首次晒出跟吴秀波的合影也是2011年。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/5ab0681b8f5148abbc4253103ffe32d7\" img_width=\"574\" img_height=\"475\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2011年，陈昱霖参演自己的第一部戏，叫下一个奇迹，主演是张卫健谢霆锋张芷溪，除此之外还有海清王鸥李光洁，吴秀波也在里面出演一个角色。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/4cbf95ec41ba4126b21d80e7257a5d6c\" img_width=\"823\" img_height=\"536\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">但陈昱霖真的是查无此人，她跟吴秀波的那张合影，大概就是拍戏间隙在片场留下来的。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/f7286fd776394df1a56ebf4381563db9\" img_width=\"934\" img_height=\"533\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">下一个奇迹后，陈昱霖就拍了吉祥天宝，接着又拍了网络情景喜剧怪咖啡，因为是吴秀波公司出品的，他也在里面客串了。而2014年，吴秀波已经蓄起了胡子，靠着暖男魅力大叔形象开始走红了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/c9fe81a92cff43c79970c14d08e470a7\" img_width=\"464\" img_height=\"596\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而在这部剧之后，陈昱霖就全面停工，不拍戏，不唱歌，也基本上算是消失在娱乐圈了，因为她没演过什么太出名的戏，所以她的消失，也没人提及。只是在2016年吉祥天宝播出时，因为赵丽颖的走红，大家才在说，那个女主角现在去哪儿了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/e9b62e65e5ae4720af36f8477fb583ff\" img_width=\"956\" img_height=\"668\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">有时候真的觉得蛮可惜的，好好的一个女孩子，88年出生，才30岁，本应该前途光明的。又是音乐科班出身，有一副好嗓子，虽说不至于国色天香，但怎么说也算是个好看的女孩子，就这样锒铛入狱。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">归根到底，还是拎不清事情，当了小三，纸醉金迷，被金钱，还有被不道德的爱模糊了双眼，真希望女孩子可以自立自爱，玩火的感情，真的太可怕了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/92e14409b8be43bd9f18f76a926733c5\" img_width=\"989\" img_height=\"821\" alt=\"陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p><br/></p>','0','0','0','0','0','0','陈昱霖旧照被指土肥圆，赵丽颖曾给她配戏，主演三部剧都有吴秀波','0');
INSERT INTO `qb_cms_content1` VALUES ('27','1','9','八卦说，王源的爷爷怕打扰王源不敢打电话？王丽坤保护女演员？','1','1','63','2','4','0','1548223831','1548247763','1548223831','uploads/images/20190123/1_20190123141017bc7c3.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">小八卦</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/b2504e10f588411b9b48dd9857f3469d\" img_width=\"1053\" img_height=\"828\" alt=\"八卦说，王源的爷爷怕打扰王源不敢打电话？王丽坤保护女演员？\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">王源的爷爷平时都不敢打电话给王源，就怕打扰到王源，他为了能看到王源在网上的视频，特地去自学了如何使用智能手机。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">段奕宏在上学的时候是最认真的一个，在节假日里别人都出去玩，只有他一个人一直泡在图书馆里学习或是在教室里排练。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">乔振宇的儿子和女儿很可爱，两个人吃完饭后顺手就会把碗扣在脑袋上，然后开始跳舞，每次看到这一幕乔振宇都快疯了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">周迅有次拍某部电影杀青的时候，有个粉丝特地从很远的地方赶过来探班，周迅知道后把赶紧把妆卸了，脸都没擦干净，就跑出去见粉丝，就怕对方在外面等她等太久了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">刘德华的睫毛很长，特别容易掉到眼睛里，导致他经常突然一下子没办法把眼睛睁开，每次他都把睫毛剪得很短，这样睫毛就掉不进眼睛。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">孙俪有段时间很喜欢看某个唱歌类综艺节目，正巧那个节目组来邀请邓超当助演嘉宾，本来邓超是不太想去，正想推了节目组的邀请，结果让孙俪知道这件事，非要让邓超去，说：“必须得去，不去不许回家！”</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">袁姗姗有次去拍戏，一不小心收工晚了，剧组给的盒饭都凉了，她的助理看到后，特地跑到距离片场很远的小饭店去打包了一份热食回来，把袁姗姗感动得泪流满面坏，抱着助理就不撒手，觉得助理对她实在是太好了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/16011f6ad576447bb445c45cd1cbf5e3\" img_width=\"1004\" img_height=\"817\" alt=\"八卦说，王源的爷爷怕打扰王源不敢打电话？王丽坤保护女演员？\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">之前有一回王丽坤在剧组遇到意外，片场里工作人员给演员休息搭的棚子一不小心倒了，正好王丽坤和一名女演员在里面休息，当时王丽坤第一反应是扑过去护住那名女演员的头。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">张歆艺之前在微博上看到有一个小孩做了手术之后变成脑瘫特别心疼，第二天就跑到那个小孩所在的医院去看望，还给那个孩子的父母转了万。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/7cd3cbc500984081ba32ed57c9819e48\" img_width=\"1220\" img_height=\"960\" alt=\"八卦说，王源的爷爷怕打扰王源不敢打电话？王丽坤保护女演员？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">章子怡刚刚走红的时候，特别想出一个唱片，她觉得自己唱歌很好听，不能浪费这么好的歌喉，把旁边听她说话的经纪人给气到了。于是她就把章子怡拉到某个电影学院门口，让她找几个女生去KTV，然后比比谁的歌声好听。这么一折腾之后章子怡就歇了想出唱片的心了。</p><p><br/></p>','0','0','0','0','0','0','八卦说，王源的爷爷怕打扰王源不敢打电话？王丽坤保护女演员？','0');
INSERT INTO `qb_cms_content1` VALUES ('28','1','9','靳东遭编剧内涵？黄景瑜截胡严宽？袁立炮轰小鲜肉？','1','1','14','1','1','0','1548223873','0','1548223873','uploads/images/20190123/1_20190123141059c6f73.jpeg','<p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">1倪妮井柏然复合？</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/f9a52a2cc4394bc480ddab0300c5354b\" img_width=\"719\" img_height=\"491\" alt=\"靳东遭编剧内涵？黄景瑜截胡严宽？袁立炮轰小鲜肉？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">倪妮和井柏然的情侣身份属于互利共赢，解绑后俩人的热度肉眼可见的暴跌。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">俩人分手后还住在一个小区，有媒体拍到井柏然深夜去了倪妮家，当时倪妮不在家，等了一个多小时后女方回来，俩人正好就在一起了。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">看样子像是复合了，但是因为分手后俩人都没了话题，所以大家猜测是不是联手炒作。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">2张彬彬黑历史被扒？</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/34e937b67a684b66b90581e665604b50\" img_width=\"960\" img_height=\"998\" alt=\"靳东遭编剧内涵？黄景瑜截胡严宽？袁立炮轰小鲜肉？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">嘉行的男艺人中，高伟光的事业心不重，张云龙人气一般，新签的没什么水花，所以张彬彬相对来说发展的更好些。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">每个成名的艺人都逃不过网友的扒皮，张彬彬出道前的模样和现在相比，存在不小的变化，有人工的痕迹。变脸这点无可厚非，被同性亲吻这张引发猜测，不过他确实是直的。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">3靳东遭编剧内涵？</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/6dd48e73dd0f437997329ef324eef630\" img_width=\"511\" img_height=\"382\" alt=\"靳东遭编剧内涵？黄景瑜截胡严宽？袁立炮轰小鲜肉？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">总结一下靳东的主要黑点：繁体字、诺贝尔数学奖、纯爷们，某编剧的作品中有这么一个桥段，剧中人物捧着一本如何获得诺贝尔数学奖的书，用繁体字配的字幕—本人一纯爷们。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">要说是巧合，恐怕真说不通，毕竟能把这三点集中到一起也是不容易，这不是内涵靳东还能是谁？</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">4黄景瑜截胡严宽？</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/5f6778247ea843da8c3c0373f18959e7\" img_width=\"332\" img_height=\"472\" alt=\"靳东遭编剧内涵？黄景瑜截胡严宽？袁立炮轰小鲜肉？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">严宽的脸真的是上帝用心捏的，演技也合格，但一直不温不火。某剧组已经定了他当男一，临开拍前强行换主演，由黄景瑜担任男主。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">当时和严宽说的是因为相关部门审查不能开拍，却让黄景瑜进组拍戏，这种单方面违约的事儿赔偿了200万才摆平。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">5袁立炮轰小鲜肉？</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/8110e9f54a0041b08e7052e7f16b8fca\" img_width=\"717\" img_height=\"825\" alt=\"靳东遭编剧内涵？黄景瑜截胡严宽？袁立炮轰小鲜肉？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">袁立的公众形象虽然一跌再跌，但做的公益不假，说的一小部分真话也挺在理。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">昨天她发微博吐槽现在鲜肉表演的顶胯，她说这种摸裆动作，几十年前迈克尔杰克逊有过，抄袭而已。这种性暗示动作仿佛在夜店的舞台上，这样的“鲜肉”应该和影视演员区分开来。这样思路就清晰了。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这种舞蹈见仁见智，喜欢的觉得性感又撩，不喜欢的觉得接受困难。</p><p><br/></p>','0','0','0','0','0','0','靳东遭编剧内涵？黄景瑜截胡严宽？袁立炮轰小鲜肉？','0');
INSERT INTO `qb_cms_content1` VALUES ('29','1','9','于正力挺吴谨言？孙楠租房住？骚白332连胜？散打警告黑人八卦？','1','1','65','2','2','0','1548223913','1548247761','1548223913','uploads/images/20190123/1_2019012314113598b89.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">于正力挺吴谨言</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">昨晚，于正通过微博发表长文，力挺吴谨言。先是回应了吴谨言在电视剧皓镧传中母亲被丢到井里那一刻为什么没哭。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">并表示吴谨言相比在《延禧攻略》中已经进步很多。他不在意有人黑吴谨言，但是在意表演被曲解，并呼吁尊重表演这个行业。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">红姐觉得大多数人黑她是因为被爆出耍大牌吧，就比如之前和央视的矛盾。至于演技嘛就见仁见智了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/14b03fa63c1c419da9d2c400c5c6db61\" img_width=\"428\" img_height=\"689\" alt=\"于正力挺吴谨言？孙楠租房住？骚白332连胜？散打警告黑人八卦？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">孙楠租房住</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">孙楠妻子潘蔚近日在采访中透露，三年前她和孙楠为了孩子的教育从北京搬到了徐州居住。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而且月租仅700元。房子是十分普通了，有朋友来做客的时候，都表示太寒酸了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">可是为了孩子好，为啥自己闺女出国留学，人家闺女光就织毛衣背古文呢，emmmm，这里面的小九九红姐是不懂的，别问，真不懂。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/9578c354d7c147b38beb17c3758ef623\" img_width=\"648\" img_height=\"276\" alt=\"于正力挺吴谨言？孙楠租房住？骚白332连胜？散打警告黑人八卦？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">骚白332连胜</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">王者荣耀中骚白的连胜今天上微博热搜了，前段时间刚被触手主播狙击。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">还不到一周时间，又一次332连胜，并且打算申请吉尼斯记录现场挑战。看到这一热搜，网友们有为骚白开心的，也有不少质疑的声音。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">不过一直以来，骚白直播都是不露脸的，而他在微博上也晒出了自己的面具，不知道这场去吉尼斯现场直播的时候骚白会不会摘下面具以真脸示人呢。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8e64f3d4d2024daf86403d893b7ae239\" img_width=\"590\" img_height=\"355\" alt=\"于正力挺吴谨言？孙楠租房住？骚白332连胜？散打警告黑人八卦？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">散打警告黑人八卦</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">大家都知道散打的形象一直是一个传播正能量的主播，之前还有过说要好好孝敬父亲，和去参加农民工返乡活动之类的一系列正能量活动。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">有人夸自然就有人黑。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">昨天晚间散打再次发博怒斥黑人八卦，表态自己不干仗看到黑我的拉黑就行，还说微博黑我的八卦只有四个，一个进去了一个赔款了，还有两个不知死活的被全网拉黑了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这可能就是身正不怕影子斜吧。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/c2fc13746cae414991d205c089acde3c\" img_width=\"567\" img_height=\"371\" alt=\"于正力挺吴谨言？孙楠租房住？骚白332连胜？散打警告黑人八卦？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">云烧锤头鲨</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">云烧最近的瓜是真的多啊，这回直播又被人嘲了，图片高能警告。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">其实吧，红姐觉得嘲颜是不对的，毕竟就事论事，烧姐承认了自己做的那些事，纯粹的福利也没人撕她。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">可是偏偏自己要做又当又立这种，所以也就有人拿这个（锤头鲨，不懂的自己百度）开开玩笑。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">再次警告，现在不看还来得及。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/5e894f7af083474a9249b216925b5215\" img_width=\"690\" img_height=\"1017\" alt=\"于正力挺吴谨言？孙楠租房住？骚白332连胜？散打警告黑人八卦？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p><br/></p>','0','0','0','0','0','0','于正力挺吴谨言？孙楠租房住？骚白332连胜？散打警告黑人八卦？','0');
INSERT INTO `qb_cms_content1` VALUES ('30','1','16','步枪竟然可以那么帅，美国企业让武器成为另类艺术品','1','1','46','2','0','0','1548223983','1548247760','1548223983','uploads/images/20190123/1_201901231412365878f.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">KRG-精准步枪的高级美容师</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/a05e71d23a25423bbbb051a25b5a95cc\" img_width=\"1080\" img_height=\"492\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">武器的美学，是一门独特的机械美学。而在美国有一家企业就是为精准步枪来打造不一样的帅气外表。今天为大家介绍的机构就是步枪高级美学师<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">“美国KRG”</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/1da5498bbdfb4a9886f714db9cd3446d\" img_width=\"263\" img_height=\"101\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/6baedee39eb74ff89e7921b69423b3c7\" img_width=\"1080\" img_height=\"495\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">KRG是一家2005年成立的企业，公司的创始人是一群陆军特种部队士兵。作为专业射手，他们的工作激情使他们深入了解目前步枪改装的优缺点。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/0e88b0495dae44bb9b292cca81c903f9\" img_width=\"1080\" img_height=\"515\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/02b3d2f0e06f452e8bcb46694c017918\" img_width=\"1080\" img_height=\"512\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/4102205ca2474ec38c0ff48bd8643d00\" img_width=\"1080\" img_height=\"494\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">他们认为很多美国射击爱好者对自己的装备都有自己的或多或少的不满意，并且许多产品只是勉强可以接受。虽然有些产品非常好，但确实需要进一部的改进从而获得全新的体验。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">更了解武器-每个人都是高水平射手</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/024d8c48e12f4d7fbb7f9dd5be9bb1e6\" img_width=\"830\" img_height=\"117\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">与其他机构不同，这家单位所有创始成员都有军事背景，并且在军队中也进行了多种武器训练，其中还有一些人是战术教官。KRG的产品设计师一直在努力磨练自己的技能。他们通过自产与其他市面上步枪的各种配件来进行产品的改造。利用人体工程学来打造更加舒适的射击体验。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/f72e64a2713c4ffebf0e6f9ae2d7bdd0\" img_width=\"1080\" img_height=\"490\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/a505d8c546174f278ff5f25e6dc8ec79\" img_width=\"1080\" img_height=\"513\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">KRG的每个人都在为美国民用市场努力。他们相信，如果你努力工作并享受乐趣，那么好事就一定会发生。我们每一位员工都努力工作，我们乐在其中; 我们相信我们已经为市场带来了一些顶级产品，我们将继续努力。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8a23e946a7844b86ac5c9ba0cca578d9\" img_width=\"1080\" img_height=\"490\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/bec8d5fbaa8846c99eb6976fe08ab133\" img_width=\"1080\" img_height=\"517\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/905896bbda2048369389e0d31c424a78\" img_width=\"1080\" img_height=\"716\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/49f38e1c43e942c8ab33e603d3aaa8b8\" img_width=\"1079\" img_height=\"565\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/c472b256b05945f5bc58a222465c674a\" img_width=\"1080\" img_height=\"839\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/a7e5db4129404156862c2f739b9f4051\" img_width=\"1079\" img_height=\"565\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/466d7bbc4388454d8049c53df44a054f\" img_width=\"1080\" img_height=\"608\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/0d233cecd62c4f09a59f75e9b441046c\" img_width=\"1080\" img_height=\"1350\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/6dbd29538a5d4f87afbccf11782f833d\" img_width=\"1080\" img_height=\"810\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/9ee8cd04af364110aed3c003959f197e\" img_width=\"1080\" img_height=\"1350\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/7d2ecc8f9684436ba2ea3c043f5bc341\" img_width=\"1080\" img_height=\"600\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/1f6bee0cc24f43dc8eeff817e44cae99\" img_width=\"1080\" img_height=\"741\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/a0b6d45454f74e0ba866dea04cf9f959\" img_width=\"1080\" img_height=\"1350\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/a84d9d94b1c54a31bb60dd3fb17e4c81\" img_width=\"1080\" img_height=\"917\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/a08ea1f6fbea46058435479cf71398e6\" img_width=\"1080\" img_height=\"1350\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8d052035edf8463d8eb57fb82aba3680\" img_width=\"1080\" img_height=\"595\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/7c3c3e6f0429451ea65ca536bb1b6252\" img_width=\"1080\" img_height=\"810\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/a1fe2e9c09c546da920642f1ec22a763\" img_width=\"930\" img_height=\"488\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1240401c5cf744d7ae95ecdc9ca53843\" img_width=\"1080\" img_height=\"793\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/736f8568100f4c6b8ac0d96a29f19691\" img_width=\"1080\" img_height=\"1080\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/048d04fa525a4f45b4cf9cde8aa95d76\" img_width=\"1080\" img_height=\"910\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/751cf7b7182541d5b0749557aea18156\" img_width=\"1080\" img_height=\"1350\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/2299f79331e942fb8e7f6d82721b34ac\" img_width=\"960\" img_height=\"640\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1b9202ed4207428d84665712a894a7ce\" img_width=\"1080\" img_height=\"729\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/ab1d87b227464d81b5cec8651ef32413\" img_width=\"1080\" img_height=\"1080\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/08120bdb89004465a358f699aa1eb22c\" img_width=\"1080\" img_height=\"1080\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/2528d87d68044f59ac6e6c9c80b30e5b\" img_width=\"1080\" img_height=\"718\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/30130bc7e9e245bea5305adb35fa4198\" img_width=\"1080\" img_height=\"810\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/e47b583b83fa43c29e8138f083001766\" img_width=\"1080\" img_height=\"717\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/854a6f6b93234e15950add043f78f4ec\" img_width=\"1080\" img_height=\"832\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/a554f027d6b443ecaf57b6862f865855\" img_width=\"1080\" img_height=\"1349\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/015847096e94410090753550dec3f4a6\" img_width=\"1080\" img_height=\"717\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/d126ec5017a24cb8bc4592dad72eb5db\" img_width=\"724\" img_height=\"473\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/8dc6c5b65d6b4ed496bc5c18c727bcf2\" img_width=\"1080\" img_height=\"623\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/eea7a0a8a0874e75a3c2eac9bffc0803\" img_width=\"1080\" img_height=\"810\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/54427e17c0754635b499212713e40e11\" img_width=\"1080\" img_height=\"792\" alt=\"步枪竟然可以那么帅，美国企业让武器成为另类艺术品\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p><br/></p>','0','0','0','0','0','0','步枪竟然可以那么帅，美国企业让武器成为另类艺术品','0');
INSERT INTO `qb_cms_content1` VALUES ('31','1','16','月末闲谈美国AAAV两栖突击车的发展','1','1','4','1','0','0','1548224012','1548246695','1548224012','uploads/images/20190123/1_2019012314131932cd1.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">美冷战结束后,美国的全球军事战略发生了根本性转变,美军的作战地区和作战对象变得模糊,军事战略重点由前沿存在遏制苏联的扩张,转变为对世界上出现的危机作出快速反应,迅速将兵力投送到危机地区。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/480ee5becf6d4bcf947e56585b7dbb54\" img_width=\"590\" img_height=\"414\" alt=\"月末闲谈美国AAAV两栖突击车的发展\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">AAAV两栖突击车</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">美国海军陆战队计划耗资76亿美元,用1013辆AANV先进的两栖突击车替换现役的1322辆AAV7A1两栖突击车。AAAV先进的两栖突击车的发展始于80年代中期。后来,美国大量削减军费,砍掉或推迟多项装备研究计划, AAAV却因为能较好地满足美国新的军事战略需要而得到继续发展。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/47a5753f031b45c39d7194f4915d0e7e\" img_width=\"640\" img_height=\"584\" alt=\"月末闲谈美国AAAV两栖突击车的发展\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">AAAV两栖突击车</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">长期以来,由于受装备水平的限制,两栖突击登陆作战通常包括三个阶段:舰上机动、由舰到岸的机动和岸上机动。作战时,突击装备和作战人员由舰船机动到距离海岸4km处登机或下水,在海、空火力掩护下,两栖战车以10km/ h左右的航速向岸边前进,坦克、火炮等重装备则搭乘登陆艇上岸。由于当时现有两栖突击战车水上速度较慢,搭乘登陆艇的重装备要经过换乘、输送和卸载才能突击上陆,结果,由舰到岸投送兵力速度缓慢,容易影响战术的运用并招致重创。这是突击登陆作战的薄弱环节。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">美国海军提出的两栖作战新概一超视距突击登陆强调,突击登陆部队在敌视距外腐舰,向敌淘岸防御薄弱地城发起快速、机动、突然的立体突击登陆,变传统的三阶段两栖突击登陆为只有两个阶段的两栖突击登陆作战,即舰上机动和由舰到岸上目标的作战机动,把由舰到岸的机动变得和岸上机动一样快速,从而把作战机动延伸到海上,使突击登陆行动更突然,更迅速,从而使作战部队在最佳时间和最佳地点登陆并发起岸上攻击。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/e9d0ceb86c9545c09e45f1e5b2abecca\" img_width=\"569\" img_height=\"284\" alt=\"月末闲谈美国AAAV两栖突击车的发展\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">AAAV两栖突击车</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">为了实现超视距突击登陆,美军积极研制V-22型偏转翼飞机和AAAV先进的两栖突击车,进一步发展扫雷能力、舰队防空能力、空中作战能力、精确制导武器打击能力和联合作战CT能力。其中, AAV先进的两栖突击车作为美国海军陆战队由舰到岸输送部队和陆上机动部队的主力战车,将成为突击登陆作战的主力装备。它的水上行驶速度达37km/h-46km/h,可以从离岸40km或更远的舰船上下水,以比现役两栖突击车快得多的速度突击登陆,不仅降低了敌方导弹、飞机、军舰、水雷等对海军舰船的威胁,而且大大提高了两栖突击作战由舰到岸的机动能力,使海军和海军陆战队能不间断地进行舰上机动和由舰到岸的机动,从而更有效地“从海上实施作战机动”。它的陆上行驶能力和越野机动能力与M1坦克相当,甚至更好,它还具有较强的火力、防护能力和载运能力,称得上是世界上最为全能的武器系统之一。它的成功具有划时代的意义。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/a2df1ae69f36476da41a490b5bd9eead\" img_width=\"640\" img_height=\"398\" alt=\"月末闲谈美国AAAV两栖突击车的发展\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">AAAV两栖突击车</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">AAAV先进的两栖突击车的发展采用了一系列新的技术,进行了大量的演示<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">试验</span>,突破了大量的技术难关,总的来说,其发展还算顺利。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1985年,美海军陆战队戴维.泰勒研究中心展开两栖突击车技术的基础性研究,开发可能应用到海军陆战队两栖突击车中的先进部件、系统和技术,并由AAI公司研制了1辆履带式机动性试验平台(ART)配合这项研究。该平台为水陆两用试验车,乘员3人,装320hp的柴油发动机、计算机控制的液压传动系统、水陆两用冷却系统、无人小口径武器站和两个直径304mm的带转向叶片的双级喷水推进器首次试验带状履带和可回缩的液气弹簧悬挂系统,但尚未采用滑行车体的概念,水上速度仅8.04km/h。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/a91f3134173c4f898672737d63f78116\" img_width=\"400\" img_height=\"217\" alt=\"月末闲谈美国AAAV两栖突击车的发展\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">AAAV两栖突击车</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1988年,美海军海上装备部决定发展AAAV先进的两栖突击车,并由AAI公司研制高航速技术演示车(HWSTD),主要验证履带式车辆能否获得37km/h以上的航速,结果获得了51.8km/h的航速。该车是按滑行车体概念设计的履带式两栖试验车,安装了MT883型1609hp的柴油机、液压传动系统、带状履带、可回缩液气弹簧悬挂系统和直径406mm的带转向叶片的高效喷水推进器;采用了能展开/收起的车首滑行板、侧翼铰接滑行板和铰接舰板。陆上行驶时冷却系统为风冷,水上行驶时为水冷。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在此基础上, AAI公司进一步研制出了推进系统试验车(PSD),用于试验履带式两栖车辆能否获得37km/h以上的航速,并完成履带式两栖突击车陆上行驶机动性试验。在1991年的试验中,该车的最大航速超过了34km/h。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/bc16b132779b4b5aaeb3ffcfd5a35b76\" img_width=\"590\" img_height=\"421\" alt=\"月末闲谈美国AAAV两栖突击车的发展\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">AAAV两栖突击车</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">该推进系统试验车已经比较接近后来研制的足尺试验车。它采用了由铝合金和玻璃纤维强化塑料制造的复合材料车体,并附加了一些铝合金装甲块,安装了小型无人武器站;沿用了滑行车体设计方案,采用了可展开/收起的车首滑行板、侧翼铰接滑行板和铰接腿板,采用了可回缩的液气弹簧悬挂系统和带状履带;陆上行驶动力装置为VTA903-1700型柴油机,传动装置为HMPT-500-3型液压机械传动装置;水上行驶时,该柴油机和1台LM120/ T700/ CT7型涡轮发动机通过液压传动装置同时向喷水推进器提供动力。喷水推进系统包括2个直径305mm的两极喷水推进器(低速行驶时用)和4个直径406mm的三级喷水推进器(高速行驶时用)。还装了火灾探测与灭火系统、电/液驱动舱底泵、无线电台、车内通话系统、车载GPS导航系统、测深仪和KVH磁罗盘。该车可以自动转换行驶状态</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">经过几轮研究试验后,1994年,联合防务公司(联合AAI公司)和GDLS公司分别研制出了AAAV足尺机动性试验平台。该试验平台采用了滑行车体方案和以前研究试验过的各项技术。水上行驶试验时,由2400hp ~2600hp MT883型柴油机驱动;陆上试验时,采用CV-8型柴油机和X-300传动装置。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/dfic-imagehandler/7238b1fa-528f-4442-82e0-36d4851a4176\" img_width=\"512\" img_height=\"340\" alt=\"月末闲谈美国AAAV两栖突击车的发展\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">AAAV两栖突击车</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">经过试验和评估, 1996年底,选中GDLS公司进行下一步的演示/验证阶段的工作。这个阶段的工作将持续到2001年。以后,还将进行样车制造、样车试验、生产工程研究、生产和测试设施建设以及部队使用试验等工作。最后,正式生产，装备部队。</p><p><br/></p>','0','0','0','0','0','0','月末闲谈美国AAAV两栖突击车的发展','0');
INSERT INTO `qb_cms_content1` VALUES ('32','1','12','10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴','1','1','4','1','0','0','1548224046','1548246697','1548224046','uploads/images/20190123/1_2019012314135199e18.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">现在汽车已经很普及，人们对车就像孩子一样呵护，两三天就会去洗一次。但是世界上名贵的豪车，大家可能很少见到，基本上都是在汽车展会上才能看到，今天小编就带大家去看看陷入泥潭中的那些豪车尴尬的样子，一起去看看。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">1、兰博基尼Huracan被困在雪中</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/7561a877cae64beab598981ebf93f070\" img_width=\"1107\" img_height=\"623\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">一位汽车爱好者将他的兰博基尼Huracan带到了雪域和山区，然后就发生了这样的事情。他的车在雪地里打滑并被困在路上。最后在朋友的帮助下这辆车终于被解救。这次意外也让他吸取了教训：Lambos不适合在雪地里开。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">2、雷克萨斯陷入混凝土</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/b538cf40ba5346889a1ca21024ab02b1\" img_width=\"1107\" img_height=\"805\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">驾驶汽车的人是美国的一名女律师。我们不确定她在想什么，她将她的车开到了新拌的混凝土上。因为混凝土还没凝固，造成她的车无法开出来。她只能坐在车里等待救援。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">3、宾利被困在水中</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/bd380a3dd2484d728fca17dc97dd1b75\" img_width=\"1107\" img_height=\"623\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">大多数人会考虑将车停在安全的地方，而不是试图与条件作斗争。这名男子试图驾驶他昂贵的宾利过洪水，<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">这是</span>一个糟糕的主意，导致汽车在洪水区域几乎完全下沉。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">4、奥迪A5卷入水里</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/407ed5ea03e946279cf4ef34b9581e0d\" img_width=\"1107\" img_height=\"709\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">为了拍照三名司机将他们的汽车开到了海滩，在高潮时不知不觉，造成91000英镑的损失，车辆被淹没在海滩上。其它2辆车已经卷入水里，只剩下岸上的奥迪A5.</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">5、兰博基尼被困在羊群中</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/7534947055074d1a86721fc00cb02283\" img_width=\"1107\" img_height=\"740\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">我们不知道这位兰博基尼车主在那一刻是什么心情。这就像一场噩梦一样。但在欧洲的一些地方法律规定司机必须停下来等待动物完全通过。看来这位兰博车主需要等待很长时间，而且车体可能被划损。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">6、保时捷陷入泥潭</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/b10e96efbbbf4b84970ea1b225a83dd4\" img_width=\"1107\" img_height=\"754\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">它发生在著名足球运动员安德烈·威斯特姆身上。他指责水坑欺骗了他，看起来很浅，结果开过去之后就陷入了进去。最后朋友开了一辆路虎来救他，他爬出窗户才进入大路虎。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">7、特斯拉被困在沙子里</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/9d04a533fe8f4c249cd6c2e148b0e8fc\" img_width=\"1107\" img_height=\"623\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">车主把他的特斯拉带到了海滩然后上了沙子。结果是它无法被推出，最后只能用拖车拖回。看看特斯拉后面那个皮卡上的轮胎以及其他庞大的白色SUV。很明显特斯拉在这种环境里无法跟它们相比。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">8、兰博基尼不适合草地</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/45a34f869b9a49ac841a35788a80aaeb\" img_width=\"1107\" img_height=\"672\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这位新兰博车主可能有点过于自信，将车停在公园草地里，汽车陷了进去出不来了。值得庆幸的是，一个旁观者来帮助他，经过一个多小时后才让汽车开了出去。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">9、兰博基尼不适合越野</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/23737a66bd3c4ccbb8305187bf3fb188\" img_width=\"1107\" img_height=\"623\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">把兰博基尼开到荒郊野外当越野车来使用，即使是土豪也不会这么干，看着车辆的样子真的让人感到心疼。我们希望Lambo车主吸取教训，下次不要这样糟蹋它。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">10、沾满泥巴的宾利</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/58da392bde5a443c836986875d306d5f\" img_width=\"1107\" img_height=\"531\" alt=\"10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这辆车不仅被泥巴覆盖，而且车主自己还在泥地里滚来滚去。这位车主今天可能心情比较愉悦，可能第二天一旦他精神恢复，他可能会为自己的做法感到难过。</p><p><br/></p>','0','0','0','0','0','0','10辆被车主糟蹋的豪车，保时捷陷入泥潭，宾利沾满泥巴','0');
INSERT INTO `qb_cms_content1` VALUES ('33','1','12','修车师傅不建议买车时选这三种颜色，车漆不仅贵而且很难补','1','1','57','2','2','0','1548224082','1548247757','1548224082','uploads/images/20190123/1_20190123141431bbf31.jpeg','<h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">修车师傅不建议买车时选这三种颜色，车漆不仅贵而且很难补</span></h1><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">相信很多朋友在买车的时候一定会纠结买什么颜色的车好。车企为了满足消费者追求个性的需求，一款车上市的时候都会推出七八种颜色，更是让人不知道该怎么选择。新手司机买车后上路，难免会出现磕磕碰碰，补漆是难免的事情。修了厂老师傅总结的经验：这三种颜色的车千万别买，车漆不仅补起来贵，还特别难补。下面就为大家具体解析一下。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/94cb91a4e64b4a759be71d6b61992afe\" img_width=\"558\" img_height=\"426\" alt=\"修车师傅不建议买车时选这三种颜色，车漆不仅贵而且很难补\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">金属白：很多人都觉得买白色的车事故率比较低，而且白色车漆也没有那么贵。但事实上并不是所有白色车漆都那么便宜，有的车漆制造工艺比较复杂，因此，一旦发生刮蹭需要修补的时候就很让人头疼。金属白制造工艺比较复杂，所以非常考验补漆师傅的功底，一旦这种金属漆修补过后，明眼人一眼就能看出来，除非是送到原厂去修补，只有这样才能不存在色差。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/ec2a0092f26d4b0595a37a7d78c7d616\" img_width=\"640\" img_height=\"480\" alt=\"修车师傅不建议买车时选这三种颜色，车漆不仅贵而且很难补\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">珠光漆：珠光漆也就是人们所说的云母漆，喷涂了珠光漆的车身的确是非常的好看。这种油漆是将云母颜料均匀混合到基层颜料当中，制作工艺非常的复杂。所以当出现刮擦事故，去维修店修补的时候是补不出这种漆面效果的。补完之后会有色差，看起来也是相当难看。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/00f69f1bd7b24634b0d7ec9de0ac9cf9\" img_width=\"593\" img_height=\"416\" alt=\"修车师傅不建议买车时选这三种颜色，车漆不仅贵而且很难补\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">魂动红：不得不说，这个魂动红确实好看到骨子里了。有这样的效果是因为马自达有特殊的油漆，马自达在有色漆和清漆的中间还加了一层透光层，这是这种漆能如此鲜艳的根本原因，这让在不同的角度和不同的光线下，都有不同的视觉体验。不过如此一来，当你想补漆时，难度就成几何增找了，除非是回原厂维修，一般的维修店根本拿他没办法。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/40d0afdcda4447c28bea57a4fb65de59\" img_width=\"520\" img_height=\"360\" alt=\"修车师傅不建议买车时选这三种颜色，车漆不仅贵而且很难补\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">总之，这三种车漆，毫无疑问看起来肯定会更加的舒服，但日常保养起来也十分的麻烦，因此大家在选购时，不要被销售人员忽悠就购买了。要根据自己的真实喜好来选择。</p><p><br/></p>','0','0','0','0','0','0','修车师傅不建议买车时选这三种颜色，车漆不仅贵而且很难补','0');
INSERT INTO `qb_cms_content1` VALUES ('34','1','11','历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局','1','1','53','2','0','0','1548224119','1548247756','1548224119','uploads/images/20190123/1_20190123141505d2c5c.jpeg','<blockquote style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 1em 0px; padding: 12px 10px; position: relative; line-height: 1.5; color: rgb(153, 153, 153); background: rgb(244, 245, 246); border: 1px solid rgb(232, 232, 232); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal;\"><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px;\">2019斯诺克冠军联赛第五小组收官，大卫·吉尔伯特作为补位选手不仅循环赛打出5胜1负战绩，还在最后一场轰出单杆147，也就成为官方记录第147杆147的主人。塞尔比在小组决赛3-0轻松横扫霍金斯，成为第五个进入冠军组的球员。另外，丁俊晖将加入第七小组的比赛争夺。</p></blockquote><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8158a2009fb14c5da89ba012e748551b\" img_width=\"540\" img_height=\"304\" alt=\"历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">首个比赛日强势连赢4场的大卫·吉尔伯特，在这一天更加风光，先是击败卡特为自己再填1胜，接下来在挑战马奎尔的比赛中，吉尔伯特虽然1-3告负，但唯一赢下的第2局中，他却打出单杆147满分，就此，球迷期盼已久的历史第147杆147也就锁定了它的主人。这是吉尔伯特个人生涯第二杆147，巧合的是上一次也是在冠军联赛中，2015年他在与肖国栋的比赛中打出过满分杆。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/05f8b979b2944495bcb0074a73ae3840\" img_width=\"1264\" img_height=\"916\" alt=\"历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此外，冠军联赛也延续了“147高发区”的传统，从14年的墨菲、15年的霍金斯和吉尔伯特、16年的奥布莱恩、17年的马克·戴维斯（一届比赛两杆147）、18年的汉密尔顿和布雷切尔，加上今年的吉尔伯特，连续六年不间断，累计九杆。比赛压力不大、球员心态放松，的确让147来得更加频繁。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">虽然无论从吉尔伯特的名气、还是冠军联赛的量级，以及仅有500英镑的小组单杆最高奖金来看，这杆极重要的147仿佛都来得都有些“不合时宜”。然而对于吉尔伯特本人来说，这样的命运却非常美妙。原本吉尔伯特应该在第六小组加入战局，但由于布雷切尔的退赛，吉尔伯特临时补进到第五组，试想如果没有这样的命运，也就遇不到这一场比赛、这一局的球型，更拿不到这项会被人们铭记非常久的里程碑。5胜1负的吉尔伯特同时也成为循环赛排名榜首的球员。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/e0cee8009b1e4d598966d6b281e41c47\" img_width=\"1280\" img_height=\"720\" alt=\"历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">前一日仅取得1胜2负的塞尔比，来到这个比赛日又是先输一阵，2-3不敌马奎尔，好在塞尔比及时找回状态，在接下来的比赛中，他先是3-0吊打乔·佩里，并打出一杆143和一杆113，紧接着，又在与麦克吉尔的生死战中3-1胜出，并再填一杆139和一杆103，六场小组赛战罢，3胜3负，六度破百。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">霍金斯也同样完成自我救赎，同样在上来先1-3败给对手麦克吉尔后，霍金斯奋起直追，先是一杆破百、3-2顽强的啃下马奎尔，再用小组的炮灰乔·佩里作踏板，保住了跻身小组半决赛的资格。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/b299c80fa9724dc989b5f35e933fa2e4\" img_width=\"768\" img_height=\"576\" alt=\"历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">另一个3胜3负的卡特则因为净胜局不敌塞尔比和霍金斯，排名第五，没资格角逐小组冠军，但保住了晋级下一组的机会。4胜2负的马奎尔以第二名跻身单败赛。分别只赢了2场和1场的麦克吉尔、佩里遭到淘汰。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">循环赛第二日完整比赛结果：</span></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">麦克吉尔3-1霍金斯、马奎尔3-2塞尔比</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">吉尔伯特3-1卡特、塞尔比3-0佩里</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">霍金斯3-2马奎尔、卡特3-2麦克吉尔</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">霍金斯3-1佩里、马奎尔3-1吉尔伯特（Break 147）</p><hr style=\"-webkit-tap-highlight-color: transparent; box-sizing: content-box; height: 4px; overflow: visible; margin: 40px auto; padding: 0px; width: 64px; background: rgb(237, 64, 64); outline: none; border: none; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal;\"/><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">进入到小组半决赛，吉尔伯特的神奇不再。面对巴里·霍金斯被打的几乎没有还手之力，霍金斯前两局便接连打出单杆90分和77分，赢下两局仅用不到半小时。第3局“土豆哥”先上手打下46分后，走位不佳转防守，两人经过一番僵持后，霍金斯打进关键贴库中远台，并一举拿下胜利。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/b38c51044fbf486cbc2bd8d055e4e28c\" img_width=\"1050\" img_height=\"590\" alt=\"历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">另一场半决赛，马奎尔再度与塞尔比碰面。此前大师赛的首轮，马奎尔便做了塞尔比单场三破百、两杆90+壮举的背景。转战冠军联赛，在早先循环赛刚刚以3-2赢下塞尔比的马奎尔，半决赛上来就一杆124先声夺人，不过很快塞尔比在第2局用一杆98分回敬对手。第三局马奎尔再度取胜，然而，稳住阵脚的塞尔比掌控了剩下的两局，最终3-2赢得胜利。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">两位从第三小组便开始征战的球员最终相遇在本组决赛。首局塞尔比一杆82分利落的拿下，第二局霍金斯没有把握好先上手的机会，被塞尔比68-31完成超分，虽然此后塞尔比白球摔袋让霍师傅看到希望，然而通过一杆精准翻袋打进红球，塞尔比还是顺利的将大比分改写成2-0。第3局塞尔比一鼓作气，单杆97分帮助他最终横扫霍金斯。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/01712dbd78824884b2821ca254807a60\" img_width=\"590\" img_height=\"350\" alt=\"历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如此，塞尔比成为本小组最终的冠军，将与前四组已经出现的罗伯逊、利索夫斯基、特鲁姆普和宾汉姆在冠军组中会面。第五小组比赛共打出19杆破百，塞尔比和马奎尔各有6杆。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">北京时间1月23晚间，第六小组无缝衔接，霍金斯、马奎尔、吉尔伯特、卡特四人将与肖国栋、马丁·古尔德和从第七组补上来的马克·戴维斯，共同组成这一组的阵容。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/9086c30a48fd4ea2acc5493018bc3f09\" img_width=\"976\" img_height=\"548\" alt=\"历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此外，由于布雷切尔退赛，赛事需要补进一名新球员到第七小组。而这个人选最终被确定为中国选手丁俊晖。时隔五年之后，丁俊晖再次选择再次接受冠军联赛的邀请，相信本赛季成绩平平的丁俊晖，也是希望能够以赛代练，更多的参与到比赛竞争中以保持状态的稳定。丁俊晖曾在2012年冠军联赛决赛击败特鲁姆普成为最后赢家。不过第七小组的赛事要等到今年3月才开战，同组的新人还有希金斯和迈克尔·怀特。</p><p><br/></p>','0','0','0','0','0','0','历史时刻！147杆147诞生！塞尔比获小组冠军 丁俊晖将加入战局','0');
INSERT INTO `qb_cms_content1` VALUES ('35','1','11','三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知','1','1','1','1','0','0','1548224155','0','1548224155','uploads/images/20190123/1_201901231415403cc18.jpeg','<p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在2013年，詹姆斯得到第二个冠军之前，乔丹曾提到过科比与詹姆斯谁更好的问题。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/3873c2c67bf64df1bebdcdb5e3ddbb82\" img_width=\"641\" img_height=\"441\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“如果你必须在这两者之间做出选择，那将是一个艰难的选择，但每次我看到它的时候，都是五（冠军）比一。”乔丹说。“<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">这并不是说詹姆斯不会得到五个冠军，他可能会得到更多，但是目前五比一大。</span>”</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/e2b3a4ab5bc94c1e97dff2ea6817f9e4\" img_width=\"641\" img_height=\"535\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2017年的时候，在詹姆斯已经得到三个冠军之后，乔丹再次遇到了这个问题。“我会把勒布朗排在科比之前吗？不”乔丹说。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">“这是一个关于五大于三的问题。”</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/6893c5eb08a9493e8c70908daa4cefc5\" img_width=\"1080\" img_height=\"608\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">几乎可以预见的是，就算詹姆斯拿到第四个冠军，到时候仍然是关于五大于四的问题罢了。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这种单纯的比较戒指而得出的结论其实有一点有失偏颇，但是我们无疑能看得出——乔丹更喜欢科比。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/e3b026fa0ac24183b06c5775862055d8\" img_width=\"641\" img_height=\"361\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">很多人都喜欢和自己相似的后辈，就像那种“我喜欢你小子，像我年轻的时候”的情结。所以你才能看到科比不止一次的表达自己对威少的喜爱。所以，你也能看到乔丹不止一次的在公开媒体上力挺科比。但是詹姆斯呢？<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">抱歉，他和乔丹科比的比赛的方式不论是技术特点还是团队体系甚至在个人性格上——都几乎完全不一样。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">以技术来说，乔丹科比靠个人进攻带动球队，而詹姆斯则是靠带动球队来发起进攻。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/da2ab6f851e243dbbe24c3c4b533d38b\" img_width=\"641\" img_height=\"435\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">说到具体的层面上，乔丹科比用突出的火力打球，詹姆斯用更全面的能力“大包大揽”。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">然而，在历史TOP的球员当中，乔丹不是大包大揽，科比不是大包大揽，伯德不是大包大揽，作为内线的大梦邓肯奥尼尔拉塞尔等人更不是。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/2f3ef57ac8974be4a5ede95647813f1c\" img_width=\"1080\" img_height=\"720\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">像詹姆斯这种一个持球人便把所有进攻都掌握在手心里的球员，几乎是史上独树一帜的存在。</span>能背身能突破，后来又开发出了远投。不止如此，在防守端，他能防巅峰罗斯迅疾如风的突破， 能防隆多伊戈达拉这样的快攻掌控者，在内线能顶住邓肯、加内特这种传奇内线的轰炸，再加上顶级的视野和传球，靠他一个人便能支撑起球队的体系，将教练的作用完全弱化了。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">可以说，詹姆斯的“詹式体系”已经是这种打法的极致了，而这更体现了詹姆斯与历代篮球名宿相比起来的独一无二。</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/28ad5929ba324811bb0a430044e7e7d5\" img_width=\"641\" img_height=\"427\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">更明显的是——“詹式体系”与乔丹科比所打的三角进攻呈现可怕的“镜像状”。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">以下将会将他们的特点做一个鲜明的对比：</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">1.球员的全面性-在最完美的三角进攻理念中，所有5个位置都是可以互换的。</span>人人都可以传，人人都可以切，人人都可以投，人人都可以落低位。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">显然詹姆斯的体系并不需要他们具备这些能力，詹姆斯需要一个拉开空间的内线（波什，乐福），需要几个3D球员（阿伦，科沃尔，巴蒂尔）和一个攻坚手（欧文，韦德）。欧文韦德这边还好，他们会经常客串几种不同角色。而其余的球员，大部分都在詹姆斯体系中被转换成了功能性球员。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/541fab952295485292e1fc30636dcbf8\" img_width=\"641\" img_height=\"365\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">2.连续性进攻-三角形进攻可以连续进行，直到出现一个开放的得分机会。</span>套路极多的三角进攻如果没有得到一个好的机会，那么他们就要即兴发挥，继续创造机会。这与詹姆斯的体系完全不同，对于大部分的詹姆斯队友来说，他们只要耐心等待詹姆斯为他们创造的机会就可以了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/80433b61b5b14be5bd1b11f44723617b\" img_width=\"641\" img_height=\"427\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">3.篮球智商-由于三角进攻的执行球员需要阅读整个进攻控球过程中的防守信息，并根据球场上的其他球员做出决定，需要他们拥有很高的篮球智商</span>。但是，詹姆斯的队友就不需要那么高的篮球智商，他们在场上要做的事情很简单，也很单一。没有全面的篮球技巧是很难去执行三角进攻的，比如JR这种球员不适合三角进攻却可以在詹姆斯身边发挥他的一招鲜。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1eb1273d3c7b422f9f0666fb75e97477\" img_width=\"641\" img_height=\"426\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">4.全民参与-三角进攻涉及到所有球员的参与，这里面最重要的一点是——三角进攻不允许任何一个球员在一个进攻回合的大部分时间内主宰篮球。</span>篮球必须传递出去，所有的球员在任何时候都参与进攻，无论他们手中没有持球。而詹姆斯体系则是永远需要篮球在詹姆斯的手里。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/14d348f677cd4d47b6c8c9547ce24aff\" img_width=\"300\" img_height=\"281\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">依然是这张最经典的“边线三角”进攻落位，五个人各司其职又随时做好准备做好角色的切换：</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">以科比时期的湖人为例：</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1.corner 底角射手拉开空间(阿里扎，阿泰)</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2.post 低位核心处理球(科比加索尔)</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3.trigger 发起三角进攻的人，指挥落位，喂球(费舍尔)</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">4.trail 伺机而动的外线空切或投射接球三分(阿里扎阿泰)</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">5.opposite 低位之外的弱侧内线，有能力胜任任何角色(奥多姆)</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">巨星有的时候要坚决落位单打，有的时候要果断分球，有的时候要通过自己的牵制力走位吸引对手注意力让队友得到机会。整支球队要围绕着这位球星紧密配合，最大化球星的威力而不是看热闹。</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/d1d5744de8f34665b5b9b0f7f2ea3401\" img_width=\"641\" img_height=\"459\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">所以说，而詹姆斯的体系篮球，看似很团队，其实很个人。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而乔科的三角进攻篮球，看似很个人，其实又很团队。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">因为通常大家都会说三角进攻是巨星篮球，这并没什么问题，他需要能在低位单打取分并会分球的巨星。但是辩证来看，三角进攻也是更团队的打法，甚至在当年他提出的全员都能够阅读比赛每人都能处理球的理念是有现代篮球的影子的。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/585de68ad72d4e0ebd26be8df760e64c\" img_width=\"641\" img_height=\"465\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">而且，作为现代篮球的代表性球队，当我们提起勇士三分狂潮的时候其实勇士却也还在把篮球向它最初的概念去靠拢</span>——注重团队，注重分享球，注重球队的整体进攻。就拿勇士所使用的战术体系来说，既有复古的三角进攻，也有经过水花杜兰特优化过的挡拆，甚至五号位提到罚球线上的策应还有普林斯顿的影子，可以说是集各种战术于一体的大成者。为了打战术，勇士主帅科尔甚至还牺牲了一部分库里的巨星球。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">因此，从篮球理念上来讲，詹式篮球和传统篮球都是处于对立面的。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/c3b6c5e6151e46e1ac44951623fd26a9\" img_width=\"641\" img_height=\"401\" alt=\"三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">说了这些，我们似乎能在一定程度上理解，为什么乔丹会选择科比。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">这无关于二人谁真的更好，更是出于一种惺惺相惜。</span></p><p><br/></p>','0','0','0','0','0','0','三角进攻与詹式体系有多大差别？看乔丹对科比詹皇的态度便知','0');
INSERT INTO `qb_cms_content1` VALUES ('36','1','11','  姚明为了周琦的未来操碎了心：不惜动用在美国私人关系帮助周琦','1','1','4','1','0','0','1548224184','0','1548224184','uploads/images/20190123/1_20190123141614238b6.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自从去年12月姚明的老东家休斯顿火箭宣布裁掉中国篮球运动员周琦后，国内关心周琦的球迷也是顿感失落。目前唯一在NBA的边缘球员都被裁掉了，中国球迷心里又少了一块可以期待的希望。自从姚明从NBA退役后，NBA能给中国球迷带来的欢乐是少之又少了。虽然国内媒体不断传出NBA有多支球队对周琦感兴趣，不过随着周琦回到国内，中国的篮球球迷心顿时凉了一截。中国球迷对于周琦是恨铁不成钢，那是相当希望周琦能继姚明之后在美国打出一片未来。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/dfic-imagehandler/9ab8f75d-8ed3-4479-8d67-59dbafc076fe\" img_width=\"1200\" img_height=\"877\" alt=\"姚明为了周琦的未来操碎了心：不惜动用在美国私人关系帮助周琦\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">周琦</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">随着周琦正式回到国内，也是引起了国内CBA俱乐部的一阵轰动。媒体朋友更是纷纷猜测周琦回到中国后会加盟到哪支CBA俱乐部。毕竟周琦虽然在美国打不出来，但是面对CBA俱乐部，周琦的能力还是能排在国内球员前五。周琦能加盟，意味着该俱乐部能在本赛季季后赛的竞争力提升不止一个档次。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/dfic-imagehandler/31435fe6-c6b2-4bc9-a705-6a5512bce04b\" img_width=\"1200\" img_height=\"876\" alt=\"姚明为了周琦的未来操碎了心：不惜动用在美国私人关系帮助周琦\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">姚主席</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">就在媒体纷纷报道周琦即将加盟到北方某个俱乐部的时候，中国篮协主席姚明一番话让CBA的其他俱乐部放下了心。姚明明确表示：根据CBA的规则，周琦在本赛季无法代表任何一支俱乐部出战也没法签约。虽然前有易建联半路从美国回来中途加盟广东的例子，不过这一次姚明拒绝了特事特例的发生。毕竟，要姚明上任篮协主席后作出了CBA的改革，CBA的职业操作也变得更加的规范。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/dfic-imagehandler/c0f0e1f6-df03-44ec-8ad9-a9433bb0e83c\" img_width=\"1200\" img_height=\"860\" alt=\"姚明为了周琦的未来操碎了心：不惜动用在美国私人关系帮助周琦\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">姚明</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">对此，有不少关心周琦的球迷炮轰姚明：为什么不能够为他破例一次呢，毕竟周琦现在最宝贵的就是时间和比赛经验，姚明的举动太过于无情。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">那么姚明真的是不顾周琦的个人未来而为了个人官途命运吗？非也，姚明要对CBA和中国篮球负责。更希望周琦不要轻易放弃到最高的篮球殿堂打拼的希望。对此，姚明也是不惜动用了个人在美国8年积下的广泛人脉为周琦铺路。姚明联系到了在美国的好友奥尼尔，奥尼尔本人在节目采访的时候，也亲自说明了一切。他表示：周琦现在的状态非常的好，如果有哪支球队有意向，可以联系他本人。一句话虽然很简单，却表明了自己的立场，那就是周琦是我推荐的，我相信他。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/dfic-imagehandler/fa6bb37b-d360-43a4-9d5f-cd46c7a1e11b\" img_width=\"688\" img_height=\"1200\" alt=\"姚明为了周琦的未来操碎了心：不惜动用在美国私人关系帮助周琦\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\">奥尼尔</p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">根据奥尼尔透露，姚明是亲自联系到了他跟他说：姚明让我帮一下他的小兄弟，他说周琦是一名很好很优秀的球员。希望我一定要帮帮他，大家都知道我和大姚的关系是非常好的，所以我一定会尽快的帮助周琦找到一个适合的球队，让他尽早打得球。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">可见，姚明对中国篮球的未来还是付出了相当多的。</p><p><br/></p>','0','0','0','0','0','0','  姚明为了周琦的未来操碎了心：不惜动用在美国私人关系帮助周琦','0');
INSERT INTO `qb_cms_content1` VALUES ('37','1','10','百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市','1','1','5','1','1','0','1548224229','1548246700','1548224229','uploads/images/20190123/1_201901231416534828a.jpeg','<h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">猫眼娱乐拟于2月4日挂牌港交所，每股最高发行价20.4港元，</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/4413fb7d861d45af929a1739300be438\" img_width=\"1600\" img_height=\"1066\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月23日消息，猫眼娱乐发布公告称，拟在香港IPO发售1.32亿股，其中香港发售1323.78万股，国际发售1.19亿股，每股最高发行价20.4港元，拟于2月4日挂牌交易。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">猫眼娱乐于2013年推出APP，2017年9月与微影时代合并成立新公司“猫眼微影”。在股东方面，腾讯持股16.27%，美团点评持股8.56%。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此前，1月2日，猫眼娱乐更新招股书显示，2018年前三季度，猫眼实现营业收入30.62亿元，同比增长99.6%，现场娱乐票务总交易额7.74亿元。前三季度猫眼净亏损为1.44亿元，2017年同期为1.521亿元。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">百度被批“沦落为自家站内搜索”，股价大跌6.4%</h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/b5cd22bc89d8435db585635ba2b61322\" img_width=\"642\" img_height=\"438\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">日前，一篇题为《搜索引擎百度已死》的文章在网上热传，文章称，近半年内使用百度会发现，你在第一页看到的搜索结果，基本上有一半以上会指向百度自家产品，尤其频繁出现的是“百家号”。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">文章指出，百家号充斥着大量营销和质量低劣的内容，也导致百度搜索结果的内容质量大幅下滑。文章点评表示，百度已经可以改名为“百家号站内搜索”了。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此外，花旗发布投资研究报告，将百度目标股价从262美元调低至205美元，并将百度列入“30天负面催化观察”名单。分析师认为，百度2018财年第四季度业绩和2019财年第一季度业绩预期存在一定的风险，尤其是第一季度的销售额和利润率预期。周二美股收盘，百度报收160.39美元，较前一交易日大跌6.4%，市值约559亿美元。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">台湾研究机构报告：华为将取代苹果成<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">为全球第二大智能手机制造商</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/bc36779b389949d28a48d0f5ba5340ce\" img_width=\"1358\" img_height=\"805\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">据台媒《中时电子报》21日报道，总部位于台湾的全球市场研究机构TrendForce近日发布英文报告预测，2019年，华为将取代苹果，其智能手机销量位列全球第二。而三星预计将以20%的智能手机占有率位列世界第一。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">预测报告称，2018年华为凭借多样的产品类型以及自主研发的芯片产品，其生产量增加了30%。而在此前曾由苹果主导的中国市场，华为的份额也正在不断增加。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而苹果在2018年的表现则不算乐观。该机构认为，华为在2019年将继续保持它在中国智能手机市场的地位，2019年，苹果将继续面临被在智能手机市场被替代的风险，而它在中国市场的销售量也将下降。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">科大讯飞回应裁员传闻：系正常末位淘汰 同步在招聘</span></h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1070ddbd34c44543ba6ac09e92f2e5e8\" img_width=\"2000\" img_height=\"1133\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">近日，有消息爆料称，科大讯飞准备优化30%的正式员工，并要求员工半天签字走人。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">针对此事，科大讯飞发布说明回应称，相关报道不实，系照常进行年末绩效考评及末位淘汰工作，表示在遵守劳动法规及相关制度的前提下，也同步为被优化员工提供转岗等人性化选项。科大<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">讯飞</span>表示，2019年公司整体人数将比2018年稳中略升，目前也正在同步开展招聘工作。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">刚刚过去的2018年，科大<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">讯飞</span>过得并不如意。2018年9月20日，科大<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">讯飞</span>在一场国际会议上被质疑同声翻译造假，指其直接照搬人工同传翻译。此事引起轩然大波，当时科大回应称，公司不存在造假的情况，其主要为主办方提供两种翻译方案。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">高通炮轰苹果：通过诉讼打击高通及整个安卓生态系统</span></h1><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月22日下午，高通公司高级副总裁马克•斯奈德（Mark Snyder）接受了AI财经社的电话专访，他言辞激烈地批评了苹果的“阴谋”。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">高通与苹果的这次纠纷源于FTC（美国联邦贸易委员会）决定对高通发起反垄断诉讼。在这场诉讼中，以苹果为代表的手机厂商给法庭提供证据，证明高通在使用不公平竞争的措施来维持其在手机芯片市场的垄断地位，希望改变高通的强制授权模式和按整机收专利费的做法。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">马克•斯奈德表示，“苹果公司希望利用诉讼达到打击高通的目的，特别是打击高通所支持的整个安卓生态系统，包括中国安卓手机厂商。”斯奈德透露，这个案件将于美国时间1月29日审结。“如果裁决结果对高通不利，我们很大可能会进行上诉。”</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">淘宝网发布“2018年度数据报告”：女性用户每天打开10次</h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/05d0b08a0a1042b79ff7c870af046e54\" img_width=\"1280\" img_height=\"960\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月22日消息，淘宝网发布“2018年度数据报告”，报告显示平均每个月有超过6亿名用户活跃在淘宝上，其中女性用户每天打开10次，男性用户打开7次。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">国人逛淘宝的高峰期集中在中午12点和晚上9点两个时段，饭后睡前更爱逛淘宝。每周三也是淘宝的成交流量高峰时段，是每星期中平均登陆人数和完成购物车结算最多的一天。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">数据显示，90后是淘宝平均成交额最高的用户群体，其中女性用户搜索最热门的是“零食”，男用户搜索最多的是“鞋类”。70后、80后女性最关注的是“童装”，其次是“女装”，这个年龄层的男用户对鞋、牛仔裤等尤为关注。60后女性最爱搜索“帽子”，60后男性对“手机”最偏好。00后女孩搜得最多的是“口红”，男孩是“潮”。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/a1e0dbb59cfe4b60b4b2348ee204c161\" img_width=\"246\" img_height=\"56\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><h1 class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">华为胡厚崑：华为已在超过10个国家部署5G网络，预计5G手机6月上市</h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/27fa27469c72435b87e4547aa6e7dbf4\" img_width=\"1000\" img_height=\"817\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月22日，华为轮值CEO胡厚崑在瑞士达沃斯论坛上表示，5G技术已蓄势待发。“今年对技术来说可能是重要的一年，因为很多技术已经发展到临界点。”</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">胡厚崑透露，华为已在超过10个国家部署5G网络，并计划未来12月再进入20个国家。他预测，5G智能手机将在今年6月登陆市场。“我非常确信，当明年我们再来开冬季达沃斯年会时，你们中很多人将用上5G智能手机。”</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此前，华为创始人任正非近日接受媒体采访时称，“世界上做5G的厂家就那么几家，做微波的厂家也不多。能够把5G基站和最先进的微波技术结合起来，世界上只有华为一家能做到。”</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/ee982d9fe9e546f5969eb048993aa589\" img_width=\"246\" img_height=\"56\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在线教育掌门1对1完成3.5亿美元E-1轮融资</h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/3527febd1a39476887ff0e452d8d047b\" img_width=\"1219\" img_height=\"700\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">据36氪报道，K12一对一在线教育机构掌门1对1已经完成3.5亿美元的E-1轮融资，投资方包括华人文化产业基金、中国国际金融有限公司旗下中金甲子基金等多家机构。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">掌门1对1于2014年从线下转型做线上教育业务，为4-18岁中小学生提供在线一对一定制化教学服务；2016年，掌门1对1在内部孵化了三人小班课和十人大班课；2018年11月，掌门发布了旗下掌门少儿和掌门陪练两项业务，开始建立青少年“全科辅导+素质教育”学习体系。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">公开数据显示，掌门1对1目前的注册学员数超过一千万，覆盖全国600多个省市县，学员续费率超过80%，教研人员超过1万人。此前，掌门1对1曾于2017年12月获得由华平和元生资本共同投资的1.2亿美元D轮融资。</p><h1 style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-size: 24px; margin: 36px 0px 22px; padding: 0px; line-height: 32px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">斥资150亿美元，传沃尔玛、谷歌等或有意收购eBay商城业务</h1><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/d1a83c8ce5764851bcdf48fed8480650\" img_width=\"1920\" img_height=\"1080\" alt=\"百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月23日消息，据消息人士透露，对冲基金Elliott Management认为，如果eBay剥离StubHub和eBay Classifieds Group，沃尔玛、谷歌或私募投资公司可能对收购其商城业务感兴趣。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">eBay创办于1995年，目前eBay市值超过310亿美元。如果eBay能剥离StubHub和分类广告资产，剩下的商城业务在规模上更适合私募股权交易。去年第三季度eBay商城业务带来21亿美元营收，StubHub和分类广告业务营收分别为2.91亿美元和2.54亿美元。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">eBay在一份声明中回应称，公司对“Elliott Management对公司业务优势的认可表示感谢，将仔细地评估它的提议”。谷歌、沃尔玛尚未就此置评。</p><p><br/></p>','0','0','0','0','0','0','百度被批沦落，搜索结果大半都是自家产品；华为5G手机预计6月上市','0');
INSERT INTO `qb_cms_content1` VALUES ('38','1','10','官宣！首款无孔手机定名魅族Zero，23日14点首发','1','1','57','2','0','0','1548224270','1548247753','1548224270','uploads/images/20190123/1_201901231417370176b.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月23日，魅族官方微博 @魅族科技 正式宣布了新品发布会的预告，并配文「今天下午两点，过来看看吧，没准儿是个趋势性产品呢！1月23日 14：00，一起盘盘魅族 Zero」。从预告的内容上看，新品的名称最终确定为「魅族 Zero」。根据目前已曝光的信息，基本可以确定本次新品为手机。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/ba7a2ddd87e243b5b3c42100debd29cb\" img_width=\"700\" img_height=\"620\" alt=\"官宣！首款无孔手机定名魅族Zero，23日14点首发\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">简单回顾下此次魅族新品的发酵过程。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1、22 日上午，魅族官微发布了一张疑似新品的预热海报，海报上有「World‘s 1st____」字样，但关键信息被黑条遮蔽，不少网友纷纷留言猜测；</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8e560f17569c473b8ac8a0c1620abfcc\" img_width=\"700\" img_height=\"477\" alt=\"官宣！首款无孔手机定名魅族Zero，23日14点首发\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2、没过多久，这张海报遭到了网友的破解，通过 P 图软件拉高亮度后，黑条中的文字显现了出来——「holeless phone」，即「无孔手机」。很快，这张海报遭到了网友的恶搞，黑条内的文字被 P 成了「Free Phone」「hopeless phone」等等；</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/977c9381421d41d1a66feffd94a0f406\" img_width=\"700\" img_height=\"828\" alt=\"官宣！首款无孔手机定名魅族Zero，23日14点首发\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">3、22 日晚，魅族再次发布微博「TA 不是防水，只是无孔而已。1.23 14:00 直播见」，并配上一张疑似新手机的海报。从海报上看，是一款亮屏的手机放到水中，由于魅族 16th 等旧款产品并未支持 IP68，因此确定这是款新手机。同时，根据亮屏的区域目测，该机屏占比不低。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/63126154cbd04cec9e2ed48ce8f9cef9\" img_width=\"700\" img_height=\"649\" alt=\"官宣！首款无孔手机定名魅族Zero，23日14点首发\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此前，网络上曾曝光过魅族概念手机的渲染图，其采用曲面屏设计，屏占比极高，机身底部与侧面未看见任何物理接口和物理按键。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/60e812e79a0c4ce9b0fd5725e05f1313\" img_width=\"620\" img_height=\"386\" alt=\"官宣！首款无孔手机定名魅族Zero，23日14点首发\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如无意外，这极有可能就是 23 日下午魅族即将发布的新手机——魅族 Zero。另一方面，新产品的命名方式与以往完全不同，可见该机不是魅族已有产品线的迭代，那么，魅族 Zero 到底是可量产的真旗舰？还是只存在于 PPT 中的概念产品？我们拭目以待。</p><p><br/></p>','0','0','0','0','0','0','官宣！首款无孔手机定名魅族Zero，23日14点首发','0');
INSERT INTO `qb_cms_content1` VALUES ('39','1','9','2019款宝马X7，美国已经到店，实车实拍','1','1','14','1','1','0','1548224441','1548246703','1548224441','uploads/images/20190123/1_2019012314202809342.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2019款宝马X7，美国已经到店，实车实拍。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/02e16e825e664c5893258abaf890b8f0\" img_width=\"960\" img_height=\"720\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/15aa2e78e8734c40b550bd87bc3fc12f\" img_width=\"960\" img_height=\"720\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/d686202e56304682b9c2a5c62422d6ef\" img_width=\"1242\" img_height=\"932\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/36faf693dbd8442ca507583392552863\" img_width=\"1242\" img_height=\"1656\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/3dd7428fdc1b4f01954d424f55eea766\" img_width=\"810\" img_height=\"1080\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/61ebde1c69204cfab5ae2f2c8b236b78\" img_width=\"1242\" img_height=\"1656\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8d0da9cd3ff84b729b495915e8465663\" img_width=\"1242\" img_height=\"932\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/3f6fa09d567546ed8efd31cca93e6cc3\" img_width=\"1242\" img_height=\"1656\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/219e41c9e7884d029bd50fe79191f4e6\" img_width=\"1242\" img_height=\"932\" alt=\"2019款宝马X7，美国已经到店，实车实拍\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p><br/></p>','0','0','0','0','0','0','2019款宝马X7，美国已经到店，实车实拍','0');
INSERT INTO `qb_cms_content1` VALUES ('40','1','9','  2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几','1','1','86','2','2','0','1548224597','1548247752','1548224597','uploads/images/20190123/1_20190123142057a00ab.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">进入2019年后，中国汽车市场各大年度销量数据也纷纷出炉，据乘联会数据显示：2018年收官之战的12月中，中国乘用车市场共销售223.31万辆，同比下降15.84%。全国的新能源狭义乘用车批发销量数据为16.0万辆，同比增长79.8%。从数据看，中国市场12月新能源乘用车市场也遭遇寒流，Top30中有12款车型销量下滑。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">但从全年累计销量数据看，新能源市场仍一片大好，前景无限。整个2018年，中国乘用车市场共销售2370.98万辆，同比下降4.08%，但依然力压美国成为全球最大的汽车销量大国。而全国新能源狭义乘用车累计批发销量101.6万辆，同比增长90.0%。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/4848912ec8294e45a606af089cc9c2cf\" img_width=\"1024\" img_height=\"768\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">相比SUV、轿车和MPV市场来说，新能源细分领域仍是2018年国内车市少有的保持销量增长的细分市场。这也说明，国内新能源市场仍未真正启动和全面发挥。从细分市场的贡献度来看，自主品牌仍然占据了巨大优势，在2018年新能源市场上仍是绝对主力。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/16d28714cc76427ab1366c7e33f82599\" img_width=\"1200\" img_height=\"791\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">从厂商销量数据来看，合资品牌仅有上汽通用五菱、华晨宝马、上汽通用和广汽三菱四个合资品牌进入Top30榜单，而上汽通用五菱和华晨宝马累计销量超过万辆，其余两款才几千辆的数据。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">自主品牌依然是新能源市场的最大赢家，比亚迪汽车、北汽新能源在过去一年销量均突破10万辆大关，销量分别为217676辆、147348辆，排名前两位。但从数据上来看，比亚迪和北汽新能源间的差距缺口依然巨大，比亚迪再次成为国内新能源的领航员，且与身后对手相差巨大。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/5eb5f4e9fb6d4aacb090d5667a55994d\" img_width=\"490\" img_height=\"946\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">值得一提的是，北汽新能源之所以销量火爆，与其EC系列产品热销分不开，EC系列是新能源细分市场2018年销量最高的车型，其累计销售90,637辆，约占新能源总市场份额的10%左右，成为北汽新能源的主要贡献者。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">上汽乘用车在本年度销量96977辆，排名第三，排在其后的分别是奇瑞、江淮、吉利、华泰、江铃、众泰、北京汽车、长安等品牌。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">以下是2018年新能源细分市场车企Top10榜单</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO1、比亚迪汽车 2018年累计销量：217676辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/17870eac45ac4a36abb3ea923e93a537\" img_width=\"1269\" img_height=\"846\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO2、北汽新能源 2018年累计销量：147348辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/f327b2cc29cd4ed7a0a3c0faeb35d177\" img_width=\"1080\" img_height=\"721\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO3、上汽乘用车 2018年累计销量：96977辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/ed0eb4e615104291a1671df73273a69d\" img_width=\"1080\" img_height=\"719\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO4、奇瑞汽车 2018年累计销量：66422辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/fea56904d59b4635927bdc7916cbbf99\" img_width=\"1000\" img_height=\"750\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO5、江淮汽车 2018年累计销量：63632辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/6d75ad415a3e46c68df979487c79d786\" img_width=\"1076\" img_height=\"688\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO6、吉利汽车 2018年累计销量：54341辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/d6afa176116545dc9c9f644eb5ba5f31\" img_width=\"500\" img_height=\"333\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO7、华泰汽车 2018年累计销量：52327辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/fc5e0b0593304660bb5ed3d725d029d7\" img_width=\"1238\" img_height=\"826\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO8、江铃新能源 2018年累计销量：48207辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/90d78564baca45bab46a357dc1e67b68\" img_width=\"1200\" img_height=\"800\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO9、众泰汽车 2018年累计销量：31539辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/bd1f1012683a416ca2b946c13f4a84e5\" img_width=\"1200\" img_height=\"779\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">NO10、北京汽车 2018年累计销量：29027辆</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/4f8a14433ecd4c15b4bc6f4f2cf169e5\" img_width=\"1024\" img_height=\"768\" alt=\"2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p><br/></p>','0','0','0','0','0','0','  2018年新能源汽车销量来了，比亚迪夺冠无悬念，你的爱车排第几','0');
INSERT INTO `qb_cms_content1` VALUES ('41','1','12','街头偶遇红旗纯电动，颜值爆表，网友：特斯拉估计压力大了','1','1','53','2','1','0','1548224786','1548247750','1548224786','uploads/images/20190123/1_201901231425388e5a3.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在目前的汽车市场上，新能源汽车无疑已经成为了市场上的香馍馍了，因为现在大家都在提倡要节能、要环保，而且咱们国家现在对于新能源汽车补贴力度也非常的大，正因为有这样的政策，所以各大车企都纷纷推出了自己旗下的新能源汽车，身为咱们自主品牌汽车中的一个，红旗当然也不会例外了，于是就在前不久推出了自己旗下首款纯电动车型-红旗E-HS3，目前就有网友在街头就偶遇到了这款车，到底这车是什么样子，让我们一起来看看吧！</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/4b6644135f8049b1bc44ee80456f77c6\" img_width=\"637\" img_height=\"415\" alt=\"街头偶遇红旗纯电动，颜值爆表，网友：特斯拉估计压力大了\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这是一位网友沈先生遇到的，据这位沈先生介绍，自己前两天外出办事的时候，由于爱车没电，所以就把车开到附近的一个充电桩的点去给爱车充点电，在充电的过程中他在这个充电点遇到了一辆也正在充电的红旗车，因为是首款红旗纯电动车型的原因，目前也都没有上市，这让自己碰到，肯定要一睹为快了，于是就赶紧拍摄照片晒了出来。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/398aeb06362646de9079c850fe50eace\" img_width=\"638\" img_height=\"381\" alt=\"街头偶遇红旗纯电动，颜值爆表，网友：特斯拉估计压力大了\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">我们可以从照片中看出，这辆红旗电动车应该就是未上市的红旗E-HS3，新车前脸依然采用了红旗家族式的设计，扇形前格栅以及竖向镀铬装饰，两侧大灯组上方配备了“钩型”LED日间行车灯。尾部造型较为敦实，尾灯采用了时下主流的贯穿式尾灯设计，后保险杠上有一条镀铬饰条，据了解，这款车在巡航能力上也有不凡的表现，最高巡航能力390km，百公里加速仅需5.9秒。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/d64da12874514fd5ad6e3223e035ff26\" img_width=\"640\" img_height=\"377\" alt=\"街头偶遇红旗纯电动，颜值爆表，网友：特斯拉估计压力大了\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">不仅外观帅，内饰看上去也很豪华，红旗此次采用了双屏设计而且都采用液晶显示，与球形换挡杆搭配真的是科技感满满的，此外，新车还采用木纹饰板、钢琴烤漆等材质家人，进一步营造出豪车的氛围。面对一辆这么霸气的红旗纯电动车，大家难免会跟特斯拉对比，不少网友都纷纷表示，现在国产新能源汽车技术真的非常成熟了，所以特斯拉真的可以滚出中国了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/1f7474ed4845421c8e02dbf9c207dcf7\" img_width=\"640\" img_height=\"434\" alt=\"街头偶遇红旗纯电动，颜值爆表，网友：特斯拉估计压力大了\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">小编点评，的确，现在红旗纯电动车都出来了，外观又这么帅气，开着肯定特别有面子，所以现在拿着那么多钱买特斯拉，真的还不如选择这车，所以我相信这车上市以后一定会成为爆款车型的，让我们拭目以待吧！</p><p><br/></p>','0','0','0','0','0','0','街头偶遇红旗纯电动，颜值爆表，网友：特斯拉估计压力大了','0');
INSERT INTO `qb_cms_content1` VALUES ('47','1','11','下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！','1','1','4','1','0','0','1548249699','0','1548249699','uploads/images/20190123/1_20190123212126d17b7.jpeg','<p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">众所周知，因为德马库斯考辛斯的加盟，金州勇士队一夜之间成为了联盟公敌，原本拥有五小阵容的勇士已经四年三冠很强大了，如今又来了个联盟第一中锋，彻底把阵容中所有的漏洞都堵上了，三百六十度无死角，怎么打怎么有，还让剩下29支球队怎么玩？但是高兴之余，勇士队也不得不正是一个问题，那就是下个赛季，考辛斯还会愿意留下来吗？</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/519cc484a7f14fb4b67ad2c308afba46\" img_width=\"1024\" img_height=\"683\" alt=\"下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">据悉，为了留下考辛斯，勇士队已经开始着手准备了，勇士管理层计划给考辛斯提供一份2000万左右的年薪。可以说是非常有诚意了，那么面对勇士队的诚心，考辛斯会被感动吗？对于这个问题，考辛斯自己亲口说出了答案：“说实话，我真的非常喜欢这座城市，喜欢这支球队，他们太可爱了，我想留在这里，如果少拿钱就可以留下来帮助球队，我想说我愿意这么做。”显然考辛斯这也是在向勇士队表忠心。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/0bd15b2330a9465584ad3e43f1acbb65\" img_width=\"640\" img_height=\"367\" alt=\"下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">值得一提的是，勇士队老大库里也对考辛斯的留队十分看好，谈到考辛斯的时候，库里忍不住称赞道：“德马库斯他就是一个大男孩，非常的重情义，他告诉我，他来勇士之前，联系了不下10家球队，但是都吃了闭门羹，没有球队愿意冒险给他一次机会。你知道吗，他最开始先和我沟通了，我当时非常的诧异他的决定，但是很快就理解了，然后就是你们看到的，他来了勇士，跟我们成了一家人。”</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/3aad67c20afd405b9ecfc821c96ef6b3\" img_width=\"940\" img_height=\"666\" alt=\"下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">库里还透露，考辛斯来到勇士之后，球队为他付出了很多，给予了他充分的信任和帮助。勇士管理层还专门给他成立了治疗组，康复组以及饮食团队，方方面面安排的非常妥当，考辛斯只需要安心的养伤，所以对于考辛斯降薪留队，库里觉得很正常，这样的勇士队谁会不爱呢？当初杜兰特身体健康，不也照样连续降薪了两年吗！</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/440bffbd3db04d5dbf580365fd2aa568\" img_width=\"1024\" img_height=\"683\" alt=\"下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">一年前，考辛斯正值巅峰却突然遭遇跟腱撕裂，赛季报销，他也因此错过了去年的全明星，错过了跟随球队征战季后赛的机会。休赛期期间，因为伤病的未知性，没有一支球队愿意给他一分大合同，自由球员市场中也是观望的人多，询价的人少，就连原先的母队鹈鹕都不愿意给他提供一份长约，走投无路的情况下，考辛斯迎着舆论和争议，以一年530万的底薪加盟金州勇士队。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/b4ae1ede8f9c41bebfe3b93981822d31\" img_width=\"1024\" img_height=\"1024\" alt=\"下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">四天前，休战一年的考辛斯终于迎来了在勇士队的首秀。对阵快船，考辛斯只是一登场就创造了一项NBA历史43年纪录，库里+汤普森+杜兰特+格林+考辛斯的首发阵容是联盟43年来首次同一支球队出现5个入选全明星的球员，上一次出现同一支球队拥有5个上赛季入选全明星的球员，还要追溯到1976年。这场比赛，考辛斯一共打了15分钟，贡献了14分6篮板3助攻1抢断1封盖，表现十分亮眼。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/df172ad17f5d45f686017bbdeb4b657f\" img_width=\"711\" img_height=\"715\" alt=\"下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">代表湖人出战的第二场比赛，对阵湖人，考辛斯出战了21分钟，打的时间也不长，但是作用却很明显。在考辛斯出战的这两场比赛中，勇士队整体的篮板球和盖帽数据十分好看，他在篮下的威慑力能让协防的杜兰特、格林、汤普森等人成功完成封盖。比赛中，考辛斯除了防守端脚步慢了一点之外，他在进攻端的作用已经显露。有劈扣，有三分，也有内线的背身强打，虽然距离他的个人巅峰状态还有距离，但是对于这支勇士队来说，显然已经足够了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/d27d2dabbbe145ed9010efc7dcc44a80\" img_width=\"713\" img_height=\"711\" alt=\"下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">最后，小编只想说，巨星的扎堆总是会让人们对这支球队充满了期待，希望勇士队不要辜负大家的期望，实现卫冕建立王朝，勇士加油，考辛斯加油！</p><p><br/></p>','0','0','0','0','0','0','下赛季会留在勇士吗？考辛斯终于说出真实想法，下一个杜兰特！','0');
INSERT INTO `qb_cms_content1` VALUES ('48','1','11','伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？','1','1','1','1','0','0','1548249724','0','1548249724','uploads/images/20190123/1_20190123212153ec0ac.jpeg','<p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">北京时间1月22日，雷霆坐镇主场迎来开拓者的挑战。围绕着球队核心拉塞尔·韦斯布鲁克作为中轴的打法，雷霆继续高奏凯歌。韦少砍下三双的亮眼表现，保罗-乔治的进攻依旧犀利，最终他们以123-114击败开拓者，总战绩来到29胜18负继续稳居西部第三。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">本赛季，韦少的身体因伤下滑与不稳定的投篮有目共睹，自打2008-09赛季以来，在1333次投射三分180以上的运动员的单赛季表现中，韦少本赛季的命中率位列倒数第二，他的3分命中率为24.1%仅仅领先于前76人托尼·沃滕在2013-14赛季的命中率21.3%。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/76b3c37bdf394308827d84989b45ebb0\" img_width=\"641\" img_height=\"428\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">那么，在竞争激烈的西部，雷霆管理层是不是应该对这位16-17赛季的最有价值球员的糟糕投射而担忧呢。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">然而，如果你能和比利·多诺万主教练谈论到韦少的投篮，你就会发现你的担忧是多余的。这位执教四年的主教练似乎并不理会人们对韦少的议论纷纷。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">“因为他的身材，他的运动能力，他的天赋，他可以在很多方面影响比赛，即使没有一个火爆的投篮之夜，”多诺万说。“他是一个独一无二的人，每天晚上都在为比赛做着不可思议的准备，我从不担心”</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/649d804ba98247cdaac0ccb3353af5d7\" img_width=\"641\" img_height=\"427\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">雷霆前锋内伦斯-诺埃尔则告诉记者：“拉塞尔为我们创造了一切，他的能量和速度是其他球队真正的问题。”“我们不太担心自己的角色，他正在努力让每个人都参与进来，为我们找到空位的投篮。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">随着保罗-乔治继续着他职业生涯的最佳赛季，韦少正在承担起一个更传统的角色</span>：他的使用率（进攻占有率）也从MVP赛季的41.7%降到上赛季的34.1%再降到本赛季的31.2%。韦少正在逐渐控制自己的进攻欲望，从防守与策应开始做起。虽然他依然热火朝天地打着他喜欢的“韦式篮球”，但是却正在把权力之杖慢慢地过渡给乔治。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">为了俄城的胜利，韦少没有变得越来越强，却在变得越来越好，这是一个毛头小伙子一步一步走向队史第一人的完美故事。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/dfc5036fbe774cd9ad8bf6f73faf358d\" img_width=\"641\" img_height=\"361\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">今天，韦少在37分钟的出场时间里轻松地砍下29分10板14助攻，向雷霆队史得分王宝座又迈进了一步。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">目前雷霆队史（含超音速时期）的很多纪录都由他们的传奇球星“手套”加里-佩顿所保持</span>，出战999场，累积36858分钟，7292个进球，15562次出手，得分18207，助攻7384次，抢断2107次，这些全部都是队史第一。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">作为对比，韦少如今出战787场，累积27073分钟，进球6322个，出手14563次，得分18035，助攻6526次，抢断1393次，全部紧紧地尾随其后。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/51e7bb0bbf924a52b97512644d57e34f\" img_width=\"641\" img_height=\"394\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在这些纪录仍由加里-佩顿中保持的纪录当中，除了抢断有些难度之外，其他都会在一定时间内被韦少赶上。<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">因此，只要韦少的职业生涯不出现大的变故，那么我们完全可以看到他全面超越“手套”的可能性。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在这些纪录当中，最重要的一项也是韦少最接近完成的一项纪录便是雷霆的队史得分王，目前韦少仅差佩顿172分，根据他目前场均21.8分的表现，需要八场左右的时间便能超过。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在北京时间12月13日，韦少就刚刚完成了在队史总得分上对杜兰特的超越（17566分）来到了队史第二。在不久之后，韦少又将超过佩顿登顶榜首，<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">能在同一个赛季超越这两个人完成封王之举，对他来说堪称意义非凡。</span></p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/cdc2bd3e3a7a42d09b872527ef152fe4\" img_width=\"619\" img_height=\"785\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在超越杜兰特的那一瞬间，不知道韦少会想些什么呢——<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">要知道，这个纪录本来会是杜兰特的，以他的得分能力，只要他愿意再打一个赛季就够了。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">大家永远都忘不了，16年的夏天。在经历了与73胜勇士史诗一般波澜壮阔的7场西决之后，杜兰特一声不响地离开了雷霆加盟了勇士。而等到他再次披着金州战衣回到俄城的时候，这座城市忿恨的蓝色火焰差一点就吞没了他，怒火之下大家甚至已经忘记了杜兰特是雷霆有史以来最优秀的篮球运动员。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">俄城球迷只知道，随着杜兰特的离去，雷霆队史第一人的身份已经与他渐行渐远，即便他再优秀也不可以了。在他们球迷看来，杜兰特留下的只有一些枯燥的数据罢了。没有做到好聚好散的他，恐怕很难像狼王加内特一样永远拥有明尼苏达球迷的爱。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/92a55bf21bf64da0b9ba213c4c222bbf\" img_width=\"641\" img_height=\"361\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">杜兰特离开后，自己的队史数据也完成了定格，本来那些将由他亲自打破的纪录一项一项被韦少后来居上。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而杜兰特目前仍能压制韦少的总数据榜单上，便只剩下了三分球，盖帽和罚球这三大项上。他3009次的三分出手和1143个的三分命中数，仍然霸占着队史第一的位置。而韦少则是2770次三分出手和848个三分命中，本赛季超越无望未来仍然可期。罚球方面，杜兰特的命中数为4599个，位列队史第一。韦少则是4543个，仅差56个。预计可以在10-15场比赛之内完成超越。至于盖帽，由于位置原因便不做比较了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/61f6499110684a4995cd6e8e47114046\" img_width=\"641\" img_height=\"485\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此外，雷霆队的篮板纪录由队史传奇——7届全明星的杰克-西克玛的7729个保持，而韦少目前则是队史第三5366个，如果他能保持全勤并且每个赛季依然能场均抓下十个篮板，那么他便能在三个赛季内成为队史篮板王，即便场均10个篮板与全勤对于韦少来说太过苛刻，那么如果他还能保持健康打个5-7年，破掉这个纪录也不是不可能的事。<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">一旦发生了，我们将会看到一个控球后卫加冕队史篮板王的奇景。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">最后说一个广大黑粉最喜闻乐见的数据——打铁，目前雷霆队史第一的打铁榜由加里-佩顿的8270个保持，然而韦少正以8241个在身后穷追不舍，如果正常发挥的话，以韦少本赛季每场12铁的速度，预计会在3场之内完成个人对佩顿的“超越”。<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">到时候，他会和科比一样，成为队史的“铁王”。</span></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/95c40a6b724640188f3166288c91417d\" img_width=\"641\" img_height=\"361\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">其实，无论是好的纪录还是坏的纪录都是由时间积累出来的痕迹，而时间也恰恰是韦少与雷霆互相给予的最大的财富。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">多年以后，队史只会记得威少是雷霆的象征。就像科比之于湖人，狼王之于明尼苏达，韦德之于热火，石佛之于圣城一样。</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">即便韦少的职业生涯没有能得到总冠军又如何呢？球迷又不是只为了赢球，大家喜欢他就足够了。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/e1c3ba30c53b47bf901431e27b88c9de\" img_width=\"641\" img_height=\"385\" alt=\"伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">如果没能夺得冠军，却成为了城市的图腾，对韦少来说无疑是更有价值。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">但我们始终都要记得，是杜兰特的离去，才让他有机会成就另一段传奇。</p><p><br/></p>','0','0','0','0','0','0','伟大威少将成队史第一人，城市图腾与总冠军哪个更重要？','0');
INSERT INTO `qb_cms_content1` VALUES ('49','1','11','足坛历史上“最帅”的国家队，没有之一！个个都堪称男模','1','1','6','1','1','0','1548249769','0','1548249769','uploads/images/20190123/1_20190123212234c342e.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在国家队层面，想要组建一支“全明星”球队并非难事，比如02年的巴西队，拥有各个位置上最好的球员，还有那恐怖的“3R”组合，在世界杯上7战全胜，令对手闻风丧胆。但要组建一支既有技术又有颜值的阵容，想必足坛历史上只有一支球队达成过，那就是2006年的意大利队，他们不仅夺得了那年的世界杯冠军，还个个都被比作男模，令人羡慕不已。（以下阵容以“帅”为主，并非06年意大利首发阵容，包含替补）</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">布冯（门将）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/2ef484dfba004f58b3d3f33ceff362ad\" img_width=\"628\" img_height=\"900\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在2006年世界杯的比赛中，布冯7战仅丢两球（其中一球为小组赛的乌龙球，另一球是则决赛中齐达内打入的勺子点球。）凭借着他和队友们的出色表现，意大利国家队第四次捧起了大力神杯，那年的布冯风华正茂，扑救技术一流，而颜值也是门将中的佼佼者。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">内斯塔（后卫）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/dfic-imagehandler/7f07fde0-562d-4c43-8cdb-cc147bbf4231\" img_width=\"467\" img_height=\"630\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">内斯塔在国家队的巅峰时期应该是02年世界杯，他带伤出战墨西哥队，最终帮助球队1比1战平对手晋级淘汰赛。却在八分之一决赛“突然”爆冷输给韩国队，那时的内斯塔因伤未能上场。转眼来到06年世界杯，内斯塔因腹股沟旧伤复发而在小组赛就提前结束了世界杯的征程。但伤病显然没有影响到他的帅！</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">卡纳瓦罗（后卫）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/92e010d293ae49a7971354a3bb65af7c\" img_width=\"324\" img_height=\"450\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在马尔蒂尼退出国家队后，卡纳瓦罗就成为了球队新的领袖，并在2006年世界杯上带领意大利队第四次获得世界冠军。那年的卡纳瓦罗尽管已经剃掉了满头金发，但他俊朗的外表依然散发着迷人的气息。最值得人们称赞的是，他是意大利球迷心中最合格的父亲，是所有男人都该学习的榜样。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">格罗索（后卫）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/dfic-imagehandler/c0cd51df-e0a1-42db-aaab-81d4fe7cd08b\" img_width=\"340\" img_height=\"445\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">球迷对格罗索最深刻的印象，一定来源于黄健翔的解说：“伟大的意大利的左后卫，他继承了意大利的光荣的传统！法切蒂、卡布里尼、马尔蒂尼，在这一刻灵魂附体！格罗索一个人，他代表了意大利足球悠久的历史的传统！在这一刻，他不是一个人在战斗！他不是一个人！......”。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">赞布罗塔（后卫）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/dfic-imagehandler/a357caa7-91e8-4276-950c-b26b56911854\" img_width=\"350\" img_height=\"460\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2002年世界杯，虽然意大利队以小组第二的身份出线，但他们依旧自信满满，却不曾想到八分之一决赛会踢的那么“艰苦”。而赞布罗塔正是被一名韩国球员粗暴的踢中了大腿，不得不因伤退场，意大利队亦在加时阶段被攻入致胜一球黯然出局。不过岁月终究不那么无情，赞布罗塔还是在2006年随队拿到了他们的冠军。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">托蒂（中场）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/d41651fd00f646e48eccf43d7425da6b\" img_width=\"291\" img_height=\"421\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2006年世界杯，意大利国家队差点又倒在八分之一决赛，不过凭借着格罗索创造的点球，托蒂轻松罚入，顺利将意大利队带入八强，并成功在决赛击败法国队，获得世界冠军。“狼王”托蒂，也为他的职业生涯拿到了最为关键的一个奖杯，划上了完美的句号。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">皮尔洛（中场）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/33f61150b9214eaaac35ad63409ff13c\" img_width=\"333\" img_height=\"500\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">说实话，皮尔洛在这支意大利队中真算不上帅哥，但他的作用却是任何人都替代不了的。“睡皮”总给人一种慵懒的感觉，就好像他不用睁开眼，就能把球传的那么精准......这或许是对他球技最高的一种赞美。对于那年的意大利队来说，皮尔洛是灵魂，是底蕴。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">加图索（中场）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/b416bbda40464f0b821a71899856025b\" img_width=\"394\" img_height=\"550\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">加图索是意大利队获得2006年世界杯冠军的核心球员，四分之一决赛对阵乌克兰，他力压打入两球的托蒂成为全场最佳，并在那届大赛结束后被评为赛事十佳运动员之一。不过加图索帅不帅，这个还真不好说，小编只能说他看上去真的非常强壮。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">因扎吉（前锋）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/dfic-imagehandler/dbd6082c-1b41-4e81-988f-e05c14948caf\" img_width=\"404\" img_height=\"560\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在世界杯历史上，因扎吉并没有留下太多的精彩故事，02年日韩世界杯，他替补上场曾打入一球，却遭到了裁判的误判。06年世界杯，在对阵捷克的比赛里他打入锁定胜局的一球，同时也是其个人在世界杯中的唯一进球。整届赛事，因扎吉只获得1次出场机会，打进1球。但是为了帅，小编只能让他“上场”。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">皮耶罗（前锋）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/b68b971aa40442288ec7b1d79f10b35d\" img_width=\"300\" img_height=\"432\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2002年世界杯，皮耶罗在对阵墨西哥的比赛中，鱼跃冲顶打进关键进球，这也是他在世界杯上的第一个进球。遗憾的是，八分之一决赛不敌韩国队惨遭淘汰，皮耶罗也失去了更多的表现机会。不过在2006年世界杯，他成功完成夙愿，帮助球队第四次获得世界冠军。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">托尼（前锋）</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/dfic-imagehandler/cdc3b171-8252-4ec8-93ff-48cac546ef3d\" img_width=\"327\" img_height=\"450\" alt=\"足坛历史上“最帅”的国家队，没有之一！个个都堪称男模\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2004年，托尼首次入选意大利国家队，就因为出色的表现，深受时任主帅里皮的器重。06年世界杯，7场比赛他6场首发，并在半决赛和决赛，以他作为单前锋。托尼也不负里皮信任，成功帮助球队获得世界冠军，还入选FIFA最佳阵容。当然，除了精湛的球技，帅气也是托尼的一大特征。</p><p><br/></p>','0','0','0','0','0','0','足坛历史上“最帅”的国家队，没有之一！个个都堪称男模','0');
INSERT INTO `qb_cms_content1` VALUES ('50','1','12','  因零部件缺陷，日本斯巴鲁工厂停产！森林人、86和BRZ还好吗？','1','1','0','1','0','0','1548249802','0','1548249802','uploads/images/20190123/1_2019012321231155b2d.jpeg','<p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">1月23日，据日本《朝日新闻》报道,斯巴鲁在日本的唯一一家工厂已经在一周前停产，因其发现从供应商采购的零部件存在缺陷。据了解，到目前为止，对生产的影响可能超过1万辆汽车，交付方面也开始出现延误。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">日本的工厂占据斯巴鲁全球产量的约60%。同时，斯巴鲁在日本生产的大部分汽车都是出口到国外市场。该公司表示，仍在确定缺陷在哪里，但无法确定何时恢复生产。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/3dce1f388c6642e485555637a7ac51c2\" img_width=\"640\" img_height=\"360\" alt=\"因零部件缺陷，日本斯巴鲁工厂停产！森林人、86和BRZ还好吗？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">《朝日新闻》称在动力转向装置中发现了这一缺陷，但斯巴鲁称这一缺陷尚未得到证实。该报还称，到目前为止，对生产的影响可能超过1万辆汽车，包括Impreza，Legacy 以及Forester车型，在客户交付方面开始出现延误。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">斯巴鲁正受到日本召回事件的影响。2017年10月，斯巴鲁因违反规定让不具备资格的员工进行了出货前新车的最终检查，导致产品存在质量缺陷，最终召回约40万辆汽车。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/cdc079e91d154e9bbb345eba024eaa81\" img_width=\"586\" img_height=\"366\" alt=\"因零部件缺陷，日本斯巴鲁工厂停产！森林人、86和BRZ还好吗？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">斯巴鲁被爆在群马县的两家工厂违反国家规定，让没有获得本厂认定资质的员工从事出货前成品车的检查，并且“无资格检查”现象始于30多年前，正规检查员将印章借予无资格人员在检查记录文件上盖章的造假早已成常态。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/1e45f4a538274ad98941eec082220472\" img_width=\"939\" img_height=\"560\" alt=\"因零部件缺陷，日本斯巴鲁工厂停产！森林人、86和BRZ还好吗？\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">去年10月，斯巴鲁将4 - 9月的上半财年营业利润预期下调了近一半，原因是与质量检查相关的成本上升。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2019年，斯巴鲁计划在日本生产65万辆，在全球生产103万辆，同比增长1.03%。该公司预计，全球汽车销量将达到创纪录的108万辆，其中70万辆将来自利润丰厚的美国市场。</p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">写在最后</span></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">从2017年到2018年两年间，质量缺陷、利润下降、造假事件等事件都在困扰着斯巴鲁，儿此次因零部件存缺陷而导致日本国内工厂生产，无疑让斯巴鲁更加雪上加霜。《海国图志》中那句“师夷长技以制夷”，小编觉得可以反过来了。日本车企近两年各种丑闻，<span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\">做为</span>崛起的自主品牌反面教材，再好不过。当然，比起做到100%质量完美无缺，车企更应坦诚、公开，这才是最能让消费者放心的核心价值观。</p><p><br/></p>','0','0','0','0','0','0','  因零部件缺陷，日本斯巴鲁工厂停产！森林人、86和BRZ还好吗？','0');
INSERT INTO `qb_cms_content1` VALUES ('51','1','12','  这辆车给了我心动的感觉，除了奢华和无与伦比的魅力外还让人心碎','1','1','8','1','0','0','1548249845','1548249877','1548249845','uploads/images/20190123/1_201901232123444a121.jpeg,uploads/images/20190123/1_2019012321235827481.jpeg,uploads/images/20190123/1_2019012321243643eed.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">宾利闻名遐迩的精湛工艺无处不在，宾利的绝妙之处仍是大扭矩小转速以及豪华、奢侈、放松、自如的感觉。欧陆是宾利家族中独一无二的精品，提起欧陆，可能大多数人的脑海中都会隐约浮现出一幅幅&quot;奢华&quot;、&quot;高贵&quot;的身姿。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/54596fd4632e426d80788d1600afae4e\" img_width=\"640\" img_height=\"437\" alt=\"这辆车给了我心动的感觉，除了奢华和无与伦比的魅力外还让人心碎\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">全新欧陆 GT 采用超塑成型技术打造棱角分明、重心低稳的车身，速度感跃然而起，风度感扑面而来。在它身上GT车型的三个设计理念完美呈现，那就是迷人的车身线条、肌肉感极强的车尾造型以及流线型的车顶设计。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/a08ac398019f4ac78a448a7f0e3fe3aa\" img_width=\"640\" img_height=\"383\" alt=\"这辆车给了我心动的感觉，除了奢华和无与伦比的魅力外还让人心碎\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">仪表板中央好像没有屏幕一样按下发动机启动按钮，仪表板中央的饰面无声滑动翻转，呈现出宾利有史以来最大的中控触摸屏——12.3英寸的多媒体交互显示屏，亦可定制宾利三面翻转中控面板使高科技与传统工艺的绝美组合。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/d518870a2ab64f55ade8aa5a04322e5c\" img_width=\"640\" img_height=\"407\" alt=\"这辆车给了我心动的感觉，除了奢华和无与伦比的魅力外还让人心碎\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">座舱内的许多抛光镀铬设计都可以定制宾利的新型菱形滚花 – 一种醒目华美的外观表面，令控件更容易握持，与此同时，其表面熠熠生辉，可为座舱增添异彩。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/35d7acc712254a3ca82e0f47967df5b4\" img_width=\"860\" img_height=\"573\" alt=\"这辆车给了我心动的感觉，除了奢华和无与伦比的魅力外还让人心碎\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">全新欧陆 GT 旨在提供灵动矫捷、酣畅淋漓的驾驭体验，采用了创新性底盘和电子控制系统，搭配全新 6.0 升 W12 发动机和能够实现平稳、快速、高效换挡的 8 速双离合变速箱。因此，全新欧陆 GT 可在短短 3.7 秒内从静止加速到 100 公里/小时，最高速度更可达到令人惊叹的333 公里/小时。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/98c9b1ae2a314359b67d34065553fdab\" img_width=\"1366\" img_height=\"477\" alt=\"这辆车给了我心动的感觉，除了奢华和无与伦比的魅力外还让人心碎\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">以上内容足以让每个人心动，但是下面的这句话也会让你瞬间心碎。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/002286364e854ac19ac6e1151b3eed94\" img_width=\"864\" img_height=\"573\" alt=\"这辆车给了我心动的感觉，除了奢华和无与伦比的魅力外还让人心碎\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">首先，这辆让每个人心动的宾利欧陆有着560多万的身价所以想要行动的你必须有钱。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">其次这款车全球限量只有300台所以光有钱还不行还要有地位！</p><p><br/></p>','0','0','0','0','0','0','  这辆车给了我心动的感觉，除了奢华和无与伦比的魅力外还让人心碎','0');
INSERT INTO `qb_cms_content1` VALUES ('52','1','12','销量暴跌，昔日一线豪车品牌如今沦为三线品牌','1','1','1','1','0','0','1548325511','0','1548325511','uploads/images/20190124/1_201901241824588606e.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">08年印度塔塔收购捷豹路虎，10年，捷豹路虎进入中国。12年，捷豹路虎与奇瑞成立合资公司，开始路虎的国产化进程。14年首款国产车型极光正式投产，并于次年2月正式上市。正式拉开了国产的序幕。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/dc399187ea9548bea1cc9943791b4ad9\" img_width=\"640\" img_height=\"480\" alt=\"销量暴跌，昔日一线豪车品牌如今沦为三线品牌\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">2018年，是捷豹路虎进入中国的第8年。从10年正式进入中国市场以来，捷豹路虎一直保持高速增长。2010年，捷豹路虎在华销量仅2.61万辆，到2013年攀升至9.52万辆，年均增长53.9%。2014年，捷豹路虎在华销量12.2万辆，成为继BBA之后，第四个在华销量突破10万辆的豪车品牌。2016年，销量达到11.9万辆，2017年，销量14.6万辆，而就在同一年，捷豹路虎总共发起了8次召回。召回数量达到10.7万辆。而到了2018年，路虎销量暴跌20%，路虎从昔日的一线豪车品牌跌下神坛，沦为了三线豪车品牌，主要可能是以下几个原因 。</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第一，质量问题</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">很多人对捷豹路虎品牌的感受是小毛病多。而对捷豹路虎的投诉率也大大高于其他豪车阵营的品牌。单单2017年，捷豹路虎就发起了8次召回，2018年又召回7次。两年累计召回数量超过20万辆，几乎与销量相当，意味着捷豹路虎几乎每辆车都有问题。而在此之前，央视3.15晚会也曾经曝光过捷豹路虎的9速变速箱问题。给品牌造成了很大的负面影响。从这些事件中可以看出，捷豹路虎对于质量的控制很难让消费者放心。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/8f1d0ad0fabf42e9b345ce39c4520a67\" img_width=\"640\" img_height=\"427\" alt=\"销量暴跌，昔日一线豪车品牌如今沦为三线品牌\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第二，品牌影响力</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">捷豹路虎在进入中国市场之后，经历了狂飙突进的增长之后，对于中国市场的品牌建设和维护没有跟上，导致了路虎品牌在国人心中成了暴发户的代名词。捷豹路虎作为英伦老牌豪车品牌，奢华商务贵族应该是捷豹路虎品牌本身的应有的内涵。但是在中国市场上，捷豹路虎的形象跟其该有的品牌内涵大相径庭。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/e5773bf544a649d7a954ae9a04ab0027\" img_width=\"640\" img_height=\"427\" alt=\"销量暴跌，昔日一线豪车品牌如今沦为三线品牌\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第三，路虎的国产化</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">从路虎国产化开始之后，奇瑞捷豹路虎承担了国产市场车辆的生产。很多人对路虎车上贴有奇瑞二字非常抵触。在国产工厂下线了10万辆车，15万辆车车的记录之后，各种质量问题也开始接踵而至，这也是摧毁路虎品牌的导火索。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/d42b335606fc4834b07ee55f16073b2f\" img_width=\"450\" img_height=\"250\" alt=\"销量暴跌，昔日一线豪车品牌如今沦为三线品牌\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第四，其他豪车品牌的强势</p><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">18年开始，不论是传统的豪车三强奔驰，宝马，奥迪增长强劲，就连雷克萨斯，凯迪拉克，沃尔沃这样的二线豪华品牌都凭借着出色的质量赢得了消费者的热爱，销量也获得了大幅的增长，而只有路虎销量出现了负增长。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/2b205cd8f6214e14a6faecf13844096b\" img_width=\"550\" img_height=\"367\" alt=\"销量暴跌，昔日一线豪车品牌如今沦为三线品牌\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">路虎作为很多男人心中的梦想座驾， 希望不要把这份美好打碎。</p><p><br/></p>','0','0','0','0','0','0','销量暴跌，昔日一线豪车品牌如今沦为三线品牌','0');
INSERT INTO `qb_cms_content1` VALUES ('53','1','12','吉利版“保时捷帕纳梅拉”来了！领克05新车曝光','1','1','4','1','0','0','1548325680','0','1548325680','uploads/images/20190124/1_20190124182749fe022.jpeg','<p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">导读：吉利版“保时捷帕纳梅拉”来了！领克05新车曝光，高端四门轿跑。下面就让我们一探究竟。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/18350b6570914b36a5ac193b220a61f9\" img_width=\"630\" img_height=\"420\" alt=\"吉利版“保时捷帕纳梅拉”来了！领克05新车曝光\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第一、今天说的这款车就是吉利领克高端四门轿跑——领克05。作为领克旗舰车型，将会基于沃尔沃的SPA模块化架构平台打造。对于吉利汽车，大家应该都很熟悉了，在国内来说这个品牌的知名度绝对排在前列，特别是高端品牌领克，深受年轻消费者喜爱。当时就觉得领克01有点像保时捷，有点卡晏的味儿，现在领克05（假想图）越来越像了，但是外形感觉越大越自然，我是褒义。此外领克E级7座豪华SUV也很漂亮。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/ae1ce0d2b53a4da7967fec41d52f1566\" img_width=\"630\" img_height=\"420\" alt=\"吉利版“保时捷帕纳梅拉”来了！领克05新车曝光\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第二、从外观上来看，领克05这款车的设计首先充满了领克家族的味道，前脸的造型尤其明显。吉利所有车，都是被评为，最美的国产车，这一点有待商榷。但是领克05的定位比起领克的其他车型来说要更加的犀利，因为其定位的是高端四门轿跑，看着倒是别有一番风味。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/3a4ea6fd7473425897d8c339a93481ef\" img_width=\"640\" img_height=\"381\" alt=\"吉利版“保时捷帕纳梅拉”来了！领克05新车曝光\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第三、在动力方面，领克05搭载2.0T高功率发动机，配个后驱，加上个尾翼，帕拉米拉风格，车长4.9米，卖20万起一定爆款！哪款车好看，就仁者见仁智者见智了。说实话，这车要出来了，真不一定没有保时捷帕拉梅拉好看！保时捷的品牌就是因为历史悠久所以成了经典，但说实话它并不好看！如果保时捷是个新品牌就这个外形绝对会吐槽一片。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/ca170c89d6144b65980705a57e8f80e6\" img_width=\"900\" img_height=\"596\" alt=\"吉利版“保时捷帕纳梅拉”来了！领克05新车曝光\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第四、领克05蛮漂亮的，有个性，只要20万以内起步，比比亚迪秦pro贵2万，可以关注，当然，尽量别拿三缸发动机，先出完美一些，以占领市场（像帝豪一样），然后再说其他。有些人买壳，有些人买发动机调教，有些人买配置，有些人也许就是看看。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/8e077a057daf4aa2acd91559ff488554\" img_width=\"720\" img_height=\"476\" alt=\"吉利版“保时捷帕纳梅拉”来了！领克05新车曝光\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第五、说实话，领克真挺尴尬的，领克01是主打性价比，领克02、领克03开始三杠加双离合了。回头价钱也不低，但是你价钱不低底气是什么呢？沃尔沃的XC系列，S40、S60、S90系列，都大降价大优惠，领克接着就相当尴尬了。领克02紧凑级中配，大概18万落地，国产三缸没四驱远不如主流紧凑级SUV。</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/04963d0cbab0481db577e3ebcaae07ea\" img_width=\"720\" img_height=\"476\" alt=\"吉利版“保时捷帕纳梅拉”来了！领克05新车曝光\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">第六、关键是价格，要造适合老百姓的车。就怕是老百姓买不起，有钱人看不起！现在消费者买车，我觉得还是要买经过市场检验的品牌，省钱省心，吉利造的车外形不是也漂亮吗，爆发后不也归于平淡了，现在市场上热销的不还是那几个品牌吗？</p><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br/></p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/6d7fa9c3b8ce46dcbb0770e522dc1337\" img_width=\"640\" img_height=\"396\" alt=\"吉利版“保时捷帕纳梅拉”来了！领克05新车曝光\" inline=\"0\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><br style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box;\"/></p><p class=\"ql-align-justify\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">小结：领克05这种小众车型主要为提升品牌形象，敢推出就已经成功一半了。希望吉利尽快把领克转向手感建立好；此外三缸油耗跟同排量四缸比费油得多，油耗应该努力降低，当然我还是很期待期待旅行版的领克04。您怎么看呢？欢迎回复评论！</p><p><br/></p>','0','0','0','0','0','0','吉利版“保时捷帕纳梅拉”来了！领克05新车曝光','0');
INSERT INTO `qb_cms_content1` VALUES ('54','1','12','  周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样','1','1','7','1','0','0','1548325865','0','1548325865','uploads/images/20190124/1_201901241830501e6a3.jpeg','<p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">汽车工业发展到今天，对于各家品牌公众都贴上了标签，这家是平民车，这家专门做豪华车，还有一些只玩超级跑车。而对于一些历史悠久的车企来说，都有一颗追逐性能的心，所以尽管是主打平民车的品牌，他们也会拿出可以对刚超级跑车的性能车来捍卫尊严。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1519637106695d7dd81a26d\" img_width=\"2560\" img_height=\"1440\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">而提起超级跑车，我们都会想到德国和意大利这两个国家，毕竟这里专门出超跑。而直线王布加迪却是一个法国品牌，不过说来复杂，由意大利人创立的布加迪由于战争，其厂址一直处了动态变化，德国、法国、意大利都呆过，而如今布加迪已经被大众并购了，估计和法国也扯不上关系。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/1519637217033415e84aded\" img_width=\"1920\" img_height=\"1080\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">那说回法系车，标致、雪铁龙都是我们熟悉的品牌，在印象中都是主打民用车的品牌，其实也有我们也想不到的超级跑车。雪铁龙有一款名为雪铁龙GT的超跑，性能强悍。但是说到这款车的由来也比较有趣，其实这是索尼ps系列游戏机的游戏厂商Polyphone在游戏中展现的一款模拟驾驶车型，而在现实中，雪铁龙却和游戏厂商一起联合开发了这款实车，而且并非PPT造车，是一辆真的能动的超级跑车，不得不说雪铁龙还真是耿直。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/15196373641692ea855bd28\" img_width=\"1280\" img_height=\"722\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">雪铁龙GT概念车是索尼ps系列游戏机的游戏厂商Polyphony公司联手雪铁龙一起打造的针对游戏的超跑，在游戏中，雪铁龙GT的名字是“GtbyCitroen”，被设定成一款使用燃料电池、电力驱动、无污染物排放的赛车。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/15196366220459bfcb09058\" img_width=\"640\" img_height=\"427\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">这款跑车的造型相当夸张，原因就是在它的身上有许多空机动力学设计，简单来说就是有许多风洞，这也就使得雪铁龙的家族前脸变得小了一些，大灯与风洞一起形成双C型结构，威武凶悍。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/15196366220476bd1b7a2d1\" img_width=\"640\" img_height=\"400\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/15196366221273a3f279b6f\" img_width=\"640\" img_height=\"404\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">雪铁龙GT拥有动感的风格、精雕细琢的线条以及锐利的造型。超大尺寸设计的尾部设计让人印象深刻，很长的车尾显得有些夸张，这是为了营造一种视网膜驻留的效果。这个创意同时也是为了让它看起来更快，车身侧面从白到灰的变效果进一步强调了其运动的印象。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1519637413073cf603e644c\" img_width=\"660\" img_height=\"444\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">雪铁龙GT的造型反应了设计师们对最理想的空气动力学设计的不懈追求。这款概念车流线的、紧绷的线条，夸张到了极致。干净利落的修长侧面、车顶凸起的棱线，以及珍珠白色泽的车身涂装，都加强了整车充满光泽和肌肉感的外观印象。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/151963741311877c46c1733\" img_width=\"660\" img_height=\"363\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">雪铁龙GT车长4.96米，宽2.08米，高1.09米。采用21寸轮毂，其中后轮宽度达到了295mm。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1519637503203b076eaee7d\" img_width=\"916\" img_height=\"1007\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">进入到车内，你会发现这辆车完全是为了跑而存在的，没有多余的东西，只是纯粹的赛道感。游戏手柄般的红色方向盘，视觉效果震撼，挡杆处是排列好的按键，让人很有驾驶欲望。金银双色的中控装饰彰显出不一样的豪华感。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1519636622127fe888ceafb\" img_width=\"640\" img_height=\"480\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/1519636622127533e905e78\" img_width=\"640\" img_height=\"446\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">雪铁龙把车重控制在了1360公斤，百公里加速3.6秒，极速385km。车门采用蝴蝶门设计，值得注意的是雪铁龙GT尾部并没有排气管，因为这是一辆氢燃料电池超跑。它比布加迪更优秀的地方，在于0排放，3.6秒的百公里加速却不会造成一毫克尾气——氢动力车排出的只有水。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p1.pstatp.com/large/pgc-image/1519636622067628accf73a\" img_width=\"640\" img_height=\"400\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p class=\"ql-align-center\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此车在周杰伦MV拍摄作品《自导自演》中被使用。</p><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p3.pstatp.com/large/pgc-image/151963812614285f12fd035\" img_width=\"940\" img_height=\"480\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><div class=\"pgc-img\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"http://p9.pstatp.com/large/pgc-image/1519638137987d43c2a7685\" img_width=\"940\" img_height=\"528\" alt=\"周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样\" inline=\"0\" data-filtered=\"filtered\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; border-style: none; max-width: 100%; display: block; margin: 10px auto;\"/><p class=\"pgc-img-caption\" style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; text-align: center; font-size: 12px; color: rgb(119, 119, 119); line-height: 16px;\"><br/></p></div><p style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; margin-top: 16px; margin-bottom: 16px; padding: 0px; color: rgb(34, 34, 34); font-family: &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, &quot;Helvetica Neue&quot;, Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"-webkit-tap-highlight-color: transparent; box-sizing: border-box; font-weight: 700;\">结语：</span>周董曾花下巨款买这名不见经传法国浪漫超跑到自己的MV中做点缀，想必也该明白此货绝非虚名。虽然这辆雪铁龙GT只是一辆为了游戏而造出来的车，但也是由于这款车的存在，雪铁龙也有和超级跑车的比拼一下的资本了。</p><p><br/></p>','0','0','0','0','0','0','  周董曾花6000万买这它拍MV，雪铁龙这款让布加迪都害怕的车型咋样','0');
