SELECT * FROM study.student_tb;

select
	student_name,
    class
from
	(select
		rank() over(partition by class order by score) as `rank`,
		student_tb.*
	from
		student_tb) as `first`
where
	`rank` = 1;
    
select
	student_name,
    class
from
	(select
		rank() over(partition by class order by score desc) as `rank`,
		student_tb.*
	from
		student_tb) as `last`
where
	`rank` = 1;