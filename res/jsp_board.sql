-- 테이블, 시퀀스 삭제
/* 게시판 */
DROP TABLE GS_BOARD CASCADE CONSTRAINTS;

/* 게시글 */
DROP TABLE GS_POST CASCADE CONSTRAINTS;

/* 사용자 */
DROP TABLE USERS CASCADE CONSTRAINTS;

/* 첨부파일 */
DROP TABLE GS_FILE CASCADE CONSTRAINTS;

/* 댓글 */
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

-- 시퀀스 생성
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

/* 게시판 */
CREATE TABLE GS_BOARD (
	boardSeq NUMBER NOT NULL, /* 게시판 번호 */
	boardNm VARCHAR2(100) NOT NULL, /* 게시판 이름 */
	userId VARCHAR2(20) NOT NULL, /* 관리자 */
	boardLocation NUMBER(3) NOT NULL, /* 게시판 순서 */
	boardStatus NUMBER(1) NOT NULL /* 사용여부 */
);

COMMENT ON TABLE GS_BOARD IS '게시판';

COMMENT ON COLUMN GS_BOARD.boardSeq IS '게시판 번호';

COMMENT ON COLUMN GS_BOARD.boardNm IS '게시판 이름';

COMMENT ON COLUMN GS_BOARD.userId IS '관리자';

COMMENT ON COLUMN GS_BOARD.boardLocation IS '게시판 순서';

COMMENT ON COLUMN GS_BOARD.boardStatus IS '사용여부';

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

/* 게시글 */
CREATE TABLE GS_POST (
	postSeq NUMBER NOT NULL, /* 게시글 번호 */
	boardSeq NUMBER NOT NULL, /* 게시판 번호 */
	postNm VARCHAR2(100) NOT NULL, /* 게시글 제목 */
	postContent CLOB NOT NULL, /* 게시글 내용 */
	userId VARCHAR2(20) NOT NULL, /* 작성자 */
	postRegDate DATE NOT NULL, /* 작성일시 */
	postModDate DATE, /* 수정일시 */
	postStatus NUMBER(1) NOT NULL, /* 삭제여부 */
	postGn NUMBER NOT NULL, /* 그룹 번호 */
	parentSeq NUMBER /* 부모게시글번호 */
);

COMMENT ON TABLE GS_POST IS '게시글';

COMMENT ON COLUMN GS_POST.postSeq IS '게시글 번호';

COMMENT ON COLUMN GS_POST.boardSeq IS '게시판 번호';

COMMENT ON COLUMN GS_POST.postNm IS '게시글 제목';

COMMENT ON COLUMN GS_POST.postContent IS '게시글 내용';

COMMENT ON COLUMN GS_POST.userId IS '작성자';

COMMENT ON COLUMN GS_POST.postRegDate IS '작성일시';

COMMENT ON COLUMN GS_POST.postModDate IS '수정일시';

COMMENT ON COLUMN GS_POST.postStatus IS '삭제여부';

COMMENT ON COLUMN GS_POST.postGn IS '그룹 번호';

COMMENT ON COLUMN GS_POST.parentSeq IS '부모게시글번호';

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

/* 사용자 */
CREATE TABLE USERS (
	userId VARCHAR2(20) NOT NULL, /* 사용자 아이디 */
	userNm VARCHAR2(20), /* 사용자 이름 */
	pass VARCHAR2(100), /* 비밀번호 */
	reg_dt DATE, /* 생일 */
	alias VARCHAR2(50), /* 별명 */
	addr1 VARCHAR2(50), /* 주소 */
	addr2 VARCHAR2(50), /* 상세주소 */
	zipCode VARCHAR2(5), /* 우편번호 */
	fileName VARCHAR2(50), /* 이미지파일명 */
	realFileName VARCHAR2(200) /* 이미지경로 */
);

COMMENT ON TABLE USERS IS '사용자';

COMMENT ON COLUMN USERS.userId IS '사용자 아이디';

COMMENT ON COLUMN USERS.userNm IS '사용자 이름';

COMMENT ON COLUMN USERS.pass IS '비밀번호';

COMMENT ON COLUMN USERS.reg_dt IS '생일';

COMMENT ON COLUMN USERS.alias IS '별명';

COMMENT ON COLUMN USERS.addr1 IS '주소';

COMMENT ON COLUMN USERS.addr2 IS '상세주소';

COMMENT ON COLUMN USERS.zipCode IS '우편번호';

COMMENT ON COLUMN USERS.fileName IS '이미지파일명';

COMMENT ON COLUMN USERS.realFileName IS '이미지경로';

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

/* 첨부파일 */
CREATE TABLE GS_FILE (
	fileSeq NUMBER NOT NULL, /* 첨부파일번호 */
	fileName VARCHAR2(50) NOT NULL, /* 업로드파일명 */
	realFileName VARCHAR2(200) NOT NULL, /* 실제파일경로 */
	postSeq NUMBER NOT NULL /* 게시글 번호 */
);

COMMENT ON TABLE GS_FILE IS '첨부파일';

COMMENT ON COLUMN GS_FILE.fileSeq IS '첨부파일번호';

COMMENT ON COLUMN GS_FILE.fileName IS '업로드파일명';

COMMENT ON COLUMN GS_FILE.realFileName IS '실제파일경로';

COMMENT ON COLUMN GS_FILE.postSeq IS '게시글 번호';

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

/* 댓글 */
CREATE TABLE GS_REPLY (
	replySeq NUMBER NOT NULL, /* 댓글번호 */
	postSeq NUMBER NOT NULL, /* 게시글 번호 */
	userId VARCHAR2(20) NOT NULL, /* 사용자 아이디 */
	replyContent CLOB NOT NULL, /* 내용 */
	replyRegDate DATE NOT NULL, /* 작성일시 */
	replyModDate DATE, /* 수정일시 */
	replyStatus NUMBER(1) NOT NULL /* 삭제여부 */
);

COMMENT ON TABLE GS_REPLY IS '댓글';

COMMENT ON COLUMN GS_REPLY.replySeq IS '댓글번호';

COMMENT ON COLUMN GS_REPLY.postSeq IS '게시글 번호';

COMMENT ON COLUMN GS_REPLY.userId IS '사용자 아이디';

COMMENT ON COLUMN GS_REPLY.replyContent IS '내용';

COMMENT ON COLUMN GS_REPLY.replyRegDate IS '작성일시';

COMMENT ON COLUMN GS_REPLY.replyModDate IS '수정일시';

COMMENT ON COLUMN GS_REPLY.replyStatus IS '삭제여부';

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

-- 게시판 컬럼 추가     
insert into gs_board values (seq_board.nextval, '게시판1', 'brown', '1', '1');
insert into gs_board values (seq_board.nextval, '게시판22', 'brown', '2', '1');
insert into gs_board values (seq_board.nextval, '게시판333', 'brown', '3', '0');
insert into gs_board values (seq_board.nextval, '게시판4444', 'brown', '4', '1');
insert into gs_board values (seq_board.nextval, '게시판55555', 'brown', '5', '1');

-- 게시글 추가
insert into gs_post values (seq_post.nextval, 1, '첫번째 글입니다', '내용1', 'brown', sysdate, null, 1, 1, null);
insert into gs_post values (seq_post.nextval, 1, '두번째 글입니다', '내용2', 'brown', sysdate, null, 1, 2, null);
insert into gs_post values (seq_post.nextval, 1, '세번째 글입니다', '내용3', 'brown', sysdate, null, 1, 3, null);
insert into gs_post values (seq_post.nextval, 1, '네번째 글은 두번째 글의 답글입니다', '내용4', 'brown', sysdate, null, 1, 2, 2);
insert into gs_post values (seq_post.nextval, 1, '다섯번째 글입니다', '내용5', 'brown', sysdate, null, 1, 4, null);
insert into gs_post values (seq_post.nextval, 1, '여섯번째 글은 네번째 글의 답글입니다', '내용6','brown', sysdate, null, 1, 2, 4);
insert into gs_post values (seq_post.nextval, 1, '일곱번째 글입니다', '내용7', 'brown', sysdate, null, 1, 5, null);
insert into gs_post values (seq_post.nextval, 1, '여덟번째 글입니다', '내용8', 'brown', sysdate, null, 1, 6, null);
insert into gs_post values (seq_post.nextval, 1, '아홉번째 글은 다섯번째 글의 답글입니다', '내용9','brown', sysdate, null, 1, 4, 5);
insert into gs_post values (seq_post.nextval, 1, '열번째 글은 여섯번째 글의 답글입니다', '내용10','brown', sysdate, null, 1, 2, 6);
insert into gs_post values (seq_post.nextval, 1, '열한번째 글입니다', '내용11', 'brown', sysdate, null, 1, 7, null);
insert into gs_post values (seq_post.nextval, 1, '열두번째 글은 다섯번째 글의 답글입니다', '내용12','brown', sysdate, null, 1, 4, 5);
insert into gs_post values (seq_post.nextval, 1, '열세번째 글입니다', '내용13', 'brown', sysdate, null, 1, 8, null);
insert into gs_post values (seq_post.nextval, 1, '열네번째 글입니다', '내용14', 'brown', sysdate, null, 1, 9, null);
insert into gs_post values (seq_post.nextval, 1, '열다섯번째 글은 첫번째 글의 답글입니다', '내용15','brown', sysdate, null, 1, 1, 1);
insert into gs_post values (seq_post.nextval, 1, '열여섯번째 글은 네번째 글의 답글입니다', '내용16','brown', sysdate, null, 1, 2, 4);
insert into gs_post values (seq_post.nextval, 1, '열일곱번째 글은 열번째 글의 답글입니다', '내용17','brown', sysdate, null, 1, 2, 10);
insert into gs_post values (seq_post.nextval, 1, '열여덟번째 글입니다', '내용18', 'brown', sysdate, null, 0, 9, 14);
insert into gs_post values (seq_post.nextval, 1, '열아홉번째 글입니다', '내용19', 'brown', sysdate, null, 1, 10, null);
insert into gs_post values (seq_post.nextval, 1, '스무번째 글입니다', '내용20', 'brown', sysdate, null, 1, 9, 18);
insert into gs_post values (seq_post.nextval, 1, '스물한번째 글입니다', '내용21', 'brown', sysdate, null, 1, 11, null);
insert into gs_post values (seq_post.nextval, 1, '스물두번째 글입니다', '내용22', 'brown', sysdate, null, 1, 12, null);
insert into gs_post values (seq_post.nextval, 2, '첫번째 글입니다', '내용1', 'brown', sysdate, null, 1, 1, null);
insert into gs_post values (seq_post.nextval, 2, '두번째 글입니다', '내용2', 'brown', sysdate, null, 1, 2, null);
insert into gs_post values (seq_post.nextval, 2, '세번째 글입니다', '내용3', 'brown', sysdate, null, 0, 3, null);
insert into gs_post values (seq_post.nextval, 2, '네번째 글입니다', '내용4', 'brown', sysdate, null, 1, 1, 1);
insert into gs_post values (seq_post.nextval, 2, '다섯번째 글입니다', '내용5', 'brown', sysdate, null, 1, 2, 2);

-- 댓글 추가
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '댓글하나', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '댓글둘', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '댓글셋', sysdate, null, 0);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '댓글넷', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '댓글다섯', sysdate, null, 0);
insert into gs_reply values(seq_reply.nextval, 1, 'brown', '댓글여섯', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'sally', '댓글일곱', sysdate, null, 1);
insert into gs_reply values(seq_reply.nextval, 1, 'sally', '댓글여덟', sysdate, null, 1);

-- 커밋
commit;