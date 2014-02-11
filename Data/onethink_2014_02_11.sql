/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : onethink

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2014-02-11 17:34:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for onethink_action
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of onethink_action
-- ----------------------------
INSERT INTO `onethink_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `onethink_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `onethink_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `onethink_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `onethink_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '1', '1383285551');
INSERT INTO `onethink_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `onethink_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `onethink_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `onethink_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '0', '1383296301');
INSERT INTO `onethink_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '0', '1383296765');

-- ----------------------------
-- Table structure for onethink_action_log
-- ----------------------------
DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of onethink_action_log
-- ----------------------------
INSERT INTO `onethink_action_log` VALUES ('1', '1', '1', '0', 'member', '1', 'admin在2014-01-21 11:23登录了后台', '1', '1390274638');
INSERT INTO `onethink_action_log` VALUES ('2', '6', '1', '0', 'config', '37', '操作url：/onethink.git/wwwroot/index.php?s=/admin/config/edit.html', '1', '1390274668');
INSERT INTO `onethink_action_log` VALUES ('3', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-22 11:55登录了后台', '1', '1390362926');
INSERT INTO `onethink_action_log` VALUES ('4', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-22 17:12登录了后台', '1', '1390381950');
INSERT INTO `onethink_action_log` VALUES ('5', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-24 09:57登录了后台', '1', '1390528677');
INSERT INTO `onethink_action_log` VALUES ('6', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-25 08:55登录了后台', '1', '1390611309');
INSERT INTO `onethink_action_log` VALUES ('7', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-25 09:07登录了后台', '1', '1390612048');
INSERT INTO `onethink_action_log` VALUES ('8', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/admin/config/edit.html', '1', '1390612186');
INSERT INTO `onethink_action_log` VALUES ('9', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/admin/config/edit.html', '1', '1390632389');
INSERT INTO `onethink_action_log` VALUES ('10', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/admin/config/edit.html', '1', '1390632407');
INSERT INTO `onethink_action_log` VALUES ('11', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-25 16:22登录了后台', '1', '1390638133');
INSERT INTO `onethink_action_log` VALUES ('12', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-25 17:10登录了后台', '1', '1390641059');
INSERT INTO `onethink_action_log` VALUES ('13', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-26 09:09登录了后台', '1', '1390698578');
INSERT INTO `onethink_action_log` VALUES ('14', '6', '1', '2130706433', 'config', '13', '操作url：/index.php?s=/Admin/Config/edit.html', '1', '1390719847');
INSERT INTO `onethink_action_log` VALUES ('15', '10', '1', '2130706433', 'Menu', '3', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1390720877');
INSERT INTO `onethink_action_log` VALUES ('16', '10', '1', '2130706433', 'Menu', '13', '操作url：/index.php?s=/Admin/Menu/edit.html', '1', '1390720886');
INSERT INTO `onethink_action_log` VALUES ('17', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-27 07:49登录了后台', '1', '1390780176');
INSERT INTO `onethink_action_log` VALUES ('18', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin/Menu/edit.html', '1', '1390807847');
INSERT INTO `onethink_action_log` VALUES ('19', '10', '1', '2130706433', 'Menu', '122', '操作url：/admin/Menu/add.html', '1', '1390808924');
INSERT INTO `onethink_action_log` VALUES ('20', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-28 15:08登录了后台', '1', '1390892887');
INSERT INTO `onethink_action_log` VALUES ('21', '10', '1', '2130706433', 'Menu', '123', '操作url：/admin/Menu/add.html', '1', '1390893068');
INSERT INTO `onethink_action_log` VALUES ('22', '10', '1', '2130706433', 'Menu', '44', '操作url：/admin/Menu/edit.html', '1', '1390893110');
INSERT INTO `onethink_action_log` VALUES ('23', '10', '1', '2130706433', 'Menu', '44', '操作url：/admin/Menu/edit.html', '1', '1390893133');
INSERT INTO `onethink_action_log` VALUES ('24', '10', '1', '2130706433', 'Menu', '124', '操作url：/admin/Menu/add.html', '1', '1390893293');
INSERT INTO `onethink_action_log` VALUES ('25', '10', '1', '2130706433', 'Menu', '44', '操作url：/admin/Menu/edit.html', '1', '1390893308');
INSERT INTO `onethink_action_log` VALUES ('26', '10', '1', '2130706433', 'Menu', '123', '操作url：/admin/Menu/edit.html', '1', '1390893328');
INSERT INTO `onethink_action_log` VALUES ('27', '10', '1', '2130706433', 'Menu', '44', '操作url：/admin/Menu/edit.html', '1', '1390893341');
INSERT INTO `onethink_action_log` VALUES ('28', '10', '1', '2130706433', 'Menu', '124', '操作url：/admin/Menu/edit.html', '1', '1390893351');
INSERT INTO `onethink_action_log` VALUES ('29', '10', '1', '2130706433', 'Menu', '125', '操作url：/admin/Menu/add.html', '1', '1390893455');
INSERT INTO `onethink_action_log` VALUES ('30', '10', '1', '2130706433', 'Menu', '126', '操作url：/admin/Menu/add.html', '1', '1390893936');
INSERT INTO `onethink_action_log` VALUES ('31', '10', '1', '2130706433', 'Menu', '125', '操作url：/admin/Menu/edit.html', '1', '1390893954');
INSERT INTO `onethink_action_log` VALUES ('32', '10', '1', '2130706433', 'Menu', '127', '操作url：/admin/Menu/add.html', '1', '1390894110');
INSERT INTO `onethink_action_log` VALUES ('33', '10', '1', '2130706433', 'Menu', '128', '操作url：/admin/Menu/add.html', '1', '1390894878');
INSERT INTO `onethink_action_log` VALUES ('34', '10', '1', '2130706433', 'Menu', '128', '操作url：/admin/Menu/edit.html', '1', '1390894948');
INSERT INTO `onethink_action_log` VALUES ('35', '10', '1', '2130706433', 'Menu', '17', '操作url：/admin/Menu/edit.html', '1', '1390895000');
INSERT INTO `onethink_action_log` VALUES ('36', '10', '1', '2130706433', 'Menu', '129', '操作url：/admin/Menu/add.html', '1', '1390895046');
INSERT INTO `onethink_action_log` VALUES ('37', '10', '1', '2130706433', 'Menu', '129', '操作url：/admin/Menu/edit.html', '1', '1390895060');
INSERT INTO `onethink_action_log` VALUES ('38', '10', '1', '2130706433', 'Menu', '17', '操作url：/admin/Menu/edit.html', '1', '1390895082');
INSERT INTO `onethink_action_log` VALUES ('39', '10', '1', '2130706433', 'Menu', '130', '操作url：/admin/Menu/add.html', '1', '1390895153');
INSERT INTO `onethink_action_log` VALUES ('40', '10', '1', '2130706433', 'Menu', '131', '操作url：/admin/Menu/add.html', '1', '1390895234');
INSERT INTO `onethink_action_log` VALUES ('41', '10', '1', '2130706433', 'Menu', '132', '操作url：/admin/Menu/add.html', '1', '1390895373');
INSERT INTO `onethink_action_log` VALUES ('42', '10', '1', '2130706433', 'Menu', '133', '操作url：/admin/Menu/add.html', '1', '1390895606');
INSERT INTO `onethink_action_log` VALUES ('43', '10', '1', '2130706433', 'Menu', '17', '操作url：/admin/Menu/edit.html', '1', '1390895685');
INSERT INTO `onethink_action_log` VALUES ('44', '10', '1', '2130706433', 'Menu', '57', '操作url：/admin/Menu/edit.html', '1', '1390895750');
INSERT INTO `onethink_action_log` VALUES ('45', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-28 17:40登录了后台', '1', '1390902028');
INSERT INTO `onethink_action_log` VALUES ('46', '10', '1', '2130706433', 'Menu', '57', '操作url：/admin/Menu/edit.html', '1', '1390903805');
INSERT INTO `onethink_action_log` VALUES ('47', '10', '1', '2130706433', 'Menu', '134', '操作url：/admin/Menu/add.html', '1', '1390904351');
INSERT INTO `onethink_action_log` VALUES ('48', '10', '1', '2130706433', 'Menu', '135', '操作url：/admin/Menu/add.html', '1', '1390904413');
INSERT INTO `onethink_action_log` VALUES ('49', '10', '1', '2130706433', 'Menu', '136', '操作url：/admin/Menu/add.html', '1', '1390904445');
INSERT INTO `onethink_action_log` VALUES ('50', '10', '1', '2130706433', 'Menu', '137', '操作url：/admin/Menu/add.html', '1', '1390904467');
INSERT INTO `onethink_action_log` VALUES ('51', '10', '1', '2130706433', 'Menu', '138', '操作url：/admin/Menu/add.html', '1', '1390904495');
INSERT INTO `onethink_action_log` VALUES ('52', '6', '1', '2130706433', 'config', '38', '操作url：/admin/Config/edit.html', '1', '1390906174');
INSERT INTO `onethink_action_log` VALUES ('53', '6', '1', '2130706433', 'config', '27', '操作url：/admin/Config/edit.html', '1', '1390906341');
INSERT INTO `onethink_action_log` VALUES ('54', '6', '1', '2130706433', 'config', '39', '操作url：/admin/Config/edit.html', '1', '1390906589');
INSERT INTO `onethink_action_log` VALUES ('55', '6', '1', '2130706433', 'config', '39', '操作url：/admin/Config/edit.html', '1', '1390906683');
INSERT INTO `onethink_action_log` VALUES ('56', '6', '1', '2130706433', 'config', '39', '操作url：/admin/Config/edit.html', '1', '1390906846');
INSERT INTO `onethink_action_log` VALUES ('57', '6', '1', '2130706433', 'config', '39', '操作url：/admin/Config/edit.html', '1', '1390906982');
INSERT INTO `onethink_action_log` VALUES ('58', '6', '1', '2130706433', 'config', '39', '操作url：/admin/Config/edit.html', '1', '1390907115');
INSERT INTO `onethink_action_log` VALUES ('59', '6', '1', '2130706433', 'config', '39', '操作url：/admin/Config/edit.html', '1', '1390907172');
INSERT INTO `onethink_action_log` VALUES ('60', '6', '1', '2130706433', 'config', '0', '操作url：/admin/Config/del/id/39.html', '1', '1390907332');
INSERT INTO `onethink_action_log` VALUES ('61', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-29 11:21登录了后台', '1', '1390965670');
INSERT INTO `onethink_action_log` VALUES ('62', '10', '1', '2130706433', 'Menu', '126', '操作url：/admin/Menu/edit.html', '1', '1390965880');
INSERT INTO `onethink_action_log` VALUES ('63', '10', '1', '2130706433', 'Menu', '125', '操作url：/admin/Menu/edit.html', '1', '1390967258');
INSERT INTO `onethink_action_log` VALUES ('64', '8', '1', '2130706433', 'attribute', '9', '操作url：/admin/Attribute/update.html', '1', '1390967816');
INSERT INTO `onethink_action_log` VALUES ('65', '7', '1', '2130706433', 'model', '2', '操作url：/admin/model/update.html', '1', '1390968065');
INSERT INTO `onethink_action_log` VALUES ('66', '7', '1', '2130706433', 'model', '2', '操作url：/admin/model/update.html', '1', '1390968122');
INSERT INTO `onethink_action_log` VALUES ('67', '8', '1', '2130706433', 'attribute', '10', '操作url：/admin/Attribute/update.html', '1', '1390968172');
INSERT INTO `onethink_action_log` VALUES ('68', '8', '1', '2130706433', 'attribute', '4', '操作url：/admin/Attribute/update.html', '1', '1390968266');
INSERT INTO `onethink_action_log` VALUES ('69', '10', '1', '2130706433', 'Menu', '127', '操作url：/admin/Menu/edit.html', '1', '1390968612');
INSERT INTO `onethink_action_log` VALUES ('70', '6', '1', '2130706433', 'config', '38', '操作url：/admin/Config/edit.html', '1', '1390988483');
INSERT INTO `onethink_action_log` VALUES ('71', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-29 17:42登录了后台', '1', '1390988538');
INSERT INTO `onethink_action_log` VALUES ('72', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin/Attribute/update.html', '1', '1391000945');
INSERT INTO `onethink_action_log` VALUES ('73', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-30 09:48登录了后台', '1', '1391046491');
INSERT INTO `onethink_action_log` VALUES ('74', '8', '1', '2130706433', 'attribute', '9', '操作url：/admin/Attribute/update.html', '1', '1391047439');
INSERT INTO `onethink_action_log` VALUES ('75', '10', '1', '2130706433', 'Menu', '127', '操作url：/admin/Menu/edit.html', '1', '1391047451');
INSERT INTO `onethink_action_log` VALUES ('76', '10', '1', '2130706433', 'Menu', '80', '操作url：/admin/Menu/edit.html', '1', '1391047664');
INSERT INTO `onethink_action_log` VALUES ('77', '10', '1', '2130706433', 'Menu', '80', '操作url：/admin/Menu/edit.html', '1', '1391047725');
INSERT INTO `onethink_action_log` VALUES ('78', '10', '1', '2130706433', 'Menu', '132', '操作url：/admin/Menu/edit.html', '1', '1391047735');
INSERT INTO `onethink_action_log` VALUES ('79', '10', '1', '2130706433', 'Menu', '132', '操作url：/admin/Menu/edit.html', '1', '1391047747');
INSERT INTO `onethink_action_log` VALUES ('80', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin/Model/generate.html', '1', '1391049096');
INSERT INTO `onethink_action_log` VALUES ('81', '8', '1', '2130706433', 'attribute', '35', '操作url：/admin/Model/generate.html', '1', '1391049096');
INSERT INTO `onethink_action_log` VALUES ('82', '8', '1', '2130706433', 'attribute', '36', '操作url：/admin/Model/generate.html', '1', '1391049096');
INSERT INTO `onethink_action_log` VALUES ('83', '8', '1', '2130706433', 'attribute', '37', '操作url：/admin/Model/generate.html', '1', '1391049096');
INSERT INTO `onethink_action_log` VALUES ('84', '8', '1', '2130706433', 'attribute', '38', '操作url：/admin/Model/generate.html', '1', '1391049096');
INSERT INTO `onethink_action_log` VALUES ('85', '7', '1', '2130706433', 'model', '4', '操作url：/admin/model/update.html', '1', '1391049440');
INSERT INTO `onethink_action_log` VALUES ('86', '8', '1', '2130706433', 'attribute', '38', '操作url：/admin/Attribute/update.html', '1', '1391049554');
INSERT INTO `onethink_action_log` VALUES ('87', '8', '1', '2130706433', 'attribute', '37', '操作url：/admin/Attribute/update.html', '1', '1391049580');
INSERT INTO `onethink_action_log` VALUES ('88', '8', '1', '2130706433', 'attribute', '36', '操作url：/admin/Attribute/update.html', '1', '1391049592');
INSERT INTO `onethink_action_log` VALUES ('89', '8', '1', '2130706433', 'attribute', '35', '操作url：/admin/Attribute/update.html', '1', '1391049611');
INSERT INTO `onethink_action_log` VALUES ('90', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin/Attribute/update.html', '1', '1391049624');
INSERT INTO `onethink_action_log` VALUES ('91', '10', '1', '2130706433', 'Menu', '132', '操作url：/admin/Menu/edit.html', '1', '1391054133');
INSERT INTO `onethink_action_log` VALUES ('92', '10', '1', '2130706433', 'Menu', '129', '操作url：/admin/Menu/edit.html', '1', '1391054495');
INSERT INTO `onethink_action_log` VALUES ('93', '10', '1', '2130706433', 'Menu', '130', '操作url：/admin/Menu/edit.html', '1', '1391054552');
INSERT INTO `onethink_action_log` VALUES ('94', '10', '1', '2130706433', 'Menu', '129', '操作url：/admin/Menu/edit.html', '1', '1391077443');
INSERT INTO `onethink_action_log` VALUES ('95', '10', '1', '2130706433', 'Menu', '13', '操作url：/admin/Menu/edit.html', '1', '1391093334');
INSERT INTO `onethink_action_log` VALUES ('96', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/Menu/del.html', '1', '1391093350');
INSERT INTO `onethink_action_log` VALUES ('97', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin/Menu/del.html', '1', '1391093361');
INSERT INTO `onethink_action_log` VALUES ('98', '10', '1', '2130706433', 'Menu', '123', '操作url：/admin/Menu/edit.html', '1', '1391094438');
INSERT INTO `onethink_action_log` VALUES ('99', '10', '1', '2130706433', 'Menu', '131', '操作url：/admin/Menu/edit.html', '1', '1391133103');
INSERT INTO `onethink_action_log` VALUES ('100', '8', '1', '2130706433', 'attribute', '39', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('101', '8', '1', '2130706433', 'attribute', '40', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('102', '8', '1', '2130706433', 'attribute', '41', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('103', '8', '1', '2130706433', 'attribute', '42', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('104', '8', '1', '2130706433', 'attribute', '43', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('105', '8', '1', '2130706433', 'attribute', '44', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('106', '8', '1', '2130706433', 'attribute', '45', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('107', '8', '1', '2130706433', 'attribute', '46', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('108', '8', '1', '2130706433', 'attribute', '47', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('109', '8', '1', '2130706433', 'attribute', '48', '操作url：/admin/Model/generate.html', '1', '1391133228');
INSERT INTO `onethink_action_log` VALUES ('110', '7', '1', '2130706433', 'model', '5', '操作url：/admin/model/update.html', '1', '1391135686');
INSERT INTO `onethink_action_log` VALUES ('111', '10', '1', '2130706433', 'Menu', '128', '操作url：/admin/Menu/edit.html', '1', '1391136110');
INSERT INTO `onethink_action_log` VALUES ('112', '10', '1', '2130706433', 'Menu', '133', '操作url：/admin/Menu/edit.html', '1', '1391137336');
INSERT INTO `onethink_action_log` VALUES ('113', '10', '1', '2130706433', 'Menu', '133', '操作url：/admin/Menu/edit.html', '1', '1391137368');
INSERT INTO `onethink_action_log` VALUES ('114', '1', '1', '2130706433', 'member', '1', 'admin在2014-01-31 11:24登录了后台', '1', '1391138643');
INSERT INTO `onethink_action_log` VALUES ('115', '7', '1', '2130706433', 'model', '1', '操作url：/admin/model/update.html', '1', '1391163695');
INSERT INTO `onethink_action_log` VALUES ('116', '7', '1', '2130706433', 'model', '1', '操作url：/admin/model/update.html', '1', '1391163730');
INSERT INTO `onethink_action_log` VALUES ('117', '7', '1', '2130706433', 'model', '1', '操作url：/admin/model/update.html', '1', '1391163759');
INSERT INTO `onethink_action_log` VALUES ('118', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-05 19:53登录了后台', '1', '1391601213');
INSERT INTO `onethink_action_log` VALUES ('119', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-06 12:37登录了后台', '1', '1391661429');
INSERT INTO `onethink_action_log` VALUES ('120', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-06 22:55登录了后台', '1', '1391698509');
INSERT INTO `onethink_action_log` VALUES ('121', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-06 23:37登录了后台', '1', '1391701038');
INSERT INTO `onethink_action_log` VALUES ('122', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-07 15:03登录了后台', '1', '1391756588');
INSERT INTO `onethink_action_log` VALUES ('123', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-07 15:31登录了后台', '1', '1391758269');
INSERT INTO `onethink_action_log` VALUES ('124', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-07 17:19登录了后台', '1', '1391764752');
INSERT INTO `onethink_action_log` VALUES ('125', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-08 16:13登录了后台', '1', '1391847210');
INSERT INTO `onethink_action_log` VALUES ('126', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-10 08:33登录了后台', '1', '1391992405');
INSERT INTO `onethink_action_log` VALUES ('127', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-10 09:51登录了后台', '1', '1391997084');
INSERT INTO `onethink_action_log` VALUES ('128', '6', '1', '2130706433', 'config', '38', '操作url：/Admin/Config/edit.html', '1', '1391997310');
INSERT INTO `onethink_action_log` VALUES ('129', '6', '1', '2130706433', 'config', '38', '操作url：/Admin/Config/edit.html', '1', '1391997513');
INSERT INTO `onethink_action_log` VALUES ('130', '6', '1', '2130706433', 'config', '38', '操作url：/Admin/Config/edit.html', '1', '1391997526');
INSERT INTO `onethink_action_log` VALUES ('131', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-10 10:29登录了后台', '1', '1391999396');
INSERT INTO `onethink_action_log` VALUES ('132', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-10 14:11登录了后台', '1', '1392012706');
INSERT INTO `onethink_action_log` VALUES ('133', '6', '1', '2130706433', 'config', '25', '操作url：/Admin/Config/edit.html', '1', '1392017862');
INSERT INTO `onethink_action_log` VALUES ('134', '6', '1', '2130706433', 'config', '24', '操作url：/Admin/Config/edit.html', '1', '1392017874');
INSERT INTO `onethink_action_log` VALUES ('135', '10', '1', '2130706433', 'Menu', '123', '操作url：/Admin/Menu/edit.html', '1', '1392018238');
INSERT INTO `onethink_action_log` VALUES ('136', '10', '1', '2130706433', 'Menu', '124', '操作url：/Admin/Menu/edit.html', '1', '1392085999');
INSERT INTO `onethink_action_log` VALUES ('137', '1', '1', '2130706433', 'member', '1', 'admin在2014-02-11 11:20登录了后台', '1', '1392088837');

-- ----------------------------
-- Table structure for onethink_addons
-- ----------------------------
DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of onethink_addons
-- ----------------------------
INSERT INTO `onethink_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"4\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `onethink_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `onethink_addons` VALUES ('22', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1390978417', '0');
INSERT INTO `onethink_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `onethink_addons` VALUES ('24', 'Comment', '评论', '用于各种类型文档评论', '1', 'null', 'Wolixli', '0.1', '1391092185', '1');
INSERT INTO `onethink_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `onethink_addons` VALUES ('21', 'QiuBai', '糗事百科', '读别人的糗事，娱乐自己', '1', '{\"title\":\"\\u7cd7\\u4e8b\\u767e\\u79d1\",\"width\":\"2\",\"display\":\"1\",\"cache_time\":\"60\",\"mulimages\":\"1\"}', 'thinkphp', '0.1', '1390529296', '0');
INSERT INTO `onethink_addons` VALUES ('25', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '0', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"90040\",\"mulimages\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_form_pos_duoshuo\":\"buttom\",\"comment_data_list_duoshuo\":\"10\",\"comment_data_order_duoshuo\":\"asc\"}', 'thinkphp', '0.1', '1391765001', '0');
INSERT INTO `onethink_addons` VALUES ('26', 'Ping', '文章发布ping插件', '用于发布文档后的主动ping，主动增加收录', '1', '{\"site_name\":\"\\u535a\\u5ba2\",\"site_url\":\"blog.cn\",\"update_url\":\"Archive\\/@blog.cn\",\"update_rss\":\"feed@blog.cn\"}', 'yangweijie', '0.1', '1392009365', '0');
INSERT INTO `onethink_addons` VALUES ('27', 'ReturnTop', '返回顶部', '回到顶部美化，随机或指定显示，100款样式，每天一种换，天天都用新样式', '1', '{\"random\":\"0\",\"current\":\"2\"}', 'thinkphp', '0.1', '1392009776', '0');

-- ----------------------------
-- Table structure for onethink_attachment
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of onethink_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_attribute
-- ----------------------------
DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of onethink_attribute
-- ----------------------------
INSERT INTO `onethink_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1390968266', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '1', '', '1', '1:文章\r\n2:单独页面', '1', '0', '1', '1391047439', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '0', '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', '1', '0', '1', '1390968172', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895846', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('33', 'tags', '标签', 'text NOT NULL', 'textarea', '', '', '0', '', '2', '0', '1', '1391000945', '1391000945', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('34', 'title', '标题', 'varchar(200) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1391049624', '1391049096', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('35', 'name', '缩略名', 'varchar(200) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1391049611', '1391049096', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('36', 'description', '描述', 'varchar(200) NULL ', 'string', '', '', '1', '', '4', '0', '1', '1391049592', '1391049096', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('37', 'count', '数量', 'int(10) unsigned NULL ', 'string', '0', '文章关联的数量', '1', '', '4', '0', '1', '1391049580', '1391049096', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('38', 'order', '排序', 'int(10) unsigned NULL ', 'string', '0', '', '1', '', '4', '0', '1', '1391049554', '1391049096', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('39', 'name', '原始文件名', 'char(30) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('40', 'savename', '保存名称', 'char(20) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('41', 'savepath', '文件保存路径', 'char(30) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('42', 'ext', '文件后缀', 'char(5) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('43', 'mime', '文件mime类型', 'char(40) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('44', 'size', '文件大小', 'int(10) unsigned NOT NULL ', 'string', '0', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('45', 'md5', '文件md5', 'char(32) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('46', 'sha1', '文件 sha1编码', 'char(40) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('47', 'location', '文件保存位置', 'tinyint(3) unsigned NOT NULL ', 'string', '0', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('48', 'create_time', '上传时间', 'int(10) unsigned NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1391133228', '1391133228', '', '0', '', '', '', '0', '');

-- ----------------------------
-- Table structure for onethink_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of onethink_auth_extend
-- ----------------------------
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '37', '1');

-- ----------------------------
-- Table structure for onethink_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_group
-- ----------------------------
INSERT INTO `onethink_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `onethink_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- ----------------------------
-- Table structure for onethink_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_group_access
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`module`,`name`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_auth_rule
-- ----------------------------
INSERT INTO `onethink_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('6', 'admin', '1', 'Admin/Index/index', '首页', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');

-- ----------------------------
-- Table structure for onethink_category
-- ----------------------------
DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of onethink_category
-- ----------------------------
INSERT INTO `onethink_category` VALUES ('1', 'blog', '默认分类', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1391043811', '1', '0');
INSERT INTO `onethink_category` VALUES ('2', 'default_blog', '博客', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1391043816', '1', '31');

-- ----------------------------
-- Table structure for onethink_channel
-- ----------------------------
DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_channel
-- ----------------------------
INSERT INTO `onethink_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `onethink_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `onethink_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for onethink_comment
-- ----------------------------
DROP TABLE IF EXISTS `onethink_comment`;
CREATE TABLE `onethink_comment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `model_id` int(11) unsigned NOT NULL DEFAULT '0',
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  `digg` int(11) unsigned NOT NULL DEFAULT '0',
  `com_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '评论IP',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(10) unsigned DEFAULT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `uemail` varchar(200) DEFAULT NULL,
  `uurl` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `model_id` (`model_id`),
  KEY `cid` (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_comment
-- ----------------------------
INSERT INTO `onethink_comment` VALUES ('1', '0', '2', '2', 'qweqwe', '1', '2130706433', '1391604570', '1', null, '123', '917647288@qq.com', '');

-- ----------------------------
-- Table structure for onethink_config
-- ----------------------------
DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` longtext NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_config
-- ----------------------------
INSERT INTO `onethink_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '1');
INSERT INTO `onethink_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '2');
INSERT INTO `onethink_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '3');
INSERT INTO `onethink_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '5');
INSERT INTO `onethink_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '10');
INSERT INTO `onethink_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '10');
INSERT INTO `onethink_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '6');
INSERT INTO `onethink_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '7');
INSERT INTO `onethink_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰\r\ntypecho_color:仿typecho', '后台颜色风格', '1379122533', '1390719847', '1', 'typecho_color', '10');
INSERT INTO `onethink_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:评论\r\n3:阅读\r\n4:站点框架\r\n5:个人设置', '8');
INSERT INTO `onethink_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '9');
INSERT INTO `onethink_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '5');
INSERT INTO `onethink_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '7');
INSERT INTO `onethink_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '5', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1392017874', '1', '60', '10');
INSERT INTO `onethink_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '5', '', '后台数据每页显示记录数', '1379503896', '1392017862', '1', '10', '10');
INSERT INTO `onethink_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '4');
INSERT INTO `onethink_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '1', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1390906341', '1', 'ambiance', '6');
INSERT INTO `onethink_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `onethink_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '4');
INSERT INTO `onethink_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '8');
INSERT INTO `onethink_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `onethink_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `onethink_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '9');
INSERT INTO `onethink_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '4');
INSERT INTO `onethink_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '10');
INSERT INTO `onethink_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `onethink_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1390274668', '1', '1', '10');
INSERT INTO `onethink_config` VALUES ('38', 'VERIFY', '4', '开启验证码', '1', '0:关闭,1:开启', '', '1390611680', '1391997526', '1', '0', '5');
INSERT INTO `onethink_config` VALUES ('41', 'FRONT_THEME', '1', '前台主题', '0', '', '前台主题配置，覆盖系统文件', '1392108077', '1392108077', '1', 'default', '0');
INSERT INTO `onethink_config` VALUES ('40', 'FEEDFULLTEXT', '4', '聚合全文输出', '3', '0:仅输出摘要,1:全文输出', '如果你不希望在聚合中输出文章全文,请使用仅输出摘要选项.\r\n摘要的文字来自description字段，此字段无内容就截取前200个字符.', '1391997436', '1391997436', '1', '1', '0');

-- ----------------------------
-- Table structure for onethink_contents
-- ----------------------------
DROP TABLE IF EXISTS `onethink_contents`;
CREATE TABLE `onethink_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `text` text,
  `order` int(10) unsigned DEFAULT '0',
  `authorId` int(10) unsigned DEFAULT '0',
  `template` varchar(32) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `password` varchar(32) DEFAULT NULL,
  `commentsNum` int(10) unsigned DEFAULT '0',
  `allowComment` char(1) DEFAULT '0',
  `allowPing` char(1) DEFAULT '0',
  `allowFeed` char(1) DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  `cid` int(10) unsigned DEFAULT '0' COMMENT '分类id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_contents
-- ----------------------------
INSERT INTO `onethink_contents` VALUES ('1', '欢迎使用 Typecho', 'start', '1390574404', '1390574404', '<!--markdown-->如果您看到这篇文章,表示您的 blog 已经安装成功.', '0', '1', null, 'post', 'publish', null, '1', '1', '1', '1', '0', '0');
INSERT INTO `onethink_contents` VALUES ('2', '关于', 'start-page', '1390574404', '1390574404', '<!--markdown-->本页面由 Typecho 创建, 这只是个测试页面.', '0', '1', null, 'page', 'publish', null, '0', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for onethink_document
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document`;
CREATE TABLE `onethink_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`type`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of onethink_document
-- ----------------------------
INSERT INTO `onethink_document` VALUES ('1', '1', '', 'OneThink1.0正式版发布', '2', '大家期待的OneThink正式版发布', '0', '0', '2', '1', '0', '0', '1', '1', '0', '0', '31', '0', '0', '0', '1387260660', '1390638860', '1');
INSERT INTO `onethink_document` VALUES ('2', '1', 'test_category', '测试分类', '1', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '33', '0', '0', '0', '1391043840', '1391758366', '1');
INSERT INTO `onethink_document` VALUES ('3', '1', '', '123123', '1', '', '0', '0', '2', '1', '0', '0', '0', '1', '0', '0', '4', '0', '0', '0', '1391045400', '1392009535', '1');

-- ----------------------------
-- Table structure for onethink_document_article
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `tags` text NOT NULL COMMENT '标签',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of onethink_document_article
-- ----------------------------
INSERT INTO `onethink_document_article` VALUES ('1', '0', '<img src=\"/Uploads/Editor/2014-01-24/52e1d78da828b.jpg\" alt=\"\" />\r\n<h1>\r\n	OneThink1.0正式版发布 \r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。 </strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。 \r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。 \r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。 \r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。 \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong> OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。 </strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统 \r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统 \r\n</p>\r\n<p>\r\n	5. 多级分类系统 \r\n</p>\r\n<p>\r\n	6. 用户行为系统 \r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统 \r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	 [ 官方下载： <a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>  开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a> ] \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0', '');
INSERT INTO `onethink_document_article` VALUES ('2', '2', '# 测试分类', '', '0', '');
INSERT INTO `onethink_document_article` VALUES ('3', '2', '# 测试分类', '', '0', '测试分类,今天');

-- ----------------------------
-- Table structure for onethink_document_download
-- ----------------------------
DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of onethink_document_download
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_fields
-- ----------------------------
DROP TABLE IF EXISTS `onethink_fields`;
CREATE TABLE `onethink_fields` (
  `cid` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL,
  `type` varchar(8) DEFAULT 'str',
  `str_value` text,
  `int_value` int(10) DEFAULT '0',
  `float_value` float DEFAULT '0',
  PRIMARY KEY (`cid`,`name`),
  KEY `int_value` (`int_value`),
  KEY `float_value` (`float_value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_fields
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_file
-- ----------------------------
DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of onethink_file
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_hooks
-- ----------------------------
DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `搜索索引` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_hooks
-- ----------------------------
INSERT INTO `onethink_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `onethink_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,Comment,SocialComment');
INSERT INTO `onethink_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment,Ping');
INSERT INTO `onethink_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `onethink_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,QiuBai,DevTeam');
INSERT INTO `onethink_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', '');
INSERT INTO `onethink_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');
INSERT INTO `onethink_hooks` VALUES ('17', 'sidebar', '前台首页侧边栏', '1', '1391602065', 'Comment');

-- ----------------------------
-- Table structure for onethink_member
-- ----------------------------
DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of onethink_member
-- ----------------------------
INSERT INTO `onethink_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '70', '30', '0', '1390274619', '2130706433', '1392088837', '1');

-- ----------------------------
-- Table structure for onethink_menu
-- ----------------------------
DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_menu
-- ----------------------------
INSERT INTO `onethink_menu` VALUES ('1', '控制台', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('3', '文档列表', '2', '0', 'Article/index', '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('13', '回收站', '128', '0', 'Article/recycle', '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('16', '用户', '0', '6', 'User/index', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('17', '用户', '128', '6', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `onethink_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `onethink_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `onethink_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `onethink_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `onethink_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `onethink_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `onethink_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `onethink_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('44', '插件', '1', '2', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `onethink_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `onethink_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `onethink_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `onethink_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `onethink_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `onethink_menu` VALUES ('57', '钩子', '1', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `onethink_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '1');
INSERT INTO `onethink_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `onethink_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('68', '系统', '0', '7', 'Config/group', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '1');
INSERT INTO `onethink_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '1');
INSERT INTO `onethink_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('80', '分类', '128', '7', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `onethink_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `onethink_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('93', '其他', '0', '8', 'other', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('122', '概要', '1', '0', 'Index/Index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('123', '个人设置', '1', '1', 'Config/group?id=5', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('124', '外观', '1', '3', 'Theme/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('125', '撰写', '0', '2', 'Article/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('126', '撰写文章', '125', '0', 'Article/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('127', '创建页面', '125', '0', 'Article/add?type=2', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('128', '管理', '0', '3', 'Article/index?type=1', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('129', '文章', '128', '0', 'Article/index?type=1', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('134', '配置', '0', '4', 'Config/group?id=1', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('130', '独立页面', '128', '0', 'Article/index?type=2', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('131', '评论', '128', '0', 'Addons/adminList?name=Comment', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('132', '标签', '128', '0', 'Think/lists?model=tags', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('133', '文件', '128', '0', 'Think/lists?model=file', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('135', '基本', '134', '0', 'Config/group?id=1', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('136', '评论', '134', '0', 'Config/group?id=2', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('137', '阅读', '134', '0', 'Config/group?id=3', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('138', '永久链接', '134', '0', 'Config/group?id=4', '0', '', '', '0');

-- ----------------------------
-- Table structure for onethink_model
-- ----------------------------
DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of onethink_model
-- ----------------------------
INSERT INTO `onethink_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"2\",\"3\",\"5\",\"9\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\ncategory_id|get_category_title:分类\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', '0', '', '', '1383891233', '1391163759', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"2\",\"24\",\"5\",\"9\"],\"2\":[\"20\",\"13\",\"19\",\"10\",\"12\",\"14\",\"11\",\"25\"],\"3\":[\"17\",\"26\",\"16\"]}', '1:基础,2:选项,3:统计', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', '0', '', '', '1383891243', '1390968122', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('4', 'tags', 'tags', '0', '', '1', '{\"1\":[\"34\",\"35\",\"36\",\"37\",\"38\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题\r\nname:缩略名\r\ndescription:描述\r\ncount:文章数量\r\norder:优先级\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', '', '', '1391049096', '1391049440', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('5', 'file', 'file', '0', '', '1', '{\"1\":[\"39\",\"40\",\"41\",\"42\",\"43\",\"44\",\"45\",\"46\",\"47\",\"48\"]}', '1:基础', '', '', '', '', 'id:编号\r\nsavepath:保存路径\r\nsavename:保存文件名\r\next:文件后缀\r\nmime:MIME\r\nsize:大小\r\nmd5:MD5\r\nsha1:SHA1\r\nlocation:保存位置\r\ncreate_time:上传时间', '10', '', '', '1391133228', '1391135686', '1', 'MyISAM');

-- ----------------------------
-- Table structure for onethink_picture
-- ----------------------------
DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_picture
-- ----------------------------
INSERT INTO `onethink_picture` VALUES ('1', '/Uploads/Picture/2014-01-24/52e1c8bae4dc2.jpg', '', '2fa4364f4b35b84275497ddbc10d269d', '29f6857891f76cbc6528d4549efa2c6b33a0c002', '1', '1390528698');

-- ----------------------------
-- Table structure for onethink_relationships
-- ----------------------------
DROP TABLE IF EXISTS `onethink_relationships`;
CREATE TABLE `onethink_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Records of onethink_relationships
-- ----------------------------
INSERT INTO `onethink_relationships` VALUES ('1', '1');

-- ----------------------------
-- Table structure for onethink_tags
-- ----------------------------
DROP TABLE IF EXISTS `onethink_tags`;
CREATE TABLE `onethink_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `name` varchar(200) DEFAULT NULL COMMENT '缩略名',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `count` int(10) unsigned DEFAULT '0' COMMENT '数量',
  `order` int(10) unsigned DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `slug` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of onethink_tags
-- ----------------------------
INSERT INTO `onethink_tags` VALUES ('1', '默认分类', 'default', '只是一个默认分类', '1', '1');
INSERT INTO `onethink_tags` VALUES ('3', '', null, null, '1', '0');
INSERT INTO `onethink_tags` VALUES ('4', '', null, null, '1', '0');
INSERT INTO `onethink_tags` VALUES ('5', '', null, null, '1', '0');
INSERT INTO `onethink_tags` VALUES ('6', '', null, null, '1', '0');

-- ----------------------------
-- Table structure for onethink_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_admin`;
CREATE TABLE `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of onethink_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_app`;
CREATE TABLE `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of onethink_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_member`;
CREATE TABLE `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of onethink_ucenter_member
-- ----------------------------
INSERT INTO `onethink_ucenter_member` VALUES ('1', 'admin', '11c42a8f082258c9be1b5f7e3ce97a11', '917647288@qq.com', '', '1390274619', '0', '1392088837', '2130706433', '1390274619', '1');

-- ----------------------------
-- Table structure for onethink_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_setting`;
CREATE TABLE `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of onethink_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_url
-- ----------------------------
DROP TABLE IF EXISTS `onethink_url`;
CREATE TABLE `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of onethink_url
-- ----------------------------

-- ----------------------------
-- Table structure for onethink_userdata
-- ----------------------------
DROP TABLE IF EXISTS `onethink_userdata`;
CREATE TABLE `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onethink_userdata
-- ----------------------------