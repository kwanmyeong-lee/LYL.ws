--전체 테이블, 시퀀스 삭제--
drop table myuser CASCADE CONSTRAINTS;
drop table video CASCADE CONSTRAINTS;
drop table mycomment CASCADE CONSTRAINTS;
drop table myboard CASCADE CONSTRAINTS;
drop table bobycom CASCADE CONSTRAINTS;
drop table commentlike CASCADE CONSTRAINTS;
drop table watchrecord CASCADE CONSTRAINTS;
drop table aftervideo CASCADE CONSTRAINTS;
drop table videolike CASCADE CONSTRAINTS;
drop table theme CASCADE CONSTRAINTS;
drop table hint CASCADE CONSTRAINTS;
drop table subscrib CASCADE CONSTRAINTS;
drop sequence myuser_seq;
drop sequence video_seq;
drop sequence mycomment_seq;
drop sequence bobycom_seq;
drop sequence myboard_seq;
drop sequence theme_seq;
-- 전체 테이블, 시퀀스 삭제--

--시퀀스---
create sequence myuser_seq
start with 1
increment by 1
nocache;

create sequence video_seq
start with 1
increment by 1
nocache;

create sequence mycomment_seq
start with 1
increment by 1
nocache;

create sequence bobycom_seq
start with 1
increment by 1
nocache;

create sequence myboard_seq
start with 1
increment by 1
nocache;

create sequence theme_seq
start with 1
increment by 1
nocache;
--시퀀스----

/* 회원 정보 */
CREATE TABLE MYUSER (
	userNo NUMBER NOT NULL, /* 크리에이터 */
	userId VARCHAR2(100) NOT NULL, /* 아이디 */
	userPwd VARCHAR2(100) NOT NULL, /* 비밀번호 */
	userName VARCHAR2(50) NOT NULL, /* 이름 */
	userPhone NUMBER NOT NULL, /* 폰번호 */
	userEmail VARCHAR2(255) NOT NULL, /* 이메일 */
	userJoin TIMESTAMP DEFAULT sysdate, /* 가입일 */
	userSub NUMBER DEFAULT 0 /* 구독자수 */
);

CREATE UNIQUE INDEX PK_MYUSER
	ON MYUSER (
		userNo ASC
	);

ALTER TABLE MYUSER
	ADD
		CONSTRAINT PK_MYUSER
		PRIMARY KEY (
			userNo
		);

/* 시청 기록 */
CREATE TABLE WATCHRECORD (
	userNo NUMBER NOT NULL, /* 크리에이터 */
	vidNo NUMBER NOT NULL, /* 영상 번호 */
	watchDate TIMESTAMP DEFAULT sysdate NOT NULL /* 시청 날짜 */
);

/* 영상좋아요 */
CREATE TABLE VIDEOLIKE (
	vidNo NUMBER NOT NULL, /* 영상 번호 */
	userNo NUMBER NOT NULL /* 크리에이터 */
);

/* 나중에볼 동영상 */
CREATE TABLE AFTERVIDEO (
	userNo NUMBER NOT NULL, /* 크리에이터 */
	vidNo NUMBER NOT NULL /* 영상 번호 */
);

/* 댓글좋아요 */
CREATE TABLE COMMENTLIKE (
	comNo NUMBER NOT NULL, /* 댓글 번호 */
	userNo NUMBER NOT NULL /* 크리에이터 */
);

/* 태마별 영상 */
CREATE TABLE THEME (
	thNo NUMBER NOT NULL, /* 태마번호 */
	thName VARCHAR2(100) NOT NULL /* 태마이름 */
);

CREATE UNIQUE INDEX PK_THEME
	ON THEME (
		thNo ASC
	);

ALTER TABLE THEME
	ADD
		CONSTRAINT PK_THEME
		PRIMARY KEY (
			thNo
		);

/* 구독 자 */
CREATE TABLE SUBSCRIB (
	userNo2 NUMBER, /* 크리에이터 */
	userNo NUMBER /* 구독자 */
);

/* 영상 */
CREATE TABLE VIDEO (
	vidNo NUMBER NOT NULL, /* 영상 번호 */
	vidTitle VARCHAR2(255) NOT NULL, /* 제목 */
	vidHits NUMBER DEFAULT 0, /* 조회수 */
	vidCom NUMBER DEFAULT 0, /* 댓글 */
	vidurl VARCHAR2(255) NOT NULL, /* 영상경로 */
	vidLike NUMBER DEFAULT 0, /* 좋아요 */
	vidDate TIMESTAMP DEFAULT sysdate, /* 업로드 시간 */
	vidEx VARCHAR2(255), /* 영상 설명 */
	vidTheme NUMBER NOT NULL, /* 태마 번호 */
	userNo NUMBER, /* 크리에이터 */
	vidThu VARCHAR2(255) NOT NULL /* 썸네일경로 */
);

CREATE UNIQUE INDEX PK_VIDEO
	ON VIDEO (
		vidNo ASC
	);

ALTER TABLE VIDEO
	ADD
		CONSTRAINT PK_VIDEO
		PRIMARY KEY (
			vidNo
		);

/* 영상댓글 */
CREATE TABLE MYCOMMENT (
	comNo NUMBER NOT NULL, /* 댓글 번호 */
	comCon VARCHAR2(255), /* 내용 */
	comDate TIMESTAMP DEFAULT sysdate, /* 날짜 */
	comRe NUMBER DEFAULT 0, /* 답글수 */
	comLike NUMBER DEFAULT 0, /* 좋아요 */
	comSec NUMBER DEFAULT 0, /* 비밀글 여부 */
	vidNo NUMBER, /* 영상 번호 */
	userNo NUMBER, /* 크리에이터 */
	comStep NUMBER DEFAULT 0, /* 댓글 단계 */
	comSort NUMBER DEFAULT 0, /* 댓글 정렬 번호 */
	comGroup NUMBER /* 댓글 그룹 번호 */
);

CREATE UNIQUE INDEX PK_MYCOMMENT
	ON MYCOMMENT (
		comNo ASC
	);

ALTER TABLE MYCOMMENT
	ADD
		CONSTRAINT PK_MYCOMMENT
		PRIMARY KEY (
			comNo
		);

/* 게시글 댓글 */
CREATE TABLE BOBYCOM (
	bcNo NUMBER NOT NULL, /* 댓글 번호 */
	bcCom VARCHAR2(255), /* 내용 */
	bcDate TIMESTAMP DEFAULT sysdate, /* 날짜 */
	bcRe NUMBER DEFAULT 0, /* 답글수 */
	bcLike NUMBER DEFAULT 0, /* 좋아요 */
	bcSec NUMBER DEFAULT 0, /* 비밀글 여부 */
	bcStep NUMBER DEFAULT 0, /* 댓글 단계 */
	bcSort NUMBER DEFAULT 0, /* 댓글 정렬 번호 */
	bcGroupNo NUMBER, /* 댓글 그룹 번호 */
	boNo NUMBER, /* 번호 */
	userNo NUMBER /* 크리에이터 */
);

CREATE UNIQUE INDEX PK_BOBYCOM
	ON BOBYCOM (
		bcNo ASC
	);

ALTER TABLE BOBYCOM
	ADD
		CONSTRAINT PK_BOBYCOM
		PRIMARY KEY (
			bcNo
		);

/* 게시판 */
CREATE TABLE MYBOARD (
	boNo NUMBER NOT NULL, /* 번호 */
	boTitle VARCHAR2(255) NOT NULL, /* 제목 */
	boCon CLOB, /* 내용 */
	boHits NUMBER DEFAULT 0, /* 조회수 */
	boCom NUMBER DEFAULT 0, /* 댓글수 */
	boDate TIMESTAMP DEFAULT sysdate, /* 작성일 */
	boSec NUMBER DEFAULT 0, /* 비밀글 여부 */
	userNo NUMBER, /* 크리에이터 */
	userNo2 NUMBER, /* 글쓴이 */
	boMyNo NUMBER DEFAULT 1, /* 마이페이지별 글번호 */
	boStep NUMBER DEFAULT 0, /* 게시글 단계 */
	boSort NUMBER DEFAULT 0, /* 게시글 정렬 번호 */
	boGroupNo NUMBER /* 게시글 그룹번호 */
);

CREATE UNIQUE INDEX PK_MYBOARD
	ON MYBOARD (
		boNo ASC
	);

ALTER TABLE MYBOARD
	ADD
		CONSTRAINT PK_MYBOARD
		PRIMARY KEY (
			boNo
		);

/* 힌트 질문  */
CREATE TABLE HINT (
	hintQuest VARCHAR2(255) NOT NULL, /* 질문 */
	hintAns VARCHAR2(255) NOT NULL, /* 답 */
	userNo NUMBER NOT NULL /* 크리에이터 */
);

ALTER TABLE WATCHRECORD
	ADD
		CONSTRAINT FK_MYUSER_TO_WATCHRECORD
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE WATCHRECORD
	ADD
		CONSTRAINT FK_VIDEO_TO_WATCHRECORD
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE VIDEOLIKE
	ADD
		CONSTRAINT FK_VIDEO_TO_VIDEOLIKE
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE VIDEOLIKE
	ADD
		CONSTRAINT FK_MYUSER_TO_VIDEOLIKE
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE AFTERVIDEO
	ADD
		CONSTRAINT FK_MYUSER_TO_AFTERVIDEO
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE AFTERVIDEO
	ADD
		CONSTRAINT FK_VIDEO_TO_AFTERVIDEO
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE COMMENTLIKE
	ADD
		CONSTRAINT FK_MYCOMMENT_TO_COMMENTLIKE
		FOREIGN KEY (
			comNo
		)
		REFERENCES MYCOMMENT (
			comNo
		);

ALTER TABLE COMMENTLIKE
	ADD
		CONSTRAINT FK_MYUSER_TO_COMMENTLIKE
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE SUBSCRIB
	ADD
		CONSTRAINT FK_MYUSER_TO_SUBSCRIB
		FOREIGN KEY (
			userNo2
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE SUBSCRIB
	ADD
		CONSTRAINT FK_MYUSER_TO_SUBSCRIB2
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE VIDEO
	ADD
		CONSTRAINT FK_MYUSER_TO_VIDEO
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE MYCOMMENT
	ADD
		CONSTRAINT FK_VIDEO_TO_MYCOMMENT
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE MYCOMMENT
	ADD
		CONSTRAINT FK_MYUSER_TO_MYCOMMENT
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE BOBYCOM
	ADD
		CONSTRAINT FK_MYBOARD_TO_BOBYCOM
		FOREIGN KEY (
			boNo
		)
		REFERENCES MYBOARD (
			boNo
		);

ALTER TABLE BOBYCOM
	ADD
		CONSTRAINT FK_MYUSER_TO_BOBYCOM
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE MYBOARD
	ADD
		CONSTRAINT FK_MYUSER_TO_MYBOARD
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE MYBOARD
	ADD
		CONSTRAINT FK_MYUSER_TO_MYBOARD2
		FOREIGN KEY (
			userNo2
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE HINT
	ADD
		CONSTRAINT FK_MYUSER_TO_HINT
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);
        
--유저 정보--        
insert into myuser values(myuser_seq.nextval,'admin','admin','admin',01000000000,'lyl@gmail.com',default,default);
--유저 정보--

--테마 정보--
insert into theme values(theme_seq.nextval,'게임');
insert into theme values(theme_seq.nextval,'영화');
insert into theme values(theme_seq.nextval,'학습');
insert into theme values(theme_seq.nextval,'스포츠');
--테마 정보--

--비디오 정보--
insert into video values(video_seq.nextval,'2021년PC온라인게임순위 전세계TOP10',default,default,'https://www.youtube.com/embed/XDB-ew_nFjo',default,default,'2021년 PC 온라인게임순위 (1월통합)',1,1,'http://img.youtube.com/vi/XDB-ew_nFjo/maxresdefault.jpg');
insert into video values(video_seq.nextval,'게임판 사고사례는 게임보다 더 황당하다 [2021 2분기 이왜진 게임뉴스]',default,default,'https://www.youtube.com/embed/0eiDYPxnt4c',default,default,'30년차 테트리스 고인물 / BTS마저 찌바르는 겜덕력 / 추신수 빠른무한 / 일본 국민게임에서 일본 때려잡는 한국인 / 삼탈워 참수 사태 등',1,1,'http://img.youtube.com/vi/0eiDYPxnt4c/maxresdefault.jpg');
insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',1,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'영상 제목',default,default,'video/lala.mp4',default,default,'내용',1,1,'thumbnail/lala.png');

insert into video values(video_seq.nextval,'정말... 이 영화가 개봉한다고...?',default,default,'https://www.youtube.com/embed/R7HGsxi47l8',default,default,'*본 영상은 유료광고를 포함하고 있습니다.',2,1,'http://img.youtube.com/vi/R7HGsxi47l8/maxresdefault.jpg');
insert into video values(video_seq.nextval,'10,000명 몽골 대군을 막아낸 산골 마을 사냥꾼의 전설 [영화리뷰 결말포함]',default,default,'https://www.youtube.com/embed/aH9BWyAP2JI',default,default,'[ 라이징 호크, 2019 ]',2,1,'http://img.youtube.com/vi/aH9BWyAP2JI/maxresdefault.jpg');
insert into video values(video_seq.nextval,'너무 무서워 관객이 3명 기절한 영화 (영화리뷰 결말포함)',default,default,'https://www.youtube.com/embed/I8nZ3VhpLJw',default,default,'틀딱이 소개하는 영화리뷰 시작합니다.',2,1,'http://img.youtube.com/vi/I8nZ3VhpLJw/maxresdefault.jpg');
insert into video values(video_seq.nextval,'영화 속 ''조정석'' 웃긴장면 모음 ZIP',default,default,'https://www.youtube.com/embed/j5jbymJVGT4',default,default,'영화는 [엑시트], [건축학개론], [형]입니다. 안녕하세요 ''영화에미치다'' 매드무비입니다.',2,1,'http://img.youtube.com/vi/j5jbymJVGT4/maxresdefault.jpg');

insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',3,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',3,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',3,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',3,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');

insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',4,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',4,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',4,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',4,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');

--비디오 정보--




--테이블 확인
--select * from myuser;
--select * from myboard;
--select * from mycomment;
--select * from bobycom;
--select * from video;   
select * from theme;