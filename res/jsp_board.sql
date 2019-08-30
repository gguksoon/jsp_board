insert into gs_board values (seq_board.nextval, '�Խ���1', 'brown', '1', '1');
insert into gs_board values (seq_board.nextval, '�Խ���22', 'brown', '2', '1');
insert into gs_board values (seq_board.nextval, '�Խ���333', 'brown', '3', '0');
insert into gs_board values (seq_board.nextval, '�Խ���4444', 'brown', '4', '1');
insert into gs_board values (seq_board.nextval, '�Խ���55555', 'brown', '5', '1');

select * from gs_board;
rollback;

update gs_board set boardnm = '1', boardlocation = 10 where boardseq = 1;

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
 
 
 
-- page�� ������ŭ�� �̾ƿ��� ������
 select * from gs_post;
select a.*
  from (select rownum rn, a.*
          from (select postSeq, parentSeq, userId, postContent, postRegDate, postModDate, lpad(' ', (level-1)*4, ' ') || postNm postNm, postStatus, postGn, level
                  from gs_post
                 where boardSeq = 1 
                 start with parentSeq is null
               connect by prior postSeq = parentSeq
                 order siblings by postGn desc, postSeq desc) a) a
 where rn between (10 * (1 - 1) + 1) and (10 * 1); -- 10: �������� ���� �Խñ� ��(pagesize) / 2: ������ ��ȣ(page)