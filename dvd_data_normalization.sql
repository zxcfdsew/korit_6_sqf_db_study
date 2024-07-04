# producer_tb(제작자) 테이블 생성
create table producer_tb (
	producer_id int primary key not null auto_increment,
    producer_name varchar(100) not null unique
);

# distinct는 중복제거
# producer_tb에 데이터 추가
insert into producer_tb
select
	distinct
    0,
	제작자
from
	sample_dvd_tb;

# 중복제거 방법 2
-- insert into producer_tb
-- select
--     0,
-- 	제작자
-- from
-- 	sample_dvd_tb
-- group by
-- 	제작자;
    
select * from producer_tb;

# ------------------------------------------------------
# publisher_tb(발행자) 테이블 생성
create table publisher_tb(
	publisher_id int primary key not null auto_increment,
    publisher_name varchar(100) not null unique
);

-- insert into publisher_tb(publisher_name)
select
	-- 발행자,
	nullif(발행자, "")
    -- ifnull(nullif(발행자, ""), "발행자없음"),
    -- ifnull(nullif(replace(발행자, " ", ""), ""), "발행자없음")
from
	sample_dvd_tb
group by
	발행자
having
	nullif(발행자, "") is not null;

insert into publisher_tb(publisher_name)
select
	nullif(발행자, "") as publisher_name
from 
	sample_dvd_tb
group by
	발행자
having
	publisher_name is not null;
    
select * from publisher_tb; 

#--------------------------------------------
# 정규화된 데이터 테이블 생성
create table dvd_tb(
	dvd_id int primary key not null auto_increment,
    registration_number varchar(45) not null unique,
    title varchar(100) not null,
    producer_id int,
    publisher_id int,
    publication_year varchar(10),
    database_date date not null
);

# 생성된 테이블에 데이터 추가
insert into dvd_tb
select
	0,
    등록번호,
    제목,
    pdt.producer_id,
    pbt.publisher_id,
    발행년,
    데이터기준일자
from
	sample_dvd_tb sdt
    left outer join producer_tb pdt on(pdt.producer_name = sdt.제작자)
    left outer join publisher_tb pbt on(pbt.publisher_name = sdt.발행자);
    
select * from dvd_tb;