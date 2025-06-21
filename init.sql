-- MySQL dump 10.13  Distrib 8.4.5, for Linux (x86_64)
--
-- Host: localhost    Database: pyweb
-- ------------------------------------------------------
-- Server version	8.4.5

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Board`
--

DROP TABLE IF EXISTS `Board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Board` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `views` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Board`
--

LOCK TABLES `Board` WRITE;
/*!40000 ALTER TABLE `Board` DISABLE KEYS */;
INSERT INTO `Board` VALUES (1,'안녕하세염','adminadmin','AI소프트웨어학부 (정보보안전공) 20233273 제갈은지입니다\r\nweb 제작 + 도커 기초 공부시작하려고 하면서 dockerfile과 compose파일도 같이 작성 해 보았습니다!\r\n도커 정말 유능하고 신기해서 흥미로웠습니다.....',3,'2025-06-21 15:27:36'),(2,'소개','adminadmin','Board 페이지는 기본적인 공지사항같은 곳적는 곳입니다\r\nAbout은 그동안 자신이 했던 활동 내역들을 모아 작성하였습니다\r\nFood는 그동안 다녔던 맛집 몇가지 적어보았습니다\r\n\r\n자신에 대해 고민하고 그동안 했던것들을 다시 떠올리면서 적을 수 있어서 좋았습니다, \r\n하지만 게시글 수정과 삭제도 만들고싶었지만 다른 시험도 있었기에 준비하느라 시간이 없어서 살짝 아쉬웠습니다. 하지만 도커파일 까지 한점은 좋았습니다',1,'2025-06-21 17:11:08');
/*!40000 ALTER TABLE `Board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'user','$2b$12$YENW5dcGV/0YDniXHNq1ouQUfMZ0ZSdq7P93tcEwWqXlLHUjl13jm','user','2025-06-10 07:45:30'),(2,'adminadmin','$2b$12$Mm/PJm0NsVyybwbDNMGa7OBZfO1vOb/0yhxb3Xt1affVWZxEtt1La','admin','2025-06-21 13:31:28');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `about`
--

DROP TABLE IF EXISTS `about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `about` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `views` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `about`
--

LOCK TABLES `about` WRITE;
/*!40000 ALTER TABLE `about` DISABLE KEYS */;
INSERT INTO `about` VALUES (1,'웹 공방전','adminadmin','프로젝트','1학년 입학하고 HackerLogin 동아리에 들어갔습니다. HackerLogin동아리는 방학마다 프로젝트를 진행하는데 1학년 때 동아리 신입생들끼리 웹 게시판 제작을 하여 서로의 게시판을 보안 점검 하고 보고서까지 작성하는 활동을 하였습니다. 이 활동에서 저는 실제 사이트에서 발생할 수있는 취약점들을 실습 하면서 보안에 대해 흥미를 갖게 되는 계기가 되었습니다.. 취약점 ex )디렉터리 인덱싱, 파일 업로드, 다운로드, xss 등',1,'2025-06-21 15:35:58'),(2,'웹 침투 테스트','adminadmin','프로젝트','2학년 1학기때는 한국정보기술연구원에서 주관하는 화이트 햇 스쿨 2기 프로그램에 참가하였고 거기서 웹 침투 테스트라는 주제로 프로젝트를 진행하였습니다.\r\n6명이서 진행을 하였고 거기서 3명씩 두팀으로 나누어 각각 관리자 페이지에 있는 flag를 찾아내는 것을 목표로 침투 시나리오를 제작하여 환경 구축을 하였습니다.\r\nsqlinjection을 이용하여 계정을 탈취하였고 파라미터 변조를 통하여 비밀글 내용을 알고 이제 파일 업로드를 거쳐 관리자페이지에 접근하는 시나리오를 제작하였습니다.  \r\n\r\n취약점을 쉽게 찾기 위해 php 언어를 사용하여 제작 했습니다.',1,'2025-06-21 15:42:43'),(3,'CTF 사이트 개발','adminadmin','프로젝트','2학년 2학기 동아리 선배님들과 같이 CTF 사이트를 개발하였습니다. CTF 는 취약한 부분을 찾아 그 안에 숨겨진 Flag를 찾는 보안 대회입니다!\r\n이 프로젝트를 진행하면서 정말 많이 배우게 된 것 같습니다.... flask 와 SQLAlchemy 를 사용하여 개발하였고 github 사용법도 확실히 배우게 되었습니다.\r\n저는 백엔드를 담당했었고 여기서도 문제에 대한 API 요청(문제서버생성, 삭제)도 해보며 열심히 배우려고 노력하였습니다. 사실 어떤 걸 더 적고 설명해야 할지 잘 모르겠네요......\r\n \r\n만든 CTF 사이트로 동아리 내부에서 CTF를 개최하였고, 이후 2025년 신입생 선발 CTF에도 사이트를 이용하였습니다. \r\n',3,'2025-06-21 15:50:12'),(4,'조선대학교 CERT팀','adminadmin','관련 활동','2024년 9월부터 현재까지 조선대학교 CERT팀 근로장학생을 하고 있습니다!\r\nCERT는 Computer Emergency Response Team의 약자로 실사용되고있는 교내 사이트들의 취약점을 점검합니다. 자세한 건 말 할 수 없지만취약점들이 어떤 경로로 발생될 수 있는지 알게되었고 실제 사이트는 어떠한 취약점이 잘 발생되는지 알게 되는 계기가 되었습니다! \r\n',1,'2025-06-21 15:54:14'),(5,'화이트 햇 스쿨 2기','adminadmin','관련 활동','2024 3월 ~ 9월, 한국정보기술연구원에서 주관하는 프로그램으로  보안입문자 대상으로 해주는 좋은 프로그램입니다!\r\n1단계에서는 전반적인 cs와 보안에 대해 이론 설명과 실습을 병행하며 기초 지식을 쌓을 수 있습니다. 2단계는 팀프로젝트로 웹침투테스트라는 프로젝트를 진행하였습니다. 3단계는 심화 교육을 진행합니다.\r\n\r\n여기서 진짜 3~4월에 일주일에 한번씩 서울 올라가니까 정말 힘들었읍니다..\r\n많이 배웠습니다..',3,'2025-06-21 15:59:00'),(7,'조선대학교 Online Judge 담당자','adminadmin','관련 활동','조선대학교 Online Judge 담당자입니다... 평소에는 별로 많은 일은 없지만 컴퓨터 공학부 시험볼 때 방화벽을 올리고, 채점 잘되고 있는지 확인하며 전반적인 시스템 관리를 합니다. 또한 비밀번호 초기화와 관련 문의사항도 받고있습니다. 느낀점은 oj 에 문제점이 많지만 복잡해서 성급히 고칠 수 없습니다....빨리 사이트가 교체 되었으면 합니당',0,'2025-06-21 16:08:22'),(8,'사이버훈련장 침해사고 대응훈련 (대상)','adminadmin','대회','2024 9월, 호남권 사이버훈련장 침해사고 대응훈련 (대상) - 한국인터넷진흥원,,\r\n랜덤으로 팀이 매칭되었고 그중에 잘하는 분이 계셔서 1등을 하게 되었습니다......\r\n이런 과분한 상을 적어도 되는지 아직도 저는 잘 모르겟네요... 이 대회는그냥 악성파일을 분석하여 flag를 찾아내는 대회였습니다. 자세히 무슨 문제가 있었는지 기억이 흐릿합니다\r\n',0,'2025-06-21 16:12:54'),(9,'2024 호남 정보보호 해커톤 대회 (호남정보보호지원센터장상)','adminadmin','대회','2024 호남 정보보호 해커톤 대회 (호남정보보호지원센터장상)',0,'2025-06-21 16:14:45'),(10,'모바일','adminadmin','프로젝트','모바일 취약점도 궁금해서 몇번 공부해 봤지만 얕게 공부해서 잘 모르겠습니더\r\n간단한 spyware 앱제작도 진행해보았습니다.',0,'2025-06-21 16:17:29'),(11,'HackerLogin','adminadmin','기타','2024년 9월 부터 동아리 운영진이 되었고 \r\n2025년 부회장을 맡게 되었습니다.. 운영이라는 것은 소규모라도 매우 힘든일이라는 것을 깨닫게 되었습니다. 그동안 운영 해왔던 선배님들이 존경스러웠습니다',1,'2025-06-21 16:27:50'),(13,'진로 고민.....','adminadmin','기타','보안 관련 활동을 이것저것 꽤 많이 해왔지만 취업을 할 수 있을 지 고민되는 3학년입니다.... 보안의 어떤 분야로 취업할지도 잘 모르겠고 요새 살짝 슬럼프 상태 같기도 해서 걱정되네염 그래서 취미로 일렉기타 시작했더니 재밌습니다.. 이러다 밴드에 취업? 하게 되는 루트도 있지않을까 생각합니다\r\n\r\n잠깐 쉬었다가 1년간 방향 잘 잡고 취업준비하려고합니다\r\n아자잣.!!!!!!!!!!',2,'2025-06-21 16:47:24');
/*!40000 ALTER TABLE `about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `idx` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `rating` float(2,1) NOT NULL,
  `views` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idx`),
  CONSTRAINT `food_chk_1` CHECK (((`rating` >= 0) and (`rating` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'녹두주막','adminadmin','조대후문','김치전 너무너무 맛있음 시험 끝나고 갈 예정',5.0,0,'2025-06-21 17:02:04'),(2,'중앙교','adminadmin','조대후문','보쌈 진짜 맛있음\r\n근데 의자가 등받이가 아니라 허리가 아픔 이게 아쉬워서 4점\r\n',4.0,0,'2025-06-21 17:03:33'),(3,'하울','adminadmin','조대후문','여기는 토핑 골라먹는 빙수집 맛있음 굿',5.0,1,'2025-06-21 17:03:59'),(4,'대두 포차','adminadmin','조대후문','닭볶음탕 맛있음....\r\n전반적으로 음식이 맛있는 것 같다\r\n많은 사람 들어가기 좋음',5.0,1,'2025-06-21 17:05:12'),(5,'무등산호랭이','adminadmin','충장로주변','파스타 맛집 필라프 맛집\r\n요근처가면 믿고 먹는 파스타집 입니당',5.0,0,'2025-06-21 17:06:04'),(6,'샤브향','adminadmin','충장로 주변','샤브샤브먹고 셀프바에있는 쌀국수 해먹으면 죽도 포함해서 진짜 끝내줌\r\n샤브샤브 집 중에서 제일 맛있음',5.0,1,'2025-06-21 17:07:19');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-21 17:25:45
