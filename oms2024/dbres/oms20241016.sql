/*
 Navicat Premium Data Transfer

 Source Server         : ceshi
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : oms2024

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 16/10/2024 11:06:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_info
-- ----------------------------
DROP TABLE IF EXISTS `auth_info`;
CREATE TABLE `auth_info`  (
  `auth_id` int(0) NOT NULL AUTO_INCREMENT,
  `parent_id` int(0) NULL DEFAULT NULL COMMENT '父id为空或为0，表示一级权限',
  `auth_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `auth_desc` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `auth_grade` int(0) NULL DEFAULT NULL,
  `auth_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1 模块 、2  列表、 3  按钮',
  `auth_url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `auth_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `auth_order` int(0) NULL DEFAULT NULL,
  `auth_state` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '1 启用 、0 禁用',
  `create_by` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` int(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_info
-- ----------------------------
INSERT INTO `auth_info` VALUES (1, 0, '用户管理', '用户管理', 1, '1', NULL, NULL, 0, '1', 1, '2017-11-14 16:54:13', 1, '2017-11-14 16:54:17');
INSERT INTO `auth_info` VALUES (2, 1, '用户列表', '用户列表', 2, '2', '/user/index', NULL, 0, '1', 1, '2017-11-14 16:56:11', 1, '2017-11-14 16:56:15');
INSERT INTO `auth_info` VALUES (3, 2, '添加用户', '添加用户', 3, '3', NULL, 'user-addUser', 0, '1', 1, '2017-11-14 16:56:59', 1, '2017-11-14 16:57:02');
INSERT INTO `auth_info` VALUES (4, 0, '角色管理', '角色管理', 1, '1', NULL, NULL, 0, '1', 1, '2017-11-14 16:57:48', 1, '2017-11-14 16:57:52');
INSERT INTO `auth_info` VALUES (5, 4, '角色列表', '角色列表', 2, '2', '/role/index', NULL, 0, '1', 1, '2017-11-14 16:58:47', 1, '2017-11-14 16:58:50');
INSERT INTO `auth_info` VALUES (6, 5, '添加角色', '添加角色', 3, '3', NULL, 'role-addRole', 0, '1', 1, '2017-11-14 16:59:25', 1, '2017-11-14 16:59:29');
INSERT INTO `auth_info` VALUES (7, 0, '权限管理', '权限管理', 1, '1', NULL, NULL, 0, '0', 1, '2017-11-14 17:00:13', 1, '2017-11-14 17:00:18');
INSERT INTO `auth_info` VALUES (8, 7, '权限树', '权限树', 2, '2', '/auth/index', NULL, 0, '1', 1, '2017-11-14 17:02:11', 1, '2017-11-14 17:02:14');
INSERT INTO `auth_info` VALUES (9, 8, '添加权限', '添加权限', 3, '3', NULL, 'auth-addAuth', 0, '1', 1, '2017-11-14 17:03:48', 1, '2017-11-14 17:03:52');
INSERT INTO `auth_info` VALUES (10, 2, '删除用户', '删除用户', 3, '3', '', 'user-deleteUser', 0, '1', 1, '2017-11-23 11:56:17', NULL, NULL);
INSERT INTO `auth_info` VALUES (19, 0, '订单管理', '订单管理', 1, '1', '', '', 0, '0', 1, '2017-11-23 17:31:08', NULL, NULL);
INSERT INTO `auth_info` VALUES (20, 19, '订单列表', '订单列表', 2, '2', '', '', 0, '0', 1, '2017-11-23 17:31:42', NULL, NULL);
INSERT INTO `auth_info` VALUES (21, 20, '修改订单', '修改订单', 3, '3', '', 'updateOrder', 0, '0', 0, '2017-11-24 14:33:23', NULL, NULL);
INSERT INTO `auth_info` VALUES (22, 20, '删除订单', '删除订单', 3, '3', '', 'auth-delete', 0, '0', 0, '2017-11-24 14:34:32', NULL, NULL);
INSERT INTO `auth_info` VALUES (23, 2, '查询用户', '查询用户', 3, '3', '', 'user-findUser', 0, '1', 1, '2017-11-28 10:10:53', NULL, NULL);
INSERT INTO `auth_info` VALUES (24, 2, '修改用户', '修改用户信息', 3, '3', '', 'user-updateUser', 0, '1', 0, '2017-11-28 10:12:51', NULL, NULL);
INSERT INTO `auth_info` VALUES (25, 2, '分配角色', '分配角色', 3, '3', '', 'user-assignRole', 0, '1', 1, '2017-11-28 10:15:27', NULL, NULL);
INSERT INTO `auth_info` VALUES (26, 2, '更改权限', '更改权限', 3, '3', '', 'user-updateAuth', 0, '1', 1, '2017-11-28 10:16:07', NULL, NULL);
INSERT INTO `auth_info` VALUES (27, 5, '修改角色', '修改角色', 3, '3', '', 'role-updateRole', 0, '1', 1, '2017-11-28 10:16:40', NULL, NULL);
INSERT INTO `auth_info` VALUES (28, 5, '查询角色', '查询角色', 3, '3', '', 'role-findRole', 0, '1', 1, '2017-11-28 10:17:12', NULL, NULL);
INSERT INTO `auth_info` VALUES (30, 5, '删除角色', '删除角色', 3, '3', '', 'role-deleteRole', 0, '1', 1, '2017-11-28 10:23:14', NULL, NULL);
INSERT INTO `auth_info` VALUES (31, 5, '更改权限', '更改权限', 3, '3', '', 'role-updateAuth', 0, '1', 1, '2017-11-28 10:24:35', NULL, NULL);
INSERT INTO `auth_info` VALUES (32, 8, '修改权限', '修改权限', 3, '3', '', 'auth-updateAuth', 0, '1', 1, '2017-11-28 10:25:08', NULL, NULL);
INSERT INTO `auth_info` VALUES (33, 8, '删除权限', '删除权限', 3, '3', NULL, 'auth-deleteAuth', 0, '1', 0, '2022-03-29 10:10:03', NULL, NULL);
INSERT INTO `auth_info` VALUES (34, 8, '恢复权限', '恢复权限', 3, '3', NULL, 'auth-restartAuth', 0, '1', 0, '2022-03-29 10:10:50', NULL, NULL);
INSERT INTO `auth_info` VALUES (35, 2, '修改状态', '修改状态', 3, '3', '', 'user-updateState', 0, '1', 1, '2017-11-28 10:49:40', NULL, NULL);
INSERT INTO `auth_info` VALUES (36, 2, '重置密码', '重置密码', 3, '3', '', 'user-resetPwd', 0, '1', 1, '2017-11-28 10:53:27', NULL, NULL);
INSERT INTO `auth_info` VALUES (37, 5, '修改角色状态', '修改角色状态', 3, '3', '', 'role-updateState', 0, '1', 1, '2017-11-28 11:12:23', NULL, NULL);
INSERT INTO `auth_info` VALUES (38, 19, '订单详情', '订单详情', 2, '2', '', '', 1, '0', 1, '2017-11-29 11:35:57', NULL, NULL);
INSERT INTO `auth_info` VALUES (41, 19, '订单分类', '订单分类', 2, '2', '', '', 1, '0', 1, '2017-11-29 11:56:04', NULL, NULL);
INSERT INTO `auth_info` VALUES (42, 0, '商品管理', '商品管理', 1, '1', '', '', 1, '1', 1, '2017-11-29 11:56:44', NULL, NULL);
INSERT INTO `auth_info` VALUES (43, 38, '查看详情', '查看详情', 3, '3', '', 'order-selectDetils', 1, '0', 1, '2017-11-29 11:57:29', NULL, NULL);
INSERT INTO `auth_info` VALUES (44, 38, '修改详情', '修改详情', 3, '3', '', 'order-updateDetils', 1, '0', 1, '2017-11-29 11:58:36', NULL, NULL);
INSERT INTO `auth_info` VALUES (46, 41, '分类', '分类', 3, '3', '', 'auth-flAuth', 1, '0', 1, '2017-11-30 15:16:02', NULL, NULL);
INSERT INTO `auth_info` VALUES (50, 42, '商品列表', '商品列表', 2, '2', '/commodity/index', '', 1, '1', 1, '2017-12-07 08:47:50', NULL, NULL);
INSERT INTO `auth_info` VALUES (53, 0, '采购管理', '采购管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:02', NULL, NULL);
INSERT INTO `auth_info` VALUES (54, 0, '入库管理', '入库管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:20', NULL, NULL);
INSERT INTO `auth_info` VALUES (55, 0, '出库管理', '出库管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 14:53:31', NULL, NULL);
INSERT INTO `auth_info` VALUES (56, 53, '采购列表', '采购列表', 2, '2', '/purchase/index', '', 1, '1', 1, '2017-12-11 14:59:11', NULL, NULL);
INSERT INTO `auth_info` VALUES (57, 54, '入库列表', '入库列表', 2, '2', '/instore/index', '', 1, '1', 1, '2017-12-11 15:01:27', NULL, NULL);
INSERT INTO `auth_info` VALUES (58, 55, '出库列表', '出库列表', 2, '2', '/outstore/index', '', 1, '1', 1, '2017-12-11 15:02:03', NULL, NULL);
INSERT INTO `auth_info` VALUES (61, 0, '盘点管理', '盘点管理', 1, '1', '', '', 1, '1', 1, '2017-12-11 18:04:38', NULL, NULL);
INSERT INTO `auth_info` VALUES (62, 61, '盘点列表', '盘点列表', 2, '2', '', '', 1, '1', 1, '2017-12-11 18:05:05', NULL, NULL);
INSERT INTO `auth_info` VALUES (63, 0, '统计查询', '统计查询', 1, '1', '', '', 1, '1', 1, '2017-12-12 14:17:13', NULL, NULL);
INSERT INTO `auth_info` VALUES (64, 63, '统计报表', '统计报表', 2, '2', '/statistics/index', '', 1, '1', 1, '2017-12-12 14:17:43', NULL, NULL);
INSERT INTO `auth_info` VALUES (68, 0, '调货管理', '调货管理', 1, '1', '', '', 1, '0', 1, '2017-12-13 14:34:21', NULL, NULL);
INSERT INTO `auth_info` VALUES (69, 0, '仓库管理', '仓库管理', 1, '1', '', '', 1, '1', 1, '2017-12-13 14:34:48', NULL, NULL);
INSERT INTO `auth_info` VALUES (70, 69, '仓库列表', '仓库列表', 2, '2', '/store/index', '', 1, '1', 1, '2017-12-13 14:36:32', NULL, NULL);
INSERT INTO `auth_info` VALUES (71, 68, '调货单列表', '调货单列表', 2, '2', '/transshipment/index', NULL, NULL, '1', NULL, NULL, NULL, NULL);
INSERT INTO `auth_info` VALUES (72, 0, '供货商管理', '供货商管理', 1, '1', '', '', 1, '1', 1, '2017-12-13 17:09:36', NULL, NULL);
INSERT INTO `auth_info` VALUES (74, 72, '供货商列表', '供货商列表', 2, '2', '', '', 1, '1', 1, '2017-12-13 17:10:14', NULL, NULL);
INSERT INTO `auth_info` VALUES (76, 42, '商品分类', '商品分类', 2, '2', '/commodity/category', '', 1, '1', 1, '2017-12-14 11:16:38', NULL, NULL);
INSERT INTO `auth_info` VALUES (92, 50, '调货', '调货', 3, '3', '/transshipment/transfer', 'transfer_commodity', 0, '1', 1, '2022-04-22 12:17:19', NULL, NULL);
INSERT INTO `auth_info` VALUES (93, 50, '商品查询', '商品查询', 3, '3', '/product/product-page-list', 'select_product', 0, '1', 1, '2022-04-22 12:21:37', NULL, NULL);
INSERT INTO `auth_info` VALUES (94, 50, '添加商品', '添加商品', 3, '3', '/product/product-add', 'product-add', 0, '1', 1, '2022-04-22 12:23:17', NULL, NULL);
INSERT INTO `auth_info` VALUES (95, 57, '确定入库', '确定入库', 3, '3', '/instore/instore-confirm', 'instore-confirm', 0, '1', 1, '2022-04-22 12:25:36', NULL, NULL);
INSERT INTO `auth_info` VALUES (96, 71, '确认调货', '确认调货', 3, '3', '/transshipment/transshipment-confirm', 'transshipment-confirm', 0, '1', 1, '2022-04-22 12:26:59', NULL, NULL);
INSERT INTO `auth_info` VALUES (97, 50, '采购', '采购', 3, '3', '/purchase/purchase-add', 'purchase-add', 0, '1', 1, '2022-04-22 12:30:42', NULL, NULL);

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `customer_id` int(0) NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customer_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES (1, 'Ivan', '一万');
INSERT INTO `customer` VALUES (2, 'Mario', '马力欧');
INSERT INTO `customer` VALUES (3, 'Edgar', '');
INSERT INTO `customer` VALUES (4, 'Pedro', '');
INSERT INTO `customer` VALUES (5, 'Panama', '');

-- ----------------------------
-- Table structure for factory
-- ----------------------------
DROP TABLE IF EXISTS `factory`;
CREATE TABLE `factory`  (
  `factory_id` int(0) NOT NULL AUTO_INCREMENT,
  `factory_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `factory_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `factory_bank_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `factory_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `factory_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`factory_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of factory
-- ----------------------------
INSERT INTO `factory` VALUES (5, 'F4', '', '', '', '');
INSERT INTO `factory` VALUES (6, 'F8', '蓝天成', '', '', '');
INSERT INTO `factory` VALUES (7, 'F28', '', '', '', '');
INSERT INTO `factory` VALUES (8, 'F30', '', '', '', '');
INSERT INTO `factory` VALUES (9, 'F32', '德利行', '', '', '');
INSERT INTO `factory` VALUES (10, 'F40', '雅鑫妮', '', '', '');
INSERT INTO `factory` VALUES (11, 'F53', '雅媛', '', '', '');
INSERT INTO `factory` VALUES (12, 'F55', '安彤针织', '', '', '');

-- ----------------------------
-- Table structure for mark
-- ----------------------------
DROP TABLE IF EXISTS `mark`;
CREATE TABLE `mark`  (
  `mark_id` int(0) NOT NULL AUTO_INCREMENT,
  `mark_name` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mark_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customer_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`mark_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mark
-- ----------------------------
INSERT INTO `mark` VALUES (1, 'F', '', 2);
INSERT INTO `mark` VALUES (2, 'M', '', 2);
INSERT INTO `mark` VALUES (5, 'I', '', 1);
INSERT INTO `mark` VALUES (6, 'DF', '', 4);
INSERT INTO `mark` VALUES (7, 'O', '', 1);
INSERT INTO `mark` VALUES (8, 'E', '', 3);
INSERT INTO `mark` VALUES (9, 'IMG', '', 1);
INSERT INTO `mark` VALUES (10, 'T', '', 4);
INSERT INTO `mark` VALUES (11, 'D', '', 4);
INSERT INTO `mark` VALUES (12, 'CR', '', 4);
INSERT INTO `mark` VALUES (13, 'P', '', 5);

-- ----------------------------
-- Table structure for order_code
-- ----------------------------
DROP TABLE IF EXISTS `order_code`;
CREATE TABLE `order_code`  (
  `order_code_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '订单名称',
  `create_date` date NULL DEFAULT NULL,
  `order_code_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '订单描述',
  `order_code_id` int(0) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_code_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_code
-- ----------------------------
INSERT INTO `order_code` VALUES ('P', '2024-03-31', 'PPP', 1);
INSERT INTO `order_code` VALUES ('O', '2018-12-04', 'OOO', 2);
INSERT INTO `order_code` VALUES ('S', '2023-04-01', '1111', 3);
INSERT INTO `order_code` VALUES ('R', '2023-07-07', 'RRR', 17);
INSERT INTO `order_code` VALUES ('L', '2023-09-01', '', 18);
INSERT INTO `order_code` VALUES ('K', '2024-09-26', '', 19);
INSERT INTO `order_code` VALUES ('I', '2024-09-27', '', 20);
INSERT INTO `order_code` VALUES ('M', '2024-09-11', '', 21);

-- ----------------------------
-- Table structure for order_info
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info`  (
  `order_id` int(0) NOT NULL AUTO_INCREMENT,
  `style_id` int(0) NULL DEFAULT NULL,
  `mark_id` int(0) NULL DEFAULT NULL,
  `order_num` int(0) NULL DEFAULT NULL,
  `stock` int(0) NULL DEFAULT NULL,
  `order_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1876 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES (17, 57, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (18, 57, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (19, 57, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (20, 57, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (21, 57, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (22, 58, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (23, 58, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (24, 58, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (25, 58, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (26, 58, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (27, 59, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (28, 59, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (29, 59, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (30, 59, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (31, 59, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (32, 60, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (33, 60, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (34, 60, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (35, 60, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (36, 60, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (37, 59, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (38, 60, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (39, 61, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (40, 61, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (41, 61, 5, 600, 0, '');
INSERT INTO `order_info` VALUES (42, 61, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (43, 61, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (44, 61, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (45, 62, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (46, 62, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (47, 62, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (48, 62, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (49, 62, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (50, 62, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (51, 63, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (52, 63, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (53, 63, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (54, 63, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (55, 63, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (56, 64, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (57, 64, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (58, 64, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (59, 64, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (60, 64, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (61, 65, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (62, 65, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (63, 65, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (64, 65, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (65, 65, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (66, 66, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (67, 66, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (68, 66, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (69, 66, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (70, 66, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (71, 67, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (72, 67, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (73, 67, 5, 600, 0, '');
INSERT INTO `order_info` VALUES (74, 67, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (75, 67, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (76, 67, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (77, 68, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (78, 68, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (79, 68, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (80, 68, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (81, 68, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (82, 68, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (83, 69, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (84, 69, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (85, 69, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (86, 69, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (87, 69, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (88, 69, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (89, 70, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (90, 70, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (91, 70, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (92, 70, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (93, 70, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (94, 70, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (95, 71, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (96, 71, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (97, 71, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (98, 71, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (99, 71, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (100, 71, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (101, 72, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (102, 72, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (103, 72, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (104, 72, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (105, 72, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (106, 72, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (107, 73, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (108, 73, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (109, 73, 5, 720, 0, '');
INSERT INTO `order_info` VALUES (110, 73, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (111, 73, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (112, 73, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (113, 74, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (114, 74, 2, 720, 720, '');
INSERT INTO `order_info` VALUES (115, 74, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (116, 74, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (117, 74, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (118, 74, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (119, 75, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (120, 75, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (121, 75, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (122, 75, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (123, 75, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (124, 75, 8, 600, 600, '');
INSERT INTO `order_info` VALUES (125, 76, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (126, 76, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (127, 76, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (128, 76, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (129, 76, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (130, 76, 8, 600, 600, '');
INSERT INTO `order_info` VALUES (131, 77, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (132, 77, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (133, 77, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (134, 77, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (135, 77, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (136, 77, 8, 600, 600, '');
INSERT INTO `order_info` VALUES (137, 78, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (138, 78, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (139, 78, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (140, 78, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (141, 78, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (142, 78, 8, 600, 600, '');
INSERT INTO `order_info` VALUES (143, 79, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (144, 79, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (145, 79, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (146, 79, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (147, 79, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (148, 79, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (149, 80, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (150, 80, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (151, 80, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (152, 80, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (153, 80, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (154, 80, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (155, 81, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (156, 81, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (157, 81, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (158, 81, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (159, 81, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (160, 81, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (161, 82, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (162, 82, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (163, 82, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (164, 82, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (165, 82, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (166, 82, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (167, 83, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (168, 83, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (169, 83, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (170, 83, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (171, 83, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (172, 83, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (173, 84, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (174, 84, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (175, 84, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (176, 84, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (177, 84, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (178, 84, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (179, 85, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (180, 85, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (181, 85, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (182, 85, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (183, 85, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (184, 85, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (185, 86, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (186, 86, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (187, 86, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (188, 86, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (189, 86, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (190, 86, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (191, 87, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (192, 87, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (193, 87, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (194, 87, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (195, 87, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (196, 87, 8, 480, 480, '');
INSERT INTO `order_info` VALUES (197, 87, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (198, 88, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (199, 88, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (200, 88, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (201, 88, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (202, 88, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (203, 88, 8, 480, 480, '');
INSERT INTO `order_info` VALUES (204, 88, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (205, 89, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (206, 89, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (207, 89, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (208, 89, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (209, 89, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (210, 89, 8, 480, 480, '');
INSERT INTO `order_info` VALUES (211, 89, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (212, 90, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (213, 90, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (214, 90, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (215, 90, 9, 80, 80, '');
INSERT INTO `order_info` VALUES (216, 90, 7, 80, 80, '');
INSERT INTO `order_info` VALUES (217, 90, 8, 480, 480, '');
INSERT INTO `order_info` VALUES (218, 90, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (219, 91, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (220, 91, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (221, 91, 5, 240, 240, '');
INSERT INTO `order_info` VALUES (222, 91, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (223, 91, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (224, 91, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (225, 91, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (226, 92, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (227, 92, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (228, 92, 5, 240, 240, '');
INSERT INTO `order_info` VALUES (229, 92, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (230, 92, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (231, 92, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (232, 93, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (233, 93, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (234, 93, 5, 240, 240, '');
INSERT INTO `order_info` VALUES (235, 93, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (236, 93, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (237, 93, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (238, 94, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (239, 94, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (240, 94, 5, 240, 0, '');
INSERT INTO `order_info` VALUES (241, 94, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (242, 94, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (243, 94, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (244, 94, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (245, 95, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (246, 95, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (247, 95, 5, 360, 0, '');
INSERT INTO `order_info` VALUES (248, 95, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (249, 95, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (250, 95, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (251, 95, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (252, 96, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (253, 96, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (254, 96, 5, 360, 0, '');
INSERT INTO `order_info` VALUES (255, 96, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (256, 96, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (257, 96, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (258, 97, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (259, 97, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (260, 97, 5, 360, 360, '');
INSERT INTO `order_info` VALUES (261, 97, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (262, 97, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (263, 97, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (264, 98, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (265, 98, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (266, 98, 5, 360, 360, '');
INSERT INTO `order_info` VALUES (267, 98, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (268, 98, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (269, 98, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (270, 98, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (271, 99, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (272, 99, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (273, 99, 5, 360, 360, '');
INSERT INTO `order_info` VALUES (274, 99, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (275, 99, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (276, 99, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (277, 99, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (278, 100, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (279, 100, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (280, 100, 5, 360, 0, '');
INSERT INTO `order_info` VALUES (281, 100, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (282, 100, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (283, 100, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (284, 101, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (285, 101, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (286, 101, 5, 360, 360, '');
INSERT INTO `order_info` VALUES (287, 101, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (288, 101, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (289, 101, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (290, 102, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (291, 102, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (292, 102, 5, 360, 360, '');
INSERT INTO `order_info` VALUES (293, 102, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (294, 102, 7, 40, 40, '');
INSERT INTO `order_info` VALUES (295, 102, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (296, 102, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (297, 103, 8, 500, 500, '');
INSERT INTO `order_info` VALUES (298, 104, 8, 500, 500, '');
INSERT INTO `order_info` VALUES (299, 105, 8, 500, 500, '');
INSERT INTO `order_info` VALUES (300, 106, 10, 17600, 17600, '');
INSERT INTO `order_info` VALUES (301, 107, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (302, 107, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (303, 107, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (304, 107, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (305, 107, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (306, 108, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (307, 108, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (308, 108, 5, 450, 0, '');
INSERT INTO `order_info` VALUES (309, 108, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (310, 108, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (311, 109, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (312, 109, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (313, 109, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (314, 109, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (315, 109, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (316, 110, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (317, 110, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (318, 110, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (319, 110, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (320, 110, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (321, 110, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (322, 111, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (323, 111, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (324, 111, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (325, 111, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (326, 111, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (327, 111, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (328, 112, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (329, 112, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (330, 112, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (331, 112, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (332, 112, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (333, 112, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (334, 113, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (335, 113, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (336, 113, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (337, 113, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (338, 113, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (339, 113, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (340, 114, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (341, 114, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (342, 114, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (343, 114, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (344, 114, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (345, 114, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (346, 114, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (347, 115, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (348, 115, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (349, 115, 5, 300, 0, '');
INSERT INTO `order_info` VALUES (350, 115, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (351, 115, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (352, 115, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (353, 115, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (354, 116, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (355, 116, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (356, 116, 5, 450, 0, '');
INSERT INTO `order_info` VALUES (357, 116, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (358, 116, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (359, 116, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (360, 117, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (361, 117, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (362, 117, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (363, 117, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (364, 117, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (365, 117, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (366, 118, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (367, 118, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (368, 118, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (369, 118, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (370, 118, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (371, 118, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (372, 118, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (373, 119, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (374, 119, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (375, 119, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (376, 119, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (377, 119, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (378, 119, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (379, 119, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (380, 120, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (381, 120, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (382, 120, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (383, 120, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (384, 120, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (385, 120, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (386, 120, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (387, 121, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (388, 121, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (389, 121, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (390, 121, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (391, 121, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (392, 121, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (393, 121, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (394, 122, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (395, 122, 2, 450, 450, '');
INSERT INTO `order_info` VALUES (396, 122, 5, 450, 450, '');
INSERT INTO `order_info` VALUES (397, 122, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (398, 122, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (399, 122, 8, 160, 160, '');
INSERT INTO `order_info` VALUES (400, 122, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (401, 123, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (402, 123, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (403, 123, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (404, 123, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (405, 123, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (406, 123, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (407, 123, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (408, 124, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (409, 124, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (410, 124, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (411, 124, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (412, 124, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (413, 124, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (414, 124, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (415, 125, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (416, 125, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (417, 125, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (418, 125, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (419, 125, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (420, 125, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (421, 125, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (422, 126, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (423, 126, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (424, 126, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (425, 126, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (426, 126, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (427, 126, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (428, 126, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (429, 127, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (430, 127, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (431, 127, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (432, 127, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (433, 127, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (434, 127, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (435, 127, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (436, 128, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (437, 128, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (438, 128, 5, 300, 0, '');
INSERT INTO `order_info` VALUES (439, 128, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (440, 128, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (441, 128, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (442, 128, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (443, 129, 5, 600, 300, '');
INSERT INTO `order_info` VALUES (444, 129, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (445, 129, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (446, 130, 5, 600, 300, '');
INSERT INTO `order_info` VALUES (447, 130, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (448, 130, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (449, 131, 5, 600, 300, '');
INSERT INTO `order_info` VALUES (450, 131, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (451, 131, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (452, 132, 5, 600, 0, '');
INSERT INTO `order_info` VALUES (453, 132, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (454, 132, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (455, 133, 5, 600, 300, '');
INSERT INTO `order_info` VALUES (456, 133, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (457, 133, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (458, 133, 8, 150, 150, '');
INSERT INTO `order_info` VALUES (459, 134, 5, 600, 300, '');
INSERT INTO `order_info` VALUES (460, 134, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (461, 134, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (462, 134, 8, 150, 150, '');
INSERT INTO `order_info` VALUES (463, 135, 5, 600, 300, '');
INSERT INTO `order_info` VALUES (464, 135, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (465, 135, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (466, 135, 8, 150, 150, '');
INSERT INTO `order_info` VALUES (467, 136, 5, 720, 0, '');
INSERT INTO `order_info` VALUES (468, 136, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (469, 136, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (470, 136, 8, 150, 150, '');
INSERT INTO `order_info` VALUES (471, 137, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (472, 137, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (473, 137, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (474, 137, 8, 150, 150, '');
INSERT INTO `order_info` VALUES (475, 138, 5, 720, 720, '');
INSERT INTO `order_info` VALUES (476, 138, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (477, 138, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (478, 138, 8, 150, 150, '');
INSERT INTO `order_info` VALUES (479, 149, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (480, 149, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (481, 149, 5, 400, 260, '');
INSERT INTO `order_info` VALUES (482, 149, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (483, 149, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (484, 150, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (485, 150, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (486, 150, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (487, 150, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (488, 150, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (489, 151, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (490, 151, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (491, 151, 5, 400, 0, '');
INSERT INTO `order_info` VALUES (492, 151, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (493, 151, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (494, 152, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (495, 152, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (496, 152, 5, 400, 0, '');
INSERT INTO `order_info` VALUES (497, 152, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (498, 152, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (499, 153, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (500, 153, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (501, 153, 5, 400, 0, '');
INSERT INTO `order_info` VALUES (502, 153, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (503, 153, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (504, 154, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (505, 154, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (506, 154, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (507, 154, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (508, 154, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (509, 155, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (510, 155, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (511, 155, 5, 400, 260, '');
INSERT INTO `order_info` VALUES (512, 155, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (513, 155, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (514, 156, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (515, 156, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (516, 156, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (517, 156, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (518, 156, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (519, 156, 8, 140, 140, '');
INSERT INTO `order_info` VALUES (520, 157, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (521, 157, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (522, 157, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (523, 157, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (524, 157, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (525, 157, 8, 140, 140, '');
INSERT INTO `order_info` VALUES (526, 158, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (527, 158, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (528, 158, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (529, 158, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (530, 158, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (531, 158, 8, 140, 140, '');
INSERT INTO `order_info` VALUES (532, 159, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (533, 159, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (534, 159, 5, 600, 400, '');
INSERT INTO `order_info` VALUES (535, 159, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (536, 159, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (537, 160, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (538, 160, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (539, 160, 5, 600, 0, '');
INSERT INTO `order_info` VALUES (540, 160, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (541, 160, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (542, 161, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (543, 161, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (544, 161, 5, 600, 0, '');
INSERT INTO `order_info` VALUES (545, 161, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (546, 161, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (547, 162, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (548, 162, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (549, 162, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (550, 162, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (551, 162, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (552, 163, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (553, 163, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (554, 163, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (555, 163, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (556, 163, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (557, 164, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (558, 164, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (559, 164, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (560, 164, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (561, 164, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (562, 165, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (563, 165, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (564, 165, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (565, 165, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (566, 165, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (567, 166, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (568, 166, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (569, 166, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (570, 166, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (571, 166, 7, 60, 60, '');
INSERT INTO `order_info` VALUES (572, 166, 8, 140, 140, '');
INSERT INTO `order_info` VALUES (573, 167, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (574, 167, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (575, 167, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (576, 167, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (577, 167, 7, 60, 0, '');
INSERT INTO `order_info` VALUES (578, 167, 8, 140, 140, '');
INSERT INTO `order_info` VALUES (579, 168, 5, 720, 720, '12:240\n14:240\n16:240');
INSERT INTO `order_info` VALUES (580, 168, 9, 120, 120, '12:40\n14:40\n16:40');
INSERT INTO `order_info` VALUES (581, 168, 7, 120, 120, '12:40\n14:40\n16:40');
INSERT INTO `order_info` VALUES (582, 168, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (583, 169, 5, 720, 720, '12:240 14:240 16:240');
INSERT INTO `order_info` VALUES (584, 169, 9, 120, 120, '12:40 14:40 16:40');
INSERT INTO `order_info` VALUES (585, 169, 7, 120, 120, '12:40 14:40 16:40');
INSERT INTO `order_info` VALUES (586, 169, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (587, 170, 5, 720, 720, '12:240 14:240 16:240');
INSERT INTO `order_info` VALUES (588, 170, 9, 120, 120, '12:40 14:40 16:40');
INSERT INTO `order_info` VALUES (589, 170, 7, 120, 120, '12:40 14:40 16:40');
INSERT INTO `order_info` VALUES (590, 170, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (591, 171, 5, 920, 56, 'S:100\nM:200\nL:260\nXL:260\nSurtido: 100');
INSERT INTO `order_info` VALUES (592, 171, 9, 120, 120, 'S:20\nM:40\nL:40\nXL:20');
INSERT INTO `order_info` VALUES (593, 171, 7, 120, 120, 'S:20\nM:40\nL:40\nXL:20');
INSERT INTO `order_info` VALUES (594, 171, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (595, 172, 5, 920, 56, 'S:100 M:200 L:260 XL:260 Surtido: 100');
INSERT INTO `order_info` VALUES (596, 172, 9, 120, 120, 'S:20\n M:40\n L:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (597, 172, 7, 120, 120, 'S:20\n M:40\n L:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (598, 172, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (599, 173, 5, 920, 920, 'S:100 M:200 L:260 XL:260 Surtido: 100');
INSERT INTO `order_info` VALUES (600, 173, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (601, 173, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (602, 173, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (603, 174, 5, 920, 176, 'S:100 M:200 L:260 XL:260 Surtido: 100');
INSERT INTO `order_info` VALUES (604, 174, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (605, 174, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (606, 174, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (607, 175, 5, 920, 920, 'S:100 M:200 L:260 XL:260 Surtido: 100');
INSERT INTO `order_info` VALUES (608, 175, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 \n');
INSERT INTO `order_info` VALUES (609, 175, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 \n');
INSERT INTO `order_info` VALUES (610, 175, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (611, 176, 5, 920, 920, 'S:100 \nM:200 \nL:260 \nXL:260 \nSurtido: 100');
INSERT INTO `order_info` VALUES (612, 176, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20');
INSERT INTO `order_info` VALUES (613, 176, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20');
INSERT INTO `order_info` VALUES (614, 176, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (615, 177, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (616, 177, 2, 700, 700, '');
INSERT INTO `order_info` VALUES (617, 177, 5, 1000, 1000, '40:300\n42:300\n44:300\nSurtido: 100');
INSERT INTO `order_info` VALUES (618, 177, 9, 60, 60, '40:20\n42:20\n44:20');
INSERT INTO `order_info` VALUES (619, 177, 7, 60, 60, '40:20\n42:20\n44:20');
INSERT INTO `order_info` VALUES (620, 177, 10, 700, 700, '');
INSERT INTO `order_info` VALUES (621, 178, 5, 1000, 1000, '40:300\n42:300\n44:300\nSurtido: 100');
INSERT INTO `order_info` VALUES (622, 178, 9, 60, 60, '40:20\n42:20\n44:20');
INSERT INTO `order_info` VALUES (623, 178, 7, 20, 20, '40:20\n42:20\n44:20');
INSERT INTO `order_info` VALUES (624, 178, 10, 700, 700, '');
INSERT INTO `order_info` VALUES (625, 179, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (626, 179, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (627, 179, 5, 600, 0, 'Surtido: 600');
INSERT INTO `order_info` VALUES (628, 179, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (629, 179, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (630, 179, 10, 100, 100, '');
INSERT INTO `order_info` VALUES (631, 180, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (632, 180, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (633, 180, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (634, 180, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (635, 180, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (636, 180, 10, 100, 100, '');
INSERT INTO `order_info` VALUES (637, 181, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (638, 181, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (639, 181, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (640, 181, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (641, 181, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (642, 181, 10, 100, 100, '');
INSERT INTO `order_info` VALUES (643, 182, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (644, 182, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (645, 182, 5, 600, 0, 'Surtido: 600');
INSERT INTO `order_info` VALUES (646, 182, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (647, 182, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (648, 182, 10, 100, 100, '');
INSERT INTO `order_info` VALUES (649, 183, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (650, 183, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (651, 183, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (652, 183, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (653, 183, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (654, 183, 10, 100, 100, '');
INSERT INTO `order_info` VALUES (655, 184, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (656, 184, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (657, 184, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (658, 184, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (659, 184, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (660, 184, 10, 100, 100, '');
INSERT INTO `order_info` VALUES (661, 185, 5, 720, 0, '12:240\n14:240\n16:240\n');
INSERT INTO `order_info` VALUES (662, 185, 9, 60, 60, '12:20\n14:20\n16:20\n');
INSERT INTO `order_info` VALUES (663, 185, 7, 60, 60, '12:20\n14:20\n16:20\n');
INSERT INTO `order_info` VALUES (664, 185, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (665, 186, 5, 720, 0, '12:240\n14:240\n16:240\n');
INSERT INTO `order_info` VALUES (666, 186, 9, 60, 60, '12:20\n14:20\n16:20\n');
INSERT INTO `order_info` VALUES (667, 186, 7, 60, 60, '12:20\n14:20\n16:20\n');
INSERT INTO `order_info` VALUES (668, 186, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (669, 187, 1, 250, 250, '');
INSERT INTO `order_info` VALUES (670, 187, 2, 700, 700, '');
INSERT INTO `order_info` VALUES (671, 187, 5, 820, 100, '40:240\n42:240\n44:240\nSurtido: 100');
INSERT INTO `order_info` VALUES (672, 187, 9, 60, 60, '40:20\n42:20\n44:20');
INSERT INTO `order_info` VALUES (673, 187, 7, 60, 60, '40:20\n42:20\n44:20');
INSERT INTO `order_info` VALUES (674, 187, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (675, 188, 1, 250, 250, '');
INSERT INTO `order_info` VALUES (676, 188, 2, 700, 700, '');
INSERT INTO `order_info` VALUES (677, 188, 5, 820, 820, '40:240\n42:240\n44:240\nSurtido: 100');
INSERT INTO `order_info` VALUES (678, 188, 9, 60, 60, '40:20\n42:20\n44:20');
INSERT INTO `order_info` VALUES (679, 188, 7, 60, 60, '40:20\n42:20\n44:20');
INSERT INTO `order_info` VALUES (680, 188, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (681, 189, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (682, 189, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (683, 189, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (684, 189, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (685, 189, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (686, 189, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (687, 190, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (688, 190, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (689, 190, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (690, 190, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (691, 190, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (692, 190, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (693, 191, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (694, 191, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (695, 191, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (696, 191, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (697, 191, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (698, 191, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (699, 192, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (700, 192, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (701, 192, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (702, 192, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (703, 192, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (704, 192, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (705, 193, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (706, 193, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (707, 193, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (708, 193, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (709, 193, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (710, 193, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (711, 194, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (712, 194, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (713, 194, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (714, 194, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (715, 194, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (716, 194, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (717, 195, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (718, 195, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (719, 195, 5, 600, 0, 'Surtido: 600');
INSERT INTO `order_info` VALUES (720, 195, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (721, 195, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (722, 195, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (723, 195, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (724, 196, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (725, 196, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (726, 196, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (727, 196, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (728, 196, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (729, 196, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (730, 196, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (731, 197, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (732, 197, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (733, 197, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (734, 197, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (735, 197, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (736, 197, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (737, 197, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (738, 198, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (739, 198, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (740, 198, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (741, 198, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (742, 198, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (743, 198, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (744, 198, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (745, 199, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (746, 199, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (747, 199, 5, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (748, 199, 9, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (749, 199, 7, 60, 60, 'Surtido: 60');
INSERT INTO `order_info` VALUES (750, 199, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (751, 199, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (752, 200, 5, 920, 0, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100');
INSERT INTO `order_info` VALUES (753, 200, 9, 120, 120, '\nS:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (754, 200, 7, 120, 120, '\nS:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (755, 200, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (756, 201, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80');
INSERT INTO `order_info` VALUES (757, 201, 2, 680, 680, ' S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200');
INSERT INTO `order_info` VALUES (758, 201, 5, 920, 920, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (759, 201, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 \n');
INSERT INTO `order_info` VALUES (760, 201, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 \n');
INSERT INTO `order_info` VALUES (761, 201, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (762, 202, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80\n');
INSERT INTO `order_info` VALUES (763, 202, 2, 680, 680, ' S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200\n');
INSERT INTO `order_info` VALUES (764, 202, 5, 920, 920, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100');
INSERT INTO `order_info` VALUES (765, 202, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (766, 202, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (767, 202, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (768, 203, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80');
INSERT INTO `order_info` VALUES (769, 203, 2, 680, 680, 'S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200');
INSERT INTO `order_info` VALUES (770, 203, 5, 920, 920, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (771, 203, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20');
INSERT INTO `order_info` VALUES (772, 203, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20');
INSERT INTO `order_info` VALUES (773, 203, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (774, 204, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80\n');
INSERT INTO `order_info` VALUES (775, 204, 2, 680, 680, 'S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200');
INSERT INTO `order_info` VALUES (776, 204, 5, 920, 0, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100');
INSERT INTO `order_info` VALUES (777, 204, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (778, 204, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (779, 204, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (780, 205, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80');
INSERT INTO `order_info` VALUES (781, 205, 2, 680, 680, 'S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200\n');
INSERT INTO `order_info` VALUES (782, 205, 5, 920, 920, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100');
INSERT INTO `order_info` VALUES (783, 205, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (784, 205, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (785, 205, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (786, 206, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80');
INSERT INTO `order_info` VALUES (787, 206, 2, 680, 680, 'S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200');
INSERT INTO `order_info` VALUES (788, 206, 5, 920, 920, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100');
INSERT INTO `order_info` VALUES (789, 206, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (790, 206, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (791, 206, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (792, 207, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80');
INSERT INTO `order_info` VALUES (793, 207, 2, 680, 680, 'S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200\n');
INSERT INTO `order_info` VALUES (794, 207, 5, 920, 920, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100');
INSERT INTO `order_info` VALUES (795, 207, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (796, 207, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (797, 207, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (798, 208, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80');
INSERT INTO `order_info` VALUES (799, 208, 2, 680, 680, 'S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200\n');
INSERT INTO `order_info` VALUES (800, 208, 5, 920, 0, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100');
INSERT INTO `order_info` VALUES (801, 208, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (802, 208, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (803, 208, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (804, 209, 1, 300, 300, 'S:40 \nM:80 \nL:100 \nXL:80\n');
INSERT INTO `order_info` VALUES (805, 209, 2, 680, 680, 'S:60 \nM:120 \nL:150\nXL:150 \nSurtido: 200\n');
INSERT INTO `order_info` VALUES (806, 209, 5, 920, 920, 'S:100 \nM:220 \nL:260 \nXL:240 \nSurtido: 100');
INSERT INTO `order_info` VALUES (807, 209, 9, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (808, 209, 7, 120, 120, 'S:20 \nM:40 \nL:40 \nXL:20 ');
INSERT INTO `order_info` VALUES (809, 209, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (810, 210, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (811, 210, 2, 400, 400, '');
INSERT INTO `order_info` VALUES (812, 210, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (813, 210, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (814, 210, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (815, 210, 8, 300, 300, '');
INSERT INTO `order_info` VALUES (816, 210, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (817, 211, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (818, 211, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (819, 211, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (820, 211, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (821, 211, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (822, 211, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (823, 211, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (824, 212, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (825, 212, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (826, 212, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (827, 212, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (828, 212, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (829, 212, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (830, 212, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (831, 213, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (832, 213, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (833, 213, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (834, 213, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (835, 213, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (836, 213, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (837, 213, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (838, 214, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (839, 214, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (840, 214, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (841, 214, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (842, 214, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (843, 214, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (844, 214, 13, 300, 300, '');
INSERT INTO `order_info` VALUES (845, 214, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (846, 215, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (847, 215, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (848, 215, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (849, 215, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (850, 215, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (851, 215, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (852, 215, 10, 420, 420, '');
INSERT INTO `order_info` VALUES (853, 216, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (854, 216, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (855, 216, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (856, 216, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (857, 216, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (858, 216, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (859, 216, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (860, 217, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (861, 217, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (862, 217, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (863, 217, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (864, 217, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (865, 217, 8, 360, 360, '');
INSERT INTO `order_info` VALUES (866, 217, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (867, 218, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (868, 218, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (869, 218, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (870, 218, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (871, 218, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (872, 218, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (873, 218, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (874, 219, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (875, 219, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (876, 219, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (877, 219, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (878, 219, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (879, 219, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (880, 219, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (881, 220, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (882, 220, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (883, 220, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (884, 220, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (885, 220, 9, 60, 60, '');
INSERT INTO `order_info` VALUES (886, 220, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (887, 220, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (888, 221, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (889, 221, 2, 400, 400, '');
INSERT INTO `order_info` VALUES (890, 221, 5, 440, 440, '');
INSERT INTO `order_info` VALUES (891, 221, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (892, 221, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (893, 221, 8, 360, 360, '');
INSERT INTO `order_info` VALUES (894, 221, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (895, 222, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (896, 222, 2, 400, 400, '');
INSERT INTO `order_info` VALUES (897, 222, 5, 440, 440, '');
INSERT INTO `order_info` VALUES (898, 222, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (899, 222, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (900, 222, 8, 420, 420, '');
INSERT INTO `order_info` VALUES (901, 222, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (902, 223, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (903, 223, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (904, 223, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (905, 223, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (906, 223, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (907, 223, 8, 360, 360, '');
INSERT INTO `order_info` VALUES (908, 223, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (909, 224, 1, 250, 250, 'S:30 \nM:80 \nL:80 \nXL:60');
INSERT INTO `order_info` VALUES (910, 224, 2, 600, 600, 'S:60 \nM:160 \nL:160\nXL:120 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (911, 224, 5, 620, 620, 'S:80 \nM:160 \nL:160\nXL:120 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (912, 224, 9, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (913, 224, 7, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (914, 224, 8, 800, 800, 'S:80 \nM:100 \nL:120\nXL:100 \nSurtido: 400\n');
INSERT INTO `order_info` VALUES (915, 224, 10, 2000, 2000, 'S:200 \nM:400\nL:800\nXL:600 \n');
INSERT INTO `order_info` VALUES (916, 225, 1, 250, 250, 'S:30 \nM:80 \nL:80 \nXL:60\n');
INSERT INTO `order_info` VALUES (917, 225, 2, 600, 600, 'S:60 \nM:160 \nL:160\nXL:120 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (918, 225, 5, 620, 485, 'S:80 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (919, 225, 9, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (920, 225, 7, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (921, 225, 8, 800, 800, 'S:80 \nM:100 \nL:120\nXL:100 \nSurtido: 400\n');
INSERT INTO `order_info` VALUES (922, 225, 10, 400, 400, 'Surtido: 400');
INSERT INTO `order_info` VALUES (923, 226, 1, 250, 250, 'S:30 \nM:80 \nL:80 \nXL:60');
INSERT INTO `order_info` VALUES (924, 226, 2, 600, 600, 'S:60 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (925, 226, 5, 620, 620, 'S:80 \nM:160 \nL:160\nXL:120 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (926, 226, 9, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (927, 226, 7, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (928, 226, 8, 800, 800, 'S:80 \nM:100 \nL:120\nXL:100 \nSurtido: 400');
INSERT INTO `order_info` VALUES (929, 226, 10, 1000, 1000, 'S:100 \nM:200\nL:400\nXL:300 ');
INSERT INTO `order_info` VALUES (930, 227, 1, 250, 250, 'S:30 \nM:80 \nL:80 \nXL:60');
INSERT INTO `order_info` VALUES (931, 227, 2, 600, 600, 'S:60 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (932, 227, 5, 620, 500, 'S:80 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (933, 227, 9, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (934, 227, 7, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (935, 227, 8, 800, 800, 'S:80 \nM:100 \nL:120\nXL:100 \nSurtido: 400');
INSERT INTO `order_info` VALUES (936, 227, 10, 1000, 1000, 'S:100 \nM:200\nL:400\nXL:300 ');
INSERT INTO `order_info` VALUES (937, 228, 1, 250, 250, 'S:30 \nM:80 \nL:80 \nXL:60');
INSERT INTO `order_info` VALUES (938, 228, 2, 600, 600, 'S:60 \nM:160 \nL:160\nXL:120 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (939, 228, 5, 620, 500, 'S:80 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (940, 228, 9, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (941, 228, 7, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (942, 228, 8, 800, 800, 'S:80 \nM:100 \nL:120\nXL:100 \nSurtido: 400');
INSERT INTO `order_info` VALUES (943, 228, 10, 1000, 1000, 'S:100 \nM:200\nL:400\nXL:300 \n');
INSERT INTO `order_info` VALUES (944, 229, 1, 250, 250, 'S:30 \nM:80 \nL:80 \nXL:60\n');
INSERT INTO `order_info` VALUES (945, 229, 2, 600, 600, 'S:60 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (946, 229, 5, 620, 620, 'S:80 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (947, 229, 9, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (948, 229, 7, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (949, 229, 8, 800, 800, 'S:80 \nM:100 \nL:120\nXL:100 \nSurtido: 400');
INSERT INTO `order_info` VALUES (950, 229, 10, 1000, 1000, 'S:100 \nM:200\nL:400\nXL:300 ');
INSERT INTO `order_info` VALUES (951, 230, 1, 250, 250, 'S:30 \nM:80 \nL:80 \nXL:60');
INSERT INTO `order_info` VALUES (952, 230, 2, 600, 600, 'S:60 \nM:160 \nL:160\nXL:120 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (953, 230, 5, 620, 500, 'S:80 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (954, 230, 9, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (955, 230, 7, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (956, 230, 8, 800, 800, 'S:80 \nM:100 \nL:120\nXL:100 \nSurtido: 400');
INSERT INTO `order_info` VALUES (957, 230, 10, 400, 400, 'Surtido: 400\n');
INSERT INTO `order_info` VALUES (958, 231, 1, 250, 250, 'S:30 \nM:80 \nL:80 \nXL:60\n');
INSERT INTO `order_info` VALUES (959, 231, 2, 600, 600, 'S:60 \nM:160 \nL:160\nXL:120 \nSurtido: 100');
INSERT INTO `order_info` VALUES (960, 231, 5, 620, 620, 'S:80 \nM:160 \nL:160\nXL:120 \nSurtido: 100\n');
INSERT INTO `order_info` VALUES (961, 231, 9, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (962, 231, 7, 20, 20, 'Surtido: 20');
INSERT INTO `order_info` VALUES (963, 231, 8, 800, 800, 'S:80 \nM:100 \nL:120\nXL:100 \nSurtido: 400');
INSERT INTO `order_info` VALUES (964, 231, 10, 400, 400, 'Surtido: 400');
INSERT INTO `order_info` VALUES (965, 232, 1, 400, 400, '38:100\n40:100\n42:100\n44:100');
INSERT INTO `order_info` VALUES (966, 232, 2, 880, 880, '38:200\n40:200\n42:200\n44:200\nSurtido: 80');
INSERT INTO `order_info` VALUES (967, 232, 5, 880, 780, '38:200\n40:200\n42:200\n44:200\nSurtido: 80');
INSERT INTO `order_info` VALUES (968, 232, 9, 40, 40, 'Surtido: 40');
INSERT INTO `order_info` VALUES (969, 232, 7, 40, 40, 'Surtido: 40');
INSERT INTO `order_info` VALUES (970, 232, 8, 800, 800, '38:80\n40:100\n42:120\n44:100\nSurtido: 400');
INSERT INTO `order_info` VALUES (971, 232, 10, 1800, 1800, 'Surtido: 1800\n');
INSERT INTO `order_info` VALUES (972, 233, 1, 400, 400, '38:100\n40:100\n42:100\n44:100');
INSERT INTO `order_info` VALUES (973, 233, 2, 880, 880, '38:200\n40:200\n42:200\n44:200\nSurtido: 80');
INSERT INTO `order_info` VALUES (974, 233, 5, 880, 800, '38:200\n40:200\n42:200\n44:200\nSurtido: 80');
INSERT INTO `order_info` VALUES (975, 233, 9, 40, 40, 'Surtido: 40');
INSERT INTO `order_info` VALUES (976, 233, 7, 40, 40, 'Surtido: 40');
INSERT INTO `order_info` VALUES (977, 233, 8, 800, 800, '38:80\n40:100\n42:120\n44:100\nSurtido: 400');
INSERT INTO `order_info` VALUES (978, 233, 10, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (979, 234, 10, 600, 600, 'Surtido: 600');
INSERT INTO `order_info` VALUES (980, 235, 10, 300, 300, 'Surtido: 300');
INSERT INTO `order_info` VALUES (981, 236, 10, 400, 400, 'Surtido: 400');
INSERT INTO `order_info` VALUES (982, 237, 10, 300, 300, 'Surtido: 300');
INSERT INTO `order_info` VALUES (983, 238, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (984, 238, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (985, 238, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (986, 238, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (987, 238, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (988, 239, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (989, 239, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (990, 239, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (991, 239, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (992, 239, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (993, 240, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (994, 240, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (995, 240, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (996, 240, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (997, 240, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (998, 241, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (999, 241, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1000, 241, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1001, 241, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1002, 241, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1003, 242, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1004, 242, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1005, 242, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1006, 242, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1007, 242, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1008, 243, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1009, 243, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1010, 243, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1011, 243, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1012, 243, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1013, 244, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1014, 244, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1015, 244, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1016, 244, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1017, 244, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1018, 245, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1019, 245, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1020, 245, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1021, 245, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1022, 245, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1023, 246, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1024, 246, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1025, 246, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1026, 246, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1027, 246, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1028, 247, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1029, 247, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1030, 247, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1031, 247, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1032, 247, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1033, 248, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1034, 248, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1035, 248, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1036, 248, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1037, 248, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1038, 249, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1039, 249, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1040, 249, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1041, 249, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1042, 249, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1043, 250, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1044, 250, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1045, 250, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1046, 250, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1047, 250, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1048, 251, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1049, 251, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1050, 251, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1051, 251, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1052, 251, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1053, 252, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1054, 252, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1055, 252, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1056, 252, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1057, 252, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1058, 253, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1059, 253, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1060, 253, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1061, 253, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1062, 253, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1063, 254, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1064, 254, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1065, 254, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1066, 254, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1067, 254, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1068, 255, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1069, 255, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1070, 255, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1071, 255, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1072, 255, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1073, 256, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1074, 256, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1075, 256, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1076, 256, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1077, 256, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1078, 257, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1079, 257, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1080, 257, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1081, 257, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1082, 257, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1083, 258, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1084, 258, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1085, 258, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1086, 258, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1087, 258, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1088, 259, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1089, 259, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1090, 259, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1091, 259, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1092, 259, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1093, 260, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1094, 260, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1095, 260, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1096, 260, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1097, 260, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1098, 261, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1099, 261, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1100, 261, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1101, 261, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1102, 261, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1103, 262, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1104, 262, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1105, 262, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1106, 262, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1107, 262, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1108, 263, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1109, 263, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1110, 263, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1111, 263, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1112, 263, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1113, 264, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1114, 264, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1115, 264, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1116, 264, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1117, 264, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1118, 265, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1119, 265, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1120, 265, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1121, 265, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1122, 265, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1123, 266, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1124, 266, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1125, 266, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1126, 266, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1127, 266, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1128, 267, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1129, 267, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1130, 267, 5, 600, 600, '');
INSERT INTO `order_info` VALUES (1131, 267, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1132, 267, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1133, 268, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1134, 268, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1135, 268, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1136, 268, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1137, 268, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1138, 269, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1139, 269, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1140, 269, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1141, 269, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1142, 269, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1143, 270, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1144, 270, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1145, 270, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1146, 270, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1147, 270, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1148, 271, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1149, 271, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1150, 271, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1151, 271, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1152, 271, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1153, 272, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1154, 272, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1155, 272, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1156, 272, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1157, 272, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1158, 273, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1159, 273, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1160, 273, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1161, 273, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1162, 273, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1163, 274, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1164, 274, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1165, 274, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1166, 274, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1167, 274, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1168, 275, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1169, 275, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1170, 275, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1171, 275, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1172, 275, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1173, 276, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1174, 276, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1175, 276, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1176, 276, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1177, 276, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1178, 277, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1179, 277, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1180, 277, 5, 160, 160, '');
INSERT INTO `order_info` VALUES (1181, 277, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1182, 277, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1183, 278, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1184, 278, 2, 250, 250, '');
INSERT INTO `order_info` VALUES (1185, 278, 5, 200, 200, '');
INSERT INTO `order_info` VALUES (1186, 278, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1187, 278, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1188, 278, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1189, 279, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1190, 279, 2, 250, 250, '');
INSERT INTO `order_info` VALUES (1191, 279, 5, 200, 200, '');
INSERT INTO `order_info` VALUES (1192, 279, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1193, 279, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1194, 279, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1195, 280, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1196, 280, 2, 250, 250, '');
INSERT INTO `order_info` VALUES (1197, 280, 5, 200, 200, '');
INSERT INTO `order_info` VALUES (1198, 280, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1199, 280, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1200, 280, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1201, 281, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1202, 281, 2, 250, 250, '');
INSERT INTO `order_info` VALUES (1203, 281, 5, 200, 200, '');
INSERT INTO `order_info` VALUES (1204, 281, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1205, 281, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1206, 281, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1207, 282, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1208, 282, 2, 250, 250, '');
INSERT INTO `order_info` VALUES (1209, 282, 5, 200, 200, '');
INSERT INTO `order_info` VALUES (1210, 282, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1211, 282, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1212, 283, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1213, 283, 2, 250, 250, '');
INSERT INTO `order_info` VALUES (1214, 283, 5, 200, 200, '');
INSERT INTO `order_info` VALUES (1215, 283, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1216, 283, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1217, 283, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1218, 284, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1219, 284, 2, 250, 250, '');
INSERT INTO `order_info` VALUES (1220, 284, 5, 200, 200, '');
INSERT INTO `order_info` VALUES (1221, 284, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1222, 284, 8, 200, 200, '');
INSERT INTO `order_info` VALUES (1223, 284, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1224, 285, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1225, 285, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1226, 285, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1227, 285, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1228, 286, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1229, 286, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1230, 286, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1231, 286, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1232, 286, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1233, 287, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1234, 287, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1235, 287, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1236, 287, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1237, 287, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1238, 288, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1239, 288, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1240, 288, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160');
INSERT INTO `order_info` VALUES (1241, 288, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1242, 288, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200\n');
INSERT INTO `order_info` VALUES (1243, 289, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1244, 289, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1245, 289, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1246, 289, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1247, 289, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200\n');
INSERT INTO `order_info` VALUES (1248, 290, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1249, 290, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1250, 290, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1251, 290, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1252, 290, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200\n');
INSERT INTO `order_info` VALUES (1253, 291, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1254, 291, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1255, 291, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1256, 291, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1257, 291, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200\n');
INSERT INTO `order_info` VALUES (1258, 292, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1259, 292, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1260, 292, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1261, 292, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1262, 292, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200\n');
INSERT INTO `order_info` VALUES (1263, 293, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1264, 293, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1265, 293, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160');
INSERT INTO `order_info` VALUES (1266, 293, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1267, 293, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200\n');
INSERT INTO `order_info` VALUES (1268, 294, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1269, 294, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1270, 294, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1271, 294, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1272, 294, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200\n');
INSERT INTO `order_info` VALUES (1273, 294, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1274, 295, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1275, 295, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1276, 295, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1277, 295, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1278, 295, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200\n');
INSERT INTO `order_info` VALUES (1279, 295, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1280, 296, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1281, 296, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1282, 296, 5, 580, 580, 'S:80\nM:160\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1283, 296, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1284, 296, 8, 400, 400, 'S:40\nM:60\nL:100\nXL:200');
INSERT INTO `order_info` VALUES (1285, 296, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1286, 297, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1287, 297, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1288, 297, 5, 560, 560, '40:200\n42:180\n44:180\n');
INSERT INTO `order_info` VALUES (1289, 297, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1290, 297, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1291, 297, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1292, 298, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1293, 298, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1294, 298, 5, 560, 560, '40:200\n42:180\n44:180\n');
INSERT INTO `order_info` VALUES (1295, 298, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1296, 298, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1297, 298, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1298, 299, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1299, 299, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1300, 299, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1301, 299, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1302, 300, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1303, 300, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1304, 300, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1305, 300, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1306, 300, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1307, 301, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1308, 301, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1309, 301, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1310, 301, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1311, 301, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1312, 302, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1313, 302, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1314, 302, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1315, 302, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1317, 302, 8, 220, 220, 'S:20\nM:20\nL:60\nXL:120\n');
INSERT INTO `order_info` VALUES (1318, 303, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1319, 303, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1320, 303, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1321, 303, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1322, 303, 8, 220, 220, 'S:20\nM:20\nL:60\nXL:120\n');
INSERT INTO `order_info` VALUES (1323, 304, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1324, 304, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1325, 304, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1326, 304, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1327, 304, 8, 220, 220, 'S:20\nM:20\nL:60\nXL:120\n');
INSERT INTO `order_info` VALUES (1328, 304, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1329, 305, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1330, 305, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1331, 305, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1332, 305, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1333, 305, 8, 220, 220, 'S:20\nM:20\nL:60\nXL:120\n');
INSERT INTO `order_info` VALUES (1334, 305, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1335, 306, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1336, 306, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1337, 306, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1338, 306, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1339, 306, 8, 220, 220, 'S:20\nM:20\nL:60\nXL:120\n');
INSERT INTO `order_info` VALUES (1340, 306, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1341, 307, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1342, 307, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1343, 307, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1344, 307, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1345, 307, 8, 220, 220, 'S:20\nM:20\nL:60\nXL:120\n');
INSERT INTO `order_info` VALUES (1346, 307, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1347, 308, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1348, 308, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1349, 308, 5, 560, 560, '40:200\n42:180\n44:180\n');
INSERT INTO `order_info` VALUES (1350, 308, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1351, 308, 10, 2400, 2400, '');
INSERT INTO `order_info` VALUES (1352, 309, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1353, 309, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1354, 309, 5, 560, 560, '40:200\n42:180\n44:180\n');
INSERT INTO `order_info` VALUES (1355, 309, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1356, 309, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1357, 310, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1358, 310, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1359, 310, 5, 400, 400, '\n');
INSERT INTO `order_info` VALUES (1360, 310, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1361, 311, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1362, 311, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1363, 311, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1364, 311, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1365, 312, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1366, 312, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1367, 312, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1368, 312, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1369, 313, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1370, 313, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1371, 313, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1372, 313, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1373, 314, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1374, 314, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1375, 314, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1376, 314, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1377, 315, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1378, 315, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1379, 315, 5, 450, 450, '12:150\n14:150\n16:150\n');
INSERT INTO `order_info` VALUES (1380, 315, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1381, 316, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1382, 316, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1383, 316, 5, 450, 450, '12:150\n14:150\n16:150\n');
INSERT INTO `order_info` VALUES (1384, 316, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1385, 317, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1386, 317, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1387, 317, 5, 450, 450, '12:150\n14:150\n16:150\n');
INSERT INTO `order_info` VALUES (1388, 317, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1389, 318, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1390, 318, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1391, 318, 5, 450, 450, '12:150\n14:150\n16:150\n');
INSERT INTO `order_info` VALUES (1392, 318, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1393, 319, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1394, 319, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1395, 319, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1396, 319, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1397, 320, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1398, 320, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1399, 320, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1400, 320, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1401, 321, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1402, 321, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1403, 321, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1404, 321, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1405, 322, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1406, 322, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1407, 322, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1408, 322, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1409, 323, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1411, 323, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1412, 323, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1413, 323, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1414, 324, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1415, 324, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1416, 324, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1417, 324, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1418, 325, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1419, 325, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1420, 325, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1421, 325, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1422, 326, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1423, 326, 2, 800, 800, '');
INSERT INTO `order_info` VALUES (1424, 326, 5, 760, 760, 'S:100\nM:200\nL:240\nXL:220\n');
INSERT INTO `order_info` VALUES (1425, 326, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1426, 327, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1427, 327, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1428, 328, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1429, 328, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1430, 329, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1431, 329, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1432, 330, 1, 150, 150, '');
INSERT INTO `order_info` VALUES (1433, 330, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1434, 331, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1435, 331, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (1436, 331, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1437, 331, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1438, 332, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1439, 332, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (1440, 332, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1441, 332, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1442, 334, 1, 300, 300, '');
INSERT INTO `order_info` VALUES (1443, 334, 2, 600, 600, '');
INSERT INTO `order_info` VALUES (1444, 334, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1445, 334, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1446, 335, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1447, 335, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1448, 335, 5, 620, 620, 'S:100\nM:180\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1449, 335, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1450, 335, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1451, 336, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1452, 336, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1453, 336, 5, 620, 620, 'S:100\nM:180\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1454, 336, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1455, 336, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1456, 337, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1457, 337, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1458, 337, 5, 620, 620, 'S:100\nM:180\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1459, 337, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1460, 337, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1461, 338, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1462, 338, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1463, 338, 5, 620, 620, 'S:100\nM:180\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1464, 338, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1465, 338, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1466, 339, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1467, 339, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1468, 339, 5, 620, 620, 'S:100\nM:180\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1469, 339, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1470, 339, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1471, 340, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1472, 340, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1473, 340, 5, 620, 620, 'S:100\nM:180\nL:180\nXL:160\n');
INSERT INTO `order_info` VALUES (1474, 340, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1475, 340, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1476, 341, 1, 500, 500, '');
INSERT INTO `order_info` VALUES (1477, 341, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1478, 341, 5, 560, 560, '40:200\n42:180\n44:180\n');
INSERT INTO `order_info` VALUES (1479, 341, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1480, 342, 1, 500, 500, '');
INSERT INTO `order_info` VALUES (1481, 342, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1482, 342, 5, 560, 560, '40:200\n42:180\n44:180\n');
INSERT INTO `order_info` VALUES (1483, 342, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1484, 343, 1, 1900, 1900, '32:300\n34:600\n36:600\n38:400');
INSERT INTO `order_info` VALUES (1485, 343, 2, 11000, 11000, '32:1500\n34:3500\n36:3500\n38:2500');
INSERT INTO `order_info` VALUES (1486, 343, 5, 8000, 8000, 'S:1200\nM:2400\nL:2400\nXL:2000\n');
INSERT INTO `order_info` VALUES (1487, 343, 9, 100, 100, '');
INSERT INTO `order_info` VALUES (1488, 343, 8, 3300, 3300, 'S:500\nM:1000\nL:1000\nXL:800\n');
INSERT INTO `order_info` VALUES (1489, 343, 10, 2400, 2400, '');
INSERT INTO `order_info` VALUES (1490, 344, 1, 1900, 1900, '32:300\n34:600\n36:600\n38:400\n');
INSERT INTO `order_info` VALUES (1491, 344, 2, 11000, 11000, '32:1500\n34:3500\n36:3500\n38:2500');
INSERT INTO `order_info` VALUES (1492, 344, 5, 8000, 8000, 'S:1200\nM:2400\nL:2400\nXL:2000\n');
INSERT INTO `order_info` VALUES (1493, 344, 9, 100, 100, '');
INSERT INTO `order_info` VALUES (1494, 344, 8, 3300, 3300, 'S:500\nM:1000\nL:1000\nXL:800');
INSERT INTO `order_info` VALUES (1495, 344, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1496, 345, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1497, 345, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1498, 345, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1499, 345, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1500, 345, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1501, 346, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1502, 346, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1503, 346, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1504, 346, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1505, 346, 10, 800, 800, '');
INSERT INTO `order_info` VALUES (1506, 347, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1507, 347, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1508, 347, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1509, 347, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1510, 347, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1511, 348, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1512, 348, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1513, 348, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1514, 348, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1515, 348, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1516, 349, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1517, 349, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1518, 349, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1519, 349, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1520, 349, 10, 800, 800, '');
INSERT INTO `order_info` VALUES (1521, 350, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1522, 350, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1523, 350, 5, 400, 400, '');
INSERT INTO `order_info` VALUES (1524, 350, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1525, 350, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1526, 351, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1527, 351, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1528, 351, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1529, 351, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1530, 351, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1531, 352, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1532, 352, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1533, 352, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1534, 352, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1535, 352, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1536, 353, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1537, 353, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1538, 353, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1539, 353, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1540, 353, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1541, 353, 10, 800, 800, '');
INSERT INTO `order_info` VALUES (1542, 354, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1543, 354, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1544, 354, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1545, 354, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1546, 354, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1547, 354, 10, 800, 800, '');
INSERT INTO `order_info` VALUES (1548, 355, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1549, 355, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1550, 355, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1551, 355, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1552, 355, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1553, 355, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1554, 356, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1555, 356, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1556, 356, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1557, 356, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1558, 356, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1559, 356, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1560, 357, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1561, 357, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1562, 357, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1563, 357, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1564, 357, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1565, 358, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1566, 358, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1567, 358, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1568, 358, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1569, 358, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1570, 359, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1571, 359, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1572, 359, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1573, 359, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1574, 359, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1575, 359, 10, 900, 900, '');
INSERT INTO `order_info` VALUES (1576, 360, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1577, 360, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1578, 360, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1579, 360, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1580, 360, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1581, 360, 10, 900, 900, '');
INSERT INTO `order_info` VALUES (1582, 361, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1583, 361, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1584, 361, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1585, 361, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1586, 361, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1587, 361, 10, 900, 900, '');
INSERT INTO `order_info` VALUES (1588, 362, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1589, 362, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1590, 362, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1591, 362, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1592, 362, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1593, 362, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1594, 363, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1595, 363, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1596, 363, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1597, 363, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1598, 363, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1599, 363, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1600, 364, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1601, 364, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1602, 364, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1603, 364, 9, 40, 40, '');
INSERT INTO `order_info` VALUES (1604, 364, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1605, 364, 10, 600, 600, '');
INSERT INTO `order_info` VALUES (1606, 365, 1, 400, 400, '');
INSERT INTO `order_info` VALUES (1607, 365, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1608, 365, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1609, 365, 8, 360, 360, '');
INSERT INTO `order_info` VALUES (1610, 365, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1611, 366, 1, 400, 400, '');
INSERT INTO `order_info` VALUES (1612, 366, 2, 1000, 1000, '');
INSERT INTO `order_info` VALUES (1613, 366, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1614, 366, 8, 360, 360, '');
INSERT INTO `order_info` VALUES (1615, 366, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1616, 367, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1617, 367, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1618, 367, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1619, 367, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1620, 367, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1621, 368, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1622, 368, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1623, 368, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1624, 368, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1625, 368, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1626, 369, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1627, 369, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1628, 369, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1629, 369, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1630, 369, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1631, 370, 1, 200, 200, '');
INSERT INTO `order_info` VALUES (1632, 370, 2, 500, 500, '');
INSERT INTO `order_info` VALUES (1633, 370, 5, 500, 500, '');
INSERT INTO `order_info` VALUES (1634, 370, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1635, 370, 10, 1200, 1200, '');
INSERT INTO `order_info` VALUES (1636, 371, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1637, 371, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1638, 371, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1639, 371, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1640, 371, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1641, 371, 8, 300, 300, '32B:50\n34B:75\n36B:100\n38B:75\n');
INSERT INTO `order_info` VALUES (1642, 371, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1643, 372, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1644, 372, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1645, 372, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1646, 372, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1647, 372, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1648, 372, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1649, 373, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1650, 373, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1651, 373, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1652, 373, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1653, 373, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1654, 373, 8, 300, 300, '32B:50\n34B:75\n36B:100\n38B:75\n');
INSERT INTO `order_info` VALUES (1655, 373, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1656, 374, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1657, 374, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1658, 374, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1659, 374, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1660, 374, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1661, 374, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1662, 375, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1663, 375, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1664, 375, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1665, 375, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1666, 375, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1667, 375, 8, 300, 300, '32B:50\n34B:75\n36B:100\n38B:75\n');
INSERT INTO `order_info` VALUES (1668, 375, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1669, 376, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1670, 376, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1671, 376, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1672, 376, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1673, 376, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1674, 376, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1675, 377, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1676, 377, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1677, 377, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1678, 377, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1679, 377, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1680, 377, 8, 300, 300, '32B:50\n34B:75\n36B:100\n38B:75\n');
INSERT INTO `order_info` VALUES (1681, 377, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1682, 378, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1683, 378, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1684, 378, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1685, 378, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1686, 378, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1687, 378, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1688, 379, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1689, 379, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1690, 379, 5, 300, 0, '');
INSERT INTO `order_info` VALUES (1691, 379, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1692, 379, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1693, 379, 8, 240, 240, '32B:40\n34B:60\n36B:80\n38B:60\n');
INSERT INTO `order_info` VALUES (1694, 379, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (1695, 380, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1696, 380, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1697, 380, 5, 420, 0, '');
INSERT INTO `order_info` VALUES (1698, 380, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1699, 380, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1700, 380, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1701, 381, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1702, 381, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1703, 381, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1704, 381, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1705, 381, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1706, 381, 8, 240, 240, '32B:40\n34B:60\n36B:80\n38B:60\n');
INSERT INTO `order_info` VALUES (1707, 381, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (1708, 382, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1709, 382, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1710, 382, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1711, 382, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1712, 382, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1713, 382, 8, 240, 240, '');
INSERT INTO `order_info` VALUES (1714, 382, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1715, 383, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1716, 383, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1717, 383, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1718, 383, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1719, 383, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1720, 383, 8, 180, 180, '32B:30\n34B:60\n36B:60\n38B:30\n');
INSERT INTO `order_info` VALUES (1721, 383, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1722, 384, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1723, 384, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1724, 384, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1725, 384, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1726, 384, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1727, 384, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1728, 385, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1729, 385, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1730, 385, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1731, 385, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1732, 385, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1733, 385, 8, 180, 180, '32B:30\n34B:60\n36B:60\n38B:30\n');
INSERT INTO `order_info` VALUES (1734, 385, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1735, 386, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1736, 386, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1737, 386, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1738, 386, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1739, 386, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1740, 386, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1741, 387, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1742, 387, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1743, 387, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1744, 387, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1745, 387, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1746, 387, 8, 180, 180, '32B:30\n34B:60\n36B:60\n38B:30\n');
INSERT INTO `order_info` VALUES (1747, 387, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1748, 388, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1749, 388, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1750, 388, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1751, 388, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1752, 388, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1753, 388, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1754, 389, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1755, 389, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1756, 389, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1757, 389, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1758, 389, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1759, 389, 8, 155, 155, '32B:25\n34B:40\n36B:50\n38B:40\n');
INSERT INTO `order_info` VALUES (1760, 389, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1761, 390, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1762, 390, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1763, 390, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1764, 390, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1765, 390, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1766, 390, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1767, 391, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1768, 391, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1769, 391, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1770, 391, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1771, 391, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1772, 391, 8, 155, 155, '32B:25\n34B:40\n36B:50\n38B:40\n');
INSERT INTO `order_info` VALUES (1773, 391, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (1774, 392, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1775, 392, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1776, 392, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1777, 392, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1778, 392, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1779, 392, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1780, 393, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1781, 393, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1782, 393, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1783, 393, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1784, 393, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1785, 393, 8, 120, 120, '32B:20\n34B:40\n36B:40\n38B:20\n');
INSERT INTO `order_info` VALUES (1786, 393, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1787, 394, 1, 180, 180, '');
INSERT INTO `order_info` VALUES (1788, 394, 2, 420, 420, '');
INSERT INTO `order_info` VALUES (1789, 394, 5, 420, 420, '');
INSERT INTO `order_info` VALUES (1790, 394, 9, 30, 30, '');
INSERT INTO `order_info` VALUES (1791, 394, 7, 30, 30, '');
INSERT INTO `order_info` VALUES (1792, 394, 10, 360, 360, '');
INSERT INTO `order_info` VALUES (1793, 395, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1794, 395, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1795, 395, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1796, 395, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1797, 395, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1798, 395, 8, 180, 180, '32B:30\n34B:60\n36B:60\n38B:30\n');
INSERT INTO `order_info` VALUES (1799, 395, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1800, 396, 1, 140, 140, '');
INSERT INTO `order_info` VALUES (1801, 396, 2, 300, 300, '');
INSERT INTO `order_info` VALUES (1802, 396, 5, 300, 300, '');
INSERT INTO `order_info` VALUES (1803, 396, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1804, 396, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1805, 396, 8, 180, 180, '32B:30\n34B:60\n36B:60\n38B:30\n');
INSERT INTO `order_info` VALUES (1806, 396, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1807, 397, 1, 140, 0, '');
INSERT INTO `order_info` VALUES (1808, 397, 2, 300, 200, '');
INSERT INTO `order_info` VALUES (1809, 397, 5, 300, 200, '');
INSERT INTO `order_info` VALUES (1810, 397, 9, 20, 20, '');
INSERT INTO `order_info` VALUES (1811, 397, 7, 20, 20, '');
INSERT INTO `order_info` VALUES (1812, 397, 8, 300, 300, '32B:50\n34B:75\n36B:100\n38B:75\n');
INSERT INTO `order_info` VALUES (1813, 397, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1814, 408, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1815, 407, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1816, 406, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1817, 405, 10, 320, 320, '');
INSERT INTO `order_info` VALUES (1818, 404, 10, 320, 320, '');
INSERT INTO `order_info` VALUES (1819, 403, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1820, 402, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1821, 401, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (1822, 400, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1823, 399, 10, 4040, 4040, '');
INSERT INTO `order_info` VALUES (1824, 409, 10, 320, 320, '');
INSERT INTO `order_info` VALUES (1825, 410, 10, 520, 520, '');
INSERT INTO `order_info` VALUES (1826, 411, 10, 320, 320, '');
INSERT INTO `order_info` VALUES (1827, 412, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1828, 413, 10, 320, 320, '');
INSERT INTO `order_info` VALUES (1829, 414, 10, 240, 240, '');
INSERT INTO `order_info` VALUES (1830, 415, 10, 120, 120, '');
INSERT INTO `order_info` VALUES (1831, 416, 10, 320, 320, '');
INSERT INTO `order_info` VALUES (1832, 417, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1833, 418, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1834, 419, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1835, 420, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1836, 421, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1837, 422, 10, 320, 320, '');
INSERT INTO `order_info` VALUES (1838, 423, 10, 2000, 2000, '');
INSERT INTO `order_info` VALUES (1839, 424, 10, 700, 700, '');
INSERT INTO `order_info` VALUES (1840, 425, 10, 800, 800, '');
INSERT INTO `order_info` VALUES (1841, 426, 10, 800, 800, '');
INSERT INTO `order_info` VALUES (1842, 427, 10, 500, 500, '');
INSERT INTO `order_info` VALUES (1843, 428, 11, 2000, 2000, '');
INSERT INTO `order_info` VALUES (1844, 429, 11, 400, 400, '');
INSERT INTO `order_info` VALUES (1845, 430, 11, 700, 700, '');
INSERT INTO `order_info` VALUES (1846, 431, 11, 400, 400, '');
INSERT INTO `order_info` VALUES (1847, 433, 11, 400, 400, '');
INSERT INTO `order_info` VALUES (1848, 434, 11, 400, 400, '');
INSERT INTO `order_info` VALUES (1849, 435, 11, 400, 400, '');
INSERT INTO `order_info` VALUES (1850, 436, 11, 400, 400, '');
INSERT INTO `order_info` VALUES (1851, 428, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1852, 437, 12, 400, 400, '');
INSERT INTO `order_info` VALUES (1853, 429, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1854, 438, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1855, 439, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1856, 440, 12, 400, 400, '');
INSERT INTO `order_info` VALUES (1857, 430, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1858, 431, 12, 400, 400, '');
INSERT INTO `order_info` VALUES (1859, 432, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1860, 432, 11, 400, 400, '');
INSERT INTO `order_info` VALUES (1861, 441, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1862, 433, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1863, 442, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1864, 443, 12, 200, 200, '');
INSERT INTO `order_info` VALUES (1865, 437, 6, 100, 100, '');
INSERT INTO `order_info` VALUES (1866, 444, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1867, 445, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1868, 446, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1869, 447, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1870, 448, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1871, 449, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1872, 450, 10, 500, 500, '');
INSERT INTO `order_info` VALUES (1873, 451, 10, 200, 200, '');
INSERT INTO `order_info` VALUES (1874, 452, 10, 400, 400, '');
INSERT INTO `order_info` VALUES (1875, 453, 10, 300, 300, '');
INSERT INTO `order_info` VALUES (1876, 454, 10, 200, 200, '');

-- ----------------------------
-- Table structure for packing_box
-- ----------------------------
DROP TABLE IF EXISTS `packing_box`;
CREATE TABLE `packing_box`  (
  `packing_box_id` int(0) NOT NULL AUTO_INCREMENT,
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `box_length` double(10, 2) NULL DEFAULT NULL,
  `box_width` double(10, 2) NULL DEFAULT NULL,
  `box_high` double(10, 2) NULL DEFAULT NULL,
  `volume` double(10, 4) NULL DEFAULT NULL,
  `box_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`packing_box_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of packing_box
-- ----------------------------
INSERT INTO `packing_box` VALUES (5, '78.0cm X 35.0cm X 45.0cm', 78.00, 35.00, 45.00, 0.1228, '');
INSERT INTO `packing_box` VALUES (6, '80.0cm X 35.0cm X 50.0cm', 80.00, 35.00, 50.00, 0.1400, '');
INSERT INTO `packing_box` VALUES (7, '53.0cm X 34.0cm X 35.0cm', 53.00, 34.00, 35.00, 0.0631, '');
INSERT INTO `packing_box` VALUES (8, '45.0cm X 34.0cm X 32.0cm', 45.00, 34.00, 32.00, 0.0490, '');
INSERT INTO `packing_box` VALUES (9, '60.0cm X 38.0cm X 46.0cm', 60.00, 38.00, 46.00, 0.1049, '');
INSERT INTO `packing_box` VALUES (10, '60.0cm X 36.0cm X 35.0cm', 60.00, 36.00, 35.00, 0.0756, '');
INSERT INTO `packing_box` VALUES (11, '53.0cm X 34.0cm X 39.0cm', 53.00, 34.00, 39.00, 0.0703, '');
INSERT INTO `packing_box` VALUES (12, '60.0cm X 38.0cm X 40.0cm', 60.00, 38.00, 40.00, 0.0912, '');
INSERT INTO `packing_box` VALUES (13, '50.0cm X 38.0cm X 63.0cm', 50.00, 38.00, 63.00, 0.1197, '');
INSERT INTO `packing_box` VALUES (14, '45.0cm X 34.0cm X 34.0cm', 45.00, 34.00, 34.00, 0.0520, '');
INSERT INTO `packing_box` VALUES (15, '44.0cm X 36.0cm X 62.0cm', 44.00, 36.00, 62.00, 0.0982, '');
INSERT INTO `packing_box` VALUES (16, '46.0cm X 38.0cm X 62.0cm', 46.00, 38.00, 62.00, 0.1084, '');
INSERT INTO `packing_box` VALUES (17, '42.0cm X 33.0cm X 70.0cm', 42.00, 33.00, 70.00, 0.0970, '');
INSERT INTO `packing_box` VALUES (18, '47.0cm X 38.0cm X 60.0cm', 47.00, 38.00, 60.00, 0.1072, '');
INSERT INTO `packing_box` VALUES (19, '42.0cm X 38.0cm X 71.0cm', 42.00, 38.00, 71.00, 0.1133, '');
INSERT INTO `packing_box` VALUES (20, '52.0cm X 33.0cm X 53.0cm', 52.00, 33.00, 53.00, 0.0909, '');
INSERT INTO `packing_box` VALUES (21, '41.0cm X 34.0cm X 68.0cm', 41.00, 34.00, 68.00, 0.0948, '');
INSERT INTO `packing_box` VALUES (22, '51.0cm X 40.0cm X 66.0cm', 51.00, 40.00, 66.00, 0.1346, '');
INSERT INTO `packing_box` VALUES (23, '61.0cm X 34.0cm X 48.0cm', 61.00, 34.00, 48.00, 0.0996, '');
INSERT INTO `packing_box` VALUES (24, '64.0cm X 37.0cm X 58.0cm', 64.00, 37.00, 58.00, 0.1373, '');
INSERT INTO `packing_box` VALUES (25, '42.0cm X 40.0cm X 64.0cm', 42.00, 40.00, 64.00, 0.1075, '');
INSERT INTO `packing_box` VALUES (26, '84.0cm X 30.0cm X 57.0cm', 84.00, 30.00, 57.00, 0.1436, '');
INSERT INTO `packing_box` VALUES (27, '63.0cm X 35.0cm X 69.0cm', 63.00, 35.00, 69.00, 0.1521, '');
INSERT INTO `packing_box` VALUES (28, '72.0cm X 30.0cm X 65.0cm', 72.00, 30.00, 65.00, 0.1404, '');
INSERT INTO `packing_box` VALUES (29, '63.0cm X 35.0cm X 64.0cm', 63.00, 35.00, 64.00, 0.1411, '');
INSERT INTO `packing_box` VALUES (30, '75.0cm X 30.0cm X 55.0cm', 75.00, 30.00, 55.00, 0.1238, '');
INSERT INTO `packing_box` VALUES (31, '55.0cm X 40.0cm X 25.0cm', 55.00, 40.00, 25.00, 0.0550, '');
INSERT INTO `packing_box` VALUES (32, '85.0cm X 30.0cm X 65.0cm', 85.00, 30.00, 65.00, 0.1657, '');
INSERT INTO `packing_box` VALUES (33, '88.0cm X 32.0cm X 52.0cm', 88.00, 32.00, 52.00, 0.1464, '');
INSERT INTO `packing_box` VALUES (34, '70.0cm X 30.0cm X 52.0cm', 70.00, 30.00, 52.00, 0.1092, '');
INSERT INTO `packing_box` VALUES (35, '75.0cm X 32.0cm X 60.0cm', 75.00, 32.00, 60.00, 0.1440, '');
INSERT INTO `packing_box` VALUES (36, '78.0cm X 30.0cm X 63.0cm', 78.00, 30.00, 63.00, 0.1474, '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(0) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `role_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `role_state` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1 启用 0 禁用',
  `create_by` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` int(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员', 'supper_manage', '1', 1, '2017-11-14 16:49:12', 1, '2017-11-14 16:49:20');
INSERT INTO `role` VALUES (2, '管理员', '管理员', 'manage', '0', 1, '2018-11-14 16:49:12', 1, NULL);
INSERT INTO `role` VALUES (3, '普通用户', '普通用户', 'comm_manage', '0', 1, '2019-11-14 16:49:12', 1, '2022-03-25 15:09:41');
INSERT INTO `role` VALUES (11, '采购', '采购管理员', 'purchase_man', '1', 1, '2022-04-22 12:29:00', 1, '2022-04-22 13:56:29');
INSERT INTO `role` VALUES (12, '入库', '入库管理员', 'in_store', '1', 1, '2022-04-22 13:56:17', NULL, NULL);
INSERT INTO `role` VALUES (13, '商品', '商品管理员', 'commodity_manager', '1', 1, '2022-04-22 13:57:42', NULL, NULL);
INSERT INTO `role` VALUES (14, '出库', '出库管理员', 'out_store', '1', 1, '2022-04-22 14:00:00', NULL, NULL);
INSERT INTO `role` VALUES (15, '调货', '调货管理员', 'transshipment_manager', '1', 1, '2022-04-22 14:00:38', NULL, NULL);
INSERT INTO `role` VALUES (16, '仓库', '仓库管理员', 'store_manager', '1', 1, '2022-04-24 15:12:56', NULL, NULL);

-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth`  (
  `role_auth_id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NULL DEFAULT NULL,
  `auth_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`role_auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 745 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_auth
-- ----------------------------
INSERT INTO `role_auth` VALUES (118, 4, 1);
INSERT INTO `role_auth` VALUES (119, 4, 2);
INSERT INTO `role_auth` VALUES (120, 4, 3);
INSERT INTO `role_auth` VALUES (121, 4, 10);
INSERT INTO `role_auth` VALUES (122, 4, 23);
INSERT INTO `role_auth` VALUES (123, 4, 24);
INSERT INTO `role_auth` VALUES (124, 4, 35);
INSERT INTO `role_auth` VALUES (125, 4, 36);
INSERT INTO `role_auth` VALUES (126, 4, 4);
INSERT INTO `role_auth` VALUES (127, 4, 5);
INSERT INTO `role_auth` VALUES (128, 4, 6);
INSERT INTO `role_auth` VALUES (129, 4, 27);
INSERT INTO `role_auth` VALUES (130, 4, 28);
INSERT INTO `role_auth` VALUES (131, 4, 7);
INSERT INTO `role_auth` VALUES (132, 4, 8);
INSERT INTO `role_auth` VALUES (133, 4, 9);
INSERT INTO `role_auth` VALUES (134, 5, 1);
INSERT INTO `role_auth` VALUES (135, 5, 2);
INSERT INTO `role_auth` VALUES (136, 5, 3);
INSERT INTO `role_auth` VALUES (137, 5, 10);
INSERT INTO `role_auth` VALUES (138, 8, 1);
INSERT INTO `role_auth` VALUES (139, 8, 2);
INSERT INTO `role_auth` VALUES (140, 8, 3);
INSERT INTO `role_auth` VALUES (141, 8, 10);
INSERT INTO `role_auth` VALUES (142, 8, 23);
INSERT INTO `role_auth` VALUES (143, 8, 24);
INSERT INTO `role_auth` VALUES (535, 2, 1);
INSERT INTO `role_auth` VALUES (536, 2, 2);
INSERT INTO `role_auth` VALUES (537, 2, 3);
INSERT INTO `role_auth` VALUES (538, 2, 10);
INSERT INTO `role_auth` VALUES (539, 2, 23);
INSERT INTO `role_auth` VALUES (540, 2, 24);
INSERT INTO `role_auth` VALUES (541, 2, 25);
INSERT INTO `role_auth` VALUES (542, 2, 26);
INSERT INTO `role_auth` VALUES (543, 2, 35);
INSERT INTO `role_auth` VALUES (544, 2, 36);
INSERT INTO `role_auth` VALUES (545, 2, 4);
INSERT INTO `role_auth` VALUES (546, 2, 5);
INSERT INTO `role_auth` VALUES (547, 2, 6);
INSERT INTO `role_auth` VALUES (548, 2, 27);
INSERT INTO `role_auth` VALUES (549, 2, 28);
INSERT INTO `role_auth` VALUES (550, 2, 30);
INSERT INTO `role_auth` VALUES (551, 2, 31);
INSERT INTO `role_auth` VALUES (552, 2, 37);
INSERT INTO `role_auth` VALUES (553, 2, 7);
INSERT INTO `role_auth` VALUES (554, 2, 8);
INSERT INTO `role_auth` VALUES (555, 2, 9);
INSERT INTO `role_auth` VALUES (556, 2, 32);
INSERT INTO `role_auth` VALUES (557, 2, 33);
INSERT INTO `role_auth` VALUES (558, 2, 34);
INSERT INTO `role_auth` VALUES (559, 2, 20);
INSERT INTO `role_auth` VALUES (560, 2, 21);
INSERT INTO `role_auth` VALUES (561, 2, 22);
INSERT INTO `role_auth` VALUES (562, 3, 23);
INSERT INTO `role_auth` VALUES (563, 3, 36);
INSERT INTO `role_auth` VALUES (564, 1, 1);
INSERT INTO `role_auth` VALUES (565, 1, 2);
INSERT INTO `role_auth` VALUES (566, 1, 3);
INSERT INTO `role_auth` VALUES (567, 1, 10);
INSERT INTO `role_auth` VALUES (568, 1, 23);
INSERT INTO `role_auth` VALUES (569, 1, 24);
INSERT INTO `role_auth` VALUES (570, 1, 25);
INSERT INTO `role_auth` VALUES (571, 1, 26);
INSERT INTO `role_auth` VALUES (572, 1, 35);
INSERT INTO `role_auth` VALUES (573, 1, 36);
INSERT INTO `role_auth` VALUES (574, 1, 4);
INSERT INTO `role_auth` VALUES (575, 1, 5);
INSERT INTO `role_auth` VALUES (576, 1, 6);
INSERT INTO `role_auth` VALUES (577, 1, 27);
INSERT INTO `role_auth` VALUES (578, 1, 28);
INSERT INTO `role_auth` VALUES (579, 1, 30);
INSERT INTO `role_auth` VALUES (580, 1, 31);
INSERT INTO `role_auth` VALUES (581, 1, 37);
INSERT INTO `role_auth` VALUES (582, 1, 7);
INSERT INTO `role_auth` VALUES (583, 1, 8);
INSERT INTO `role_auth` VALUES (584, 1, 9);
INSERT INTO `role_auth` VALUES (585, 1, 32);
INSERT INTO `role_auth` VALUES (586, 1, 33);
INSERT INTO `role_auth` VALUES (587, 1, 34);
INSERT INTO `role_auth` VALUES (588, 1, 22);
INSERT INTO `role_auth` VALUES (589, 1, 42);
INSERT INTO `role_auth` VALUES (590, 1, 50);
INSERT INTO `role_auth` VALUES (591, 1, 92);
INSERT INTO `role_auth` VALUES (592, 1, 93);
INSERT INTO `role_auth` VALUES (593, 1, 94);
INSERT INTO `role_auth` VALUES (594, 1, 76);
INSERT INTO `role_auth` VALUES (595, 1, 53);
INSERT INTO `role_auth` VALUES (596, 1, 56);
INSERT INTO `role_auth` VALUES (597, 1, 54);
INSERT INTO `role_auth` VALUES (598, 1, 57);
INSERT INTO `role_auth` VALUES (599, 1, 95);
INSERT INTO `role_auth` VALUES (600, 1, 55);
INSERT INTO `role_auth` VALUES (601, 1, 58);
INSERT INTO `role_auth` VALUES (602, 1, 63);
INSERT INTO `role_auth` VALUES (603, 1, 64);
INSERT INTO `role_auth` VALUES (604, 1, 68);
INSERT INTO `role_auth` VALUES (605, 1, 71);
INSERT INTO `role_auth` VALUES (606, 1, 96);
INSERT INTO `role_auth` VALUES (607, 1, 69);
INSERT INTO `role_auth` VALUES (608, 1, 70);
INSERT INTO `role_auth` VALUES (694, 16, 63);
INSERT INTO `role_auth` VALUES (695, 16, 64);
INSERT INTO `role_auth` VALUES (696, 16, 69);
INSERT INTO `role_auth` VALUES (697, 16, 70);
INSERT INTO `role_auth` VALUES (698, 11, 42);
INSERT INTO `role_auth` VALUES (699, 11, 50);
INSERT INTO `role_auth` VALUES (700, 11, 92);
INSERT INTO `role_auth` VALUES (701, 11, 93);
INSERT INTO `role_auth` VALUES (702, 11, 94);
INSERT INTO `role_auth` VALUES (703, 11, 97);
INSERT INTO `role_auth` VALUES (704, 11, 76);
INSERT INTO `role_auth` VALUES (705, 11, 53);
INSERT INTO `role_auth` VALUES (706, 11, 56);
INSERT INTO `role_auth` VALUES (707, 11, 63);
INSERT INTO `role_auth` VALUES (708, 11, 64);
INSERT INTO `role_auth` VALUES (709, 12, 54);
INSERT INTO `role_auth` VALUES (710, 12, 57);
INSERT INTO `role_auth` VALUES (711, 12, 95);
INSERT INTO `role_auth` VALUES (712, 12, 63);
INSERT INTO `role_auth` VALUES (713, 12, 64);
INSERT INTO `role_auth` VALUES (714, 13, 42);
INSERT INTO `role_auth` VALUES (715, 13, 50);
INSERT INTO `role_auth` VALUES (716, 13, 92);
INSERT INTO `role_auth` VALUES (717, 13, 93);
INSERT INTO `role_auth` VALUES (718, 13, 94);
INSERT INTO `role_auth` VALUES (719, 13, 97);
INSERT INTO `role_auth` VALUES (720, 13, 76);
INSERT INTO `role_auth` VALUES (721, 13, 63);
INSERT INTO `role_auth` VALUES (722, 13, 64);
INSERT INTO `role_auth` VALUES (723, 14, 42);
INSERT INTO `role_auth` VALUES (724, 14, 50);
INSERT INTO `role_auth` VALUES (725, 14, 92);
INSERT INTO `role_auth` VALUES (726, 14, 93);
INSERT INTO `role_auth` VALUES (727, 14, 94);
INSERT INTO `role_auth` VALUES (728, 14, 97);
INSERT INTO `role_auth` VALUES (729, 14, 76);
INSERT INTO `role_auth` VALUES (730, 14, 55);
INSERT INTO `role_auth` VALUES (731, 14, 58);
INSERT INTO `role_auth` VALUES (732, 14, 63);
INSERT INTO `role_auth` VALUES (733, 14, 64);
INSERT INTO `role_auth` VALUES (734, 15, 42);
INSERT INTO `role_auth` VALUES (735, 15, 50);
INSERT INTO `role_auth` VALUES (736, 15, 92);
INSERT INTO `role_auth` VALUES (737, 15, 93);
INSERT INTO `role_auth` VALUES (738, 15, 94);
INSERT INTO `role_auth` VALUES (739, 15, 97);
INSERT INTO `role_auth` VALUES (740, 15, 76);
INSERT INTO `role_auth` VALUES (741, 15, 63);
INSERT INTO `role_auth` VALUES (742, 15, 64);
INSERT INTO `role_auth` VALUES (743, 15, 68);
INSERT INTO `role_auth` VALUES (744, 15, 71);
INSERT INTO `role_auth` VALUES (745, 15, 96);

-- ----------------------------
-- Table structure for shipment_code
-- ----------------------------
DROP TABLE IF EXISTS `shipment_code`;
CREATE TABLE `shipment_code`  (
  `shipment_code_id` int(0) NOT NULL AUTO_INCREMENT,
  `shipment_code_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipment_total_price` decimal(10, 2) NULL DEFAULT NULL,
  `shipment_date` datetime(0) NULL DEFAULT NULL,
  `shipment_code_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`shipment_code_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipment_code
-- ----------------------------
INSERT INTO `shipment_code` VALUES (1, '20240924A', 0.00, '2024-09-24 00:00:00', 'chuhuo');

-- ----------------------------
-- Table structure for shipment_info
-- ----------------------------
DROP TABLE IF EXISTS `shipment_info`;
CREATE TABLE `shipment_info`  (
  `shipment_id` int(0) NOT NULL AUTO_INCREMENT,
  `shipment_code_id` int(0) NULL DEFAULT NULL,
  `order_id` int(0) NULL DEFAULT NULL,
  `shipment_num` int(0) NULL DEFAULT NULL,
  `shipment_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `packing_box_id` int(0) NULL DEFAULT NULL COMMENT '包装箱规格',
  `doz_per_box` int(0) NULL DEFAULT NULL COMMENT '打/箱',
  `net_weight` double(10, 2) NULL DEFAULT NULL COMMENT '净重',
  `gross_weight` double(10, 2) NULL DEFAULT NULL COMMENT '毛重',
  `tallas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '尺码',
  PRIMARY KEY (`shipment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipment_info
-- ----------------------------
INSERT INTO `shipment_info` VALUES (1, 1, 1823, 4040, NULL, 7, 40, 12.00, 13.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (2, 1, 1822, 400, NULL, 8, 40, 8.80, 9.60, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (3, 1, 1821, 120, NULL, 9, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (4, 1, 1820, 200, NULL, 9, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (5, 1, 1819, 400, NULL, 9, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (6, 1, 1818, 320, NULL, 7, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (7, 1, 1817, 320, NULL, 10, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (8, 1, 1816, 200, NULL, 11, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (9, 1, 1815, 200, NULL, 11, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (10, 1, 1814, 200, NULL, 9, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (11, 1, 1824, 320, NULL, 7, 40, 13.00, 14.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (12, 1, 1825, 520, NULL, 12, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (13, 1, 1826, 320, NULL, 13, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (14, 1, 1827, 200, NULL, 9, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (15, 1, 1828, 320, NULL, 7, 40, 13.00, 14.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (16, 1, 1829, 240, NULL, 7, 40, 8.80, 9.60, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (17, 1, 1830, 120, NULL, 9, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (18, 1, 296, 120, NULL, 9, 40, 23.00, 24.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (19, 1, 1831, 320, NULL, 7, 40, 13.00, 14.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (20, 1, 1832, 200, NULL, 7, 40, 13.00, 14.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (21, 1, 1833, 200, NULL, 7, 40, 13.00, 14.00, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (22, 1, 1834, 400, NULL, 7, 40, 8.80, 9.60, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (23, 1, 1835, 200, NULL, 14, 40, 8.80, 9.60, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (24, 1, 1836, 200, NULL, 14, 40, 8.80, 9.60, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (25, 1, 1837, 320, NULL, 7, 40, 8.80, 9.60, 'S/M/L/XL');
INSERT INTO `shipment_info` VALUES (26, 1, 943, 120, NULL, 15, 24, 20.00, 21.00, 'P/S');
INSERT INTO `shipment_info` VALUES (27, 1, 943, 192, NULL, 15, 24, 22.00, 23.00, 'M/M');
INSERT INTO `shipment_info` VALUES (28, 1, 943, 25, NULL, 15, 25, 22.00, 23.00, 'M/M');
INSERT INTO `shipment_info` VALUES (29, 1, 943, 408, NULL, 16, 24, 28.50, 29.50, 'G/L');
INSERT INTO `shipment_info` VALUES (30, 1, 943, 312, NULL, 16, 24, 31.00, 32.00, 'EG/XL');
INSERT INTO `shipment_info` VALUES (31, 1, 957, 408, NULL, 17, 24, 27.50, 28.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (32, 1, 957, 29, NULL, 17, 29, 27.50, 28.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (33, 1, 1838, 1800, NULL, 18, 20, 29.00, 30.00, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (34, 1, 1838, 19, NULL, 18, 19, 29.00, 30.00, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (35, 1, 1839, 620, NULL, 18, 20, 29.00, 30.00, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (36, 1, 1839, 10, NULL, 18, 10, 29.00, 30.00, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (37, 1, 1840, 720, NULL, 19, 24, 30.00, 31.00, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (38, 1, 1840, 19, NULL, 19, 19, 30.00, 31.00, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (39, 1, 1841, 720, NULL, 19, 24, 30.00, 31.00, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (40, 1, 1841, 27, NULL, 19, 27, 30.00, 31.00, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (41, 1, 590, 160, NULL, 20, 40, 29.60, 30.60, '12.14.16');
INSERT INTO `shipment_info` VALUES (42, 1, 598, 240, NULL, 21, 24, 26.50, 27.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (43, 1, 598, 22, NULL, 21, 22, 26.50, 27.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (44, 1, 602, 240, NULL, 21, 24, 26.50, 27.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (45, 1, 602, 34, NULL, 21, 34, 26.50, 27.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (46, 1, 610, 312, NULL, 21, 24, 26.50, 27.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (47, 1, 610, 21, NULL, 21, 21, 26.50, 27.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (48, 1, 614, 312, NULL, 21, 24, 26.50, 27.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (49, 1, 614, 27, NULL, 21, 27, 26.50, 27.50, 'P/S.M/M.G/L.EG/XL');
INSERT INTO `shipment_info` VALUES (50, 1, 680, 600, NULL, 22, 24, 27.60, 28.60, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (51, 1, 680, 16, NULL, 22, 16, 27.60, 28.60, '38.40.42.44');
INSERT INTO `shipment_info` VALUES (52, 1, 692, 180, NULL, 23, 30, 20.00, 20.50, '4、6、8、10');
INSERT INTO `shipment_info` VALUES (53, 1, 692, 36, NULL, 23, 36, 20.00, 20.50, '4、6、8、10');
INSERT INTO `shipment_info` VALUES (54, 1, 710, 180, NULL, 23, 30, 20.00, 20.50, '4、6、8、10');
INSERT INTO `shipment_info` VALUES (55, 1, 710, 37, NULL, 23, 37, 20.00, 20.50, '4、6、8、10');
INSERT INTO `shipment_info` VALUES (56, 1, 730, 270, NULL, 24, 30, 24.00, 25.00, '12、14、16');
INSERT INTO `shipment_info` VALUES (57, 1, 730, 37, NULL, 24, 37, 24.00, 25.00, '12、14、16');
INSERT INTO `shipment_info` VALUES (58, 1, 755, 200, NULL, 25, 20, 22.00, 23.00, 'P/S、M/M、G/L、EG/XL');
INSERT INTO `shipment_info` VALUES (59, 1, 755, 29, NULL, 25, 29, 22.00, 23.00, 'P/S、M/M、G/L、EG/XL');
INSERT INTO `shipment_info` VALUES (60, 1, 773, 200, NULL, 25, 20, 22.00, 23.00, 'P/S、M/M、G/L、EG/XL');
INSERT INTO `shipment_info` VALUES (61, 1, 773, 28, NULL, 25, 28, 22.00, 23.00, 'P/S、M/M、G/L、EG/XL');
INSERT INTO `shipment_info` VALUES (62, 1, 785, 200, NULL, 25, 20, 22.00, 23.00, 'P/S、M/M、G/L、EG/XL');
INSERT INTO `shipment_info` VALUES (63, 1, 785, 26, NULL, 25, 26, 22.00, 23.00, 'P/S、M/M、G/L、EG/XL');
INSERT INTO `shipment_info` VALUES (64, 1, 797, 200, NULL, 25, 20, 22.00, 23.00, 'P/S、M/M、G/L、EG/XL');
INSERT INTO `shipment_info` VALUES (65, 1, 797, 29, NULL, 25, 29, 22.00, 23.00, 'P/S、M/M、G/L、EG/XL');
INSERT INTO `shipment_info` VALUES (66, 1, 1842, 360, NULL, 5, 30, 25.50, 27.00, '34-44\n混色混码');
INSERT INTO `shipment_info` VALUES (67, 1, 1842, 41, NULL, 6, 41, 34.00, 35.50, '34-44\n混色混码');
INSERT INTO `shipment_info` VALUES (68, 1, 859, 360, NULL, 5, 30, 26.00, 27.50, '34-44\n混色混码');
INSERT INTO `shipment_info` VALUES (69, 1, 859, 41, NULL, 6, 41, 26.00, 27.50, '34-44\n混色混码');
INSERT INTO `shipment_info` VALUES (70, 1, 1843, 280, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (71, 1, 1843, 360, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (72, 1, 1844, 360, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (73, 1, 1845, 660, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (74, 1, 1846, 360, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (75, 1, 1843, 1140, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (76, 1, 1860, 360, NULL, 28, 30, 22.00, 23.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (77, 1, 1847, 360, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (78, 1, 1848, 360, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (79, 1, 1849, 360, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (80, 1, 1850, 360, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (81, 1, 1851, 120, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (82, 1, 1852, 180, NULL, 29, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (83, 1, 1853, 120, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (84, 1, 1854, 180, NULL, 28, 30, 22.00, 23.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (85, 1, 1855, 180, NULL, 28, 30, 22.00, 23.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (86, 1, 1856, 180, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (87, 1, 1857, 120, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (88, 1, 1858, 180, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (89, 1, 1859, 180, NULL, 28, 30, 22.00, 23.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (90, 1, 1861, 160, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (91, 1, 1862, 120, NULL, 26, 20, 16.00, 17.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (92, 1, 1863, 180, NULL, 28, 30, 22.00, 23.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (93, 1, 1852, 140, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (94, 1, 1858, 140, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (95, 1, 1856, 140, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (96, 1, 1864, 180, NULL, 28, 30, 22.00, 23.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (97, 1, 1865, 60, NULL, 27, 20, 22.00, 23.00, '34C-42C');
INSERT INTO `shipment_info` VALUES (98, 1, 1866, 180, NULL, 30, 20, 16.00, 18.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (99, 1, 1866, 21, NULL, 30, 21, 16.00, 18.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (100, 1, 1867, 240, NULL, 30, 20, 16.00, 18.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (101, 1, 1868, 330, NULL, 31, 30, 10.00, 11.00, 'S-XL');
INSERT INTO `shipment_info` VALUES (102, 1, 1868, 28, NULL, 31, 28, 10.00, 11.00, 'S-XL');
INSERT INTO `shipment_info` VALUES (103, 1, 1869, 220, NULL, 30, 20, 20.00, 21.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (104, 1, 1869, 21, NULL, 30, 21, 20.00, 21.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (105, 1, 1870, 330, NULL, 31, 30, 10.00, 11.00, 'S-XL');
INSERT INTO `shipment_info` VALUES (106, 1, 1870, 29, NULL, 31, 29, 10.00, 11.00, 'S-XL');
INSERT INTO `shipment_info` VALUES (107, 1, 1871, 220, NULL, 32, 20, 23.00, 24.00, '32B-38B');
INSERT INTO `shipment_info` VALUES (108, 1, 1871, 19, NULL, 32, 19, 23.00, 24.00, NULL);
INSERT INTO `shipment_info` VALUES (109, 1, 1872, 300, NULL, 33, 20, 16.00, 18.00, '32-38B');
INSERT INTO `shipment_info` VALUES (110, 1, 1873, 200, NULL, 34, 20, 16.00, 18.00, '32-38B');
INSERT INTO `shipment_info` VALUES (111, 1, 1874, 400, NULL, 35, 20, 23.00, 25.00, '36-42C');
INSERT INTO `shipment_info` VALUES (112, 1, 1875, 300, NULL, 33, 20, 16.00, 18.00, '32-38B');
INSERT INTO `shipment_info` VALUES (113, 1, 1876, 200, NULL, 36, 20, 19.00, 21.00, '32-38B');

-- ----------------------------
-- Table structure for shipment_test
-- ----------------------------
DROP TABLE IF EXISTS `shipment_test`;
CREATE TABLE `shipment_test`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `style_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mark_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shipment_test
-- ----------------------------
INSERT INTO `shipment_test` VALUES (1, 'LR04O1', 'T', 'PANTY DAMA');
INSERT INTO `shipment_test` VALUES (2, 'DX04S114', 'T', 'HILO DAMA');
INSERT INTO `shipment_test` VALUES (3, 'DX0420-S37', 'T', 'BOXER DAMA');
INSERT INTO `shipment_test` VALUES (4, 'DX04S61', 'T', 'PANTY DAMA');

-- ----------------------------
-- Table structure for style_color
-- ----------------------------
DROP TABLE IF EXISTS `style_color`;
CREATE TABLE `style_color`  (
  `style_color_id` int(0) NOT NULL AUTO_INCREMENT,
  `color_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `color_matching` int(0) NULL DEFAULT NULL,
  `style_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`style_color_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of style_color
-- ----------------------------
INSERT INTO `style_color` VALUES (26, '黑色', 4, 57);
INSERT INTO `style_color` VALUES (27, '白色', 4, 57);
INSERT INTO `style_color` VALUES (28, '酒红', 1, 57);
INSERT INTO `style_color` VALUES (29, '桃红', 1, 57);
INSERT INTO `style_color` VALUES (30, '深杏', 2, 57);
INSERT INTO `style_color` VALUES (31, '黑色', 4, 58);
INSERT INTO `style_color` VALUES (32, '白色', 4, 58);
INSERT INTO `style_color` VALUES (33, '肤色', 2, 58);
INSERT INTO `style_color` VALUES (34, '艳红', 1, 58);
INSERT INTO `style_color` VALUES (35, '深灰', 1, 58);
INSERT INTO `style_color` VALUES (36, '黑色', 4, 59);
INSERT INTO `style_color` VALUES (37, '白色', 4, 59);
INSERT INTO `style_color` VALUES (38, '杏色', 2, 59);
INSERT INTO `style_color` VALUES (39, '大红', 1, 59);
INSERT INTO `style_color` VALUES (40, '紫色', 1, 59);
INSERT INTO `style_color` VALUES (41, '黑色', 4, 60);
INSERT INTO `style_color` VALUES (42, '白色', 4, 60);
INSERT INTO `style_color` VALUES (43, '深杏', 2, 60);
INSERT INTO `style_color` VALUES (44, '酒红', 1, 60);
INSERT INTO `style_color` VALUES (45, '桃红', 1, 60);
INSERT INTO `style_color` VALUES (46, '黑色', 4, 61);
INSERT INTO `style_color` VALUES (47, '白色', 4, 61);
INSERT INTO `style_color` VALUES (48, '肤色', 2, 61);
INSERT INTO `style_color` VALUES (49, '艳红', 1, 61);
INSERT INTO `style_color` VALUES (50, '深灰', 1, 61);
INSERT INTO `style_color` VALUES (51, '黑色', 4, 62);
INSERT INTO `style_color` VALUES (52, '白色', 4, 62);
INSERT INTO `style_color` VALUES (53, '深杏', 2, 62);
INSERT INTO `style_color` VALUES (54, '酒红', 1, 62);
INSERT INTO `style_color` VALUES (55, '桃红', 1, 62);
INSERT INTO `style_color` VALUES (56, '黑色', 4, 63);
INSERT INTO `style_color` VALUES (57, '白色', 4, 63);
INSERT INTO `style_color` VALUES (58, '杏色', 2, 63);
INSERT INTO `style_color` VALUES (59, '大红', 1, 63);
INSERT INTO `style_color` VALUES (60, '紫色', 1, 63);
INSERT INTO `style_color` VALUES (61, '黑色', 4, 64);
INSERT INTO `style_color` VALUES (62, '白色', 4, 64);
INSERT INTO `style_color` VALUES (63, '肤色', 2, 64);
INSERT INTO `style_color` VALUES (64, '艳红', 1, 64);
INSERT INTO `style_color` VALUES (65, '深灰', 1, 64);
INSERT INTO `style_color` VALUES (66, '黑色', 4, 65);
INSERT INTO `style_color` VALUES (67, '白色', 4, 65);
INSERT INTO `style_color` VALUES (68, '肤色', 2, 65);
INSERT INTO `style_color` VALUES (69, '艳红', 1, 65);
INSERT INTO `style_color` VALUES (70, '深灰', 1, 65);
INSERT INTO `style_color` VALUES (71, '黑色', 4, 66);
INSERT INTO `style_color` VALUES (72, '白色', 4, 66);
INSERT INTO `style_color` VALUES (73, '深杏', 2, 66);
INSERT INTO `style_color` VALUES (74, '酒红', 1, 66);
INSERT INTO `style_color` VALUES (75, '桃红', 1, 66);

-- ----------------------------
-- Table structure for style_number
-- ----------------------------
DROP TABLE IF EXISTS `style_number`;
CREATE TABLE `style_number`  (
  `style_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '条形码',
  `style_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '款号',
  `style_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `style_color_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '色比图片',
  `total_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `style_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `style_total` int(0) NULL DEFAULT NULL COMMENT '总数',
  `style_desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '描述',
  `order_code_id` int(0) NULL DEFAULT NULL COMMENT '订单编号',
  `factory_id` int(0) NULL DEFAULT NULL COMMENT '工厂编号',
  `composition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '成分',
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '品牌',
  `bar_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '条形码',
  `fab_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '西班牙描述',
  PRIMARY KEY (`style_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 454 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of style_number
-- ----------------------------
INSERT INTO `style_number` VALUES (57, 'LS04S01', '/img/upload/20240827121212688.png', '/img/upload/20240827121308100.png', NULL, 24.96, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (58, 'LS04S02', '/img/upload/20240827122237164.png', '/img/upload/20240827122649203.png', NULL, 24.96, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (59, 'LS04S03', '/img/upload/20240827123418643.png', '/img/upload/20240827123719321.png', NULL, 28.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (60, 'LS04S04', '/img/upload/20240827124352781.png', '/img/upload/20240827124421980.png', NULL, 28.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (61, 'LS04S05', '/img/upload/20240827125036352.png', '/img/upload/20240827144633794.png', NULL, 26.76, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (62, 'LS04S06', '/img/upload/20240827144511810.png', '/img/upload/20240827144703166.png', NULL, 26.76, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (63, 'LS04S07', '/img/upload/20240827145532588.png', '/img/upload/20240827145546187.png', NULL, 28.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (64, 'LS04S08', '/img/upload/20240827150341167.png', '/img/upload/20240827150444345.png', NULL, 28.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (65, 'LS04S09', '/img/upload/20240827151153497.png', '/img/upload/20240827151225215.png', NULL, 28.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (66, 'LS04S10', '/img/upload/20240827151905843.png', '/img/upload/20240827151920415.png', NULL, 28.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (67, 'LS04S11', '/img/upload/20240827152438828.png', '/img/upload/20240827152551627.png', NULL, 33.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (68, 'LS04S12', '/img/upload/20240827152848689.png', '/img/upload/20240827152902178.png', NULL, 33.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (69, 'LS04S13', '/img/upload/20240827153154608.png', '/img/upload/20240827153209551.png', NULL, 33.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (70, 'LS04S14', '/img/upload/20240827153515768.png', '/img/upload/20240827153537371.png', NULL, 33.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (71, 'LS04S15', '/img/upload/20240827153739841.png', '/img/upload/20240827153800456.png', NULL, 30.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (72, 'LS04S16', '/img/upload/20240827154028596.png', '/img/upload/20240827154135478.png', NULL, 30.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (73, 'LS04S17', '/img/upload/20240827154352846.png', '/img/upload/20240827154412745.png', NULL, 30.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (74, 'LS04S18', '/img/upload/20240827154640434.png', '/img/upload/20240827154651778.png', NULL, 30.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (75, 'NV04S19', '/img/upload/20240827154858617.png', '/img/upload/20240827154908191.png', NULL, 37.80, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (76, 'NV04S20', '/img/upload/20240827155234426.png', '/img/upload/20240827155249209.png', NULL, 37.80, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (77, 'NV04S21', '/img/upload/20240827155529372.png', '/img/upload/20240827155540286.png', NULL, 37.80, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (78, 'NV04S22', '/img/upload/20240827155754090.png', '/img/upload/20240827155806317.png', NULL, 37.80, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (79, 'NV04S23', '/img/upload/20240827160043511.png', '/img/upload/20240827160120537.png', NULL, 39.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (80, 'NV04S24', '/img/upload/20240827160357594.png', '/img/upload/20240827160412618.png', NULL, 39.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (81, 'NV04S25', '/img/upload/20240827160646851.png', '/img/upload/20240827160706927.png', NULL, 39.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (82, 'NV04S26', '/img/upload/20240827160959886.png', '/img/upload/20240827161010629.png', NULL, 39.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (83, 'NV04S27', '/img/upload/20240827161243620.png', '/img/upload/20240827161311878.png', NULL, 39.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (84, 'NV04S28', '/img/upload/20240827161727244.png', '/img/upload/20240827161742187.png', NULL, 39.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (85, 'NV04S29', '/img/upload/20240827162354501.png', '/img/upload/20240827162406986.png', NULL, 39.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (86, 'NV04S30', '/img/upload/20240827162717883.png', '/img/upload/20240827162739645.png', NULL, 39.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (87, 'NV04S31', '/img/upload/20240827162932185.png', '/img/upload/20240827162942010.png', NULL, 39.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (88, 'NV04S32', '/img/upload/20240827173150112.png', '/img/upload/20240827173202495.png', NULL, 39.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (89, 'NV04S33', '/img/upload/20240827173433530.png', '/img/upload/20240827173444677.png', NULL, 39.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (90, 'NV04S34', '/img/upload/20240827173652502.png', '/img/upload/20240827173708943.png', NULL, 39.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (91, 'NV04S35', '/img/upload/20240827173903102.png', '/img/upload/20240827173912077.png', NULL, 64.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (92, 'NV04S36', '/img/upload/20240827174121924.png', '/img/upload/20240827174147009.png', NULL, 65.40, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (93, 'NV04S37', '/img/upload/20240827174354791.png', '/img/upload/20240827174410493.png', NULL, 66.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (94, 'NV04S38', '/img/upload/20240827174608772.png', '/img/upload/20240827174617997.png', NULL, 66.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (95, 'NV04S39', '/img/upload/20240827174809709.png', '/img/upload/20240827174820364.png', NULL, 58.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (96, 'NV04S40', '/img/upload/20240827175028016.png', '/img/upload/20240827175035993.png', NULL, 59.40, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (97, 'NV04S41', '/img/upload/20240827175223812.png', '/img/upload/20240827175235254.png', NULL, 60.00, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (98, 'NV04S42', '/img/upload/20240827175421064.png', '/img/upload/20240827175430452.png', NULL, 60.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (99, 'NV04S43', '/img/upload/20240827175655302.png', '/img/upload/20240827175705986.png', NULL, 56.40, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (100, 'NV04S44', '/img/upload/20240827175942222.png', '/img/upload/20240827175950099.png', NULL, 57.60, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (101, 'NV04S45', '/img/upload/20240827180249834.png', '/img/upload/20240827180305724.png', NULL, 58.20, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (102, 'NV04S46', '/img/upload/20240827180440387.png', '/img/upload/20240827180451776.png', NULL, 58.80, 0, '女成四角裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', NULL, 'BOXER DAMA');
INSERT INTO `style_number` VALUES (103, 'NV04S47', '/img/upload/20240827180904155.png', '/img/upload/20240827180917717.png', NULL, 37.80, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (104, 'NV04S48', '/img/upload/20240827181018419.png', '/img/upload/20240827181027508.png', NULL, 37.80, 0, '', 3, 5, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (105, 'NV04S49', '/img/upload/20240827181157697.png', '/img/upload/20240827181217115.png', NULL, 37.80, 0, '棉三角裤，净色', 3, 5, NULL, 'Nirvana  P:Embeleso', '6900006033191', 'panty algodon, solido');
INSERT INTO `style_number` VALUES (106, 'DX0401', '/img/upload/20240827181602913.png', '/img/upload/20240827181632792.png', NULL, 37.80, 0, '棉三角裤，净色', 3, 5, NULL, 'DIANE', '6900006033122', 'panty algodon, solido');
INSERT INTO `style_number` VALUES (107, 'NV28S01', '/img/upload/20240827182535387.png', '/img/upload/20240827182600520.png', NULL, 34.40, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (108, 'NV28S02', '/img/upload/20240827182737485.png', '/img/upload/20240827182745959.png', NULL, 34.40, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (109, 'NV28S03', '/img/upload/20240827182906979.png', '/img/upload/20240827182924463.png', NULL, 34.40, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (110, 'NV28S04', '/img/upload/20240827183103088.png', '/img/upload/20240827183109886.png', NULL, 37.50, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (111, 'NV28S05', '/img/upload/20240827183301844.png', '/img/upload/20240827183309744.png', NULL, 37.50, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (112, 'NV28S06', '/img/upload/20240827183448861.png', '/img/upload/20240827183456967.png', NULL, 37.50, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (113, 'NV28S07', '/img/upload/20240827183644702.png', '/img/upload/20240827183652693.png', NULL, 37.50, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (114, 'NV28S08', '/img/upload/20240827183842217.png', '/img/upload/20240827183850943.png', NULL, 38.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (115, 'NV28S09', '/img/upload/20240827184052290.png', '/img/upload/20240827184104058.png', NULL, 38.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (116, 'NV28S10', '/img/upload/20240827184246225.png', '/img/upload/20240827184254762.png', NULL, 36.20, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (117, 'NV28S11', '/img/upload/20240827184443448.png', '/img/upload/20240827184454447.png', NULL, 36.20, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (118, 'NV28S12', '/img/upload/20240827184646037.png', '/img/upload/20240827184654211.png', NULL, 36.20, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (119, 'NV28S13', '/img/upload/20240827184842731.png', '/img/upload/20240827184850157.png', NULL, 38.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (120, 'NV28S14', '/img/upload/20240827185039358.png', '/img/upload/20240827185047451.png', NULL, 38.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (121, 'NV28S15', '/img/upload/20240827185318658.png', '/img/upload/20240827185329006.png', NULL, 38.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (122, 'NV28S16', '/img/upload/20240827185549862.png', '/img/upload/20240827185556461.png', NULL, 38.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (123, 'NV28S17', '/img/upload/20240827185738740.png', '/img/upload/20240827185745160.png', NULL, 44.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (124, 'NV28S18', '/img/upload/20240827185935917.png', '/img/upload/20240827185947863.png', NULL, 44.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (125, 'NV28S19', '/img/upload/20240827190140190.png', '/img/upload/20240827190147398.png', NULL, 44.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (126, 'NV28S20', '/img/upload/20240827190335471.png', '/img/upload/20240827190346339.png', NULL, 44.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (127, 'NV28S21', '/img/upload/20240827190522905.png', '/img/upload/20240827190530116.png', NULL, 44.00, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (128, 'NV28S22', '/img/upload/20240827190701053.png', '/img/upload/20240827190707706.png', NULL, 43.30, 0, '', 3, 7, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (129, 'LS30S01', '/img/upload/20240828111926308.png', '/img/upload/20240828111940354.png', NULL, 54.00, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (130, 'LS30S02', '/img/upload/20240828112147338.png', '/img/upload/20240828112157758.png', NULL, 54.00, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (131, 'LS30S03', '/img/upload/20240828112334293.png', '/img/upload/20240828112342500.png', NULL, 54.00, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (132, 'LS30S04', '/img/upload/20240828112458555.png', '/img/upload/20240828112507690.png', NULL, 57.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (133, 'LS30S05', '/img/upload/20240828112641346.png', '/img/upload/20240828112651379.png', NULL, 57.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (134, 'LS30S06', '/img/upload/20240828113148449.png', '/img/upload/20240828113159391.png', NULL, 57.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (135, 'LS30S07', '/img/upload/20240828113355215.png', '/img/upload/20240828113404846.png', NULL, 57.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (136, 'LS30S08', '/img/upload/20240828113555015.png', '/img/upload/20240828113604606.png', NULL, 57.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (137, 'LS30S09', '/img/upload/20240828113851661.png', '/img/upload/20240828113902602.png', NULL, 57.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (138, 'LS30S10', '/img/upload/20240828114041973.png', '/img/upload/20240828114056144.png', NULL, 57.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (139, 'EX30S11', '/img/upload/20240828114250381.png', '/img/upload/20240828114300404.png', NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (140, 'EX30S12', '/img/upload/20240828114621724.png', '/img/upload/20240828114631930.png', NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (141, 'EX30S13', '/img/upload/20240828114718132.png', '/img/upload/20240828114727945.png', NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (142, 'EX30S14', '/img/upload/20240828114902372.png', NULL, NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (143, 'EX30S15', '/img/upload/20240828115016027.png', '/img/upload/20240828115036159.png', NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (144, 'EX30S16', '/img/upload/20240828115136873.png', '/img/upload/20240828115204286.png', NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (145, 'EX30S17', '/img/upload/20240828115258823.png', '/img/upload/20240828115311743.png', NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (146, 'EX30S18', '/img/upload/20240828115415797.png', '/img/upload/20240828115425959.png', NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (147, 'EX30S19', '/img/upload/20240828115527143.png', '/img/upload/20240828115540849.png', NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (148, 'EX30S20', '/img/upload/20240828115648765.png', NULL, NULL, 69.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (149, 'EX30S21P', '/img/upload/20240828115846778.png', '/img/upload/20240828115903716.png', NULL, 84.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (150, 'EX30S22P', '/img/upload/20240828120107766.png', '/img/upload/20240828120117970.png', NULL, 84.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (151, 'EX30S23P', '/img/upload/20240828120321357.png', '/img/upload/20240828120335015.png', NULL, 84.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (152, 'EX30S24P', '/img/upload/20240828120533104.png', '/img/upload/20240828120543343.png', NULL, 84.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (153, 'EX30S25P', '/img/upload/20240828121254349.png', '/img/upload/20240828121324931.png', NULL, 84.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (154, 'EX30S26P', '/img/upload/20240828121500759.png', '/img/upload/20240828121513893.png', NULL, 84.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (155, 'EX30S27P', '/img/upload/20240828121754324.png', '/img/upload/20240828121811985.png', NULL, 84.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (156, 'EX30S28P', '/img/upload/20240828122018438.png', '/img/upload/20240828122028260.png', NULL, 81.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (157, 'EX30S29P', '/img/upload/20240828122254741.png', '/img/upload/20240828122317816.png', NULL, 81.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (158, 'EX30S30P', '/img/upload/20240828122504258.png', '/img/upload/20240828122522366.png', NULL, 81.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (159, 'EX30S31C', '/img/upload/20240828122716807.png', '/img/upload/20240828122729849.png', NULL, 87.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (160, 'EX30S32C', '/img/upload/20240828122924912.png', '/img/upload/20240828122940303.png', NULL, 87.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (161, 'EX30S33C', '/img/upload/20240828123204726.png', '/img/upload/20240828123218882.png', NULL, 87.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (162, 'EX30S34C', '/img/upload/20240828123414909.png', '/img/upload/20240828123427889.png', NULL, 87.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (163, 'EX30S35C', '/img/upload/20240828123625715.png', '/img/upload/20240828123643897.png', NULL, 87.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (164, 'EX30S36C', '/img/upload/20240828123818288.png', '/img/upload/20240828123830719.png', NULL, 87.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (165, 'EX30S37C', '/img/upload/20240828124015331.png', '/img/upload/20240828124033487.png', NULL, 87.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (166, 'EX30S38C', '/img/upload/20240828124215277.png', '/img/upload/20240828124227638.png', NULL, 81.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (167, 'EX30S39C', '/img/upload/20240828124410475.png', '/img/upload/20240828124425766.png', NULL, 81.60, 0, '', 3, 8, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (168, 'MA32S01', '/img/upload/20240828142640958.png', '/img/upload/20240828142846670.png', NULL, 55.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (169, 'MA32S02', '/img/upload/20240828143255844.png', '/img/upload/20240828143305179.png', NULL, 55.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (170, 'MA3215/MA32S03', '/img/upload/20240828143721220.png', '/img/upload/20240828143733700.png', NULL, 59.50, 0, '男童平脚裤', 3, 9, '65%POLIESTER 35%COTTON', 'MARRISON', NULL, 'BOXER JUNIOR');
INSERT INTO `style_number` VALUES (171, 'MA32S04', '/img/upload/20240828144146478.png', '/img/upload/20240828144157495.png', NULL, 68.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (172, 'MA32B01/MA32S05', '/img/upload/20240828144745516.png', '/img/upload/20240828144757942.png', NULL, 68.00, 0, '男装平脚裤', 3, 9, '65%POLIESTER 35%COTTON', 'MARRISON', NULL, 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (173, 'MA32B01/MA32S06', '/img/upload/20240828145112329.png', '/img/upload/20240828145122186.png', NULL, 73.00, 0, '男装平脚裤', 3, 9, '65%POLIESTER 35%COTTON', 'MARRISON', NULL, 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (174, 'MA32S07', '/img/upload/20240828145500514.png', '/img/upload/20240828145514743.png', NULL, 73.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (175, 'MA32B01/MA32S08', '/img/upload/20240828150018136.png', '/img/upload/20240828150034393.png', NULL, 73.00, 0, '男装平脚裤', 3, 9, '65%POLIESTER 35%COTTON', 'MARRISON', NULL, 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (176, 'MA32B01/MA32S09', '/img/upload/20240828150429893.png', '/img/upload/20240828150440231.png', NULL, 68.00, 0, '男装平脚裤', 3, 9, '65%POLIESTER 35%COTTON', 'MARRISON', NULL, 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (177, 'MA32S10', '/img/upload/20240828150841563.png', '/img/upload/20240828150851868.png', NULL, 76.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (178, 'MA32S11', '/img/upload/20240828153249271.png', '/img/upload/20240828153301794.png', NULL, 82.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (179, 'LE32S12', '/img/upload/20240828153623548.png', '/img/upload/20240828153649611.png', NULL, 40.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (180, 'LE32S13', '/img/upload/20240828154018454.png', '/img/upload/20240828154026743.png', NULL, 40.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (181, 'LE32S14', '/img/upload/20240828154329532.png', '/img/upload/20240828154339201.png', NULL, 40.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (182, 'LE32S15', '/img/upload/20240828154640596.png', '/img/upload/20240828154657938.png', NULL, 36.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (183, 'LE32S16', '/img/upload/20240828154951427.png', '/img/upload/20240828155004454.png', NULL, 36.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (184, 'LE32S17', '/img/upload/20240828155250591.png', '/img/upload/20240828155305812.png', NULL, 36.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (185, 'LE32S18', '/img/upload/20240828155545240.png', '/img/upload/20240828155609578.png', NULL, 39.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (186, 'LE32S19', '/img/upload/20240828160023474.png', '/img/upload/20240828160032879.png', NULL, 39.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (187, 'LE32S26', '/img/upload/20240828160428491.png', '/img/upload/20240828160450348.png', NULL, 71.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (188, 'LE32S27', '/img/upload/20240828161426849.png', '/img/upload/20240828161442447.png', NULL, 65.50, 0, '男装肥佬裤', 3, 9, '95%POLIESTER 5%ELASTANO', 'LEONARDO PLUS ', NULL, 'BOXER HOMBRE PLUS');
INSERT INTO `style_number` VALUES (189, 'MA32S28', '/img/upload/20240828161740053.png', '/img/upload/20240828161756429.png', NULL, 44.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (190, 'MA32S29', '/img/upload/20240828162037124.png', '/img/upload/20240828162056584.png', NULL, 44.50, 0, '男童中腿裤', 3, 9, '90%NYLON 10%ELASTANO', 'MARRISON', NULL, 'BOXER NINO');
INSERT INTO `style_number` VALUES (191, 'MA32S30', '/img/upload/20240828162330688.png', '/img/upload/20240828162340999.png', NULL, 44.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (192, 'MA32S31', '/img/upload/20240828162610138.png', '/img/upload/20240828162620541.png', NULL, 44.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (193, 'MA32S32', '/img/upload/20240828162944712.png', '/img/upload/20240828163001942.png', NULL, 44.50, 0, '男童中腿裤', 3, 9, '90%NYLON 10%ELASTANO', 'MARRISON', NULL, 'BOXER NINO');
INSERT INTO `style_number` VALUES (194, 'MA32S33', '/img/upload/20240828163207066.png', '/img/upload/20240828163217056.png', NULL, 44.50, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (195, 'MA32S34', '/img/upload/20240828170705499.png', '/img/upload/20240828170722384.png', NULL, 50.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (196, 'MA32S35', '/img/upload/20240828171022212.png', '/img/upload/20240828171039757.png', NULL, 48.00, 0, '大男童中腿裤', 3, 9, '90%NYLON 10%ELASTANO', 'MARRISON', NULL, 'BOXER JUNIOR');
INSERT INTO `style_number` VALUES (197, 'MA32S36', '/img/upload/20240828171324598.png', '/img/upload/20240828171336812.png', NULL, 50.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (198, 'MA32S37', '/img/upload/20240828171617189.png', '/img/upload/20240828171632824.png', NULL, 48.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (199, 'MA32S38', '/img/upload/20240828172026371.png', '/img/upload/20240828172041695.png', NULL, 48.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (200, 'MA32S39', '/img/upload/20240828172444813.png', '/img/upload/20240828172517556.png', NULL, 59.00, 0, '男装中腿裤', 3, 9, '90%NYLON 10%ELASTANO', 'MARRISON', NULL, 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (201, 'MA32S40', '/img/upload/20240828173423720.png', '/img/upload/20240828173438862.png', NULL, 59.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (202, 'MA32S41', '/img/upload/20240828174209831.png', '/img/upload/20240828174227999.png', NULL, 59.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (203, 'MA32S42', '/img/upload/20240828185949678.png', '/img/upload/20240828190011711.png', NULL, 59.00, 0, '男装中腿裤', 3, 9, '90%NYLON 10%ELASTANO', 'MARRISON', NULL, 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (204, 'MA32S43', '/img/upload/20240828190610992.png', '/img/upload/20240828190636916.png', NULL, 59.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (205, 'MA32S44', '/img/upload/20240828191036286.png', '/img/upload/20240828191107103.png', NULL, 59.00, 0, '男装中腿裤', 3, 9, '90%NYLON 10%ELASTANO', 'MARRISON', NULL, 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (206, 'MA32S45', '/img/upload/20240828191525831.png', '/img/upload/20240828191544628.png', NULL, 59.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (207, 'MA32S46', '/img/upload/20240828192033981.png', '/img/upload/20240828192053716.png', NULL, 59.00, 0, '男装中腿裤', 3, 9, '90%NYLON 10%ELASTANO', 'MARRISON', NULL, 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (208, 'MA32S47', '/img/upload/20240828192441867.png', '/img/upload/20240828192504910.png', NULL, 59.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (209, 'MA32S48', '/img/upload/20240828192755558.png', '/img/upload/20240828192815887.png', NULL, 59.00, 0, '', 3, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (210, 'NV55R01', '/img/upload/20240828194432153.png', '/img/upload/20240828194440123.png', NULL, 114.00, 0, '', 17, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (211, 'NV55R02', '/img/upload/20240828194655530.png', '/img/upload/20240828194706913.png', NULL, 86.40, 0, '', 17, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (212, 'NV55R03', '/img/upload/20240828195119918.png', '/img/upload/20240828195137124.png', NULL, 86.40, 0, '', 17, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (213, 'NV55R04', '/img/upload/20240828195345012.png', '/img/upload/20240828195415286.png', NULL, 93.60, 0, '文胸', 17, 12, '95%COTTON 5%SPANDEX', 'Nirvana', '6900006015494', 'Bras');
INSERT INTO `style_number` VALUES (214, 'NV55R05', '/img/upload/20240828195615452.png', '/img/upload/20240828195628523.png', NULL, 93.60, 0, '', 17, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (215, 'NV55R06', '/img/upload/20240828200002186.png', '/img/upload/20240828200022376.png', NULL, 85.20, 0, '文胸', 17, 12, '95%COTTON 5%SPANDEX', 'Nirvana', '6900006015517', 'Bras');
INSERT INTO `style_number` VALUES (216, 'NV55R09', '/img/upload/20240828200551471.png', '/img/upload/20240828200603747.png', NULL, 108.00, 0, '文胸', 17, 12, '95%COTTON 5%SPANDEX', 'DIANE', NULL, 'Bras');
INSERT INTO `style_number` VALUES (217, 'NV55R10C', '/img/upload/20240828200844852.png', '/img/upload/20240828200902233.png', NULL, 105.60, 0, '', 17, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (218, 'NV55P03', '/img/upload/20240828201120907.png', '/img/upload/20240828201143276.png', NULL, 90.00, 0, '', 1, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (219, 'NV55S01', '/img/upload/20240828201412688.png', '/img/upload/20240828201422149.png', NULL, 87.60, 0, '文胸', 3, 12, '60%COTTON  35%NYLON  5%SPANDEX', 'Nirvana', '6900006033214', 'Bras');
INSERT INTO `style_number` VALUES (220, 'NV55S02', '/img/upload/20240828201707507.png', '/img/upload/20240828201725331.png', NULL, 86.40, 0, '', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (221, 'NV55S03C', '/img/upload/20240828201929013.png', '/img/upload/20240828201940080.png', NULL, 114.00, 0, '', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (222, 'NV55S04', '/img/upload/20240828202212894.png', '/img/upload/20240828202224408.png', NULL, 114.00, 0, '文胸', 3, 12, '95%COTTON 5%SPANDEX', 'Nirvana', '6900006033245', 'Bras');
INSERT INTO `style_number` VALUES (223, 'NV55S05C', '/img/upload/20240828202423288.png', '/img/upload/20240828202433863.png', NULL, 90.00, 0, '', 3, 12, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (224, 'EM32R141', '/img/upload/20240829115430030.png', '/img/upload/20240829115440777.png', NULL, 91.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (225, 'EM32R142', '/img/upload/20240829120954662.png', '/img/upload/20240829121017412.png', NULL, 97.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (226, 'EM32R143', '/img/upload/20240829131923941.png', '/img/upload/20240829132135600.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (227, 'EM32R144', '/img/upload/20240829133340824.png', '/img/upload/20240829133354877.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (228, 'EM32B0/EM32R145', '/img/upload/20240829134002436.png', '/img/upload/20240829134013004.png', NULL, 87.50, 0, '男装平脚裤', 17, 9, '95%COTTON 5%ELASTANO', 'EMBAJADOR', '6900006029811', 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (229, 'EM32R146', '/img/upload/20240829134515106.png', '/img/upload/20240829134528552.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (230, 'EM32B0/EM32R147', '/img/upload/20240829135110599.png', '/img/upload/20240829135123479.png', NULL, 92.50, 0, '男装平脚裤', 17, 9, '95%COTTON 5%ELASTANO', 'EMBAJADOR', '6900006029859', 'BOXER HOMBRE');
INSERT INTO `style_number` VALUES (231, 'EM32R148', '/img/upload/20240829135612152.png', '/img/upload/20240829135626549.png', NULL, 92.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (232, 'EM32R149', '/img/upload/20240829140222403.png', '/img/upload/20240829140238494.png', NULL, 115.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (233, 'EM32R150', '/img/upload/20240829141949511.png', '/img/upload/20240829142011058.png', NULL, 121.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (234, 'ML32R151', '/img/upload/20240829142438244.png', NULL, NULL, 116.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (235, 'ML32R152', '/img/upload/20240829142629938.png', NULL, NULL, 126.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (236, 'ML32R153', '/img/upload/20240829142820801.png', NULL, NULL, 80.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (237, 'ML32R154', '/img/upload/20240829143006015.png', NULL, NULL, 82.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (238, 'LS32R01', '/img/upload/20240829144115351.png', '/img/upload/20240829144153701.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (239, 'LS32R02', '/img/upload/20240829144420433.png', '/img/upload/20240829144436311.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (240, 'LS32R03', '/img/upload/20240829144644947.png', '/img/upload/20240829144655653.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (241, 'LS32R04', '/img/upload/20240829144953015.png', '/img/upload/20240829145008533.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (242, 'LS32R05', '/img/upload/20240829145156152.png', '/img/upload/20240829145209985.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (243, 'LS32R06', '/img/upload/20240829145402524.png', '/img/upload/20240829145413610.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (244, 'LS32R07', '/img/upload/20240829145610720.png', '/img/upload/20240829145621973.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (245, 'LS32R08', '/img/upload/20240829145756943.png', '/img/upload/20240829145807308.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (246, 'LS32R09', '/img/upload/20240829145954334.png', '/img/upload/20240829150011269.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (247, 'LS32R10', '/img/upload/20240829150159862.png', '/img/upload/20240829150210571.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (248, 'LS32R11', '/img/upload/20240829150454066.png', '/img/upload/20240829150504106.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (249, 'LS32R12', '/img/upload/20240829150708545.png', '/img/upload/20240829150721038.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (250, 'LS32R13', '/img/upload/20240829151441486.png', '/img/upload/20240829151456563.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (251, 'LS32R14', '/img/upload/20240829151733664.png', '/img/upload/20240829151743233.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (252, 'LS32R15', '/img/upload/20240829151937808.png', '/img/upload/20240829151953348.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (253, 'LS32R16', '/img/upload/20240829152210919.png', '/img/upload/20240829152236042.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (254, 'LS32R17', '/img/upload/20240829152419420.png', '/img/upload/20240829152435106.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (255, 'LS32R18', '/img/upload/20240829152631138.png', '/img/upload/20240829152653255.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (256, 'LS32R19', '/img/upload/20240829153015847.png', '/img/upload/20240829153048844.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (257, 'LS32R20', '/img/upload/20240829153602603.png', '/img/upload/20240829153612561.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (258, 'LS32R21', '/img/upload/20240829154236757.png', '/img/upload/20240829154253385.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (259, 'LS32R22', '/img/upload/20240829154433134.png', '/img/upload/20240829154448883.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (260, 'LS32R23', '/img/upload/20240829154635028.png', '/img/upload/20240829154652529.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (261, 'LS32R24', '/img/upload/20240829154850100.png', '/img/upload/20240829154902736.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (262, 'LS32R25', '/img/upload/20240829155100407.png', '/img/upload/20240829155119169.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (263, 'LS32R26', '/img/upload/20240829155420157.png', '/img/upload/20240829155437515.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (264, 'LS32R27', '/img/upload/20240829155725982.png', '/img/upload/20240829155744986.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (265, 'LS32R28', '/img/upload/20240829161640382.png', '/img/upload/20240829161654809.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (266, 'LS32R29', '/img/upload/20240829161831890.png', '/img/upload/20240829161848368.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (267, 'LS32R30', '/img/upload/20240829162109195.png', '/img/upload/20240829162131215.png', NULL, 28.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (268, 'ML32R31', '/img/upload/20240829162655325.png', '/img/upload/20240829162732021.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (269, 'ML32R32', '/img/upload/20240829163131446.png', '/img/upload/20240829163143232.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (270, 'ML32R33', '/img/upload/20240829190215948.png', '/img/upload/20240829190231510.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (271, 'ML32R34', '/img/upload/20240829190524166.png', '/img/upload/20240829190543516.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (272, 'ML32R35', '/img/upload/20240829190847979.png', '/img/upload/20240829190912056.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (273, 'ML32R36', '/img/upload/20240829191115472.png', '/img/upload/20240829191133623.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (274, 'ML32R37', '/img/upload/20240829191316281.png', '/img/upload/20240829191335798.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (275, 'ML32R38', '/img/upload/20240829191524960.png', '/img/upload/20240829191542613.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (276, 'ML32R39', '/img/upload/20240829191816454.png', '/img/upload/20240829191831009.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (277, 'ML32R40', '/img/upload/20240829192011018.png', '/img/upload/20240829192028593.png', NULL, 38.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (278, 'ML32R41', '/img/upload/20240902102722876.png', '/img/upload/20240902102736138.png', NULL, 58.80, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (279, 'ML32R42', '/img/upload/20240902102959282.png', '/img/upload/20240902103008837.png', NULL, 54.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (280, 'ML32R43', '/img/upload/20240902103200840.png', '/img/upload/20240902103212171.png', NULL, 44.40, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (281, 'ML32R44', '/img/upload/20240902103350957.png', '/img/upload/20240902103403674.png', NULL, 44.40, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (282, 'ML32R45', '/img/upload/20240902103926533.png', '/img/upload/20240902103935955.png', NULL, 47.40, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (283, 'ML32R46', '/img/upload/20240902104823597.png', '/img/upload/20240902104834414.png', NULL, 62.40, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (284, 'ML32R47', '/img/upload/20240902105056083.png', '/img/upload/20240902105106742.png', NULL, 62.40, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (285, 'EM32R49', '/img/upload/20240902105349492.png', '/img/upload/20240902105402818.png', NULL, 69.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (286, 'EM32R50', '/img/upload/20240902105646350.png', '/img/upload/20240902105657710.png', NULL, 73.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (287, 'EM32R51', '/img/upload/20240902105826300.png', '/img/upload/20240902105835103.png', NULL, 73.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (288, 'EM32R52', '/img/upload/20240902110118545.png', '/img/upload/20240902110129040.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (289, 'EM32R53', '/img/upload/20240902111451364.png', '/img/upload/20240902111459514.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (290, 'EM32R54', '/img/upload/20240902112054647.png', '/img/upload/20240902112115684.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (291, 'EM32R55', '/img/upload/20240902112408302.png', '/img/upload/20240902112416702.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (292, 'EM32R56', '/img/upload/20240902112900430.png', '/img/upload/20240902112910086.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (293, 'EM32R57', '/img/upload/20240902113108639.png', '/img/upload/20240902113116489.png', NULL, 87.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (294, 'EM32R58', '/img/upload/20240902113627015.png', '/img/upload/20240902113703058.png', NULL, 92.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (295, 'EM32R59', '/img/upload/20240902114123714.png', '/img/upload/20240902114137137.png', NULL, 92.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (296, 'EM32R60', '/img/upload/20240902114445712.png', '/img/upload/20240902114455215.png', NULL, 92.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (297, 'EM32R61', '/img/upload/20240902114750876.png', '/img/upload/20240902114759621.png', NULL, 115.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (298, 'EM32R62', '/img/upload/20240902115134027.png', '/img/upload/20240902115143739.png', NULL, 121.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (299, 'MA32R63', '/img/upload/20240902115508369.png', '/img/upload/20240902115519365.png', NULL, 55.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (300, 'MA32R64', '/img/upload/20240902115702281.png', '/img/upload/20240902115711946.png', NULL, 59.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (301, 'MA32R65', '/img/upload/20240902115913106.png', '/img/upload/20240902115922937.png', NULL, 59.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (302, 'MA32R66', '/img/upload/20240902120107314.png', '/img/upload/20240902120115018.png', NULL, 68.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (303, 'MA32R67', '/img/upload/20240902120731206.png', '/img/upload/20240902120741061.png', NULL, 68.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (304, 'MA32R68', '/img/upload/20240902121023679.png', '/img/upload/20240902121034119.png', NULL, 73.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (305, 'MA32R69', '/img/upload/20240902121420401.png', '/img/upload/20240902121428733.png', NULL, 73.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (306, 'MA32R70', '/img/upload/20240902121700872.png', '/img/upload/20240902121710733.png', NULL, 73.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (307, 'MA32R71', '/img/upload/20240902121934693.png', '/img/upload/20240902121945472.png', NULL, 73.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (308, 'MA32R72', '/img/upload/20240902122216928.png', '/img/upload/20240902122225898.png', NULL, 76.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (309, 'MA32R73', '/img/upload/20240902122632572.png', '/img/upload/20240902122643696.png', NULL, 82.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (310, 'MA32R74', '/img/upload/20240902122919532.png', '/img/upload/20240902122927582.png', NULL, 44.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (311, 'MA32R75', '/img/upload/20240902123427802.png', '/img/upload/20240902123436762.png', NULL, 44.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (312, 'MA32R76', '/img/upload/20240902123607314.png', '/img/upload/20240902123626216.png', NULL, 44.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (313, 'MA32R77', '/img/upload/20240902123821111.png', '/img/upload/20240902123835211.png', NULL, 44.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (314, 'MA32R78', '/img/upload/20240902124025494.png', '/img/upload/20240902124034456.png', NULL, 44.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (315, 'MA32R79', '/img/upload/20240902124206016.png', '/img/upload/20240902124216489.png', NULL, 48.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (316, 'MA32R80', '/img/upload/20240902124523684.png', '/img/upload/20240902124535510.png', NULL, 48.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (317, 'MA32R81', '/img/upload/20240902153221032.png', '/img/upload/20240902153232499.png', NULL, 48.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (318, 'MA32R82', '/img/upload/20240902153424558.png', '/img/upload/20240902153436588.png', NULL, 48.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (319, 'MA32R83', '/img/upload/20240902153624427.png', '/img/upload/20240902153633267.png', NULL, 59.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (320, 'MA32R84', '/img/upload/20240902153959223.png', '/img/upload/20240902154008126.png', NULL, 59.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (321, 'MA32R85', '/img/upload/20240902154154281.png', '/img/upload/20240902154205806.png', NULL, 59.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (322, 'MA32R86', '/img/upload/20240902154615684.png', '/img/upload/20240902154628093.png', NULL, 59.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (323, 'MA32R87', '/img/upload/20240902154803217.png', '/img/upload/20240902154814007.png', NULL, 59.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (324, 'MA32R88', '/img/upload/20240902160019841.png', '/img/upload/20240902160030724.png', NULL, 59.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (325, 'MA32R89', '/img/upload/20240902160216544.png', '/img/upload/20240902160229293.png', NULL, 59.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (326, 'MA32R90', '/img/upload/20240902160430207.png', '/img/upload/20240902160442807.png', NULL, 59.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (327, 'LE32R93', '/img/upload/20240902201359560.png', NULL, NULL, 36.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (328, 'LE32R94', '/img/upload/20240902201511733.png', NULL, NULL, 36.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (329, 'LE32R95', '/img/upload/20240902201626214.png', NULL, NULL, 36.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (330, 'LE32R96', '/img/upload/20240902201721527.png', NULL, NULL, 36.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (331, 'LE32R97', '/img/upload/20240902201840305.png', '/img/upload/20240902201906230.png', NULL, 39.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (332, 'LE32R98', '/img/upload/20240902202111820.png', '/img/upload/20240902202123643.png', NULL, 39.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (333, 'LE32R99', '/img/upload/20240902202301594.png', '/img/upload/20240902202315134.png', NULL, 39.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (334, 'LE32R100', '/img/upload/20240902202416101.png', '/img/upload/20240902202426060.png', NULL, 39.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (335, 'LE32R101', '/img/upload/20240902202632605.png', '/img/upload/20240902202649417.png', NULL, 51.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (336, 'LE32R102', '/img/upload/20240902203103340.png', '/img/upload/20240902203141667.png', NULL, 51.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (337, 'LE32R103', '/img/upload/20240902203342095.png', '/img/upload/20240902203351624.png', NULL, 51.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (338, 'LE32R104', '/img/upload/20240902203639415.png', '/img/upload/20240902203700264.png', NULL, 51.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (339, 'LE32R105', '/img/upload/20240903103646785.png', '/img/upload/20240903103707008.png', NULL, 51.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (340, 'LE32R106', '/img/upload/20240903104121205.png', '/img/upload/20240903104129582.png', NULL, 51.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (341, 'LE32R107', '/img/upload/20240903104337361.png', '/img/upload/20240903104346283.png', NULL, 65.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (342, 'LE32R108', '/img/upload/20240903104615309.png', '/img/upload/20240903104626176.png', NULL, 65.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (343, 'LE32R109', '/img/upload/20240903104819616.png', NULL, NULL, 32.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (344, 'LE32R110', '/img/upload/20240903105646020.png', NULL, NULL, 34.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (345, 'LS32R111', '/img/upload/20240903110149180.png', '/img/upload/20240903110157895.png', NULL, 26.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (346, 'LS32R112', '/img/upload/20240903110334932.png', '/img/upload/20240903110348133.png', NULL, 29.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (347, 'LS32R113', '/img/upload/20240903110536329.png', '/img/upload/20240903110544847.png', NULL, 25.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (348, 'LS32R114', '/img/upload/20240903110723609.png', '/img/upload/20240903110731313.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (349, 'LS32R115', '/img/upload/20240903111253259.png', '/img/upload/20240903111301489.png', NULL, 30.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (350, 'LS32R116', '/img/upload/20240903111443721.png', '/img/upload/20240903111455285.png', NULL, 36.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (351, 'LS32R117', '/img/upload/20240903111651726.png', '/img/upload/20240903111701857.png', NULL, 24.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (352, 'LS32R118', '/img/upload/20240903111920361.png', '/img/upload/20240903111930896.png', NULL, 24.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (353, 'LS32R119', '/img/upload/20240903112259561.png', '/img/upload/20240903112312221.png', NULL, 48.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (354, 'LS32R120', '/img/upload/20240903112537336.png', '/img/upload/20240903112553050.png', NULL, 48.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (355, 'LS32R121', '/img/upload/20240903112837412.png', '/img/upload/20240903112849948.png', NULL, 30.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (356, 'LS32R122', '/img/upload/20240903113111484.png', '/img/upload/20240903113120494.png', NULL, 31.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (357, 'LS32R123', '/img/upload/20240903113249118.png', '/img/upload/20240903113257718.png', NULL, 26.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (358, 'LS32R124', '/img/upload/20240903113443202.png', '/img/upload/20240903113523412.png', NULL, 27.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (359, 'LS32R125', '/img/upload/20240903113652118.png', '/img/upload/20240903113659728.png', NULL, 29.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (360, 'LS32R126', '/img/upload/20240903113859853.png', '/img/upload/20240903113911740.png', NULL, 29.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (361, 'LS32R127', '/img/upload/20240903114052580.png', '/img/upload/20240903114104293.png', NULL, 29.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (362, 'LS32R128', '/img/upload/20240903114246881.png', '/img/upload/20240903114259471.png', NULL, 30.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (363, 'LS32R129', '/img/upload/20240903114450020.png', '/img/upload/20240903114500856.png', NULL, 30.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (364, 'LS32R130', '/img/upload/20240903114711922.png', '/img/upload/20240903114720421.png', NULL, 30.50, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (365, 'MA32R131', '/img/upload/20240903114856072.png', '/img/upload/20240903114903755.png', NULL, 44.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (366, 'MA32R132', '/img/upload/20240903115034242.png', '/img/upload/20240903115043479.png', NULL, 44.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (367, 'ML32R133', '/img/upload/20240903115351354.png', '/img/upload/20240903115401368.png', NULL, 52.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (368, 'ML32R134', '/img/upload/20240903115538981.png', '/img/upload/20240903115549074.png', NULL, 50.00, 0, '', 17, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (369, 'ML32L126', '/img/upload/20240903115939294.png', '/img/upload/20240903115954376.png', NULL, 52.00, 0, '', 18, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (370, 'ML32L127', '/img/upload/20240903120142422.png', '/img/upload/20240903120150413.png', NULL, 50.00, 0, '', 18, 9, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (371, 'NV40R61', '/img/upload/20240903151219171.png', '/img/upload/20240903151255544.png', NULL, 105.60, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (372, 'NV40R62', '/img/upload/20240903151855889.png', '/img/upload/20240903151903911.png', NULL, 54.00, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (373, 'NV40R63', '/img/upload/20240903152207710.png', '/img/upload/20240903152220830.png', NULL, 102.00, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (374, 'NV40R64', '/img/upload/20240903152554792.png', '/img/upload/20240903152621477.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (375, 'NV40R65', '/img/upload/20240903152932702.png', '/img/upload/20240903152941914.png', NULL, 102.60, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (376, 'NV40R66', '/img/upload/20240903153230009.png', '/img/upload/20240903153239784.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (377, 'NV40R67', '/img/upload/20240903153519977.png', '/img/upload/20240903153527763.png', NULL, 103.20, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (378, 'NV40R68', '/img/upload/20240903153900843.png', '/img/upload/20240903153909218.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (379, 'NV40R69P', '/img/upload/20240903154116254.png', '/img/upload/20240903154133252.png', NULL, 103.80, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (380, 'NV40R70', '/img/upload/20240903154436747.png', '/img/upload/20240903154445220.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (381, 'NV40R71P', '/img/upload/20240903154728939.png', '/img/upload/20240903154737074.png', NULL, 108.60, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (382, 'NV40R72', '/img/upload/20240903155136874.png', '/img/upload/20240903155144993.png', NULL, 60.00, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (383, 'NV40R73C', '/img/upload/20240903155338283.png', '/img/upload/20240903155350303.png', NULL, 110.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (384, 'NV40R74', '/img/upload/20240903155810613.png', '/img/upload/20240903155826675.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (385, 'NV40R75C', '/img/upload/20240903160216152.png', '/img/upload/20240903160226672.png', NULL, 112.80, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (386, 'NV40R76', '/img/upload/20240904095757067.png', '/img/upload/20240904095811980.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (387, 'NV40R77C', '/img/upload/20240904100031549.png', '/img/upload/20240904100043974.png', NULL, 115.20, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (388, 'NV40R78', '/img/upload/20240904100321805.png', '/img/upload/20240904100334146.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (389, 'NV40R79', '/img/upload/20240904100524531.png', '/img/upload/20240904100542586.png', NULL, 102.00, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (390, 'NV40R80', '/img/upload/20240904100829226.png', '/img/upload/20240904100836959.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (391, 'NV40R81P', '/img/upload/20240904101047941.png', '/img/upload/20240904101058865.png', NULL, 106.20, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (392, 'NV40R82', '/img/upload/20240904101316112.png', '/img/upload/20240904101323750.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (393, 'NV40R83C', '/img/upload/20240904101641745.png', '/img/upload/20240904101653904.png', NULL, 111.60, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (394, 'NV40R84', '/img/upload/20240904102038439.png', '/img/upload/20240904102047094.png', NULL, 50.40, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (395, 'NV40R85C', '/img/upload/20240904102327156.png', '/img/upload/20240904102343844.png', NULL, 150.00, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (396, 'NV40R86C', '/img/upload/20240904102627626.png', '/img/upload/20240904102635148.png', NULL, 138.00, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (397, 'NV40R87', '/img/upload/20240904102825536.png', '/img/upload/20240904102833940.png', NULL, 120.00, 0, '', 17, 10, NULL, NULL, NULL, NULL);
INSERT INTO `style_number` VALUES (399, 'LR04O1', '/img/upload/', NULL, NULL, 27.84, 0, '女成三角裤', 3, 5, '95POLYESTER%5ELASTANO', 'Lorena', '', 'PANTY DAMA');
INSERT INTO `style_number` VALUES (400, 'DX04S114', '/img/upload/', NULL, NULL, 41.76, 0, '女成丁裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (401, 'DX0420-S37', '/img/upload/', NULL, NULL, 66.00, 0, '女成四角裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'BOXER DAMA');
INSERT INTO `style_number` VALUES (402, 'DX04S61', '/img/upload/', NULL, NULL, 66.00, 0, '女成妈咪裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'PANTY DAMA');
INSERT INTO `style_number` VALUES (403, 'DX04S67', '/img/upload/', NULL, NULL, 62.40, 0, '女成妈咪裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'PANTY DAMA');
INSERT INTO `style_number` VALUES (404, 'DX04S73', '/img/upload/', NULL, NULL, 44.40, 0, '女成丁裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (405, 'DX04S91', '/img/upload/', NULL, NULL, 52.80, 0, '女成四角裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'BOXER DAMA');
INSERT INTO `style_number` VALUES (406, 'DX04S94', '/img/upload/', NULL, NULL, 30.60, 0, '女成四角裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'BOXER DAMA');
INSERT INTO `style_number` VALUES (407, 'DX04S95', '/img/upload/', NULL, NULL, 30.60, 0, '女成四角裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'BOXER DAMA');
INSERT INTO `style_number` VALUES (408, 'DX04S66', '/img/upload/', NULL, NULL, 66.00, 0, '女成妈咪裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'PANTY DAMA');
INSERT INTO `style_number` VALUES (409, 'NV04S79', '/img/upload/', NULL, NULL, 40.80, 0, '女成丁裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (410, 'NV04S53', '/img/upload/', NULL, NULL, 43.20, 0, '少女背心', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'TOP JUNIOR');
INSERT INTO `style_number` VALUES (411, 'NV04S55', '/img/upload/', NULL, NULL, 66.00, 0, '少女背心', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'TOP JUNIOR');
INSERT INTO `style_number` VALUES (412, 'NV04S62', '/img/upload/', NULL, NULL, 63.60, 0, '女成妈咪裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'PANTY DAMA');
INSERT INTO `style_number` VALUES (413, 'NV04S78', '/img/upload/', NULL, NULL, 39.60, 0, '女成丁裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (414, 'LR0410-S06', '/img/upload/', NULL, NULL, 26.76, 0, '女成丁裤', 3, 5, '95POLYESTER%5ELASTANO', 'Lorena', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (415, 'NV0420-S36', '/img/upload/', NULL, NULL, 65.40, 0, '女成四角裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'BOXER DAMA');
INSERT INTO `style_number` VALUES (416, 'NV04S70', '/img/upload/', NULL, NULL, 43.80, 0, '女成三角裤', 3, 5, '92%NYLON8%ELASTANO', 'DIANE', '', 'PANTY DAMA');
INSERT INTO `style_number` VALUES (417, 'NV04S98', '/img/upload/', NULL, NULL, 32.40, 0, '女成丁裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (418, 'NV04S99', '/img/upload/', NULL, NULL, 32.40, 0, '女成丁裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (419, 'NV04S113', '/img/upload/', NULL, NULL, 41.76, 0, '女成丁裤', 3, 5, '95%COTTON%5ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (420, 'NV04S120', '/img/upload/', NULL, NULL, 33.96, 0, '女成丁裤', 3, 5, '92%NYLON8%ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (421, 'NV04S121', '/img/upload/', NULL, NULL, 33.96, 0, '女成丁裤', 3, 5, '92%NYLON8%ELASTANO', 'DIANE', '', 'HILO DAMA');
INSERT INTO `style_number` VALUES (422, 'NV04S145', '/img/upload/', NULL, NULL, 53.40, 0, '女成三角裤', 3, 5, '92%NYLON8%ELASTANO', 'DIANE', '', 'PANTY DAMA');
INSERT INTO `style_number` VALUES (423, 'EM3290', '/img/upload/', NULL, NULL, 115.50, 0, '肥佬平脚裤', 3, 9, '95%COTTON 5%ELASTANO', 'EMBAJADOR PLUS ', '', 'BOXER HOMBRE PLUS');
INSERT INTO `style_number` VALUES (424, 'EM3291', '/img/upload/', NULL, NULL, 121.50, 0, '肥佬平脚裤', 3, 9, '95%COTTON 5%ELASTANO', 'EMBAJADOR PLUS ', '', 'BOXER HOMBRE PLUS');
INSERT INTO `style_number` VALUES (425, 'MA32M95', '/img/upload/', NULL, NULL, 76.50, 0, '男装肥佬裤', 3, 9, '65%POLIESTER 35%COTTON', 'MARRISON PLUS', '', 'BOXER HOMBRE PLUS');
INSERT INTO `style_number` VALUES (426, 'MA32M96', '/img/upload/', NULL, NULL, 82.50, 0, '男装肥佬裤', 3, 9, '65%POLIESTER 35%COTTON', 'MARRISON PLUS', '', 'BOXER HOMBRE PLUS');
INSERT INTO `style_number` VALUES (427, 'DX55R03', '/img/upload/', NULL, NULL, 86.40, 0, '文胸', 17, 12, '95%COTTON5%SPANDEX', 'DIANE', '', 'Bras');
INSERT INTO `style_number` VALUES (428, 'LR30K111P', '/img/upload/', NULL, NULL, 78.00, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (429, 'LR30K116P', '/img/upload/', NULL, NULL, 82.20, 0, '文胸', 19, 8, '95%polyester,6%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (430, 'LR30K117P', '/img/upload/', NULL, NULL, 82.20, 0, '文胸 ', 19, 8, '95%polyester,7%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (431, 'LR30K124C', '/img/upload/', NULL, NULL, 84.60, 0, '文胸', 19, 8, '95%polyester,8%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (432, 'LR30K125', '/img/upload/', NULL, NULL, 69.00, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (433, 'LR30K119P', '/img/upload/', NULL, NULL, 84.60, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (434, 'LR30K112P', '/img/upload/', NULL, NULL, 82.20, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (435, 'LR30K122C', '/img/upload/', NULL, NULL, 81.60, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (436, 'LR30K118P', '/img/upload/', NULL, NULL, 82.20, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (437, 'LR30K123C', '/img/upload/', NULL, NULL, 85.80, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (438, 'LR30K126', '/img/upload/', NULL, NULL, 69.00, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (439, 'LR30M03', '/img/upload/', NULL, NULL, 69.00, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (440, 'LR30K121C', '/img/upload/', NULL, NULL, 81.60, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (441, 'LR30I70C', '/img/upload/', NULL, NULL, 91.80, 0, '文胸', 20, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (442, 'LR30K128', '/img/upload/', NULL, NULL, 70.80, 0, '文胸', 19, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (443, 'LR30M01', '/img/upload/', NULL, NULL, 69.00, 0, '文胸', 21, 8, '95%polyester,5%elastano', 'LORENA', '', 'Bras');
INSERT INTO `style_number` VALUES (444, 'DX40S23', '/img/upload/', NULL, NULL, 93.60, 0, '文胸', 3, 10, '92%POLIAMIDA，8%ELASTANO', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (445, 'DX40R61', '/img/upload/', NULL, NULL, 105.60, 0, '文胸', 17, 10, '92%POLIAMIDA，8%ELASTANO', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (446, 'DX40R62', '/img/upload/', NULL, NULL, 54.00, 0, '文胸', 17, 10, '92%POLIAMIDA，8%ELASTANO', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (447, 'DX40R79', '/img/upload/', NULL, NULL, 102.00, 0, '文胸', 17, 10, '92%POLIAMIDA，8%ELASTANO', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (448, 'DX40R80', '/img/upload/', NULL, NULL, 50.40, 0, '文胸', 17, 10, '92%POLIAMIDA，8%ELASTANO', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (449, 'DX40R93', '/img/upload/', NULL, NULL, 139.20, 0, '文胸', 17, 10, '92%POLIAMIDA，8%ELASTANO', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (450, 'NV53S23P', '/img/upload/', NULL, NULL, 139.20, 0, '文胸', 3, 11, '85%NYLON 15%ELASAN0', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (451, 'NV53S22P', '/img/upload/', NULL, NULL, 128.40, 0, '文胸', 3, 11, '85%NYLON 15%ELASAN1', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (452, 'NV53S24C', '/img/upload/', NULL, NULL, 117.60, 0, '文胸', 3, 11, '85%NYLON 15%ELASAN2', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (453, 'NV53S29P', '/img/upload/', NULL, NULL, 126.00, 0, '文胸', 3, 11, '85%NYLON 15%ELASAN3', 'Diane', '', 'Brassier');
INSERT INTO `style_number` VALUES (454, 'NV53S27P', '/img/upload/', NULL, NULL, 128.40, 0, '文胸', 3, 11, '85%NYLON 15%ELASAN4', 'Diane', '', 'Brassier');

-- ----------------------------
-- Table structure for style_size
-- ----------------------------
DROP TABLE IF EXISTS `style_size`;
CREATE TABLE `style_size`  (
  `style_id` int(0) NULL DEFAULT NULL,
  `style_size_id` int(0) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size_matching` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`style_size_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of style_size
-- ----------------------------
INSERT INTO `style_size` VALUES (57, 19, 'S:32cm,Tiro:22cm', 3);
INSERT INTO `style_size` VALUES (57, 20, 'M:34cm,Tiro:23cm', 4);
INSERT INTO `style_size` VALUES (57, 21, 'L:36cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (57, 22, 'L:38cm,Tiro:25cm', 2);
INSERT INTO `style_size` VALUES (58, 23, 'S:32cm,Tiro:22cm', 4);
INSERT INTO `style_size` VALUES (58, 24, 'M:34cm,Tiro:23cm', 5);
INSERT INTO `style_size` VALUES (58, 25, 'L:36cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (59, 26, 'S:32cm,Tiro:22cm', 3);
INSERT INTO `style_size` VALUES (59, 27, 'M:34cm,Tiro:23cm', 4);
INSERT INTO `style_size` VALUES (59, 28, ' L:36cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (59, 29, ' L:38cm,Tiro:25cm', 2);
INSERT INTO `style_size` VALUES (60, 30, 'S:32cm,Tiro:22cm', 4);
INSERT INTO `style_size` VALUES (60, 31, 'M:34cm,Tiro:23cm', 5);
INSERT INTO `style_size` VALUES (60, 32, 'L:36cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (61, 33, 'S:32cm,Tiro:22cm', 4);
INSERT INTO `style_size` VALUES (61, 34, 'M:34cm,Tiro:23cm', 5);
INSERT INTO `style_size` VALUES (61, 35, 'L:36cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (62, 36, 'S:32cm,Tiro:22cm', 4);
INSERT INTO `style_size` VALUES (62, 37, 'M:34cm,Tiro:23cm', 5);
INSERT INTO `style_size` VALUES (62, 38, 'L:36cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (63, 39, 'S:32cm,Tiro:21cm', 2);
INSERT INTO `style_size` VALUES (63, 40, 'M:34cm,Tiro:22cm', 3);
INSERT INTO `style_size` VALUES (63, 41, 'L:36cm,Tiro:23cm', 4);
INSERT INTO `style_size` VALUES (63, 42, 'XL:38cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (64, 43, 'S:32cm,Tiro:21cm', 2);
INSERT INTO `style_size` VALUES (64, 44, 'M:34cm,Tiro:22cm', 3);
INSERT INTO `style_size` VALUES (64, 45, 'L:36cm,Tiro:23cm', 4);
INSERT INTO `style_size` VALUES (64, 46, 'XL:38cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (65, 47, 'S:32cm,Tiro:21cm', 2);
INSERT INTO `style_size` VALUES (65, 48, 'M:34cm,Tiro:22cm', 3);
INSERT INTO `style_size` VALUES (65, 49, 'L:36cm,Tiro:23cm', 4);
INSERT INTO `style_size` VALUES (65, 50, 'XL:38cm,Tiro:24cm', 3);
INSERT INTO `style_size` VALUES (66, 51, 'S:32cm,Tiro:21cm', 2);
INSERT INTO `style_size` VALUES (66, 52, 'M:34cm,Tiro:22cm', 3);
INSERT INTO `style_size` VALUES (66, 53, 'L:36cm,Tiro:23cm', 4);
INSERT INTO `style_size` VALUES (66, 54, 'XL:38cm,Tiro:24cm', 3);

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `age` int(0) NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `shipment_id` int(0) NULL DEFAULT NULL,
  `order_id` int(0) NULL DEFAULT NULL,
  `ceshi` double(10, 2) NULL DEFAULT NULL,
  `chang` double(255, 2) NULL DEFAULT NULL,
  `kuan` double(255, 2) NULL DEFAULT NULL,
  `gao` double(255, 2) NULL DEFAULT NULL,
  `doz_per_box` int(0) NULL DEFAULT NULL,
  `box_num` int(0) NULL DEFAULT NULL,
  `total_num` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES (1, '何炅', 28, '男', '17865245895', '7.33', NULL, NULL, NULL, NULL, NULL, NULL, 25, 4, 100);
INSERT INTO `test` VALUES (2, '乐嘉', 55, '男', '6666666666', '6.55', NULL, NULL, NULL, NULL, NULL, NULL, 30, 6, 180);
INSERT INTO `test` VALUES (3, '哈哈哈', 66, '女', '99999999', '5.88', NULL, NULL, NULL, NULL, NULL, NULL, 20, 7, 140);
INSERT INTO `test` VALUES (4, '何炅', 28, '男', '17865245895', '7.33', NULL, NULL, NULL, NULL, NULL, NULL, 25, 4, 100);
INSERT INTO `test` VALUES (5, '乐嘉', 55, '男', '6666666666', '6.55', NULL, NULL, NULL, NULL, NULL, NULL, 30, 6, 180);
INSERT INTO `test` VALUES (6, '哈哈哈', 66, '女', '99999999', '5.88', NULL, NULL, NULL, NULL, NULL, NULL, 20, 7, 140);
INSERT INTO `test` VALUES (7, '何炅', 28, '男', '17865245895', '7.33', NULL, NULL, NULL, NULL, NULL, NULL, 25, 4, 100);
INSERT INTO `test` VALUES (8, '乐嘉', 55, '男', '6666666666', '6.55', NULL, NULL, NULL, NULL, NULL, NULL, 30, 6, 180);
INSERT INTO `test` VALUES (9, '哈哈哈', 66, '女', '99999999', '5.88', NULL, NULL, NULL, NULL, NULL, NULL, 20, 7, 140);
INSERT INTO `test` VALUES (10, '何炅', 28, '男', '17865245895', '7.33', NULL, NULL, NULL, NULL, NULL, NULL, 25, 4, 100);
INSERT INTO `test` VALUES (11, '乐嘉', 55, '男', '6666666666', '6.55', NULL, NULL, NULL, NULL, NULL, NULL, 30, 6, 180);
INSERT INTO `test` VALUES (12, '哈哈哈', 66, '女', '99999999', '5.88', NULL, NULL, NULL, NULL, NULL, NULL, 20, 7, 140);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(0) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_pwd` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `user_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '1 超级管理员 、 2  管理员 、 3 普通用户',
  `user_state` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '0 未审核 、1 已审核',
  `is_delete` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '0 正常、 1 已删除',
  `create_by` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` int(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, 'admin', '超级管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2017-11-14 15:14:31', 1, '2022-04-24 15:33:12');
INSERT INTO `user_info` VALUES (3, 'root', 'root', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2017-11-16 19:31:49', 1, '2022-03-16 17:28:34');
INSERT INTO `user_info` VALUES (5, 'asdsjkb', '可爱吧1', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '1', 1, '2017-11-16 21:25:41', 1, '2022-03-15 14:57:44');
INSERT INTO `user_info` VALUES (6, 'dasdasf', 'start', 'c431d451c81e75ffac75a640590ed0a1', '1', '1', '1', 1, '2017-11-16 21:36:41', 1, '2017-11-21 10:45:57');
INSERT INTO `user_info` VALUES (7, 'fsdfs', 'start', 'c431d451c81e75ffac75a640590ed0a1', '1', '0', '1', 1, '2017-11-16 21:39:09', 1, '2017-11-21 10:44:35');
INSERT INTO `user_info` VALUES (10, 'root', 'root', 'c431d451c81e75ffac75a640590ed0a1', '3', '0', '1', 1, '2017-11-17 10:48:24', NULL, NULL);
INSERT INTO `user_info` VALUES (19, 'static', 'static', 'c431d451c81e75ffac75a640590ed0a1', '2', '0', '0', 1, '2017-11-29 22:10:51', NULL, NULL);
INSERT INTO `user_info` VALUES (20, 'public', 'public', 'c431d451c81e75ffac75a640590ed0a1', '2', '1', '0', 1, '2017-12-01 14:40:15', NULL, NULL);
INSERT INTO `user_info` VALUES (21, 'wk', '晴空', NULL, NULL, '0', '0', 1, '2022-03-17 17:24:00', NULL, NULL);
INSERT INTO `user_info` VALUES (23, 'zhangsan', '张三', NULL, NULL, '0', '1', 1, '2022-04-08 16:18:52', NULL, NULL);
INSERT INTO `user_info` VALUES (24, 'lisi', '李四', NULL, NULL, '0', '1', 1, '2022-04-08 16:20:19', NULL, NULL);
INSERT INTO `user_info` VALUES (25, 'wangwu', '王五', NULL, NULL, '0', '1', 1, '2022-04-08 16:20:43', NULL, NULL);
INSERT INTO `user_info` VALUES (26, 'liuliu', '刘六', NULL, NULL, '0', '1', 1, '2022-04-08 16:21:14', NULL, NULL);
INSERT INTO `user_info` VALUES (27, 'wzl', '我这里', NULL, NULL, '1', '1', 1, '2022-04-19 17:09:13', NULL, NULL);
INSERT INTO `user_info` VALUES (28, 'caigou', '采购', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-22 13:42:35', NULL, NULL);
INSERT INTO `user_info` VALUES (29, 'ruku', '入库管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-22 13:50:25', NULL, NULL);
INSERT INTO `user_info` VALUES (30, 'chuku', '出库管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-22 13:53:20', NULL, NULL);
INSERT INTO `user_info` VALUES (31, 'shangpin', '商品管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-22 13:57:11', NULL, NULL);
INSERT INTO `user_info` VALUES (32, 'diaohuo', '调货管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-24 15:23:22', NULL, NULL);
INSERT INTO `user_info` VALUES (33, 'cangku', '仓库管理员', 'c431d451c81e75ffac75a640590ed0a1', NULL, '1', '0', 1, '2022-04-24 15:23:48', NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_role_id` int(0) NOT NULL AUTO_INCREMENT,
  `role_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (11, 3, 7);
INSERT INTO `user_role` VALUES (12, 5, 7);
INSERT INTO `user_role` VALUES (13, 3, 6);
INSERT INTO `user_role` VALUES (14, 5, 6);
INSERT INTO `user_role` VALUES (15, 5, 9);
INSERT INTO `user_role` VALUES (20, 1, 1);
INSERT INTO `user_role` VALUES (23, 3, 5);
INSERT INTO `user_role` VALUES (25, 4, 5);
INSERT INTO `user_role` VALUES (26, 5, 5);
INSERT INTO `user_role` VALUES (27, 5, 19);
INSERT INTO `user_role` VALUES (28, 5, 20);
INSERT INTO `user_role` VALUES (45, 4, 3);
INSERT INTO `user_role` VALUES (46, 3, 3);
INSERT INTO `user_role` VALUES (47, 6, 3);
INSERT INTO `user_role` VALUES (48, 2, 3);
INSERT INTO `user_role` VALUES (49, 11, 28);
INSERT INTO `user_role` VALUES (51, 14, 30);
INSERT INTO `user_role` VALUES (52, 12, 29);
INSERT INTO `user_role` VALUES (53, 13, 31);
INSERT INTO `user_role` VALUES (54, 15, 32);
INSERT INTO `user_role` VALUES (55, 16, 33);

SET FOREIGN_KEY_CHECKS = 1;
