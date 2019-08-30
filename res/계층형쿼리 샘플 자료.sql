create table board_test (
 seq number,
 parent_seq number,
 title varchar2(100) );
 
insert into board_test values (1, null, '첫번째 글입니다');
insert into board_test values (2, null, '두번째 글입니다');
insert into board_test values (3, 2, '세번째 글은 두번째 글의 답글입니다');
insert into board_test values (4, null, '네번째 글입니다');
insert into board_test values (5, 4, '다섯번째 글은 네번째 글의 답글입니다');
insert into board_test values (6, 5, '여섯번째 글은 다섯번째 글의 답글입니다');
insert into board_test values (7, 6, '일곱번째 글은 여섯번째 글의 답글입니다');
insert into board_test values (8, 5, '여덜번째 글은 다섯번째 글의 답글입니다');
insert into board_test values (9, 1, '아홉번째 글은 첫번째 글의 답글입니다');
insert into board_test values (10, 4, '열번째 글은 네번째 글의 답글입니다');
insert into board_test values (11, 10, '열한번째 글은 열번째 글의 답글입니다');

alter table board_test add(gn number);

update board_test set gn = 1 where seq in (1, 9);
update board_test set gn = 2 where seq in (2, 3);
update board_test set gn = 4 where seq not in(1, 2, 3, 9);

commit;

select * from board_test;

---------------------------------------------------------------------------------------

select *
  from board_test
 start with parent_seq is null
connect by prior seq = parent_seq; -- prior 현재 컬럼..?

-- 계층쿼리
select seq, parent_seq, lpad(' ', (level-1)*4, ' ') || title title, level
  from board_test
 start with parent_seq is null
connect by prior seq = parent_seq
 order siblings by gn desc, seq;

---------------------------------------------------------------------------------------