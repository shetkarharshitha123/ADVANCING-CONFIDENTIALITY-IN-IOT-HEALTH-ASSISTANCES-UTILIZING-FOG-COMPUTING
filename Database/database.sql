/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.0.67-community-nt : Database - enhancing_data
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`enhancing_data` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `enhancing_data`;

/*Table structure for table `download` */

DROP TABLE IF EXISTS `download`;

CREATE TABLE `download` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(1000) default NULL,
  `fname` varchar(1000) default NULL,
  `date` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `download` */

insert  into `download`(`id`,`email`,`fname`,`date`) values (1,'kishan@gmail.com','sample.txt','2020-03-08 07:29:34');

/*Table structure for table `file` */

DROP TABLE IF EXISTS `file`;

CREATE TABLE `file` (
  `id` int(11) NOT NULL auto_increment,
  `fid` varchar(1000) default NULL,
  `owner` varchar(1000) default NULL,
  `fname` varchar(1000) default NULL,
  `data` longtext,
  `enc_data` longtext,
  `skey` varchar(1000) default NULL,
  `status` varchar(1000) default NULL,
  `fdate` varchar(1000) default NULL,
  `cdate` varchar(1000) default NULL,
  `status2` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `file` */

insert  into `file`(`id`,`fid`,`owner`,`fname`,`data`,`enc_data`,`skey`,`status`,`fdate`,`cdate`,`status2`) values (3,'61153','kishan@gmail.com','sample.txt','this is the sample file','0cdiAEokp/eANOD5Ji4EF4gbdTRBGa9oSElLJ0W/YwI=','06jLuBgxxJad38BVoxVrww==','fognode','2020-03-08 06:51:42','2020-03-08 06:52:50','uploaded_to_cloud');

/*Table structure for table `owner` */

DROP TABLE IF EXISTS `owner`;

CREATE TABLE `owner` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(1000) default NULL,
  `email` varchar(1000) default NULL,
  `mobile` varchar(1000) default NULL,
  `dob` varchar(1000) default NULL,
  `gender` varchar(1000) default NULL,
  `address` varchar(1000) default NULL,
  `username` varchar(1000) default NULL,
  `password` varchar(1000) default NULL,
  `status` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `owner` */

insert  into `owner`(`id`,`name`,`email`,`mobile`,`dob`,`gender`,`address`,`username`,`password`,`status`) values (3,'kishan','kishan@gmail.com','9640257292','2020-12-31','male','hyd','kishan','123','waiting');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(1000) default NULL,
  `email` varchar(1000) default NULL,
  `mobile` varchar(1000) default NULL,
  `dob` varchar(1000) default NULL,
  `gender` varchar(1000) default NULL,
  `address` varchar(1000) default NULL,
  `username` varchar(1000) default NULL,
  `password` varchar(1000) default NULL,
  `status` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`email`,`mobile`,`dob`,`gender`,`address`,`username`,`password`,`status`) values (1,'kishan','kishan@gmail.com','1245890','2020-12-31','male','hyd','kishan','123','waiting');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
