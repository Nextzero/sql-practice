# Host: localhost  (Version 5.6.36-log)
# Date: 2017-07-18 11:02:04
# Generator: MySQL-Front 6.0  (Build 2.20)


DROP DATABASE IF EXISTS `test`;
CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`


#
# Structure for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0-企业,1-个人,2-部门',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名字',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '联系地址',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '联系email',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT '联系 QQ',
  `enterprise_id` int(11) NOT NULL DEFAULT '0' COMMENT '企业ID',
  `dep_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32020001 DEFAULT CHARSET=utf8 COMMENT='用户';
