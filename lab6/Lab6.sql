CREATE DATABASE lab6;
CREATE TABLE locations(
    location_id SERIAL PRIMARY KEY ,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY ,
    department_name varchar(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES locations
);
-- DROP TABLE departments CASCADE ;
CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary INTEGER,
    department_id INTEGER REFERENCES departments
);
-- drop TABLE employees;
INSERT INTO locations VALUES (1,'ABAYA','US','TARAZ','NUM1'),
                             (2,'NURSULTANA','SA','ALMATY','NUM2'),
                             (3,'KABANBAYA','PS','ASTANA','NUM3'),
                             (4,'BOGENBAYA','AS','NEW YORK','NUM4'),
                             (5,'ASATAYA','TA','LA','NUM5');
INSERT INTO departments VALUES(40,'ALFA',11000,1),
                               (50,'BETA',12000,2),
                               (60,'GAMMA',13000,3),
                               (70,'DELTA',14000,4),
                               (80,'CERA',15000,5);
-- SELECT * FROM departments;
INSERT INTO departments VALUES(90,NULL,NULL,NULL);
INSERT INTO departments VALUES(100,NULL,NULL,NULL);
INSERT INTO employees VALUES (10,'ABYLAY','a','abylay@gmailcom','87770101',34000,40),
                             (20,'BILL','B','bill@gmail.com','877701',54000,50),
                             (30,'CARL','C','carl@gmail.com','87770101',64000,60),
                             (40,'DEN','D','den@gmail.com','8777010',74000,70),
                             (50,'ELLEN','E','ellen@gmail.com','8777010',84000,80);
INSERT INTO employees VALUES(90, 'Karl', null, null, null, null, 50);


-- SELECT * FROM  employees;
---4----
SELECT employees.first_name,employees.last_name,employees.department_id,departments.department_name FROM employees INNER JOIN departments ON employees.department_id=departments.department_id;
---5----
SELECT employees.first_name,employees.last_name,employees.department_id,departments.department_name FROM employees INNER JOIN departments ON employees.department_id=departments.department_id WHERE  employees.department_id IN(80,40);
---6----
SELECT employees.first_name,employees.last_name,departments.*,locations.city,locations.state_province  FROM (( employees INNER JOIN departments ON employees.department_id=departments.department_id) INNER JOIN locations ON departments.location_id=locations.location_id);
---7----
SELECT * FROM departments d left JOIN employees e ON e.department_id=d.department_id ;
---8----
SELECT employees.first_name,employees.last_name,departments.department_id,departments.department_name FROM employees left JOIN departments ON departments.department_id=employees.department_id;
---9----
SELECT employees.first_name,employees.last_name FROM ((employees INNER JOIN departments d on d.department_id = employees.department_id) INNER JOIN locations ON d.location_id=locations.location_id) WHERE city='ALMATY';

-------------------ADDITIONAL TASKS-------------------------------
SELECT d.*,e.first_name as employee FROM departments d  LEFT JOIN  employees e ON d.department_id=e.department_id where e.first_name is null;
--  Array Functions
SELECT array_append(ARRAY[10,2],7);
SELECT array_cat(ARRAY[1,2],ARRAY [2,3]);
SELECT array_ndims(ARRAY[[1,2,3], [2,3,1]]);
SELECT array_dims(ARRAY[[1,2,3], [2,3,1],[4,3,5]]);
SELECT array_fill(7,ARRAY [3],ARRAY [2]);
SELECT array_length(ARRAY[1,3,4],1);
SELECT array_lower(ARRAY[2],1);
SELECT array_position(ARRAY[1,2,3],3);
SELECT array_prepend(10,ARRAY [9,8]);
SELECT array_remove(ARRAY[4,4,4,1],4);
SELECT array_replace(ARRAY [12,13,13,14],13,1);
SELECT array_to_string(ARRAY[13,41,14],' , ');
SELECT  array_upper(ARRAY[21,12],1);
SELECT cardinality(ARRAY[0,10,1]);
SELECT string_to_array('AA','BB','CC');
SELECT unnest(ARRAY[1,2,3]);