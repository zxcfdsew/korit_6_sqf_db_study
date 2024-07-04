# where - 조건

# 단순 비교 연산
select
	*
from
	student_tb
where
	student_name = "김준일";
    
# 실행순서 from -> where -> select
# OR 연산
select
	student_id,
    student_name
from
	student_tb
where
	student_name = "김준일"
    or student_name = "김준이";
    
# IN 연산
select
	*
from
	student_tb
where
	student_name in ("김준일", "김준이", "김준삼");
	
# AND 연산
select
	*
from 
	student_tb
where
	student_id > 2
    and student_id < 4;
    
# BETWEEN A AND => B A 이상 B 이하
select
	*
from
	student_tb
where
	student_id between 2 and 4;
    
# NOT
select
	*
from
	student_tb
where
	not student_name = "김준일";
    
# null 체크
# is null 긍정
# is not null 부정
select
	*
from
	student_tb
where
	introduce is null;
#	introduce is not null;

insert into student_tb
values
	(0, "손경태", "010-1111-2222", "aaa@gmail.com", null, now()),
	(0, "김지현", "010-1111-3333", "bbb@naver.com", null, now()),
	(0, "김동인", "010-2222-2222", "ccc@gmail.com", null, now()),
	(0, "김정현", "010-4444-3333", "aaabbb@naver.com", null, now()),
	(0, "권오광", "010-5555-2222", "bbbccc@kakao.com", null, now()),
	(0, "권혁진", "010-1111-5555", "aaabbbccc@kakao.com", null, now());

# 와일드 카드(LIKE)
# LIKE는 단독으로만 사용가능
# 와일드 카드는 무엇이든지 될 수 있는 값
select
	*
from
	student_tb
where
	student_name like "김%";
    
select
	*
from
	student_tb
where
	email like "%gmail.com";
    
# %값%는 값을 포함하고 있는 행만 추출
select
	*
from
	student_tb
where
	phone like "%2222%";
    
select
	*
from
	student_tb
where
	phone like "%2222%"
    and not phone like "%2222";
    
# _ 와일드카드 : 해당 위치에 아무 문자나 와도됨
select
	*
from
	student_tb
where
	email like "___bbb%";