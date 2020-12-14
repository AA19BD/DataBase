
create database  lab8_data;
CREATE TABLE countries_1(
    name varchar(250),
    population INTEGER
);
CREATE TABLE departaments_1(
        departament_id integer PRIMARY KEY,
        budget integer
);
CREATE TABLE employees_1(
        name varchar(250),
        surname varchar(250),
        salary integer,
        departament_id integer references departaments_1
);

INSERT INTO countries_1(name, population)
SELECT 'country_' || i, i * 1000
FROM generate_series(1, 100000) i;
SELECT * FROM countries_1;
EXPLAIN ANALYSE SELECT * FROM countries_1 WHERE name='country_456';---1
CREATE INDEX countries_name on countries_1(name);--58ms
-- drop index countries_name;
analyse;



INSERT INTO employees_1(name, surname,salary,departament_id)
SELECT 'employee_' || i, 'worker_' || i,i*100,i*1
FROM generate_series(1, 100000) i;
EXPLAIN ANALYSE SELECT * FROM employees_1 WHERE name='employee_500' and surname='worker_500';---2
create index index_name_surname on employees_1(name,surname);
-- DROP INDEX index_name_surname;
analyse ;



INSERT INTO departaments_1(departament_id,budget)
SELECT i*1, i*7
FROM generate_series(1, 100000) i;
explain analyse select * from employees_1 where salary<10000 and salary>1;----3
CREATE INDEX salary_index ON employees_1 (salary);
-- DROP INDEX salary_index;
ANALYSE ;

EXPLAIN ANALYSE SELECT * FROM employees_1 WHERE substring(name FROM 1 FOR 12)='employee_500';---4
CREATE INDEX subst_index ON employees_1 (substring(name FROM 1 FOR 12));
-- DROP INDEX subst_index;
ANALYSE;

EXPLAIN  ANALYSE SELECT * FROM employees_1 e JOIN departaments_1 d on e.departament_id = d.departament_id WHERE d.budget>100 and e.salary<1000000;---5
CREATE INDEX budget_index ON employees_1(salary);
CREATE INDEX budget_index1 ON departaments_1(budget);
-- drop index budget_index;
-- drop index budget_index1;
ANALYSE ;

ALTER TABLE employees_1
ADD COLUMN p point;
INSERT INTO employees_1(p) VALUES (point '(1,1)'), (point '(3,2)'), (point '(6,3)'),(point '(5,5)'), (point '(7,8)'), (point '(8,6)');---6
CREATE INDEX rtree_index ON employees_1 USING rtree(p);
explain analyse  select p from employees_1;
-- drop index rtree_index;
analyse;

CREATE INDEX name_index_2 ON departaments_1 USING hash(budget);---7
EXPLAIN ANALYSE SELECT budget FROM departaments_1 WHERE budget >100 AND budget < 50000;
ANALYSE;
-- DROP INDEX name_index_2;

CREATE UNIQUE INDEX id_index_1 ON employees_1(departament_id);
explain analyse select departament_id from employees_1 where departament_id<500;
analyse;
-- drop index id_index_1;










