/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : ltf_ssm_net

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2019-07-11 10:56:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `R_Id` int(11) NOT NULL AUTO_INCREMENT,
  `R_Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`R_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'NormalUser');
INSERT INTO `t_role` VALUES ('2', 'VIPUser');
INSERT INTO `t_role` VALUES ('3', 'ManagerUser');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `U_Id` int(11) NOT NULL AUTO_INCREMENT,
  `U_Name` varchar(255) DEFAULT NULL,
  `U_PassWord` varchar(255) DEFAULT NULL,
  `U_Email` varchar(30) DEFAULT NULL,
  `R_Id` int(11) NOT NULL,
  PRIMARY KEY (`U_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_viewtype
-- ----------------------------
DROP TABLE IF EXISTS `t_viewtype`;
CREATE TABLE `t_viewtype` (
  `V_Id` int(11) NOT NULL AUTO_INCREMENT,
  `V_Name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`V_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_viewtype
-- ----------------------------

-- ----------------------------
-- Table structure for t_workinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_workinfo`;
CREATE TABLE `t_workinfo` (
  `W_Id` int(11) NOT NULL AUTO_INCREMENT,
  `W_Name` varchar(255) DEFAULT NULL,
  `W_Brief` varchar(255) DEFAULT NULL,
  `W_Img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`W_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_workinfo
-- ----------------------------
