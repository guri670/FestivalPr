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


  CREATE TABLE comment(
  cidx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ccontents text NOT NULL,
  cwriteday datetime NULL DEFAULT now(),
  commentInfo char(2) NULL,
  delyn char(1) NULL DEFAULT 'N' ,
  midx int NOT NULL,
  bidx int NOT NULL,
  cip char(20) null
);

drop table comment

  CREATE TABLE reviewboard(
  rbidx int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  subject varchar(100) NOT NULL,
  contents text NOT NULL,
  writer varchar(100) not null,
  tumbnail varchar(100) not null,
  fileName varchar(100) NULL,
  viewCnt int NULL DEFAULT 0,
  writeday datetime NULL DEFAULT now(),
  delyn char(1) NULL DEFAULT 'N' ,
  modifyWriteday datetime NULL DEFAULT now(),
  midx int NOT NULL
);

drop table reviewboard