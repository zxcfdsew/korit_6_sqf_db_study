# group by - 그룹
# 집계 -> count, max, min, sum, avg

# count : 안에 들어있는 값의 개수를 셈(null은 카운트에 포함하지 않음)
select
	admission_date,
	count(*)
from
	student_tb
group by
	admission_date;