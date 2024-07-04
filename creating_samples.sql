select * from library_tb;

create table library_tb_copy (
	library_id int not null auto_increment,
    library_code int not null,
    library_name varchar(45) not null,
    library_url text not null,
    constraint primary key(library_id)
);

create table library_tb_copy (
	library_id int not null auto_increment primary key,
    library_code varchar(45) not null unique,
    library_name varchar(45) not null,
    library_url text not null
);

alter table library_tb_copy change library_code library_code varchar(45) not null unique;

-- drop table library_tb_copy;