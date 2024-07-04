create table join1_tb(
	join1_id int primary key not null auto_increment,
    `name` varchar(45) not null
);

create table join2_tb(
	join2_id int primary key not null auto_increment,
    phone varchar(45) not null
);

create table master_tb(
	master_id int primary key not null auto_increment,
    name_id int not null,
    phone_id int not null
);

insert into join1_tb
values
	(0, "정령우"),
	(0, "백승주"),
	(0, "김정현"),
	(0, "김유진"),
	(0, "정찬익");
    
insert into join2_tb
values
	(0, "010-1111-1111"),
	(0, "010-2222-2222"),
	(0, "010-3333-3333"),
	(0, "010-4444-4444"),
	(0, "010-5555-5555");
    
insert into master_tb
values
	(0, 1, 1),
	(0, 1, 2),
	(0, 1, 3),
	(0, 2, 1),
	(0, 2, 2),
	(0, 3, 3),
	(0, 4, 4),
	(0, 5, 5),
	(0, 5, 1);
    
#-----------------------------------
# on(조건) 조건이 참이것만 뽑아냄
# 테이블명1 inner join 테이블명2 on(조건) : 테이블명2에서 조건에 맞는 컬럼을 join시킴, 교집합
# 테이블명1 left outer join 테이블명2 on(조건) : 테이블명1을 기준으로 테이블을 join, 테이블명1은 다 출력함
# 테이블명1 right outer join 테이블명2 on(조건) : 테이블명2를 기준으로 테이블을 join
# left outer join은 여러번 연속으로 쓸 수 있고, 위에 쓴 모든 테이블을 자신의 왼쪽 테이블로 봄
select * from master_tb;

select
	*
from
	master_tb mt
    left outer join join1_tb jt1 on(jt1.join1_id = mt.name_id and jt1.join1_id < 4)
    left outer join join2_tb jt2 on(jt2.join2_id = mt.phone_id);