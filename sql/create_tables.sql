CREATE TABLE authority(
stat  VARCHAR2(4) CONSTRAINT auth_pk PRIMARY KEY,
a_quantity  NUMBER,
a_date  NUMBER);

INSERT INTO authority(stat,a_quantity,a_date) VALUES('s',3,7);
INSERT INTO authority(stat,a_quantity,a_date) VALUES('p',5,14);

CREATE TABLE STUDENTS(
	s_id VARCHAR2(10) CONSTRAINT std_pk PRIMARY KEY,
	s_pwd VARCHAR2(30),
	s_major VARCHAR2(30), 
	stat VARCHAR2(4) CONSTRAINT std_fk REFERENCES authority(stat)
);

INSERT INTO STUDENTS VALUES ('1400000', 'abcde', '법학과', 's');
INSERT INTO STUDENTS VALUES ('1400001', 'abezcvsd', '식품영양학과', 's');
INSERT INTO STUDENTS VALUES ('1400002', 'ab23esd', '경제학과', 's');
INSERT INTO STUDENTS VALUES ('1100003', 'abdes', '경제학과', 's');
INSERT INTO STUDENTS VALUES ('1500004', 'gkx1sne', '경제학과', 's');
INSERT INTO STUDENTS VALUES ('1300005', 'aaa3de', '무용과', 's');
INSERT INTO STUDENTS VALUES ('1300006', 'gdsxce', '무용과', 's');
INSERT INTO STUDENTS VALUES ('1400007', 'xcvae2e', '무용과', 's');
INSERT INTO STUDENTS VALUES ('1400008', 'abes12d', '무용과', 's');
INSERT INTO STUDENTS VALUES ('1500009', 'abdf3esd', '무용과', 's');
INSERT INTO STUDENTS VALUES ('1500010', 'abe32sd', '무용과', 's');
INSERT INTO STUDENTS VALUES ('1500011', 'a1dbee231sd', '무용과', 's');
INSERT INTO STUDENTS VALUES ('1500012', 'dsbxcx', '한국어문학부', 's');
INSERT INTO STUDENTS VALUES ('1500013', 'asadcxe', '통계학과', 's');
INSERT INTO STUDENTS VALUES ('1700014', 'sdfaew', '통계학과', 's');
INSERT INTO STUDENTS VALUES ('1400015', 'adee', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1400016', 'cxzvbe', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1400017', 'zbrwe32', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1500018', 'vcczha5', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1500019', 'cvxczb1', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1500020', 'cxzvw1sfa', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1500021', 'xcvxgad', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1600022', 'czbdga', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1600023', 'cvztea', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1600024', 'cxvzehj', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1600025', 'kghvcb', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1700026', 'gdjgdh', '컴퓨터과학과', 's');
INSERT INTO STUDENTS VALUES ('1400027', 'bcxzeaw', '건축학과', 's');
INSERT INTO STUDENTS VALUES ('1500028', 'safdcxb', '건축학과', 's');
INSERT INTO STUDENTS VALUES ('1500029', 'aeewa', '건축학과', 's');
INSERT INTO STUDENTS VALUES ('1000030', '123gdasf', '작곡과', 's');
INSERT INTO STUDENTS VALUES ('1100031', 'czv35da', '작곡과', 's');
INSERT INTO STUDENTS VALUES ('1200032', 'bzxa23', '작곡과', 's');
INSERT INTO STUDENTS VALUES ('1300033', 'bcxeae', '작곡과', 's');


CREATE TABLE seats
(seat_id	   VARCHAR2(10) CONSTRAINT seats_pk PRIMARY KEY,
 res_id	   VARCHAR2(10) CONSTRAINT seats_fk REFERENCES students(s_id),
 res_date    DATE,
 CONSTRAINT reg_id_uk UNIQUE(res_id));


INSERT INTO seats(seat_id) VALUES('S1_A1');
INSERT INTO seats(seat_id) VALUES('S1_A2');
INSERT INTO seats(seat_id) VALUES('S1_A3');
INSERT INTO seats(seat_id) VALUES('S1_A4');
INSERT INTO seats(seat_id) VALUES('S1_A5');
INSERT INTO seats(seat_id) VALUES('S1_B1');
INSERT INTO seats(seat_id) VALUES('S1_B2');
INSERT INTO seats(seat_id) VALUES('S1_B3');
INSERT INTO seats(seat_id) VALUES('S1_B4');
INSERT INTO seats(seat_id) VALUES('S1_B5');
INSERT INTO seats(seat_id) VALUES('S1_C1');
INSERT INTO seats(seat_id) VALUES('S1_C2');
INSERT INTO seats(seat_id) VALUES('S1_C3');
INSERT INTO seats(seat_id) VALUES('S1_C4');
INSERT INTO seats(seat_id) VALUES('S1_C5');
INSERT INTO seats(seat_id) VALUES('S1_D1');
INSERT INTO seats(seat_id) VALUES('S1_D2');
INSERT INTO seats(seat_id) VALUES('S1_D3');
INSERT INTO seats(seat_id) VALUES('S1_D4');
INSERT INTO seats(seat_id) VALUES('S1_D5');

INSERT INTO seats(seat_id) VALUES('S6_A1');
INSERT INTO seats(seat_id) VALUES('S6_A2');
INSERT INTO seats(seat_id) VALUES('S6_A3');
INSERT INTO seats(seat_id) VALUES('S6_A4');
INSERT INTO seats(seat_id) VALUES('S6_B1');
INSERT INTO seats(seat_id) VALUES('S6_B2');
INSERT INTO seats(seat_id) VALUES('S6_B3');
INSERT INTO seats(seat_id) VALUES('S6_B4');
INSERT INTO seats(seat_id) VALUES('S6_C1');
INSERT INTO seats(seat_id) VALUES('S6_C2');
INSERT INTO seats(seat_id) VALUES('S6_C3');
INSERT INTO seats(seat_id) VALUES('S6_C4');


CREATE TABLE books (
b_id VARCHAR2(20) CONSTRAINT books_pk PRIMARY KEY,
title VARCHAR2(50),
author VARCHAR2(30),
publisher VARCHAR2(30),
b_major VARCHAR2(30) NULL
);

INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00000' , '인체생리학' , '편집부' , '라이프사이언스' , '식품영양학과' ); 
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00001' , '거시경제학' , 'N. Gregory Mankiw' , '시그마프레스' , '경제학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00002' , '경제학원론' , '이준구, 이창용' , '문우사' , '경제학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00003' , '비모수통계학' , '송문섭' , '자유아카데미' , '통계학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00004' , '수리통계학' , 'Hogg, Tanis, Zimmerman' , '자유아카데미' , '통계학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00005' , 'R을 이용한 통계계산' , '김달호' , '자유아카데미' , '통계학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00006' , 'SAS를 활용한 범주형 자료분석' , '홍종선' , '자유아카데미' , '통계학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00007' , '무용과 인체과학' , '나경아' , '보고사' , '무용과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00008' , '법학개론' , '홍완식' , '피앤씨미디어' , '법학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00009' , '국어 문법론' , '송창선' , '박이정' , '한국어문학부' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00010' , 'OS? Oh Yes' , '김주균' , '휴먼사이언스' , '컴퓨터과학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00011' , '프로그래밍 언어론' , 'Robert W. Sebesta' , 'PEARSON' , '컴퓨터과학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00012' , '명품 JAVA Programming' , '황기태, 김효수' , '생능출판' , '컴퓨터과학과' );
INSERT INTO books (b_id, title, author, publisher, b_major) values ('b00013' , '건축학 개론' , '이범재, 배시화' , ' 기문당' , '건축학과' );
INSERT INTO books (b_id, title, author, publisher) values ('b00014' , '코로나 이후의 세계' , '제이슨 생커' , '미디어숲'  );
INSERT INTO books (b_id, title, author, publisher) values ('b00015' , '애쓰지 않고 편안하게' , '김수현' , '놀'  );
INSERT INTO books (b_id, title, author, publisher) values ('b00016' , '지리의 힘' , '팀 마샬' , '사이' );
INSERT INTO books (b_id, title, author, publisher) values ('b00017' , '1cm 다이빙' , '태수' , '피카(FIKA)' );
INSERT INTO books (b_id, title, author, publisher) values ('b00018' , '내가 원하는 것을 나도 모를 때' , '전승환' , '다산초당' );
INSERT INTO books (b_id, title, author, publisher) values ('b00019' , '녹나무의 파수꾼' , '히가시노 게이고' , '소미미디어' );


CREATE TABLE checkOut
(b_id  VARCHAR2(20) CONSTRAINT ck_fk REFERENCES books(b_id),
s_id  VARCHAR2(10) CONSTRAINT ck_fk2 REFERENCES students(s_id),
ck_date DATE,
CONSTRAINT ck_pk PRIMARY KEY (b_id, s_id)
);

CREATE TABLE reserve
(b_id   VARCHAR2(20) CONSTRAINT res_fk REFERENCES books(b_id),
s_id  VARCHAR2(10) CONSTRAINT res_fk2 REFERENCES students(s_id),
r_date DATE,
CONSTRAINT res_pk PRIMARY KEY (b_id, s_id)
);