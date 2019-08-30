insert into gs_board values (seq_board.nextval, '게시판1', 'brown', '1', '1');
insert into gs_board values (seq_board.nextval, '게시판22', 'brown', '2', '1');
insert into gs_board values (seq_board.nextval, '게시판333', 'brown', '3', '0');
insert into gs_board values (seq_board.nextval, '게시판4444', 'brown', '4', '1');
insert into gs_board values (seq_board.nextval, '게시판55555', 'brown', '5', '1');

select * from gs_board;
rollback;

update gs_board set boardnm = '1', boardlocation = 10 where boardseq = 1;

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
 
 
 
-- page의 갯수만큼만 뽑아오는 쿼리문
 select * from gs_post;
select a.*
  from (select rownum rn, a.*
          from (select postSeq, parentSeq, userId, postContent, postRegDate, postModDate, lpad(' ', (level-1)*4, ' ') || postNm postNm, postStatus, postGn, level
                  from gs_post
                 where boardSeq = 1 
                 start with parentSeq is null
               connect by prior postSeq = parentSeq
                 order siblings by postGn desc, postSeq desc) a) a
 where rn between (10 * (1 - 1) + 1) and (10 * 1); -- 10: 페이지에 나올 게시글 수(pagesize) / 2: 페이지 번호(page)