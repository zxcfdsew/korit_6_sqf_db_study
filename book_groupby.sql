select * from book_tb;
-- Group by 집계, 중복제거

# distinct 중복 제거(현재 select된 열들의 중복을 제거), 여러번 사용 불가
select
	distinct
    category_id,
    publisher_id
from
	book_tb;
   
# 실행순서 : from -> where -> group by -> select
select
	category_id,
    count(*)
from
	book_tb
where
	book_id > 7000
group by
	category_id;
    

-- 도서명 중 '돈'이라는 글자가 들어간 데이터들을 찾아 카테고리별로 묶으시오.
-- 그리고 카테고리 별로 도서 개수가 출력되어야 한다.
select
	category_id,
    count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id;
    
-- select
-- 	category_id,
--     count(*) as category_count
-- from
-- 	book_tb
-- where
-- 	regexp_like(book_name, "[돈]")
-- group by
-- 	category_id;

select
	*
from
	(select
		category_id,
		count(*) as category_count
	from
		book_tb
	where
		book_name like "%돈%"
	group by
		category_id) as temp_tb
where
	category_count > 10;

# 변경 후(서브쿼리 말고 having 사용)
# 순서 : from -> where -> group by -> select -> having
select
	category_id,
    count(*) as category_count
from
	book_tb
where
	book_name like "%돈%"
group by
	category_id
having
	category_count > 10;