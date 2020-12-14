
CREATE DATABASE lab_11;

CREATE OR REPLACE FUNCTION cube_of_number(INOUT A numeric) AS--1
    $$
BEGIN
    A=A*A*A;
end;
    $$
language plpgsql;
SELECT cube_of_number(3);

CREATE OR REPLACE FUNCTION average_sum_of_numbers(VARIADIC list numeric[],OUT total numeric) AS
$$---2
    BEGIN
        SELECT INTO  total SUM(list[i])/COUNT(list[i])
        FROM generate_subscripts(list,1) g(i);
    end;
$$
language plpgsql;
SELECT average_sum_of_numbers(10,10,10,10,10,11);

CREATE OR REPLACE FUNCTION max_number_of_numbers (VARIADIC list NUMERIC[],OUT total numeric) AS
    $$---3
    BEGIN
        SELECT INTO total MAX(list[i])
        FROM generate_subscripts(list,1) g(i);
    end;
    $$
LANGUAGE PLPGSQL;
SELECT max_number_of_numbers(1,2,3,4,5,13,434,1000);

CREATE OR REPLACE FUNCTION min_number_of_numbers (VARIADIC list NUMERIC[],OUT total numeric) AS
    $$---4
    BEGIN
        SELECT INTO total MIN(list[i])
        FROM generate_subscripts(list,1) g(i);
    end;
    $$
LANGUAGE PLPGSQL;
SELECT min_number_of_numbers(-1000,-2,1,100,134);

CREATE OR REPLACE FUNCTION counts_of_numbers (VARIADIC list NUMERIC[],OUT total numeric) AS
    $$---5
    BEGIN
        SELECT INTO total COUNT(list[i])
        FROM generate_subscripts(list,1) g(i);
    end;
    $$
LANGUAGE PLPGSQL;
SELECT counts_of_numbers(1,3,3,443,356,45,45,5,5,0,2,-1,2,-3234,1);

CREATE TABLE student(
    id serial PRIMARY KEY ,
    name varchar(250) NOT NULL ,
    specialty varchar(250),
    birth_date Date,
    address varchar(250),
    mobile_number integer,
    height_of_student integer
);
insert into student values(1,'Bob','it','2003-4-01','boston',1313,175),
                           (2,'Alex','Bf','2001-2-16','new_york',14113,200),
                           (3,'Carl','Ec','2002-1-11','la',11343,190),
                           (4,'Ten','Sp','2001-3-12','clarson',134513,55),
                           (5,'Steve','tr','2001-6-14','boston',1234,199);
-- select *
-- from student;
CREATE OR REPLACE FUNCTION table_of_student() RETURNS TABLE(--6
    id_s integer,
    name_s varchar,
    specialty_s varchar,
    address_s varchar,
    mobile_number_s int,
    height_of_student_s int

 ) AS
 $$
BEGIN
RETURN QUERY SELECT id,name,specialty,address,mobile_number,height_of_student FROM student;
end;
$$
language plpgsql;
-- DROP FUNCTION table_of_student()
SELECT  table_of_student();--7

CREATE OR REPLACE FUNCTION max_height_among_students() returns table (--8
    name_s varchar,
    height_of_student_s int)
AS
    $$
BEGIN
    RETURN QUERY SELECT name,height_of_student FROM student WHERE height_of_student=(SELECT MAX(height_of_student) FROM student);
end;
    $$
LANGUAGE plpgsql;

SELECT max_height_among_students();





-- DO $$
-- <<outer_block>>
-- declare
-- counter integer:=0;
-- BEGIN
-- counter=counter+1;
-- RAISE NOTICE 'COUNTER,%',counter;
--     DECLARE
--         counter integer:=0;
--         BEGIN
--         RAISE NOTICE 'COUNTER,%',counter;
--         RAISE NOTICE 'COUNTER,%',outer_block.counter;
--         end;
-- RAISE NOTICE 'COUNTER,%',counter;
-- end outer_block $$;
