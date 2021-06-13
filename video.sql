--��ü ���̺�, ������ ����--
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
-- ��ü ���̺�, ������ ����--

--������---
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

/* ��û ��� */
CREATE TABLE WATCHRECORD (
	userNo NUMBER NOT NULL, /* ũ�������� */
	vidNo NUMBER NOT NULL, /* ���� ��ȣ */
	watchDate TIMESTAMP DEFAULT sysdate NOT NULL /* ��û ��¥ */
);

/* �������ƿ� */
CREATE TABLE VIDEOLIKE (
	vidNo NUMBER NOT NULL, /* ���� ��ȣ */
	userNo NUMBER NOT NULL /* ũ�������� */
);

/* ���߿��� ������ */
CREATE TABLE AFTERVIDEO (
	userNo NUMBER NOT NULL, /* ũ�������� */
	vidNo NUMBER NOT NULL /* ���� ��ȣ */
);

/* ������ƿ� */
CREATE TABLE COMMENTLIKE (
	comNo NUMBER NOT NULL, /* ��� ��ȣ */
	userNo NUMBER NOT NULL /* ũ�������� */
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
	vidCom NUMBER DEFAULT 0, /* ��� */
	vidurl VARCHAR2(255) NOT NULL, /* ������ */
	vidLike NUMBER DEFAULT 0, /* ���ƿ� */
	vidDate TIMESTAMP DEFAULT sysdate, /* ���ε� �ð� */
	vidEx VARCHAR2(255), /* ���� ���� */
	vidTheme NUMBER NOT NULL, /* �¸� ��ȣ */
	userNo NUMBER, /* ũ�������� */
	vidThu VARCHAR2(255) NOT NULL /* ����ϰ�� */
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
CREATE TABLE MYCOMMENT (
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
CREATE TABLE MYBOARD (
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

/* ��Ʈ ����  */
CREATE TABLE HINT (
	hintQuest VARCHAR2(255) NOT NULL, /* ���� */
	hintAns VARCHAR2(255) NOT NULL, /* �� */
	userNo NUMBER NOT NULL /* ũ�������� */
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
        
--���� ����--        
insert into myuser values(myuser_seq.nextval,'admin','admin','admin',01000000000,'lyl@gmail.com',default,default);
--���� ����--

--�׸� ����--
insert into theme values(theme_seq.nextval,'����');
insert into theme values(theme_seq.nextval,'��ȭ');
insert into theme values(theme_seq.nextval,'�н�');
insert into theme values(theme_seq.nextval,'������');
--�׸� ����--

--���� ����--
insert into video values(video_seq.nextval,'2021��PC�¶��ΰ��Ӽ��� ������TOP10',default,default,'https://www.youtube.com/embed/XDB-ew_nFjo',default,default,'2021�� PC �¶��ΰ��Ӽ��� (1������)',1,1,'http://img.youtube.com/vi/XDB-ew_nFjo/maxresdefault.jpg');
insert into video values(video_seq.nextval,'������ ����ʴ� ���Ӻ��� �� Ȳ���ϴ� [2021 2�б� �̿��� ���Ӵ���]',default,default,'https://www.youtube.com/embed/0eiDYPxnt4c',default,default,'30���� ��Ʈ���� ���ι� / BTS���� ��ٸ��� �״��� / �߽ż� �������� / �Ϻ� ���ΰ��ӿ��� �Ϻ� ������� �ѱ��� / ��Ż�� ���� ���� ��',1,1,'http://img.youtube.com/vi/0eiDYPxnt4c/maxresdefault.jpg');
insert into video values(video_seq.nextval,'���忡 �Ǵٽ� ���� ���̷���, �˷��� �Ӽ��� �׾�߸� �Ѵ� - ������Ÿ�� 2 ���丮 �Ѵ��� ����',default,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'�� ���� ����',1,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'���� ����',default,default,'video/lala.mp4',default,default,'����',1,1,'thumbnail/lala.png');
--���� ����--




--���̺� Ȯ��
--select * from myuser;
--select * from myboard;
--select * from mycomment;
--select * from bobycom;
--select * from video;   