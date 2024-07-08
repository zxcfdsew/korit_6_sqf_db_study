# view(뷰) 가상 테이블
create view dvd_view as
select
	dt.dvd_id,
    dt.registration_number,
    dt.title,
    dt.producer_id,
    pdt.producer_name,
    dt.publisher_id,
    pbt.publisher_name,
    dt.publication_year,
    dt.database_date
from
	dvd_tb dt
    left outer join producer_tb pdt on(pdt.producer_id = dt.producer_id)
    left outer join publisher_tb pbt on(pbt.publisher_id = dt.publisher_id);

select
	*
from
	dvd_view
where
	title like "%우주%";


create view master_view as
select
	mt.master_id,
    name_id,
    `name`,
    phone_id,
    phone
from
	master_tb mt
    left outer join join1_tb jt1 on(jt1.join1_id = mt.name_id)
    left outer join join2_tb jt2 on(jt2.join2_id = mt.phone_id);

select
	*
from
	master_view;