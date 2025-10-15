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

 Date: 15/10/2025 12:49:47
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`
(
    `name`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
    PRIMARY KEY (`name`),
    UNIQUE KEY `config_key` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of config
-- ----------------------------
BEGIN;
INSERT INTO `config` (`name`, `value`)
VALUES ('author', '晓牛');
INSERT INTO `config` (`name`, `value`)
VALUES ('copyright', 'TinyNote © 2025-2026');
INSERT INTO `config` (`name`, `value`)
VALUES ('description', '资深Java全栈工程师');
INSERT INTO `config` (`name`, `value`)
VALUES ('icp_number', '滇ICP备2025050531号-1');
INSERT INTO `config` (`name`, `value`)
VALUES ('installed', '1');
INSERT INTO `config` (`name`, `value`)
VALUES ('keywords', 'Java, Spring Boot, Spring Cloud, 微服务, MyBatis, Maven, 分布式系统, 高并发, JVM调优');
INSERT INTO `config` (`name`, `value`)
VALUES ('public_security', '苏公网安备32050502011896号');
INSERT INTO `config` (`name`, `value`)
VALUES ('robots', '*');
INSERT INTO `config` (`name`, `value`)
VALUES ('site_title', '晓牛开发笔记');
INSERT INTO `config` (`name`, `value`)
VALUES ('site_url', 'https://www.xilio.cn');
COMMIT;

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`
(
    `id`         int unsigned NOT NULL AUTO_INCREMENT,
    `title`      varchar(255)                                                  NOT NULL,
    `summary`    varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `text`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `created_at` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` timestamp                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `uid`        int                                                           NOT NULL,
    `status`     tinyint(1) NOT NULL,
    `draft`      tinyint(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of content
-- ----------------------------
BEGIN;
INSERT INTO `content` (`id`, `title`, `summary`, `text`, `created_at`, `updated_at`, `uid`, `status`, `draft`)
VALUES (72, '我的第一篇文章',
        '# 摘要\n这里填写摘要信息\n::: primary 写一篇文章\n我爱写代码\n:::\n\n\n\n| Header | Header | Header |\n| ------ | ------ | ------ |\n| Sample | Sample | Sample |\n| Sample | Sample ',
        '# 摘要\n这里填写摘要信息\n::: primary 写一篇文章\n我爱写代码\n:::\n\n\n\n| Header | Header | Header |\n| ------ | ------ | ------ |\n| Sample | Sample | Sample |\n| Sample | Sample | Sample |\n| Sample | Sample | Sample |\n\n',
        '2025-10-14 20:36:54', '2025-10-14 20:36:54', 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for meta
-- ----------------------------
DROP TABLE IF EXISTS `meta`;
CREATE TABLE `meta`
(
    `id`   int unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
    `type` varchar(20)                                                   NOT NULL,
    PRIMARY KEY (`id`, `name`) USING BTREE,
    UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of meta
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for relationship
-- ----------------------------
DROP TABLE IF EXISTS `relationship`;
CREATE TABLE `relationship`
(
    `cid` int unsigned NOT NULL,
    `mid` int unsigned NOT NULL,
    PRIMARY KEY (`cid`, `mid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of relationship
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id`         int          NOT NULL AUTO_INCREMENT,
    `username`   varchar(50)  NOT NULL,
    `password`   varchar(255) NOT NULL,
    `created_at` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `nickname`   varchar(255)          DEFAULT NULL,
    `avatar`     varchar(1024)         DEFAULT NULL,
    PRIMARY KEY (`id`, `username`) USING BTREE,
    UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` (`id`, `username`, `password`, `created_at`, `nickname`, `avatar_url`)
VALUES (1, 'admin', '$2a$10$6pfcr6F5wyxvkwI.OSR8Hu29dhVZA9bSnf8J/nVwKxpZhTzOJDjKG', '2025-10-09 15:48:35',
        '晓牛开发笔记',
        'http://localhost:8080/file/1a27c32548bc4d488fef40306c7df5c3_87552799a8ea2e6c898d57755f65048f.jpeg');
COMMIT;

SET
FOREIGN_KEY_CHECKS = 1;
