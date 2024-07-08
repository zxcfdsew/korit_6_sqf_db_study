call usp_add_master("이병안", "010-8888-8888");

# ---------------------------------------------------
set @total = 0;
call usp_mod_score("이병안", 90, 0, 80, @total);
select @total;

select * from score_tb;
select * from join1_tb;

# ---------------------------------------------------
set @number = 10;
call usp_square(@number);
select @number;

# procedure은 insert, delete, update를 사용하기 위한 함수
# 하나의 트랜잭션으로 실행될 수 있게끔 묶어주는 역할, query문의 집합체

# Function은 query문 안쪽에서 사용되는 함수들
select
	add_number(10, 20);