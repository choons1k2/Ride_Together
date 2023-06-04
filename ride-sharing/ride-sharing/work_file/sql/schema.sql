create database ride_sharing character set=utf8;

create user `ride_sharing`@`localhost` identified by '1234';
grant all privileges on ride_sharing.* to `ride_sharing`@`localhost` ;


create user `ride_sharing`@`%` identified by '1234';
grant all privileges on ride_sharing.* to `ride_sharing`@`%` ;



drop  table if exists tbl_like ;
drop  table if exists tbl_reply ;
drop  table if exists  tbl_board ;
drop  table if exists tbl_user  ;


create table tbl_user(
	 `uid` BIGINT auto_increment primary key COMMENT '회원PK',
	 `userId` varchar(50) unique not NULL  COMMENT '회원아이디',
	 `username` varchar(50) NOT NULL COMMENT '회원명',  
	 `email` varchar(100) unique NOT NULL COMMENT '이메일',  
	 `phone` varchar(50)  unique NOT NULL COMMENT '회원전화번호',
	 `gender` varchar(6)  DEFAULT 'male' COMMENT '회원성별',
	 `zoneCode` varchar(10)  COMMENT '우편번호',
	 `address` varchar(50)   COMMENT '주소',	 
	 `level` int(2) NOT NULL DEFAULT 1 COMMENT '회원등급',
	 `birth` varchar(10) COMMENT '생년월일',
	 `role` varchar(15) NOT NULL DEFAULT 'ROLE_GUEST' COMMENT '회원권한',	 
	 `password` varchar(100) NOT NULL COMMENT '비밀번호',
	 `ip` varchar(50) not null COMMENT '등록및업데이트아이피',
	 `userColor` varchar(20)  COMMENT '유저칼러 클래스',
	 `createdDate` timestamp NOT null default current_timestamp() COMMENT '등록일',
 	 `modifiedDate` timestamp  DEFAULT current_timestamp() COMMENT '업데이트일' 
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;



CREATE TABLE `tbl_board` (
  `bno` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '게시판PK',
  `uid` bigint(20) NOT NULL COMMENT '회원PK',
  `boardType` varchar(20) NOT NULL COMMENT '유형',
  `title` varchar(200) NOT NULL COMMENT '제목',
  `startPlace` varchar(50) DEFAULT NULL COMMENT '출발지',
  `place` varchar(50) DEFAULT NULL COMMENT '도착지',
  `content` mediumtext NOT NULL COMMENT '내용',
  `address` varchar(200) DEFAULT NULL COMMENT '도착지 주소',
  `boardPassword` varchar(100) DEFAULT NULL COMMENT '게시판비밀번호',
  `ip` varchar(50) NOT NULL COMMENT '등록및업데이트아이피',
  `viewCnt` int(11) DEFAULT 0 COMMENT '조회수',
  `imgCnt` int(11) DEFAULT 0 COMMENT '이미지갯수',
  `fileName` varchar(150) DEFAULT NULL COMMENT '이미지명',
  `latitude` varchar(30) DEFAULT NULL COMMENT '위도',
  `longitude` varchar(30) DEFAULT NULL COMMENT '경도',
  `ridePeriod` varchar(50) DEFAULT NULL COMMENT '기간',
  `rideDay` varchar(50) DEFAULT NULL COMMENT '날짜',
  `rideTime` varchar(50) DEFAULT NULL COMMENT '시간',
  `ridePricePeriod` varchar(50) DEFAULT NULL COMMENT '가격기간',
  `ridePrice` int(11) DEFAULT NULL COMMENT '가격',
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `modifiedDate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '업데이트일',
  PRIMARY KEY (`bno`),
  KEY `uid` (`uid`),
  CONSTRAINT `tbl_board_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `tbl_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4;



create table tbl_like(	
	`bno` BIGINT NOT null COMMENT '게시판PK',
	`uid` BIGINT  NOT null COMMENT '회원PK' ,
	`createdDate` timestamp NOT null default current_timestamp() COMMENT '등록일',
	 KEY `index_tbl_like` (`bno`,`uid`),
	 FOREIGN KEY (bno) REFERENCES tbl_board(bno) ON DELETE CASCADE ON UPDATE CASCADE,
	 FOREIGN KEY (uid) REFERENCES tbl_user(uid) ON DELETE CASCADE ON UPDATE CASCADE	 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- ride_sharing.tbl_reply definition

CREATE TABLE `tbl_reply` (
  `rno` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '댓글PK',
  `bno` bigint(20) NOT NULL COMMENT '게시판PK',
  `uid` bigint(20) NOT NULL COMMENT '회원PK',
  `content` text DEFAULT NULL COMMENT '댓글내용',
  `replyPassword` varchar(100) DEFAULT NULL COMMENT '댓글비밀번호',
  `ip` varchar(50) NOT NULL COMMENT '등록및업데이트아이피',
  `createdDate` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `modifiedDate` timestamp NOT NULL DEFAULT current_timestamp()  COMMENT '업데이트일',
  PRIMARY KEY (`rno`),
  KEY `bno` (`bno`),
  KEY `tbl_reply_FK` (`uid`),
  CONSTRAINT `tbl_reply_FK` FOREIGN KEY (`uid`) REFERENCES `tbl_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_reply_ibfk_1` FOREIGN KEY (`bno`) REFERENCES `tbl_board` (`bno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


create table tbl_scrap(	
	`scno` BIGINT NOT null auto_increment primary key COMMENT '스크랩PK',
	`uid` BIGINT  NOT null COMMENT '회원PK' ,
	`bno` BIGINT  NOT null COMMENT '게시판PK',
	`createdDate` timestamp NOT null default current_timestamp() COMMENT '등록일',
	 unique `index_tbl_scrap` (`uid`,`bno`),
 	 FOREIGN KEY (uid) REFERENCES tbl_user(uid) ON DELETE CASCADE ON UPDATE CASCADE,	 
	 FOREIGN KEY (bno) REFERENCES tbl_board(bno) ON DELETE CASCADE ON UPDATE CASCADE	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





create table tbl_note(	
	`noteId` BIGINT NOT null auto_increment primary key COMMENT '쪽지PK',
	`receiveId` BIGINT  NOT null COMMENT '받는사람PK' ,
	`sendId` BIGINT  NOT null COMMENT '보내는사람PK' ,
	`title` varchar(200)  COMMENT '쪽지제목',
	`content` varchar(550)  COMMENT '쪽지내용',
	`readCnt` int default 0 COMMENT '읽은 횟수',
	`remove` char(1) default 0  COMMENT '삭제여부',
	`sendDate` timestamp NOT null default current_timestamp() COMMENT '보낸날짜',
	`readDate` timestamp  null COMMENT '읽은날짜' 	
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


















