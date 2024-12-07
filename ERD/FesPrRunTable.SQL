﻿-- 외래키 설정
alter table board
add CONSTRAINT bidx_midx_fk
foreign key(midx)
references member(midx);

-- 제약조건 삭제 방법
alter table board
drop CONSTRAINT FK_member_TO_board;

-- 샘플데이터 입력

INSERT INTO board (subject, contents, writer, fileName, viewCnt, writeday, delyn, modifyWriteday, boardInfo, midx)
VALUES
('빛의 축제', '환상적인 불빛 축제와 멋진 쇼가 펼쳐집니다.', 'Admin', NULL, 0, '2024-12-03 08:27:57', 'N', NULL, 2, 1),
('음식 축제', '맛있는 거리 음식들로 구성된 미식 여행입니다.', 'Admin', NULL, 0, '2024-12-02 08:27:57', 'N', NULL, 2, 1),
('음악 축제', '최고의 밴드들이 함께하는 음악 축제입니다.', 'Admin', NULL, 0, '2024-12-01 08:27:57', 'N', NULL, 2, 1),
('문화 축제', '지역 전통 공연과 무용이 펼쳐지는 문화 축제입니다.', 'Admin', NULL, 0, '2024-11-30 08:27:57', 'N', NULL, 2, 1),
('미술 전시회', '현대 및 고전 미술 작품들을 전시하는 미술 전시회입니다.', 'Admin', NULL, 0, '2024-11-29 08:27:57', 'N', NULL, 2, 1),
('영화 상영', '최신 인디 영화들을 상영하는 영화 상영회입니다.', 'Admin', NULL, 0, '2024-11-28 08:27:57', 'N', NULL, 2, 1),
('스포츠 대회', '흥미진진한 경기가 펼쳐지는 스포츠 대회입니다.', 'Admin', NULL, 0, '2024-11-27 08:27:57', 'N', NULL, 2, 1),
('전통 무용', '다양한 문화의 전통 무용을 경험할 수 있는 축제입니다.', 'Admin', NULL, 0, '2024-11-26 08:27:57', 'N', NULL, 2, 1),
('테크 서밋', '최신 기술 혁신이 소개되는 테크 서밋입니다.', 'Admin', NULL, 0, '2024-11-25 08:27:57', 'N', NULL, 2, 1),
('헬스 엑스포', '건강 검진과 피트니스 클래스가 제공되는 헬스 엑스포입니다.', 'Admin', NULL, 0, '2024-11-24 08:27:57', 'N', NULL, 2, 1);

-- 축제정보페이지 샘플 데이터 입력
INSERT INTO board (subject, contents, writer, fileName, viewCnt, writeday, delyn, modifyWriteday, boardInfo, midx)
VALUES
('대전 축제', '대전 축제에 여러분들을 환영합니다.', 'Admin', NULL, 0, '2024-12-01 15:45:23', 'N', NULL, 0, 1),
('서울 축제', '서울 축제에 여러분들을 환영합니다.', 'Admin', NULL, 0, '2024-12-04 13:36:23', 'N', NULL, 0, 1),
('대구 축제', '대구 축제에 여러분들을 환영합니다.', 'Admin', NULL, 0, '2024-12-06 09:57:14', 'N', NULL, 0, 1),
('부산 축제', '부산 축제에 여러분들을 환영합니다.', 'Admin', NULL, 0, '2024-11-30 18:27:57', 'N', NULL, 0, 1);

-- 문의페이지 샘플 데이터 입력
INSERT INTO board (subject, contents, writer, fileName, viewCnt, writeday, delyn, modifyWriteday, boardInfo, midx)
VALUES
('문의 드립니다', '문의합니다.', 'test', NULL, 0, '2024-12-03 17:30:23', 'N', NULL, 1, 1),
('어디가면 될까요', '대전 축제는 어디서 하나요?', 'test', NULL, 0, '2024-12-01 12:36:23', 'N', NULL, 1, 1);

-- boardInfo 정보중 null 값인 데이터 삭제
DELETE FROM board
WHERE boardInfo IS NULL;


-- 멤버 테이블에 아이피 추가
ALTER TABLE MEMBER
ADD COLUMN memberip VARCHAR(20) NULL;
ALTER TABLE board
ADD COLUMN ip VARCHAR(20) NULL;
ALTER TABLE comment
ADD COLUMN cip VARCHAR(20) NULL;
ALTER TABLE comment
ADD COLUMN cwriter varchar(100) NULL;
ALTER TABLE board
ADD COLUMN tumbnail VARCHAR(100) NULL;

ALTER TABLE board
ADD COLUMN startDate VARCHAR(20) NULL;
ADD COLUMN endDate VARCHAR(20) NULL;

ALTER TABLE board MODIFY boardInfo char(2) NULL;

select * from board

select count(*) as cnt from board where delyn='N'AND boardInfo = 0


