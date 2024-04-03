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
-- Table structure for beginner
-- ----------------------------
CREATE TABLE `beginner` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(6) NOT NULL DEFAULT '0',
  `count` int(10) NOT NULL DEFAULT '0',
  `charge_count` int(10) NOT NULL DEFAULT '0',
  `enchantlvl` int(6) NOT NULL DEFAULT '0',
  `item_name` varchar(50) NOT NULL DEFAULT '',
  `activate` char(1) NOT NULL DEFAULT 'A',
  `bless` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `beginner` VALUES ('1', '40641', '1', '0', '0', '說話卷軸', 'A', '1');
INSERT INTO `beginner` VALUES ('2', '49309', '1', '0', '0', '象牙塔箭筒', 'E', '1');
INSERT INTO `beginner` VALUES ('3', '232', '1', '0', '0', '香蕉之劍', 'P', '1');
INSERT INTO `beginner` VALUES ('4', '233', '1', '0', '0', '香蕉巨劍', 'K', '1');
INSERT INTO `beginner` VALUES ('5', '239', '1', '0', '0', '香蕉之弓', 'E', '1');
INSERT INTO `beginner` VALUES ('6', '238', '1', '0', '0', '香蕉魔杖', 'W', '1');
INSERT INTO `beginner` VALUES ('7', '236', '1', '0', '0', '香蕉雙刀', 'D', '1');
INSERT INTO `beginner` VALUES ('8', '233', '1', '0', '0', '香蕉巨劍', 'R', '1');
INSERT INTO `beginner` VALUES ('9', '238', '1', '0', '0', '香蕉魔杖', 'I', '1');
INSERT INTO `beginner` VALUES ('10', '40010', '500', '0', '0', '治癒藥水', 'A', '1');
INSERT INTO `beginner` VALUES ('11', '40013', '50', '0', '0', '自我加速藥水', 'A', '1');
INSERT INTO `beginner` VALUES ('12', '47000', '5', '0', '0', '150%神力藥水', 'A', '1');
INSERT INTO `beginner` VALUES ('13', '49325', '5', '0', '0', '香蕉幣', 'A', '1');
INSERT INTO `beginner` VALUES ('14', '286', '1', '0', '0', '艾爾摩短劍', 'P', '0');
INSERT INTO `beginner` VALUES ('15', '284', '1', '0', '0', '艾爾摩雙手劍', 'K', '0');
INSERT INTO `beginner` VALUES ('16', '283', '1', '0', '0', '艾爾摩弩槍', 'E', '0');
INSERT INTO `beginner` VALUES ('17', '281', '1', '0', '0', '艾爾摩魔杖', 'W', '0');
INSERT INTO `beginner` VALUES ('18', '282', '1', '0', '0', '艾爾摩鋼爪', 'D', '0');
INSERT INTO `beginner` VALUES ('19', '280', '1', '0', '0', '艾爾摩鎖鏈劍', 'R', '0');
INSERT INTO `beginner` VALUES ('20', '279', '1', '0', '0', '艾爾摩奇古獸', 'I', '0');
INSERT INTO `beginner` VALUES ('21', '232', '1', '0', '0', '香蕉之劍', 'E', '1');
