# 트랜잭션(Transaction)

set @name = "김준일";

# @는 변수
# @@는 전역변수
# autocommit은 workbench가 실행되면 자동으로 1로 바뀜, 0으로 되어 있으면 commit을 해줘야 데이터가 저장됨
# commit을 하지 않으면 workbench 종료시 수정한 데이터가 사라짐
select @name;
select @@autocommit;
set autocommit = 0;

insert into master_tb
values
	(0, 6, 2);
    
commit;