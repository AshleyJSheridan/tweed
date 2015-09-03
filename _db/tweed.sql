/*
SQLyog Community v11.27 (32 bit)
MySQL - 5.5.35 : Database - tweed
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `campaigns` */

DROP TABLE IF EXISTS `campaigns`;

CREATE TABLE `campaigns` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `url` varchar(250) NOT NULL,
  `campaign_hash` varchar(250) NOT NULL,
  `start` date NOT NULL,
  `end` date NOT NULL,
  `last_used` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `campaigns` */

insert  into `campaigns`(`id`,`name`,`url`,`campaign_hash`,`start`,`end`,`last_used`) values (1,'sxsw test','','d6ec72e76c7288ed75e86be78372b708','2015-08-28','2015-09-28','0000-00-00 00:00:00');

/*Table structure for table `queries` */

DROP TABLE IF EXISTS `queries`;

CREATE TABLE `queries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `type` enum('and','or','not','hashtag','to','from','sentiment','question','at') NOT NULL DEFAULT 'and',
  `content` varchar(50) NOT NULL,
  `item_order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `queries` */

insert  into `queries`(`id`,`campaign_id`,`type`,`content`,`item_order`) values (1,1,'hashtag','sxsw',0);
insert  into `queries`(`id`,`campaign_id`,`type`,`content`,`item_order`) values (2,1,'not','2016',0);

/*Table structure for table `tweet_entities` */

DROP TABLE IF EXISTS `tweet_entities`;

CREATE TABLE `tweet_entities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` bigint(20) unsigned NOT NULL,
  `entity_type` enum('hashtag','url','media') NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL COMMENT 'stores the https of media or typed url within a post',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=734 DEFAULT CHARSET=utf8;

/*Data for the table `tweet_entities` */

insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (390,134,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (391,134,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (392,135,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (393,135,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (394,135,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (395,135,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (396,135,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (397,135,'url',NULL,'http://www.engagingcities.com/article/help-civic-tech-learn-do-withnotfor-public-engagement-sxsw');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (398,136,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (399,136,'url',NULL,'http://bit.ly/1hvdpNZ');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (400,137,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (401,137,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (402,138,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (403,138,'url',NULL,'https://shar.es/1vpjgO');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (404,139,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (405,139,'url',NULL,'http://vcb.bz/18t4');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (406,140,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (407,140,'url',NULL,'http://sxsw.is/1NzmNgx');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (408,140,'media',NULL,'https://pbs.twimg.com/media/CNc8j1lW8AIH-UN.png');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (409,141,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (410,141,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (411,142,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (412,142,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (413,142,'url',NULL,'http://bit.ly/1DoBaer');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (414,142,'media',NULL,'https://pbs.twimg.com/media/CNeuG50UwAATB8f.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (415,143,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (416,143,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (417,144,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (418,144,'url',NULL,'http://binged.it/1KcMMtv');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (419,145,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (420,145,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (421,146,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (422,146,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (423,146,'url',NULL,'http://panelpicker.sxsw.com/vote/53477');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (424,147,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (425,147,'url',NULL,'http://bit.ly/SXsW16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (426,148,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (427,148,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (428,148,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (429,148,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (430,148,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (431,148,'url',NULL,'http://bit.ly/1HUu8Pw');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (432,149,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (433,149,'url',NULL,'http://bit.ly/SXsW16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (434,150,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (435,150,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (436,150,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (437,150,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (438,150,'url',NULL,'http://panelpicker.sxsw.com/vote/47797');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (439,151,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (440,151,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (441,151,'url',NULL,'http://sxsw.is/1Tw8Bsk');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (442,152,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (443,152,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (444,152,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (445,153,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (446,153,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (447,153,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (448,153,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (449,153,'url',NULL,'http://panelpicker.sxsw.com/vote/47797');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (450,154,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (451,154,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (452,154,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (453,155,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (454,155,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (455,156,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (456,156,'url',NULL,'http://bbc.in/1E4V9Vm');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (457,156,'media',NULL,'https://pbs.twimg.com/media/CNePIcZWIAASF22.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (458,157,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (459,157,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (460,158,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (461,158,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (462,158,'url',NULL,'https://twitter.com/cher/status/637132734444384256');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (463,159,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (464,159,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (465,159,'url',NULL,'http://bit.ly/1GM2YvN');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (466,159,'media',NULL,'https://pbs.twimg.com/media/CNebUjPWwAAIyLx.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (467,160,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (468,160,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (469,160,'url',NULL,'http://bit.ly/1Jn2ke1');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (470,160,'media',NULL,'https://pbs.twimg.com/media/CNaSN1oVEAAxEJA.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (471,161,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (472,161,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (473,162,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (474,162,'url',NULL,'http://catchapp.co/sxsw/f0e447970e760599a757b1123034c74b');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (475,163,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (476,163,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (477,163,'url',NULL,'http://panelpicker.sxsw.com/vote/53477');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (478,163,'media',NULL,'https://pbs.twimg.com/media/CNeV6ozVEAAQdVM.png');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (479,164,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (480,164,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (481,164,'url',NULL,'http://bit.ly/SXsW16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (482,165,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (483,165,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (484,165,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (485,165,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (486,165,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (487,165,'url',NULL,'http://tmblr.co/Zk0emw1s-lJCD');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (488,166,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (489,166,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (490,166,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (491,166,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (492,166,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (493,166,'url',NULL,'https://instagram.com/p/66kaWlOD4N/');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (494,167,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (495,167,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (496,167,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (497,168,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (498,168,'url',NULL,'http://buff.ly/1Etf6Sd');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (499,168,'media',NULL,'https://pbs.twimg.com/media/CAUTzxiWQAAsEyR.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (500,169,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (501,169,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (502,169,'url',NULL,'http://panelpicker.sxsw.com/vote/53739');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (503,170,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (504,170,'url',NULL,'http://binged.it/1KctnZG');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (505,171,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (506,171,'url',NULL,'http://binged.it/1VghqnF');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (507,172,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (508,172,'url',NULL,'http://bbc.in/1E4V9Vm');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (509,172,'media',NULL,'https://pbs.twimg.com/media/CNePIcZWIAASF22.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (510,173,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (511,173,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (512,173,'url',NULL,'http://disq.us/8of9dd');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (513,174,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (514,174,'url',NULL,'http://buff.ly/1Etf6Sd');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (515,174,'media',NULL,'https://pbs.twimg.com/media/CAUTzxiWQAAsEyR.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (516,175,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (517,175,'url',NULL,'http://bbc.in/1E4V9Vm');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (518,175,'media',NULL,'https://pbs.twimg.com/media/CNePIcZWIAASF22.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (519,176,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (520,176,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (521,176,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (522,177,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (523,177,'url',NULL,'http://bbc.in/1E4V9Vm');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (524,177,'media',NULL,'https://pbs.twimg.com/media/CNePIcZWIAASF22.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (525,178,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (526,178,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (527,178,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (528,178,'media',NULL,'https://pbs.twimg.com/media/CNcaaJ1UAAEK6nZ.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (529,179,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (530,179,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (531,180,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (532,180,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (533,180,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (534,180,'url',NULL,'http://panelpicker.sxsw.com/vote/55981');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (535,181,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (536,181,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (537,182,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (538,182,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (539,182,'url',NULL,'http://panelpicker.sxsw.com/vote/53739');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (540,183,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (541,183,'url',NULL,'http://twib.in/l/ggAzeR5G4ke');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (542,183,'url',NULL,'https://twibble.io');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (543,183,'media',NULL,'https://pbs.twimg.com/media/CNeIx8wVEAAa1_e.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (544,184,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (545,184,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (546,185,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (547,185,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (548,185,'url',NULL,'https://blab.im/rcqrnw');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (549,186,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (550,186,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (551,186,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (552,186,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (553,186,'url',NULL,'https://instagram.com/p/66hoo3IzGQ/');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (554,187,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (555,187,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (556,188,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (557,188,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (558,189,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (559,189,'url',NULL,'http://sxsw.is/1NzmNgx');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (560,189,'media',NULL,'https://pbs.twimg.com/media/CNc8j1lW8AIH-UN.png');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (561,190,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (562,190,'url',NULL,'http://ow.ly/RpFvK');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (563,191,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (564,191,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (565,191,'url',NULL,'http://bit.ly/1DoBaer');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (566,191,'media',NULL,'https://pbs.twimg.com/media/CNeE5fFUAAAS_D4.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (567,192,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (568,192,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (569,192,'url',NULL,'http://buff.ly/1MsTVVg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (570,192,'url',NULL,'https://twitter.com/ACGoh/status/634120699611889664');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (571,193,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (572,193,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (573,193,'url',NULL,'http://sxsw.is/1KFSJw1');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (574,193,'media',NULL,'https://pbs.twimg.com/media/CNb_g99WIAAcDGr.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (575,194,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (576,194,'url',NULL,'http://paper.li/BlackDogCEO/1327284569?edition_id=578f1c30-4d2a-11e5-a7ad-0cc47a0d164b');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (577,195,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (578,195,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (579,195,'url',NULL,'http://bit.ly/SXsW16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (580,196,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (581,196,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (582,196,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (583,197,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (584,197,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (585,198,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (586,198,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (587,198,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (588,198,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (589,198,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (590,198,'url',NULL,'http://panelpicker.sxsw.com/vote/47465');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (591,199,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (592,199,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (593,200,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (594,200,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (595,200,'url',NULL,'http://panelpicker.sxsw.com/vote/53477');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (596,201,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (597,201,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (598,201,'url',NULL,'http://bit.ly/Sxsw16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (599,202,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (600,202,'url',NULL,'https://twitter.com/TrajectoryMag/status/636620885307297792');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (601,203,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (602,203,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (603,203,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (604,203,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (605,203,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (606,203,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (607,203,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (608,203,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (609,204,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (610,204,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (611,204,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (612,204,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (613,204,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (614,204,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (615,204,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (616,204,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (617,205,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (618,205,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (619,205,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (620,205,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (621,205,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (622,205,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (623,205,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (624,205,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (625,206,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (626,206,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (627,206,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (628,206,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (629,206,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (630,206,'url',NULL,'https://twitter.com/sunport/status/637112579622617093');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (631,207,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (632,207,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (633,207,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (634,207,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (635,207,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (636,207,'url',NULL,'https://twitter.com/sunport/status/637112579622617093');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (637,208,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (638,208,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (639,208,'url',NULL,'http://kiss.ly/1hc9g0y');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (640,209,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (641,209,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (642,209,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (643,209,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (644,209,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (645,209,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (646,209,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (647,209,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (648,210,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (649,210,'url',NULL,'http://sxsw.is/1fC12Oa');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (650,211,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (651,211,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (652,211,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (653,211,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (654,211,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (655,211,'url',NULL,'https://twitter.com/sunport/status/637112579622617093');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (656,212,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (657,212,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (658,212,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (659,212,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (660,212,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (661,212,'url',NULL,'https://twitter.com/sunport/status/637112579622617093');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (662,213,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (663,213,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (664,213,'url',NULL,'https://shar.es/1tClhm');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (665,214,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (666,214,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (667,214,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (668,215,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (669,215,'url',NULL,'http://panelpicker.sxsw.com');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (670,215,'media',NULL,'https://pbs.twimg.com/media/CNdE4AeW8AA-cy-.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (671,216,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (672,216,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (673,216,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (674,216,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (675,216,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (676,216,'url',NULL,'http://panelpicker.sxsw.com/vote/47465');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (677,217,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (678,217,'url',NULL,'http://bit.ly/SXsW16');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (679,218,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (680,218,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (681,218,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (682,218,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (683,218,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (684,218,'url',NULL,'https://shar.es/1tOI7q');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (685,218,'media',NULL,'https://pbs.twimg.com/media/CNd0ns0UEAA12rn.png');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (686,219,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (687,219,'url',NULL,'http://ow.ly/3y8GGv');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (688,220,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (689,220,'url',NULL,'http://sxsw.is/1fC12Oa');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (690,221,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (691,221,'url',NULL,'http://fb.me/2tzxDwu9L');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (692,222,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (693,222,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (694,222,'url',NULL,'http://bit.ly/1GM2YvN');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (695,222,'media',NULL,'https://pbs.twimg.com/media/CNdyNRMUcAAI0FM.jpg');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (696,223,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (697,223,'url',NULL,'http://sxsw.is/1fC12Oa');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (698,224,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (699,224,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (700,224,'url',NULL,'http://sxsw.is/1EkgJA6');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (701,225,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (702,225,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (703,225,'url',NULL,'http://kiss.ly/1hc9g0y');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (704,226,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (705,226,'url',NULL,'http://sxsw.is/1fC12Oa');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (706,227,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (707,227,'url',NULL,'http://sxsw.is/1KnSojn');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (708,228,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (709,228,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (710,228,'url',NULL,'http://kiss.ly/1hc9g0y');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (711,229,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (712,229,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (713,229,'url',NULL,'http://kiss.ly/1hc9g0y');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (714,230,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (715,230,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (716,230,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (717,230,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (718,230,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (719,230,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (720,230,'url',NULL,'http://j.mp/1zAfMow');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (721,231,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (722,231,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (723,231,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (724,231,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (725,231,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (726,231,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (727,231,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (728,231,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (729,232,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (730,232,'url',NULL,'http://bit.ly/SxSW2016');
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (731,233,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (732,233,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (733,233,'url',NULL,'http://kiss.ly/1hc9g0y');

/*Table structure for table `tweets` */

DROP TABLE IF EXISTS `tweets`;

CREATE TABLE `tweets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` bigint(20) unsigned NOT NULL,
  `iso_lang` varchar(5) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_screen_name` varchar(100) NOT NULL,
  `user_location` varchar(100) NOT NULL,
  `tweet_id` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `content` varchar(250) NOT NULL,
  `source` varchar(150) NOT NULL,
  `in_reply_to_id` varchar(20) NOT NULL DEFAULT '0',
  `in_reply_to_screen_name` varchar(100) DEFAULT NULL,
  `retweet_count` int(10) unsigned NOT NULL DEFAULT '0',
  `approved` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tweet_id` (`tweet_id`,`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8;

/*Data for the table `tweets` */

insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (134,1,'en','2980473756','SchooLinks','SchooLinks_News','','637182254394015744','2015-08-28 09:37:42','@taagbo Help us solve the issues of the Education Gap. Vote for us, it takes 30 seconds #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','241438862','taagbo',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (135,1,'en','405654817','Rhiza Nery','rhizaweeza','Manila, Philippines','637181416401342465','2015-08-28 09:34:22','Help civic tech learn to do #WithNotFor public engagement at #SXSW http://t.co/aFDT9YYRNC #civictech #opengov #panelpicker','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (136,1,'en','158145014','NewCitiesFoundation','newcitiesfound','Paris, France','637180821741285380','2015-08-28 09:32:00','Tech will transform how cities &amp; citizens think about space - @placemeter &amp; John @Rossant &gt; #SXSW panel submission http://t.co/VxkhRytHjZ','<a href=\"http://sproutsocial.com\" rel=\"nofollow\">Sprout Social</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (137,1,'en','2980473756','SchooLinks','SchooLinks_News','','637179953478565889','2015-08-28 09:28:33','@KroviaTV By voting for us, you\'ll help millions of underprivileged students succeed. #SXSW  http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3240815123','KroviaTV',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (138,1,'en','208584178','Rana el Kaliouby','kaliouby','Boston','637177262417297413','2015-08-28 09:17:52','We\'d like to bring a session on emotion sensing and digital experiences to #SXSW - vote for us on PanelPicker: https://t.co/uMmKH2nQ5E','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (139,1,'en','3436392257','ArticleWriterr','ArticleWriterr','Magyarország','637176096199450624','2015-08-28 09:13:14','The Fourth “Dimension” of #SXSW  http://t.co/tCv1RpuAXn RT @AustinFoodTour','<a href=\"http://viralcontentbuzz.com\" rel=\"nofollow\">Viral Content Buzz</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (140,1,'en','55185470','Alex Gaspar','banzounet','Belgium','637173859431620608','2015-08-28 09:04:20','Don\'t forget to cast your vote and help send us to #SXSW! http://t.co/yRuPOVOqvL http://t.co/4cxSETfkUh','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,2,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (141,1,'en','2980473756','SchooLinks','SchooLinks_News','','637171499640717312','2015-08-28 08:54:58','@StraitMusicCo After you vote us into #SXSW, @entrepreneur will want to feature us, Front Page!  http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','358013410','StraitMusicCo',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (142,1,'en','3192600423','Poproxx','poproxx1','Tennessee, USA','637169306548178945','2015-08-28 08:46:15','Dej Loaf Made Her Presence Known at SXSW\n\nhttp://t.co/GtaOREx0Se\n\n#dejloaf #sxsw http://t.co/4gnhGHwIje','<a href=\"https://www.socialoomph.com\" rel=\"nofollow\">SocialOomph</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (143,1,'en','2980473756','SchooLinks','SchooLinks_News','','637165867713888256','2015-08-28 08:32:35','@EMC_Fresno Be a part of the bigger picture today, by voting for into #SXSW  http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3024503971','EMC_Fresno',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (144,1,'en','14190399','Metaphysicalist','Metaphysicalist','London','637161201315647488','2015-08-28 08:14:02','Stower Selected as Finalist for the SXSW Eco Startup Showcase Competition: San Francisco, CA, August 28,... http://t.co/zGAXjIJX9S #SXSW','<a href=\"http://twitterfeed.com\" rel=\"nofollow\">twitterfeed</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (145,1,'en','2980473756','SchooLinks','SchooLinks_News','','637159496910024704','2015-08-28 08:07:16','@Lisa_Haffelder Want to know something cool? We\'re headed to #SXSW, but we need 1 last vote: yours! http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3338845933','Lisa_Haffelder',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (146,1,'en','18986537','Ian M Calvert','IanMCalvert','Oxfordshire, England','637158991861125120','2015-08-28 08:05:16','Help get @bryankramer to #SXSW by voting for #Shareology: How Sharing Powers the Human Economy http://t.co/YSvoXAJO7V','<a href=\"http://www.influitive.com\" rel=\"nofollow\">Influitive</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (147,1,'en','2980473756','SchooLinks','SchooLinks_News','','637158516860522496','2015-08-28 08:03:22','@CL1nk We can be the biggest thing in EdTech since...well, vote for us and find out ; ) #SXSW http://t.co/i0zv29omxZ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','15329769','CL1nk',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (148,1,'en','16493868','Bryan Kramer','bryankramer','San Jose, CA','637157930081644544','2015-08-28 08:01:03','Friends, I would love your help in getting to speak at #SXSW http://t.co/d1IpzBLAYj  #shareology #H2H #H2HChat #thankyou','<a href=\"http://www.tweetjukebox.com\" rel=\"nofollow\">Tweet Jukebox</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (149,1,'en','2980473756','SchooLinks','SchooLinks_News','','637156526122225664','2015-08-28 07:55:28','@dh8hwlkwkg Inner City students need our help and we need your help, please vote us into this year\'s #SXSW http://t.co/i0zv29omxZ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3339408924','dh8hwlkwkg',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (150,1,'en','3090138010','Dull - trending!!','Swipe_SXSW_Left','Austin, TX','637154656846807040','2015-08-28 07:48:02','Want to know why the snob effect is a serious problem for digital designers? Vote Me(rel) to #SXSW 16! #UX #UXD #SXSW http://t.co/HvfWbMBd6B','<a href=\"http://shoudio.com\" rel=\"nofollow\">Shoudio</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (151,1,'en','2701408981','JILOU mohamed','JILOUmohamed','California, USA','637154447978659841','2015-08-28 07:47:12','Want to see an awesome session at #SxSW about #socialdata? Vote for @nik today! http://t.co/ui7UTNZgS0','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (152,1,'en','2980473756','SchooLinks','SchooLinks_News','','637154306618212352','2015-08-28 07:46:39','@lowestpricesonl Be a part of the EdTech Discussions, vote for our #SXSW Panel #EdTech http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3339434112','lowestpricesonl',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (153,1,'en','214239236','Merel Backers','Merelbackers','Amsterdam, The Netherlands','637153433737297920','2015-08-28 07:43:10','Want to know why the snob effect is a serious problem for digital designers? Vote Me(rel) to #SXSW 16! #UX #UXD #SXSW http://t.co/HvfWbMBd6B','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (154,1,'en','2980473756','SchooLinks','SchooLinks_News','','637152739496230912','2015-08-28 07:40:25','@SBRPGB #SXSW is coming up quick! Vote for Schoolinks : ) #SXSWedu http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3339513680','SBRPGB',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (155,1,'en','2980473756','SchooLinks','SchooLinks_News','','637151415446708225','2015-08-28 07:35:09','@eric41845046 Quick! Time is running out, vote for us now! #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3439391051','eric41845046',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (156,1,'en','40808900','p u N K t  aSaMaKi','cw4t7abs','Earth Sol 1 MilkyWay Laniakea ','637150206178521088','2015-08-28 07:30:21','Is this the next level of human augmentation? Vote for @roseveleth to talk at #sxsw here: http://t.co/DIyAfPBpk1 http://t.co/jROIfSXbCP','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,3,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (157,1,'en','2980473756','SchooLinks','SchooLinks_News','','637149156218380288','2015-08-28 07:26:11','@MindBridgeP Quick! Time is running out, vote for us now! #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3279034670','MindBridgeP',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (158,1,'en','1374581','Julia Ervin','JungleJulia','i\'m all over the place','637149094973206528','2015-08-28 07:25:56','Later...like, March? #SXSW #callme https://t.co/mqdVpfLVEj','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (159,1,'en','3192600423','Poproxx','poproxx1','Tennessee, USA','637148650095964160','2015-08-28 07:24:10','SXSW 2015 Recap\n\nhttp://t.co/FQGx1wSCWk\n\n#sxsw #recap #2015 http://t.co/VpTclE0OYb','<a href=\"https://www.socialoomph.com\" rel=\"nofollow\">SocialOomph</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (160,1,'en','20775453','Simon Goodall','SiGoodall','','637144944549986304','2015-08-28 07:09:27','Vote shopping on Apple watch by @Justyna_Po and more brilliant #SXSW #Panelpicker entries! http://t.co/C0giKM71lA http://t.co/hfDYV6iYkn','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (161,1,'en','2980473756','SchooLinks','SchooLinks_News','','637144589653164032','2015-08-28 07:08:02','@GappedToothGirl Quick! Time is running out, vote for us now! #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3127524716','GappedToothGirl',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (162,1,'en','3061133886','SXSW Top Stories','SXSW_ca','','637142826334052354','2015-08-28 07:01:01','Inside the PanelPicker: Delivery-On-Demand Economy Grows http://t.co/OnrZL6dko6 via @adplat #SXSW','<a href=\"https://about.twitter.com/products/tweetdeck\" rel=\"nofollow\">TweetDeck</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (163,1,'en','16493868','Bryan Kramer','bryankramer','San Jose, CA','637142707450871808','2015-08-28 07:00:33','Please vote for me to speak at #SXSW for #Shareology: How Sharing Powers the Human Economy http://t.co/NYY3PAs0Si http://t.co/Zw059AsZBu','<a href=\"http://www.tweetjukebox.com\" rel=\"nofollow\">Tweet Jukebox</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (164,1,'en','2980473756','SchooLinks','SchooLinks_News','','637142307393957888','2015-08-28 06:58:58','@jamieandnic Help our #EdTech Startup get into #SXSW by voting for us : )  http://t.co/i0zv29omxZ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3439466932','jamieandnic',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (165,1,'en','42126609','Chuckie Campbell','ChuckieC2','Buffalo, NY','637141756056838144','2015-08-28 06:56:46','Video: CANALSIDE, stay tuned! Much love to @dennykremblascreative #buffalo #music #canalside #sxsw #nxne... http://t.co/chYlsd2d56','<a href=\"http://www.tumblr.com/\" rel=\"nofollow\">Tumblr</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (166,1,'en','42126609','Chuckie Campbell','ChuckieC2','Buffalo, NY','637141753540288512','2015-08-28 06:56:46','CANALSIDE, stay tuned! Much love to dennykremblascreative #buffalo #music #canalside #sxsw #nxne… https://t.co/ZrZVXiaocs','<a href=\"http://instagram.com\" rel=\"nofollow\">Instagram</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (167,1,'en','2980473756','SchooLinks','SchooLinks_News','','637138493710422016','2015-08-28 06:43:49','@EastsideJonesDH We would love your help, please vote for us : ) #SXSW #PanelPicker http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','1228798422','EastsideJonesDH',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (168,1,'en','2763405666','Ralph Ehlers','TheRalphEhlers','United Kingdom','637138052339662848','2015-08-28 06:42:03','Tinder Users at #SXSW Fell for This Woman, but She\'s Not What She Appears: http://t.co/QOTABXNYL7 http://t.co/5vM9p5Qc2W','<a href=\"https://roundteam.co\" rel=\"nofollow\">RoundTeam</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (169,1,'en','35611404','Tammy Han','TammyFabulous','San Francisco, CA','637137546527412224','2015-08-28 06:40:03','What #data will parents need in the future? Vote to hear @chrisabruce @RosalindPicard @davidrose sound off #sxsw http://t.co/k39Hg3Y61b','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (170,1,'en','14190399','Metaphysicalist','Metaphysicalist','London','637137251315527680','2015-08-28 06:38:52','From a local dive to the big screen, the Jones Family have made their own way: The team scored a debut a... http://t.co/RUM1Z0oNEA #SXSW','<a href=\"http://twitterfeed.com\" rel=\"nofollow\">twitterfeed</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (171,1,'en','14190399','Metaphysicalist','Metaphysicalist','London','637137250237550593','2015-08-28 06:38:52','Watch The Trailer For Colin Hanks’ Tower Records Documentary: The late, great Tower Records is now the s... http://t.co/eBymN7y3Gd #SXSW','<a href=\"http://twitterfeed.com\" rel=\"nofollow\">twitterfeed</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (172,1,'en','524662686','Franken Harpo','FrankenHarpo','','637136880337833985','2015-08-28 06:37:24','Is this the next level of human augmentation? Vote for @roseveleth to talk at #sxsw here: http://t.co/DIyAfPBpk1 http://t.co/jROIfSXbCP','<a href=\"http://twitter.com/#!/download/ipad\" rel=\"nofollow\">Twitter for iPad</a>','0',NULL,3,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (173,1,'en','14747961','Pramit Nairi','pramitnairi','Los Angeles, CA','637136814092845057','2015-08-28 06:37:08','If u feel email is productivity\'s kryptonite, pls help me get this panel on SXSW. http://t.co/pTHqodzoeq #SXSW cc @timleake #HIMC','<a href=\"http://tapbots.com/software/tweetbot/mac\" rel=\"nofollow\">Tweetbot for Mac</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (174,1,'en','121336088','Qualaroo ','QualarooInc','San Mateo, CA','637136554260099072','2015-08-28 06:36:06','Tinder Users at #SXSW Fell for This Woman, but She\'s Not What She Appears: http://t.co/QOTABXNYL7 http://t.co/5vM9p5Qc2W','<a href=\"http://bufferapp.com\" rel=\"nofollow\">Buffer</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (175,1,'en','138334172','Dmitry Timofeev','timdim75','','637136524807696384','2015-08-28 06:35:59','Is this the next level of human augmentation? Vote for @roseveleth to talk at #sxsw here: http://t.co/DIyAfPBpk1 http://t.co/jROIfSXbCP','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>','0',NULL,3,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (176,1,'en','2980473756','SchooLinks','SchooLinks_News','','637135441116925952','2015-08-28 06:31:41','@Artutechent Passtionate about #EdTech? We are too! Vote us into #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','2960847207','Artutechent',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (177,1,'en','410605574','BBC Future','BBC_Future','','637135247709237248','2015-08-28 06:30:55','Is this the next level of human augmentation? Vote for @roseveleth to talk at #sxsw here: http://t.co/DIyAfPBpk1 http://t.co/jROIfSXbCP','<a href=\"http://www.hootsuite.com\" rel=\"nofollow\">Hootsuite</a>','0',NULL,3,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (178,1,'en','2354765722','anamarisculturetas','anamarisculture','','637133822212050944','2015-08-28 06:25:15','Our weekly #tbt countdown to #SXSW30 continues with this rad poster from #SXSW 1990. Design by Nels Jacobson. http://t.co/Rt4G5qj79V','<a href=\"http://www.flipboard.com\" rel=\"nofollow\">Flipboard</a>','0',NULL,13,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (179,1,'en','2980473756','SchooLinks','SchooLinks_News','','637132688881811456','2015-08-28 06:20:45','@Brian_S_LADC Want to make education accessible to everyone? We need your help. Please vote for us! #SXSW http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','370510365','Brian_S_LADC',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (180,1,'en','3156301850','Indian Startups','indianstartups1','','637131341658624001','2015-08-28 06:15:23','Hear how human-centered #design will be the ultimate #startup secret weapon. Vote for our #SXSW panel today: http://t.co/wP233MKNQy','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (181,1,'en','2980473756','SchooLinks','SchooLinks_News','','637128768038039552','2015-08-28 06:05:10','@harley_maye Interested in the discussion of Higher Education? Vote to join our Discussion! #SXSW http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3339846192','harley_maye',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (182,1,'en','782586474','Sproutling','sproutling','San Francisco, CA','637128475652964353','2015-08-28 06:04:00','What #data will parents need in the future? Vote to hear @chrisabruce @RosalindPicard @davidrose sound off #sxsw http://t.co/k39Hg3Y61b','<a href=\"http://sproutsocial.com\" rel=\"nofollow\">Sprout Social</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (183,1,'en','3099593356','SXSWrumors','sxswrumor','SXSW','637128264146771968','2015-08-28 06:03:10','Instagram Photos and Videos No Longer Need to Be Square http://t.co/VEgVU6eiRE #SXSW | https://t.co/srBYdgE7Uq http://t.co/0mvg1wFKeB','<a href=\"http://twibble.io\" rel=\"nofollow\">Twibble.io</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (184,1,'en','2980473756','SchooLinks','SchooLinks_News','','637127553090781184','2015-08-28 06:00:20','@ldiamond2 Want to know something cool? We\'re headed to #SXSW, but we need 1 last vote: yours! http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','32220475','ldiamond2',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (185,1,'en','3395767516','SolidRecommendations','SolidRecs','San Francisco, CA','637127099577430016','2015-08-28 05:58:32','Blabbing about blabbing, social selling &amp; #SXSW w/ @jgibbard and myself, waiting on @juliovisko https://t.co/E30CJx2foM #blab','<a href=\"http://www.getnewstweeter.com\" rel=\"nofollow\">TopNewsRetweets</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (186,1,'en','227517974','JJ Weber','agentjethro','People\'s Republic of Austin','637126933755654144','2015-08-28 05:57:52','So mellow compared to #SXSW but so crazy compared to most cities. #Austin #atx #SixthStreet @ 6th… https://t.co/vRurwZ9xS5','<a href=\"http://instagram.com\" rel=\"nofollow\">Instagram</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (187,1,'en','2980473756','SchooLinks','SchooLinks_News','','637126575033610240','2015-08-28 05:56:27','@Katt_12_21_12 Vote for us, and in return...we\'ll love you : ) #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','2382252080','Katt_12_21_12',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (188,1,'en','2980473756','SchooLinks','SchooLinks_News','','637125501656674304','2015-08-28 05:52:11','@begg_melissa Be a part of the bigger picture today, by voting for into #SXSW  http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','1261315182','begg_melissa',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (189,1,'en','112986743','Xavier Corman','xaviercorman','Europe','637125314670407680','2015-08-28 05:51:26','Don\'t forget to cast your vote and help send us to #SXSW! http://t.co/yRuPOVOqvL http://t.co/4cxSETfkUh','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,2,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (190,1,'en','3105799669','Angie Smith','angiesmith0371','Pleasanton, California','637124680587984896','2015-08-28 05:48:55','Up-vote http://t.co/ZpH0gbZe06 on the #SXSW panel picker if you wanna hear @jaysimons on his path from piano bars to president.','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (191,1,'en','3192600423','Poproxx','poproxx1','Tennessee, USA','637123996060917760','2015-08-28 05:46:12','Dej Loaf Made Her Presence Known at SXSW\n\nhttp://t.co/GtaOREx0Se\n\n#dejloaf #sxsw http://t.co/iY3tIMfAxu','<a href=\"https://www.socialoomph.com\" rel=\"nofollow\">SocialOomph</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (192,1,'en','153998882','Jacqueline','JackieMJensen','','637122827783532544','2015-08-28 05:41:33','RT \"#Startup Hubs Outside the Valley\" http://t.co/XFdgpvdI0f  @jpaine @cherylyeoh @cherylgoh @JackieMJensen #SXSW https://t.co/3eP1735gSv','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (193,1,'en','197108576','Carol Barbee','CBarbee1','','637122724561727489','2015-08-28 05:41:09','Miss #UnREALtv? Feast your eyes on Sequin Raze, the #SXSW 2013 short that inspired the show. http://t.co/vyxLIvHMye http://t.co/T9at4LNiz0','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,17,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (194,1,'en','178291443','Moe Saadeh','mysaadeh','Adelaide','637122515031056384','2015-08-28 05:40:19','Black Dog Promotion\'s #SXSW Guide is out! http://t.co/Qloam0dOD3 Stories via @mysaadeh @LeightonSmith12 @CSIdentity','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (195,1,'en','2980473756','SchooLinks','SchooLinks_News','','637120947481350144','2015-08-28 05:34:05','@Ket_Constantine Help our #EdTech Startup get into #SXSW by voting for us : )  http://t.co/i0zv29omxZ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','1889606419','Ket_Constantine',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (196,1,'en','2980473756','SchooLinks','SchooLinks_News','','637120093533655040','2015-08-28 05:30:42','@Michael25148804 Make a difference by voting for us into #SXSW #PanelPicker http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3439377687','Michael25148804',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (197,1,'en','2980473756','SchooLinks','SchooLinks_News','','637119004738519040','2015-08-28 05:26:22','@Gris912 Quick! Time is running out, vote for us now! #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','19289347','Gris912',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (198,1,'en','243285534','SAVEONMEATS','SAVEONMEATS',' 43 West Hastings Street','637118782368972800','2015-08-28 05:25:29','What #urban #food #security or #innovation questions do you have for us? Ask away! #sxsw @johnandelana @eastvanbrand http://t.co/85Kc9EDtPg','<a href=\"http://www.twitter.com\" rel=\"nofollow\">Twitter for BlackBerry</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (199,1,'en','2980473756','SchooLinks','SchooLinks_News','','637116733212491776','2015-08-28 05:17:20','@sydneyfishur We\'re the hottest startup in Austin, check us out and vote us into #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','479228577','sydneyfishur',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (200,1,'en','3166615397','Christy Soukhamneut','chrisellaloans','','637116693697961985','2015-08-28 05:17:11','Help get @bryankramer to #SXSW by voting for #Shareology: How Sharing Powers the Human Economy http://t.co/NPI92AXZOe','<a href=\"http://www.influitive.com\" rel=\"nofollow\">Influitive</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (201,1,'en','2980473756','SchooLinks','SchooLinks_News','','637115750625509376','2015-08-28 05:13:26','@bryo2006 Make a difference by voting for us into #SXSW #PanelPicker http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3340104854','bryo2006',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (202,1,'en','1636435027','Liz','elizabeth_tx','Texas','637115458240552960','2015-08-28 05:12:16','✅ #SXSW PanelPicker ✅\nhttps://t.co/A5608kaXbR','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,3,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (203,1,'en','2680085034','SunPort','PlugSolar','Albuquerque, New Mexico','637115151871664129','2015-08-28 05:11:03','Congratulations @PlugSolar @sunport on the #SharkTank pitch! #atx #austin #texas #SXSW #startup #business #entrepreneur','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>','0',NULL,2,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (204,1,'en','3003855911','Stacy Markham','AustinpalStacy','','637114977493585920','2015-08-28 05:10:22','_AdrianJackson: Congratulations PlugSolar sunport on the #SharkTank pitch! #atx #austin #texas #SXSW #startup #business #entrepreneur','<a href=\"http://ifttt.com\" rel=\"nofollow\">IFTTT</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (205,1,'en','3221683586','SunPort','sunport','USA','637114961836150788','2015-08-28 05:10:18','Congratulations @PlugSolar @sunport on the #SharkTank pitch! #atx #austin #texas #SXSW #startup #business #entrepreneur','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>','0',NULL,2,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (206,1,'en','3003855911','Stacy Markham','AustinpalStacy','','637114958766059520','2015-08-28 05:10:17','sunport: RT VanguardBarbers: Congratulations sunport! #atx #austin #texas #SXSW #SharkTank  https://t.co/TmKXItPur1','<a href=\"http://ifttt.com\" rel=\"nofollow\">IFTTT</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (207,1,'en','3003855911','Stacy Markham','AustinpalStacy','','637114957109293057','2015-08-28 05:10:17','VanguardBarbers: Congratulations sunport! #atx #austin #texas #SXSW #SharkTank  https://t.co/TmKXItPur1','<a href=\"http://ifttt.com\" rel=\"nofollow\">IFTTT</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (208,1,'en','2701408981','JILOU mohamed','JILOUmohamed','California, USA','637114803048345600','2015-08-28 05:09:40','Vote for this #SXSW panel to hear 2 #womenintech leaders share their story and give concrete advice http://t.co/iXhzISXrVO','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,4,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (209,1,'en','83663729','Adrian Jackson','_AdrianJackson','Austin, Texas','637114452987346944','2015-08-28 05:08:17','Congratulations @PlugSolar @sunport on the #SharkTank pitch! #atx #austin #texas #SXSW #startup #business #entrepreneur','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>','0',NULL,2,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (210,1,'en','2232601233','John Anderson','tyeeredfish2','','637114428471685120','2015-08-28 05:08:11','Pls RT and vote 4 our #SXSW panel, with @livongo @mysugr @diatribenews @LillyDiabetes http://t.co/hUy7Cjq4Gr','<a href=\"http://twitter.com/#!/download/ipad\" rel=\"nofollow\">Twitter for iPad</a>','0',NULL,6,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (211,1,'en','3221683586','SunPort','sunport','USA','637113511907299332','2015-08-28 05:04:32','Congratulations @sunport! #atx #austin #texas #SXSW #SharkTank  https://t.co/1gjNKoR0u6','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (212,1,'en','3186995012','VANGUARD Barber Shop','VanguardBarbers','Austin, TX','637113348731998209','2015-08-28 05:03:53','Congratulations @sunport! #atx #austin #texas #SXSW #SharkTank  https://t.co/1gjNKoR0u6','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (213,1,'en','552094012','Courtney Smith','cshasarrived','San Jose, CA','637113152463892481','2015-08-28 05:03:07','I just voted for @bryankramer #Shareology session in the #SXSW PanelPicker – Show us YOU SHARE and VOTE for it too! https://t.co/6ZclNrbhhL','<a href=\"http://www.tweetjukebox.com\" rel=\"nofollow\">Tweet Jukebox</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (214,1,'en','707359254','Home Movie Legacy','HomeMovieLegacy','Burbank, CA','637112958133346304','2015-08-28 05:02:20','#OndiTimoner 2 times  #SXSW winner does it again with #Brand: A Second Coming','<a href=\"http://www.tweetjukebox.com\" rel=\"nofollow\">Tweet Jukebox</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (215,1,'en','121656574','Jared Polin','froknowsphoto','','637109569588740097','2015-08-28 04:48:52','Word on the street is @froknowsphoto @VideoBlocks may bring Sex, Pixels &amp; Influence to #SXSW...http://t.co/643UuBnW12 http://t.co/uwANdw8U4V','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (216,1,'en','544619544','Mark Brand MB Inc.','eastvanbrand','Love it and it loves back','637108637329063936','2015-08-28 04:45:10','What #urban #food #security or #innovation questions do you have for us? Ask away! #sxsw @johnandelana @eastvanbrand http://t.co/MFF3n2KcRv','<a href=\"http://www.twitter.com\" rel=\"nofollow\">Twitter for BlackBerry</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (217,1,'en','2980473756','SchooLinks','SchooLinks_News','','637106460640604161','2015-08-28 04:36:31','@elsadelsawelsa Inner City students need our help and we need your help, please vote us into this year\'s #SXSW http://t.co/i0zv29omxZ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','412830467','elsadelsawelsa',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (218,1,'en','1211515650','Luke Brown','LukeBrown_AU','Sydney','637106098055565313','2015-08-28 04:35:05','We want to marry #loyalty &amp; #tech. Vote here #SXSW #PanelPicker https://t.co/frXvsxuSkT #marketing RT @AngelaSmithAU http://t.co/aQMWIgpYd1','<a href=\"http://www.hootsuite.com\" rel=\"nofollow\">Hootsuite</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (219,1,'en','3233898667','Yazan Boshmaf','HootYazan','Vancouver, British Columbia','637104333402828800','2015-08-28 04:28:04','Get a behind the scenes look at #SXSW, the most social festival in the world: http://t.co/CgsQekpuzk','<a href=\"http://www.hootsuite.com\" rel=\"nofollow\">Hootsuite</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (220,1,'en','2910393595','Beyond Type 1','BeyondType1','Brooklyn + LA + Silicon Valley','637103598594224129','2015-08-28 04:25:09','Pls RT and vote 4 our #SXSW panel, with @livongo @mysugr @diatribenews @LillyDiabetes http://t.co/hUy7Cjq4Gr','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,6,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (221,1,'en','334677429','Autumn A. Arnett','A2Arnett','Greater Washington, DC','637103503215886336','2015-08-28 04:24:46','I didn\'t think I\'d have time to submit @HBCUstory for #SXSW + the good people at Firelight Media did it for me! http://t.co/DvmEbtTnJJ','<a href=\"http://twitter.com\" rel=\"nofollow\">Twitter Web Client</a>','0',NULL,1,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (222,1,'en','3192600423','Poproxx','poproxx1','Tennessee, USA','637103445267357696','2015-08-28 04:24:32','SXSW 2015 Recap\n\nhttp://t.co/FQGx1wSCWk\n\n#sxsw #recap #2015 http://t.co/aT0mTRya0T','<a href=\"https://www.socialoomph.com\" rel=\"nofollow\">SocialOomph</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (223,1,'en','2478607224','Sarah Edwards','curlysarah56','Decatur, IL','637103388551987200','2015-08-28 04:24:19','Pls RT and vote 4 our #SXSW panel, with @livongo @mysugr @diatribenews @LillyDiabetes http://t.co/hUy7Cjq4Gr','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,6,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (224,1,'en','20771468','Ty Schalter','tyschalter','Lansing, MI','637103166773788672','2015-08-28 04:23:26','Vote for @scATX, @greghoward88, @Travis_Waldron, and my panel at #sxsw on sportswriting and culture! http://t.co/IWv24SJXVs #sxswsports','<a href=\"http://tapbots.com/tweetbot\" rel=\"nofollow\">Tweetbot for iΟS</a>','0',NULL,10,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (225,1,'en','185487277','Elton Miranda','eltonmiranda_','San Francisco & Floripa','637103156443369472','2015-08-28 04:23:23','Vote for this #SXSW panel to hear 2 #womenintech leaders share their story and give concrete advice http://t.co/iXhzISXrVO','<a href=\"http://twitter.com/download/iphone\" rel=\"nofollow\">Twitter for iPhone</a>','0',NULL,4,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (226,1,'en','781163','Kerri / Diabetes','sixuntilme','Rhode Island','637103154308509696','2015-08-28 04:23:23','Pls RT and vote 4 our #SXSW panel, with @livongo @mysugr @diatribenews @LillyDiabetes http://t.co/hUy7Cjq4Gr','<a href=\"https://about.twitter.com/products/tweetdeck\" rel=\"nofollow\">TweetDeck</a>','0',NULL,6,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (227,1,'en','1949521','john hanson','pyrotarkus','austin texas usa','637102776674222080','2015-08-28 04:21:53','Join #SXSW in the UK this September at one of our Roadshows! RSVP today: http://t.co/jxfawXBAPM','<a href=\"http://twitter.com/download/android\" rel=\"nofollow\">Twitter for Android</a>','0',NULL,8,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (228,1,'en','270587090','Ellen Zehntner','ELZclemson','boston, massachusetts','637102374784487424','2015-08-28 04:20:17','Vote for this #SXSW panel to hear 2 #womenintech leaders share their story and give concrete advice http://t.co/iXhzISXrVO','<a href=\"http://tapbots.com/tweetbot\" rel=\"nofollow\">Tweetbot for iΟS</a>','0',NULL,4,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (229,1,'en','1708738633','Simple Job','simple8job','','637102346787549184','2015-08-28 04:20:10','Vote for this #SXSW panel to hear 2 #womenintech leaders share their story and give concrete advice http://t.co/iXhzISXrVO','<a href=\"https://roundteam.co\" rel=\"nofollow\">RoundTeam</a>','0',NULL,4,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (230,1,'en','3003855911','Stacy Markham','AustinpalStacy','','637100592947724288','2015-08-28 04:13:12','DogTreatNews: RT #mio_austintexas: http://t.co/G30oIfAp5J .NewLeafActive ~Thx for the follow. I tweet abt #ATX #austin #dogs #sxsw #art #…','<a href=\"http://ifttt.com\" rel=\"nofollow\">IFTTT</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (231,1,'en','3003855911','Stacy Markham','AustinpalStacy','','637100590179463168','2015-08-28 04:13:12','mio_austintexas: .NewLeafActive ~Thx for the follow. I tweet abt #ATX #austin #dogs #sxsw #art #church #education #hiking &amp; more. Keep foll…','<a href=\"http://ifttt.com\" rel=\"nofollow\">IFTTT</a>','0',NULL,0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (232,1,'en','2980473756','SchooLinks','SchooLinks_News','','637100322960314368','2015-08-28 04:12:08','@FMichaelCarmody By voting for us, you\'ll help millions of underprivileged students succeed. #SXSW  http://t.co/jYfzPSXUOJ','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','20554438','FMichaelCarmody',0,'no');
insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`,`approved`) values (233,1,'en','13027572','Kissmetrics','Kissmetrics','San Francisco, CA','637100101731786752','2015-08-28 04:11:15','Vote for this #SXSW panel to hear 2 #womenintech leaders share their story and give concrete advice http://t.co/iXhzISXrVO','<a href=\"http://bufferapp.com\" rel=\"nofollow\">Buffer</a>','0',NULL,4,'no');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
