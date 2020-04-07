/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : newbee_mall_db

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 06/04/2020 23:47:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_newbee_mall_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_admin_user`;
CREATE TABLE `tb_newbee_mall_admin_user`  (
  `admin_user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `login_user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆名称',
  `login_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员登陆密码',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员显示昵称',
  `locked` tinyint(4) NULL DEFAULT 0 COMMENT '是否锁定 0未锁定 1已锁定无法登陆',
  PRIMARY KEY (`admin_user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_admin_user
-- ----------------------------
INSERT INTO `tb_newbee_mall_admin_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '十三', 0);
INSERT INTO `tb_newbee_mall_admin_user` VALUES (2, 'newbee-admin1', 'e10adc3949ba59abbe56e057f20f883e', '新蜂01', 0);
INSERT INTO `tb_newbee_mall_admin_user` VALUES (3, 'newbee-admin2', 'e10adc3949ba59abbe56e057f20f883e', '新蜂02', 0);

-- ----------------------------
-- Table structure for tb_newbee_mall_carousel
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_carousel`;
CREATE TABLE `tb_newbee_mall_carousel`  (
  `carousel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首页轮播图主键id',
  `carousel_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '轮播图',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '\'##\'' COMMENT '点击后的跳转地址(默认不跳转)',
  `carousel_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`carousel_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_carousel
-- ----------------------------
INSERT INTO `tb_newbee_mall_carousel` VALUES (2, 'http://localhost:28089/static/upload/20200404_14465845.jpg', 'https://baike.baidu.com/item/Java/85979?fr=aladdin', 0, 0, '2019-11-29 00:00:00', 0, '2020-04-04 14:47:04', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (5, 'http://localhost:28089/static/upload/20200404_14473178.jpg', 'https://baike.baidu.com/item/Python/407313?fr=aladdin', 2, 1, '2019-11-29 00:00:00', 0, '2020-04-05 12:38:04', 0);
INSERT INTO `tb_newbee_mall_carousel` VALUES (6, 'http://localhost:28089/admin/dist/img/img-upload.png', 'http://www.baidu.com', 1, 1, '2020-04-05 12:38:19', 0, '2020-04-05 12:39:52', 0);

-- ----------------------------
-- Table structure for tb_newbee_mall_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_goods_category`;
CREATE TABLE `tb_newbee_mall_goods_category`  (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `category_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '分类级别(1-一级分类 2-二级分类 3-三级分类)',
  `parent_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '父分类id',
  `category_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_goods_category
-- ----------------------------
INSERT INTO `tb_newbee_mall_goods_category` VALUES (15, 1, 0, '后台', 1, 0, '2019-09-11 18:45:40', 0, '2020-04-04 15:22:39', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (17, 2, 15, 'LANGUAGE', 0, 0, '2019-09-11 18:46:32', 1, '2020-04-04 15:49:11', 1);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (20, 3, 17, 'Java', 0, 0, '2019-09-11 18:47:38', 2, '2019-09-11 18:47:38', 2);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (21, 3, 17, 'C/C++', 0, 0, '2019-09-11 18:47:38', 3, '2019-09-11 18:47:38', 3);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (22, 3, 17, 'PHP', 0, 0, '2019-09-11 18:47:38', 4, '2019-09-11 18:47:38', 4);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (23, 3, 17, 'Unity', 0, 0, '2019-09-11 18:47:38', 5, '2019-09-11 18:47:38', 5);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (24, 3, 17, 'C#/.Net', 0, 0, '2019-09-11 18:47:38', 6, '2019-09-11 18:47:38', 6);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (25, 1, 0, '算法', 1, 0, '2019-09-11 18:45:40', 7, '2020-04-04 15:22:50', 7);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (26, 2, 25, 'CLOUD', 10, 0, '2019-09-11 18:46:32', 8, '2019-09-12 18:46:32', 8);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (27, 2, 25, 'BIG DATA', 0, 0, '2019-09-11 18:47:38', 9, '2019-09-12 18:47:38', 9);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (28, 2, 25, 'AI', 0, 0, '2019-09-11 18:47:38', 10, '2019-09-12 18:47:38', 10);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (29, 3, 26, 'AWS', 0, 0, '2019-09-11 18:47:38', 11, '2019-09-12 18:47:38', 11);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (30, 3, 26, 'IBM', 0, 0, '2019-09-11 18:47:38', 12, '2019-09-12 18:47:38', 12);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (31, 3, 26, 'ALIBABA', 0, 0, '2019-09-11 18:47:38', 13, '2019-09-12 18:47:38', 13);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (32, 3, 27, 'HUAZHENG', 0, 0, '2019-09-11 18:47:38', 14, '2019-09-12 18:47:38', 14);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (33, 3, 27, 'IBM', 0, 0, '2019-09-11 18:47:38', 15, '2019-09-12 18:47:38', 15);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (34, 3, 27, 'ALIBABA', 0, 0, '2019-09-11 18:47:38', 16, '2019-09-12 18:47:38', 16);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (35, 1, 0, '前端', 2, 0, '2020-04-04 07:22:09', 0, '2020-04-04 16:14:24', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (36, 1, 0, '移动开发', 1, 0, '2020-04-04 07:23:05', 0, '2020-04-04 15:23:25', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (37, 2, 15, 'SCRIPT', 1, 0, '2020-04-04 07:48:51', 0, '2020-04-04 15:49:22', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (38, 3, 37, 'Python', 0, 0, '2020-04-04 08:01:25', 0, '2020-04-04 08:01:25', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (39, 3, 37, 'Shell', 1, 0, '2020-04-04 08:01:35', 0, '2020-04-04 08:01:35', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (40, 3, 37, 'VB', 3, 0, '2020-04-04 08:01:48', 0, '2020-04-04 08:01:48', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (41, 3, 28, 'WASTON', 0, 0, '2020-04-04 08:02:32', 0, '2020-04-04 08:02:32', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (42, 2, 35, 'WEBFRANT-LANGUAGE', 0, 0, '2020-04-04 08:03:38', 0, '2020-04-04 08:03:38', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (43, 2, 35, 'WEBFRANT-FRAMEWORK', 1, 0, '2020-04-04 08:03:50', 0, '2020-04-04 16:04:00', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (44, 3, 42, 'HTML', 0, 0, '2020-04-04 08:04:18', 0, '2020-04-04 08:04:18', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (45, 3, 42, 'CSS', 1, 0, '2020-04-04 08:04:32', 0, '2020-04-04 08:04:32', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (46, 3, 42, 'JQUERY', 2, 0, '2020-04-04 08:04:43', 0, '2020-04-04 08:04:43', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (47, 3, 43, 'VUE', 0, 0, '2020-04-04 08:05:05', 0, '2020-04-04 08:05:05', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (48, 3, 43, 'ANGULAR', 1, 0, '2020-04-04 08:05:17', 0, '2020-04-04 08:05:17', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (49, 3, 43, 'ANGULARJS', 2, 0, '2020-04-04 08:05:30', 0, '2020-04-04 08:05:30', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (50, 2, 36, 'PLATFORM', 0, 0, '2020-04-04 08:05:59', 0, '2020-04-04 08:05:59', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (51, 3, 50, 'IOS', 0, 0, '2020-04-04 08:06:11', 0, '2020-04-04 08:06:11', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (52, 3, 50, 'ANDROID', 1, 0, '2020-04-04 08:06:23', 0, '2020-04-04 08:06:23', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (53, 1, 0, '测试', 0, 0, '2020-04-04 08:14:04', 0, '2020-04-04 08:14:04', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (54, 2, 53, 'FUN', 0, 0, '2020-04-04 08:15:24', 0, '2020-04-04 16:18:41', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (55, 2, 53, 'PRESSURE', 1, 0, '2020-04-04 08:15:54', 0, '2020-04-04 08:15:54', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (56, 2, 53, 'REST', 2, 0, '2020-04-04 08:16:10', 0, '2020-04-04 08:16:10', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (57, 3, 56, 'TEST', 0, 0, '2020-04-04 08:17:02', 0, '2020-04-04 08:17:02', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (58, 3, 55, 'TEST1', 0, 0, '2020-04-04 08:17:31', 0, '2020-04-04 08:17:31', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (59, 3, 54, 'TEST2', 0, 0, '2020-04-04 08:18:55', 0, '2020-04-04 08:18:55', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (60, 3, 42, 'Thymeleaf', 3, 0, '2020-04-04 11:15:27', 0, '2020-04-04 11:15:27', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (61, 3, 42, 'Bootstrap', 0, 0, '2020-04-04 11:15:46', 0, '2020-04-04 11:15:46', 0);
INSERT INTO `tb_newbee_mall_goods_category` VALUES (62, 3, 42, 'JavaScript', 0, 0, '2020-04-04 11:16:01', 0, '2020-04-04 11:16:01', 0);

-- ----------------------------
-- Table structure for tb_newbee_mall_goods_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_goods_info`;
CREATE TABLE `tb_newbee_mall_goods_info`  (
  `goods_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品表主键id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名',
  `goods_intro` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品简介',
  `goods_category_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联分类id',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品主图',
  `goods_carousel` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/admin/dist/img/no-img.png' COMMENT '商品轮播图',
  `goods_detail_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详情',
  `original_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品价格',
  `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '商品实际售价',
  `stock_num` int(11) NOT NULL DEFAULT 0 COMMENT '商品库存数量',
  `tag` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签',
  `goods_sell_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '商品上架状态 0-下架 1-上架',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '添加者主键id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '商品添加时间',
  `update_user` int(11) NOT NULL DEFAULT 0 COMMENT '修改者主键id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '商品修改时间',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10897 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_goods_info
-- ----------------------------
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10003, '安卓高级开发', '张三', 52, 'http://localhost:28089/static/upload/20200404_20033852.jpg', 'http://localhost:28089/static/upload/20200404_20033852.jpg', '移动开发<br />', 8888, 69999, 1000, 'mobile', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 20:03:40');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10004, 'JAVA程序语言与设计', '张宇', 20, 'http://localhost:28089/static/upload/20200404_20023240.jpg', 'http://localhost:28089/static/upload/20200404_20023240.jpg', 'java<br />', 8888, 69999, 1000, '高阶', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 20:02:34');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10005, 'JAVA工厂模式', '李杰', 20, 'http://localhost:28089/static/upload/20200404_20014253.jpg', 'http://localhost:28089/static/upload/20200404_20014253.jpg', 'java开发', 8888, 69999, 1000, 'java', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 20:01:44');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10006, '人工智能', 'Jack', 41, 'http://localhost:28089/static/upload/20200404_19594231.jpg', 'http://localhost:28089/static/upload/20200404_19594231.jpg', '人工智能<br />', 8888, 69999, 1000, 'AI', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 19:59:44');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10007, '阿里大数据', '李四', 34, 'http://localhost:28089/static/upload/20200404_1957307.jpg', 'http://localhost:28089/static/upload/20200404_1957307.jpg', '阿里大数据<br />', 8888, 69999, 1000, 'bigdata', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 19:57:32');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10008, 'Angular', '迪丽热巴', 49, 'http://localhost:28089/static/upload/20200404_19563748.jpg', 'http://localhost:28089/static/upload/20200404_19563748.jpg', '前端设计<br />', 8888, 69999, 1000, 'angular', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 19:56:39');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10009, 'JAVA程序语言与设计', '张宇', 49, 'http://localhost:28089/static/upload/20200404_19545269.jpg', 'http://localhost:28089/static/upload/20200404_19545269.jpg', 'java<br />', 8888, 69999, 1000, 'java', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 19:54:54');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10010, 'IBM 大数据', '王五', 33, 'http://localhost:28089/static/upload/20200404_19541419.jpg', 'http://localhost:28089/static/upload/20200404_19541419.jpg', 'IBM大数据<br />', 8888, 69999, 1000, 'bigdata', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 19:54:16');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10011, 'Angular进阶版', '王杰', 49, 'http://localhost:28089/static/upload/20200404_19403270.jpg', 'http://localhost:28089/static/upload/20200404_19403270.jpg', '前端框架<br />', 8888, 69999, 1000, 'angularJS', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 19:40:35');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10012, 'PHP', '席杰', 22, 'http://localhost:28089/static/upload/20200404_19321182.jpg', 'http://localhost:28089/static/upload/20200404_19321182.jpg', 'PHP开发<br />', 8888, 69999, 1000, 'php', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 19:32:13');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10013, 'Bootstrap', '凌杜江', 61, 'http://localhost:28089/static/upload/20200404_19293679.jpg', 'http://localhost:28089/static/upload/20200404_19293679.jpg', '前端框架<br />', 4500, 4500, 1000, 'web front', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 19:29:38');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10014, '自动化测试', '张飞', 59, 'http://localhost:28089/static/upload/20200404_16561929.jpg', 'http://localhost:28089/static/upload/20200404_16561929.jpg', '自动化测试<br />', 3999, 3999, 1000, 'test', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 16:56:21');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10015, '软件测试', 'Jasper', 57, 'http://localhost:28089/static/upload/20200404_16530786.jpg', 'http://localhost:28089/static/upload/20200404_16530786.jpg', '接口测试<br />', 4500, 4500, 1000, 'test', 0, 0, '2019-09-18 13:18:47', 0, '2020-04-04 16:53:09');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10853, 'AngularJS', '李成', 49, 'http://localhost:28089/static/upload/20200404_20050347.jpg', 'http://localhost:28089/static/upload/20200404_20050347.jpg', '前端<br />', 1299, 1068, 1000, 'angularJS', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 20:05:05');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10854, '亚马逊云', '戚薇', 29, 'http://localhost:28089/static/upload/20200404_20004035.jpg', 'http://localhost:28089/static/upload/20200404_20004035.jpg', '亚马逊云<br />', 1799, 1599, 1000, 'could', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 20:00:42');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10855, 'CSS3', '肖战', 45, 'http://localhost:28089/static/upload/20200404_19554536.jpg', 'http://localhost:28089/static/upload/20200404_19554536.jpg', '前端样式<br />', 1799, 1599, 1000, 'css', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:55:47');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10856, '大数据', '董存瑞', 32, 'http://localhost:28089/static/upload/20200404_19531634.jpg', 'http://localhost:28089/static/upload/20200404_19531634.jpg', '大数据开发<br />', 1799, 1599, 1000, 'bigdata', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:53:18');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10863, 'Android高级开发', '郑凯', 52, 'http://localhost:28089/static/upload/20200404_19464779.jpg', 'http://localhost:28089/static/upload/20200404_19464779.jpg', '安卓开发<br />', 1578, 1578, 1000, 'mobile', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:46:49');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10870, '阿里云开发', '杨颖', 31, 'http://localhost:28089/static/upload/20200404_19502538.jpg', 'http://localhost:28089/static/upload/20200404_19502538.jpg', '阿里云开发<br />', 699, 699, 1000, 'cloud', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:50:28');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10871, '接口测试', '黄晓明', 57, 'http://localhost:28089/static/upload/20200404_19473476.jpg', 'http://localhost:28089/static/upload/20200404_19473476.jpg', '接口测试<br />', 699, 699, 1000, 'test', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:47:36');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10872, 'IBM Bluemix开发', '程维', 30, 'http://localhost:28089/static/upload/20200404_19454367.jpg', 'http://localhost:28089/static/upload/20200404_19454367.jpg', 'IBM云开发<br />', 2199, 1818, 1000, 'cloud', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:45:45');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10873, 'Angular', '马云', 48, 'http://localhost:28089/static/upload/20200404_19425429.jpg', 'http://localhost:28089/static/upload/20200404_19425429.jpg', '前端框架<br />', 4500, 4500, 1000, 'angular', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:42:55');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10874, 'HTML5', '李彦宏', 44, 'http://localhost:28089/static/upload/20200404_17032478.jpg', 'http://localhost:28089/static/upload/20200404_17032478.jpg', '前端编程<br />', 6500, 6500, 1000, 'html', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 17:03:26');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10875, 'CSS', '宋威龙', 45, 'http://localhost:28089/static/upload/20200404_1701041.jpg', 'http://localhost:28089/static/upload/20200404_1701041.jpg', '前端样式<br />', 3000, 3000, 1000, 'css', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 17:01:06');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10876, 'JQuery', '宋茜', 46, 'http://localhost:28089/static/upload/20200404_16590483.jpg', 'http://localhost:28089/static/upload/20200404_16590483.jpg', '前端框架<br />', 2555, 2555, 1000, 'JQuery', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 16:59:06');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10880, 'Java高级程序设计', '安琪', 20, 'http://localhost:28089/static/upload/20200404_19512015.jpg', 'http://localhost:28089/static/upload/20200404_19512015.jpg', 'java<br />', 1799, 1598, 1000, 'java', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:51:22');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10881, '压力测试', '孙俪', 58, 'http://localhost:28089/static/upload/20200404_19482387.jpg', 'http://localhost:28089/static/upload/20200404_19482387.jpg', '压力测试<br />', 3799, 2199, 1000, 'test', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:48:25');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10882, 'AWS Developer', '李小龙', 29, 'http://localhost:28089/static/upload/20200404_19422851.jpg', 'http://localhost:28089/static/upload/20200404_19422851.jpg', '云开发<br />', 1799, 1598, 1000, 'cloud', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:42:30');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10883, '.Net', '成龙', 24, 'http://localhost:28089/static/upload/20200404_19382057.jpg', 'http://localhost:28089/static/upload/20200404_19382057.jpg', '.net开发<br />', 3199, 2158, 1000, '.net', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:38:22');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10884, 'C#', '曾国藩', 24, 'http://localhost:28089/static/upload/20200404_19360772.jpg', 'http://localhost:28089/static/upload/20200404_19360772.jpg', 'C#开发<br />', 3199, 2158, 1000, 'c#', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:36:09');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10885, 'Unity', '李云龙', 23, 'http://localhost:28089/static/upload/20200404_19341837.jpg', 'http://localhost:28089/static/upload/20200404_19341837.jpg', 'GIS开发<br />', 3199, 2158, 1000, 'unity', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:34:20');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10886, 'Thymeleaf', '范冰冰', 60, 'http://localhost:28089/static/upload/20200404_19272099.jpg', 'http://localhost:28089/static/upload/20200404_19272099.jpg', '前端框架语言<br />', 3199, 3199, 1000, 'web front', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:27:22');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10887, 'IOS', '李小冉', 51, 'http://localhost:28089/static/upload/20200404_19140227.jpg', 'http://localhost:28089/static/upload/20200404_19140227.jpg', '移动开发<br />', 8999, 8999, 1000, 'mobile', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 19:14:04');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10888, 'Shell', '迟帅', 39, 'http://localhost:28089/static/upload/20200404_17092872.jpg', 'http://localhost:28089/static/upload/20200404_17092872.jpg', '脚本语言开发<br />', 3999, 3999, 1000, 'Script', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 17:09:30');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10889, 'Angular', '川普', 48, 'http://localhost:28089/static/upload/20200404_17070434.jpg', 'http://localhost:28089/static/upload/20200404_17070434.jpg', '前端框架<br />', 4500, 4500, 1000, 'angular', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 17:07:06');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10890, 'Android', '普京', 52, 'http://localhost:28089/static/upload/20200404_16500638.jpg', 'http://localhost:28089/static/upload/20200404_16500638.jpg', '移动开发<br />', 6666, 6666, 1000, 'mobile', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 16:50:09');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10891, 'AWS CLOUD', '黄晓明', 29, 'http://localhost:28089/static/upload/20200404_16465564.jpg', 'http://localhost:28089/static/upload/20200404_16465564.jpg', '云计算<br />', 8888, 8888, 1000, 'cloud', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 16:46:58');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10892, 'VB', 'David', 40, 'http://localhost:28089/static/upload/20200404_1643362.jpg', 'http://localhost:28089/static/upload/20200404_1643362.jpg', 'vb<br />', 3500, 3500, 1000, 'vb', 0, 0, '2019-09-18 13:38:32', 0, '2020-04-04 16:43:38');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10893, 'C/C++', '李磊', 21, 'http://localhost:28089/static/upload/20200404_16403185.jpg', 'http://localhost:28089/static/upload/20200404_16403185.jpg', '嵌入式开发<br />', 5399, 5399, 1000, 'C/C++', 0, 0, '2019-09-19 23:17:39', 0, '2020-04-04 16:41:09');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10894, 'Vue', '范东林', 47, 'http://localhost:28089/static/upload/20200404_16370564.jpg', 'http://localhost:28089/static/upload/20200404_16370564.jpg', '前端框架，支持前后端分离<br />', 5399, 5399, 995, 'webfront', 0, 0, '2019-09-19 23:20:24', 0, '2020-04-05 14:51:27');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10895, 'AngularJS', '刘莉', 49, 'http://localhost:28089/static/upload/20200404_16314651.jpg', 'http://localhost:28089/static/upload/20200404_16314651.jpg', '<img title=\"AngularJS入门与进阶(京东).jpg\" class=\"\" src=\"https://img30.360buyimg.com/vc/jfs/t5533/194/447640774/376958/3986a0c5/58fffffbNde5f146c.jpg\" /><br />', 3999, 3999, 2333, '前端', 0, 0, '2019-09-19 23:22:22', 0, '2020-04-04 16:31:48');
INSERT INTO `tb_newbee_mall_goods_info` VALUES (10896, 'Java程序设计', '张宇', 20, 'http://localhost:28089/static/upload/20200404_14172152.jpg', 'http://localhost:28089/static/upload/20200404_14172152.jpg', 'Java基础知识及框架介绍<br />', 1, 9999, 100, 'Java', 0, 0, '2020-04-04 06:17:29', 0, '2020-04-04 12:43:37');

-- ----------------------------
-- Table structure for tb_newbee_mall_index_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_index_config`;
CREATE TABLE `tb_newbee_mall_index_config`  (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '首页配置项主键id',
  `config_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '显示字符(配置搜索时不可为空，其他可为空)',
  `config_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1-搜索框热搜 2-搜索下拉框热搜 3-(首页)热销商品 4-(首页)新品上线 5-(首页)为你推荐',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '商品id 默认为0',
  `redirect_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '##' COMMENT '点击后的跳转地址(默认不跳转)',
  `config_rank` int(11) NOT NULL DEFAULT 0 COMMENT '排序值(字段越大越靠前)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `create_user` int(11) NOT NULL DEFAULT 0 COMMENT '创建者id',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最新修改时间',
  `update_user` int(11) NULL DEFAULT 0 COMMENT '修改者id',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_index_config
-- ----------------------------
INSERT INTO `tb_newbee_mall_index_config` VALUES (1, '热门课程 Vue开发', 3, 10284, '##', 10, 0, '2019-09-18 17:04:56', 0, '2019-09-18 17:04:56', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (2, '热门课程 微服务', 3, 10779, '##', 100, 0, '2019-09-18 17:05:27', 0, '2019-09-18 17:05:27', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (3, '热门课程 人工智能', 3, 10700, '##', 300, 0, '2019-09-18 17:08:02', 0, '2019-09-18 17:08:02', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (4, '热门课程 云计算', 3, 10159, '##', 101, 0, '2019-09-18 17:08:56', 0, '2019-09-18 17:08:56', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (5, '精品课程 亚马逊云', 4, 10854, '##', 100, 0, '2019-09-18 17:10:36', 0, '2019-09-18 17:10:36', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (6, '精品课程 Vue开发', 4, 10755, '##', 100, 0, '2019-09-18 17:11:05', 0, '2019-09-18 17:11:05', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (7, '精品课程 人工智能', 4, 10006, '##', 102, 0, '2019-09-18 17:11:44', 0, '2019-09-18 17:11:44', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (8, '精品课程 React从入门到精通', 4, 10320, '##', 101, 1, '2019-09-18 17:11:58', 0, '2020-04-04 14:41:26', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (9, '精品课程 AngularJS开发', 4, 10186, '##', 100, 0, '2019-09-18 17:12:29', 0, '2019-09-18 17:12:29', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (11, 'SpringMVC', 5, 10237, '##', 100, 0, '2019-09-18 17:47:44', 0, '2019-09-18 17:47:44', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (12, 'Java', 5, 10195, '##', 102, 0, '2019-09-18 17:48:00', 0, '2019-09-18 17:48:00', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (13, 'Python', 5, 10180, '##', 101, 0, '2019-09-18 17:49:11', 0, '2019-09-18 17:49:11', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (14, 'Docker', 5, 10160, '##', 100, 0, '2019-09-18 17:49:28', 0, '2019-09-18 17:49:28', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (15, 'Kubernetes', 5, 10254, '##', 100, 0, '2019-09-18 17:50:18', 0, '2019-09-18 17:50:18', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (16, 'Vue', 5, 10158, '##', 99, 0, '2019-09-18 17:52:03', 0, '2019-09-18 17:52:03', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (17, 'AWS Cloud', 5, 10154, '##', 100, 0, '2019-09-18 17:52:19', 0, '2019-09-18 17:52:19', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (18, 'SpringCloud', 5, 10147, '##', 101, 0, '2019-09-18 17:52:50', 0, '2019-09-18 17:52:50', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (19, 'Openshift', 5, 10113, '##', 100, 0, '2019-09-18 17:54:07', 0, '2019-09-18 17:54:07', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (20, '11', 5, 1, '##', 0, 1, '2019-09-19 08:31:11', 0, '2019-09-19 08:31:20', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (21, '热门课程 大数据', 3, 10742, '##', 200, 0, '2019-09-19 23:23:38', 0, '2019-09-19 23:23:38', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (22, '精品课程 Java从入门到精通', 4, 10893, '##', 200, 0, '2019-09-19 23:26:05', 0, '2019-09-19 23:26:05', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (23, '精品课程 Python进阶之路', 4, 10895, '##', 199, 0, '2019-09-19 23:26:32', 0, '2019-09-19 23:26:32', 0);
INSERT INTO `tb_newbee_mall_index_config` VALUES (24, 'SpringBoot', 5, 10894, '##', 101, 0, '2019-09-19 23:27:00', 0, '2019-09-19 23:27:00', 0);

-- ----------------------------
-- Table structure for tb_newbee_mall_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order`;
CREATE TABLE `tb_newbee_mall_order`  (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单表主键id',
  `order_no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `user_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户主键id',
  `total_price` int(11) NOT NULL DEFAULT 1 COMMENT '订单总价',
  `pay_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态:0.未支付,1.支付成功,-1:支付失败',
  `pay_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0.无 1.支付宝支付 2.微信支付',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `order_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '订单状态:0.待支付 1.已支付 2.配货完成 3:出库成功 4.交易成功 -1.手动关闭 -2.超时关闭 -3.商家关闭',
  `extra_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单body',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `user_phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人手机号',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人收货地址',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最新修改时间',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_order
-- ----------------------------
INSERT INTO `tb_newbee_mall_order` VALUES (1, '15688187285093508', 1, 2492, 1, 2, '2019-09-18 23:00:18', -1, '', '', '', 'xafsdufhpwe', 0, '2019-09-18 22:53:07', '2019-09-18 22:55:32');
INSERT INTO `tb_newbee_mall_order` VALUES (2, '15688188616936181', 1, 135, 1, 1, '2019-09-18 23:01:06', 1, '', '', '', 'xafsdufhpwe', 0, '2019-09-18 22:55:20', '2019-09-18 23:01:06');
INSERT INTO `tb_newbee_mall_order` VALUES (3, '15689089426956979', 1, 15487, 1, 1, '2019-09-20 00:16:03', 3, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-19 23:56:40', '2019-09-20 00:10:39');
INSERT INTO `tb_newbee_mall_order` VALUES (4, '15689090398492576', 1, 8499, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-19 23:58:18', '2019-09-19 23:58:18');
INSERT INTO `tb_newbee_mall_order` VALUES (5, '15689096266448452', 1, 115, 1, 2, '2019-09-20 00:13:52', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-20 00:08:04', '2019-09-20 00:13:52');
INSERT INTO `tb_newbee_mall_order` VALUES (6, '15691645776131562', 7, 7998, 1, 1, '2019-09-22 23:05:53', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 22:57:15', '2019-09-22 23:05:53');
INSERT INTO `tb_newbee_mall_order` VALUES (7, '15691648465397435', 7, 13998, 1, 2, '2019-09-22 23:07:38', -1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 23:01:44', '2019-09-22 23:02:10');
INSERT INTO `tb_newbee_mall_order` VALUES (8, '15691649071896878', 7, 1246, 1, 1, '2019-09-22 23:08:31', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 23:02:45', '2019-09-22 23:08:31');
INSERT INTO `tb_newbee_mall_order` VALUES (9, '15691649748362177', 7, 25656, 1, 1, '2019-09-22 23:09:39', 4, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 23:03:52', '2019-09-22 23:50:45');
INSERT INTO `tb_newbee_mall_order` VALUES (10, '15691652286194502', 7, 16197, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-22 23:08:06', '2019-09-22 23:08:06');
INSERT INTO `tb_newbee_mall_order` VALUES (11, '15692210075967186', 6, 5999, 1, 2, '2019-09-23 17:03:05', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-23 14:43:27', '2019-09-23 17:03:05');
INSERT INTO `tb_newbee_mall_order` VALUES (12, '15692218454123239', 6, 7245, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-23 14:57:25', '2019-09-23 14:57:25');
INSERT INTO `tb_newbee_mall_order` VALUES (13, '15692225252983527', 6, 5488, 1, 2, '2019-09-23 15:38:54', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-23 15:08:45', '2019-09-23 15:38:54');
INSERT INTO `tb_newbee_mall_order` VALUES (14, '15692291639125640', 6, 9046, 1, 2, '2019-09-23 16:59:32', -1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2709', 0, '2019-09-23 16:59:23', '2019-09-23 16:59:40');
INSERT INTO `tb_newbee_mall_order` VALUES (15, '15692295348262843', 6, 65, 1, 2, '2019-09-23 17:06:17', 1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2709', 0, '2019-09-23 17:05:34', '2019-09-23 17:06:17');
INSERT INTO `tb_newbee_mall_order` VALUES (16, '15692298037679052', 6, 15233, 1, 2, '2019-09-23 17:10:08', -3, '', '', '', '上海浦东新区XX路XX号 999 137xxxx7797', 0, '2019-09-23 17:10:03', '2020-04-04 13:31:30');
INSERT INTO `tb_newbee_mall_order` VALUES (17, '15694781962831307', 7, 1246, 1, 2, '2019-09-26 14:10:12', -1, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-26 14:09:56', '2019-09-26 14:10:22');
INSERT INTO `tb_newbee_mall_order` VALUES (18, '15698039249771093', 7, 3199, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-09-30 08:38:26', '2019-09-30 08:38:26');
INSERT INTO `tb_newbee_mall_order` VALUES (19, '15702783557537865', 7, 6819, 0, 0, NULL, 0, '', '', '', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, '2019-10-05 20:20:10', '2019-10-05 20:20:10');
INSERT INTO `tb_newbee_mall_order` VALUES (20, '15702847670935185', 6, 3999, 1, 2, '2019-10-05 22:13:03', 2, '', '', '', '上海浦东新区XX路XX号 999 137xxxx7797', 0, '2019-10-05 22:12:47', '2020-04-04 12:52:17');
INSERT INTO `tb_newbee_mall_order` VALUES (21, '15860701547433509', 9, 5399, 0, 0, NULL, 0, '', '', '', '广东省深圳市南山区蛇口海昌大厦', 0, '2020-04-05 07:02:34', '2020-04-05 07:02:34');

-- ----------------------------
-- Table structure for tb_newbee_mall_order_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_order_item`;
CREATE TABLE `tb_newbee_mall_order_item`  (
  `order_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单关联购物项主键id',
  `order_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '订单主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `goods_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的名称(订单快照)',
  `goods_cover_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '下单时商品的主图(订单快照)',
  `selling_price` int(11) NOT NULL DEFAULT 1 COMMENT '下单时商品的价格(订单快照)',
  `goods_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(订单快照)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`order_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_order_item
-- ----------------------------
INSERT INTO `tb_newbee_mall_order_item` VALUES (1, 1, 10180, 'Java程序设计', '/goods-img/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg', 1246, 2, '2019-09-18 22:53:07');
INSERT INTO `tb_newbee_mall_order_item` VALUES (2, 2, 10147, 'BI学习', '/goods-img/0f701215-b782-40c7-8bbd-97b51be56461.jpg', 65, 1, '2019-09-18 22:55:20');
INSERT INTO `tb_newbee_mall_order_item` VALUES (3, 2, 10158, 'JAVA程序语言与设计', 'http://localhost:28089/goods-img/5488564b-8335-4b0c-a5a4-52f3f03ee728.jpg', 5000, 1, '2019-09-18 22:55:20');
INSERT INTO `tb_newbee_mall_order_item` VALUES (4, 3, 10742, 'AngularJS讲解', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', 5488, 1, '2019-09-19 23:56:40');
INSERT INTO `tb_newbee_mall_order_item` VALUES (5, 3, 10320, 'Java程序设计', '/goods-img/0025ad55-e260-4a00-be79-fa5b8c5ac0de.jpg', 9999, 1, '2019-09-19 23:56:40');
INSERT INTO `tb_newbee_mall_order_item` VALUES (6, 4, 10254, 'Java程序设计', '/goods-img/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg', 8499, 1, '2019-09-19 23:58:18');
INSERT INTO `tb_newbee_mall_order_item` VALUES (7, 5, 10104, 'JAVA程序语言与设计', '/goods-img/98ce17e1-890e-4eaf-856a-7fce8ffebc4c.jpg', 5000, 1, '2019-09-20 00:08:04');
INSERT INTO `tb_newbee_mall_order_item` VALUES (8, 5, 10110, 'JAVA程序语言与设计', '/goods-img/30036561-a150-4ea7-9106-29bbea278909.jpg', 5000, 1, '2019-09-20 00:08:04');
INSERT INTO `tb_newbee_mall_order_item` VALUES (9, 6, 10895, 'AngularJS讲解', '/goods-img/mate30-3.png', 3999, 2, '2019-09-22 22:57:15');
INSERT INTO `tb_newbee_mall_order_item` VALUES (10, 7, 10895, 'AngularJS讲解', '/goods-img/mate30-3.png', 3999, 1, '2019-09-22 23:01:44');
INSERT INTO `tb_newbee_mall_order_item` VALUES (11, 7, 10320, 'Java程序设计', '/goods-img/0025ad55-e260-4a00-be79-fa5b8c5ac0de.jpg', 9999, 1, '2019-09-22 23:01:44');
INSERT INTO `tb_newbee_mall_order_item` VALUES (12, 8, 10180, 'Java程序设计', '/goods-img/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg', 1246, 1, '2019-09-22 23:02:45');
INSERT INTO `tb_newbee_mall_order_item` VALUES (13, 9, 10237, '自动化测试学习', 'http://localhost:28089/goods-img/1930d79b-88bd-4c5c-8510-0697c9ad2578.jpg', 165, 4, '2019-09-22 23:03:52');
INSERT INTO `tb_newbee_mall_order_item` VALUES (14, 9, 10254, 'Java程序设计', '/goods-img/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg', 8499, 2, '2019-09-22 23:03:52');
INSERT INTO `tb_newbee_mall_order_item` VALUES (15, 9, 10195, 'Python程序设计', 'http://localhost:28089/goods-img/0dc503b2-90a2-4971-9723-c085a1844b76.jpg', 2599, 1, '2019-09-22 23:03:52');
INSERT INTO `tb_newbee_mall_order_item` VALUES (16, 9, 10894, 'AngularJS讲解', '/goods-img/mate30p3.png', 5399, 1, '2019-09-22 23:03:52');
INSERT INTO `tb_newbee_mall_order_item` VALUES (17, 10, 10894, 'AngularJS讲解', '/goods-img/mate30p3.png', 5399, 3, '2019-09-22 23:08:06');
INSERT INTO `tb_newbee_mall_order_item` VALUES (18, 11, 10279, 'Java程序设计', '/goods-img/a0d09f94-9c46-4ee1-aaef-dfd132e7543e.jpg', 5999, 1, '2019-09-23 14:43:27');
INSERT INTO `tb_newbee_mall_order_item` VALUES (19, 12, 10279, 'Java程序设计', '/goods-img/a0d09f94-9c46-4ee1-aaef-dfd132e7543e.jpg', 5999, 1, '2019-09-23 14:57:26');
INSERT INTO `tb_newbee_mall_order_item` VALUES (20, 12, 10159, 'Java程序设计', '/goods-img/53c9f268-7cd4-4fac-909c-2dc066625655.jpg', 1246, 1, '2019-09-23 14:57:26');
INSERT INTO `tb_newbee_mall_order_item` VALUES (21, 13, 10742, 'AngularJS讲解', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', 5488, 1, '2019-09-23 15:08:46');
INSERT INTO `tb_newbee_mall_order_item` VALUES (22, 14, 10158, 'JAVA程序语言与设计', '/goods-img/5488564b-8335-4b0c-a5a4-52f3f03ee728.jpg', 5000, 1, '2019-09-23 16:59:24');
INSERT INTO `tb_newbee_mall_order_item` VALUES (23, 14, 10704, 'AngularJS讲解', '/goods-img/b9e6d770-06dd-40f4-9ae5-31103cec6e5f.jpg', 3988, 1, '2019-09-23 16:59:24');
INSERT INTO `tb_newbee_mall_order_item` VALUES (24, 14, 10739, 'AngularJS讲解', '/goods-img/65c8e729-aeca-4780-977b-4d0d39d4aa2e.jpg', 4988, 1, '2019-09-23 16:59:24');
INSERT INTO `tb_newbee_mall_order_item` VALUES (25, 15, 10147, 'BI学习', '/goods-img/0f701215-b782-40c7-8bbd-97b51be56461.jpg', 65, 1, '2019-09-23 17:05:34');
INSERT INTO `tb_newbee_mall_order_item` VALUES (26, 16, 10742, 'AngularJS讲解', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', 5488, 1, '2019-09-23 17:10:03');
INSERT INTO `tb_newbee_mall_order_item` VALUES (27, 16, 10159, 'Java程序设计', '/goods-img/53c9f268-7cd4-4fac-909c-2dc066625655.jpg', 1246, 1, '2019-09-23 17:10:03');
INSERT INTO `tb_newbee_mall_order_item` VALUES (28, 16, 10254, 'Java程序设计', '/goods-img/7810bc9d-236f-4386-a0ef-45a831b49bf2.jpg', 8499, 1, '2019-09-23 17:10:03');
INSERT INTO `tb_newbee_mall_order_item` VALUES (29, 17, 10180, 'Java程序设计', '/goods-img/64768a8d-0664-4b29-88c9-2626578ffbd1.jpg', 1246, 1, '2019-09-26 14:09:56');
INSERT INTO `tb_newbee_mall_order_item` VALUES (30, 18, 10779, 'AngularJS讲解', '/goods-img/08f9a912-f049-4cf8-a839-115fc6582398.jpg', 3199, 1, '2019-09-30 08:38:26');
INSERT INTO `tb_newbee_mall_order_item` VALUES (31, 19, 10742, 'AngularJS讲解', '/goods-img/dda1d575-cdac-4eb4-a118-3834490166f7.jpg', 5488, 1, '2019-10-05 20:20:10');
INSERT INTO `tb_newbee_mall_order_item` VALUES (32, 19, 10154, 'JAVA程序语言与设计', '/goods-img/15395057-94e9-4545-a8ee-8aee025f40c5.jpg', 5000, 1, '2019-10-05 20:20:10');
INSERT INTO `tb_newbee_mall_order_item` VALUES (33, 19, 10159, 'Java程序设计', '/goods-img/53c9f268-7cd4-4fac-909c-2dc066625655.jpg', 1246, 1, '2019-10-05 20:20:10');
INSERT INTO `tb_newbee_mall_order_item` VALUES (34, 20, 10895, 'AngularJS讲解', '/goods-img/mate30-3.png', 3999, 1, '2019-10-05 22:12:47');
INSERT INTO `tb_newbee_mall_order_item` VALUES (35, 21, 10894, 'Vue', 'http://localhost:28089/upload/20200404_16370564.jpg', 5399, 1, '2020-04-05 07:02:34');

-- ----------------------------
-- Table structure for tb_newbee_mall_shopping_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_shopping_cart_item`;
CREATE TABLE `tb_newbee_mall_shopping_cart_item`  (
  `cart_item_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物项主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户主键id',
  `goods_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '关联商品id',
  `goods_count` int(11) NOT NULL DEFAULT 1 COMMENT '数量(最大为5)',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除标识字段(0-未删除 1-已删除)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '最新修改时间',
  PRIMARY KEY (`cart_item_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_shopping_cart_item
-- ----------------------------
INSERT INTO `tb_newbee_mall_shopping_cart_item` VALUES (1, 9, 10894, 1, 1, '2020-04-05 06:59:57', '2020-04-05 06:59:57');

-- ----------------------------
-- Table structure for tb_newbee_mall_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_newbee_mall_user`;
CREATE TABLE `tb_newbee_mall_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键id',
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `login_name` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登陆名称(默认为手机号)',
  `password_md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'MD5加密后的密码',
  `introduce_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '个性签名',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货地址',
  `is_deleted` tinyint(4) NOT NULL DEFAULT 0 COMMENT '注销标识字段(0-正常 1-已注销)',
  `locked_flag` tinyint(4) NOT NULL DEFAULT 0 COMMENT '锁定标识字段(0-未锁定 1-已锁定)',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_newbee_mall_user
-- ----------------------------
INSERT INTO `tb_newbee_mall_user` VALUES (1, '十三', '13700002703', 'e10adc3949ba59abbe56e057f20f883e', '我不怕千万人阻挡，只怕自己投降', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, 0, '2019-09-22 08:44:57');
INSERT INTO `tb_newbee_mall_user` VALUES (6, '测试用户1', '13711113333', 'dda01dc6d334badcd031102be6bee182', '测试用户1', '上海浦东新区XX路XX号 999 137xxxx7797', 0, 0, '2019-08-29 10:51:39');
INSERT INTO `tb_newbee_mall_user` VALUES (7, '测试用户2测试用户2测试用户2测试用户2', '13811113333', 'dda01dc6d334badcd031102be6bee182', '测试用户2', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, 0, '2019-08-29 10:55:08');
INSERT INTO `tb_newbee_mall_user` VALUES (8, '测试用户3', '13911113333', 'dda01dc6d334badcd031102be6bee182', '测试用户3', '杭州市西湖区xx小区x幢419 十三 137xxxx2703', 0, 0, '2019-08-29 10:55:16');
INSERT INTO `tb_newbee_mall_user` VALUES (9, '18575519836', '18575519836', 'e10adc3949ba59abbe56e057f20f883e', '', '广东省深圳市南山区蛇口海昌大厦', 0, 0, '2020-04-05 06:59:31');

SET FOREIGN_KEY_CHECKS = 1;
