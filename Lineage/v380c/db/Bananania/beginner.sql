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
INSERT INTO `beginner` VALUES ('3', '289', '1', '0', '0', '耀武短劍', 'P', '1');
INSERT INTO `beginner` VALUES ('4', '290', '1', '0', '0', '耀武雙手劍', 'K', '1');
INSERT INTO `beginner` VALUES ('5', '292', '1', '0', '0', '耀武之弩', 'E', '1');
INSERT INTO `beginner` VALUES ('6', '293', '1', '0', '0', '耀武魔杖', 'W', '1');
INSERT INTO `beginner` VALUES ('7', '291', '1', '0', '0', '耀武雙刀', 'D', '1');
INSERT INTO `beginner` VALUES ('8', '289', '1', '0', '0', '耀武短劍', 'R', '1');
INSERT INTO `beginner` VALUES ('9', '292', '1', '0', '0', '耀武之弩', 'I', '1');
