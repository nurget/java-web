-- --------------------------------------------------------
-- 호스트:                          172.31.58.239
-- 서버 버전:                        11.0.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- kd 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `kd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `kd`;

-- 테이블 kd.board_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_info` (
  `BI_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `BI_TITLE` varchar(100) NOT NULL,
  `BI_CONTENT` text NOT NULL,
  `BI_WRITER` varchar(30) DEFAULT NULL,
  `BI_CREDAT` timestamp NOT NULL,
  `BI_CNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`BI_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 kd.board_info:~5 rows (대략적) 내보내기
INSERT INTO `board_info` (`BI_NUM`, `BI_TITLE`, `BI_CONTENT`, `BI_WRITER`, `BI_CREDAT`, `BI_CNT`) VALUES
	(2, '두번째 게시물', '윌리엄이 좋아하는 스타일~\r\n캐주얼 보이~', '윌리엄', '2023-07-11 07:31:07', 0),
	(4, '기아타이거즈', '노답', '가짜기아팬', '2023-07-14 03:02:33', 0),
	(5, '기아 우승', '언제함?\r\n올해!', '휴지짱', '2023-07-14 06:43:20', 0),
	(6, '우주소녀', '컴배ㄱ해', '설동이', '2023-07-14 06:43:58', 0),
	(8, ' 탈모', '예방합시다~~!', '세희', '2023-07-14 08:17:13', 0);

-- 테이블 kd.class_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `class_info` (
  `CI_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `CI_NAME` varchar(100) NOT NULL,
  `CI_DESC` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`CI_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 kd.class_info:~13 rows (대략적) 내보내기
INSERT INTO `class_info` (`CI_NUM`, `CI_NAME`, `CI_DESC`) VALUES
	(1, '양현종', '투수'),
	(2, '나성범', '타자'),
	(3, '김태군', '포수'),
	(4, '이의리', '투수'),
	(5, '윌리엄', '배트걸'),
	(6, '벤틀리', '치어리더'),
	(7, '오로라', '치어리더'),
	(8, '벨', '치어리더'),
	(9, '자스민', '치어리더'),
	(10, '윌리엄', '스윗걸~~~~'),
	(11, '이창진', '타자'),
	(13, '호걸이', '마스코트'),
	(17, '호야', '마스코트');

-- 테이블 kd.user_info 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_info` (
  `UI_NUM` int(11) NOT NULL AUTO_INCREMENT,
  `UI_ID` varchar(30) NOT NULL,
  `UI_PWD` varchar(30) NOT NULL,
  `UI_NAME` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`UI_NUM`),
  UNIQUE KEY `UI_ID` (`UI_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 kd.user_info:~5 rows (대략적) 내보내기
INSERT INTO `user_info` (`UI_NUM`, `UI_ID`, `UI_PWD`, `UI_NAME`) VALUES
	(2, 'TEST1', '하하', '연습1'),
	(3, '벤틀리', '벤틀리바보123', '벤토리걸'),
	(4, 'cs', '1111', '철수'),
	(5, 'tissue', '1234', '휴지'),
	(6, 'kia', 'tigers', 'kiatigers');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
