# 데이터 삭제(DML - DELETE)

# delete, update 사용 시에는 where절 안에 가능하면 PK를 사용하거 값 검색
delete
from
	student_tb
where
	student_id = 2;
    
select * from student_tb;
    
# 실습. 이메일 데이터 중 @앞에 bbb가 포함된 정보의 introduce 데이터를
# 'bbb를 포함하고 있는 계정입니다.'라고 수정하고 student_id가 5 ~ 7인 데이터들을 삭제하시오.

update
	student_tb
set
	introduce = "bbb를 포함하고 있는 계정입니다"
where
	email like "%bbb%@%";
    
delete
from
	student_tb
where
	student_id between 5 and 7;