create table board_test (
 seq number,
 parent_seq number,
 title varchar2(100) );
 
insert into board_test values (1, null, 'ù��° ���Դϴ�');
insert into board_test values (2, null, '�ι�° ���Դϴ�');
insert into board_test values (3, 2, '����° ���� �ι�° ���� ����Դϴ�');
insert into board_test values (4, null, '�׹�° ���Դϴ�');
insert into board_test values (5, 4, '�ټ���° ���� �׹�° ���� ����Դϴ�');
insert into board_test values (6, 5, '������° ���� �ټ���° ���� ����Դϴ�');
insert into board_test values (7, 6, '�ϰ���° ���� ������° ���� ����Դϴ�');
insert into board_test values (8, 5, '������° ���� �ټ���° ���� ����Դϴ�');
insert into board_test values (9, 1, '��ȩ��° ���� ù��° ���� ����Դϴ�');
insert into board_test values (10, 4, '����° ���� �׹�° ���� ����Դϴ�');
insert into board_test values (11, 10, '���ѹ�° ���� ����° ���� ����Դϴ�');

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
connect by prior seq = parent_seq; -- prior ���� �÷�..?

-- ��������
select seq, parent_seq, lpad(' ', (level-1)*4, ' ') || title title, level
  from board_test
 start with parent_seq is null
connect by prior seq = parent_seq
 order siblings by gn desc, seq;

---------------------------------------------------------------------------------------