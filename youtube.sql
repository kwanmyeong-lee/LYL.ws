--��ü ���̺�, ������ ����--
drop table myuser CASCADE CONSTRAINTS;
drop table video CASCADE CONSTRAINTS;
drop table comment CASCADE CONSTRAINTS;
drop table board CASCADE CONSTRAINTS;
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
drop sequence comment_seq;
drop sequence bobycom_seq;
drop sequence board_seq;
-- ��ü ���̺�, ������ ����--

--������---
create sequence myuser_seq
start with 1
increment by 1;
nocache;

create sequence video_seq
start with 1
increment by 1;
nocache;

create sequence comment_seq
start with 1
increment by 1;
nocache;

create sequence bobycom_seq
start with 1
increment by 1;
nocache;

create sequence board_seq
start with 1
increment by 1;
nocache;
--������----

/* ȸ�� ���� */
CREATE TABLE MYUSER (
	userNo NUMBER NOT NULL, /* ũ�������� */
	userId VARCHAR2(100) NOT NULL, /* ���̵� */
	userPwd VARCHAR2(100) NOT NULL, /* ��й�ȣ */
	userName VARCHAR2(50) NOT NULL, /* �̸� */
	userPhone NUMBER NOT NULL, /* ����ȣ */
	userEmail VARCHAR2(255) NOT NULL, /* �̸��� */
	userJoin TIMESTAMP DEFAULT sysdate, /* ������ */
	userSub NUMBER DEFAULT 0 /* �����ڼ� */
);

CREATE UNIQUE INDEX PK_USER
	ON USER (
		userNo ASC
	);

ALTER TABLE USER
	ADD
		CONSTRAINT PK_USER
		PRIMARY KEY (
			userNo
		);


/* ��û ��� */
CREATE TABLE WATCHRECORD (
	userNo NUMBER, /* ũ�������� */
	vidNo NUMBER, /* ���� ��ȣ */
	watchDate TIMESTAMP DEFAULT sysdate /* ��û ��¥ */
);

/* �������ƿ� */
CREATE TABLE VIDEOLIKE (
	vidNo NUMBER, /* ���� ��ȣ */
	userNo NUMBER /* ũ�������� */
);

/* ���߿��� ������ */
CREATE TABLE AFTERVIDEO (
	userNo NUMBER, /* ũ�������� */
	vidNo NUMBER /* ���� ��ȣ */
);

/* ������ƿ� */
CREATE TABLE COMMENTLIKE (
	comNo NUMBER, /* ��� ��ȣ */
	userNo NUMBER /* ũ�������� */
);

/* �¸��� ���� */
CREATE TABLE THEME (
	thNo NUMBER NOT NULL, /* �¸���ȣ */
	thName VARCHAR2(100) NOT NULL /* �¸��̸� */
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

/* ���� �� */
CREATE TABLE SUBSCRIB (
	userNo2 NUMBER, /* ũ�������� */
	userNo NUMBER /* ������ */
);

/* ���� */
CREATE TABLE VIDEO (
	vidNo NUMBER NOT NULL, /* ���� ��ȣ */
	vidTitle VARCHAR2(255) NOT NULL, /* ���� */
	vidHits NUMBER DEFAULT 0, /* ��ȸ�� */
	vidCom VARCHAR2(255) DEFAULT 0, /* ��� */
	vidLike NUMBER DEFAULT 0, /* ���ƿ� */
	vidDate TIMESTAMP DEFAULT sysdate, /* ���ε� �ð� */
	vidEx VARCHAR2(255), /* ���� ���� */
	vidTheme NUMBER NOT NULL, /* �¸� ��ȣ */
	userNo NUMBER /* ũ�������� */
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

/* ������ */
CREATE TABLE COMMENT (
	comNo NUMBER NOT NULL, /* ��� ��ȣ */
	comCon VARCHAR2(255), /* ���� */
	comDate TIMESTAMP DEFAULT sysdate, /* ��¥ */
	comRe NUMBER DEFAULT 0, /* ��ۼ� */
	comLike NUMBER DEFAULT 0, /* ���ƿ� */
	comSec NUMBER DEFAULT 0, /* ��б� ���� */
	vidNo NUMBER, /* ���� ��ȣ */
	userNo NUMBER, /* ũ�������� */
	comStep NUMBER DEFAULT 0, /* ��� �ܰ� */
	comSort NUMBER DEFAULT 0, /* ��� ���� ��ȣ */
	comGroup NUMBER /* ��� �׷� ��ȣ */
);

CREATE UNIQUE INDEX PK_COMMENT
	ON COMMENT (
		comNo ASC
	);

ALTER TABLE COMMENT
	ADD
		CONSTRAINT PK_COMMENT
		PRIMARY KEY (
			comNo
		);

/* �Խñ� ��� */
CREATE TABLE BOBYCOM (
	bcNo NUMBER NOT NULL, /* ��� ��ȣ */
	bcCom VARCHAR2(255), /* ���� */
	bcDate TIMESTAMP DEFAULT sysdate, /* ��¥ */
	bcRe NUMBER DEFAULT 0, /* ��ۼ� */
	bcLike NUMBER DEFAULT 0, /* ���ƿ� */
	bcSec NUMBER DEFAULT 0, /* ��б� ���� */
	bcStep NUMBER DEFAULT 0, /* ��� �ܰ� */
	bcSort NUMBER DEFAULT 0, /* ��� ���� ��ȣ */
	bcGroupNo NUMBER, /* ��� �׷� ��ȣ */
	boNo NUMBER, /* ��ȣ */
	userNo NUMBER /* ũ�������� */
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

/* �Խ��� */
CREATE TABLE BOARD (
	boNo NUMBER NOT NULL, /* ��ȣ */
	boTitle VARCHAR2(255) NOT NULL, /* ���� */
	boCon CLOB, /* ���� */
	boHits NUMBER DEFAULT 0, /* ��ȸ�� */
	boCom NUMBER DEFAULT 0, /* ��ۼ� */
	boDate TIMESTAMP DEFAULT sysdate, /* �ۼ��� */
	boSec NUMBER DEFAULT 0, /* ��б� ���� */
	userNo NUMBER, /* ũ�������� */
	userNo2 NUMBER, /* �۾��� */
	boMyNo NUMBER DEFAULT 1, /* ������������ �۹�ȣ */
	boStep NUMBER DEFAULT 0, /* �Խñ� �ܰ� */
	boSort NUMBER DEFAULT 0, /* �Խñ� ���� ��ȣ */
	boGroupNo NUMBER /* �Խñ� �׷��ȣ */
);

CREATE UNIQUE INDEX PK_BOARD
	ON BOARD (
		boNo ASC
	);

ALTER TABLE BOARD
	ADD
		CONSTRAINT PK_BOARD
		PRIMARY KEY (
			boNo
		);

/* ��Ʈ ����  */
CREATE TABLE HINT (
	hintQuest VARCHAR2(255) NOT NULL, /* ���� */
	hintAns VARCHAR2(255) NOT NULL, /* �� */
	userNo NUMBER /* ũ�������� */
);

ALTER TABLE WATCHRECORD
	ADD
		CONSTRAINT FK_USER_TO_WATCHRECORD
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
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
		CONSTRAINT FK_USER_TO_VIDEOLIKE
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE AFTERVIDEO
	ADD
		CONSTRAINT FK_USER_TO_AFTERVIDEO
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
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
		CONSTRAINT FK_COMMENT_TO_COMMENTLIKE
		FOREIGN KEY (
			comNo
		)
		REFERENCES COMMENT (
			comNo
		);

ALTER TABLE COMMENTLIKE
	ADD
		CONSTRAINT FK_USER_TO_COMMENTLIKE
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE SUBSCRIB
	ADD
		CONSTRAINT FK_USER_TO_SUBSCRIB
		FOREIGN KEY (
			userNo2
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE SUBSCRIB
	ADD
		CONSTRAINT FK_USER_TO_SUBSCRIB2
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE VIDEO
	ADD
		CONSTRAINT FK_USER_TO_VIDEO
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE COMMENT
	ADD
		CONSTRAINT FK_VIDEO_TO_COMMENT
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE COMMENT
	ADD
		CONSTRAINT FK_USER_TO_COMMENT
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE BOBYCOM
	ADD
		CONSTRAINT FK_BOARD_TO_BOBYCOM
		FOREIGN KEY (
			boNo
		)
		REFERENCES BOARD (
			boNo
		);

ALTER TABLE BOBYCOM
	ADD
		CONSTRAINT FK_USER_TO_BOBYCOM
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_USER_TO_BOARD
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE BOARD
	ADD
		CONSTRAINT FK_USER_TO_BOARD2
		FOREIGN KEY (
			userNo2
		)
		REFERENCES USER (
			userNo
		);

ALTER TABLE HINT
	ADD
		CONSTRAINT FK_USER_TO_HINT
		FOREIGN KEY (
			userNo
		)
		REFERENCES USER (
			userNo
		);
        
        

