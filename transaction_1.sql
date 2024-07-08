# rollback을 하게되면 start transaction을 다시 해야함.
# transaction은 명령어의 작성 순서가 중요한게 아니라 실행 순서가 중요함.
start transaction; # 중괄호를 연 겻과 동일

set @name = "권혁진";
set @phone = "010-6666-8888";

savepoint sp_insert_name;
insert into join1_tb
values(0, @name);

savepoint sp_insert_phone;
insert into join2_tb
values(0, @phone);

rollback to sp_insert_phone;  # 세이브 포인드 지점으로 rollback
rollback;

set @new_join1_id = 0;
set @new_join2_id = 0;

# select의 결과를 new_join1_id라는 변수에 대입
select
	join1_id into @new_join1_id
from
	join1_tb
order by
	join1_id desc
limit 0, 1;

select
	join2_id into @new_join2_id
from
	join2_tb
order by
	join2_id desc
limit 0, 1;

insert into master_tb
values(0, @new_join1_id, @new_join2_id);

commit;