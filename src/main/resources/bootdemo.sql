/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bootdemo

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-04-20 23:45:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` int(11) unsigned DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `typeId` int(22) unsigned NOT NULL,
  `comment` tinyint(1) unsigned zerofill DEFAULT '1',
  `top` tinyint(1) unsigned DEFAULT '0',
  `order` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('110', 'test', '哦哦对是哦', '0', '这是第10篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('111', 'test', '哦哦对是哦', '0', '这是第11篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('112', 'test', '哦哦对是哦', '0', '这是第12篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('113', 'test', '哦哦对是哦', '0', '这是第13篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('114', 'test', '哦哦对是哦', '0', '这是第14篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('115', 'test', '哦哦对是哦', '0', '这是第15篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('116', 'test', '哦哦对是哦', '0', '这是第16篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('117', 'test', '哦哦对是哦', '0', '这是第17篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '1', null);
INSERT INTO `article` VALUES ('118', 'test', '哦哦对是哦', '0', '这是第18篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('119', 'test', '哦哦对是哦', '0', '这是第19篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('120', 'test', '哦哦对是哦', '0', '这是第20篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('121', 'test', '哦哦对是哦', '0', '这是第21篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('122', 'test', '哦哦对是哦', '0', '这是第22篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('123', 'test', '哦哦对是哦', '0', '这是第23篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('124', 'test', '哦哦对是哦', '0', '这是第24篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('125', 'test', '哦哦对是哦', '0', '这是第25篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('126', 'test', '哦哦对是哦', '0', '这是第26篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('127', 'test', '哦哦对是哦', '0', '这是第27篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('128', 'test', '哦哦对是哦', '0', '这是第28篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('129', 'test', '哦哦对是哦', '0', '这是第29篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('130', 'test', '哦哦对是哦', '0', '这是第30篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('131', 'test', '哦哦对是哦', '0', '这是第31篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('132', 'test', '哦哦对是哦', '0', '这是第32篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('133', 'test', '哦哦对是哦', '0', '这是第33篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('134', 'test', '哦哦对是哦', '0', '这是第34篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('135', 'test', '哦哦对是哦', '0', '这是第35篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('136', 'test', '哦哦对是哦', '0', '这是第36篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('137', 'test', '哦哦对是哦', '0', '这是第37篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('138', 'test', '哦哦对是哦', '0', '这是第38篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('139', 'test', '哦哦对是哦', '0', '这是第39篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('140', 'test', '哦哦对是哦', '0', '这是第40篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('141', 'test', '哦哦对是哦', '0', '这是第41篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('142', 'test', '哦哦对是哦', '0', '这是第42篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('143', 'test', '哦哦对是哦', '0', '这是第43篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('144', 'test', '哦哦对是哦', '0', '这是第44篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('145', 'test', '哦哦对是哦', '0', '这是第45篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('146', 'test', '哦哦对是哦', '0', '这是第46篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('147', 'test', '哦哦对是哦', '0', '这是第47篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('148', 'test', '哦哦对是哦', '0', '这是第48篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('149', 'test', '哦哦对是哦', '0', '这是第49篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('150', 'test', '哦哦对是哦', '0', '这是第50篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('151', 'test', '哦哦对是哦', '0', '这是第51篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('152', 'test', '哦哦对是哦', '0', '这是第52篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('153', 'test', '哦哦对是哦', '0', '这是第53篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('154', 'test', '哦哦对是哦', '0', '这是第54篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('155', 'test', '哦哦对是哦', '0', '这是第55篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('156', 'test', '哦哦对是哦', '0', '这是第56篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('157', 'test', '哦哦对是哦', '0', '这是第57篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('158', 'test', '哦哦对是哦', '0', '这是第58篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('159', 'test', '哦哦对是哦', '0', '这是第59篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('160', 'test', '哦哦对是哦', '0', '这是第60篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('161', 'test', '哦哦对是哦', '0', '这是第61篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('162', 'test', '哦哦对是哦', '0', '这是第62篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('163', 'test', '哦哦对是哦', '0', '这是第63篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('164', 'test', '哦哦对是哦', '0', '这是第64篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('165', 'test', '哦哦对是哦', '0', '这是第65篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('166', 'test', '哦哦对是哦', '0', '这是第66篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('167', 'test', '哦哦对是哦', '0', '这是第67篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('168', 'test', '哦哦对是哦', '0', '这是第68篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('169', 'test', '哦哦对是哦', '0', '这是第69篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('170', 'test', '哦哦对是哦', '0', '这是第70篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('171', 'test', '哦哦对是哦', '0', '这是第71篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('172', 'test', '哦哦对是哦', '0', '这是第72篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('173', 'test', '哦哦对是哦', '0', '这是第73篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('174', 'test', '哦哦对是哦', '0', '这是第74篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('175', 'test', '哦哦对是哦', '0', '这是第75篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('176', 'test', '哦哦对是哦', '0', '这是第76篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('177', 'test', '哦哦对是哦', '0', '这是第77篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('178', 'test', '哦哦对是哦', '0', '这是第78篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('179', 'test', '哦哦对是哦', '0', '这是第79篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('180', 'test', '哦哦对是哦', '0', '这是第80篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('181', 'test', '哦哦对是哦', '0', '这是第81篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('182', 'test', '哦哦对是哦', '0', '这是第82篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('183', 'test', '哦哦对是哦', '0', '这是第83篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('184', 'test', '哦哦对是哦', '0', '这是第84篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('185', 'test', '哦哦对是哦', '0', '这是第85篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('186', 'test', '哦哦对是哦', '0', '这是第86篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('187', 'test', '哦哦对是哦', '0', '这是第87篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('188', 'test', '哦哦对是哦', '0', '这是第88篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('189', 'test', '哦哦对是哦', '0', '这是第89篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('190', 'test', '哦哦对是哦', '0', '这是第90篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('191', 'test', '哦哦对是哦', '0', '这是第91篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('192', 'test', '哦哦对是哦', '0', '这是第92篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('193', 'test', '哦哦对是哦', '0', '这是第93篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('194', 'test', '哦哦对是哦', '0', '这是第94篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('195', 'test', '哦哦对是哦', '0', '这是第95篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('196', 'test', '哦哦对是哦', '0', '这是第96篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('197', 'test', '哦哦对是哦', '0', '这是第97篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('198', 'test', '哦哦对是哦', '0', '这是第98篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('199', 'test', '哦哦对是哦', '0', '这是第99篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('200', 'test', '哦哦对是哦', '0', '这是第100篇文章', '2019-04-14 21:13:17', '2019-04-14 21:13:21', '1', '1', '0', null);
INSERT INTO `article` VALUES ('201', '插入时间', '怎得是 士大夫', '0', null, '2019-04-20 23:38:05', '2019-04-20 23:37:56', '1', '0', '0', null);
INSERT INTO `article` VALUES ('202', '可以的', '士大夫士大夫啊', '0', null, '2019-04-20 23:43:39', '2019-04-20 23:39:14', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag` (
  `id` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `aid` int(22) unsigned zerofill NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `content` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `pid` int(22) NOT NULL,
  `status` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', 'Linux', null, null, null, null);
INSERT INTO `tag` VALUES ('2', 'Java', null, null, null, null);
INSERT INTO `tag` VALUES ('3', 'Spring', null, null, null, null);
INSERT INTO `tag` VALUES ('4', 'Spring Boot', null, null, null, null);
INSERT INTO `tag` VALUES ('5', '并发', null, null, null, null);
INSERT INTO `tag` VALUES ('6', '怎么说', '阿斯蒂芬', null, null, null);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pid` int(22) unsigned NOT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES ('1', '前端技术', null, '0', null, null, null);
INSERT INTO `type` VALUES ('2', '后端技术', null, '0', null, null, null);
INSERT INTO `type` VALUES ('3', '服务器', null, '0', null, null, null);
INSERT INTO `type` VALUES ('4', 'CSS', null, '1', null, null, null);
INSERT INTO `type` VALUES ('5', 'JS', null, '1', null, null, null);
INSERT INTO `type` VALUES ('6', 'VUE', null, '1', null, null, null);
INSERT INTO `type` VALUES ('7', 'Spring Boot', null, '2', null, null, null);
INSERT INTO `type` VALUES ('8', 'Java', null, '2', null, null, null);
INSERT INTO `type` VALUES ('9', '并发', null, '2', null, null, null);
INSERT INTO `type` VALUES ('10', 'Linux', null, '3', null, null, null);
INSERT INTO `type` VALUES ('11', 'Shell', null, '3', null, null, null);
INSERT INTO `type` VALUES ('12', '岁的法国', null, '1', '2019-04-18 10:40:09', '2019-04-18 10:40:09', null);
INSERT INTO `type` VALUES ('16', 'zenm', '', '2', null, null, '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
