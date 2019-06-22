/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50087
Source Host           : localhost:3306
Source Database       : shops

Target Server Type    : MYSQL
Target Server Version : 50087
File Encoding         : 65001

Date: 2019-06-22 09:09:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for custominfo
-- ----------------------------
DROP TABLE IF EXISTS `custominfo`;
CREATE TABLE `custominfo` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `telphone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `demand` varchar(255) default NULL,
  `time` datetime NOT NULL,
  `uId` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custominfo
-- ----------------------------
INSERT INTO `custominfo` VALUES ('1556536628427', 'Bennett', '123456789', 'xx号寝室楼xxx', '辣一点', '2019-05-01 22:35:12', '384783742', '待收件');
INSERT INTO `custominfo` VALUES ('1556538289638', '李四先生', '1231214784', 'yyyB01', '不要葱', '2019-05-01 22:35:29', '384783742', '待收件');
INSERT INTO `custominfo` VALUES ('1556544610872', '王五先生', '1231412424', 'yyyB05', '别放辣', '2019-05-01 22:35:44', '627348672', '待收件');
INSERT INTO `custominfo` VALUES ('1557839724456', '马六先生', '18654334534', 'yyyB栋2楼', '', '2019-05-14 21:15:34', '627348672', '待收件');

-- ----------------------------
-- Table structure for custom_goods
-- ----------------------------
DROP TABLE IF EXISTS `custom_goods`;
CREATE TABLE `custom_goods` (
  `goodName` varchar(255) NOT NULL,
  `goodCount` int(11) NOT NULL,
  `goodPrice` double(10,2) NOT NULL,
  `id` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  KEY `id` USING BTREE (`id`),
  CONSTRAINT `for_key_id` FOREIGN KEY (`id`) REFERENCES `custominfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_goods
-- ----------------------------
INSERT INTO `custom_goods` VALUES ('火锅', '1', '15.00', '1556536628427', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('玉米粥', '3', '2.00', '1556536628427', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('麻辣香锅', '1', '9.00', '1556536628427', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('麻辣烫', '1', '8.00', '1556536628427', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('麻辣爆肚', '4', '8.00', '1556538289638', '龙湖餐厅1楼2号窗口');
INSERT INTO `custom_goods` VALUES ('肚兜兜饼', '2', '3.00', '1556544610872', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('麻辣香锅', '1', '9.00', '1556544610872', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('玉米粥', '1', '2.00', '1556544610872', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('火锅', '1', '15.00', '1557839724456', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('肯德基快乐套餐', '1', '20.00', '1557839724456', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('肚兜兜饼', '1', '3.00', '1557839724456', '龙湖餐厅1楼1号窗口');
INSERT INTO `custom_goods` VALUES ('燕麦牛奶粥', '1', '2.00', '1557839724456', '龙湖餐厅1楼1号窗口');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `gId` varchar(255) NOT NULL,
  `gname` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `foodImg` varchar(255) NOT NULL,
  `status` int(11) NOT NULL default '0',
  `cId` varchar(255) NOT NULL,
  PRIMARY KEY  (`gId`),
  KEY `cId` (`cId`),
  CONSTRAINT `goods_for_key` FOREIGN KEY (`cId`) REFERENCES `shop` (`cId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1556007590477', '原味烤肉饭', '8', 'imgs/foodImg/sdidf.jpg', '0', 's0003');
INSERT INTO `goods` VALUES ('g000000000008', '火锅', '15', 'imgs/foodImg/xixiakehuoguo.jpg', '0', 's0001');
INSERT INTO `goods` VALUES ('g00000000002', '麻辣爆肚', '8', 'imgs/foodImg/IMG_7764ttt.jpg', '1', 's0002');
INSERT INTO `goods` VALUES ('g00000005', '燕麦牛奶粥', '2', 'imgs/foodImg/apic7896.jpg', '1', 's0001');
INSERT INTO `goods` VALUES ('g0000003', '肥仔快乐套餐', '20', 'imgs/foodImg/ajio878a.jpg', '1', 's0001');
INSERT INTO `goods` VALUES ('g000001', '麻辣香锅', '9', 'imgs/foodImg/8748jrsirrrj.jpg', '1', 's0001');
INSERT INTO `goods` VALUES ('g000004', '肯德基快乐套餐', '20', 'imgs/foodImg/sfjiu3r7.jpg', '1', 's0001');
INSERT INTO `goods` VALUES ('g000006', '麻辣烫', '8', 'imgs/foodImg/malatang.jpg', '1', 's0001');
INSERT INTO `goods` VALUES ('g000007', '肚兜兜饼', '3', 'imgs/foodImg/dudoubing.jpg', '0', 's0001');
INSERT INTO `goods` VALUES ('g1557577907763', '羊肉饸饹面', '10', 'imgs/foodImg/1557577906753.jpg', '0', 's1557577906739');
INSERT INTO `goods` VALUES ('g1557577907778', '牛肉饸饹面', '9', 'imgs/foodImg/1557577906768.jpg', '0', 's1557577906739');
INSERT INTO `goods` VALUES ('g1557577907791', '大肉饸饹面', '9', 'imgs/foodImg/1557577906782.jpg', '0', 's1557577906739');

-- ----------------------------
-- Table structure for restaurant
-- ----------------------------
DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `rId` int(11) NOT NULL auto_increment,
  `rName` varchar(255) NOT NULL,
  PRIMARY KEY  (`rId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of restaurant
-- ----------------------------
INSERT INTO `restaurant` VALUES ('1', '龙湖餐厅');
INSERT INTO `restaurant` VALUES ('2', '榕苑餐厅');
INSERT INTO `restaurant` VALUES ('3', '北区新餐厅');
INSERT INTO `restaurant` VALUES ('4', '中区新餐厅');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `cId` varchar(255) NOT NULL,
  `rId` int(11) NOT NULL,
  `shopName` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL default '',
  `uid` varchar(255) NOT NULL,
  PRIMARY KEY  (`cId`),
  KEY `cId` (`cId`),
  KEY `cId_2` (`cId`),
  KEY `cId_3` (`cId`),
  KEY `cId_4` (`cId`),
  KEY `cId_5` (`cId`),
  KEY `cId_6` (`cId`),
  KEY `cId_7` (`cId`),
  KEY `cId_8` (`cId`),
  KEY `cId_9` (`cId`),
  KEY `uId` (`uid`),
  CONSTRAINT `shop_for_key` FOREIGN KEY (`uid`) REFERENCES `user` (`uId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('s0001', '1', '遇见麻辣香锅', '美食', '龙湖餐厅1楼1号窗口', 'imgs/shopLogo/jfiu8r49.jpg', '已审核', '18668686868');
INSERT INTO `shop` VALUES ('s0002', '1', '杨记豆皮', '美食', '龙湖餐厅1楼2号窗口', 'imgs/shopLogo/u24389js.jpg', '已审核', '13973473647');
INSERT INTO `shop` VALUES ('s0003', '1', '德克士', '快餐', '龙湖餐厅1楼3号窗口', 'imgs/shopLogo/siif32848.jpg', '已审核', '15183483838');
INSERT INTO `shop` VALUES ('s0004', '1', '肯德基', '快餐', '龙湖餐厅1楼4号窗口', 'imgs/shopLogo/sjifu8e38.jpg', '已审核', '15273434637');
INSERT INTO `shop` VALUES ('s0005', '1', '小孟麻辣烫', '美食', '龙湖餐厅1楼5号窗口', 'imgs/shopLogo/xiaomeng.jpg', '已审核', '18473878343');
INSERT INTO `shop` VALUES ('s0006', '2', '咪哆咪哆', '美食', '榕苑餐厅1楼1号窗口', 'imgs/shopLogo/hsuife38.jpg', '已审核', '18763636327');
INSERT INTO `shop` VALUES ('s0007', '3', '肚兜饼', '美食', '北区新餐厅2楼1号窗口', 'imgs/shopLogo/dudou.jpg', '已审核', '19976347630');
INSERT INTO `shop` VALUES ('s0008', '4', '喜虾客', '美食', '中区新餐厅1楼20号窗口', 'imgs/shopLogo/xixiake.jpg', '已审核', '18839483933');
INSERT INTO `shop` VALUES ('s1557577906739', '2', '张记饸饹面', '美食', '榕苑餐厅1楼3号窗口', 'imgs/shopLogo/1557577906728.jpg', '待审核', '18778788789');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uId` varchar(255) NOT NULL,
  `uName` varchar(255) NOT NULL,
  `pswd` varchar(255) NOT NULL,
  `tag` int(255) NOT NULL default '1',
  PRIMARY KEY  (`uId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123456', 'admin', 'root', '0');
INSERT INTO `user` VALUES ('13973473647', '赵四', '13973473647', '2');
INSERT INTO `user` VALUES ('15183483838', '李白', '15183483838', '2');
INSERT INTO `user` VALUES ('15273434637', '费甚', '15273434637', '2');
INSERT INTO `user` VALUES ('1542374787', '李斯', '1542374787', '1');
INSERT INTO `user` VALUES ('18473878343', '胡大力', '18473878343', '2');
INSERT INTO `user` VALUES ('18668686868', '李四', '18668686868', '2');
INSERT INTO `user` VALUES ('18763636327', '郭利斯', '18763636327', '2');
INSERT INTO `user` VALUES ('18778788789', '张三', '18778788789', '2');
INSERT INTO `user` VALUES ('18839483933', '王五', '18839483933', '2');
INSERT INTO `user` VALUES ('19976347630', '金思思', '19976347637', '2');
INSERT INTO `user` VALUES ('384783742', 'Bennett', '384783742', '0');
INSERT INTO `user` VALUES ('483274823', '马六', '483274823', '1');
INSERT INTO `user` VALUES ('627348672', '田七', '627348672', '1');
