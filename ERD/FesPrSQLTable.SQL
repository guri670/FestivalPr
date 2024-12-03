CREATE TABLE MEMBER(
  midx int NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  memberId varchar(100) NOT NULL,
  memberPassword varchar(100) NOT NULL,
  memberName varchar(100) NOT NULL,
  memberNickName varchar(20)  NOT NULL,
  memberEmail varchar(50)  NOT NULL,
  memberPhone varchar(20)  NOT NULL,
  memberBirthday int NOT NULL,
  memberProfile_Img varchar(100) NULL,
  memberSelfInfo text NULL,
  delyn char(1) NOT NULL DEFAULT 'N'
);

Drop table member;
DDaidx int NOT NULL AUTO_INCREMENT

CREATE TABLE board(
  bidx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  subject varchar(100) NOT NULL,
  contents text NOT NULL,
  writer varchar(100) not null,
  fileName varchar(100) NULL,
  viewCnt int NULL DEFAULT 0,
  writeday datetime NULL DEFAULT now(),
  delyn char(1) NULL DEFAULT 'N' ,
  modifyWriteday datetime NULL DEFAULT now(),
  boardInfo char(2) NOT NULL,
  midx int NOT NULL
);
  DDabong int NULL DEFAULT 0,