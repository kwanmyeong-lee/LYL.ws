--���̺� , ������ ����
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

/* �Խñ� ��� */
CREATE TABLE BOARDCOMMENT (
	bcNo NUMBER NOT NULL, /* ��� ��ȣ */
	bcCom VARCHAR2(255) NOT NULL, /* ���� */
	bcDate TIMESTAMP DEFAULT sysdate NOT NULL, /* ��¥ */
	bcStep NUMBER DEFAULT 0, /* ��� �ܰ� */
	bcSort NUMBER DEFAULT 0, /* ��� ���� ��ȣ */
	bcGroupNo NUMBER, /* ��� �׷� ��ȣ */
	boNo NUMBER NOT NULL, /* �Խ��ǹ�ȣ */
	userNo NUMBER NOT NULL, /* ũ�������� */
	userId VARCHAR2(100) NOT NULL /* �۾��� */
);

ALTER TABLE BOARDCOMMENT
	ADD
		CONSTRAINT PK_BOARDCOMMENT
		PRIMARY KEY (
			bcNo
		);

/* �Խ��� */
CREATE TABLE MYBOARD (
	boNo NUMBER NOT NULL, /* �Խ��ǹ�ȣ */
	boTitle VARCHAR2(255) NOT NULL, /* ���� */
	boCon VARCHAR2(255) NOT NULL, /* ���� */
	boHits NUMBER DEFAULT 0, /* ��ȸ�� */
	boCom NUMBER DEFAULT 0, /* ��ۼ� */
	boDate TIMESTAMP DEFAULT sysdate NOT NULL, /* �ۼ��� */
	userNo NUMBER NOT NULL, /* ũ�������� */
	userId VARCHAR2(100) NOT NULL /* �۾��� */
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
		CONSTRAINT FK_USER_TO_MYBOARD
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