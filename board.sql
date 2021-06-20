--테이블 , 시퀀스 삭제
drop table myboard CASCADE CONSTRAINTS;
drop table boardcomment CASCADE CONSTRAINTS;
drop sequence myboard_seq;
drop sequence boardcomment_seq;


create sequence myboard_seq
start with 1
increment by 1
nocache;

create sequence boardcomment_seq
start with 1
increment by 1
nocache;

/* 게시글 댓글 */
CREATE TABLE BOARDCOMMENT (
	bcNo NUMBER NOT NULL, /* 댓글 번호 */
	bcCom VARCHAR2(255) NOT NULL, /* 내용 */
	bcDate TIMESTAMP DEFAULT sysdate NOT NULL, /* 날짜 */
	bcRe NUMBER DEFAULT 0, /* 답글수 */
	bcLike NUMBER DEFAULT 0, /* 좋아요 */
	bcPwd NUMBER DEFAULT 0, /* 비밀번호 */
	bcStep NUMBER DEFAULT 0, /* 댓글 단계 */
	bcSort NUMBER DEFAULT 0, /* 댓글 정렬 번호 */
	bcGroupNo NUMBER, /* 댓글 그룹 번호 */
	boNo NUMBER NOT NULL, /* 게시판번호 */
	userNo NUMBER NOT NULL, /* 크리에이터 */
	userId VARCHAR2(100) NOT NULL /* 글쓴이 */
);

ALTER TABLE BOARDCOMMENT
	ADD
		CONSTRAINT PK_BOARDCOMMENT
		PRIMARY KEY (
			bcNo
		);

/* 게시판 */
CREATE TABLE MYBOARD (
	boNo NUMBER NOT NULL, /* 게시판번호 */
	boTitle VARCHAR2(255) NOT NULL, /* 제목 */
	boCon VARCHAR2(255) NOT NULL, /* 내용 */
	boHits NUMBER DEFAULT 0, /* 조회수 */
	boCom NUMBER DEFAULT 0, /* 댓글수 */
	boDate TIMESTAMP DEFAULT sysdate NOT NULL, /* 작성일 */
	boPwd NUMBER DEFAULT 0, /* 비밀번호 */
	userNo NUMBER NOT NULL, /* 크리에이터 */
	userId VARCHAR2(100) NOT NULL, /* 글쓴이 */
	boStep NUMBER DEFAULT 0, /* 게시글 단계 */
	boSort NUMBER DEFAULT 0, /* 게시글 정렬 번호 */
	boGroupNo NUMBER /* 게시글 그룹번호 */
);

ALTER TABLE MYBOARD
	ADD
		CONSTRAINT PK_MYBOARD
		PRIMARY KEY (
			boNo
		);


ALTER TABLE BOARDCOMMENT
	ADD
		CONSTRAINT FK_MYBOARD_TO_BOARDCOMMENT
		FOREIGN KEY (
			boNo
		)
		REFERENCES MYBOARD (
			boNo
		);

ALTER TABLE BOARDCOMMENT
	ADD
		CONSTRAINT FK_USER_TO_BOARDCOMMENT
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE MYBOARD
	ADD
		CONSTRAINT FK_USER_TO_MYBOARD
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);