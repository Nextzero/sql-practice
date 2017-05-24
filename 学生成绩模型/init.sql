CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `cno` int(11) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `tno` int(11) NOT NULL,
  PRIMARY KEY  (`cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`cno`,`cname`,`tno`) values (1,'企业管理',3),(2,'马克思',1),(3,'UML',2),(4,'数据库',5),(5,'物理',8);

/*Table structure for table `sc` */

DROP TABLE IF EXISTS `sc`;

CREATE TABLE `sc` (
  `sno` int(11) NOT NULL,
  `cno` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sc` */

insert  into `sc`(`sno`,`cno`,`score`) values (1,1,80),(1,2,86),(1,3,83),(1,4,89),(2,1,50),(2,2,36),(2,3,43),(2,4,59),(3,1,50),(3,2,96),(3,3,73),(3,4,69),(4,1,90),(4,2,36),(4,3,88),(4,4,99),(5,1,90),(5,2,96),(5,3,98),(5,4,99),(6,1,70),(6,2,66),(6,3,58),(6,4,79),(7,1,80),(7,2,76),(7,3,68),(7,4,59),(7,5,89);

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `sno` int(11) NOT NULL,
  `sname` varchar(20) NOT NULL,
  `sage` datetime NOT NULL,
  `ssex` char(2) NOT NULL,
  PRIMARY KEY  (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`sno`,`sname`,`sage`,`ssex`) values (1,'张三','1980-01-23 00:00:00','男'),(2,'李四','1982-12-12 00:00:00','男'),(3,'张飒','1981-09-09 00:00:00','男'),(4,'莉莉','1983-03-23 00:00:00','女'),(5,'王弼','1982-06-21 00:00:00','男'),(6,'王丽','1984-10-10 00:00:00','女'),(7,'刘香','1980-12-22 00:00:00','女');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `tno` int(3) NOT NULL,
  `tname` varchar(20) NOT NULL,
  PRIMARY KEY  (`tno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `teacher` */

insert  into `teacher`(`tno`,`tname`) values (1,'张老师'),(2,'王老师'),(3,'李老师'),(4,'赵老师'),(5,'刘老师'),(6,'向老师'),(7,'李文静'),(8,'叶平');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
