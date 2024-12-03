CREATE TABLE board
(
  bidx           int          NOT NULL DEFAULT Auto_incresement COMMENT '게시글 번호',
  midx           int          NOT NULL DEFAULT Auto_incresement COMMENT '회원번호',
  subject        varchar(100) NOT NULL COMMENT '제목',
  contents       text         NOT NULL COMMENT '내용',
  viewCnt        int          NULL     DEFAULT 0 COMMENT '조회수',
  DDabong        int          NULL     DEFAULT 0 COMMENT '따봉수',
  writeday       datetime     NULL     DEFAULT now() COMMENT '작성일',
  modifyWriteday datetime     NULL     DEFAULT now() COMMENT '수정일',
  fileName       varchar(100) NULL     COMMENT '파일 이름',
  delyn          char(1)      NULL     DEFAULT N COMMENT '삭제여부',
  boardInfo      char(2)      NOT NULL COMMENT '게시판종류(후기, 문의 , 정보)',
  PRIMARY KEY (bidx)
) COMMENT '게시판';

CREATE TABLE comment
(
  cidx        int      NOT NULL DEFAULT Auto_incresement COMMENT '댓글 번호',
  midx        int      NOT NULL DEFAULT Auto_incresement COMMENT '회원번호',
  bidx        int      NOT NULL DEFAULT Auto_incresement COMMENT '게시글 번호',
  ccontents   text     NOT NULL COMMENT '내용',
  depth       int      NULL     DEFAULT 0,
  level_      int      NULL     DEFAULT 0,
  cwriteday   datetime NULL     DEFAULT now() COMMENT '작성일',
  commentInfo char(2)  NOT NULL COMMENT '댓글 종류(후기, 문의, 정보)',
  PRIMARY KEY (cidx)
) COMMENT '댓글';

CREATE TABLE DDabong
(
  DDaidx int NOT NULL DEFAULT Auto_incrsement COMMENT '좋아요 번호',
  midx   int NOT NULL DEFAULT Auto_incresement COMMENT '회원번호',
  bidx   int NOT NULL DEFAULT Auto_incresement COMMENT '게시글 번호',
  PRIMARY KEY (DDaidx)
) COMMENT '좋아요';

CREATE TABLE festiNotice
(
  fesidx     int          NOT NULL DEFAULT Auto_incresement COMMENT '축제 정보',
  midx       int          NOT NULL DEFAULT Auto_incresement COMMENT '회원번호',
  bidx       int          NOT NULL DEFAULT Auto_incresement COMMENT '게시글 번호',
  fsubject   varchar(100) NOT NULL COMMENT '축제명',
  region     varchar(30)  NOT NULL COMMENT '지역명',
  festiStart datetime     NOT NULL COMMENT '축제시작',
  festiEnd   datetime     NOT NULL COMMENT '축제종료',
  fFileName  varchar(100) NULL     COMMENT '축제파일이름',
  PRIMARY KEY (fesidx)
) COMMENT '축제정보';

CREATE TABLE member
(
  midx              int          NOT NULL DEFAULT Auto_incresement COMMENT '회원번호',
  DDaidx            int          NOT NULL DEFAULT Auto_incrsement COMMENT '좋아요 번호',
  memberId          varchar(100) NOT NULL COMMENT '로그인 아이디',
  memberPassword    varchar(100) NOT NULL COMMENT '비밀번호',
  memberName        varchar(100) NOT NULL COMMENT '회원 이름',
  memberNickName    varchar(20)  NOT NULL COMMENT '닉네임',
  memberEmail       varchar(50)  NOT NULL COMMENT '이메일',
  memberPhone       varchar(20)  NOT NULL COMMENT '전화번호',
  memberBirthday    int          NOT NULL COMMENT '생일',
  memberProfile_Img varchar(100) NULL     COMMENT '프로필 사진',
  memberSelfInfo    text         NULL     COMMENT '자기소개',
  delyn             char(1)      NOT NULL DEFAULT N COMMENT '삭제여부',
  PRIMARY KEY (midx)
) COMMENT '회원 게시판';

ALTER TABLE board
  ADD CONSTRAINT FK_member_TO_board
    FOREIGN KEY (midx)
    REFERENCES member (midx);

ALTER TABLE comment
  ADD CONSTRAINT FK_member_TO_comment
    FOREIGN KEY (midx)
    REFERENCES member (midx);

ALTER TABLE festiNotice
  ADD CONSTRAINT FK_member_TO_festiNotice
    FOREIGN KEY (midx)
    REFERENCES member (midx);

ALTER TABLE comment
  ADD CONSTRAINT FK_board_TO_comment
    FOREIGN KEY (bidx)
    REFERENCES board (bidx);

ALTER TABLE DDabong
  ADD CONSTRAINT FK_member_TO_DDabong
    FOREIGN KEY (midx)
    REFERENCES member (midx);

ALTER TABLE DDabong
  ADD CONSTRAINT FK_board_TO_DDabong
    FOREIGN KEY (bidx)
    REFERENCES board (bidx);

ALTER TABLE festiNotice
  ADD CONSTRAINT FK_board_TO_festiNotice
    FOREIGN KEY (bidx)
    REFERENCES board (bidx);