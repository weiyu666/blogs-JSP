/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2016-12-15 13:37:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admininfo
-- ----------------------------
DROP TABLE IF EXISTS `admininfo`;
CREATE TABLE `admininfo` (
  `adminid` int(11) NOT NULL,
  `adminname` varchar(20) CHARACTER SET utf8 NOT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `regtime` datetime NOT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of admininfo
-- ----------------------------
INSERT INTO `admininfo` VALUES ('1', 'admin', 'admin', null, null, null, '2010-03-17 10:27:06');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `pdid` int(11) NOT NULL,
  `comment` varchar(200) CHARACTER SET utf8 NOT NULL,
  `commenttime` datetime NOT NULL,
  `flag` tinyint(4) NOT NULL DEFAULT '0' COMMENT '评论分类标记位 0:图片 1:日志',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`commentid`),
  KEY `userid` (`userid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', '天气不错真的很不错啊啊啊啊天气晴气温合适', '2010-03-19 10:31:14', '0', null);
INSERT INTO `comment` VALUES ('3', '1', '1', 'heihei', '2010-03-26 10:32:10', '0', null);
INSERT INTO `comment` VALUES ('4', '1', '1', 'bucuobucuo', '2010-03-24 10:07:02', '1', null);
INSERT INTO `comment` VALUES ('5', '1', '1', 'love', '2010-03-26 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('6', '1', '1', 'love', '2010-03-26 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('10', '1', '1', '啊斯蒂芬', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('11', '1', '1', '啊斯蒂芬', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('15', '1', '12', '大多数的', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('16', '1', '12', '啊斯蒂芬', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('17', '1', '12', '啊斯蒂芬', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('18', '1', '12', '使得法国', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('19', '1', '13', '啊斯蒂芬', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('20', '1', '13', '啊斯蒂芬', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('21', '1', '13', '阿萨德', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('22', '1', '13', '士大夫', '2010-04-02 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('23', '1', '11', '123213', '2010-04-06 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('24', '1', '11', '123213', '2010-04-06 00:00:00', '1', null);
INSERT INTO `comment` VALUES ('26', '1', '31', '啊', '2010-04-13 00:00:00', '0', null);
INSERT INTO `comment` VALUES ('27', '1', '31', '是', '2010-04-13 00:00:00', '0', null);
INSERT INTO `comment` VALUES ('28', '1', '31', '分', '2010-04-13 00:00:00', '0', null);
INSERT INTO `comment` VALUES ('30', '1', '31', '啊对司法', '2010-04-13 00:00:00', '0', null);
INSERT INTO `comment` VALUES ('31', '1', '31', '你说呢\r\n', '2010-04-13 00:00:00', '0', null);
INSERT INTO `comment` VALUES ('32', '1', '31', 'adf ', '2010-04-13 16:49:26', '0', null);
INSERT INTO `comment` VALUES ('42', '1', '25', 'asd', '2010-05-25 15:14:38', '0', null);
INSERT INTO `comment` VALUES ('43', '1', '25', 'asdf', '2010-05-25 15:14:41', '0', null);
INSERT INTO `comment` VALUES ('44', '1', '25', 'adf', '2010-05-25 15:14:43', '0', null);
INSERT INTO `comment` VALUES ('45', '1', '25', 'adsf', '2010-05-25 15:14:45', '0', null);
INSERT INTO `comment` VALUES ('47', '1', '35', 'asdf', '2010-05-25 15:59:58', '0', null);
INSERT INTO `comment` VALUES ('48', '1', '35', 'asdf', '2010-05-25 15:59:59', '0', null);
INSERT INTO `comment` VALUES ('51', '1', '14', 'adfadsf', '2010-05-26 20:57:12', '1', null);
INSERT INTO `comment` VALUES ('52', '1', '14', 'asdf', '2010-05-26 20:57:14', '1', null);
INSERT INTO `comment` VALUES ('53', '1', '14', 'asdf', '2010-05-26 20:57:16', '1', null);
INSERT INTO `comment` VALUES ('54', '1', '14', 'asdf', '2010-05-26 20:57:19', '1', null);
INSERT INTO `comment` VALUES ('55', '1', '14', 'adsf', '2010-05-27 17:42:02', '1', null);
INSERT INTO `comment` VALUES ('56', '1', '26', 'asdf', '2010-05-27 17:42:28', '0', null);
INSERT INTO `comment` VALUES ('57', '1', '26', 'asdf', '2010-05-27 17:42:32', '0', null);
INSERT INTO `comment` VALUES ('58', '1', '14', 'adsf', '2010-05-27 20:27:57', '1', null);
INSERT INTO `comment` VALUES ('59', '1', '14', 'asf', '2010-05-27 20:28:01', '1', null);
INSERT INTO `comment` VALUES ('60', '1', '31', 'asf', '2010-05-27 20:28:28', '0', null);
INSERT INTO `comment` VALUES ('61', '1', '14', 'heihei', '2010-05-31 19:51:03', '1', null);
INSERT INTO `comment` VALUES ('62', '0', '14', 'hahaha', '2010-05-31 19:57:54', '1', null);
INSERT INTO `comment` VALUES ('63', '2', '14', '1231', '2010-05-31 20:32:16', '1', null);
INSERT INTO `comment` VALUES ('64', '2', '0', 'asdf', '2010-05-31 20:34:00', '1', null);
INSERT INTO `comment` VALUES ('65', '2', '15', '啊的身份', '2010-05-31 20:57:29', '1', null);
INSERT INTO `comment` VALUES ('66', '2', '16', 'asdfadf', '2010-05-31 21:03:08', '1', null);
INSERT INTO `comment` VALUES ('67', '2', '16', 'asdf', '2010-05-31 21:03:12', '1', null);
INSERT INTO `comment` VALUES ('68', '0', '25', 'adsf', '2010-05-31 21:04:03', '0', null);
INSERT INTO `comment` VALUES ('69', '0', '25', 'asdf', '2010-05-31 21:04:06', '0', null);
INSERT INTO `comment` VALUES ('70', '0', '25', 'asdf', '2010-05-31 21:04:09', '0', null);
INSERT INTO `comment` VALUES ('71', '0', '25', '啊斯蒂芬', '2010-05-31 21:04:22', '0', null);
INSERT INTO `comment` VALUES ('72', '0', '25', '啊斯蒂芬', '2010-05-31 21:04:25', '0', null);
INSERT INTO `comment` VALUES ('74', '0', '33', 'asdf', '2010-05-31 21:04:53', '0', null);
INSERT INTO `comment` VALUES ('75', '0', '30', 'asfd', '2010-05-31 21:23:50', '0', null);
INSERT INTO `comment` VALUES ('76', '2', '30', 'adf', '2010-05-31 21:28:12', '0', null);
INSERT INTO `comment` VALUES ('77', '2', '31', 'asdf', '2010-05-31 21:29:50', '0', null);
INSERT INTO `comment` VALUES ('80', '0', '36', '阿道夫', '2010-06-03 09:11:42', '0', null);
INSERT INTO `comment` VALUES ('81', '0', '36', '阿道夫', '2010-06-03 09:11:45', '0', null);
INSERT INTO `comment` VALUES ('82', '0', '37', '啊斯蒂芬', '2010-06-03 09:47:00', '0', null);
INSERT INTO `comment` VALUES ('83', '0', '37', '撒旦法', '2010-06-03 09:47:03', '0', null);
INSERT INTO `comment` VALUES ('84', '0', '39', '阿凡达', '2010-06-03 16:39:55', '0', null);
INSERT INTO `comment` VALUES ('85', '0', '39', '发达省份', '2010-06-03 16:39:56', '0', null);
INSERT INTO `comment` VALUES ('86', '0', '39', '阿道夫', '2010-06-03 16:40:02', '0', null);
INSERT INTO `comment` VALUES ('88', '0', '14', 'asdf ', '2010-06-06 14:50:55', '1', null);
INSERT INTO `comment` VALUES ('89', '0', '14', 'adf', '2010-06-06 14:51:47', '1', null);
INSERT INTO `comment` VALUES ('95', '0', '14', 'asdf', '2010-06-06 18:34:29', '1', null);
INSERT INTO `comment` VALUES ('100', '1', '38', '不错', '2010-06-06 18:53:03', '0', null);
INSERT INTO `comment` VALUES ('101', '1', '41', '阿道夫', '2010-06-07 21:35:42', '0', null);
INSERT INTO `comment` VALUES ('102', '1', '41', '啊斯蒂芬', '2010-06-07 21:35:45', '0', null);
INSERT INTO `comment` VALUES ('104', '1', '28', '啊的身份', '2010-06-07 21:37:25', '0', null);
INSERT INTO `comment` VALUES ('105', '1', '16', '啊斯蒂芬', '2010-06-07 21:37:35', '1', null);
INSERT INTO `comment` VALUES ('108', '0', '32', 'asdfasf', '2010-06-07 22:08:58', '0', null);
INSERT INTO `comment` VALUES ('109', '0', '32', 'asdf', '2010-06-07 22:09:02', '0', null);
INSERT INTO `comment` VALUES ('110', '0', '32', 'sdaf', '2010-06-07 22:09:05', '0', null);
INSERT INTO `comment` VALUES ('111', '1', '16', '啊斯蒂芬啊', '2010-06-07 22:11:46', '1', null);
INSERT INTO `comment` VALUES ('112', '0', '1', 'asdfsa', '2010-06-09 14:32:13', '1', null);
INSERT INTO `comment` VALUES ('113', '0', '32', 'sadfsdaf', '2010-06-09 14:32:36', '0', null);

-- ----------------------------
-- Table structure for daily
-- ----------------------------
DROP TABLE IF EXISTS `daily`;
CREATE TABLE `daily` (
  `dailyid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `dailyname` varchar(30) NOT NULL,
  `daily` text NOT NULL,
  `postingdate` datetime NOT NULL,
  `modifytime` datetime DEFAULT NULL,
  `keyword` varchar(20) DEFAULT NULL,
  `tab` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dailyid`),
  KEY `userid` (`userid`),
  CONSTRAINT `daily_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of daily
-- ----------------------------
INSERT INTO `daily` VALUES ('1', '1', '天气不错1111', '<P>1111111</P>', '2010-03-17 00:00:00', '2010-06-09 00:00:00', null, null);
INSERT INTO `daily` VALUES ('2', '1', 'love', '<?=$content?>beautiful', '2010-03-26 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('3', '1', 'time', '<?=$content?>time', '2010-03-26 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('4', '1', 'shimamamam', '<P>shimamamamam</P>', '2010-03-26 00:00:00', '2010-06-06 00:00:00', null, null);
INSERT INTO `daily` VALUES ('5', '1', '?????§', '<P>??????</P>', '2010-03-26 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('7', '1', '天气', '<?=$content?>天气不错', '2010-04-02 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('8', '1', '啊斯蒂芬啊斯蒂芬', '<P>啊斯蒂芬啊斯44444</P>', '2010-04-02 00:00:00', '2010-04-02 00:00:00', null, null);
INSERT INTO `daily` VALUES ('9', '1', 'asdfasdf', '<?=$content?>asdfasdf', '2010-04-02 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('10', '1', '婷婷婷婷婷婷婷婷', '<P><?=$content?>他吞吞吐吐吐吐吐吐</P>', '2010-04-02 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('11', '1', '啊斯蒂芬啊是', '<?=$content?>阿萨德法师地方 ', '2010-04-02 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('12', '1', '啊但是发啊斯蒂芬啊是', '<?=$content?>分萨芬的撒旦发撒旦富士达', '2010-04-02 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('13', '1', '啊斯蒂芬', '<?=$content?>阿萨德分', '2010-04-02 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('14', '1', 'update test1', '<P><?=$content?>sdfasdfa</P>\r\n<P>asdfasdf</P>\r\n<P>asdfasf</P>\r\n<P>a</P>\r\n<P>asdfa</P>\r\n<P>asdf</P>\r\n<P>asdf</P>\r\n<P>asdf</P>\r\n<P>asdf</P>\r\n<P>天气不错啊大</P>\r\n<P>&nbsp;</P>', '2010-05-26 00:00:00', '2010-05-31 00:00:00', null, null);
INSERT INTO `daily` VALUES ('16', '2', '啊都是发达', '<?=$content?>啊师傅大苏打粉阿萨德法师', '2010-05-31 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('17', '1', '天气不错啊', '<P>是的，天气不错嘿嘿嘿<?=$content?></P>', '2010-06-07 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('18', '1', '啊是的发生的', '<?=$content?>阿朵所发生', '2010-06-07 00:00:00', null, null, null);
INSERT INTO `daily` VALUES ('19', '1', '哈哈哈哈哈哈哈', '我爱你啊王翔', '2010-06-09 00:00:00', null, null, null);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `messageid` int(11) NOT NULL,
  `blogid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `messagetime` datetime NOT NULL,
  `messagename` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `userid` (`userid`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('5', '1', '0', 'asdf', '2010-04-19 11:59:49', null);
INSERT INTO `message` VALUES ('7', '1', '0', 'sadf', '2010-04-19 11:59:54', null);
INSERT INTO `message` VALUES ('8', '1', '0', 'asdf', '2010-04-19 11:59:57', null);
INSERT INTO `message` VALUES ('9', '1', '0', 'asdf', '2010-04-19 11:59:59', null);
INSERT INTO `message` VALUES ('14', '1', '0', 'asdf', '2010-05-27 10:35:30', null);
INSERT INTO `message` VALUES ('16', '1', '0', 'adsf', '2010-05-27 10:35:33', null);
INSERT INTO `message` VALUES ('18', '1', '0', 'asdfasdaf', '2010-05-27 22:13:28', null);
INSERT INTO `message` VALUES ('19', '1', '0', '啊是的发生\r\n', '2010-05-27 22:13:35', null);
INSERT INTO `message` VALUES ('20', '1', '0', '阿斯顿法守法', '2010-05-27 22:13:55', null);
INSERT INTO `message` VALUES ('21', '1', '0', '阿斯顿发疯似的', '2010-05-27 22:14:00', null);
INSERT INTO `message` VALUES ('22', '1', '0', 'a', '2010-05-27 22:20:12', null);
INSERT INTO `message` VALUES ('23', '1', '1', 'asdf', '2010-05-27 22:26:22', null);
INSERT INTO `message` VALUES ('24', '1', '1', 'asdf', '2010-05-27 22:26:25', null);
INSERT INTO `message` VALUES ('25', '1', '0', 'asdf', '2010-05-27 22:26:50', null);
INSERT INTO `message` VALUES ('26', '1', '0', 'asdf', '2010-05-27 22:26:55', null);
INSERT INTO `message` VALUES ('27', '1', '1', 'asdfas', '2010-05-27 22:27:17', null);
INSERT INTO `message` VALUES ('28', '2', '2', 'adf', '2010-05-31 20:35:33', null);
INSERT INTO `message` VALUES ('38', '1', '1', '哈哈', '2010-06-06 18:52:54', null);
INSERT INTO `message` VALUES ('39', '1', '0', 'asdf', '2010-06-07 18:31:43', null);
INSERT INTO `message` VALUES ('40', '1', '0', 'fdaasd', '2010-06-07 18:31:48', null);
INSERT INTO `message` VALUES ('41', '2', '1', '发', '2010-06-07 21:37:49', null);

-- ----------------------------
-- Table structure for photoalbum
-- ----------------------------
DROP TABLE IF EXISTS `photoalbum`;
CREATE TABLE `photoalbum` (
  `albumid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `albumname` varchar(30) CHARACTER SET utf8 NOT NULL,
  `albumdepict` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '相册描述',
  `createtime` datetime NOT NULL,
  `keyword` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`albumid`),
  KEY `userid` (`userid`),
  CONSTRAINT `photoalbum_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of photoalbum
-- ----------------------------
INSERT INTO `photoalbum` VALUES ('1', '1', '哈天气不错', '嗯啊是', '2010-03-19 10:33:00', null);
INSERT INTO `photoalbum` VALUES ('2', '1', '嘿嘿', '啊斯蒂芬', '2010-05-25 12:50:34', null);
INSERT INTO `photoalbum` VALUES ('6', '1', '测试名称', '测试描述', '2010-06-03 09:46:25', null);
INSERT INTO `photoalbum` VALUES ('8', '2', '啊啊啊', '啊啊', '2010-06-03 16:44:52', null);
INSERT INTO `photoalbum` VALUES ('9', '1', '嘿嘿·', 'HOHO', '2010-06-06 14:52:53', null);
INSERT INTO `photoalbum` VALUES ('10', '1', 'heihei', 'heihei', '2010-06-07 21:34:49', null);

-- ----------------------------
-- Table structure for photoinfo
-- ----------------------------
DROP TABLE IF EXISTS `photoinfo`;
CREATE TABLE `photoinfo` (
  `photoid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `albumid` int(11) NOT NULL,
  `photoname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `photoaddress` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `photodepict` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片描述',
  `uploadtime` datetime NOT NULL,
  `keyword` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`photoid`),
  KEY `userid` (`userid`),
  KEY `albumid` (`albumid`),
  CONSTRAINT `photoinfo_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `userinfo` (`userid`),
  CONSTRAINT `photoinfo_ibfk_2` FOREIGN KEY (`albumid`) REFERENCES `photoalbum` (`albumid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of photoinfo
-- ----------------------------
INSERT INTO `photoinfo` VALUES ('27', '1', '1', '不是！！！', '\\blog\\image\\Desert.jpg', '是的！！！', '2010-04-13 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('28', '1', '1', '八仙花', '\\blog\\image\\Hydrangeas.jpg', '八仙花。。', '2010-04-13 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('29', '1', '1', '考拉！', 'C:\\Program Files\\Apache Software Foundation\\tomcat 6.0.24\\webapps\\blog\\image\\Koala.jpg', '考拉 ！', '2010-04-13 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('30', '1', '1', '还是考拉！', '/blog/image/Koala.jpg', '还是考拉！考拉！', '2010-04-13 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('31', '1', '2', '企鹅', '/blog/image/Penguins.jpg', '且', '2010-04-13 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('32', '1', '1', '嘿嘿嘿', '/blog/image/Winter.jpg', '嘿嘿', '2010-05-25 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('33', '1', '1', '嘿嘿嘿嘿', '/blog/image/Winter.jpg', '啊哈哈哈', '2010-05-25 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('35', '1', '2', 'asdfaf', '/blog/image/Blue hills.jpg', 'adaaa', '2010-05-25 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('37', '1', '6', '测试名称', '/blog/image/Sunset.jpg', '测试描述', '2010-06-03 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('38', '1', '1', '啊', '/blog/image/Water lilies.jpg', '啊', '2010-06-03 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('40', '2', '8', '111', '/blog/image/Winter.jpg', '22', '2010-06-03 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('41', '1', '10', '测试名字', '/blog/image/Winter.jpg', '测试描述', '2010-06-07 00:00:00', null);
INSERT INTO `photoinfo` VALUES ('42', '1', '1', '最新图片', '/blog/image/Sunset.jpg', '啊是的发生的', '2010-06-09 00:00:00', null);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `userid` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blogname` varchar(30) CHARACTER SET utf8 NOT NULL,
  `blogsign` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `sex` tinyint(4) DEFAULT '0',
  `province` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `regtime` datetime NOT NULL,
  `profile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '个人简介',
  `delflag` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('0', 'view', '游客', 'test', null, 'test', null, null, '0', null, null, null, null, 'test', null, '2010-04-16 10:01:06', null, '1');
INSERT INTO `userinfo` VALUES ('1', 'testtest', '嘿嘿嘿', '多来点啊', null, '12312321', null, null, '0', null, null, null, null, 'xxxxx@gmail.com', null, '2010-03-16 00:00:00', null, '1');
INSERT INTO `userinfo` VALUES ('2', 'thx4u', '测试1', '哈哈哈', null, '123123123', null, null, '0', null, null, null, null, 'xxxxx@gmail.com', null, '2010-03-18 16:01:09', null, '1');
INSERT INTO `userinfo` VALUES ('3', '123124', '测试2', '好哦好哦好哦', null, '13124214', null, null, '0', null, null, null, null, 'xxxxx@yahoo.com.cn', null, '2010-03-25 16:01:18', null, '1');
INSERT INTO `userinfo` VALUES ('4', '8898', 'HOHO', '嘿嘿嘿', null, '1231212512', null, null, '0', null, null, null, null, 'zol.com', null, '2010-03-19 16:02:51', null, '1');
INSERT INTO `userinfo` VALUES ('5', '1111111', '啊是的发生反对', '3231', null, '124124214', null, null, '0', null, null, null, null, 'pchome', null, '2010-03-02 16:27:47', null, '1');
INSERT INTO `userinfo` VALUES ('6', 'chg880918', '天气不错', '阿斯顿法', null, '123', null, null, '0', null, null, null, null, 'xxxxx@gmail.com', null, '2010-04-14 10:18:07', null, '1');
INSERT INTO `userinfo` VALUES ('7', 'hha ', '恩恩恩', '啊打发打发', null, 'chg880918', null, null, '0', null, null, null, null, 'sfdaf', null, '2010-04-14 10:19:09', null, '1');
INSERT INTO `userinfo` VALUES ('8', 'cnbeta', '嘿嘿嘿', '爱爱爱啊哎', null, 'chg880918', null, null, '0', null, null, null, null, 'xxxxx@gmail.com', null, '2010-04-16 09:28:45', null, '1');
INSERT INTO `userinfo` VALUES ('10', 'asdfasfasf', '是啊', '啊斯蒂芬', null, 'asfdasdf', null, null, '0', null, null, null, null, '', null, '2010-05-27 17:35:54', null, '1');
INSERT INTO `userinfo` VALUES ('11', 'asdasdf', '不是', '啊啊啊啊啊', null, 'asdfasdf', null, null, '0', null, null, null, null, '', null, '2010-05-27 17:40:07', null, '1');
INSERT INTO `userinfo` VALUES ('12', 'xxxxx1', '昵称测试~', '天气不错', null, 'chg880918', null, null, '0', null, null, null, null, 'xxxxx@gmail.com', null, '2010-06-09 09:55:02', null, '1');
