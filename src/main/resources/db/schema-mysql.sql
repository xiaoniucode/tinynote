/*
 Navicat Premium Dump SQL

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44)
 Source Host           : localhost:3306
 Source Schema         : tinynote

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44)
 File Encoding         : 65001

 Date: 17/10/2025 11:19:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
                          `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                          `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
                          PRIMARY KEY (`name`),
                          UNIQUE KEY `config_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of config
-- ----------------------------
BEGIN;
INSERT INTO `config` (`name`, `value`) VALUES ('bio', '');
INSERT INTO `config` (`name`, `value`) VALUES ('copyright', 'TinyNote © 2025-2026');
INSERT INTO `config` (`name`, `value`) VALUES ('description', '');
INSERT INTO `config` (`name`, `value`) VALUES ('icp_number', '');
INSERT INTO `config` (`name`, `value`) VALUES ('installed', '1');
INSERT INTO `config` (`name`, `value`) VALUES ('keywords', '');
INSERT INTO `config` (`name`, `value`) VALUES ('public_security', '');
INSERT INTO `config` (`name`, `value`) VALUES ('robots', '*');
INSERT INTO `config` (`name`, `value`) VALUES ('site_title', '网站标题');
INSERT INTO `config` (`name`, `value`) VALUES ('site_url', 'https://www.xilio.cn');
COMMIT;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
                           `id` int unsigned NOT NULL AUTO_INCREMENT,
                           `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                           `summary` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                           `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                           `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                           `uid` int NOT NULL,
                           `status` tinyint(1) NOT NULL,
                           `draft` tinyint(1) NOT NULL DEFAULT '0',
                           PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of content
-- ----------------------------
BEGIN;
INSERT INTO `content` (`id`, `title`, `summary`, `text`, `created_at`, `updated_at`, `uid`, `status`, `draft`) VALUES (98, '我的第一篇文章', '我的第一篇文章', '# 摘要\n\n\n``` \npublic class Hello{\n\n}\n```\n\n```mermaid\npie\ntitle hello\n\"A\" : 100\n\"B\" : 80\n\"C\" : 40\n\"D\" : 30\n```\n', '2025-10-17 11:14:44', '2025-10-17 11:14:44', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for meta
-- ----------------------------
DROP TABLE IF EXISTS `meta`;
CREATE TABLE `meta` (
                        `id` int unsigned NOT NULL AUTO_INCREMENT,
                        `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                        `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of meta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for relationship
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship` (
                                `cid` int unsigned NOT NULL,
                                `mid` int unsigned NOT NULL,
                                PRIMARY KEY (`cid`,`mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of relationship
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                        `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
                        `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
                        `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `created_at`, `nickname`, `avatar`) VALUES (1, 'admin', '$2a$10$6pfcr6F5wyxvkwI.OSR8Hu29dhVZA9bSnf8J/nVwKxpZhTzOJDjKG', '2025-10-09 15:48:35', 'admin', 'http://localhost:8080/file/1a27c32548bc4d488fef40306c7df5c3_87552799a8ea2e6c898d57755f65048f.jpeg');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
