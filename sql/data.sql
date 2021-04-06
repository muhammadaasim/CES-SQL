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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `config` */

insert  into `config`(`id`,`configname`,`isenabled`) values 
(1,'examform',1),
(2,'result',1),
(3,'printing',1);

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `dept` */

insert  into `dept`(`id`,`name`) values 
(1,'Computer Science'),
(2,'Commerce'),
(3,'English');

/*Table structure for table `f_form_subject` */

DROP TABLE IF EXISTS `f_form_subject`;

CREATE TABLE `f_form_subject` (
  `f_id` int DEFAULT NULL,
  `sub_id` int DEFAULT NULL,
  KEY `f_id` (`f_id`),
  KEY `sub_id` (`sub_id`),
  CONSTRAINT `f_form_subject_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `form` (`id`),
  CONSTRAINT `f_form_subject_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`id`)
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
  KEY `sub_id` (`sub_id`),
  KEY `t_id` (`t_id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `f_subject_teacher_assign_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`id`),
  CONSTRAINT `f_subject_teacher_assign_ibfk_2` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`id`),
  CONSTRAINT `f_subject_teacher_assign_ibfk_3` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `f_subject_teacher_assign` */

insert  into `f_subject_teacher_assign`(`sub_id`,`t_id`,`session`,`sem_id`) values 
(1,1,2021,1),
(2,2,2021,1),
(3,2,2021,1),
(6,2,2020,2);

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
  CONSTRAINT `mark_ladger_ibfk_2` FOREIGN KEY (`sub_id`) REFERENCES `subjects` (`id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `program` */

insert  into `program`(`id`,`name`,`dept_id`) values 
(1,'Information Technology',1),
(2,'CS',2),
(3,'Phylosophy',3);

/*Table structure for table `semester` */

DROP TABLE IF EXISTS `semester`;

CREATE TABLE `semester` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `semester` */

insert  into `semester`(`id`,`name`,`prog_id`) values 
(1,'1st',1),
(2,'2nd',1),
(3,'3rd',1);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT NULL,
  `rollno` varchar(20) DEFAULT NULL,
  `prog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prog_id` (`prog_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`prog_id`) REFERENCES `program` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `student` */

insert  into `student`(`id`,`fullname`,`rollno`,`prog_id`) values 
(1,'Mohsin','CS-BSIT-004',NULL);

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `credit_hour` int DEFAULT NULL,
  `course_code` varchar(30) DEFAULT NULL,
  `sem_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sem_id` (`sem_id`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`sem_id`) REFERENCES `semester` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `subjects` */

insert  into `subjects`(`id`,`name`,`credit_hour`,`course_code`,`sem_id`) values 
(1,'ITC',3,'CS-1',1),
(2,'PF',3,'CS-1',1),
(3,'PF',1,'CS-1',1),
(4,'Islamiyat',3,'CS-1',1),
(5,'Elementry Math',3,'CS-1',1),
(6,'OOP',3,NULL,2),
(7,'Communication Skill',3,NULL,2),
(8,'Pakistan Study',3,NULL,2),
(9,'Calculus',3,NULL,2);

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) DEFAULT NULL,
  `surname` varchar(50) DEFAULT NULL,
  `dept_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`id`,`fullname`,`surname`,`dept_id`,`role_id`) values 
(1,'Naveed','abro',1,1),
(2,'Asad Ali','Batti',1,2);

/*Table structure for table `getassignedteacherbyid` */

DROP TABLE IF EXISTS `getassignedteacherbyid`;

/*!50001 DROP VIEW IF EXISTS `getassignedteacherbyid` */;
/*!50001 DROP TABLE IF EXISTS `getassignedteacherbyid` */;

/*!50001 CREATE TABLE  `getassignedteacherbyid`(
 `session` int ,
 `name` varchar(40) ,
 `fullname` varchar(50) ,
 `semester` varchar(10) ,
 `teacher_id` int 
)*/;

/*Table structure for table `getassignedteachers` */

DROP TABLE IF EXISTS `getassignedteachers`;

/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;
/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;

/*!50001 CREATE TABLE  `getassignedteachers`(
 `session` int ,
 `name` varchar(40) ,
 `fullname` varchar(50) ,
 `Semester` varchar(10) 
)*/;

/*View structure for view getassignedteacherbyid */

/*!50001 DROP TABLE IF EXISTS `getassignedteacherbyid` */;
/*!50001 DROP VIEW IF EXISTS `getassignedteacherbyid` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getassignedteacherbyid` AS select `fst`.`session` AS `session`,`s`.`name` AS `name`,`t`.`fullname` AS `fullname`,`st`.`name` AS `semester`,`t`.`id` AS `teacher_id` from (((`f_subject_teacher_assign` `fst` join `subjects` `s` on((`fst`.`sub_id` = `s`.`id`))) join `teacher` `t` on((`fst`.`t_id` = `t`.`id`))) join `semester` `st` on((`fst`.`sem_id` = `st`.`id`))) */;

/*View structure for view getassignedteachers */

/*!50001 DROP TABLE IF EXISTS `getassignedteachers` */;
/*!50001 DROP VIEW IF EXISTS `getassignedteachers` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getassignedteachers` AS select `fst`.`session` AS `session`,`s`.`name` AS `name`,`t`.`fullname` AS `fullname`,`st`.`name` AS `Semester` from (((`f_subject_teacher_assign` `fst` join `subjects` `s` on((`fst`.`sub_id` = `s`.`id`))) join `teacher` `t` on((`fst`.`t_id` = `t`.`id`))) join `semester` `st` on((`fst`.`sem_id` = `st`.`id`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
