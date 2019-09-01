-- ���̺�, ������ ����
/* �Խ��� */
DROP TABLE GS_BOARD CASCADE CONSTRAINTS;

/* �Խñ� */
DROP TABLE GS_POST CASCADE CONSTRAINTS;

/* ����� */
DROP TABLE USERS CASCADE CONSTRAINTS;

/* ÷������ */
DROP TABLE GS_FILE CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE GS_REPLY CASCADE CONSTRAINTS;

/* seq_board */
DROP SEQUENCE seq_board;

/* seq_post */
DROP SEQUENCE seq_post;

/* seq_reply */
DROP SEQUENCE seq_reply;

/* seq_file */
DROP SEQUENCE seq_file;

/* seq_postGn */
DROP SEQUENCE seq_postGn;

----------------------------------------------------------------------------

-- ������ ����
/* seq_board */
CREATE SEQUENCE seq_board;

/* seq_post */
CREATE SEQUENCE seq_post;

/* seq_reply */
CREATE SEQUENCE seq_reply;

/* seq_file */
CREATE SEQUENCE seq_file;

/* seq_postGn */
CREATE SEQUENCE seq_postGn start with 13;

/* �Խ��� */
CREATE TABLE GS_BOARD (
	boardSeq NUMBER NOT NULL, /* �Խ��� ��ȣ */
	boardNm VARCHAR2(100) NOT NULL, /* �Խ��� �̸� */
	userId VARCHAR2(20) NOT NULL, /* ������ */
	boardLocation NUMBER(3) NOT NULL, /* �Խ��� ���� */
	boardStatus NUMBER(1) NOT NULL /* ��뿩�� */
);

COMMENT ON TABLE GS_BOARD IS '�Խ���';

COMMENT ON COLUMN GS_BOARD.boardSeq IS '�Խ��� ��ȣ';

COMMENT ON COLUMN GS_BOARD.boardNm IS '�Խ��� �̸�';

COMMENT ON COLUMN GS_BOARD.userId IS '������';

COMMENT ON COLUMN GS_BOARD.boardLocation IS '�Խ��� ����';

COMMENT ON COLUMN GS_BOARD.boardStatus IS '��뿩��';

CREATE UNIQUE INDEX PK_GS_BOARD
	ON GS_BOARD (
		boardSeq ASC
	);

ALTER TABLE GS_BOARD
	ADD
		CONSTRAINT PK_GS_BOARD
		PRIMARY KEY (
			boardSeq
		);

/* �Խñ� */
CREATE TABLE GS_POST (
	postSeq NUMBER NOT NULL, /* �Խñ� ��ȣ */
	boardSeq NUMBER NOT NULL, /* �Խ��� ��ȣ */
	postNm VARCHAR2(100) NOT NULL, /* �Խñ� ���� */
	postContent CLOB NOT NULL, /* �Խñ� ���� */
	userId VARCHAR2(20) NOT NULL, /* �ۼ��� */
	postRegDate DATE NOT NULL, /* �ۼ��Ͻ� */
	postModDate DATE, /* �����Ͻ� */
	postStatus NUMBER(1) NOT NULL, /* �������� */
	postGn NUMBER NOT NULL, /* �׷� ��ȣ */
	parentSeq NUMBER /* �θ�Խñ۹�ȣ */
);

COMMENT ON TABLE GS_POST IS '�Խñ�';

COMMENT ON COLUMN GS_POST.postSeq IS '�Խñ� ��ȣ';

COMMENT ON COLUMN GS_POST.boardSeq IS '�Խ��� ��ȣ';

COMMENT ON COLUMN GS_POST.postNm IS '�Խñ� ����';

COMMENT ON COLUMN GS_POST.postContent IS '�Խñ� ����';

COMMENT ON COLUMN GS_POST.userId IS '�ۼ���';

COMMENT ON COLUMN GS_POST.postRegDate IS '�ۼ��Ͻ�';

COMMENT ON COLUMN GS_POST.postModDate IS '�����Ͻ�';

COMMENT ON COLUMN GS_POST.postStatus IS '��������';

COMMENT ON COLUMN GS_POST.postGn IS '�׷� ��ȣ';

COMMENT ON COLUMN GS_POST.parentSeq IS '�θ�Խñ۹�ȣ';

CREATE UNIQUE INDEX PK_GS_POST
	ON GS_POST (
		postSeq ASC
	);

ALTER TABLE GS_POST
	ADD
		CONSTRAINT PK_GS_POST
		PRIMARY KEY (
			postSeq
		);

/* ����� */
CREATE TABLE USERS (
	userId VARCHAR2(20) NOT NULL, /* ����� ���̵� */
	userNm VARCHAR2(20), /* ����� �̸� */
	pass VARCHAR2(100), /* ��й�ȣ */
	reg_dt DATE, /* ���� */
	alias VARCHAR2(50), /* ���� */
	addr1 VARCHAR2(50), /* �ּ� */
	addr2 VARCHAR2(50), /* ���ּ� */
	zipCode VARCHAR2(5), /* �����ȣ */
	fileName VARCHAR2(50), /* �̹������ϸ� */
	realFileName VARCHAR2(200) /* �̹������ */
);

COMMENT ON TABLE USERS IS '�����';

COMMENT ON COLUMN USERS.userId IS '����� ���̵�';

COMMENT ON COLUMN USERS.userNm IS '����� �̸�';

COMMENT ON COLUMN USERS.pass IS '��й�ȣ';

COMMENT ON COLUMN USERS.reg_dt IS '����';

COMMENT ON COLUMN USERS.alias IS '����';

COMMENT ON COLUMN USERS.addr1 IS '�ּ�';

COMMENT ON COLUMN USERS.addr2 IS '���ּ�';

COMMENT ON COLUMN USERS.zipCode IS '�����ȣ';

COMMENT ON COLUMN USERS.fileName IS '�̹������ϸ�';

COMMENT ON COLUMN USERS.realFileName IS '�̹������';

CREATE UNIQUE INDEX PK_USERS
	ON USERS (
		userId ASC
	);

ALTER TABLE USERS
	ADD
		CONSTRAINT PK_USERS
		PRIMARY KEY (
			userId
		);

/* ÷������ */
CREATE TABLE GS_FILE (
	fileSeq NUMBER NOT NULL, /* ÷�����Ϲ�ȣ */
	fileName VARCHAR2(50) NOT NULL, /* ���ε����ϸ� */
	realFileName VARCHAR2(200) NOT NULL, /* �������ϰ�� */
	postSeq NUMBER NOT NULL /* �Խñ� ��ȣ */
);

COMMENT ON TABLE GS_FILE IS '÷������';

COMMENT ON COLUMN GS_FILE.fileSeq IS '÷�����Ϲ�ȣ';

COMMENT ON COLUMN GS_FILE.fileName IS '���ε����ϸ�';

COMMENT ON COLUMN GS_FILE.realFileName IS '�������ϰ��';

COMMENT ON COLUMN GS_FILE.postSeq IS '�Խñ� ��ȣ';

CREATE UNIQUE INDEX PK_GS_FILE
	ON GS_FILE (
		fileSeq ASC
	);

ALTER TABLE GS_FILE
	ADD
		CONSTRAINT PK_GS_FILE
		PRIMARY KEY (
			fileSeq
		);

/* ��� */
CREATE TABLE GS_REPLY (
	replySeq NUMBER NOT NULL, /* ��۹�ȣ */
	postSeq NUMBER NOT NULL, /* �Խñ� ��ȣ */
	userId VARCHAR2(20) NOT NULL, /* ����� ���̵� */
	replyContent CLOB NOT NULL, /* ���� */
	replyRegDate DATE NOT NULL, /* �ۼ��Ͻ� */
	replyModDate DATE, /* �����Ͻ� */
	replyStatus NUMBER(1) NOT NULL /* �������� */
);

COMMENT ON TABLE GS_REPLY IS '���';

COMMENT ON COLUMN GS_REPLY.replySeq IS '��۹�ȣ';

COMMENT ON COLUMN GS_REPLY.postSeq IS '�Խñ� ��ȣ';

COMMENT ON COLUMN GS_REPLY.userId IS '����� ���̵�';

COMMENT ON COLUMN GS_REPLY.replyContent IS '����';

COMMENT ON COLUMN GS_REPLY.replyRegDate IS '�ۼ��Ͻ�';

COMMENT ON COLUMN GS_REPLY.replyModDate IS '�����Ͻ�';

COMMENT ON COLUMN GS_REPLY.replyStatus IS '��������';

CREATE UNIQUE INDEX PK_GS_REPLY
	ON GS_REPLY (
		replySeq ASC
	);

ALTER TABLE GS_REPLY
	ADD
		CONSTRAINT PK_GS_REPLY
		PRIMARY KEY (
			replySeq
		);

ALTER TABLE GS_BOARD
	ADD
		CONSTRAINT FK_USERS_TO_GS_BOARD
		FOREIGN KEY (
			userId
		)
		REFERENCES USERS (
			userId
		);

ALTER TABLE GS_POST
	ADD
		CONSTRAINT FK_USERS_TO_GS_POST
		FOREIGN KEY (
			userId
		)
		REFERENCES USERS (
			userId
		);

ALTER TABLE GS_POST
	ADD
		CONSTRAINT FK_GS_BOARD_TO_GS_POST
		FOREIGN KEY (
			boardSeq
		)
		REFERENCES GS_BOARD (
			boardSeq
		);

ALTER TABLE GS_POST
	ADD
		CONSTRAINT FK_GS_POST_TO_GS_POST
		FOREIGN KEY (
			parentSeq
		)
		REFERENCES GS_POST (
			postSeq
		);

ALTER TABLE GS_FILE
	ADD
		CONSTRAINT FK_GS_POST_TO_GS_FILE
		FOREIGN KEY (
			postSeq
		)
		REFERENCES GS_POST (
			postSeq
		);

ALTER TABLE GS_REPLY
	ADD
		CONSTRAINT FK_GS_POST_TO_GS_REPLY
		FOREIGN KEY (
			postSeq
		)
		REFERENCES GS_POST (
			postSeq
		);

ALTER TABLE GS_REPLY
	ADD
		CONSTRAINT FK_USERS_TO_GS_REPLY
		FOREIGN KEY (
			userId
		)
		REFERENCES USERS (
			userId
		);

-- �Խ��� �÷� �߰�     
insert into gs_board values (seq_board.nextval, '�Խ���1', 'brown', '1', '1');
insert into gs_board values (seq_board.nextval, '�Խ���22', 'brown', '2', '1');
insert into gs_board values (seq_board.nextval, '�Խ���333', 'brown', '3', '0');
insert into gs_board values (seq_board.nextval, '�Խ���4444', 'brown', '4', '1');
insert into gs_board values (seq_board.nextval, '�Խ���55555', 'brown', '5', '1');

-- �Խñ� �߰�
insert into gs_post values (seq_post.nextval, 1, 'ù��° ���Դϴ�', '����1', 'brown', sysdate, null, 1, 1, null);
insert into gs_post values (seq_post.nextval, 1, '�ι�° ���Դϴ�', '����2', 'brown', sysdate, null, 1, 2, null);
insert into gs_post values (seq_post.nextval, 1, '����° ���Դϴ�', '����3', 'brown', sysdate, null, 1, 3, null);
insert into gs_post values (seq_post.nextval, 1, '�׹�° ���� �ι�° ���� ����Դϴ�', '����4', 'brown', sysdate, null, 1, 2, 2);
insert into gs_post values (seq_post.nextval, 1, '�ټ���° ���Դϴ�', '����5', 'brown', sysdate, null, 1, 4, null);
insert into gs_post values (seq_post.nextval, 1, '������° ���� �׹�° ���� ����Դϴ�', '����6','brown', sysdate, null, 1, 2, 4);
insert into gs_post values (seq_post.nextval, 1, '�ϰ���° ���Դϴ�', '����7', 'brown', sysdate, null, 1, 5, null);
insert into gs_post values (seq_post.nextval, 1, '������° ���Դϴ�', '����8', 'brown', sysdate, null, 1, 6, null);
insert into gs_post values (seq_post.nextval, 1, '��ȩ��° ���� �ټ���° ���� ����Դϴ�', '����9','brown', sysdate, null, 1, 4, 5);
insert into gs_post values (seq_post.nextval, 1, '����° ���� ������° ���� ����Դϴ�', '����10','brown', sysdate, null, 1, 2, 6);
insert into gs_post values (seq_post.nextval, 1, '���ѹ�° ���Դϴ�', '����11', 'brown', sysdate, null, 1, 7, null);
insert into gs_post values (seq_post.nextval, 1, '���ι�° ���� �ټ���° ���� ����Դϴ�', '����12','brown', sysdate, null, 1, 4, 5);
insert into gs_post values (seq_post.nextval, 1, '������° ���Դϴ�', '����13', 'brown', sysdate, null, 1, 8, null);
insert into gs_post values (seq_post.nextval, 1, '���׹�° ���Դϴ�', '����14', 'brown', sysdate, null, 1, 9, null);
insert into gs_post values (seq_post.nextval, 1, '���ټ���° ���� ù��° ���� ����Դϴ�', '����15','brown', sysdate, null, 1, 1, 1);
insert into gs_post values (seq_post.nextval, 1, '��������° ���� �׹�° ���� ����Դϴ�', '����16','brown', sysdate, null, 1, 2, 4);
insert into gs_post values (seq_post.nextval, 1, '���ϰ���° ���� ����° ���� ����Դϴ�', '����17','brown', sysdate, null, 1, 2, 10);
insert into gs_post values (seq_post.nextval, 1, '��������° ���Դϴ�', '����18', 'brown', sysdate, null, 0, 9, 14);
insert into gs_post values (seq_post.nextval, 1, '����ȩ��° ���Դϴ�', '����19', 'brown', sysdate, null, 1, 10, null);
insert into gs_post values (seq_post.nextval, 1, '������° ���Դϴ�', '����20', 'brown', sysdate, null, 1, 9, 18);
insert into gs_post values (seq_post.nextval, 1, '�����ѹ�° ���Դϴ�', '����21', 'brown', sysdate, null, 1, 11, null);
insert into gs_post values (seq_post.nextval, 1, '�����ι�° ���Դϴ�', '����22', 'brown', sysdate, null, 1, 12, null);
insert into gs_post values (seq_post.nextval, 2, 'ù��° ���Դϴ�', '����1', 'brown', sysdate, null, 1, 1, null);
insert into gs_post values (seq_post.nextval, 2, '�ι�° ���Դϴ�', '����2', 'brown', sysdate, null, 1, 2, null);
insert into gs_post values (seq_post.nextval, 2, '����° ���Դϴ�', '����3', 'brown', sysdate, null, 0, 3, null);
insert into gs_post values (seq_post.nextval, 2, '�׹�° ���Դϴ�', '����4', 'brown', sysdate, null, 1, 1, 1);
insert into gs_post values (seq_post.nextval, 2, '�ټ���° ���Դϴ�', '����5', 'brown', sysdate, null, 1, 2, 2);

-- ��� �߰�
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '����ϳ�', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '��۵�', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '��ۼ�', sysdate, null, 0);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '��۳�', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '��۴ټ�', sysdate, null, 0);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '��ۿ���', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'sally', '����ϰ�', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'sally', '��ۿ���', sysdate, null, 1);

-- Ŀ��
commit;