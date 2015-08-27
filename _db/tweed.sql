/*
<<<<<<< HEAD
SQLyog Community v11.28 (32 bit)
=======
SQLyog Community v11.27 (32 bit)
>>>>>>> a8431ebf3cf99d5e1f92ab54f538e8890a5d8e01
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
<<<<<<< HEAD
  `campaign_id` varchar(250) NOT NULL,
=======
  `campaign_hash` varchar(250) NOT NULL,
>>>>>>> a8431ebf3cf99d5e1f92ab54f538e8890a5d8e01
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `campaigns` */

<<<<<<< HEAD
insert  into `campaigns`(`id`,`name`,`url`,`campaign_id`) values (1,'test site','','d6ec72e76c7288ed75e86be78372b708');
=======
insert  into `campaigns`(`id`,`name`,`url`,`campaign_hash`) values (1,'sxsw test','','d6ec72e76c7288ed75e86be78372b708');
>>>>>>> a8431ebf3cf99d5e1f92ab54f538e8890a5d8e01

/*Table structure for table `queries` */

DROP TABLE IF EXISTS `queries`;

CREATE TABLE `queries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
<<<<<<< HEAD
  `site_id` bigint(20) unsigned NOT NULL,
  `type` enum('and','or','not','hashtag','to','from','sentiment','question') NOT NULL DEFAULT 'and',
=======
  `campaign_id` bigint(20) unsigned NOT NULL,
  `type` enum('and','or','not','hashtag','to','from','sentiment','question','at') NOT NULL DEFAULT 'and',
>>>>>>> a8431ebf3cf99d5e1f92ab54f538e8890a5d8e01
  `content` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `queries` */

<<<<<<< HEAD
insert  into `queries`(`id`,`site_id`,`type`,`content`) values (1,1,'hashtag','sxsw'),(2,1,'not','2016');
=======
insert  into `queries`(`id`,`campaign_id`,`type`,`content`) values (1,1,'hashtag','sxsw');
insert  into `queries`(`id`,`campaign_id`,`type`,`content`) values (2,1,'not','2016');

/*Table structure for table `tweet_entities` */

DROP TABLE IF EXISTS `tweet_entities`;

CREATE TABLE `tweet_entities` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tweet_id` bigint(20) unsigned NOT NULL,
  `entity_type` enum('hashtag','url','media') NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL COMMENT 'stores the https of media or typed url within a post',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `tweet_entities` */

insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (5,5,'hashtag',NULL,NULL);
insert  into `tweet_entities`(`id`,`tweet_id`,`entity_type`,`content`,`url`) values (6,5,'url',NULL,'http://bit.ly/Sxsw16');

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
  `in_reply_to_id` varchar(20) DEFAULT NULL,
  `in_reply_to_screen_name` varchar(100) DEFAULT NULL,
  `retweet_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tweet_id` (`tweet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `tweets` */

insert  into `tweets`(`id`,`campaign_id`,`iso_lang`,`user_id`,`user_name`,`user_screen_name`,`user_location`,`tweet_id`,`created_at`,`content`,`source`,`in_reply_to_id`,`in_reply_to_screen_name`,`retweet_count`) values (5,1,'en','2980473756','SchooLinks','SchooLinks_News','','636937217051611136','0000-00-00 00:00:00','@qa_atauhex Quick! Time is running out, vote for us now! #SXSW http://t.co/sWXouzqpxc','<a href=\"http://wikihikma.com\" rel=\"nofollow\">Wikihikma</a>','3344935634','qa_atauhex',0);
>>>>>>> a8431ebf3cf99d5e1f92ab54f538e8890a5d8e01

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
