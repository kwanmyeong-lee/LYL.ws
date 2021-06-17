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
	userSub NUMBER DEFAULT 0, /* �����ڼ� */
    userImgName varchar(255)  NULL ,/* �����̹����̸�*/
    userImgSize number default 0, /*�����̹���������*/
    userImgOriName varchar(255) null, /*�̹��� ������ ���ϸ�*/
    userDelFalg char default 'N' /*���� Flag*/     
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
insert into myuser values(myuser_seq.nextval,'admin','admin','admin',01000000000,'lyl@gmail.com',default,default,null,default,null, default );
insert into myuser values(myuser_seq.nextval,'aaa','aaa','aaa',01000000001,'aaa@gmail.com',default,default,null,default,null, default );
insert into myuser values(myuser_seq.nextval,'bbb','bbb','bbb',01000000002,'bbb@gmail.com',default,default,null,default,null, default );
--���� ����--


--�׸� ����--
insert into theme values(theme_seq.nextval,'����');
insert into theme values(theme_seq.nextval,'��ȭ');
insert into theme values(theme_seq.nextval,'�н�');
insert into theme values(theme_seq.nextval,'������');
--�׸� ����--


--���� ����--
--���� no 1--
insert into video values(video_seq.nextval,'2021��PC�¶��ΰ��Ӽ��� ������TOP10',1000,default,'https://www.youtube.com/embed/XDB-ew_nFjo',default,default,'2021�� PC �¶��ΰ��Ӽ��� (1������)',1,1,'http://img.youtube.com/vi/XDB-ew_nFjo/maxresdefault.jpg');
insert into video values(video_seq.nextval,'������ ����ʴ� ���Ӻ��� �� Ȳ���ϴ� [2021 2�б� �̿��� ���Ӵ���]',99999,default,'https://www.youtube.com/embed/0eiDYPxnt4c',default,default,'30���� ��Ʈ���� ���ι� / BTS���� ��ٸ��� �״��� / �߽ż� �������� / �Ϻ� ���ΰ��ӿ��� �Ϻ� ������� �ѱ��� / ��Ż�� ���� ���� ��',1,1,'http://img.youtube.com/vi/0eiDYPxnt4c/maxresdefault.jpg');
insert into video values(video_seq.nextval,'���忡 �Ǵٽ� ���� ���̷���, �˷��� �Ӽ��� �׾�߸� �Ѵ� - ������Ÿ�� 2 ���丮 �Ѵ��� ����',100000,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'�� ���� ����',1,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg');
insert into video values(video_seq.nextval,'���� ����',default,default,'video/lala.mp4',1000000,default,'����',1,1,'../thumbnail/lala.png');

--��ȭ no 2--
insert into video values(video_seq.nextval,'����... �� ��ȭ�� �����Ѵٰ�...?',default,default,'https://www.youtube.com/embed/R7HGsxi47l8',default,default,'*�� ������ ���ᱤ�� �����ϰ� �ֽ��ϴ�.',2,1,'http://img.youtube.com/vi/R7HGsxi47l8/maxresdefault.jpg');
insert into video values(video_seq.nextval,'10,000�� ���� �뱺�� ���Ƴ� ��� ���� ��ɲ��� ���� [��ȭ���� �ḻ����]',default,default,'https://www.youtube.com/embed/aH9BWyAP2JI',default,default,'[ ����¡ ȣũ, 2019 ]',2,1,'http://img.youtube.com/vi/aH9BWyAP2JI/maxresdefault.jpg');
insert into video values(video_seq.nextval,'�� ���ڸ� �����ϸ� ������� ���� �������ϴ�... (�ḻ ����)',default,default,'https://youtu.be/RNbJTDSgTLY',default,default,'Ʋ���� �Ұ��ϴ� ��ȭ���� �����մϴ�.',2,1,'http://img.youtube.com/vi/RNbJTDSgTLY/maxresdefault.jpg');
insert into video values(video_seq.nextval,'��ȭ �� ''������'' ������� ���� ZIP',default,default,'https://www.youtube.com/embed/j5jbymJVGT4',default,default,'��ȭ�� [����Ʈ], [�����а���], [��]�Դϴ�. �ȳ��ϼ��� ''��ȭ����ġ��'' �ŵ幫���Դϴ�.',2,1,'http://img.youtube.com/vi/j5jbymJVGT4/maxresdefault.jpg');


--�н� no 3 --
insert into video values(video_seq.nextval, '���ν�Ÿ���� �޾Ҵ� ����', default,default,'https://youtu.be/embed/hcymislezjI', default, default, '���𰡸� ������ �� �� �� ���θ� �� �ؾ� �ϴ°� ', 3, 1,'http://img.youtube.com/vi/hcymislezjI/maxresdefault.jpg');
insert into video values(video_seq.nextval, '�� ��ȹ��� �����ϸ� �ݵ�� �����մϴ�. (�н� ��ȹǥ)', default,default,'https://youtu.be/embed/KQYJ_0yr-1Q', default, default, '���ΰ� �����Ű���? �� ��ȹ��ζ�� �ݵ�� �����մϴ�! ��ȹǥ�� �޾ư�����', 3, 1,'http://img.youtube.com/vi/KQYJ_0yr-1Q/maxresdefault.jpg');
insert into video values(video_seq.nextval, '����� ������ ���͵� �÷���. [�н� ��ȹ�� + ���� ���߷�] �Ѳ����� 2����.', default,default,'https://youtu.be/embed/o2-rsPs47Zw', default, default, '������� �ִ� ����� ��ȹ ����� ��, ���� ���ϴ� ��.', 3, 1,'http://img.youtube.com/vi/o2-rsPs47Zw/maxresdefault.jpg');
insert into video values(video_seq.nextval, '�ʵ��л� �ڱ��ֵ��н� �����ϴ� 10���� ��� + �̽� ����ö��', default,default,'https://youtu.be/embed/wxdmIjLMPJM', default, default, '��ħ�� �ΰ��� ���� ���̰� �ֵ������� ������ �н��� �� �� �ְ� ', 3, 1,'http://img.youtube.com/vi/wxdmIjLMPJM/maxresdefault.jpg');
insert into video values(video_seq.nextval, '�ڱ��ֵ��н��� �߿��մϴ�. �׷��� �ְ�Ǿ� �ֽ��ϴ�. | �ڱ��ֵ��н��� ��Ȯ�� ���', default,default,'https://youtu.be/embed/qIUDyLBAOdg', default, default, '��ΰ� �߿��ϴٰ� �ϴ� �ڱ��ֵ��н� ', 3, 1,'http://img.youtube.com/vi/qIUDyLBAOdg/maxresdefault.jpg');
insert into video values(video_seq.nextval, '�����ϴ� ��, ���� | Ȳ�� ������б� �����к� ���� | ���� �н� ���� ����', default,default,'https://youtu.be/embed/ukjYwSiYT1I', default, default, '? ���� �Ұ� : ������ �ƹ��� ��ƴٰ� �ص�, ���� ', 3, 1,'http://img.youtube.com/vi/ukjYwSiYT1I/maxresdefault.jpg');
insert into video values(video_seq.nextval, '[����ο�,�����ڱ�] ���������� ��� ���°�?', default,default,'https://youtu.be/embed/3XvGdiE_RlI', default, default, '���� �� ''��������''�� ��ó�� ������ �������? ', 3, 1,'http://img.youtube.com/vi/3XvGdiE_RlI/maxresdefault.jpg');
insert into video values(video_seq.nextval, '�����3121���� ���������� ���� ���ι��� �����մϴ�', default,default,'https://youtu.be/sacbcLnZt8w', default, default, '�����3121���� ���������� ���� ���ι��� �����մϴ�. ', 3, 1,'http://img.youtube.com/vi/sacbcLnZt8w/maxresdefault.jpg');

--������ no 4--
insert into video values(video_seq.nextval, '������ ����� ���� ���� �ȵǴ� 30���� ����', default,default,'https://youtu.be/embed/kRbC5CJeXec', default, default, '�̰� ���� ���� ���� ������ ���װ� �ƴմϴ�, ������ ���� �������� ���� �� �ִ� ������', 4, 1,'http://img.youtube.com/vi/kRbC5CJeXec/maxresdefault.jpg');
insert into video values(video_seq.nextval, '2020��, �׷����� �츮�� �������� ����ϴ� ����', default,default,'https://youtu.be/embed/aJzltMZQ2IA', default, default, '2020���� ������ ��� �е�, �����ϼ̽��ϴ�.', 4, 1,'http://img.youtube.com/vi/aJzltMZQ2IA/maxresdefault.jpg');
insert into video values(video_seq.nextval, '���� ������ ���ذ��� ���� �Ǽ��� - ������ ���� ����', default,default,'https://youtu.be/embed/A3P4c5mwgtA', default, default, '�����̵� �������� ������ ���� �ִ�', 4, 1,'http://img.youtube.com/vi/A3P4c5mwgtA/maxresdefault.jpg');
insert into video values(video_seq.nextval, '[�����������] ''����Ÿũ��vs����''�� ������ �̷� ����Դϴ�', default,default,'https://youtu.be/embed/Fm1GRdXS17k', default, default, '������ ����� 2ź!', 4, 1,'http://img.youtube.com/vi/Fm1GRdXS17k/maxresdefault.jpg');
insert into video values(video_seq.nextval, '���迡�� ���� ������ ������ ��׽� TOP9', default,default,'https://youtu.be/embed/RAMmLllvZlo', default, default, '400���䰡 �Ѿ��� �� ������ �������� ���������ٴ�', 4, 1,'http://img.youtube.com/vi/RAMmLllvZlo/maxresdefault.jpg');
insert into video values(video_seq.nextval, '������ ������ ��� ���� ������', default,default,'https://youtu.be/embed/G1mGhvG3bbw', default, default, '������ ������ �������� ��� ������� ������ ���� ������', 4, 1,'http://img.youtube.com/vi/G1mGhvG3bbw/maxresdefault.jpg');
insert into video values(video_seq.nextval, '�ǵ�ġ �ʰ� �߻��� ���� ������ ������', default,default,'https://youtu.be/embed/rMPTkPlFhwo', default, default, '������ �����鵵 ��� ������', 4, 1,'http://img.youtube.com/vi/rMPTkPlFhwo/maxresdefault.jpg');
insert into video values(video_seq.nextval, '�ϱ��� �ʴ� ������ �������� ����', default,default,'https://youtu.be/embed/Eaad-9jEfdo', default, default, '������ ������ �ڽ��� �Ѱ踦 �Ѿ ��', 4, 1,'http://img.youtube.com/vi/Eaad-9jEfdo/maxresdefault.jpg');

--���� ����--

--��� ����--
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�1',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�2',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�3',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�4',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�5',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�6',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�7',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�8',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�9',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�10',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�11',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�12',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�13',default,default,default,default,1,1,default,default,null);
insert into mycomment values(mycomment_seq.nextval,'��۳����Դϴ�14',default,default,default,default,1,1,default,default,null);
--��� ����


commit;


--���̺� Ȯ��
--select * from myuser;
--select * from myboard;
--select * from mycomment;
--select * from bobycom;
--select * from video;   
--select * from theme;
--select * from mycomment;
--select * from (select ROWNUM as rowcnt, a.* from mycomment a where vidno=1 and comgroup is null)
--where rowcnt>=10 and rowcnt<20;
--select * from AFTERVIDEO;
--select * from WATCHRECORD;
--select * from SUBSCRIB;
--
--insert into SUBSCRIB(userNo2, userNo) values(1, 2);

--select * from 
--(select  ad.*, rownum as rowcnt from 
--(select * from video where vidtitle like '%'||'����'||'%' order by vidhits desc)ad)
-- where rowcnt>=0 and rowcnt<10;