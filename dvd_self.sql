select * from dvd_tb;

select
	title,
    count(*) as count
from
	dvd_tb
group by
	title
order by
	count desc;
    
# 저작자 테이블 생성
create table producer_tb (
	producer_id int auto_increment primary key,
    producer_name text not null
);

# 저작자 테이블 데이터 추가
insert into producer_tb
	select
		0,
		producer
	from
		dvd_tb
	group by
		producer;

select * from producer_tb;


# 발행자 테이블 생성
create table dvd_publisher_tb (
	dvd_publisher_id int primary key auto_increment,
    dvd_publisher_name varchar(45) not null
);

# 발행자 테이블 데이터 추가
insert into dvd_publisher_tb
select
	0,
	dvd_publisher
from
	dvd_tb
group by
	dvd_publisher;

select * from dvd_publisher_tb;


# 데이터 기준 일자 테이블 생성
create table database_date_tb (
	database_date_id int primary key auto_increment,
    database_date varchar(45) not null
);

# 데이터 기분 일자 데이터 추가
insert into database_date_tb
select
	0,
    database_date
from
	dvd_tb
group by
	database_date;
    
select * from database_date_tb;


# dvd_tb에 아이디 컬럼 추가
alter table dvd_tb add column producer_id int after title;
alter table dvd_tb add column dvd_publisher_id int after producer;
alter table dvd_tb add column database_id int after dvd_publiscation_year;

# 새로 추가된 컬럼에 데이터 추가
update
	dvd_tb as dt
    left outer join producer_tb as pt on(dt.producer = pt.producer_name)
	left outer join dvd_publisher_tb as dpt on(dt.dvd_publisher = dpt.dvd_publisher_name)
    left outer join database_date_tb as ddt on(dt.database_date = ddt.database_date)
set
	dt.producer_id = pt.producer_id,
    dt.dvd_publisher_id = dpt.dvd_publisher_id,
    dt.database_id = ddt.database_date_id;

select * from dvd_tb;


# 정규화된 테이블 생성
create table new_dvd_tb (
	registration_number varchar(45) primary key,
    title text not null,
    producer varchar(45) not null,
    dvd_publisher varchar(45) not null,
    dvd_publiscation_year varchar(45) not null,
    database_date varchar(45) not null
);

# 새로운 테이블에 데이터 추가
insert into new_dvd_tb
select
	registration_number,
    title,
    producer_id,
    dvd_publisher_id,
    dvd_publiscation_year,
    database_date
from
	dvd_tb;

select * from new_dvd_tb;