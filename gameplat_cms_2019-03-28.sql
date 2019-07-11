# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17-log)
# Database: gameplat_cms
# Generation Time: 2019-03-28 01:11:39 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `account` varchar(32) NOT NULL COMMENT '登陆账号',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `nickname` varchar(32) NOT NULL COMMENT '昵称',
  `state` int(11) DEFAULT '1' COMMENT '用户状态（0：待审核；1：正常；2：停用）',
  `type` varchar(15) DEFAULT NULL COMMENT '用户类型（"ADMIN"：超管；"DGD"：大股东；"GD"：股东；"ZDL"：总代理；"DL"：代理；"ZZH"：子账户）',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_name` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;

INSERT INTO `admin` (`id`, `account`, `password`, `nickname`, `state`, `type`, `add_time`)
VALUES
	(201,'admin1','3270437850a945a3fdcbbab4651d704a','ADMIN1',1,'ADMIN','2016-09-02 18:43:54'),
	(202,'admin','5a1f627baa5695fa6b8b42d8cb45d83f','ADMIN',1,'ADMIN','2017-06-04 15:47:11'),
	(203,'admin2','42ac24a84ab6fcbe65852fea23141548','ADMIN2',1,'ADMIN','2017-06-04 15:48:33'),
	(204,'admin3','b9cd21e4a443f3968096fe7cd266bd8e','ADMIN3',1,'ADMIN','2017-06-04 15:48:50'),
	(205,'admin4','5440ae52d9c496af577ce74698f45c67','ADMIN4',1,'ADMIN','2017-06-04 15:49:08'),
	(206,'admin5','90bccbc4930892852005ce54a33f0229','ADMIN5',1,'ADMIN','2017-06-04 15:49:23'),
	(207,'admin6','3e76787728b308f912236d38d037b501','ADMIN6',1,'ADMIN','2017-06-04 15:49:39');

/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_ip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_ip`;

CREATE TABLE `auth_ip` (
  `id` smallint(10) NOT NULL AUTO_INCREMENT,
  `allow_ip` varchar(15) DEFAULT NULL COMMENT 'ip白名单',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `operator` varchar(38) DEFAULT NULL COMMENT '操作人帐号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table cms_attr
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_attr`;

CREATE TABLE `cms_attr` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attr_name` varchar(50) DEFAULT NULL COMMENT '显示名称',
  `attr_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `attr_type` varchar(20) DEFAULT NULL COMMENT '类型:text文本;upload上传文件;editor html编辑器;flash 上传flash文件',
  `image_width` int(20) DEFAULT NULL COMMENT '上传图片的宽度',
  `image_height` int(20) DEFAULT NULL COMMENT '上传图片的高度',
  `template_id` bigint(11) NOT NULL COMMENT '模板ID',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `attr_expand` text COMMENT '属性拓展',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ind_attr` (`attr_key`,`template_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模板属性表';

LOCK TABLES `cms_attr` WRITE;
/*!40000 ALTER TABLE `cms_attr` DISABLE KEYS */;

INSERT INTO `cms_attr` (`id`, `attr_name`, `attr_key`, `attr_type`, `image_width`, `image_height`, `template_id`, `sort`, `attr_expand`)
VALUES
	(117,'logo图片','index_title_logo_ico','upload',16,16,65,1,NULL),
	(134,'活动名','mobile_wap_youhui_title','text',0,0,79,1,NULL),
	(135,'活动时间','mobile_wap_youhui_time','text',0,0,79,2,NULL),
	(136,'活动横幅图片','mobile_wap_youhui_img','upload',640,220,79,3,NULL),
	(143,'页面标题内容','page_title','text',0,0,82,1,NULL),
	(149,'页面标题','app_title','text',0,0,89,1,NULL),
	(150,'appLogo','app_logo','upload',16,16,89,2,NULL),
	(151,'首页logo','mobile_index_log','upload',160,69,89,3,NULL),
	(175,'轮播图片','mobile_banner_pic','upload',720,300,95,1,NULL),
	(176,'图片链接地址','mobile_bannner_href','text',0,0,95,2,NULL),
	(177,'LOGO图片','game_center_logo','upload',160,69,96,1,NULL),
	(178,'LOGO跳转地址','onclick_logo_href','text',0,0,96,2,NULL),
	(179,'在线客服链接','online_service','text',0,0,97,1,NULL),
	(180,'app在线客服','app_online_service','text',0,0,89,4,NULL),
	(186,'活动详情','mobile_wap_youhui_content','editor',0,0,79,4,NULL),
	(189,'手机首页链接地址','mobile_index_url','text',0,0,100,1,NULL),
	(191,'logo图片','wap_app_logo','upload',264,96,103,1,NULL),
	(192,'最新优惠','new_youhui','editor',0,0,103,2,NULL),
	(193,'ios下载链接','ios_store','text',0,0,103,3,NULL),
	(194,'Android下载链接','android_store','text',0,0,103,4,NULL),
	(195,'二维码图片','app_ewm','upload',232,232,103,5,NULL),
	(196,'版权所有','owner_content','editor',0,0,103,6,NULL),
	(197,'meta description','meta_title_description','text',0,0,104,1,NULL),
	(198,'meta keywords','meta_title_keywords','text',0,0,104,2,NULL),
	(199,'meta title','meta_title_title','text',0,0,104,3,NULL),
	(200,'购彩大厅右侧按钮','pagecenter_right_content','editor',0,0,105,1,NULL),
	(201,'红包跳转路径','redPacket_href','text',0,0,106,1,NULL),
	(202,'红包图片','redPacket_pic','upload',671,606,106,2,NULL),
	(203,'红包活动描述','hongbao_desc','editor',0,0,107,1,NULL),
	(216,'pc端在线客服链接地址','onlineService','text',0,0,98,1,NULL),
	(217,'是否显示额度转换','isReplacement','checkbox',0,0,101,1,NULL),
	(218,'是否显示手机H5菜单王者荣耀按钮','isWzry','checkbox',0,0,101,2,NULL),
	(219,'数据唯一标识ID','json_id','text',0,0,112,1,NULL),
	(220,'游戏类型','json_type','text',0,0,112,2,NULL),
	(221,'游戏图片','json_logoSrc','upload',240,240,112,3,NULL),
	(222,'彩带热门图片','json_styleSrc','upload',80,80,112,4,NULL),
	(223,'游戏名称','json_name','text',0,0,112,5,NULL),
	(224,'游戏链接地址','json_href','text',0,0,112,6,NULL),
	(226,'自定义了链接','json_b','checkbox',0,0,112,7,NULL),
	(227,'是否显示H5底部下载框','isDownload','checkbox',0,0,89,5,NULL),
	(228,'苹果下载链接地址','iosPath','text',0,0,89,6,NULL),
	(229,'安卓下载链接地址','androidPath','text',0,0,89,7,NULL),
	(230,'下载提示语','downloadText','text',0,0,89,8,NULL),
	(231,'是否显示\'用户中心红包按钮\'','isShowRedPacket','checkbox',0,0,89,9,NULL),
	(232,'是否显示首页红包浮窗按钮','isShowFloatRedPacket','checkbox',0,0,89,10,NULL),
	(233,'首页浮窗红包图片','redPacketPath','upload',59,0,89,11,NULL),
	(234,'红包跳转路劲','isRedHref','text',0,0,89,12,NULL),
	(235,'是否开启弹窗','isShowAlert','checkbox',0,0,113,1,NULL),
	(236,'标题','_title','text',0,0,113,2,NULL),
	(237,'公告图片','alertNotivePic','upload',600,310,113,3,NULL),
	(238,'是否开启图片公告','isShowPic','checkbox',0,0,113,4,NULL),
	(239,'弹窗公告文本','alertNotiveContent','textarea',0,0,113,5,NULL),
	(240,'id','gameId','gameSelect',0,0,116,1,NULL),
	(241,'游戏类型','type','text',0,0,116,2,NULL),
	(242,'游戏logo','logoSrc','upload',240,240,116,3,NULL),
	(243,'彩带图片','styleSrc','upload',80,80,116,4,NULL),
	(244,'游戏名称','name','text',0,0,116,5,NULL),
	(245,'是否自定义链接','isHref','checkbox',0,0,116,6,NULL),
	(246,'自定义链接','link','text',0,0,116,7,NULL),
	(247,'ios首页显示红包浮图','isShowRedPacket_1','checkbox',0,0,101,3,'[]'),
	(248,'左图','left_pic','upload',118,0,117,1,'[]'),
	(249,'右图','right_pic','upload',118,0,117,2,'[]'),
	(250,'logo图','index_logo_pic','upload',160,0,118,1,'[]'),
	(251,'菜单','index_menu','editor',0,0,119,1,'[]'),
	(252,'导航','index_left_menu','editor',0,0,120,1,'[]');

/*!40000 ALTER TABLE `cms_attr` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_attr_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_attr_value`;

CREATE TABLE `cms_attr_value` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `attr_value` longtext,
  `template_id` bigint(11) NOT NULL COMMENT '模板ID',
  `attr_key` varchar(50) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `value_status` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模板属性值的表';

LOCK TABLES `cms_attr_value` WRITE;
/*!40000 ALTER TABLE `cms_attr_value` DISABLE KEYS */;

INSERT INTO `cms_attr_value` (`id`, `attr_value`, `template_id`, `attr_key`, `sort`, `value_status`)
VALUES
	(417,'https://static.meiqia.com/dist/standalone.html?_=t&eid=64307',97,'online_service',0,1),
	(664,'/wap/index.html',100,'mobile_index_url',0,0),
	(669,'',103,'wap_app_logo',0,0),
	(670,'<p>最新优惠:<strong style=\"color: red\">新会员实名注册<strong style=\"font-size: 20px; color: rgb(5, 58, 200);\">送10元！</strong></strong></p>\n',103,'new_youhui',0,0),
	(671,'',103,'ios_store',0,0),
	(672,'',103,'android_store',0,0),
	(673,'',103,'app_ewm',0,0),
	(674,'<p>版权所有：2009-2026©️</p>\n',103,'owner_content',0,0),
	(692,'{\"gameId\":\"\",\"type\":\"彩票\",\"logoSrc\":\"20180918/20180918200558047151-lottert.png\",\"styleSrc\":\"20180918/20180918200559803956-nopic.png\",\"name\":\"彩票游戏\",\"isHref\":\"1\",\"link\":\"\"}',116,NULL,1,1),
	(693,'{\"gameId\":\"\",\"type\":\"真人视讯\",\"logoSrc\":\"20180918/20180918200611503656-zhnre.png\",\"styleSrc\":\"20180918/20180918200606445808-nopic.png\",\"name\":\"真人视讯\",\"isHref\":\"1\",\"link\":\"\"}',116,NULL,2,1),
	(694,'{\"gameId\":\"\",\"type\":\"电子\",\"logoSrc\":\"20180918/20180918200619324612-dianzi.png\",\"styleSrc\":\"20180918/20180918200621494968-nopic.png\",\"name\":\"电子游艺\",\"isHref\":\"1\",\"link\":\"\"}',116,NULL,3,1),
	(695,'{\"gameId\":\"\",\"type\":\"体育\",\"logoSrc\":\"20180918/20180918200641295530-tiyu.png\",\"styleSrc\":\"20180918/20180918200632707234-nopic.png\",\"name\":\"皇冠体育\",\"isHref\":\"1\",\"link\":\"\"}',116,NULL,4,1),
	(696,'{\"gameId\":\"70\",\"type\":\"彩票\",\"logoSrc\":\"20180918/20180918200653070787-lhc.png\",\"styleSrc\":\"20180918/20180918200650407674-nopic.png\",\"name\":\"香港六合彩\",\"isHref\":\"1\",\"link\":\"\"}',116,NULL,5,1),
	(697,'{\"gameId\":\"\",\"type\":\"ag\",\"logoSrc\":\"20180918/20180918200702961967-ag.png\",\"styleSrc\":\"20180918/20180918200700711900-nopic.png\",\"name\":\"AG视讯\",\"isHref\":\"1\",\"link\":\"\"}',116,NULL,6,1),
	(698,'{\"gameId\":\"\",\"type\":\"bbin\",\"logoSrc\":\"20180918/20180918200711908679-bnin.png\",\"styleSrc\":\"20180918/20180918200709606991-nopic.png\",\"name\":\"BBIN视讯\",\"isHref\":\"1\",\"link\":\"\"}',116,NULL,7,1),
	(699,'{\"gameId\":\"\",\"type\":\"lmg\",\"logoSrc\":\"20180918/20180918200721011554-lmg.png\",\"styleSrc\":\"20180918/20180918200717784494-nopic.png\",\"name\":\"LMG视讯\",\"isHref\":\"1\",\"link\":\"\"}',116,NULL,8,1),
	(712,'{\"json_id\":\"1\",\"json_type\":\"cpyx\",\"json_logoSrc\":\"20180918/20180918200411518574-lottert.png\",\"json_styleSrc\":\"20180918/20180918200413279187-nopic.png\",\"json_name\":\"彩票游戏\",\"json_href\":\"#/gcdt\",\"json_b\":\"0\"}',112,NULL,1,1),
	(713,'{\"json_id\":\"2\",\"json_type\":\"ag\",\"json_logoSrc\":\"20180918/20180918200438649656-ag.png\",\"json_styleSrc\":\"20180918/20180918200441055523-nopic.png\",\"json_name\":\"AG视讯\",\"json_href\":\"\",\"json_b\":\"1\"}',112,NULL,2,1),
	(714,'{\"json_id\":\"3\",\"json_type\":\"bbin\",\"json_logoSrc\":\"20180918/20180918200449915413-bnin.png\",\"json_styleSrc\":\"20180918/20180918200447603858-nopic.png\",\"json_name\":\"BBIN馆\",\"json_href\":\"\",\"json_b\":\"1\"}',112,NULL,3,1),
	(715,'{\"json_id\":\"4\",\"json_type\":\"ele\",\"json_logoSrc\":\"20180918/20180918200459987367-dianzi.png\",\"json_styleSrc\":\"20180918/20180918200457059139-nopic.png\",\"json_name\":\"电子游艺\",\"json_href\":\"#/electronic\",\"json_b\":\"0\"}',112,NULL,4,1),
	(716,'{\"json_id\":\"5\",\"json_type\":\"lhc\",\"json_logoSrc\":\"20180918/20180918200510542145-lhc.png\",\"json_styleSrc\":\"20180918/20180918200506618458-nopic.png\",\"json_name\":\"香港六合彩\",\"json_href\":\"#/game/70\",\"json_b\":\"0\"}',112,NULL,5,1),
	(717,'{\"json_id\":\"6\",\"json_type\":\"hgty\",\"json_logoSrc\":\"20180918/20180918200523853762-tiyu.png\",\"json_styleSrc\":\"20180918/20180918200518054417-nopic.png\",\"json_name\":\"皇冠体育\",\"json_href\":\"#/sports\",\"json_b\":\"0\"}',112,NULL,6,1),
	(718,'{\"json_id\":\"7\",\"json_type\":\"lmg\",\"json_logoSrc\":\"20180918/20180918200534946359-lmg.png\",\"json_styleSrc\":\"20180918/20180918200529888134-nopic.png\",\"json_name\":\"LMG视讯\",\"json_href\":\"\",\"json_b\":\"1\"}',112,NULL,7,1),
	(719,'{\"json_id\":\"8\",\"json_type\":\"ds\",\"json_logoSrc\":\"20180918/20180918200543886475-ds.png\",\"json_styleSrc\":\"20180918/20180918200541485457-nopic.png\",\"json_name\":\"DS视讯\",\"json_href\":\"\",\"json_b\":\"1\"}',112,NULL,8,1),
	(735,'1',113,'isShowAlert',0,0),
	(736,'',113,'_title',0,0),
	(737,'',113,'alertNotivePic',0,0),
	(738,'1',113,'isShowPic',0,0),
	(739,'',113,'alertNotiveContent',0,0),
	(752,'20180918/20180918195733314736-fav.png',65,'index_title_logo_ico',0,0),
	(753,'bet365-在线体育投注',82,'page_title',0,0),
	(754,'bet365-在线体育投注',104,'meta_title_description',0,0),
	(755,'bet365-在线体育投注',104,'meta_title_keywords',0,0),
	(756,'bet365-在线体育投注',104,'meta_title_title',0,0),
	(769,'20180918/20180918195837231348-161224031309.png',96,'game_center_logo',0,0),
	(770,'/views/main.html',96,'onclick_logo_href',0,0),
	(808,'',89,'app_title',0,0),
	(809,'20180918/20180918195721564162-fav.png',89,'app_logo',0,0),
	(810,'20180918/20180918195829220958-161224031309.png',89,'mobile_index_log',0,0),
	(811,'https://messenger.providesupport.com/messenger/04ypsq4867g5t0jv363uhn6gta.html',89,'app_online_service',0,0),
	(812,'0',89,'isDownload',0,0),
	(813,'',89,'iosPath',0,0),
	(814,'',89,'androidPath',0,0),
	(815,'',89,'downloadText',0,0),
	(816,'0',89,'isShowRedPacket',0,0),
	(817,'0',89,'isShowFloatRedPacket',0,0),
	(818,'20180918/20180918200036152494-qhb_h5.png',89,'redPacketPath',0,0),
	(819,'/views/activity/wap/hongbao.html',89,'isRedHref',0,0),
	(820,'https://messenger.providesupport.com/messenger/04ypsq4867g5t0jv363uhn6gta.html',98,'onlineService',0,0),
	(821,'0',101,'isReplacement',0,0),
	(822,'0',101,'isWzry',0,0),
	(823,'0',101,'isShowRedPacket_1',0,0),
	(824,'<div class=\"download\" style=\"text-align:right\"><a class=\"online-service\" style=\"font-size: 18px;float:initial;\">在线客服</a></div>\n',105,'pagecenter_right_content',0,0),
	(827,'/views/activity/hongbao.html',106,'redPacket_href',0,0),
	(828,'20180918/20180918200141145466-qhb_pc.png',106,'redPacket_pic',0,0),
	(831,'<div class=\"wrap_box\" id=\"about1\" style=\"line-height: 36px;padding-top: 26px;\">\n<p>活动内容：为感谢广大会员对bet365的支持与信任,我们没有虚情假意的祝福，我们没有毫无创意的活动，我们只会用最暴力的手段表达自己！即起只要当日存款大于300元的bet365全体会员，游戏后次日即可参与天天抢红包，最佳手气8888元，小投注也可博大红包，心动的你赶紧加入bet365，好运将与您常相伴！</p>\n\n<p>活动对象：bet365全体有效会员</p>\n\n<p>活动时间：以官网公告为准</p>\n\n<p>活动结束：以公司红包官网通知为准</p>\n\n<p>开抢时间：每天北京时间下午15点整开抢，当日19：00：00关闭（如遇官网例行维护，将在维护完成1小时后开放）</p>\n\n<p>参与条件：bet365全体有效会员,即可参与天天抢红包活动&hellip;&hellip;详细请阅读《红包活动细则》。</p>\n\n<p>奖品设置：抽奖次数及金额根据前一日的存款金额等级而获得，完全随机中奖，红包金额大小不等，最低0.1元，最高8888.88元。</p>\n</div>\n\n<div class=\"wrap_box\" id=\"about2\">\n<table>\n	<tbody>\n		<tr>\n			<td>日存款总额在300元或以上</td>\n			<td>1次</td>\n			<td>日存款总额在1000元或以上</td>\n			<td>2次</td>\n		</tr>\n		<tr>\n			<td>日存款总额在5000元或以上</td>\n			<td>3次</td>\n			<td>日存款总额在10000元或以上</td>\n			<td>4次</td>\n		</tr>\n		<tr>\n			<td>日存款总额在50000元或以上</td>\n			<td>5次</td>\n			<td>日存款总额在100000元或以上</td>\n			<td>6次</td>\n		</tr>\n	</tbody>\n</table>\n</div>\n\n<div class=\"box2_top\"><img src=\"images/tit3.png\" /></div>\n\n<div class=\"wrap_box\" id=\"about4\" style=\"line-height: 36px;\">\n<p>1、每位会员仅能享有一个有效会员账号，如发现会员同一个IP下注册多个账号进行投注抢红包，公司有权拒绝赠送其彩金并做账号冻结处理，保证正常玩家的利益。</p>\n\n<p>2、为确保会员注册信息的真实性，成功申请彩金后的首次出款时不得修改银行卡号等信息，否则将扣除其赠送优惠及期间盈利。</p>\n\n<p>3、此活动为bet365系统程序自动运行，获奖的概率完全遵循力学及自然概率，不涉及任何人工操作，抽奖活动以系统判定为准,不得争议。</p>\n\n<p>4、在活动期间, bet365对于会员滥用个人账号将严格规定执行, 本娱乐城保留权利, 在任何时间都可终止会员登录或取消优惠资格. 关于会员参与活动是否构成滥用多账号的判断和决定是根据bet365最终决定。</p>\n\n<p>5、任何非法套取优惠行为或恶意注册账号及恶意存款的会员，公司将保留权利不赠送相应彩金。</p>\n\n<p>6、bet365保留权利在任何时候以及无通知的情况下更改、停止、取消优惠活动。</p>\n\n<p>7、参与该优惠，即表示您已详细参阅并同意网站内『活动声明』系列条款，为避免对文字的理解差异，bet365保留对活动的最终解释权;适用于所有优惠。</p>\n</div>\n',107,'hongbao_desc',0,0),
	(832,'20180918/20180918201113255551-left.png',117,'left_pic',0,0),
	(833,'20180918/20180918201115417873-right.png',117,'right_pic',0,0),
	(834,'20180918/20180918201448606337-161224031309.png',118,'index_logo_pic',0,0),
	(835,'<ul>\n	<li class=\"nav-list\"><a href=\"/views/html/index.html\">首页</a></li>\n	<li class=\"nav-list\"><a href=\"/views/html/kingGlory.html\">王者荣耀</a></li>\n	<li class=\"nav-list \"><a href=\"/views/html/chess.html\">棋牌游戏</a>\n	<ul style=\"left: 76px\">\n		<li><a href=\"/views/html/chess.html?gameType=ky\">开元棋牌</a></li>\n		<li><a href=\"/views/html/chess.html?gameType=jb\">金宝棋牌</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/views/html/sports.html\">体育投注</a>\n	<ul style=\"left: 58px\">\n		<li><a href=\"/views/html/sports.html\">皇冠体育</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'sb\');\">沙巴体育</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'m8\');\">M8体育</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'bb\');\">BB体育</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/views/html/LiveVideo.html\">真人娱乐</a>\n	<ul style=\"left: 18px;   width: 563px;\">\n		<li><a href=\"javascript:EnterLiveGame(\'lmg\');\">LMG旗舰厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'ag\');\">AG贵宾厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'bbin\');\">BBIN视讯</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'ds\');\">DS太阳城厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'og\');\">OG东方厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'dg\');\">DG皇冠厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'mg\');\">MG欧美厅</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/views/html/electronicGame.html\">电子游艺</a>\n	<ul style=\"right: 0\">\n		<li><a href=\"/views/html/electronicGame.html?gameType=cq9\">CQ9电子</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=mg\">MG电子</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=ag\">AG电子</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=agby\">AG捕鱼王II</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=bbin\">BBIN电子</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=pt\">PT电子</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/page/game-center.html\">彩票游戏</a>\n	<ul style=\"right: 0\">\n		<li><a href=\"/data/game/lhc/index.html\">六合彩49倍</a></li>\n		<li><a href=\"/data/game/bjkc/index.html\">北京PK10</a></li>\n		<li><a href=\"/data/game/cqssc/index.html\">重庆时时彩</a></li>\n		<li><a href=\"/data/game/pl3/index.html\">排列三</a></li>\n		<li><a href=\"/data/game/gdklsf/index.html\">广东快乐十分</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/views/html/baseMessage.html\">代理合作</a></li>\n	<li class=\"nav-list\"><a href=\"/views/html/youhui.html\">优惠活动</a></li>\n</ul>\n',119,'index_menu',0,0),
	(836,'<ul>\n	<li><a href=\"/views/main.html\">首页</a></li>\n	<li><a href=\"/views/html/sports.html\">体育赛事</a></li>\n	<li><a href=\"/views/html/LiveVideo.html\">真人娱乐</a></li>\n</ul>\n',120,'index_left_menu',0,0);

/*!40000 ALTER TABLE `cms_attr_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_template`;

CREATE TABLE `cms_template` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL COMMENT '模板名称',
  `template_path` varchar(255) DEFAULT NULL COMMENT '模板地址',
  `template_code` varchar(50) DEFAULT NULL COMMENT '模板的标识名称',
  `parent_id` bigint(11) NOT NULL COMMENT '父ID',
  `template_type` int(11) DEFAULT NULL COMMENT '模板类型1单个属性模板2集合属性模板',
  `html_path` varchar(255) DEFAULT NULL COMMENT '需要显示的HTML路径',
  `add_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  `operate_account` varchar(500) DEFAULT NULL COMMENT '操作人',
  `template_detail` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS模板信息表';

LOCK TABLES `cms_template` WRITE;
/*!40000 ALTER TABLE `cms_template` DISABLE KEYS */;

INSERT INTO `cms_template` (`id`, `template_name`, `template_path`, `template_code`, `parent_id`, `template_type`, `html_path`, `add_time`, `update_time`, `operate_account`, `template_detail`)
VALUES
	(42,'模板',NULL,NULL,0,NULL,NULL,'2017-05-23 16:54:51','2017-05-23 16:54:51','admin',NULL),
	(43,'PC端模块',NULL,NULL,42,NULL,'views/main.html','2017-05-23 16:55:21','2017-08-05 15:10:26','admin',NULL),
	(65,'页面ico图标','cmsftl/','page_title_logo',43,1,NULL,'2017-05-30 12:50:12','2018-04-18 16:19:19','admin','<link rel=\"shortcut icon\" href=\'${uploadFile}${index_title_logo_ico}\' type=\"image/x-ico\" />'),
	(77,'H5模块',NULL,NULL,42,NULL,NULL,'2017-05-31 19:41:45','2017-05-31 19:41:45','admin',NULL),
	(78,'H5优惠活动',NULL,NULL,77,NULL,'wap/yhhd/preferential.html','2017-05-31 19:42:31','2017-06-03 10:17:38','admin',NULL),
	(79,'H5优惠活动界面','cmsftl/','mobile_wap_youhui_index',78,2,'','2017-05-31 19:43:10','2018-04-18 18:51:30','admin','<style>\n    table th,tr,td{background:#faf6dd; text-align:center; border:1px solid #ddd; line-height:30px; color: #000}\n    .hd_cont_txtarea p{word-break:break-all;}\n</style>\n\n<#list listMap as cate>\n<div class=\"ui-panel-animate\">\n    <div class=\"app-list\">\n        <div class=\"app-list-box\">\n             <div onclick=\"showDetail(${cate_index})\">\n            <div class=\"list-tit\">\n                <h3>${cate.mobile_wap_youhui_title}</h3>\n                <p>${cate.mobile_wap_youhui_time}</p>\n            </div>\n            <div class=\"list-pic\">\n                <a >\n                    <img src=\"${uploadFile}${cate.mobile_wap_youhui_img}\">\n                </a>\n            </div>\n            <div class=\"join\">\n                <a>\n                    查看详情\n                    <span class=\"join-icon\"></span>\n                </a>\n            </div>\n            <div class=\"activity\" id=\"youhui_${cate_index}\" style=\"display: none\">\n\n                <div class=\"hd_cont_txtarea\">\n                  ${cate.mobile_wap_youhui_content}\n                </div>\n           </div>\n        </div>\n    </div>\n </div>\n</div>\n</#list>'),
	(82,'页面标题文本','cmsftl/','page_title_content',43,1,'','2017-06-03 14:21:11','2018-04-18 18:51:46','admin','<title>${page_title}</title>'),
	(88,'H5首页',NULL,NULL,77,NULL,NULL,'2017-06-09 21:15:49','2017-06-09 21:15:49','admin',NULL),
	(89,'H5首页头部信息','cmsftl/','mobile_include_head',88,1,NULL,'2017-06-09 21:16:41','2017-06-09 21:39:49','admin','<title>${app_title}</title>\n<meta name=\"apple-mobile-web-app-title\" content=\"${app_title}\">\n<!--#include virtual=\"/views/page_title_logo.html\"-->\n<link rel=\"apple-touch-icon\" href=\"${uploadFile}${app_logo}\">\n<script type=\"text/javascript\">\n    var app_config = {\n        \"appName\": \"${app_title}\",\n        \"appLogo\": \"${uploadFile}${mobile_index_log}\",\n        \"yhhdPath\": \"/wap/yhhd/preferential.html\",\n        \"zxkfPath\":\"${app_online_service}\",\r\n	\"iosPath\": \"${iosPath}\",\r\n	\"androidPath\": \"${androidPath}\",\n        <#if isDownload == \"0\">\"isDownload\": true,<#else>\"isDownload\": false,</#if>\r\n	\"redPacketPath\": \"${uploadFile}${redPacketPath}\",\n        \"downloadText\": \"${downloadText}\",\r\n	\"downloadLogo\": \"${uploadFile}${app_logo}\",\n        <#if isShowRedPacket== \"0\">\"isShowRedPacket\": true,<#else>\"isShowRedPacket\": false,</#if>\n        <#if isShowFloatRedPacket== \"0\">\"isShowFloatRedPacket\": true,<#else>\"isShowFloatRedPacket\": false,</#if>\n        \"isRedHref\": \"${isRedHref}\"\n    }\n</script>\n<!--#include virtual=\"/views/isReplacement.html\"-->'),
	(95,'H5轮播图','cmsftl/','wap_index_slider',88,2,NULL,'2017-06-13 17:26:03','2017-06-13 17:26:50','admin','<!--支持循环，需要重复图片节点-->\n<#list listMap as cate>\n    <#if !cate_has_next>\n        <div class=\"mui-slider-item mui-slider-item-duplicate\"><a href=\"${cate.mobile_bannner_href}\"><img src=\"${uploadFile}${cate.mobile_banner_pic}\"/></a></div>\n    </#if>\n</#list>\n<#list listMap as cate>\n    <div class=\"mui-slider-item\"><a href=\"${cate.mobile_bannner_href}\"><img src=\"${uploadFile}${cate.mobile_banner_pic}\"/></a></div>\n</#list>\n<#list listMap as cate>\n    <#if cate_index==0>\n        <div class=\"mui-slider-item mui-slider-item-duplicate\"><a href=\"${cate.mobile_bannner_href}\"><img src=\"${uploadFile}${cate.mobile_banner_pic}\"/></a></div>\n    </#if>\n</#list>'),
	(96,'购彩大厅LOGO','cmsftl/','game_center_logo',43,1,NULL,'2017-07-17 13:35:36','2017-07-17 13:35:36','admin','<a class=\"index-logo\" style=\"background: url(\'${uploadFile}${game_center_logo}\') no-repeat center left;background-size:100% \" href=\"${onclick_logo_href!\'\'}\"></a>'),
	(98,'在线客服链接','cmsftl/','online_service',43,1,NULL,'2017-07-19 00:43:55','2017-07-19 00:43:55','admin','<script type=\"text/javascript\">\n    $(function () {\n        $(\"a.online-service\").on(\"click\",function () {\n            layer.open({\n            type: 2,\n            title: \'在线客服\',\n            anim: 2,\n            shade: 0, //不显示遮罩\n            shadeClose: true, //开启遮罩关闭\n            area: [\'800px\', \'700px\'],\n            content:\'${onlineService}\',\n        });\n        })\n    })\n</script>'),
	(100,'H5首页链接地址','cmsftl/','mobile_index_url',88,1,NULL,'2017-09-12 20:56:55','2017-09-12 20:56:55','admin','var mobileIndex=\'${mobile_index_url}\''),
	(101,'用户中心额度转换','cmsftl/','isReplacement',43,1,NULL,'2017-09-27 19:05:40','2018-04-18 17:33:20','admin','<script type=\"text/javascript\">\n    var common_config = {\n         <#if isReplacement == \'0\'>\"isDP\": true,<#else>\"isDP\": false,</#if>\n         <#if isWzry== \'0\'>\"isWzry\": true,<#else>\"isWzry\": false,</#if>\n<#if  isShowRedPacket_1 ==  \"0\">\n\"isShowRedPacket\":  true\n<#else>\n\"isShowRedPacket\":  false\n</#if>\n    }\n</script>'),
	(104,'<meta> 搜索关键字描述','cmsftl/','meta',43,1,NULL,'2017-11-15 11:18:07','2017-11-15 11:18:07','admin','<meta name=\"description\" content=\"${meta_title_description}\" />\n<meta name=\"keywords\" content=\"${meta_title_keywords}\" />\n<meta name=\"title\" content=\"${meta_title_title}\" />'),
	(105,'购彩大厅右侧按钮','cmsftl/','online_download',43,1,NULL,'2017-11-22 03:03:48','2017-11-22 03:03:48','admin','${pagecenter_right_content}'),
	(106,'红包','cmsftl/','redPacket',43,1,NULL,'2018-04-12 13:57:59','2018-04-12 13:57:59','admin','<div class=\"redPacket_warp\" style=\"position:fixed;left:8px;bottom:0;background-image: url(\'${uploadFile}${redPacket_pic}\');background-size: 100%;background-repeat: no-repeat;width: 226px;height:202px;bottom:46px;background-position:center;\">\n  <a title=\"领取红包\" href=\"${redPacket_href}\" style=\"width: 202px;display:inline-block;height:100%\"></a>\n  <span title=\"关闭红包\" onclick=\"javascript:$(this).parent().hide()\" style=\"width: 28px;height: 28px;color: #fff;text-align: center;font-weight: bold;line-height: 28px;cursor: pointer;\"><i class=\"fa fa-times\" aria-hidden=\"true\"></i></span>\n</div>'),
	(107,'红包活动描述','cmsftl/','hongbao_desc',43,1,NULL,'2018-04-12 14:01:08','2018-04-12 14:01:08','admin','${hongbao_desc}'),
	(112,'H5手机体育模块','cmsftl/','sport_ele_live',88,2,NULL,'2018-04-18 18:11:58','2018-04-18 18:11:58','admin','[\n    <#list listMap as cate>\n<#if cate_has_next>\n  {\n    \"id\": \"${cate.json_id}\",\n    \"type\": \"${cate.json_type}\",\n    \"logoSrc\": \"${uploadFile}${cate.json_logoSrc}\",\n    \"styleSrc\": \"${uploadFile}${cate.json_styleSrc}\",\n    \"name\": \"${cate.json_name}\",\n    \"href\": \"${cate.json_href}\",\n    <#if cate.json_b == \"0\">\"_b\": true<#else>\"_b\": false</#if>\n  },\n<#else>\n {\n    \"id\": \"${cate.json_id}\",\n    \"type\": \"${cate.json_type}\",\n    \"logoSrc\": \"${uploadFile}${cate.json_logoSrc}\",\n    \"styleSrc\": \"${uploadFile}${cate.json_styleSrc}\",\n    \"name\": \"${cate.json_name}\",\n    \"href\": \"${cate.json_href}\",\n    <#if cate.json_b == \"0\">\"_b\": true<#else>\"_b\": false</#if>\n  }\n</#if>\n</#list>\n]'),
	(113,'PC端弹窗(公告)','cmsftl/','alertNotice',43,1,NULL,'2018-04-18 19:04:04','2018-04-18 19:04:04','admin','<style>\n.alert-notice-warp .layui-layer-content {\n     font-size: 16px;\n     color: #333;\n     line-height: 30px;\n     text-indent:24px;\n     padding: 2px 12px;\n     height:324px !important;\n}\n.alert-notice-warp .layui-layer-content img {\n    float:left;\n}\n</style>\n<script type=\"text/javascript\">\nif(${isShowAlert} === 0)\n{\n  if ($.cookie(\"alertShade\",{path:\"/\"}) != \'ok\') {\n    if (${isShowPic} === 0) {\n      layer.open({\n        skin: \'alert-notice-warp\',\n        title: \"${_title}\",\n        shadeClose: false,\n        type: 1,\n        area: [\'632px\',\'450px\'],\n        btn:\'关闭\',\n        content: \' <img style=\"width:100%;\" src=\"${uploadFile}${alertNotivePic}\" />\',\n        yes:function () {\n          $.cookie(\"alertShade\",\'ok\',{path:\"/\"});\n          layer.closeAll();\n        }\n      });\n    } else {\n      layer.open({\n        skin: \'alert-notice-warp\',\n        title: \"${_title}\",\n        shadeClose: false,\n        type: 1,\n        area: [\'632px\',\'324px\'],\n        btn:\'关闭\',\n        content: \'${alertNotiveContent}\',\n        yes:function () {\n          $.cookie(\"alertShade\",\'ok\',{path:\"/\"});\n          layer.closeAll();\n        }\n      });\n    }\n    $(\".layui-layer-close\").on(\'click\', function () {\n      $.cookie(\"alertShade\",\'ok\',{path:\"/\"});\n      layer.closeAll();\n    })\n  }\n}\n</script>'),
	(115,'APP模块',NULL,NULL,42,NULL,NULL,'2018-04-18 19:13:03','2018-04-18 19:13:03','admin',NULL),
	(116,'app体育真人模块','cmsftl/','SportsModule',115,2,NULL,'2018-04-18 19:14:48','2018-04-18 19:14:48','admin','[\n    <#list listMap as cate>\n<#if cate_has_next>\n  {\n    \"id\": \"${cate.gameId}\",\n    \"type\": \"${cate.type}\",\n    \"logoSrc\": \"${uploadFile}${cate.logoSrc}\",\n    \"styleSrc\": \"${uploadFile}${cate.styleSrc}\",\n    \"name\": \"${cate.name}\",\n    \"isHref\": \"${cate.isHref}\",\n    \"link\": \"${cate.link}\"\n  },\n<#else>\n {\n    \"id\": \"${cate.gameId}\",\n    \"type\": \"${cate.type}\",\n    \"logoSrc\": \"${uploadFile}${cate.logoSrc}\",\n    \"styleSrc\": \"${uploadFile}${cate.styleSrc}\",\n    \"name\": \"${cate.name}\",\n    \"isHref\": \"${cate.isHref}\",\n    \"link\": \"${cate.link}\"\n  }\n</#if>\n</#list>\n]'),
	(117,'浮窗','cmsftl/','float',43,1,NULL,'2018-09-18 20:09:02','2018-09-18 20:09:02','admin','<style>\n			.leftfloat,.rightfloat{z-index: 100000;font-size:0px;width: auto; position: absolute;top: 140px;}\n			.leftfloat{ left:5px; background: url(${uploadFile}${left_pic}) no-repeat;width:118px;height:409px;}\n			.leftfloat a,.rightfloat a{display: block; width: 100%; }\n			.rightfloat{right: 5px;background: url(${uploadFile}${right_pic}) no-repeat;width:118px;height:409px;}\n		</style>\n		<!--左浮窗-->\n		<div class=\"leftfloat\">\n		\n			<a onclick=\"javascript:$(this).parent().hide();\" style=\"    height: 30px;\n			position: absolute;\n			bottom: 0px;\"></a>\n		</div>\n		<!--右浮窗-->\n		<div class=\"rightfloat\">\n			<a class=\"online-service\" style=\"height: 235px;\"></a>\n			<a href=\"/views/html/register.html\"     style=\"height: 66px;\"> </a>\n		   <a onclick=\"javascript:$(this).parent().hide();\" style=\"    height: 30px;\n			position: absolute;\n			bottom: 0px;\"></a>\n		</div>'),
	(118,'首页logo','cmsftl/','index_logo',43,1,NULL,'2018-09-18 20:13:46','2018-09-18 20:13:46','admin','<a href=\"/views/main.html\"> <img src=\"${uploadFile}${index_logo_pic}\"></a>'),
	(119,'首页导航菜单','cmsftl/','index_menu',43,1,NULL,'2018-09-18 20:15:51','2018-09-18 20:15:51','admin','${index_menu}'),
	(120,'首页左侧导航','cmsftl/','index_left_menu',43,1,NULL,'2018-09-18 20:19:02','2018-09-18 20:19:02','admin','${index_left_menu}');

/*!40000 ALTER TABLE `cms_template` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `config_name` varchar(100) NOT NULL COMMENT '参数配置的名称',
  `config_key` varchar(100) NOT NULL COMMENT '参数配置的KEY',
  `config_value` varchar(100) NOT NULL COMMENT '参数配置的VALUE',
  `config_remark` varchar(1000) DEFAULT NULL COMMENT '参数配置的备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='参数配置信息表(数据字典)';

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;

INSERT INTO `config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_remark`)
VALUES
	(156,'system_config','default_upload_file','/views/image/','默认文件上传路径'),
	(157,'system_config','default_cms_html','/views/','默认CMS编译HTML路径'),
	(158,'system_config','tiny_api_key','dnGHOC34I1Ko39OUmS_MnlXzwn5brc06','tiny图片压缩API_KEY'),
	(160,'system_config','is_bound_google_auth','0','是否开启google身份验证'),
	(161,'system_config','google_auth_account','-1','google验证码账号'),
	(162,'system_config','google_auth_secret','-1','google验证码密钥');

/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table doc_content
# ------------------------------------------------------------

DROP TABLE IF EXISTS `doc_content`;

CREATE TABLE `doc_content` (
  `doc_id` int(11) DEFAULT NULL,
  `doc_name` varchar(300) DEFAULT NULL,
  `doc_url` varchar(300) DEFAULT NULL,
  `doc_remark` varchar(3000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table esports_match
# ------------------------------------------------------------

DROP TABLE IF EXISTS `esports_match`;

CREATE TABLE `esports_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_type_id` int(11) NOT NULL COMMENT '赛事类型ID',
  `rules_name` varchar(50) DEFAULT NULL COMMENT '赛事规则',
  `bo` int(2) DEFAULT NULL COMMENT '赛事总局数',
  `match_name` varchar(256) DEFAULT NULL COMMENT '比赛名称',
  `match_date` datetime DEFAULT NULL COMMENT '比赛时间',
  `team_h` varchar(256) DEFAULT NULL COMMENT '主队',
  `team_c` varchar(256) DEFAULT NULL COMMENT '客队',
  `score_h` int(3) DEFAULT NULL COMMENT '主队比分',
  `score_c` int(3) DEFAULT NULL COMMENT '客队比分',
  `h_logo` varchar(500) DEFAULT NULL COMMENT '主队头像',
  `c_logo` varchar(500) DEFAULT NULL COMMENT '客队头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `esports_match_id_idx` (`id`) USING BTREE,
  KEY `esports_match_match_type_id` (`match_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='esports_match(王者荣耀赛事表)';

LOCK TABLES `esports_match` WRITE;
/*!40000 ALTER TABLE `esports_match` DISABLE KEYS */;

INSERT INTO `esports_match` (`id`, `match_type_id`, `rules_name`, `bo`, `match_name`, `match_date`, `team_h`, `team_c`, `score_h`, `score_c`, `h_logo`, `c_logo`)
VALUES
	(420,4774,'7局4胜',7,'BA黑凤梨 VS RNG.M','2018-06-10 19:00:00','BA黑凤梨','RNG.M',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/f44fc6add49e2ae7a5eb1d4f5bc982ea.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/ea59c08ed235036563b42d4875eefab0.png'),
	(577,4773,'5局3胜',5,'JC VS YTG','2018-05-03 17:00:00','JC','YTG',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/f2561c905d22687694237fd2ecf2de9f.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a121434a6da7a46bd1e57cda6b88f9bf.png'),
	(578,4773,'5局3胜',5,'eStar Pro VS AG超玩会','2018-05-03 19:30:00','eStar Pro','AG超玩会',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/e6705f683f5e124c88eee11fe1fff28d.png'),
	(579,4773,'5局3胜',5,'WF.D VS BA黑凤梨','2018-05-04 19:30:00','WF.D','BA黑凤梨',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/8d9115b82663ade0498bf42a11f4b864.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/f44fc6add49e2ae7a5eb1d4f5bc982ea.png'),
	(580,4773,'5局3胜',5,'QGhappy VS XQ','2018-05-05 19:30:00','QGhappy','XQ',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/7ab7a84c5cd9d0c63fbb5a4ef15cd128.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a7278caa44639843f27527a8f792eefe.png'),
	(581,4773,'5局3胜',5,'eStar Pro VS WF.D','2018-05-06 19:30:00','eStar Pro','WF.D',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/8d9115b82663ade0498bf42a11f4b864.png'),
	(582,4773,'5局3胜',5,'Hero久竞 VS BA黑凤梨','2018-05-09 14:30:00','Hero久竞','BA黑凤梨',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/d1ba99589f0bb7f1965d888b5099f351.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/f44fc6add49e2ae7a5eb1d4f5bc982ea.png'),
	(583,4773,'5局3胜',5,'JC VS GK','2018-05-09 17:00:00','JC','GK',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/f2561c905d22687694237fd2ecf2de9f.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a30287a729c96d6099150ccae6dd1214.png'),
	(584,4773,'5局3胜',5,'EDG.M VS YTG','2018-05-09 19:30:00','EDG.M','YTG',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/21224bee566a3c3c70ff87b874e1c0ec.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a121434a6da7a46bd1e57cda6b88f9bf.png'),
	(585,4773,'5局3胜',5,'RNG.M VS AG超玩会','2018-05-10 17:00:00','RNG.M','AG超玩会',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/ea59c08ed235036563b42d4875eefab0.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/e6705f683f5e124c88eee11fe1fff28d.png'),
	(586,4773,'5局3胜',5,'JC VS QGhappy','2018-05-10 19:30:00','JC','QGhappy',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/f2561c905d22687694237fd2ecf2de9f.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/7ab7a84c5cd9d0c63fbb5a4ef15cd128.png'),
	(587,4773,'5局3胜',5,'WF.D VS EDG.M','2018-05-11 17:00:00','WF.D','EDG.M',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/8d9115b82663ade0498bf42a11f4b864.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/21224bee566a3c3c70ff87b874e1c0ec.png'),
	(588,4773,'5局3胜',5,'Hero久竞 VS eStar Pro','2018-05-11 19:30:00','Hero久竞','eStar Pro',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/d1ba99589f0bb7f1965d888b5099f351.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png'),
	(589,4773,'5局3胜',5,'RNG.M VS YTG','2018-05-12 17:00:00','RNG.M','YTG',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/ea59c08ed235036563b42d4875eefab0.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a121434a6da7a46bd1e57cda6b88f9bf.png'),
	(590,4773,'5局3胜',5,'GK VS QGhappy','2018-05-12 19:30:00','GK','QGhappy',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a30287a729c96d6099150ccae6dd1214.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/7ab7a84c5cd9d0c63fbb5a4ef15cd128.png'),
	(591,4773,'5局3胜',5,'JC VS Hero久竞','2018-05-13 14:30:00','JC','Hero久竞',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/f2561c905d22687694237fd2ecf2de9f.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/d1ba99589f0bb7f1965d888b5099f351.png'),
	(592,4773,'5局3胜',5,'WF.D VS AG超玩会','2018-05-13 17:00:00','WF.D','AG超玩会',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/8d9115b82663ade0498bf42a11f4b864.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/e6705f683f5e124c88eee11fe1fff28d.png'),
	(593,4773,'5局3胜',5,'BA黑凤梨 VS XQ','2018-05-13 19:30:00','BA黑凤梨','XQ',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/f44fc6add49e2ae7a5eb1d4f5bc982ea.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a7278caa44639843f27527a8f792eefe.png'),
	(594,4773,'5局3胜',5,'YTG VS eStar Pro','2018-05-16 17:00:00','YTG','eStar Pro',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a121434a6da7a46bd1e57cda6b88f9bf.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png'),
	(595,4773,'5局3胜',5,'RNG.M VS XQ','2018-05-16 19:30:00','RNG.M','XQ',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/ea59c08ed235036563b42d4875eefab0.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a7278caa44639843f27527a8f792eefe.png'),
	(596,4773,'5局3胜',5,'WF.D VS Hero久竞','2018-05-17 17:00:00','WF.D','Hero久竞',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/8d9115b82663ade0498bf42a11f4b864.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/d1ba99589f0bb7f1965d888b5099f351.png'),
	(597,4773,'5局3胜',5,'AG超玩会 VS QGhappy','2018-05-17 19:30:00','AG超玩会','QGhappy',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/e6705f683f5e124c88eee11fe1fff28d.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/7ab7a84c5cd9d0c63fbb5a4ef15cd128.png'),
	(598,4773,'5局3胜',5,'BA黑凤梨 VS GK','2018-05-18 17:00:00','BA黑凤梨','GK',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/f44fc6add49e2ae7a5eb1d4f5bc982ea.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a30287a729c96d6099150ccae6dd1214.png'),
	(599,4773,'5局3胜',5,'JC VS eStar Pro','2018-05-18 19:30:00','JC','eStar Pro',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/f2561c905d22687694237fd2ecf2de9f.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png'),
	(600,4773,'5局3胜',5,'EDG.M VS Hero久竞','2018-05-19 17:00:00','EDG.M','Hero久竞',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/21224bee566a3c3c70ff87b874e1c0ec.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/d1ba99589f0bb7f1965d888b5099f351.png'),
	(601,4773,'5局3胜',5,'YTG VS QGhappy','2018-05-19 19:30:00','YTG','QGhappy',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a121434a6da7a46bd1e57cda6b88f9bf.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/7ab7a84c5cd9d0c63fbb5a4ef15cd128.png'),
	(602,4773,'5局3胜',5,'JC VS RNG.M','2018-05-20 14:30:00','JC','RNG.M',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/f2561c905d22687694237fd2ecf2de9f.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/ea59c08ed235036563b42d4875eefab0.png'),
	(603,4773,'5局3胜',5,'AG超玩会 VS eStar Pro','2018-05-20 17:00:00','AG超玩会','eStar Pro',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/e6705f683f5e124c88eee11fe1fff28d.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png'),
	(604,4773,'5局3胜',5,'WF.D VS XQ','2018-05-20 19:30:00','WF.D','XQ',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/8d9115b82663ade0498bf42a11f4b864.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a7278caa44639843f27527a8f792eefe.png'),
	(605,4773,'5局3胜',5,'RNG.M VS BA黑凤梨','2018-05-23 17:00:00','RNG.M','BA黑凤梨',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/ea59c08ed235036563b42d4875eefab0.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/f44fc6add49e2ae7a5eb1d4f5bc982ea.png'),
	(606,4773,'5局3胜',5,'GK VS EDG.M','2018-05-23 19:30:00','GK','EDG.M',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a30287a729c96d6099150ccae6dd1214.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/21224bee566a3c3c70ff87b874e1c0ec.png'),
	(607,4773,'5局3胜',5,'Hero久竞 VS EDG.M','2018-05-24 14:30:00','Hero久竞','EDG.M',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/d1ba99589f0bb7f1965d888b5099f351.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/21224bee566a3c3c70ff87b874e1c0ec.png'),
	(608,4773,'5局3胜',5,'XQ VS AG超玩会','2018-05-24 17:00:00','XQ','AG超玩会',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a7278caa44639843f27527a8f792eefe.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/e6705f683f5e124c88eee11fe1fff28d.png'),
	(609,4773,'5局3胜',5,'eStar Pro VS YTG','2018-05-24 19:30:00','eStar Pro','YTG',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a121434a6da7a46bd1e57cda6b88f9bf.png'),
	(610,4773,'5局3胜',5,'RNG.M VS JC','2018-05-25 17:00:00','RNG.M','JC',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/ea59c08ed235036563b42d4875eefab0.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/f2561c905d22687694237fd2ecf2de9f.png'),
	(611,4773,'5局3胜',5,'GK VS WF.D','2018-05-25 19:30:00','GK','WF.D',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a30287a729c96d6099150ccae6dd1214.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/8d9115b82663ade0498bf42a11f4b864.png'),
	(612,4773,'5局3胜',5,'BA黑凤梨 VS YTG','2018-05-26 17:00:00','BA黑凤梨','YTG',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/f44fc6add49e2ae7a5eb1d4f5bc982ea.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a121434a6da7a46bd1e57cda6b88f9bf.png'),
	(613,4773,'5局3胜',5,'XQ VS EDG.M','2018-05-26 19:30:00','XQ','EDG.M',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a7278caa44639843f27527a8f792eefe.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/21224bee566a3c3c70ff87b874e1c0ec.png'),
	(614,4773,'5局3胜',5,'AG超玩会 VS WF.D','2018-05-27 17:00:00','AG超玩会','WF.D',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/e6705f683f5e124c88eee11fe1fff28d.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/8d9115b82663ade0498bf42a11f4b864.png'),
	(615,4773,'5局3胜',5,'eStar Pro VS RNG.M','2018-05-27 19:30:00','eStar Pro','RNG.M',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/ea59c08ed235036563b42d4875eefab0.png'),
	(618,4773,'5局3胜',5,'西部明星队 VS 东部明星队','2018-05-05 17:00:00','西部明星队','东部明星队',NULL,NULL,'//idcgzhcos-10014007.file.myqcloud.com/media/gzhoss/image/b4bc39b84958a645999cda1cbcf54ee0.png','//idcgzhcos-10014007.file.myqcloud.com/media/gzhoss/image/b4bc39b84958a645999cda1cbcf54ee0.png'),
	(621,4773,'5局3胜',5,'东部明星队 VS 西部明星队','2018-05-05 17:00:00','东部明星队','西部明星队',NULL,NULL,'//idcgzhcos-10014007.file.myqcloud.com/media/gzhoss/image/b4bc39b84958a645999cda1cbcf54ee0.png','//idcgzhcos-10014007.file.myqcloud.com/media/gzhoss/image/b4bc39b84958a645999cda1cbcf54ee0.png'),
	(623,4773,'5局3胜',5,'西部梦之队 VS 东部猫之队','2018-05-05 16:30:00','西部梦之队','东部猫之队',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180502/0fc2e275a18cdfdeac03fab8ddd67e38.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180502/17b3c1cb99b05d59928f8fb5cce57fe1.png'),
	(625,4773,NULL,3,'aaa VS bbb','2018-07-05 14:28:00','aaa','bbb',NULL,NULL,NULL,NULL),
	(626,4773,'5局4胜',5,'aaa2 VS bbb2','2018-07-05 14:30:00','aaa2','bbb2',NULL,NULL,NULL,NULL),
	(627,4773,NULL,5,'test1 VS test2','2018-08-10 19:15:00','test1','test2',NULL,NULL,NULL,NULL),
	(628,4773,NULL,5,'A VS B','2018-08-10 10:00:00','A','B',NULL,NULL,NULL,NULL),
	(629,4773,NULL,5,'TESTA VS TESTB','2018-07-30 20:00:00','TESTA','TESTB',NULL,NULL,NULL,NULL),
	(630,4773,NULL,5,'teseA VS teseB','2018-06-22 10:44:00','teseA','teseB',NULL,NULL,NULL,NULL),
	(631,4774,'7局4胜',7,'JC VS GK','2018-06-07 19:00:00','JC','GK',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/f2561c905d22687694237fd2ecf2de9f.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a30287a729c96d6099150ccae6dd1214.png'),
	(632,4774,'7局4胜',7,'Hero久竞 VS XQ','2018-06-08 19:00:00','Hero久竞','XQ',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180305/d1ba99589f0bb7f1965d888b5099f351.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/a7278caa44639843f27527a8f792eefe.png'),
	(633,4774,'7局4胜',7,'eStar Pro VS EDG.M','2018-06-09 19:00:00','eStar Pro','EDG.M',NULL,NULL,'//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20180306/8ebccd5e5bdfe61a27560f01e1b8a131.png','//imgcache-1251786003.image.myqcloud.com/media/gzhoss/image/20171024/21224bee566a3c3c70ff87b874e1c0ec.png'),
	(635,4774,'7局4胜制',7,'testAA VS testBB','2018-06-11 17:00:00','testAA','testBB',NULL,NULL,NULL,NULL),
	(636,4774,'7局4胜',7,'红烧茄子 VS 油闷大虾','2018-06-12 19:30:00','红烧茄子','油闷大虾',NULL,NULL,'',''),
	(639,4774,'7局4胜',7,'test111 VS test222','2018-06-15 19:00:00','test111','test222',NULL,NULL,NULL,NULL),
	(640,4774,'7局4胜制',7,'DDDD VS SSSS','2018-07-01 14:31:00','DDDD','SSSS',NULL,NULL,'','');

/*!40000 ALTER TABLE `esports_match` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table esports_match_result
# ------------------------------------------------------------

DROP TABLE IF EXISTS `esports_match_result`;

CREATE TABLE `esports_match_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `match_id` int(11) NOT NULL COMMENT '赛事id',
  `team_h` varchar(256) DEFAULT NULL COMMENT '主队',
  `team_c` varchar(256) DEFAULT NULL COMMENT '客队',
  `round` int(2) DEFAULT NULL COMMENT '第几局',
  `match_date` datetime DEFAULT NULL COMMENT '比赛时间',
  `avaiable` tinyint(1) DEFAULT '1' COMMENT '是否启用 1：启用  0：禁用 （启用的比赛才展示在前台界面）',
  `end_status` tinyint(1) DEFAULT '0' COMMENT '0：未结束 1：已结束',
  `not_show_type` varchar(256) DEFAULT NULL COMMENT '不展示玩法类型',
  `valid` tinyint(1) DEFAULT '1' COMMENT '比赛是否无效  1：有效  0：无效（如5局3胜制的比赛，3:0就结束了，可以设置第4局和第5局比赛为无效，或者其他因一些外部原因导致的比赛无效也更改此字段，结算的时候应该退还下注金额给用户）',
  `duration` varchar(256) DEFAULT NULL COMMENT '比赛时长',
  `win_team` varchar(256) DEFAULT NULL COMMENT '单局获胜战队',
  `score_h` int(3) DEFAULT NULL COMMENT '主队比分',
  `score_c` int(3) DEFAULT NULL COMMENT '客队比分',
  `first_blood_team` varchar(256) DEFAULT NULL COMMENT '一血战队（取得第一个人头的战队）',
  `first_tower_team` varchar(256) DEFAULT NULL COMMENT '一塔战队（获取第一座塔的战队）',
  `first_big_dragon_team` varchar(256) DEFAULT NULL COMMENT '获取第一只大龙（主宰）的队伍',
  `first_small_dragon_team` varchar(256) DEFAULT NULL COMMENT '获取第一只小龙（主宰）的战队',
  `h_killers` int(11) DEFAULT NULL COMMENT '主队击杀数（人头数）',
  `c_killers` int(11) DEFAULT NULL COMMENT '客队击杀数（人头数）',
  `h_assists` int(11) DEFAULT NULL COMMENT '主队助攻数',
  `c_assists` int(11) DEFAULT NULL COMMENT '客队助攻数',
  `h_towers` int(11) DEFAULT NULL COMMENT '主队破塔数',
  `c_towers` int(11) DEFAULT NULL COMMENT '客队破塔数',
  `h_money` int(11) DEFAULT NULL COMMENT '主队经济',
  `c_money` int(11) DEFAULT NULL COMMENT '客队经济',
  `first_arrive_kill_num` varchar(256) DEFAULT NULL COMMENT '率先获得指定击杀数的战队',
  `team_member_kill_win` varchar(256) DEFAULT NULL COMMENT '明星队员击杀获胜者',
  `close_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '封盘时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `esports_match_detail_id_idx` (`id`) USING BTREE,
  KEY `esports_match_detail_match_id_idx` (`match_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='esports_match_detail(王者荣耀比赛详情，即单局比赛表)';

LOCK TABLES `esports_match_result` WRITE;
/*!40000 ALTER TABLE `esports_match_result` DISABLE KEYS */;

INSERT INTO `esports_match_result` (`id`, `match_id`, `team_h`, `team_c`, `round`, `match_date`, `avaiable`, `end_status`, `not_show_type`, `valid`, `duration`, `win_team`, `score_h`, `score_c`, `first_blood_team`, `first_tower_team`, `first_big_dragon_team`, `first_small_dragon_team`, `h_killers`, `c_killers`, `h_assists`, `c_assists`, `h_towers`, `c_towers`, `h_money`, `c_money`, `first_arrive_kill_num`, `team_member_kill_win`, `close_date`)
VALUES
	(82,550,'XQ','YTG',3,'2018-04-14 18:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(83,550,'XQ','YTG',4,'2018-04-14 18:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(84,550,'XQ','YTG',5,'2018-04-14 19:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(85,575,'WF.D','RNG.M',0,'2018-05-02 17:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(86,575,'WF.D','RNG.M',1,'2018-05-02 17:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(87,575,'WF.D','RNG.M',2,'2018-05-02 17:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(88,575,'WF.D','RNG.M',3,'2018-05-02 18:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(89,575,'WF.D','RNG.M',4,'2018-05-02 18:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(90,575,'WF.D','RNG.M',5,'2018-05-02 19:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(91,577,'JC','YTG',0,'2018-05-03 17:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(92,577,'JC','YTG',1,'2018-05-03 17:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(93,577,'JC','YTG',2,'2018-05-03 17:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(94,577,'JC','YTG',3,'2018-05-03 18:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(95,577,'JC','YTG',4,'2018-05-03 18:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(96,577,'JC','YTG',5,'2018-05-03 19:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(97,578,'eStar Pro','AG超玩会',0,'2018-05-03 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(98,578,'eStar Pro','AG超玩会',1,'2018-05-03 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(99,578,'eStar Pro','AG超玩会',2,'2018-05-03 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(100,578,'eStar Pro','AG超玩会',3,'2018-05-03 20:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(101,578,'eStar Pro','AG超玩会',4,'2018-05-03 21:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(102,578,'eStar Pro','AG超玩会',5,'2018-05-03 21:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(103,579,'WF.D','BA黑凤梨',0,'2018-05-04 19:30:00',0,1,'',0,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(104,579,'WF.D','BA黑凤梨',1,'2018-05-04 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(105,579,'WF.D','BA黑凤梨',2,'2018-05-04 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(106,579,'WF.D','BA黑凤梨',3,'2018-05-04 20:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(107,579,'WF.D','BA黑凤梨',4,'2018-05-04 21:00:00',0,0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(108,579,'WF.D','BA黑凤梨',5,'2018-05-04 21:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(109,588,'Hero久竞','eStar Pro',1,'2018-05-04 19:41:00',0,1,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(110,615,'eStar Pro','RNG.M',0,'2018-05-27 19:30:00',1,0,'',1,'17:00','eStar Pro',NULL,NULL,'eStar Pro','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(111,615,'eStar Pro','RNG.M',1,'2018-05-27 19:30:00',1,0,'',1,'18:00','eStar Pro',1,0,'eStar Pro','','eStar Pro','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eStar Pro','NONE',NULL),
	(112,615,'eStar Pro','RNG.M',2,'2018-05-27 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(113,615,'eStar Pro','RNG.M',3,'2018-05-27 20:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(114,615,'eStar Pro','RNG.M',4,'2018-05-27 21:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(115,615,'eStar Pro','RNG.M',5,'2018-05-27 21:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(116,614,'AG超玩会','WF.D',0,'2018-05-27 17:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(117,614,'AG超玩会','WF.D',1,'2018-05-27 17:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(118,614,'AG超玩会','WF.D',2,'2018-05-27 17:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(119,614,'AG超玩会','WF.D',3,'2018-05-27 18:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(120,614,'AG超玩会','WF.D',4,'2018-05-27 18:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(121,614,'AG超玩会','WF.D',5,'2018-05-27 19:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(122,613,'XQ','EDG.M',0,'2018-05-26 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(123,613,'XQ','EDG.M',1,'2018-05-26 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(124,613,'XQ','EDG.M',2,'2018-05-26 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(125,613,'XQ','EDG.M',3,'2018-05-26 20:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(126,613,'XQ','EDG.M',4,'2018-05-26 21:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(127,613,'XQ','EDG.M',5,'2018-05-26 21:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(128,624,'11111','22222',0,'2018-05-09 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(129,624,'11111','22222',1,'2018-05-09 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(130,624,'11111','22222',2,'2018-05-09 20:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(131,624,'11111','22222',3,'2018-05-09 21:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(132,624,'11111','22222',4,'2018-05-09 21:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(133,624,'11111','22222',5,'2018-05-09 22:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(134,594,'YTG','eStar Pro',0,'2018-05-16 17:00:00',1,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(135,594,'YTG','eStar Pro',1,'2018-05-16 17:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(136,594,'YTG','eStar Pro',2,'2018-05-16 17:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(137,594,'YTG','eStar Pro',3,'2018-05-16 18:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(138,594,'YTG','eStar Pro',4,'2018-05-16 18:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(139,594,'YTG','eStar Pro',5,'2018-05-16 19:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(140,597,'AG超玩会','QGhappy',0,'2018-05-17 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(141,597,'AG超玩会','QGhappy',1,'2018-05-17 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(142,597,'AG超玩会','QGhappy',2,'2018-05-17 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(143,597,'AG超玩会','QGhappy',3,'2018-05-17 20:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(144,597,'AG超玩会','QGhappy',4,'2018-05-17 21:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(145,597,'AG超玩会','QGhappy',5,'2018-05-17 21:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(150,626,'aaa2','bbb2',0,'2018-07-05 14:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(151,626,'aaa2','bbb2',1,'2018-07-05 14:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(152,626,'aaa2','bbb2',2,'2018-07-05 15:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(153,626,'aaa2','bbb2',3,'2018-07-05 15:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(154,626,'aaa2','bbb2',4,'2018-07-05 16:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(155,626,'aaa2','bbb2',5,'2018-07-05 16:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(156,627,'test1','test2',0,'2018-08-10 19:15:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(157,627,'test1','test2',1,'2018-08-10 19:15:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(158,627,'test1','test2',2,'2018-08-10 19:45:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(159,627,'test1','test2',3,'2018-08-10 20:15:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(160,627,'test1','test2',4,'2018-08-10 20:45:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(161,627,'test1','test2',5,'2018-08-10 21:15:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(162,628,'A','B',0,'2018-08-10 10:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(163,628,'A','B',1,'2018-08-10 10:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(164,628,'A','B',2,'2018-08-10 10:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(165,628,'A','B',3,'2018-08-10 11:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(166,628,'A','B',4,'2018-08-10 11:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(167,628,'A','B',5,'2018-08-10 12:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(168,629,'TESTA','TESTB',0,'2018-07-30 20:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(169,629,'TESTA','TESTB',1,'2018-07-30 20:00:00',1,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','INVALID',NULL),
	(170,629,'TESTA','TESTB',2,'2018-07-30 20:30:00',1,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(171,629,'TESTA','TESTB',3,'2018-07-30 21:00:00',1,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(172,629,'TESTA','TESTB',4,'2018-07-30 21:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(173,629,'TESTA','TESTB',5,'2018-07-30 22:00:00',1,0,'',0,'','TESTA',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(174,630,'teseA','teseB',0,'2018-06-02 10:44:00',1,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(175,630,'teseA','teseB',1,'2018-06-02 10:44:00',1,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(176,630,'teseA','teseB',2,'2018-06-22 11:14:00',0,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','INVALID',NULL),
	(177,630,'teseA','teseB',3,'2018-06-22 11:44:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(178,630,'teseA','teseB',4,'2018-06-22 12:14:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(179,630,'teseA','teseB',5,'2018-06-22 12:44:00',1,0,'',0,'','teseA',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(180,631,'JC','GK',0,'2018-06-07 19:00:00',1,0,'',1,'','JC',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(181,631,'JC','GK',1,'2018-06-07 19:00:00',1,0,'',1,'','JC',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(182,631,'JC','GK',2,'2018-06-07 19:30:00',1,0,'',1,'','JC',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(183,631,'JC','GK',3,'2018-06-07 20:00:00',1,0,'',1,'','JC',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(184,631,'JC','GK',4,'2018-06-07 20:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(185,631,'JC','GK',5,'2018-06-07 21:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(186,631,'JC','GK',6,'2018-06-07 21:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(187,631,'JC','GK',7,'2018-06-07 22:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(188,632,'Hero久竞','XQ',0,'2018-06-08 19:00:00',1,0,'',1,'','Hero久竞',4,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(189,632,'Hero久竞','XQ',1,'2018-06-08 19:00:00',0,1,'',1,'','Hero久竞',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(190,632,'Hero久竞','XQ',2,'2018-06-08 19:30:00',0,1,'',1,'','Hero久竞',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(191,632,'Hero久竞','XQ',3,'2018-06-08 20:00:00',0,1,'',1,'','Hero久竞',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(192,632,'Hero久竞','XQ',4,'2018-06-08 20:30:00',0,1,'',1,'','XQ',0,1,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(193,632,'Hero久竞','XQ',5,'2018-06-08 21:00:00',0,1,'',1,'','XQ',0,1,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(194,632,'Hero久竞','XQ',6,'2018-06-08 21:30:00',0,1,'',1,'','XQ',0,1,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(195,632,'Hero久竞','XQ',7,'2018-06-08 22:00:00',0,1,'',1,'','Hero久竞',1,0,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(196,633,'eStar Pro','EDG.M',0,'2018-06-09 19:00:00',0,1,'',1,'','EDG.M',3,4,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(197,633,'eStar Pro','EDG.M',1,'2018-06-09 19:00:00',0,1,'',1,'20:00','eStar Pro',1,0,'EDG.M','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eStar Pro','李四',NULL),
	(198,633,'eStar Pro','EDG.M',2,'2018-06-09 19:30:00',0,1,'',1,'20:00','EDG.M',0,1,'eStar Pro','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','张三',NULL),
	(199,633,'eStar Pro','EDG.M',3,'2018-06-09 20:00:00',0,1,'',1,'20:00','EDG.M',0,1,'eStar Pro','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','李四',NULL),
	(200,633,'eStar Pro','EDG.M',4,'2018-06-09 20:30:00',0,1,'',1,'20:00','eStar Pro',1,0,'EDG.M','','eStar Pro','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','张三',NULL),
	(201,633,'eStar Pro','EDG.M',5,'2018-06-09 21:00:00',0,1,'',1,'21:00','eStar Pro',1,0,'EDG.M','','eStar Pro','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','张三',NULL),
	(202,633,'eStar Pro','EDG.M',6,'2018-06-09 21:30:00',0,1,'',1,'20:00','EDG.M',0,1,'EDG.M','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','李四',NULL),
	(203,633,'eStar Pro','EDG.M',7,'2018-06-09 22:00:00',0,1,'',1,'15:00','EDG.M',0,1,'EDG.M','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','李四',NULL),
	(204,634,'BA黑凤梨','RNG.M',0,'2018-06-10 19:00:00',0,0,'',1,'','RNG.M',0,4,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(205,634,'BA黑凤梨','RNG.M',1,'2018-06-10 19:00:00',0,0,'',1,'','RNG.M',0,1,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(206,634,'BA黑凤梨','RNG.M',2,'2018-06-10 19:30:00',0,0,'',1,'','RNG.M',0,1,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(207,634,'BA黑凤梨','RNG.M',3,'2018-06-10 20:00:00',0,0,'',1,'','RNG.M',0,1,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(208,634,'BA黑凤梨','RNG.M',4,'2018-06-10 20:30:00',0,0,'',1,'','RNG.M',0,1,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(209,634,'BA黑凤梨','RNG.M',5,'2018-06-10 21:00:00',0,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(210,634,'BA黑凤梨','RNG.M',6,'2018-06-10 21:30:00',0,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(211,634,'BA黑凤梨','RNG.M',7,'2018-06-10 22:00:00',0,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(212,635,'testAA','testBB',0,'2018-06-11 17:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(213,635,'testAA','testBB',1,'2018-06-11 17:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(214,635,'testAA','testBB',2,'2018-06-11 17:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(215,635,'testAA','testBB',3,'2018-06-11 18:00:00',0,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(216,635,'testAA','testBB',4,'2018-06-11 18:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(217,635,'testAA','testBB',5,'2018-06-11 19:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(218,635,'testAA','testBB',6,'2018-06-11 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(219,635,'testAA','testBB',7,'2018-06-11 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(220,636,'红烧茄子','油闷大虾',0,'2018-06-12 19:30:00',0,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(221,636,'红烧茄子','油闷大虾',1,'2018-06-12 19:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(222,636,'红烧茄子','油闷大虾',2,'2018-06-12 20:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(223,636,'红烧茄子','油闷大虾',3,'2018-06-12 20:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(224,636,'红烧茄子','油闷大虾',4,'2018-06-12 21:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(225,636,'红烧茄子','油闷大虾',5,'2018-06-12 21:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(226,636,'红烧茄子','油闷大虾',6,'2018-06-12 22:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(227,636,'红烧茄子','油闷大虾',7,'2018-06-12 22:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(228,637,'test001','test002',0,'2018-06-13 21:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(229,637,'test001','test002',1,'2018-06-13 21:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(230,637,'test001','test002',2,'2018-06-13 21:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(231,637,'test001','test002',3,'2018-06-13 22:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(232,637,'test001','test002',4,'2018-06-13 22:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(233,637,'test001','test002',5,'2018-06-13 23:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(234,637,'test001','test002',6,'2018-06-13 23:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(235,637,'test001','test002',7,'2018-06-14 00:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(236,638,'test','develop',0,'2018-06-14 18:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(237,638,'test','develop',1,'2018-06-14 18:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(238,638,'test','develop',2,'2018-06-14 19:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(239,638,'test','develop',3,'2018-06-14 19:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(240,638,'test','develop',4,'2018-06-14 20:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(241,638,'test','develop',5,'2018-06-14 20:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(242,638,'test','develop',6,'2018-06-14 21:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(243,638,'test','develop',7,'2018-06-14 21:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(244,639,'test111','test222',0,'2018-06-15 19:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(245,639,'test111','test222',1,'2018-06-15 19:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(246,639,'test111','test222',2,'2018-06-15 19:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(247,639,'test111','test222',3,'2018-06-15 20:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(248,639,'test111','test222',4,'2018-06-15 20:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(249,639,'test111','test222',5,'2018-06-15 21:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(250,639,'test111','test222',6,'2018-06-15 21:30:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(251,639,'test111','test222',7,'2018-06-15 22:00:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(252,640,'DDDD','SSSS',0,'2018-07-01 14:31:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(253,640,'DDDD','SSSS',1,'2018-07-01 14:31:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(254,640,'DDDD','SSSS',2,'2018-07-01 15:01:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(255,640,'DDDD','SSSS',3,'2018-07-01 15:31:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(256,640,'DDDD','SSSS',4,'2018-07-01 16:01:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(257,640,'DDDD','SSSS',5,'2018-07-01 16:31:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(258,640,'DDDD','SSSS',6,'2018-07-01 17:01:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(259,640,'DDDD','SSSS',7,'2018-07-01 17:31:00',1,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(987,419,'eStar Pro','EDG.M',0,'2018-06-09 19:40:00',0,1,'',1,'','EDG.M',3,4,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(988,419,'eStar Pro','EDG.M',1,'2018-06-09 19:40:00',0,1,'',1,'','eStar Pro',1,0,'EDG.M','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eStar Pro','EDGM.初晨',NULL),
	(989,419,'eStar Pro','EDG.M',2,'2018-06-09 20:27:00',0,1,'',1,'','EDG.M',0,1,'eStar Pro','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','eStarPro.诺言',NULL),
	(990,419,'eStar Pro','EDG.M',3,'2018-06-09 21:00:00',0,1,'',1,'','EDG.M',0,1,'eStar Pro','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','EDGM.初晨',NULL),
	(991,419,'eStar Pro','EDG.M',4,'2018-06-09 21:50:00',0,1,'',1,'','eStar Pro',1,0,'EDG.M','','eStar Pro','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','eStarPro.诺言',NULL),
	(992,419,'eStar Pro','EDG.M',5,'2018-06-09 22:20:00',0,1,'',1,'','eStar Pro',1,0,'EDG.M','','eStar Pro','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','eStarPro.诺言',NULL),
	(993,419,'eStar Pro','EDG.M',6,'2018-06-09 22:48:00',0,1,'',1,'','EDG.M',0,1,'EDG.M','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','EDGM.初晨',NULL),
	(994,419,'eStar Pro','EDG.M',7,'2018-06-09 23:23:00',0,1,'',1,'','EDG.M',0,1,'EDG.M','','EDG.M','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'EDG.M','EDGM.初晨',NULL),
	(995,420,'BA黑凤梨','RNG.M',0,'2018-06-10 19:25:00',0,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(996,420,'BA黑凤梨','RNG.M',1,'2018-06-10 19:25:00',0,1,'',1,'','BA黑凤梨',1,0,'BA黑凤梨','','BA黑凤梨','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'NONE','BA黑凤梨.小兽',NULL),
	(997,420,'BA黑凤梨','RNG.M',2,'2018-06-10 20:05:00',0,1,'',1,'','BA黑凤梨',1,0,'BA黑凤梨','','BA黑凤梨','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'BA黑凤梨','BA黑凤梨.小兽',NULL),
	(998,420,'BA黑凤梨','RNG.M',3,'2018-06-10 20:45:00',0,0,'',1,'','',NULL,NULL,'BA黑凤梨','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(999,420,'BA黑凤梨','RNG.M',4,'2018-06-10 21:20:00',1,0,'',1,'','',NULL,NULL,'','','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL),
	(1000,420,'BA黑凤梨','RNG.M',5,'2018-06-10 21:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1001,420,'BA黑凤梨','RNG.M',6,'2018-06-10 21:30:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(1002,420,'BA黑凤梨','RNG.M',7,'2018-06-10 22:00:00',0,0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `esports_match_result` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table esports_match_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `esports_match_type`;

CREATE TABLE `esports_match_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(256) DEFAULT NULL COMMENT '赛事类型名称',
  `group_type` varchar(256) DEFAULT NULL COMMENT '分组类型，如小组赛，淘汰赛',
  `begin_date` varchar(256) DEFAULT NULL COMMENT '开始时间',
  `end_date` varchar(256) DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `esports_match_type_id_idx` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='esports_match_type(王者荣耀赛事类型表)';

LOCK TABLES `esports_match_type` WRITE;
/*!40000 ALTER TABLE `esports_match_type` DISABLE KEYS */;

INSERT INTO `esports_match_type` (`id`, `name`, `group_type`, `begin_date`, `end_date`)
VALUES
	(8,'2018年KPL春季赛测试赛','测试','2018-01-27','2018-03-10'),
	(4771,'2018年KPL春季赛常规赛','分区赛','2018-03-21','2018-05-28'),
	(4772,'2018年KPL春季赛常规赛','分区赛','2018-03-21','2018-05-28'),
	(4773,'2018年KPL春季赛','保级赛','2018-05-30','2018-06-01'),
	(4774,'2018年KPL春季赛','季后赛','2018-06-07','2018-07-08');

/*!40000 ALTER TABLE `esports_match_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table log_operate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `log_operate`;

CREATE TABLE `log_operate` (
  `id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(192) DEFAULT NULL,
  `type` varchar(150) DEFAULT NULL,
  `content` text,
  `add_time` timestamp NULL DEFAULT NULL,
  `ip` varchar(60) DEFAULT NULL,
  `remark` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `log_operate` WRITE;
/*!40000 ALTER TABLE `log_operate` DISABLE KEYS */;

INSERT INTO `log_operate` (`id`, `user_id`, `user_name`, `type`, `content`, `add_time`, `ip`, `remark`)
VALUES
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:55:57',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:55:57',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:55:57',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:55:57',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:55:57',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板：logo图片','2018-09-18 19:57:04',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板：appLogo','2018-09-18 19:57:14',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:57:30',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195721564162-fav.png','2018-09-18 19:57:30',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:57:31',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195733314736-fav.png','2018-09-18 19:57:36',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：bet365-在线体育投注','2018-09-18 19:57:53',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：bet365-在线体育投注','2018-09-18 19:57:56',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：bet365-在线体育投注','2018-09-18 19:57:56',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：bet365-在线体育投注','2018-09-18 19:57:56',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板：LOGO图片','2018-09-18 19:58:14',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板：首页logo','2018-09-18 19:58:25',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195721564162-fav.png','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195829220958-161224031309.png','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:58:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195837231348-161224031309.png','2018-09-18 19:58:40',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：/views/main.html','2018-09-18 19:58:40',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：https://messenger.providesupport.com/messenger/04ypsq4867g5t0jv363uhn6gta.html','2018-09-18 19:59:35',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195721564162-fav.png','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195829220958-161224031309.png','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：https://messenger.providesupport.com/messenger/04ypsq4867g5t0jv363uhn6gta.html','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195721564162-fav.png','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195829220958-161224031309.png','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：https://messenger.providesupport.com/messenger/04ypsq4867g5t0jv363uhn6gta.html','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 19:59:59',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195721564162-fav.png','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195829220958-161224031309.png','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：https://messenger.providesupport.com/messenger/04ypsq4867g5t0jv363uhn6gta.html','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：1','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：/views/activity/wap/hongbao.html','2018-09-18 20:00:19',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板：首页浮窗红包图片','2018-09-18 20:00:29',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195721564162-fav.png','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918195829220958-161224031309.png','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：https://messenger.providesupport.com/messenger/04ypsq4867g5t0jv363uhn6gta.html','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918200036152494-qhb_h5.png','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：/views/activity/wap/hongbao.html','2018-09-18 20:00:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：https://messenger.providesupport.com/messenger/04ypsq4867g5t0jv363uhn6gta.html','2018-09-18 20:00:47',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：ios首页显示红包浮图','2018-09-18 20:01:25',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 20:01:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 20:01:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：0','2018-09-18 20:01:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：<div class=\"download\" style=\"text-align:right\"><a class=\"online-service\" style=\"font-size: 18px;float:initial;\">在线客服</a></div>\n','2018-09-18 20:01:36',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：/views/activity/hongbao.html','2018-09-18 20:01:47',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918200141145466-qhb_pc.png','2018-09-18 20:01:47',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：/views/activity/hongbao.html','2018-09-18 20:01:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918200141145466-qhb_pc.png','2018-09-18 20:01:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：<div class=\"wrap_box\" id=\"about1\" style=\"line-height: 36px;padding-top: 26px;\">\n<p>活动内容：为感谢广大会员对bet365的支持与信任,我们没有虚情假意的祝福，我们没有毫无创意的活动，我们只会用最暴力的手段表达自己！即起只要当日存款大于300元的bet365全体会员，游戏后次日即可参与天天抢红包，最佳手气8888元，小投注也可博大红包，心动的你赶紧加入bet365，好运将与您常相伴！</p>\n\n<p>活动对象：bet365999fcp.com全体有效会员</p>\n\n<p>活动时间：以官网公告为准</p>\n\n<p>活动结束：以公司红包官网通知为准</p>\n\n<p>开抢时间：每天北京时间下午15点整开抢，当日19：00：00关闭（如遇官网例行维护，将在维护完成1小时后开放）</p>\n\n<p>参与条件：bet365全体有效会员,即可参与天天抢红包活动&hellip;&hellip;详细请阅读《红包活动细则》。</p>\n\n<p>奖品设置：抽奖次数及金额根据前一日的存款金额等级而获得，完全随机中奖，红包金额大小不等，最低0.1元，最高8888.88元。</p>\n</div>\n\n<div class=\"wrap_box\" id=\"about2\">\n<table>\n	<tbody>\n		<tr>\n			<td>日存款总额在300元或以上</td>\n			<td>1次</td>\n			<td>日存款总额在1000元或以上</td>\n			<td>2次</td>\n		</tr>\n		<tr>\n			<td>日存款总额在5000元或以上</td>\n			<td>3次</td>\n			<td>日存款总额在10000元或以上</td>\n			<td>4次</td>\n		</tr>\n		<tr>\n			<td>日存款总额在50000元或以上</td>\n			<td>5次</td>\n			<td>日存款总额在100000元或以上</td>\n			<td>6次</td>\n		</tr>\n	</tbody>\n</table>\n</div>\n\n<div class=\"box2_top\"><img src=\"images/tit3.png\" /></div>\n\n<div class=\"wrap_box\" id=\"about4\" style=\"line-height: 36px;\">\n<p>1、每位会员仅能享有一个有效会员账号，如发现会员同一个IP下注册多个账号进行投注抢红包，公司有权拒绝赠送其彩金并做账号冻结处理，保证正常玩家的利益。</p>\n\n<p>2、为确保会员注册信息的真实性，成功申请彩金后的首次出款时不得修改银行卡号等信息，否则将扣除其赠送优惠及期间盈利。</p>\n\n<p>3、此活动为bet365系统程序自动运行，获奖的概率完全遵循力学及自然概率，不涉及任何人工操作，抽奖活动以系统判定为准,不得争议。</p>\n\n<p>4、在活动期间, bet365对于会员滥用个人账号将严格规定执行, 本娱乐城保留权利, 在任何时间都可终止会员登录或取消优惠资格. 关于会员参与活动是否构成滥用多账号的判断和决定是根据bet365最终决定。</p>\n\n<p>5、任何非法套取优惠行为或恶意注册账号及恶意存款的会员，公司将保留权利不赠送相应彩金。</p>\n\n<p>6、bet365保留权利在任何时候以及无通知的情况下更改、停止、取消优惠活动。</p>\n\n<p>7、参与该优惠，即表示您已详细参阅并同意网站内『活动声明』系列条款，为避免对文字的理解差异，bet365保留对活动的最终解释权;适用于所有优惠。</p>\n</div>\n','2018-09-18 20:03:33',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：<div class=\"wrap_box\" id=\"about1\" style=\"line-height: 36px;padding-top: 26px;\">\n<p>活动内容：为感谢广大会员对bet365的支持与信任,我们没有虚情假意的祝福，我们没有毫无创意的活动，我们只会用最暴力的手段表达自己！即起只要当日存款大于300元的bet365全体会员，游戏后次日即可参与天天抢红包，最佳手气8888元，小投注也可博大红包，心动的你赶紧加入bet365，好运将与您常相伴！</p>\n\n<p>活动对象：bet365999fcp.com全体有效会员</p>\n\n<p>活动时间：以官网公告为准</p>\n\n<p>活动结束：以公司红包官网通知为准</p>\n\n<p>开抢时间：每天北京时间下午15点整开抢，当日19：00：00关闭（如遇官网例行维护，将在维护完成1小时后开放）</p>\n\n<p>参与条件：bet365全体有效会员,即可参与天天抢红包活动&hellip;&hellip;详细请阅读《红包活动细则》。</p>\n\n<p>奖品设置：抽奖次数及金额根据前一日的存款金额等级而获得，完全随机中奖，红包金额大小不等，最低0.1元，最高8888.88元。</p>\n</div>\n\n<div class=\"wrap_box\" id=\"about2\">\n<table>\n	<tbody>\n		<tr>\n			<td>日存款总额在300元或以上</td>\n			<td>1次</td>\n			<td>日存款总额在1000元或以上</td>\n			<td>2次</td>\n		</tr>\n		<tr>\n			<td>日存款总额在5000元或以上</td>\n			<td>3次</td>\n			<td>日存款总额在10000元或以上</td>\n			<td>4次</td>\n		</tr>\n		<tr>\n			<td>日存款总额在50000元或以上</td>\n			<td>5次</td>\n			<td>日存款总额在100000元或以上</td>\n			<td>6次</td>\n		</tr>\n	</tbody>\n</table>\n</div>\n\n<div class=\"box2_top\"><img src=\"images/tit3.png\" /></div>\n\n<div class=\"wrap_box\" id=\"about4\" style=\"line-height: 36px;\">\n<p>1、每位会员仅能享有一个有效会员账号，如发现会员同一个IP下注册多个账号进行投注抢红包，公司有权拒绝赠送其彩金并做账号冻结处理，保证正常玩家的利益。</p>\n\n<p>2、为确保会员注册信息的真实性，成功申请彩金后的首次出款时不得修改银行卡号等信息，否则将扣除其赠送优惠及期间盈利。</p>\n\n<p>3、此活动为bet365系统程序自动运行，获奖的概率完全遵循力学及自然概率，不涉及任何人工操作，抽奖活动以系统判定为准,不得争议。</p>\n\n<p>4、在活动期间, bet365对于会员滥用个人账号将严格规定执行, 本娱乐城保留权利, 在任何时间都可终止会员登录或取消优惠资格. 关于会员参与活动是否构成滥用多账号的判断和决定是根据bet365最终决定。</p>\n\n<p>5、任何非法套取优惠行为或恶意注册账号及恶意存款的会员，公司将保留权利不赠送相应彩金。</p>\n\n<p>6、bet365保留权利在任何时候以及无通知的情况下更改、停止、取消优惠活动。</p>\n\n<p>7、参与该优惠，即表示您已详细参阅并同意网站内『活动声明』系列条款，为避免对文字的理解差异，bet365保留对活动的最终解释权;适用于所有优惠。</p>\n</div>\n','2018-09-18 20:03:33',NULL,NULL),
	(NULL,202,'ADMIN','删除模板','删除模板：H5手机App下载页面','2018-09-18 20:03:55',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：712','2018-09-18 20:04:24',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：713','2018-09-18 20:04:44',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：714','2018-09-18 20:04:53',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：715','2018-09-18 20:05:02',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：716','2018-09-18 20:05:14',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：717','2018-09-18 20:05:26',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：718','2018-09-18 20:05:38',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：719','2018-09-18 20:05:46',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：692','2018-09-18 20:06:03',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：693','2018-09-18 20:06:15',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：694','2018-09-18 20:06:28',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：695','2018-09-18 20:06:46',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：696','2018-09-18 20:06:57',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：697','2018-09-18 20:07:06',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：698','2018-09-18 20:07:14',NULL,NULL),
	(NULL,202,'ADMIN','修改模板','修改模板id：699','2018-09-18 20:07:24',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：<div class=\"wrap_box\" id=\"about1\" style=\"line-height: 36px;padding-top: 26px;\">\n<p>活动内容：为感谢广大会员对bet365的支持与信任,我们没有虚情假意的祝福，我们没有毫无创意的活动，我们只会用最暴力的手段表达自己！即起只要当日存款大于300元的bet365全体会员，游戏后次日即可参与天天抢红包，最佳手气8888元，小投注也可博大红包，心动的你赶紧加入bet365，好运将与您常相伴！</p>\n\n<p>活动对象：bet365全体有效会员</p>\n\n<p>活动时间：以官网公告为准</p>\n\n<p>活动结束：以公司红包官网通知为准</p>\n\n<p>开抢时间：每天北京时间下午15点整开抢，当日19：00：00关闭（如遇官网例行维护，将在维护完成1小时后开放）</p>\n\n<p>参与条件：bet365全体有效会员,即可参与天天抢红包活动&hellip;&hellip;详细请阅读《红包活动细则》。</p>\n\n<p>奖品设置：抽奖次数及金额根据前一日的存款金额等级而获得，完全随机中奖，红包金额大小不等，最低0.1元，最高8888.88元。</p>\n</div>\n\n<div class=\"wrap_box\" id=\"about2\">\n<table>\n	<tbody>\n		<tr>\n			<td>日存款总额在300元或以上</td>\n			<td>1次</td>\n			<td>日存款总额在1000元或以上</td>\n			<td>2次</td>\n		</tr>\n		<tr>\n			<td>日存款总额在5000元或以上</td>\n			<td>3次</td>\n			<td>日存款总额在10000元或以上</td>\n			<td>4次</td>\n		</tr>\n		<tr>\n			<td>日存款总额在50000元或以上</td>\n			<td>5次</td>\n			<td>日存款总额在100000元或以上</td>\n			<td>6次</td>\n		</tr>\n	</tbody>\n</table>\n</div>\n\n<div class=\"box2_top\"><img src=\"images/tit3.png\" /></div>\n\n<div class=\"wrap_box\" id=\"about4\" style=\"line-height: 36px;\">\n<p>1、每位会员仅能享有一个有效会员账号，如发现会员同一个IP下注册多个账号进行投注抢红包，公司有权拒绝赠送其彩金并做账号冻结处理，保证正常玩家的利益。</p>\n\n<p>2、为确保会员注册信息的真实性，成功申请彩金后的首次出款时不得修改银行卡号等信息，否则将扣除其赠送优惠及期间盈利。</p>\n\n<p>3、此活动为bet365系统程序自动运行，获奖的概率完全遵循力学及自然概率，不涉及任何人工操作，抽奖活动以系统判定为准,不得争议。</p>\n\n<p>4、在活动期间, bet365对于会员滥用个人账号将严格规定执行, 本娱乐城保留权利, 在任何时间都可终止会员登录或取消优惠资格. 关于会员参与活动是否构成滥用多账号的判断和决定是根据bet365最终决定。</p>\n\n<p>5、任何非法套取优惠行为或恶意注册账号及恶意存款的会员，公司将保留权利不赠送相应彩金。</p>\n\n<p>6、bet365保留权利在任何时候以及无通知的情况下更改、停止、取消优惠活动。</p>\n\n<p>7、参与该优惠，即表示您已详细参阅并同意网站内『活动声明』系列条款，为避免对文字的理解差异，bet365保留对活动的最终解释权;适用于所有优惠。</p>\n</div>\n','2018-09-18 20:08:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：浮窗','2018-09-18 20:09:02',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：左图','2018-09-18 20:10:43',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：右图','2018-09-18 20:10:57',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918201113255551-left.png','2018-09-18 20:11:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918201115417873-right.png','2018-09-18 20:11:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：首页logo','2018-09-18 20:13:46',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：logo图','2018-09-18 20:14:44',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：20180918/20180918201448606337-161224031309.png','2018-09-18 20:14:52',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：首页导航菜单','2018-09-18 20:15:51',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：菜单','2018-09-18 20:16:19',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：<ul>\n	<li class=\"nav-list\"><a href=\"/views/html/index.html\">首页</a></li>\n	<li class=\"nav-list\"><a href=\"/views/html/kingGlory.html\">王者荣耀</a></li>\n	<li class=\"nav-list \"><a href=\"/views/html/chess.html\">棋牌游戏</a>\n	<ul style=\"left: 76px\">\n		<li><a href=\"/views/html/chess.html?gameType=ky\">开元棋牌</a></li>\n		<li><a href=\"/views/html/chess.html?gameType=jb\">金宝棋牌</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/views/html/sports.html\">体育投注</a>\n	<ul style=\"left: 58px\">\n		<li><a href=\"/views/html/sports.html\">皇冠体育</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'sb\');\">沙巴体育</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'m8\');\">M8体育</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'bb\');\">BB体育</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/views/html/LiveVideo.html\">真人娱乐</a>\n	<ul style=\"left: 18px;   width: 563px;\">\n		<li><a href=\"javascript:EnterLiveGame(\'lmg\');\">LMG旗舰厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'ag\');\">AG贵宾厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'bbin\');\">BBIN视讯</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'ds\');\">DS太阳城厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'og\');\">OG东方厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'dg\');\">DG皇冠厅</a></li>\n		<li><a href=\"javascript:EnterLiveGame(\'mg\');\">MG欧美厅</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/views/html/electronicGame.html\">电子游艺</a>\n	<ul style=\"right: 0\">\n		<li><a href=\"/views/html/electronicGame.html?gameType=cq9\">CQ9电子</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=mg\">MG电子</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=ag\">AG电子</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=agby\">AG捕鱼王II</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=bbin\">BBIN电子</a></li>\n		<li><a href=\"/views/html/electronicGame.html?gameType=pt\">PT电子</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/page/game-center.html\">彩票游戏</a>\n	<ul style=\"right: 0\">\n		<li><a href=\"/data/game/lhc/index.html\">六合彩49倍</a></li>\n		<li><a href=\"/data/game/bjkc/index.html\">北京PK10</a></li>\n		<li><a href=\"/data/game/cqssc/index.html\">重庆时时彩</a></li>\n		<li><a href=\"/data/game/pl3/index.html\">排列三</a></li>\n		<li><a href=\"/data/game/gdklsf/index.html\">广东快乐十分</a></li>\n	</ul>\n	</li>\n	<li class=\"nav-list\"><a href=\"/views/html/baseMessage.html\">代理合作</a></li>\n	<li class=\"nav-list\"><a href=\"/views/html/youhui.html\">优惠活动</a></li>\n</ul>\n','2018-09-18 20:16:47',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：首页左侧导航','2018-09-18 20:19:02',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：导航','2018-09-18 20:19:18',NULL,NULL),
	(NULL,202,'ADMIN','添加模板','添加模板：<ul>\n	<li><a href=\"/views/main.html\">首页</a></li>\n	<li><a href=\"/views/html/sports.html\">体育赛事</a></li>\n	<li><a href=\"/views/html/LiveVideo.html\">真人娱乐</a></li>\n</ul>\n','2018-09-18 20:19:36',NULL,NULL);

/*!40000 ALTER TABLE `log_operate` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
