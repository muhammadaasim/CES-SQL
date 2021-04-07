/*
SQLyog Enterprise v13.1.1 (64 bit)
MySQL - 8.0.23 : Database - ces
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ces` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ces`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `configname` varchar(30) DEFAULT NULL,
  `isenabled` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `config` */

insert  into `config`(`id`,`configname`,`isenabled`) values 
(1,'examform',1),
(2,'result',1),
(3,'printing',1),
(4,'aasim',2);

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept` */

insert  into `dept`(`id`,`name`) values 
(1,'Computer Science'),
(2,'Commerce'),
(3,'English'),
(4,'Business'),
(5,NULL);

/*Table structure for table `deptincharge` */

DROP TABLE IF EXISTS `deptincharge`;

CREATE TABLE `deptincharge` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(30) DEFAULT NULL,
  `caste` varchar(30) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `deptincharge_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `deptincharge` */

insert  into `deptincharge`(`id`,`fullname`,`caste`,`dept_id`,`username`,`password`) values 
(1,'Asadullah','bhatti',1,'asad','asad'),
(2,'Zulfiqar','rajpar',2,'zulfi','zulfi'),
(3,'Parkash','hindu',4,'pk','pk');

/*Table structure for table `f_form_subject` */

DROP TABLE IF EXISTS `f_form_subject`;

CREATE TABLE `f_form_subject` (
  `f_id` int DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  KEY `f_id` (`f_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `f_form_subject_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `form` (`id`),
  CONSTRAINT `f_form_subject_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_form_subject` */

insert  into `f_form_subject`(`f_id`,`sub_id`) values 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5);

/*Table structure for table `f_subject_teacher_assign` */

DROP TABLE IF EXISTS `f_subject_teacher_assign`;

CREATE TABLE `f_subject_teacher_assign` (
  `sub_id` int DEFAULT NULL,
  `t_id` int DEFAULT NULL,
  `session` int DEFAULT NULL,
  `sem_id` int DEFAULT NULL,
  `hod_id` int DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  KEY `sub_id` (`sub_id`),
  KEY `t_id` (`t_id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `f_subject_teacher_assign_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `f_subject_teacher_assign_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `f_subject_teacher_assign_ibfk_3` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_subject_teacher_assign` */

insert  into `f_subject_teacher_assign`(`sub_id`,`t_id`,`session`,`sem_id`,`hod_id`,`date`) values 
(1,1,2021,1,NULL,NULL),
(2,2,2021,1,NULL,NULL),
(3,2,2021,1,NULL,NULL),
(6,2,2020,2,NULL,NULL);

/*Table structure for table `form` */

DROP TABLE IF EXISTS `form`;

CREATE TABLE `form` (
  `id` int NOT NULL AUTO_INCREMENT,
  `std_id` int DEFAULT NULL,
  `session` int DEFAULT NULL,
  `sem_id` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `std_id` (`std_id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `form_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`id`),
  CONSTRAINT `form_ibfk_2` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `form` */

insert  into `form`(`id`,`std_id`,`session`,`sem_id`,`type`) values 
(1,1,2020,1,1);

/*Table structure for table `mark_ladger` */

DROP TABLE IF EXISTS `mark_ladger`;

CREATE TABLE `mark_ladger` (
  `id` int NOT NULL AUTO_INCREMENT,
  `std_id` int DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  `t_id` int DEFAULT NULL,
  `f_id` int DEFAULT NULL,
  `mark` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `std_id` (`std_id`),
  KEY `sub_id` (`sub_id`),
  KEY `t_id` (`t_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `mark_ladger_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `student` (`id`),
  CONSTRAINT `mark_ladger_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `mark_ladger_ibfk_3` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `mark_ladger_ibfk_4` FOREIGN KEY (`f_id`) REFERENCES `form` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `mark_ladger` */

insert  into `mark_ladger`(`id`,`std_id`,`sub_id`,`t_id`,`f_id`,`mark`) values 
(1,1,1,1,1,100);

/*Table structure for table `program` */

DROP TABLE IF EXISTS `program`;

CREATE TABLE `program` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `program_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `program` */

insert  into `program`(`id`,`name`,`dept_id`) values 
(1,'Information Technology',1),
(2,'CS',2),
(3,'Phylosophy',3),
(4,'BS Commerce',3),
(5,'BE Computer SYs',3);

/*Table structure for table `semester` */

DROP TABLE IF EXISTS `semester`;

CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `semester` */

insert  into `semester`(`id`,`name`,`prog_id`) values 
(1,'1st',1),
(2,'2nd',1),
(3,'3rd',1),
(4,'4th',2),
(5,'5',1);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rollno` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `fullname` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  `caste` varchar(20) DEFAULT NULL,
  `dateofbirth` varchar(30) DEFAULT NULL,
  `religion` varchar(18) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `nationality` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `district` varchar(30) DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `fathername` varchar(40) DEFAULT NULL,
  `insertiondate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`rollno`,`fullname`,`prog_id`,`caste`,`dateofbirth`,`religion`,`gender`,`nationality`,`username`,`password`,`district`,`address`,`fathername`,`insertiondate`) values 
(1,'17-BSCS-010','Zohaib',2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(4,'17-BSCS-010','Zohaib',2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(5,'17-BSCS-010','Zohaib',2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(6,'17-BSCS-010',NULL,2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(7,'17-BSCS-010',NULL,2,'Soomro','2/3/2020','islam',1,'pakistani','aasim','1234',NULL,NULL,NULL,NULL),
(8,'17-BSCS-30','farhan',1,'Soomro','2/3/2020','Islam',2,'asdf','asdf','asdfasdf','asdfasdf','asdfasdf','asdfasdf','1617713110854'),
(9,'17-bsit-19','mohsin',2,'mohsin','2/234/234/','islam',1,'pakistani','mohsin','mohsin','mohsin','mohsin','asdfas','1617713110854');

/*Table structure for table `subject` */

DROP TABLE IF EXISTS `subject`;

CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `credit_hour` int DEFAULT NULL,
  `course_code` varchar(30) DEFAULT NULL,
  `sem_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subject` */

insert  into `subject`(`id`,`name`,`credit_hour`,`course_code`,`sem_id`) values 
(1,'ITC',3,'CS-1',1),
(2,'PF',3,'CS-1',1),
(3,'PF',1,'CS-1',1),
(4,'Islamiyat',3,'CS-1',1),
(5,'Elementry Math',3,'CS-1',1),
(6,'OOP',3,NULL,2),
(7,'Communication Skill',3,NULL,2),
(8,'Pakistan Study',3,NULL,2),
(9,'Calculus',3,NULL,2),
(10,'5',NULL,NULL,2);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`fullname`,`surname`,`dept_id`,`username`,`password`) values 
(1,'Naveed','abro',1,NULL,NULL),
(2,'Asad Ali','Batti',1,NULL,NULL),
(3,'Kashif','Dayo',1,'Kashif','kashif');

/*Table structure for table `getassignedteachers` */

DROP TABLE IF EXISTS `getassignedteachers`;

/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;
/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;

/*!50001 CREATE TABLE  `getassignedteachers`(
 `session` int ,
 `sub_id` int ,
 `sub_name` varchar(40) ,
 `sem_id` int ,
 `semester` varchar(20) ,
 `teacher_id` int ,
 `teacher_name` varchar(50) 
)*/;

/*Table structure for table `getincharge` */

DROP TABLE IF EXISTS `getincharge`;

/*!50001 DROP VIEW IF EXISTS `getincharge` */;
/*!50001 DROP TABLE IF EXISTS `getincharge` */;

/*!50001 CREATE TABLE  `getincharge`(
 `incharge_id` int ,
 `incharge_name` varchar(30) ,
 `caste` varchar(30) ,
 `dept_id` int ,
 `dept_name` varchar(50) 
)*/;

/*Table structure for table `getprograms` */

DROP TABLE IF EXISTS `getprograms`;

/*!50001 DROP VIEW IF EXISTS `getprograms` */;
/*!50001 DROP TABLE IF EXISTS `getprograms` */;

/*!50001 CREATE TABLE  `getprograms`(
 `Prog_id` int ,
 `Prog` varchar(30) ,
 `Dept_id` int ,
 `Dept` varchar(50) 
)*/;

/*Table structure for table `getsemesters` */

DROP TABLE IF EXISTS `getsemesters`;

/*!50001 DROP VIEW IF EXISTS `getsemesters` */;
/*!50001 DROP TABLE IF EXISTS `getsemesters` */;

/*!50001 CREATE TABLE  `getsemesters`(
 `sem_id` int ,
 `Semester` varchar(20) ,
 `prog_id` int ,
 `Program` varchar(30) 
)*/;

/*Table structure for table `getsubjects` */

DROP TABLE IF EXISTS `getsubjects`;

/*!50001 DROP VIEW IF EXISTS `getsubjects` */;
/*!50001 DROP TABLE IF EXISTS `getsubjects` */;

/*!50001 CREATE TABLE  `getsubjects`(
 `subj_id` int ,
 `Subj_Name` varchar(40) ,
 `Sem_id` int ,
 `Sem_Name` varchar(20) 
)*/;

/*Table structure for table `getteacher` */

DROP TABLE IF EXISTS `getteacher`;

/*!50001 DROP VIEW IF EXISTS `getteacher` */;
/*!50001 DROP TABLE IF EXISTS `getteacher` */;

/*!50001 CREATE TABLE  `getteacher`(
 `teacher_id` int ,
 `teacher_name` varchar(50) ,
 `surname` varchar(50) ,
 `dept_id` int ,
 `dept_name` varchar(50) 
)*/;

/*View structure for view getassignedteachers */

/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;
/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getassignedteachers` AS select `fst`.`session` AS `session`,`s`.`id` AS `sub_id`,`s`.`name` AS `sub_name`,`st`.`id` AS `sem_id`,`st`.`name` AS `semester`,`t`.`id` AS `teacher_id`,`t`.`fullname` AS `teacher_name` from (((`f_subject_teacher_assign` `fst` join `subject` `s` on((`fst`.`sub_id` = `s`.`id`))) join `teacher` `t` on((`fst`.`t_id` = `t`.`id`))) join `semester` `st` on((`fst`.`sem_id` = `st`.`id`))) */;

/*View structure for view getincharge */

/*!50001 DROP TABLE IF EXISTS `getincharge` */;
/*!50001 DROP VIEW IF EXISTS `getincharge` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getincharge` AS select `di`.`id` AS `incharge_id`,`di`.`fullname` AS `incharge_name`,`di`.`caste` AS `caste`,`d`.`id` AS `dept_id`,`d`.`name` AS `dept_name` from (`dept` `d` join `deptincharge` `di` on((`di`.`dept_id` = `d`.`id`))) */;

/*View structure for view getprograms */

/*!50001 DROP TABLE IF EXISTS `getprograms` */;
/*!50001 DROP VIEW IF EXISTS `getprograms` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getprograms` AS select `p`.`id` AS `Prog_id`,`p`.`name` AS `Prog`,`d`.`id` AS `Dept_id`,`d`.`name` AS `Dept` from (`program` `p` join `dept` `d` on((`d`.`id` = `p`.`dept_id`))) */;

/*View structure for view getsemesters */

/*!50001 DROP TABLE IF EXISTS `getsemesters` */;
/*!50001 DROP VIEW IF EXISTS `getsemesters` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsemesters` AS select `s`.`id` AS `sem_id`,`s`.`name` AS `Semester`,`p`.`id` AS `prog_id`,`p`.`name` AS `Program` from (`semester` `s` join `program` `p` on((`s`.`prog_id` = `p`.`id`))) */;

/*View structure for view getsubjects */

/*!50001 DROP TABLE IF EXISTS `getsubjects` */;
/*!50001 DROP VIEW IF EXISTS `getsubjects` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getsubjects` AS select `s`.`id` AS `subj_id`,`s`.`name` AS `Subj_Name`,`sm`.`id` AS `Sem_id`,`sm`.`name` AS `Sem_Name` from (`subject` `s` join `semester` `sm` on((`sm`.`id` = `s`.`sem_id`))) */;

/*View structure for view getteacher */

/*!50001 DROP TABLE IF EXISTS `getteacher` */;
/*!50001 DROP VIEW IF EXISTS `getteacher` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`mohsin`@`%` SQL SECURITY DEFINER VIEW `getteacher` AS select `t`.`id` AS `teacher_id`,`t`.`fullname` AS `teacher_name`,`t`.`surname` AS `surname`,`t`.`dept_id` AS `dept_id`,`d`.`name` AS `dept_name` from (`teacher` `t` join `dept` `d` on((`d`.`id` = `t`.`dept_id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
