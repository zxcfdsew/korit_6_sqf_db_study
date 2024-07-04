select * from car_tb;

insert into car_tb
values
	(0, "그랜저", "검정", now());
    
insert into car_tb
	(car_name, car_color, car_date)
values 
	("아반테", "회색", now());
    
insert into car_tb
	(car_name, car_color, car_date)
values
	("car1", "white", now()),
    ("car2", "red", now());

insert into car_tb
	(car_color, car_date, car_name)
values
	("green", now(), "car3");