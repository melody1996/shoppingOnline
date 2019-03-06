/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-11-27 13:11:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `shopper_id` int(11) DEFAULT NULL,
  `consignee_name` varchar(255) DEFAULT NULL,
  `consignee_address` varchar(255) DEFAULT NULL,
  `consignee_phone` varchar(255) DEFAULT NULL,
  `consignee_postal_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`address_id`),
  KEY `buyer_id` (`shopper_id`),
  CONSTRAINT `buyer_id` FOREIGN KEY (`shopper_id`) REFERENCES `shopper` (`shopper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('10', '15', '李寻欢', '洛阳', '13352142312', '210000');
INSERT INTO `address` VALUES ('11', '15', '陆小凤', '河南', '18969107182', '100000');
INSERT INTO `address` VALUES ('19', '15', '叶孤城', '安徽省合肥市包河区中科大南校区', '13542353621', '300000');
INSERT INTO `address` VALUES ('20', '15', '沈璧君', '安徽省合肥市包河区中科大南校区', '15742365423', '300000');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `shopper_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_number` int(11) DEFAULT NULL,
  `goods_total_price` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `shopperid` (`shopper_id`),
  KEY `goodsId` (`goods_id`),
  CONSTRAINT `goodsId` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `shopperid` FOREIGN KEY (`shopper_id`) REFERENCES `shopper` (`shopper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('98', '15', '1', '1', '12799.00');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `shopper_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `comment_level` int(11) DEFAULT NULL,
  `comment_content` varchar(255) DEFAULT NULL,
  `comment_time` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `shopper_id` (`shopper_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `goods_id` FOREIGN KEY (`goods_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `shopper_id` FOREIGN KEY (`shopper_id`) REFERENCES `shopper` (`shopper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '15', '1', '5', '好评', null);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_price` float(10,2) DEFAULT NULL,
  `goods_stock` int(11) DEFAULT NULL,
  `goods_address` varchar(255) DEFAULT NULL,
  `goods_description` varchar(255) DEFAULT NULL,
  `goods_image_url` varchar(255) DEFAULT 'upload/headicon/default_goods.jpg',
  PRIMARY KEY (`goods_id`),
  KEY `shop_id` (`shop_id`),
  CONSTRAINT `shop_id` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '1', 'Apple iPhone Xs 512GB 银色特别版 移动联通电信4G手机', '12799.00', '601', '合肥', '\r\n    商品名称：Apple iPhone Xs\r\n    商品编号：6784494\r\n    商品毛重：380.00g\r\n    商品产地：中国大陆\r\n    多卡支持：双卡双待\r\n    网络制式：4G LTE全网通\r\n    机身内存：512GB\r\n    4G LTE网络特性：移动4G+\r\n', 'upload/headicon/iphone_Xs.jpg');
INSERT INTO `goods` VALUES ('2', '1', 'Apple iPhone 8 (A1863) 64GB 深空灰色 移动联通电信4G手机', '4699.00', '601', '庐阳', '\r\n    商品名称：AppleiPhone 8\r\n    商品编号：5089267\r\n    商品毛重：400.00g\r\n    商品产地：中国大陆\r\n    多卡支持：单卡单待\r\n    网络制式：4G LTE全网通\r\n    机身内存：64GB\r\n    4G LTE网络特性：移动4G+\r\n', 'upload/headicon/iphone8.jpg');
INSERT INTO `goods` VALUES ('3', '1', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机 ', '6999.00', '601', '合肥', '\r\n    商品名称：AppleiPhone X\r\n    商品编号：5089253\r\n    商品毛重：435.00g\r\n    商品产地：中国大陆\r\n    多卡支持：单卡单待\r\n    网络制式：4G LTE全网通\r\n    机身内存：64GB\r\n    4G LTE网络特性：移动4G+\r\n', 'upload/headicon/iphone_X.jpg');
INSERT INTO `goods` VALUES ('4', '1', 'Apple MacBook 12英寸笔记本电脑 银色', '10200.00', '601', '合肥', '商品名称：AppleMNYH2CH/A\r\n商品编号：4335135\r\n商品毛重：2.04kg\r\n商品产地：中国大陆\r\n系统：MAC\r\n分辨率：超高清屏（2K/3k/4K)\r\n显卡类别：集成显卡\r\n屏幕尺寸：其他\r\n', 'upload/headicon/Apple_MacBook.jpg');
INSERT INTO `goods` VALUES ('5', '1', 'Apple iPad Pro 12.9英寸平板电脑 ', '8099.00', '601', '合肥', '\r\n    商品名称：AppleiPad\r\n    商品编号：100000206134\r\n    商品毛重：1.43kg\r\n    商品产地：中国大陆\r\n    系统：ios系统\r\n    硬盘：64G\r\n    分辨率：超高清屏（2K/3K/4K）\r\n    尺寸：12.1英寸及以上\r\n    分类：娱乐平板\r\n    裸机重量：501g-700g\r\n    厚度：7.0mm以下\r\n', 'upload/headicon/Apple_iPad_Pro.jpg');
INSERT INTO `goods` VALUES ('6', '2', '大橙子', '4.20', '601', '山东', '菊花瓣适合泡茶', 'upload/headicon/default_goods.jpg');
INSERT INTO `goods` VALUES ('7', '2', '大表哥', '1.20', '601', '山东', '粉花瓣适合装饰', 'upload/headicon/default_goods.jpg');
INSERT INTO `goods` VALUES ('8', '2', '紫花瓣', '2.30', '601', '合肥', '紫花瓣适合装饰', 'upload/headicon/default_goods.jpg');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `shopper_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `order_number` varchar(255) DEFAULT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `good_id` int(11) DEFAULT NULL,
  `good_number` int(11) DEFAULT NULL,
  `order_total_price` float(10,2) DEFAULT NULL,
  `order_time` datetime DEFAULT NULL,
  `order_pay_way` varchar(255) DEFAULT '0' COMMENT '付款方式，0代表货到付款',
  `order_is_comfirm` int(11) DEFAULT '0' COMMENT '订单是否确认，0代表未确认，1代表已确认',
  `goods_is_sent` int(11) DEFAULT '0' COMMENT '商品是否发货，0代表未发货，1代表已发货',
  `goods_is_received` int(11) DEFAULT '0' COMMENT '买家是否收货，0代表未收货，1代表已收货',
  `goods_is_return` int(11) DEFAULT '0' COMMENT '订单是否取消，0代表未取消，1代表申请取消，2代表同意取消',
  `goods_is_commented` int(11) DEFAULT '0' COMMENT '商品是否评论，0代表未评论，1代表已评论',
  PRIMARY KEY (`order_id`),
  KEY `shopper_identity` (`shopper_id`),
  KEY `goods_identity` (`good_id`),
  KEY `address_id` (`address_id`),
  CONSTRAINT `address_id` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `goods_identity` FOREIGN KEY (`good_id`) REFERENCES `goods` (`goods_id`),
  CONSTRAINT `shopper_identity` FOREIGN KEY (`shopper_id`) REFERENCES `shopper` (`shopper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1398 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1383', '15', '19', '0015201811241124540001', '1', '1', '2', '25598.00', '2018-11-24 23:24:54', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1384', '15', '19', '0015201811241124540001', '1', '2', '1', '4699.00', '2018-11-24 23:24:54', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1385', '15', '20', '0015201811241124540002', '2', '6', '1', '4.20', '2018-11-24 23:24:54', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1386', '15', '19', '0015201811241125060001', '1', '1', '2', '25598.00', '2018-11-24 23:25:06', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1387', '15', '10', '0015201811241125060001', '1', '2', '1', '4699.00', '2018-11-24 23:25:06', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1388', '15', '19', '0015201811241125060002', '2', '6', '1', '4.20', '2018-11-24 23:25:06', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1389', '15', '10', '0015201811251108050001', '1', '1', '1', '12799.00', '2018-11-25 23:08:05', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1390', '15', '10', '0015201811251108050001', '1', '2', '1', '4699.00', '2018-11-25 23:08:05', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1391', '15', '20', '0015201811251108270001', '1', '4', '1', '10200.00', '2018-11-25 23:08:27', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1392', '15', '20', '0015201811251110010001', '1', '4', '1', '10200.00', '2018-11-25 23:10:01', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1393', '15', '20', '0015201811251116580001', '1', '1', '1', '12799.00', '2018-11-25 23:16:58', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1394', '15', '10', '0015201811251117340001', '1', '1', '1', '12799.00', '2018-11-25 23:17:34', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1395', '15', '10', '0015201811251117340002', '2', '7', '1', '1.20', '2018-11-25 23:17:34', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1396', '15', '10', '0015201811251118400001', '1', '1', '1', '12799.00', '2018-11-25 23:18:40', '0', '1', '0', '0', '0', '0');
INSERT INTO `orders` VALUES ('1397', '15', '10', '0015201811251118400002', '2', '7', '1', '1.20', '2018-11-25 23:18:40', '0', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `seller_phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `seller_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `seller_password` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `seller_id_card_no` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `seller_realname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES ('1', '张三', '13851347513', '562153215@qq.com', '123456', '370481199608034319', '徐程');
INSERT INTO `seller` VALUES ('12', '卖家Gwg4De', '15240011321', '1273540222@qq.com', '2117048', '370481199608034319', '徐程');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `shop_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `shop_address` varchar(255) DEFAULT NULL,
  `shop_description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shop_id`),
  KEY `seller_id` (`seller_id`),
  CONSTRAINT `seller_id` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', 'iphone旗舰店', '12', '合肥市', '花店');
INSERT INTO `shop` VALUES ('2', '空巢老人的晚年生活', '12', '合肥市', '花瓣');

-- ----------------------------
-- Table structure for shopper
-- ----------------------------
DROP TABLE IF EXISTS `shopper`;
CREATE TABLE `shopper` (
  `shopper_id` int(11) NOT NULL AUTO_INCREMENT,
  `shopper_name` varchar(255) DEFAULT NULL,
  `shopper_phone` varchar(255) DEFAULT NULL,
  `shopper_email` varchar(255) DEFAULT NULL,
  `shopper_password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`shopper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopper
-- ----------------------------
INSERT INTO `shopper` VALUES ('15', 'ρ=a(1+cosθ)', '18920146196', '1273540222@qq.com', '2117048');
INSERT INTO `shopper` VALUES ('19', '用户NZxq40', '13896324621', '1273540333@qq.com', '123456');
INSERT INTO `shopper` VALUES ('20', '用户266p7w', '18751342615', '991786517@qq.com', '123456');
