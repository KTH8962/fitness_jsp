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
  `PROGRAMNO` int DEFAULT NULL,
  `CDATETIME` datetime DEFAULT NULL,
  `UDATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`BOARDNO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_board:~0 rows (대략적) 내보내기
INSERT INTO `tbl_board` (`BOARDNO`, `USERID`, `TITLE`, `CONTENTS`, `HIT`, `PROGRAMNO`, `CDATETIME`, `UDATETIME`) VALUES
	(1, 'tea1', '헬스(초급)', '헬스강습입니다.', 150, 101, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(2, 'tea5', '복싱(중급)', '복싱강습입니다.', 200, 105, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(3, 'tea2', '수영(초급)', '수영강습입니다.', 175, 102, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(4, 'tea1', '헬스(중급)', '헬스강습입니다.', 125, 101, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(5, 'tea1', '헬스(중급)', '헬스강습입니다.', 180, 101, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(6, 'tea3', '요가(초급)', '헬스강습입니다.', 210, 103, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(7, 'tea4', '필라테스(초급)', '수영강습입니다.', 160, 104, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(8, 'tea1', '헬스(중급)', '헬스강습입니다.', 190, 101, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(9, 'tea2', '수영(초급)', '수영강습입니다.', 140, 102, '2024-08-13 17:09:43', '2024-08-13 17:09:49'),
	(10, 'tea6', '골프(초급)', '골프강습입니다.', 155, 106, '2024-08-13 17:09:43', '2024-08-13 17:09:49');

-- 테이블 fitness.tbl_class 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_class` (
  `CLASSNO` int NOT NULL,
  `PROGRAMNO` int DEFAULT NULL,
  `ROOMNO` int DEFAULT NULL,
  `CLASS_NAME` varchar(30) DEFAULT NULL,
  `CLASS_NUM` int DEFAULT NULL,
  `START_DAY_TIME` datetime DEFAULT NULL,
  `END_DAY_TIME` datetime DEFAULT NULL,
  `INSTRUCTOR_ID` varchar(30) DEFAULT NULL,
  `STATUS` char(1) DEFAULT NULL,
  PRIMARY KEY (`CLASSNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_class:~8 rows (대략적) 내보내기
INSERT INTO `tbl_class` (`CLASSNO`, `PROGRAMNO`, `ROOMNO`, `CLASS_NAME`, `CLASS_NUM`, `START_DAY_TIME`, `END_DAY_TIME`, `INSTRUCTOR_ID`, `STATUS`) VALUES
	(1, 101, 201, '헬스', 30, '2024-08-01 09:00:00', '2024-08-12 17:00:00', 'tea1', 'E'),
	(2, 102, 202, '수영', 25, '2024-08-02 10:00:00', '2024-09-16 18:00:00', 'tea2', 'I'),
	(3, 101, 201, '헬스', 20, '2024-08-05 11:00:00', '2024-08-20 16:00:00', 'tea1', 'I'),
	(4, 102, 202, '수영', 15, '2024-08-01 14:00:00', '2024-08-15 15:00:00', 'tea2', 'I'),
	(5, 103, 203, '요가', 40, '2024-09-10 13:00:00', '2024-09-30 17:00:00', 'tea3', 'F'),
	(6, 104, 204, '필라테스', 35, '2024-08-15 08:00:00', '2024-09-22 10:00:00', 'tea4', 'F'),
	(7, 105, 205, '복싱', 28, '2024-09-20 12:00:00', '2024-10-18 14:00:00', 'tea5', 'F'),
	(8, 106, 206, '골프', 28, '2024-08-20 12:00:00', '2024-09-18 14:00:00', 'tea6', 'F');

-- 테이블 fitness.tbl_program 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_program` (
  `RROGRAMNO` int NOT NULL AUTO_INCREMENT,
  `RROGRAM_NAME` varchar(20) DEFAULT NULL,
  `RROGRAM_ENAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RROGRAMNO`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 fitness.tbl_program:~6 rows (대략적) 내보내기
INSERT INTO `tbl_program` (`RROGRAMNO`, `RROGRAM_NAME`, `RROGRAM_ENAME`) VALUES
	(101, '헬스', 'health'),
	(102, '수영', 'swimming'),
	(103, '요가', 'yoga'),
	(104, '필라테스', 'pilates'),
	(105, '복싱', 'boxing'),
	(106, '골프', 'golf');

-- 테이블 fitness.tbl_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `USERID` varchar(20) NOT NULL,
  `PWD` varchar(40) NOT NULL,
  `PWD_PERIOD` timestamp NULL DEFAULT NULL,
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
INSERT INTO `tbl_user` (`USERID`, `PWD`, `PWD_PERIOD`, `NAME`, `BIRTH`, `PHONE`, `EMAIL`, `LOGIN_CNT`, `CREATE_DAY`, `IS_ACTIVE`, `USER_ROLE`, `FIELD`) VALUES
	('admin', 'admin', '2024-08-11 17:41:13', '관리자', '1980-01-01', '1234567890', 'admin@example.com', 0, '2024-08-11 17:41:13', 1, 'ADMIN', NULL),
	('tea1', 'tea1', '2024-08-11 17:42:14', '김헬스', '1985-05-15', '2345678901', 'teacher1@example.com', 0, '2024-08-11 17:42:14', 1, 'TEACHER', 'health'),
	('tea2', 'tea2', '2024-08-11 17:42:14', '이수영', '1990-06-20', '3456789012', 'teacher2@example.com', 5, '2024-08-11 17:42:14', 1, 'TEACHER', 'swimming'),
	('tea3', 'test1234', '2024-08-12 22:58:04', '박요가', '2000-08-15', '01018541234', 'test1@test.com', 0, '2024-08-12 22:58:04', 1, 'TEACHER', 'yoga'),
	('tea4', 'test1234', '2024-08-12 22:58:18', '최필라', '2000-08-15', '01011641234', 'test2@test.com', 0, '2024-08-12 22:58:18', 1, 'TEACHER', 'pilates'),
	('tea5', 'test1234', '2024-08-12 22:58:34', '우복싱', '2000-08-15', '01012771234', 'test3@test.com', 0, '2024-08-12 22:58:34', 1, 'TEACHER', 'boxing'),
	('tea6', 'test1234', '2024-08-12 22:58:53', '강골프', '2000-08-15', '01012348834', 'test4@test.com', 0, '2024-08-12 22:58:53', 1, 'TEACHER', 'golf'),
	('test', 'test1234', '2024-08-11 17:42:57', '고객일', '1992-07-25', '4567890123', 'member1@example.com', 0, '2024-08-11 17:42:57', 1, 'MEMBER', NULL),
	('test2', 'test1234', '2024-08-11 17:42:57', '고객이', '1995-08-30', '5678901234', 'member2@example.com', 0, '2024-08-11 17:42:57', 1, 'MEMBER', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
