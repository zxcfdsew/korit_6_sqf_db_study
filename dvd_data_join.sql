# from -> where -> group by -> select -> having -> order by -> limit
# select와 having은 DBMS에 따라서 순서가 다를 수 있음

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
    left outer join publisher_tb pbt on(pbt.publisher_id = dt.publisher_id)
limit 10, 10; # 페이지네이션할때 사용