create table rental_tb(
	rental_id int primary key not null auto_increment,
    dvd_id int not null,
    customer_name varchar(45) not null,
    rental_date datetime not null
);

-- insert into rental_tb
select
	*
from
	rental_tb rt
    left outer join (
					select
						distinct
						0 as rental_id,
						floor(rand() * 3000) + 1 as dvd_id,
						"김준이" as customer_name,
						now() as rental_date
					from
						dvd_tb
					where
						dvd_id < 1001
					order by
						dvd_id) rt2 on(rt2.dvd_id 
    
select * from rental_tb;

#--------------------------------------
create table dvd_register_tb(
	dvd_register_id int primary key not null auto_increment,
    dvd_id int not null,
    dvd_register_date datetime not null
);

insert into dvd_register_tb
values
	(0, 1, now()),
	(0, 1, now()),
	(0, 1, now()),
	(0, 1, now());
    
select
	0,
    dvd_id,
    now()
from
	dvd_tb
union all
select
	0,
    dvd_id,
    now()
from
	dvd_tb
union all
select
	0,
    dvd_id,
    now()
from
	dvd_tb
order by
	dvd_id;
    
# 같은 책이 3권씩 있다고 가정했을 때 테이블의 각각의 값들을 3개로 늘려주는 작업
insert into dvd_register_tb
select
	0,
    dt1.dvd_id,
    now()
from
	dvd_tb dt1
    left outer join dvd_tb dt2 on(dt2.dvd_id < 4);
    
select * from dvd_register_tb;

select
	title,
	producer_id,
    publisher_id,
    count(*) as dvd_count
from
	dvd_tb
group by
	title,
    producer_id,
    publisher_id
having
	dvd_count > 1;