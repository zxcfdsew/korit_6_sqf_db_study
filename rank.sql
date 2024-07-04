# 출판사를 기준으로 category의 count를 집계한다.

# partition by는 순위를 매길 범위를 지정해줌
# rank()는 중복값이 있으면 공동순위를 부여하고 남은 번호를 건너뛰고 순위를 매김
# dense_rank()는 중복값이 있으면 공동순위를 부여하고 남은 번호를 건너뛰지 않고 순위를 매김
# row_number()는 중복과 상관없이 순위를 매김

select
	*
from
	(select
	#	rank() over(partition by publisher_id order by book_count desc) as `rank`,
	#	dense_rank() over(partition by publisher_id order by book_count desc) as `dense_rank`
		row_number() over(partition by publisher_id order by book_count desc) as `num`,
		pc_count_tb.*
	from
		(select
			publisher_id,
			category_id,
			count(*) as book_count
		from
			book_tb
		group by
			publisher_id,
			category_id) as pc_count_tb) as book_row_number_tb
where
	num = 1;