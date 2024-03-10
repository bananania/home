/*
Navicat MySQL Data Transfer

Source Server         : Taiwan Server
Source Server Version : 50140
Source Host           : localhost:3366
Source Database       : l1jtw_db

Target Server Type    : MYSQL
Target Server Version : 50140
File Encoding         : 65001

Date: 2011-02-04 06:56:00
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for castle
-- ----------------------------
CREATE TABLE `castle` (
  `castle_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  `war_time` datetime DEFAULT NULL,
  `tax_rate` int(11) NOT NULL DEFAULT '0',
  `public_money` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`castle_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `castle` VALUES ('1', '肯特城', '2024-03-11 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('2', '妖魔城', '2024-03-11 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('3', '風木城', '2024-03-11 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('4', '奇岩城', '2024-03-11 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('5', '海音城', '2024-03-11 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('6', '侏儒城', '2024-03-11 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('7', '亞丁城', '2024-03-11 20:00:00', '10', '0');
INSERT INTO `castle` VALUES ('8', '狄亞得要塞', '2024-03-11 20:00:00', '10', '0');
