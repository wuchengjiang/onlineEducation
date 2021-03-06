/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 50634
 Source Host           : 192.168.1.102:3306
 Source Schema         : onlineeducation

 Target Server Type    : MySQL
 Target Server Version : 50634
 File Encoding         : 65001

 Date: 24/06/2018 09:16:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (5, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (8, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (9, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can add 用户信息', 6, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (17, 'Can change 用户信息', 6, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 用户信息', 6, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (19, 'Can add 轮播图', 7, 'add_banner');
INSERT INTO `auth_permission` VALUES (20, 'Can change 轮播图', 7, 'change_banner');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 轮播图', 7, 'delete_banner');
INSERT INTO `auth_permission` VALUES (22, 'Can add 邮箱验证码', 8, 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (23, 'Can change 邮箱验证码', 8, 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 邮箱验证码', 8, 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (25, 'Can add 课程资源', 9, 'add_courseresource');
INSERT INTO `auth_permission` VALUES (26, 'Can change 课程资源', 9, 'change_courseresource');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 课程资源', 9, 'delete_courseresource');
INSERT INTO `auth_permission` VALUES (28, 'Can add 章节', 10, 'add_lesson');
INSERT INTO `auth_permission` VALUES (29, 'Can change 章节', 10, 'change_lesson');
INSERT INTO `auth_permission` VALUES (30, 'Can delete 章节', 10, 'delete_lesson');
INSERT INTO `auth_permission` VALUES (31, 'Can add 课程', 11, 'add_course');
INSERT INTO `auth_permission` VALUES (32, 'Can change 课程', 11, 'change_course');
INSERT INTO `auth_permission` VALUES (33, 'Can delete 课程', 11, 'delete_course');
INSERT INTO `auth_permission` VALUES (34, 'Can add 城市', 12, 'add_citydict');
INSERT INTO `auth_permission` VALUES (35, 'Can change 城市', 12, 'change_citydict');
INSERT INTO `auth_permission` VALUES (36, 'Can delete 城市', 12, 'delete_citydict');
INSERT INTO `auth_permission` VALUES (37, 'Can add 教师', 13, 'add_teacher');
INSERT INTO `auth_permission` VALUES (38, 'Can change 教师', 13, 'change_teacher');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 教师', 13, 'delete_teacher');
INSERT INTO `auth_permission` VALUES (40, 'Can add 课程机构', 14, 'add_courseorg');
INSERT INTO `auth_permission` VALUES (41, 'Can change 课程机构', 14, 'change_courseorg');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 课程机构', 14, 'delete_courseorg');
INSERT INTO `auth_permission` VALUES (43, 'Can add 用户咨询', 15, 'add_userask');
INSERT INTO `auth_permission` VALUES (44, 'Can change 用户咨询', 15, 'change_userask');
INSERT INTO `auth_permission` VALUES (45, 'Can delete 用户咨询', 15, 'delete_userask');
INSERT INTO `auth_permission` VALUES (46, 'Can add 用户收藏', 16, 'add_userfavorite');
INSERT INTO `auth_permission` VALUES (47, 'Can change 用户收藏', 16, 'change_userfavorite');
INSERT INTO `auth_permission` VALUES (48, 'Can delete 用户收藏', 16, 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES (49, 'Can add 课程评论', 17, 'add_coursecomments');
INSERT INTO `auth_permission` VALUES (50, 'Can change 课程评论', 17, 'change_coursecomments');
INSERT INTO `auth_permission` VALUES (51, 'Can delete 课程评论', 17, 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES (52, 'Can add 用户课程', 18, 'add_usercourse');
INSERT INTO `auth_permission` VALUES (53, 'Can change 用户课程', 18, 'change_usercourse');
INSERT INTO `auth_permission` VALUES (54, 'Can delete 用户课程', 18, 'delete_usercourse');
INSERT INTO `auth_permission` VALUES (55, 'Can add 用户消息', 19, 'add_usermessage');
INSERT INTO `auth_permission` VALUES (56, 'Can change 用户消息', 19, 'change_usermessage');
INSERT INTO `auth_permission` VALUES (57, 'Can delete 用户消息', 19, 'delete_usermessage');
INSERT INTO `auth_permission` VALUES (58, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (59, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (60, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (61, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (62, 'Can view 课程', 11, 'view_course');
INSERT INTO `auth_permission` VALUES (63, 'Can view 课程资源', 9, 'view_courseresource');
INSERT INTO `auth_permission` VALUES (64, 'Can view 章节', 10, 'view_lesson');
INSERT INTO `auth_permission` VALUES (65, 'Can view 课程评论', 17, 'view_coursecomments');
INSERT INTO `auth_permission` VALUES (66, 'Can view 用户咨询', 15, 'view_userask');
INSERT INTO `auth_permission` VALUES (67, 'Can view 用户课程', 18, 'view_usercourse');
INSERT INTO `auth_permission` VALUES (68, 'Can view 用户收藏', 16, 'view_userfavorite');
INSERT INTO `auth_permission` VALUES (69, 'Can view 用户消息', 19, 'view_usermessage');
INSERT INTO `auth_permission` VALUES (70, 'Can view 城市', 12, 'view_citydict');
INSERT INTO `auth_permission` VALUES (71, 'Can view 课程机构', 14, 'view_courseorg');
INSERT INTO `auth_permission` VALUES (72, 'Can view 教师', 13, 'view_teacher');
INSERT INTO `auth_permission` VALUES (73, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (74, 'Can view 轮播图', 7, 'view_banner');
INSERT INTO `auth_permission` VALUES (75, 'Can view 邮箱验证码', 8, 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES (76, 'Can view 用户信息', 6, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (77, 'Can add Bookmark', 20, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (78, 'Can change Bookmark', 20, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (79, 'Can delete Bookmark', 20, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (80, 'Can add User Setting', 21, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (81, 'Can change User Setting', 21, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (82, 'Can delete User Setting', 21, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (83, 'Can add User Widget', 22, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (84, 'Can change User Widget', 22, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (85, 'Can delete User Widget', 22, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (86, 'Can add log entry', 23, 'add_log');
INSERT INTO `auth_permission` VALUES (87, 'Can change log entry', 23, 'change_log');
INSERT INTO `auth_permission` VALUES (88, 'Can delete log entry', 23, 'delete_log');
INSERT INTO `auth_permission` VALUES (89, 'Can view Bookmark', 20, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (90, 'Can view log entry', 23, 'view_log');
INSERT INTO `auth_permission` VALUES (91, 'Can view User Setting', 21, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (92, 'Can view User Widget', 22, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (93, 'Can add 视频', 24, 'add_video');
INSERT INTO `auth_permission` VALUES (94, 'Can change 视频', 24, 'change_video');
INSERT INTO `auth_permission` VALUES (95, 'Can delete 视频', 24, 'delete_video');
INSERT INTO `auth_permission` VALUES (96, 'Can view 视频', 24, 'view_video');
INSERT INTO `auth_permission` VALUES (97, 'Can add captcha store', 25, 'add_captchastore');
INSERT INTO `auth_permission` VALUES (98, 'Can change captcha store', 25, 'change_captchastore');
INSERT INTO `auth_permission` VALUES (99, 'Can delete captcha store', 25, 'delete_captchastore');
INSERT INTO `auth_permission` VALUES (100, 'Can view captcha store', 25, 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `response` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hashkey` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `hashkey`(`hashkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES (10, 'VGTO', 'vgto', 'b94b651dd696024f4f44a8a1927dd73291c963d9', '2018-06-23 16:33:33.081213');
INSERT INTO `captcha_captchastore` VALUES (11, 'IEDP', 'iedp', '70dbb9a5ccd457bafc43bb85f757db6bf44d3b79', '2018-06-23 16:35:41.750560');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `degree` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tell` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `youneed_know` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_course_course_org_id_4d2c4aab_fk_organizat`(`course_org_id`) USING BTREE,
  INDEX `courses_course_teacher_id_846fa526_fk_organizations_teacher_id`(`teacher_id`) USING BTREE,
  CONSTRAINT `courses_course_course_org_id_4d2c4aab_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organizations_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organizations_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organizations_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES (1, 'blackpink', 'BLACKPINK是YG Entertainment于2016年8月8日推出的女子演唱组合，由金智秀（JISOO）、金智妮（JENNIE）、朴彩英（Rosé）、LISA 4名成员组成。BLACKPINK这个组合名在看起来很美的粉色中稍微加入了否定的意义，旨在传达出“不要只看漂亮的部分”、“看到的并不是全部”的意思 [1]  。\r\n2016年8月8日，发行首张单曲专辑《SQUARE ONE》并正式出道，单曲专辑在印尼、马来西亚、等十四个国家的iTunes的专辑榜夺得冠军，《WHISTLE》在八个音乐网站周排行榜冠军，是首个以出道曲创下这纪录的女团', 'xxxxxxxxxxxxxxxxxxxxx', 'zj', 13, 13, 31, 'courses/2018/06/bjdx_cCpdUw8.jpg', 0, '2018-06-15 15:26:00.000000', '流行', '', 1, NULL, '', '');
INSERT INTO `courses_course` VALUES (2, 'G-Dragon', 'G-DRAGON（权志龙、권지용），1988年8月18日出生于韩国首尔，韩国男歌手，男子演唱组合BIGBANG队长，所属经纪公司YG Entertainment词曲制作人', 'java开发', 'zj', 111, 179, 113, 'courses/2018/06/57a801860001c34b12000460_xowDuhR.png', 12, '2018-06-16 08:32:00.000000', '流行', 'java', 2, 1, '全栈开发,所向披露', 'python基础你必须要会哦!!!!!');
INSERT INTO `courses_course` VALUES (3, 'EXO', 'EXO，是韩国SM娱乐有限公司于2012年4月8日正式推出的12人男子流行演唱团体，现以金珉锡（XIUMIN）、金俊勉（SUHO）、张艺兴（LAY）、边伯贤（BAEKHYUN）、金钟大（CHEN）、朴灿烈（CHANYEOL）、都暻秀（D.O.）、金钟仁（KAI）、吴世勋（SEHUN）9名成员的形式展开活动。', 'Python开发', 'gj', 12, 122, 1212, 'courses/2018/06/imooc_Gn1sRjp.png', 12, '2018-06-16 08:32:00.000000', '流行', '', 4, NULL, '', '');
INSERT INTO `courses_course` VALUES (4, 'Bewhy', 'BewhY（비와이），韩国HipHop歌手、MC。出生于1993年6月15日,仁川广域市。2014年发行出道单曲《Waltz》，随后7月，发行第二首单曲《Swimming Bananas》。2015年推出个人首张solo专辑《Time Travel》。2016年参加Show Me The Money第5季，获得最终胜利。 [1-3] ', '大后天你这人也没人要慢慢', 'zj', 12, 12, 12, 'courses/2018/06/bjdx_cCpdUw8_762aLjX.jpg', 12, '2018-06-16 08:47:00.000000', '流行', '', 1, NULL, '', '');
INSERT INTO `courses_course` VALUES (5, '周杰伦', '周杰伦出生于台湾省新北市，祖籍福建省永春县 [24]  。周杰伦4岁的\r\n周杰伦小时候\r\n周杰伦小时候(17张)\r\n 时候，母亲叶惠美把他送到淡江山叶幼儿音乐班学习钢琴 [25]  。周杰伦读初中二年级时，他的父母因性格不合离婚，而周杰伦则归母亲叶惠美抚养 [26]  。中考时，周杰伦没有考上普通高中；同年，他因为擅长钢琴而被淡江中学第一届音乐班录取。高中毕业以后，他两次报考台北大学音乐系均没有被录取，于是他开始在一家餐馆打工 [25]  。', 'django课程', 'gj', 121, 121, 121, 'courses/2018/06/qhdx-logo.png', 12, '2018-06-16 17:41:00.000000', '山歌', 'java', 1, NULL, '', '');
INSERT INTO `courses_course` VALUES (6, '薛之谦', '薛之谦4岁的时候，薛妈妈因为风湿性心脏病去世，薛之谦由爸爸带大。高中毕业的时候，爸爸为了筹钱支持薛之谦去瑞士留学把房子卖了，用卖房所得的60万送他到瑞士留学，学习酒店管理。放假回家的薛之谦在商场门口被经纪公司的星探看中，他们百般动员他留下当艺人，答应给他签约、出唱片。可等到薛之谦决定暂停瑞士的学业留下以后，经纪公司又要他出30万的包装费用。薛之谦灰心之余，又遇上了真人版《我为歌狂》剧组在招聘演员，他很幸运地获得了其中一个角色，可遗憾的是最终由于版权问题，这部戏没有成功开拍', 'demo1', 'zj', 12, 13, 12, 'courses/2018/06/qhdx-logo_TLwBVJS.png', 11, '2018-06-16 17:42:00.000000', '山歌', '', 3, NULL, '', '');
INSERT INTO `courses_course` VALUES (7, '蔡依林', '蔡依林本名蔡宜凌，祖籍福建省泉州市 [33]  ，1980年9月15日出生于中国台湾台北县新庄市（现新北市新庄区），在家中排行老二，有一个姐姐，父亲蔡柱陈从事过会计工作；母亲黄春美为人低调，鲜少在媒体面前出现，在台北医院担任志工有十年时间 [34]  。蔡依林毕业于景美女中、并以保送方式进入辅仁大学英文系就读，与F.I.R乐队女主唱Faye为同班同学。', 'java++++', 'cj', 11, 35, 44, 'courses/2018/06/imooc_Y2Tonsq.png', 44, '2018-06-16 17:42:00.000000', '山歌', 'java', 2, NULL, '', '');
INSERT INTO `courses_course` VALUES (8, '金泫雅', '1992年6月6日，金泫雅出生于韩国首尔市，中学时曾读于Choong Chun Middle School及Korea High School of Music and Arts（韩国音乐艺术学院），毕业于韩国建国大学电影系，主修艺术文化。', 'js', 'cj', 121, 121, 121, 'courses/2018/06/qhdx-logo_T7wmmyR.png', 1, '2018-06-16 17:43:00.000000', '性感', 'java', 3, NULL, '', '');
INSERT INTO `courses_course` VALUES (9, '林俊杰', '1981年3月27日，林俊杰出生于新加坡的一个音乐世家。在父母的引导下，4岁就开始学习古典钢琴，不善言辞的他由此发现了另一种与人沟通的语言。小时候的林俊杰把哥哥当作偶像，跟随哥哥的步伐做任何事，直到接触流行音乐后，便爱上创作这一条路。', '3131', 'zj', 13, 131, 33, 'courses/2018/06/bjdx.jpg', 13, '2018-06-16 17:43:00.000000', '山歌', 'java', 4, NULL, '', '');
INSERT INTO `courses_course` VALUES (10, '王力宏', '1982年，王力宏开始学习小提琴，并坚持每天练琴6小时 [22]  。1984\r\n王力宏\r\n王力宏(3张)\r\n 年，他开始学习钢琴。1988年6月，从Pittsford Elementary School毕业；9月，进入Pittsford Sutherland Middle School就读', '1414141', 'cj', 14, 17, 41, 'courses/2018/06/qhdx-logo_MG2ahnm.png', 14, '2018-06-16 17:43:00.000000', '山歌', '', 5, NULL, '', '');
INSERT INTO `courses_course` VALUES (11, '2NE1', '2NE1四位成员在YG公司的平均练习时间是3.5年，\r\n而总和则达到了14年。孔敏芝是韩国舞蹈家孔玉珍的侄孙女，她从小学就进入了YG公司，经历了5年的练习生活。朴春则是于2002年与梁贤锡社长见面，经历了屡次面试，终于在2005年进入了YG公司。如果把前前后后的时间都涵盖，朴春的历练时间就是最漫长的。Sandra从菲律宾回到韩国后练习了两年时间，CL [11]  大约是三年。朴春和Sandra在出道时都已经到了25岁', '1111111111111111111111111111111111111111111111111111', 'gj', 12, 21, 32, 'courses/2018/06/4.jpeg', 12, '2018-06-21 09:16:00.000000', '流行', '121', 2, 1, '全栈开发,所向披露', 'python基础你必须要会哦!!!!!');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `download` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_courseresource_course_id_5eba1332_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES (1, 'Donnie', 'course/resource/2018/06/57a801860001c34b12000460_Q027qUt.png', '2018-06-20 11:39:00.000000', 2);
INSERT INTO `courses_courseresource` VALUES (2, 'general user', 'course/resource/2018/06/4.jpeg', '2018-06-20 11:39:00.000000', 2);
INSERT INTO `courses_courseresource` VALUES (3, 'Donnie', 'course/resource/2018/06/4_Ywg2E9E.jpeg', '2018-06-20 18:08:00.000000', 2);

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_lesson_course_id_16bc4882_fk_courses_course_id`(`course_id`) USING BTREE,
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES (1, '第一章 你妹', '2018-06-20 11:38:00.000000', 2);
INSERT INTO `courses_lesson` VALUES (2, '第二章 你大爷', '2018-06-20 11:38:00.000000', 2);
INSERT INTO `courses_lesson` VALUES (3, '第三章   可以的', '2018-06-20 11:38:00.000000', 2);

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `learn_times` int(11) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `courses_video_lesson_id_59f2396e_fk_courses_lesson_id`(`lesson_id`) USING BTREE,
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES (1, 'Donnie', '2018-06-20 11:38:00.000000', 'http://papkfdfye.bkt.clouddn.com/%E5%BD%95%E5%88%B6_2018_06_19_14_14_57_676.mp4', 12, 1);
INSERT INTO `courses_video` VALUES (2, 'Donnie', '2018-06-20 11:38:00.000000', 'http://papkfdfye.bkt.clouddn.com/%E5%BD%95%E5%88%B6_2018_06_19_14_14_57_676.mp4', 10, 1);
INSERT INTO `courses_video` VALUES (3, 'general user', '2018-06-20 11:38:00.000000', 'http://papkfdfye.bkt.clouddn.com/%E5%BD%95%E5%88%B6_2018_06_19_14_14_57_676.mp4', 12, 2);
INSERT INTO `courses_video` VALUES (4, '招投标项目开发', '2018-06-20 11:38:00.000000', 'http://www.360doc.com/content/13/0615/08/11675837_292965677.shtml', 12, 3);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (25, 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (11, 'courses', 'course');
INSERT INTO `django_content_type` VALUES (9, 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES (10, 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES (24, 'courses', 'video');
INSERT INTO `django_content_type` VALUES (17, 'operations', 'coursecomments');
INSERT INTO `django_content_type` VALUES (15, 'operations', 'userask');
INSERT INTO `django_content_type` VALUES (18, 'operations', 'usercourse');
INSERT INTO `django_content_type` VALUES (16, 'operations', 'userfavorite');
INSERT INTO `django_content_type` VALUES (19, 'operations', 'usermessage');
INSERT INTO `django_content_type` VALUES (12, 'organizations', 'citydict');
INSERT INTO `django_content_type` VALUES (14, 'organizations', 'courseorg');
INSERT INTO `django_content_type` VALUES (13, 'organizations', 'teacher');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'users', 'banner');
INSERT INTO `django_content_type` VALUES (8, 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES (6, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (20, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (23, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (21, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (22, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-06-14 00:32:25.328404');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-06-14 00:32:25.406659');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-06-14 00:32:25.687851');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-06-14 00:32:25.750180');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-06-14 00:32:25.750180');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-06-14 00:32:25.765801');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-06-14 00:32:25.765801');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-06-14 00:32:25.781423');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-06-14 00:32:25.781423');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-06-14 00:32:25.797076');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-06-14 00:32:25.797076');
INSERT INTO `django_migrations` VALUES (12, 'users', '0001_initial', '2018-06-14 00:32:26.312837');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2018-06-14 00:32:26.453428');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2018-06-14 00:32:26.453428');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2018-06-14 00:32:26.500292');
INSERT INTO `django_migrations` VALUES (16, 'users', '0002_banner_emailverifyrecord', '2018-06-14 00:47:33.037416');
INSERT INTO `django_migrations` VALUES (19, 'organizations', '0001_initial', '2018-06-14 00:58:36.191501');
INSERT INTO `django_migrations` VALUES (20, 'xadmin', '0001_initial', '2018-06-14 02:35:20.309772');
INSERT INTO `django_migrations` VALUES (21, 'xadmin', '0002_log', '2018-06-14 02:35:20.440439');
INSERT INTO `django_migrations` VALUES (22, 'xadmin', '0003_auto_20160715_0100', '2018-06-14 02:35:20.523255');
INSERT INTO `django_migrations` VALUES (23, 'captcha', '0001_initial', '2018-06-14 17:56:47.567533');
INSERT INTO `django_migrations` VALUES (25, 'organizations', '0002_auto_20180615_1001', '2018-06-15 10:01:29.575512');
INSERT INTO `django_migrations` VALUES (26, 'organizations', '0003_auto_20180615_1245', '2018-06-15 12:45:36.616897');
INSERT INTO `django_migrations` VALUES (28, 'organizations', '0004_teacher_image', '2018-06-16 09:05:54.208705');
INSERT INTO `django_migrations` VALUES (35, 'courses', '0001_initial', '2018-06-20 11:33:39.935391');
INSERT INTO `django_migrations` VALUES (36, 'operations', '0001_initial', '2018-06-20 12:05:42.600369');
INSERT INTO `django_migrations` VALUES (37, 'courses', '0002_auto_20180620_1434', '2018-06-20 14:35:00.764313');
INSERT INTO `django_migrations` VALUES (38, 'users', '0003_auto_20180621_1236', '2018-06-21 12:36:39.129773');
INSERT INTO `django_migrations` VALUES (39, 'users', '0004_auto_20180621_1303', '2018-06-21 13:03:48.125714');
INSERT INTO `django_migrations` VALUES (40, 'users', '0005_auto_20180622_0734', '2018-06-22 07:34:32.261021');
INSERT INTO `django_migrations` VALUES (41, 'users', '0006_auto_20180622_0810', '2018-06-22 08:10:12.674970');
INSERT INTO `django_migrations` VALUES (42, 'users', '0007_auto_20180622_0811', '2018-06-22 08:12:07.641612');
INSERT INTO `django_migrations` VALUES (43, 'courses', '0003_auto_20180622_1600', '2018-06-22 16:00:18.114359');
INSERT INTO `django_migrations` VALUES (44, 'organizations', '0005_auto_20180622_1600', '2018-06-22 16:00:18.219080');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('93y0c46mpy2a79bzphmt9rwtf3lv144w', 'N2M2MTMzMGU3MDM4OGE5ODIyMmY1MjVlMjFmOTZjYWMyZDgxNjg3ODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY2M2Y3MTI4Y2ViNDhlOWRiZTQ3YzlhM2MzZjBiYTM3YmFiMDBjMzgiLCJuYXZfbWVudSI6Ilt7XCJ0aXRsZVwiOiBcIlx1NjczYVx1Njc4NFwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NTdjZVx1NWUwMlwiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9ucy9jaXR5ZGljdC9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTF9LCB7XCJ0aXRsZVwiOiBcIlx1NTczMFx1NTMzYVwiLCBcInVybFwiOiBcIi94YWRtaW4vb3JnYW5pemF0aW9ucy9jb3Vyc2VvcmcvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDEyfSwge1widGl0bGVcIjogXCJcdTUxNmNcdTUzZjhcIiwgXCJ1cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbnMvdGVhY2hlci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTN9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL29yZ2FuaXphdGlvbnMvY2l0eWRpY3QvXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1wiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NGZlMVx1NjA2ZlwiLCBcInVybFwiOiBcIi94YWRtaW4vdXNlcnMvdXNlcnByb2ZpbGUvXCIsIFwiaWNvblwiOiBcImZhIGZhLXVzZXJcIiwgXCJvcmRlclwiOiAzfSwge1widGl0bGVcIjogXCJcdTkwYWVcdTdiYjFcdTlhOGNcdThiYzFcdTc4MDFcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2VtYWlsdmVyaWZ5cmVjb3JkL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA1fSwge1widGl0bGVcIjogXCJcdThmNmVcdTY0YWRcdTU2ZmVcIiwgXCJ1cmxcIjogXCIveGFkbWluL3VzZXJzL2Jhbm5lci9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogNn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS11c2VyXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi91c2Vycy91c2VycHJvZmlsZS9cIn0sIHtcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NGNkXHU0ZjVjXCIsIFwibWVudXNcIjogW3tcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU1NGE4XHU4YmUyXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb25zL3VzZXJhc2svXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE0fSwge1widGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdThiZmVcdTdhMGJcIiwgXCJ1cmxcIjogXCIveGFkbWluL29wZXJhdGlvbnMvdXNlcmNvdXJzZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTV9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NmQ4OFx1NjA2ZlwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9ucy91c2VybWVzc2FnZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTZ9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGJjNFx1OGJiYVwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9ucy9jb3Vyc2Vjb21tZW50cy9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTd9LCB7XCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1NjUzNlx1ODVjZlwiLCBcInVybFwiOiBcIi94YWRtaW4vb3BlcmF0aW9ucy91c2VyZmF2b3JpdGUvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDE4fV0sIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9vcGVyYXRpb25zL3VzZXJhc2svXCJ9LCB7XCJ0aXRsZVwiOiBcIlx1N2JhMVx1NzQwNlwiLCBcIm1lbnVzXCI6IFt7XCJ0aXRsZVwiOiBcIlx1NjVlNVx1NWZkN1x1OGJiMFx1NWY1NVwiLCBcInVybFwiOiBcIi94YWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogMjB9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtY29nXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi94YWRtaW4vbG9nL1wifSwge1widGl0bGVcIjogXCJcdThiYTRcdThiYzFcdTU0OGNcdTYzODhcdTY3NDNcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdTdlYzRcIiwgXCJ1cmxcIjogXCIveGFkbWluL2F1dGgvZ3JvdXAvXCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwib3JkZXJcIjogMn0sIHtcInRpdGxlXCI6IFwiXHU2NzQzXHU5NjUwXCIsIFwidXJsXCI6IFwiL3hhZG1pbi9hdXRoL3Blcm1pc3Npb24vXCIsIFwiaWNvblwiOiBcImZhIGZhLWxvY2tcIiwgXCJvcmRlclwiOiA0fV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwiZmlyc3RfdXJsXCI6IFwiL3hhZG1pbi9hdXRoL2dyb3VwL1wifSwge1widGl0bGVcIjogXCJcdThiZmVcdTdhMGJcIiwgXCJtZW51c1wiOiBbe1widGl0bGVcIjogXCJcdThiZmVcdTdhMGJcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA3fSwge1widGl0bGVcIjogXCJcdTdhZTBcdTgyODJcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvbGVzc29uL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA4fSwge1widGl0bGVcIjogXCJcdTg5YzZcdTk4OTFcIiwgXCJ1cmxcIjogXCIveGFkbWluL2NvdXJzZXMvdmlkZW8vXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDl9LCB7XCJ0aXRsZVwiOiBcIlx1OGJmZVx1N2EwYlx1OGQ0NFx1NmU5MFwiLCBcInVybFwiOiBcIi94YWRtaW4vY291cnNlcy9jb3Vyc2VyZXNvdXJjZS9cIiwgXCJpY29uXCI6IG51bGwsIFwib3JkZXJcIjogMTB9XSwgXCJmaXJzdF91cmxcIjogXCIveGFkbWluL2NvdXJzZXMvY291cnNlL1wifV0ifQ==', '2018-07-07 16:33:48.484154');
INSERT INTO `django_session` VALUES ('dxoldvi0pnjvuq8bho8xprvxdp1wlqyl', 'ODM1ZTI4MmI2MTFhOTA4ODFhODcwOWE3ZDkxZTdlMWNhOWY4ZTBmZjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImMxMDZiY2Y0MjIwNTU0NjE5ZDY0MThmNmVjMzJhYTcxMWY2ZjEzMzgiLCJMSVNUX1FVRVJZIjpbWyJjb3Vyc2VzIiwiY291cnNlIl0sIiJdfQ==', '2018-06-30 19:31:50.415459');

-- ----------------------------
-- Table structure for operations_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operations_coursecomments`;
CREATE TABLE `operations_coursecomments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_coursecom_course_id_de0f98da_fk_courses_c`(`course_id`) USING BTREE,
  INDEX `operations_coursecom_user_id_84597521_fk_users_use`(`user_id`) USING BTREE,
  CONSTRAINT `operations_coursecom_course_id_de0f98da_fk_courses_c` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operations_coursecom_user_id_84597521_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operations_coursecomments
-- ----------------------------
INSERT INTO `operations_coursecomments` VALUES (1, '111111', '2018-06-20 16:45:19.726488', 2, 3);
INSERT INTO `operations_coursecomments` VALUES (2, '222', '2018-06-20 16:45:44.340952', 2, 3);
INSERT INTO `operations_coursecomments` VALUES (3, '123', '2018-06-20 16:48:07.021743', 2, 3);
INSERT INTO `operations_coursecomments` VALUES (4, '1111', '2018-06-20 16:49:35.807974', 2, 3);
INSERT INTO `operations_coursecomments` VALUES (5, '123', '2018-06-20 16:55:50.731313', 2, 3);
INSERT INTO `operations_coursecomments` VALUES (6, 'qwe', '2018-06-20 16:55:54.908989', 2, 3);
INSERT INTO `operations_coursecomments` VALUES (7, '完全很棒', '2018-06-20 17:16:15.729698', 2, 3);
INSERT INTO `operations_coursecomments` VALUES (8, '123', '2018-06-20 17:17:23.108037', 2, 3);
INSERT INTO `operations_coursecomments` VALUES (9, '1231', '2018-06-23 16:25:27.893838', 2, 3);

-- ----------------------------
-- Table structure for operations_userask
-- ----------------------------
DROP TABLE IF EXISTS `operations_userask`;
CREATE TABLE `operations_userask`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for operations_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operations_usercourse`;
CREATE TABLE `operations_usercourse`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_usercourse_course_id_a9f30cc6_fk_courses_course_id`(`course_id`) USING BTREE,
  INDEX `operations_usercourse_user_id_d33454be_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operations_usercourse_course_id_a9f30cc6_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `operations_usercourse_user_id_d33454be_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operations_usercourse
-- ----------------------------
INSERT INTO `operations_usercourse` VALUES (1, '2018-06-20 18:02:00.000000', 4, 3);
INSERT INTO `operations_usercourse` VALUES (2, '2018-06-20 18:02:00.000000', 3, 3);
INSERT INTO `operations_usercourse` VALUES (3, '2018-06-20 18:02:00.000000', 8, 3);
INSERT INTO `operations_usercourse` VALUES (4, '2018-06-20 18:06:00.000000', 2, 3);
INSERT INTO `operations_usercourse` VALUES (5, '2018-06-20 18:11:00.000000', 2, 7);
INSERT INTO `operations_usercourse` VALUES (6, '2018-06-20 18:11:00.000000', 3, 7);
INSERT INTO `operations_usercourse` VALUES (7, '2018-06-20 19:57:40.108956', 6, 3);
INSERT INTO `operations_usercourse` VALUES (8, '2018-06-20 19:57:59.360460', 10, 3);
INSERT INTO `operations_usercourse` VALUES (9, '2018-06-20 19:58:23.790119', 7, 3);

-- ----------------------------
-- Table structure for operations_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operations_userfavorite`;
CREATE TABLE `operations_userfavorite`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `operations_userfavorite_user_id_092d3821_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `operations_userfavorite_user_id_092d3821_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operations_userfavorite
-- ----------------------------
INSERT INTO `operations_userfavorite` VALUES (2, 1, 2, '2018-06-22 11:07:43.102565', 3);
INSERT INTO `operations_userfavorite` VALUES (6, 2, 1, '2018-06-22 15:13:22.115903', 3);
INSERT INTO `operations_userfavorite` VALUES (7, 2, 1, '2018-06-23 16:32:21.890168', 11);

-- ----------------------------
-- Table structure for operations_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operations_usermessage`;
CREATE TABLE `operations_usermessage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of operations_usermessage
-- ----------------------------
INSERT INTO `operations_usermessage` VALUES (1, 3, '欢迎光临,老妹', 1, '2018-06-22 10:24:00.000000');
INSERT INTO `operations_usermessage` VALUES (2, 3, '可以,起飞', 1, '2018-06-22 10:25:00.000000');
INSERT INTO `operations_usermessage` VALUES (3, 3, '欢迎光临,老妹', 1, '2018-06-22 11:02:00.000000');
INSERT INTO `operations_usermessage` VALUES (4, 3, '1231223123', 1, '2018-06-22 11:03:00.000000');

-- ----------------------------
-- Table structure for organizations_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organizations_citydict`;
CREATE TABLE `organizations_citydict`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organizations_citydict
-- ----------------------------
INSERT INTO `organizations_citydict` VALUES (1, '天津市', '天津市', '2018-06-15 09:32:00.000000');
INSERT INTO `organizations_citydict` VALUES (2, '武汉市', '武汉市', '2018-06-15 09:33:00.000000');
INSERT INTO `organizations_citydict` VALUES (3, '北京市', '北京市', '2018-06-15 09:33:00.000000');
INSERT INTO `organizations_citydict` VALUES (4, '深圳市', '深圳市', '2018-06-15 09:33:00.000000');
INSERT INTO `organizations_citydict` VALUES (5, '上海市', '上海市', '2018-06-15 09:35:00.000000');
INSERT INTO `organizations_citydict` VALUES (6, '青岛市', '青岛市', '2018-06-15 09:35:00.000000');
INSERT INTO `organizations_citydict` VALUES (7, '长沙市', '长沙市', '2018-06-15 09:49:00.000000');

-- ----------------------------
-- Table structure for organizations_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organizations_courseorg`;
CREATE TABLE `organizations_courseorg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organizations_course_city_id_d828a591_fk_organizat`(`city_id`) USING BTREE,
  CONSTRAINT `organizations_course_city_id_d828a591_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organizations_citydict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organizations_courseorg
-- ----------------------------
INSERT INTO `organizations_courseorg` VALUES (1, '1', '老男孩教育隶属于北京一天天教育科技有限公司，旗下有两大业务，老男孩linux培训和IT项目服务部，是国内唯一专注于Linux系统及架构师实战方向高端的培训机构与项目外包的企业，公司一方面致力于为国内国际大中型互联网企业培养急需的系统工程师，高级架构师，系统开发工程师等职位，一方面为企业提供企业级的各类高端技术培训，技术咨询，技术流程，技术规划，技术架构及调优方案，并参与实施于后期维护，把互联网的成熟技术经验带到传统行业领域。\r\n\r\n      公司在IT培训方面教学理念先进，方法独特，其中的4项学习思想方针（目标、方法、努力、坚持）和6重教学理念（重目标、重思路、重方法、重实践、重习惯、重总结）已深入广大IT网友及所有学员的内心，逐步形成了互联网IT行业内教育经典。\r\n\r\n      截止到目前累计已培养数千VIP学生，间接影响百万的IT群体，毕业生平均工资在毕业一年内平均12K以上，老男孩培训的学生已经遍布于很多就职于北京大部分知名互联网企业，小米手机，京东商城，蓝讯，快网，淘宝，阿里，支付宝，新浪网，搜狐，腾讯，58同城，赶集，和讯，世纪佳缘，当当网，中国移动，中国联通等，也有很多在中小公司任核心运维及运维经理总监职位（寻医问药总监，互动百科总监，盈科律云总监，合力金桥总监等，），累计为行内其他的培训机构讲师深入培训20人以上。', 71, 1113, 'org/201806/qhdx-logo.png', '中国', '2018-06-15 09:41:00.000000', 4, 'gx', 9, 0);
INSERT INTO `organizations_courseorg` VALUES (2, '2', '传智播客', 16, 33, 'org/2018/06/njdx.jpg', '韩国', '2018-06-15 09:50:00.000000', 3, 'gx', 9, 0);
INSERT INTO `organizations_courseorg` VALUES (3, '3', '文都', 234, 4444, 'org/2018/06/bjdx.jpg', '欧美', '2018-06-15 09:51:00.000000', 1, 'gr', 1111111111, 0);
INSERT INTO `organizations_courseorg` VALUES (4, '4', '培训', 3333, 33, 'org/2018/06/imooc_Gn1sRjp.png', '非洲', '2018-06-15 09:52:00.000000', 2, 'gr', 9, 0);
INSERT INTO `organizations_courseorg` VALUES (5, '5', '黑马', 3, 1, 'org/2018/06/bjdx_cCpdUw8.jpg', '湖北', '2018-06-15 09:55:00.000000', 2, 'gr', 9, 0);

-- ----------------------------
-- Table structure for organizations_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organizations_teacher`;
CREATE TABLE `organizations_teacher`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `points` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `organizations_teache_org_id_c716b697_fk_organizat`(`org_id`) USING BTREE,
  CONSTRAINT `organizations_teache_org_id_c716b697_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organizations_courseorg` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organizations_teacher
-- ----------------------------
INSERT INTO `organizations_teacher` VALUES (1, 'SM', 10, '韩国', '娱乐', 'xxxxxxxxxxxxxxxxxxxx', 26, 0, '2018-06-15 15:21:00.000000', 2, 'teacher/2018/06/1.jpg');
INSERT INTO `organizations_teacher` VALUES (2, 'YG', 3, '韩国', '娱乐', 'xxxxxxxxxxxxxxxxxxxx', 0, 0, '2018-06-15 15:21:00.000000', 2, 'teacher/2018/06/bjdx_bcd0m07.jpg');
INSERT INTO `organizations_teacher` VALUES (3, 'JYP', 2, '韩国', '娱乐', 'xxxxxxxxxxxxxxx', 0, 0, '2018-06-15 15:21:00.000000', 4, 'teacher/2018/06/bjdx_Go3ItLB.jpg');
INSERT INTO `organizations_teacher` VALUES (4, 'Mnet', 12, '韩国', '娱乐', '2额2', 3, 0, '2018-06-16 08:48:00.000000', 1, 'teacher/2018/06/bjdx.jpg');
INSERT INTO `organizations_teacher` VALUES (5, 'DSP', 12, '韩国', '娱乐', '1', 1, 1, '2018-06-13 16:20:59.000000', 3, '');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `send_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adress` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (3, 'pbkdf2_sha256$100000$2h4S5mjy9RX5$w5g3ov31r6HGNdLQPxUY0gfaPspAXLSVCacZqkcS+H0=', '2018-06-23 16:33:47.139065', 1, 'admin', '', '', '1216126@qq.com', 1, 1, '2018-06-14 16:08:06.102436', 'demo1', '2018-05-28', 'male', 'jianganqu', '12345678910', 'image/201806/1.jpg');
INSERT INTO `users_userprofile` VALUES (7, 'pbkdf2_sha256$100000$urIOx4KgvO4s$+qbDXUAHN/6Hd1jvnySQof0zS2OMCjwEG7KZCNYZQx8=', NULL, 0, 'donnie0918@sina.com', '', '', 'admin123', 0, 1, '2018-06-14 19:18:43.472329', '', NULL, 'female', '', NULL, 'courses/2018/06/qhdx-logo_TLwBVJS.png');
INSERT INTO `users_userprofile` VALUES (8, 'pbkdf2_sha256$100000$7yzXaqzS3CTx$LUCn125GFLMkw380LAdhxWYbdIu1IR+w+tlLQSMQEAA=', NULL, 0, '123@1.com', '', '', '123@1.com', 0, 0, '2018-06-14 20:51:06.528427', '', NULL, 'female', '', NULL, 'courses/2018/06/qhdx-logo_TLwBVJS.png');
INSERT INTO `users_userprofile` VALUES (9, 'pbkdf2_sha256$100000$wuCZVebTY86N$o0qUk5v09pyHui0j14fhug+bkrfT2JDZk8TiivIMkpQ=', NULL, 0, '123@123.com', '', '', '123@123.com', 0, 0, '2018-06-14 20:54:01.113308', '', NULL, 'female', '', '', 'image/default.pngcourses/2018/06/qhdx-logo_TLwBVJS.png');
INSERT INTO `users_userprofile` VALUES (11, 'pbkdf2_sha256$100000$jBWBiBp8wQZd$z1mkJY2cvk+MyDCogHrI4yLG2h7ZhG6Rs2FqFdygs1I=', '2018-06-23 16:31:59.073984', 0, '1352441896@qq.com', '', '', '1352441896@qq.com', 0, 1, '2018-06-23 16:30:52.617436', '', NULL, 'female', '', NULL, 'image/default.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (3, '2018-06-14 16:27:02.047476', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 3);
INSERT INTO `xadmin_log` VALUES (4, '2018-06-14 16:27:08.188015', '127.0.0.1', NULL, '', 'delete', '批量删除 1 个 用户信息', NULL, 3);
INSERT INTO `xadmin_log` VALUES (5, '2018-06-15 09:33:18.102362', '127.0.0.1', '1', 'CityDict object (1)', 'create', '已添加。', 12, 3);
INSERT INTO `xadmin_log` VALUES (6, '2018-06-15 09:33:25.202365', '127.0.0.1', '2', 'CityDict object (2)', 'create', '已添加。', 12, 3);
INSERT INTO `xadmin_log` VALUES (7, '2018-06-15 09:33:37.490489', '127.0.0.1', '3', 'CityDict object (3)', 'create', '已添加。', 12, 3);
INSERT INTO `xadmin_log` VALUES (8, '2018-06-15 09:33:46.419599', '127.0.0.1', '4', 'CityDict object (4)', 'create', '已添加。', 12, 3);
INSERT INTO `xadmin_log` VALUES (9, '2018-06-15 09:35:11.316848', '127.0.0.1', '5', 'CityDict object (5)', 'create', '已添加。', 12, 3);
INSERT INTO `xadmin_log` VALUES (10, '2018-06-15 09:35:58.563954', '127.0.0.1', '6', 'CityDict object (6)', 'create', '已添加。', 12, 3);
INSERT INTO `xadmin_log` VALUES (11, '2018-06-15 09:45:55.855988', '127.0.0.1', '1', 'CourseOrg object (1)', 'create', '已添加。', 14, 3);
INSERT INTO `xadmin_log` VALUES (12, '2018-06-15 09:49:39.912571', '127.0.0.1', '7', 'CityDict object (7)', 'create', '已添加。', 12, 3);
INSERT INTO `xadmin_log` VALUES (13, '2018-06-15 09:51:48.545868', '127.0.0.1', '2', 'CourseOrg object (2)', 'create', '已添加。', 14, 3);
INSERT INTO `xadmin_log` VALUES (14, '2018-06-15 09:52:05.100571', '127.0.0.1', '3', 'CourseOrg object (3)', 'create', '已添加。', 14, 3);
INSERT INTO `xadmin_log` VALUES (15, '2018-06-15 09:53:18.397958', '127.0.0.1', '4', 'svsvs', 'create', '已添加。', 14, 3);
INSERT INTO `xadmin_log` VALUES (16, '2018-06-15 09:55:20.405500', '127.0.0.1', '5', 'Donnie', 'create', '已添加。', 14, 3);
INSERT INTO `xadmin_log` VALUES (17, '2018-06-15 09:55:32.788396', '127.0.0.1', '6', 'Donnie', 'create', '已添加。', 14, 3);
INSERT INTO `xadmin_log` VALUES (18, '2018-06-15 09:55:44.459145', '127.0.0.1', '7', 'Donnie', 'create', '已添加。', 14, 3);
INSERT INTO `xadmin_log` VALUES (19, '2018-06-15 15:21:37.361940', '127.0.0.1', '1', '[王者归来]的教师: Donnie', 'create', '已添加。', 13, 3);
INSERT INTO `xadmin_log` VALUES (20, '2018-06-15 15:21:54.415311', '127.0.0.1', '2', '[王者归来]的教师: Donnie_x', 'create', '已添加。', 13, 3);
INSERT INTO `xadmin_log` VALUES (21, '2018-06-15 15:22:19.138166', '127.0.0.1', '3', '[svsvs]的教师: boo', 'create', '已添加。', 13, 3);
INSERT INTO `xadmin_log` VALUES (22, '2018-06-15 15:28:49.571908', '127.0.0.1', '1', 'Donnie', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (23, '2018-06-16 08:32:53.834838', '127.0.0.1', '2', 'java', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (24, '2018-06-16 08:33:21.309357', '127.0.0.1', '3', 'Python开发', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (25, '2018-06-16 08:48:18.685338', '127.0.0.1', '4', '招投标项目开发', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (26, '2018-06-16 08:48:41.484357', '127.0.0.1', '4', '[1]的教师: 1212', 'create', '已添加。', 13, 3);
INSERT INTO `xadmin_log` VALUES (27, '2018-06-16 09:36:20.500470', '127.0.0.1', '4', '[1]的教师: 1212', 'change', '修改 image', 13, 3);
INSERT INTO `xadmin_log` VALUES (28, '2018-06-16 09:36:26.280010', '127.0.0.1', '3', '[4]的教师: boo', 'change', '修改 image', 13, 3);
INSERT INTO `xadmin_log` VALUES (29, '2018-06-16 09:36:31.535950', '127.0.0.1', '2', '[2]的教师: Donnie_x', 'change', '修改 image', 13, 3);
INSERT INTO `xadmin_log` VALUES (30, '2018-06-16 09:36:37.144945', '127.0.0.1', '1', '[2]的教师: Donnie', 'change', '修改 image', 13, 3);
INSERT INTO `xadmin_log` VALUES (31, '2018-06-16 17:42:17.434521', '127.0.0.1', '5', 'django课程', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (32, '2018-06-16 17:42:42.190299', '127.0.0.1', '6', 'demo1', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (33, '2018-06-16 17:43:04.852677', '127.0.0.1', '7', 'java++++', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (34, '2018-06-16 17:43:30.034316', '127.0.0.1', '8', 'js', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (35, '2018-06-16 17:43:50.517521', '127.0.0.1', '9', '121', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (36, '2018-06-16 17:44:09.097818', '127.0.0.1', '10', '11444', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (37, '2018-06-16 19:11:04.473313', '127.0.0.1', '1', 'UserCourse object (1)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (38, '2018-06-16 19:11:18.583600', '127.0.0.1', '2', 'UserCourse object (2)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (39, '2018-06-16 19:11:30.110732', '127.0.0.1', '3', 'UserCourse object (3)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (40, '2018-06-20 09:14:23.048214', '127.0.0.1', '2', '《java》课程的章节 >> 第一章 你妹', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (41, '2018-06-20 09:14:31.270646', '127.0.0.1', '3', '《java》课程的章节 >> 第二章 你大爷', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (42, '2018-06-20 09:14:44.373750', '127.0.0.1', '4', '《java》课程的章节 >> 第三章   可以的', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (43, '2018-06-20 09:15:52.341682', '127.0.0.1', '1', 'Video object (1)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (44, '2018-06-20 09:15:56.898614', '127.0.0.1', '2', 'Video object (2)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (45, '2018-06-20 09:16:04.387144', '127.0.0.1', '3', 'Video object (3)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (46, '2018-06-20 09:35:21.559812', '127.0.0.1', '4', 'Video object (4)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (47, '2018-06-20 09:35:30.406061', '127.0.0.1', '5', 'Video object (5)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (48, '2018-06-20 09:35:56.203807', '127.0.0.1', '6', 'Video object (6)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (49, '2018-06-20 09:50:20.133345', '127.0.0.1', '1', 'CourseResource object (1)', 'create', '已添加。', 9, 3);
INSERT INTO `xadmin_log` VALUES (50, '2018-06-20 09:50:27.517307', '127.0.0.1', '2', 'CourseResource object (2)', 'create', '已添加。', 9, 3);
INSERT INTO `xadmin_log` VALUES (51, '2018-06-20 11:19:16.239686', '127.0.0.1', '1', '《java》课程的章节 >> 第一章 你妹', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (52, '2018-06-20 11:19:25.207644', '127.0.0.1', '2', '《java》课程的章节 >> 第二章 你大爷', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (53, '2018-06-20 11:19:31.109384', '127.0.0.1', '3', '《java》课程的章节 >> 第三章   可以的', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (54, '2018-06-20 11:19:45.273409', '127.0.0.1', '1', 'Video object (1)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (55, '2018-06-20 11:19:53.918612', '127.0.0.1', '2', 'Video object (2)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (56, '2018-06-20 11:20:03.219149', '127.0.0.1', '3', 'Video object (3)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (57, '2018-06-20 11:20:22.550679', '127.0.0.1', '1', 'CourseResource object (1)', 'create', '已添加。', 9, 3);
INSERT INTO `xadmin_log` VALUES (58, '2018-06-20 11:38:10.366140', '127.0.0.1', '1', '《java》课程的章节 >> 第一章 你妹', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (59, '2018-06-20 11:38:13.397755', '127.0.0.1', '2', '《java》课程的章节 >> 第二章 你大爷', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (60, '2018-06-20 11:38:16.705174', '127.0.0.1', '3', '《java》课程的章节 >> 第三章   可以的', 'create', '已添加。', 10, 3);
INSERT INTO `xadmin_log` VALUES (61, '2018-06-20 11:38:28.966828', '127.0.0.1', '1', 'Video object (1)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (62, '2018-06-20 11:38:33.815675', '127.0.0.1', '2', 'Video object (2)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (63, '2018-06-20 11:38:40.729031', '127.0.0.1', '3', 'Video object (3)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (64, '2018-06-20 11:38:49.688256', '127.0.0.1', '4', 'Video object (4)', 'create', '已添加。', 24, 3);
INSERT INTO `xadmin_log` VALUES (65, '2018-06-20 11:39:25.440012', '127.0.0.1', '1', 'CourseResource object (1)', 'create', '已添加。', 9, 3);
INSERT INTO `xadmin_log` VALUES (66, '2018-06-20 11:39:36.798143', '127.0.0.1', '2', 'CourseResource object (2)', 'create', '已添加。', 9, 3);
INSERT INTO `xadmin_log` VALUES (67, '2018-06-20 14:36:21.419756', '127.0.0.1', '2', 'java', 'change', '修改 image，youneed_know 和 teacher_tell', 11, 3);
INSERT INTO `xadmin_log` VALUES (68, '2018-06-20 14:41:42.435142', '127.0.0.1', '2', 'java', 'change', '修改 image 和 teacher', 11, 3);
INSERT INTO `xadmin_log` VALUES (69, '2018-06-20 14:42:06.917680', '127.0.0.1', '1', '[2]的教师: Donnie', 'change', '修改 image', 13, 3);
INSERT INTO `xadmin_log` VALUES (70, '2018-06-20 18:02:33.395485', '127.0.0.1', '1', 'UserCourse object (1)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (71, '2018-06-20 18:02:38.228525', '127.0.0.1', '2', 'UserCourse object (2)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (72, '2018-06-20 18:02:46.111440', '127.0.0.1', '3', 'UserCourse object (3)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (73, '2018-06-20 18:06:28.631696', '127.0.0.1', '4', 'UserCourse object (4)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (74, '2018-06-20 18:09:08.143066', '127.0.0.1', '3', 'Donnie', 'create', '已添加。', 9, 3);
INSERT INTO `xadmin_log` VALUES (75, '2018-06-20 18:11:41.118912', '127.0.0.1', '5', 'UserCourse object (5)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (76, '2018-06-20 18:11:47.127842', '127.0.0.1', '6', 'UserCourse object (6)', 'create', '已添加。', 18, 3);
INSERT INTO `xadmin_log` VALUES (77, '2018-06-20 20:54:29.723474', '127.0.0.1', '2', 'Donnie', 'change', '修改 learn_times', 24, 3);
INSERT INTO `xadmin_log` VALUES (78, '2018-06-21 09:17:02.136311', '127.0.0.1', '11', 'Donnie', 'create', '已添加。', 11, 3);
INSERT INTO `xadmin_log` VALUES (79, '2018-06-22 10:25:07.473390', '127.0.0.1', '1', 'UserMessage object (1)', 'create', '已添加。', 19, 3);
INSERT INTO `xadmin_log` VALUES (80, '2018-06-22 10:25:21.156087', '127.0.0.1', '2', 'UserMessage object (2)', 'create', '已添加。', 19, 3);
INSERT INTO `xadmin_log` VALUES (81, '2018-06-22 11:02:33.681131', '127.0.0.1', '3', 'UserMessage object (3)', 'create', '已添加。', 19, 3);
INSERT INTO `xadmin_log` VALUES (82, '2018-06-22 11:03:11.482391', '127.0.0.1', '4', 'UserMessage object (4)', 'create', '已添加。', 19, 3);
INSERT INTO `xadmin_log` VALUES (83, '2018-06-22 13:09:17.598735', '127.0.0.1', '2', 'Donnie', 'change', '修改 url', 24, 3);
INSERT INTO `xadmin_log` VALUES (84, '2018-06-22 13:09:26.166835', '127.0.0.1', '3', 'general user', 'change', '修改 url', 24, 3);
INSERT INTO `xadmin_log` VALUES (85, '2018-06-22 13:11:07.712132', '127.0.0.1', '1', 'Donnie', 'change', '修改 url', 24, 3);
INSERT INTO `xadmin_log` VALUES (86, '2018-06-22 13:11:16.589382', '127.0.0.1', '2', 'Donnie', 'change', '没有字段被修改。', 24, 3);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (3, 'dashboard:home:pos', '', 3);
INSERT INTO `xadmin_usersettings` VALUES (4, 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', 3);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
