/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : diancanhujiaozhuohao6

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2018-03-20 18:43:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `wct_address`
-- ----------------------------
DROP TABLE IF EXISTS `wct_address`;
CREATE TABLE `wct_address` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_address
-- ----------------------------

-- ----------------------------
-- Table structure for `wct_bill`
-- ----------------------------
DROP TABLE IF EXISTS `wct_bill`;
CREATE TABLE `wct_bill` (
  `id` int(11) NOT NULL auto_increment,
  `gids` varchar(100) default NULL,
  `price` varchar(100) default NULL,
  `user` varchar(100) default NULL,
  `uid` varchar(100) default NULL,
  `shop` varchar(100) default NULL,
  `bill` varchar(2000) default NULL,
  `openid` varchar(255) default NULL,
  `ndate` varchar(255) default NULL,
  `total` varchar(255) default NULL,
  `way` varchar(50) default NULL,
  `gnames` varchar(500) default NULL,
  `sid` varchar(10) default NULL,
  `tel` varchar(50) default NULL,
  `address` varchar(50) default NULL,
  `note` varchar(200) default NULL,
  `state` varchar(10) default NULL,
  `statecn` varchar(50) default NULL,
  `cuidan` varchar(255) default NULL,
  `todate` varchar(255) default NULL,
  `totime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_bill
-- ----------------------------
INSERT INTO `wct_bill` VALUES ('18', '6,7', null, '王波', '10', '', null, null, '2018-03-05', '155', null, '凉拌土豆丝,乌江鱼', '1', '15123385885', '', '备注信息', '已付款', '已付款', '未催单', '2018-03-05', '12:00~14:00');
INSERT INTO `wct_bill` VALUES ('19', '5,6', null, '王波', '10', '', null, null, '2018-03-05', '100', null, '水煮鱼,凉拌土豆丝', '1', '15123385885', '', '备注信息这里是订餐的同时订桌', '退单', '退单', '未催单', '2018-03-05', '16:00~18:00');
INSERT INTO `wct_bill` VALUES ('20', '5,7', null, 'bobo', '16', '', null, null, '2018-03-05', '123', null, '水煮鱼,乌江鱼', '', '15123385885', '', '备注信息', '退单', '退单', '未催单', '2018-03-05', '12:00~14:00');
INSERT INTO `wct_bill` VALUES ('21', '5,6', null, '王波', '10', '', null, null, '2018-03-05', '100', null, '水煮鱼,凉拌土豆丝', '', '15123385885', '', '备注信息', '退单', '退单', '未催单', '2018-03-05', '12:00~14:00');
INSERT INTO `wct_bill` VALUES ('24', '5, 8, 7', null, 'bozai', null, null, null, null, '2018-03-05 18:23:56', '190', null, '水煮鱼,西蓝花,乌江鱼', null, '15123385885', '002', '备注信息', '完成', '完成', null, null, null);
INSERT INTO `wct_bill` VALUES ('25', '6, 8, 7', null, 'bobo', null, null, null, null, '2018-03-05 18:31:06', '120', null, '凉拌土豆丝,西蓝花,乌江鱼', null, '15123385885', '002', '备注谢谢你', '完成', '完成', null, null, null);
INSERT INTO `wct_bill` VALUES ('26', '5, 7, 8', null, 'bobo2', null, null, null, null, '2018-03-05 18:32:46', '123', null, '水煮鱼,乌江鱼,西蓝花', null, '15123385885', '002', '备注信息', '完成', '完成', null, null, null);
INSERT INTO `wct_bill` VALUES ('27', '6, 7', null, '波仔', null, null, null, null, '2018-03-05 16:52:38', '50', null, '凉拌土豆丝,乌江鱼', null, '15123385885', '001', '备注信息', null, '待付款', null, null, null);
INSERT INTO `wct_bill` VALUES ('28', '5,6', null, '王波', '10', '', null, null, '2018-03-05', '166', null, '水煮鱼,凉拌土豆丝', '', '15123385885', '', '这里是备注信息', '完成', '完成', '未催单', '2018-03-05', '16:00~18:00');
INSERT INTO `wct_bill` VALUES ('29', '5', null, 'bobo', '16', '重庆菜馆', null, null, '2018-02-21', '34', null, '水煮鱼', '1', '15123385885', null, '备注信息', '未付款', '未付款', '未催单', '2018-03-21', '14:00~16:00');
INSERT INTO `wct_bill` VALUES ('30', '5,6', null, 'bobo', '16', '', null, null, '2018-03-06', '100', null, '水煮鱼,凉拌土豆丝', '', '15123385885', '', '这里是备注信息', '退单', '退单', '未催单', '2018-03-06', '14:00~16:00');
INSERT INTO `wct_bill` VALUES ('31', '5', null, 'bobo', '16', '', null, null, '2018-03-20', '68', null, '水煮鱼', '', '15123385885', '', '1', null, '未付款', '未催单', '2018-03-20', '10:00~12:00');
INSERT INTO `wct_bill` VALUES ('32', '6,5', null, 'bobo', '16', '', null, null, '2018-03-20', '234', null, '凉拌土豆丝,水煮鱼', '', '15123385885', '', '222', '完成', '完成', '未催单', '2018-03-20', '14:00~16:00');

-- ----------------------------
-- Table structure for `wct_dingzuo`
-- ----------------------------
DROP TABLE IF EXISTS `wct_dingzuo`;
CREATE TABLE `wct_dingzuo` (
  `id` int(11) NOT NULL auto_increment,
  `openid` varchar(200) default NULL,
  `username` varchar(200) default NULL,
  `renshu` varchar(20) default NULL,
  `xingming` varchar(200) default NULL,
  `shouji` varchar(200) default NULL,
  `shijian` varchar(200) default NULL,
  `todate` varchar(200) default NULL,
  `beizhu` varchar(600) default NULL,
  `shopid` varchar(200) default NULL,
  `shopname` varchar(200) default NULL,
  `ndate` varchar(200) default NULL,
  `type` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_dingzuo
-- ----------------------------
INSERT INTO `wct_dingzuo` VALUES ('1', '16', null, '5', '王波', '15123385885', '16:00~18:00', '2018-03-08', '备注信息', null, null, '2018-03-06', '1');

-- ----------------------------
-- Table structure for `wct_fuwu`
-- ----------------------------
DROP TABLE IF EXISTS `wct_fuwu`;
CREATE TABLE `wct_fuwu` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `note` varchar(500) default NULL,
  `state` varchar(50) default NULL,
  `username` varchar(50) default NULL,
  `ndate` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_fuwu
-- ----------------------------
INSERT INTO `wct_fuwu` VALUES ('5', '002', '加水', null, 'bozai', '2018-03-05 18:09:26');
INSERT INTO `wct_fuwu` VALUES ('6', '004', '加水', null, 'bozai', '2018-03-05 10:12:38');
INSERT INTO `wct_fuwu` VALUES ('7', '004', '呼叫', null, 'bozai', '2018-03-05 10:12:41');
INSERT INTO `wct_fuwu` VALUES ('8', '004(5-6人)', '加水', null, '王波', '2018-03-05 20:40:32');
INSERT INTO `wct_fuwu` VALUES ('9', '004(5-6人)', '加水', null, 'bobo', '2018-03-21 11:04:33');
INSERT INTO `wct_fuwu` VALUES ('10', '004(5-6人)', '呼叫', null, 'bobo', '2018-03-21 11:04:36');

-- ----------------------------
-- Table structure for `wct_good`
-- ----------------------------
DROP TABLE IF EXISTS `wct_good`;
CREATE TABLE `wct_good` (
  `id` int(11) NOT NULL auto_increment,
  `gname` varchar(100) default NULL,
  `price` varchar(10) default NULL,
  `jifen` varchar(10) default NULL,
  `note` varchar(500) default NULL,
  `type` varchar(50) default NULL,
  `img` varchar(500) default NULL,
  `count` int(11) default NULL,
  `typeid` varchar(10) default NULL,
  `xiaoliang` int(11) default NULL,
  `ownid` varchar(10) default NULL,
  `sid` varchar(10) default NULL,
  `shop` varchar(50) default NULL,
  `mcount` varchar(50) default NULL,
  `saleType` varchar(50) default NULL,
  `sale` varchar(20) default NULL,
  `shouye` int(11) default NULL,
  `zan` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_good
-- ----------------------------
INSERT INTO `wct_good` VALUES ('5', '水煮鱼', '34', null, '要说这鱼的味道，麻辣鲜香嫩可以概括之。水煮鱼选料讲究，精选无污染的花鲢鱼。这样的鱼肉质细嫩，吃起来口感特别好。而鲜花鲢鱼富含人体必备的脂肪酸、卵磷脂及多种微量元素，必须采用传统制作工艺才能更完整地保持这种营养。最重要的是其调料，10多种各种调料均匀搭配，配以各种鲜料如花椒、姜、葱等，精心烹制而成，此鱼在出桌时，尚未入口，已是鲜香扑鼻，令人食欲倍增。捞出香嫩的鱼头、鱼肉，不腥不臊，入口滑嫩，麻、辣、鲜、香、嫩，回味悠长，硬是筷子舍不得离手。', null, '25b019e0-8722-4b8c-8bf0-845cfb13.gif', '0', '4', '4', null, '1', '重庆菜馆', null, null, null, null, '2');
INSERT INTO `wct_good` VALUES ('6', '凉拌土豆丝', '66', null, '土豆是一种碱性蔬菜，有利于体内酸碱平衡，中和体内代谢后产生的酸性物质，从而有一定的美容、抗衰老作用。我们这里的土豆价格很便宜。一包十磅也就是4块钱。所以，每一次都买一大包回来。因为便宜也因为土豆的营养价值高，对于我来说，想保持身材适中，除了平时多锻炼多运动之外，多吃土豆也是不错的选择', null, '4e9ac733-3c87-4944-88b3-8544ea69.gif', '0', '4', '1', null, '1', '重庆菜馆', null, null, null, null, null);
INSERT INTO `wct_good` VALUES ('7', '乌江鱼', '89', null, '土豆是一种碱性蔬菜，有利于体内酸碱平衡，中和体内代谢后产生的酸性物质，从而有一定的美容、抗衰老作用。我们这里的土豆价格很便宜。一包十磅也就是4块钱。所以，每一次都买一大包回来。因为便宜也因为土豆的营养价值高，对于我来说，想保持身材适中，除了平时多锻炼多运动之外，多吃土豆也是不错的选择', null, '49525c20-59ef-41ba-9966-74953acb.gif', '0', '4', '1', null, '1', '重庆菜馆', null, null, null, null, '1');
INSERT INTO `wct_good` VALUES ('8', '西蓝花', '32', null, '炒制简单，原汁原味，鲜香碧绿，色泽诱人。不用加入芡粉汁也很入味.少油少水淀粉纸，比较适合减肥的人食用，热量低营养价值高。', null, 'eed05e99-f49e-4427-8ebe-f922d276.gif', '0', '4', '1', null, '1', '重庆菜馆', null, null, null, null, null);
INSERT INTO `wct_good` VALUES ('9', '回锅肉', '55', null, '这里是菜品的详细介绍', null, '0480a514-185c-4a23-be73-91e63e5c.gif', '0', '4', '0', null, '2', '辣妹子餐馆', null, null, null, null, null);
INSERT INTO `wct_good` VALUES ('10', '麻辣鱼', '34', null, '这里是菜品的详细介绍', null, 'f6f36ccd-0b47-4cff-9f48-56fc59cc.gif', '0', '4', '0', null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `wct_line`
-- ----------------------------
DROP TABLE IF EXISTS `wct_line`;
CREATE TABLE `wct_line` (
  `id` int(11) NOT NULL auto_increment,
  `bid` int(11) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_line
-- ----------------------------
INSERT INTO `wct_line` VALUES ('1', '3', '3');
INSERT INTO `wct_line` VALUES ('2', '4', '4');
INSERT INTO `wct_line` VALUES ('3', '5', '3');
INSERT INTO `wct_line` VALUES ('4', '6', '3');
INSERT INTO `wct_line` VALUES ('5', '7', '4');
INSERT INTO `wct_line` VALUES ('6', '8', '4');
INSERT INTO `wct_line` VALUES ('7', '9', '4');
INSERT INTO `wct_line` VALUES ('9', '11', '8');
INSERT INTO `wct_line` VALUES ('10', '12', '8');
INSERT INTO `wct_line` VALUES ('12', '14', '7');
INSERT INTO `wct_line` VALUES ('14', '16', '10');
INSERT INTO `wct_line` VALUES ('15', '17', '10');
INSERT INTO `wct_line` VALUES ('16', '18', '10');
INSERT INTO `wct_line` VALUES ('18', '29', '16');
INSERT INTO `wct_line` VALUES ('20', '31', '16');

-- ----------------------------
-- Table structure for `wct_notice`
-- ----------------------------
DROP TABLE IF EXISTS `wct_notice`;
CREATE TABLE `wct_notice` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  `note` varchar(500) default NULL,
  `ndate` varchar(50) default NULL,
  `type` varchar(50) default NULL,
  `img` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_notice
-- ----------------------------
INSERT INTO `wct_notice` VALUES ('1', '100', '猪肉20斤', '2018-03-05 18:46:02', null, null);

-- ----------------------------
-- Table structure for `wct_replay`
-- ----------------------------
DROP TABLE IF EXISTS `wct_replay`;
CREATE TABLE `wct_replay` (
  `id` int(11) NOT NULL auto_increment,
  `pid` varchar(10) default NULL,
  `note` varchar(500) default NULL,
  `uid` varchar(10) default NULL,
  `username` varchar(200) default NULL,
  `ndate` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_replay
-- ----------------------------
INSERT INTO `wct_replay` VALUES ('1', '5', '可以评论', '10', '王波', '2018-03-05 20:40:15');
INSERT INTO `wct_replay` VALUES ('2', '5', '这个菜好吃', '10', '王波', '2017-03-18 11:19:17');
INSERT INTO `wct_replay` VALUES ('3', '5', '不错', '10', '王波', '2018-03-05 16:59:31');
INSERT INTO `wct_replay` VALUES ('4', '5', '不错呵呵', '16', 'bobo', '2018-03-06 14:51:01');

-- ----------------------------
-- Table structure for `wct_room`
-- ----------------------------
DROP TABLE IF EXISTS `wct_room`;
CREATE TABLE `wct_room` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `note` varchar(500) default NULL,
  `state` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_room
-- ----------------------------
INSERT INTO `wct_room` VALUES ('5', '001(1-2人)', '1-2人桌', '空闲');
INSERT INTO `wct_room` VALUES ('6', '002(1-2人)', '1-2人桌', '空闲');
INSERT INTO `wct_room` VALUES ('7', '003(3-4人)', '3-4人桌', '空闲');
INSERT INTO `wct_room` VALUES ('8', '004(5-6人)', '5-6人桌,这里是管理理桌位都是很灵活的可以后台管理的', '空闲');
INSERT INTO `wct_room` VALUES ('9', '006(6-8人桌)', '靠窗的', '占用');
INSERT INTO `wct_room` VALUES ('10', '005(10人桌)', '靠窗的', '空闲');
INSERT INTO `wct_room` VALUES ('11', '007(10人桌)', '这里是座号备注', '占用');
INSERT INTO `wct_room` VALUES ('12', '008(10人桌)', '这里是桌号的说明', '空闲');

-- ----------------------------
-- Table structure for `wct_shop`
-- ----------------------------
DROP TABLE IF EXISTS `wct_shop`;
CREATE TABLE `wct_shop` (
  `id` int(11) NOT NULL auto_increment,
  `sname` varchar(100) default NULL,
  `img` varchar(500) default NULL,
  `note` varchar(500) default NULL,
  `address` varchar(500) default NULL,
  `longitude` varchar(100) default NULL,
  `latitude` varchar(100) default NULL,
  `tel` varchar(100) default NULL,
  `ownid` varchar(10) default NULL,
  `passwd` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_shop
-- ----------------------------
INSERT INTO `wct_shop` VALUES ('1', '重庆菜馆', '23e4df21-137f-4887-be05-ce7b61c0.gif', '万龙八易快餐厅一直全力打造集健康、美味、丰富、便捷为一体的综合性快餐模式,各地特色小吃,原汁原味,满足您挑剔的味蕾;更新开辟咖...', '重庆璧山区皮鞋城1路186号', null, null, '15123385885', '1', null);
INSERT INTO `wct_shop` VALUES ('2', '辣妹子餐馆', '3ad2a045-a947-41e5-972b-297e3064.gif', '万龙八易快餐厅一直全力打造集健康、美味、丰富、便捷为一体的综合性快餐模式,各地特色小吃,原汁原味,满足您挑剔的味蕾;更新开辟咖...', '重庆璧山区璧铜路4号', null, null, '18602394120', '1', null);
INSERT INTO `wct_shop` VALUES ('3', '湘菜馆', '1b0a97f1-78dc-4b87-9d48-92c3a51f.gif', '这里是事详细的店铺介绍', '重庆璧山区', null, null, '18602394120', '1', null);

-- ----------------------------
-- Table structure for `wct_type`
-- ----------------------------
DROP TABLE IF EXISTS `wct_type`;
CREATE TABLE `wct_type` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(500) default NULL,
  `ownid` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_type
-- ----------------------------
INSERT INTO `wct_type` VALUES ('4', '川菜', null);
INSERT INTO `wct_type` VALUES ('5', '湖南菜', null);
INSERT INTO `wct_type` VALUES ('6', '粤菜', null);
INSERT INTO `wct_type` VALUES ('7', '陕西菜', null);
INSERT INTO `wct_type` VALUES ('8', '甜点', null);

-- ----------------------------
-- Table structure for `wct_user`
-- ----------------------------
DROP TABLE IF EXISTS `wct_user`;
CREATE TABLE `wct_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(50) default NULL,
  `passwd` varchar(50) default NULL,
  `roletype` varchar(50) default NULL,
  `email` varchar(200) default NULL,
  `tel` varchar(50) default NULL,
  `qq` varchar(20) default NULL,
  `wechat` varchar(50) default NULL,
  `sex` varchar(20) default NULL,
  `birth` varchar(20) default NULL,
  `img` varchar(200) default NULL,
  `sid` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `openid` varchar(200) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_user
-- ----------------------------
INSERT INTO `wct_user` VALUES ('1', 'admin', 'admin', '1', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wct_user` VALUES ('10', '王波', '111111', '2', '', '15123385885', '543885', '888566', null, '2001-03-07', null, null, null, '1');
INSERT INTO `wct_user` VALUES ('11', '波仔', '111111', '2', null, '15123385885', null, null, null, null, null, null, null, null);
INSERT INTO `wct_user` VALUES ('12', '小凤', '111111', '2', null, '15123385885', null, null, null, null, null, null, null, null);
INSERT INTO `wct_user` VALUES ('16', 'bobo', '1111111', '2', '', '15123385885', '557888', '234234234', null, '', null, null, null, null);
INSERT INTO `wct_user` VALUES ('17', '前台', '1', '3', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `wct_user` VALUES ('18', '后厨', '1', '1', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `wct_vip`
-- ----------------------------
DROP TABLE IF EXISTS `wct_vip`;
CREATE TABLE `wct_vip` (
  `id` int(11) NOT NULL auto_increment,
  `qq` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `mobile` varchar(255) default NULL,
  `openid` varchar(255) default NULL,
  `vname` varchar(255) default NULL,
  `wname` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wct_vip
-- ----------------------------
