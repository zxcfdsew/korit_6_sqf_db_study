# 데이터 조회(DML - SELECT)

select * from student_tb;
select `student_id`, `student_name`, `phone`, `email`, `introduce`, `admission_date` from `study`.`student_tb`;
select student_id, student_name, phone, email, introduce, admission_date from `study`.`student_tb`;
select student_id, student_name, phone, email, introduce, admission_date from `student_tb`;
select student_id, student_name, phone, email, introduce, admission_date from student_tb;
select student_id, student_name from student_tb;
select student_name, student_id from student_tb;
select student_id, student_name as s_name from student_tb;

# union(all) 병합 조건 - 컬럼의 개수와 자료형이 동일한 select 결과만 병합 가능
# union -> 중복 제거 후 select 결과 병합
# union all -> 중복 제거 없이 select 결과 병합
select 1 as number, "김준일" as name, 31 as age
union
select 2 as number, "김준이" as name, 31 as age
union
select 2 as number, "김준이" as name, 31 as age;

# 자료형과 컬럼의 개수가 같기때문에 정상작동
select student_id, student_name from student_tb
union
select student_id, phone from student_tb;

# select로 가져온 데이터를 테이블로 사용할 수 있다 (sub query)
select
	number, name
from
	(select 1 as number, "김준일" as name, 31 as age
	union all
	select 2 as number, "김준이" as name, 31 as age
	union all
	select 2 as number, "김준이" as name, 31 as age) as temp_tb;