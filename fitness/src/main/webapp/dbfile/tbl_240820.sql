-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.39 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- fitness 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `fitness` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fitness`;

-- 테이블 fitness.tbl_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_board` (
  `BOARDNO` int NOT NULL AUTO_INCREMENT,
  `USERID` varchar(20) DEFAULT NULL,
  `TITLE` varchar(50) DEFAULT NULL,
  `CONTENTS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `HIT` int DEFAULT NULL,
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`BOARDNO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_board:~16 rows (대략적) 내보내기
INSERT INTO `tbl_board` (`BOARDNO`, `USERID`, `TITLE`, `CONTENTS`, `HIT`, `CDATETIME`, `UDATETIME`) VALUES
	(1, 'tea1', '변경테스트', ' 변경테스트', 150, '2024-08-13 17:09:43', '2024-08-15 11:28:45'),
	(2, 'tea5', '복싱(중급)', '복싱강습입니다.', 200, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(3, 'tea2', '수영(초급)', '수영강습입니다.', 175, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(4, 'tea1', '헬스(중급)', '헬스강습입니다.', 125, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(5, 'tea1', '헬스(중급)', '헬스강습입니다.', 180, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(6, 'tea3', '요가(초급)', '헬스강습입니다.', 210, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(7, 'tea4', '필라테스(초급)', '수영강습입니다.12', 160, '2024-08-13 17:09:43', '2024-08-15 16:26:10'),
	(8, 'tea1', '헬스(중급)', '헬스강습입니다.', 190, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(9, 'tea2', '수영(초급)', '수영강습입니다.', 140, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(10, 'tea6', '골프(초급)', '골프강습입니다.', 155, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(11, 'tea1', 'test', '내용을 입력해야지.\r\n헬스장 갈거야 헬스장 얼마나 갈거야.', 0, '2024-08-14 23:45:19', '2024-08-14 23:45:19'),
	(12, 'tea2', '수영초급반', '그래그래\r\n최고야', 0, '2024-08-14 23:50:31', '2024-08-14 23:50:31'),
	(13, 'tea3', '요가', '요가요가', 0, '2024-08-15 00:09:02', '2024-08-15 00:09:02'),
	(14, 'tea1', '테스트', '테스트한다.', 0, '2024-08-15 09:37:24', '2024-08-15 09:37:24'),
	(15, 'tea3', '골프', '골프다ㅅ', 0, '2024-08-19 11:38:22', '2024-08-19 15:07:03'),
	(16, 'tea1', '테스트', 'ㅅ', 0, '2024-08-19 14:55:16', '2024-08-19 14:55:16');

-- 테이블 fitness.tbl_class 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_class` (
  `CLASSNO` int NOT NULL AUTO_INCREMENT,
  `PROGRAMNO` int DEFAULT NULL,
  `ROOMNO` int DEFAULT NULL,
  `CLASS_NUM` int DEFAULT NULL,
  `CLASS_NUM_CNT` int DEFAULT '0',
  `START_DAY_TIME` datetime DEFAULT NULL,
  `END_DAY_TIME` datetime DEFAULT NULL,
  `INSTRUCTOR_ID` varchar(30) DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`CLASSNO`),
  KEY `tbl_class_ibfk_2` (`PROGRAMNO`),
  KEY `tbl_class_ibfk_3` (`ROOMNO`),
  CONSTRAINT `tbl_class_ibfk_1` FOREIGN KEY (`CLASSNO`) REFERENCES `tbl_board` (`BOARDNO`),
  CONSTRAINT `tbl_class_ibfk_2` FOREIGN KEY (`PROGRAMNO`) REFERENCES `tbl_program` (`PROGRAMNO`),
  CONSTRAINT `tbl_class_ibfk_3` FOREIGN KEY (`ROOMNO`) REFERENCES `tbl_room` (`ROOMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_class:~16 rows (대략적) 내보내기
INSERT INTO `tbl_class` (`CLASSNO`, `PROGRAMNO`, `ROOMNO`, `CLASS_NUM`, `CLASS_NUM_CNT`, `START_DAY_TIME`, `END_DAY_TIME`, `INSTRUCTOR_ID`, `STATUS`) VALUES
	(1, 101, 201, 5, 5, '2024-08-01 09:00:00', '2024-08-12 17:00:00', 'tea1', 'E'),
	(2, 105, 205, 10, 0, '2024-08-02 10:00:00', '2024-09-16 18:00:00', 'tea5', 'E'),
	(3, 102, 202, 20, 0, '2024-08-05 11:00:00', '2024-08-20 16:00:00', 'tea2', 'E'),
	(4, 101, 201, 6, 0, '2024-08-01 14:00:00', '2024-08-15 15:00:00', 'tea1', 'E'),
	(5, 101, 201, 5, 0, '2024-09-10 13:00:00', '2024-09-30 17:00:00', 'tea1', 'F'),
	(6, 103, 203, 20, 0, '2024-08-15 08:00:00', '2024-09-22 10:00:00', 'tea3', 'I'),
	(7, 104, 204, 10, 1, '2024-09-20 12:00:00', '2024-10-18 14:00:00', 'tea4', 'F'),
	(8, 101, 201, 6, 0, '2024-08-25 12:00:00', '2024-09-18 14:00:00', 'tea1', 'F'),
	(9, 102, 202, 20, 0, '2024-09-11 09:21:19', '2024-09-14 09:21:27', 'tea2', 'F'),
	(10, 106, 206, 10, 0, '2024-08-14 09:21:31', '2024-08-17 09:21:33', 'tea6', 'I'),
	(11, 101, 201, 5, 0, '2024-08-16 11:30:00', '2024-08-29 12:30:00', 'tea1', 'I'),
	(12, 102, 202, 10, 0, '2024-08-22 11:50:00', '2024-08-23 23:50:00', 'tea2', 'F'),
	(13, 103, 203, 10, 0, '2024-08-30 12:30:00', '2024-09-21 12:30:00', 'tea3', 'F'),
	(14, 101, 201, 5, 0, '2024-08-23 09:00:00', '2024-08-31 10:00:00', 'tea1', 'F'),
	(15, 106, 202, 1, 1, '2024-10-15 16:46:00', '2024-11-15 16:46:00', 'tea3', 'F'),
	(16, 102, 202, 2, 1, '2024-11-19 14:55:00', '2024-12-19 14:55:00', 'tea1', 'F');

-- 테이블 fitness.tbl_enroll 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_enroll` (
  `ENROLLNO` int NOT NULL AUTO_INCREMENT,
  `USERID` varchar(20) NOT NULL,
  `CLASSNO` int NOT NULL,
  `ENROLL_DATE` date NOT NULL,
  PRIMARY KEY (`ENROLLNO`),
  KEY `USERID` (`USERID`),
  KEY `CLASSNO` (`CLASSNO`),
  CONSTRAINT `tbl_enroll_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `tbl_user` (`USERID`),
  CONSTRAINT `tbl_enroll_ibfk_2` FOREIGN KEY (`CLASSNO`) REFERENCES `tbl_class` (`CLASSNO`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_enroll:~3 rows (대략적) 내보내기
INSERT INTO `tbl_enroll` (`ENROLLNO`, `USERID`, `CLASSNO`, `ENROLL_DATE`) VALUES
	(9, 'test', 15, '2024-08-19'),
	(13, 'test', 7, '2024-08-19'),
	(20, 'test3', 16, '2024-08-20');

-- 테이블 fitness.tbl_program 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_program` (
  `PROGRAMNO` int NOT NULL AUTO_INCREMENT,
  `PROGRAM_NAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PROGRAM_ENAME` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`PROGRAMNO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_program:~6 rows (대략적) 내보내기
INSERT INTO `tbl_program` (`PROGRAMNO`, `PROGRAM_NAME`, `PROGRAM_ENAME`) VALUES
	(101, '헬스', 'health'),
	(102, '수영', 'swimming'),
	(103, '요가', 'yoga'),
	(104, '필라테스', 'pilates'),
	(105, '복싱', 'boxing'),
	(106, '골프', 'golf');

-- 테이블 fitness.tbl_room 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_room` (
  `ROOMNO` int NOT NULL AUTO_INCREMENT,
  `ROOMNAME` varchar(20) DEFAULT NULL,
  `LOCATION` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ROOMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_room:~6 rows (대략적) 내보내기
INSERT INTO `tbl_room` (`ROOMNO`, `ROOMNAME`, `LOCATION`) VALUES
	(201, '헬스장', '1층별관'),
	(202, '수영장', '1층본관'),
	(203, 'GX룸', '3층별관'),
	(204, '필라테스관', '1층본관'),
	(205, '복싱관', '2층별관'),
	(206, '스크린 골프장', '2층본관');

-- 테이블 fitness.tbl_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `USERID` varchar(20) NOT NULL,
  `PWD` varchar(40) NOT NULL,
  `PWD_CHANGED` timestamp NULL DEFAULT NULL,
  `NAME` varchar(20) NOT NULL,
  `BIRTH` date DEFAULT NULL,
  `PHONE` varchar(20) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `LOGIN_CNT` int DEFAULT '0',
  `CREATE_DAY` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `IS_ACTIVE` tinyint(1) DEFAULT '1',
  `USER_ROLE` varchar(20) NOT NULL,
  `FIELD` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_user:~9 rows (대략적) 내보내기
INSERT INTO `tbl_user` (`USERID`, `PWD`, `PWD_CHANGED`, `NAME`, `BIRTH`, `PHONE`, `EMAIL`, `LOGIN_CNT`, `CREATE_DAY`, `IS_ACTIVE`, `USER_ROLE`, `FIELD`) VALUES
	('admin', 'admin', '2024-08-12 02:41:13', '관리자', '1980-01-01', '1234567890', 'admin@example.com', 0, '2024-08-12 02:41:13', 1, 'ADMIN', NULL),
	('tea1', 'tea1', '2024-08-12 02:42:14', '김헬스', '1985-05-15', '01012341234', 'teacher1@example.com', 0, '2024-08-12 02:42:14', 1, 'TEACHER', 'health'),
	('tea2', 'tea2', '2024-08-12 02:42:14', '이수영', '1990-06-20', '3456789012', 'teacher2@example.com', 5, '2024-08-12 02:42:14', 1, 'TEACHER', 'swimming'),
	('tea3', 'test1234', '2024-08-13 07:58:04', '박요가', '2000-08-15', '01018541234', 'test1@test.com', 0, '2024-08-13 07:58:04', 1, 'TEACHER', 'yoga'),
	('tea4', 'test1234', '2024-08-13 07:58:18', '최필라', '2000-08-15', '01011641234', 'test2@test.com', 0, '2024-08-13 07:58:18', 1, 'TEACHER', 'pilates'),
	('tea5', 'test1234', '2024-08-13 07:58:34', '우복싱', '2000-08-15', '01012771234', 'test3@test.com', 0, '2024-08-13 07:58:34', 1, 'TEACHER', 'boxing'),
	('tea6', 'test1234', '2024-08-13 07:58:53', '강골프', '2000-08-15', '01012348834', 'test4@test.com', 0, '2024-08-13 07:58:53', 1, 'TEACHER', 'golf'),
	('test', 'test', '2024-08-12 02:42:57', '고객일', '1992-07-25', '01012345679', 'member1@example.com', 0, '2024-08-12 02:42:57', 1, 'MEMBER', 'NULL'),
	('test2', 'test1234', '2024-08-12 02:42:57', '고객이', '1995-08-30', '5678901234', 'member2@example.com', 0, '2024-08-12 02:42:57', 1, 'MEMBER', NULL),
	('test3', 'test1234', '2024-08-20 08:46:55', '김이', '1993-06-24', '01025472155', 'test@test.com', 0, '2024-08-20 08:46:55', 1, 'MEMBER', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
