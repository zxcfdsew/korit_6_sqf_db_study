# 데이터 수정(DML - UPDATE)

select * from student_tb;

select
	student_id
from
	student_tb
where
	student_name = "김준오";

# 실행순서 update -> where -> set
# update하려는 테이블과 서브쿼리에서 참조하는 테이블이 같으면 에러발생
update
	student_tb
set
	email = "skjil1218@gmail.com"
where
	student_name in (select
						temp_student_tb.student_id
					from
						# student_tb <- 이렇게 하면 안됨
                        (select * from student_tb) as temp_student_tb
					where
						temp_student_tb.student_name = "김준오");

update
	student_tb
set
	phone = "010-1234-4321",
    email = "skji1218@naver.com"
where
	student_id = 3;