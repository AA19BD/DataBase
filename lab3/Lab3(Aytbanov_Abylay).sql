CREATE DATABASE laboratory_work3;
CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);


INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');



INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');

SELECT name FROM employees;--3
SELECT DISTINCT (LASTNAME) FROM employees;--4
SELECT * FROM employees WHERE lastname='Smith';--5
SELECT * FROM employees WHERE lastname='Smith' or lastname='Doe';--6
SELECT * FROM employees WHERE department=59;--7
SELECT * FROM employees WHERE department=14 OR department=77;--8
SELECT  * FROM employees WHERE city='Almaty';--9
SELECT sum(budget) FROM departments;--10
SELECT count(name),department  FROM employees GROUP BY department;--11
SELECT department  FROM employees  GROUP BY department HAVING count(NAME)>2;--12
SELECT name FROM departments  ORDER BY budget DESC LIMIT 1 OFFSET 1;--13
SELECT name,lastname,department FROM employees WHERE department=(select code from departments WHERE budget=(SELECT MIN(budget) FROM departments))
UNION
SELECT name,lastname,department FROM employees WHERE department=(select code from departments WHERE budget=(SELECT MAX(budget) FROM departments));
--14
SELECT name FROM employees WHERE city='Nursultan' or city='Almaty' ;--15

SELECT departments.NAME,departments.budget,departments.CODE FROM departments WHERE budget>55000 ORDER BY BUDGET ASC,CODE DESC;--16

UPDATE departments SET budget=budget*0.9 WHERE budget=(SELECT MIN(budget) FROM departments);--17
-- SELECT budget FROM  departments;
UPDATE employees
SET department=(SELECT CODE FROM departments WHERE departments.name='IT')--18
WHERE department=(SELECT CODE FROM departments WHERE departments.name='Research');
SELECT * FROM employees;

DELETE FROM employees WHERE department=(SELECT CODE FROM departments WHERE departments.name='IT');--19
-- SELECT * FROM employees;
-- DELETE FROM employees WHERE ssn>0;

--защита лабки
-- SELECT CITY FROM employees INTERSECT SELECT CITY FROM customers;
-- SELECT * FROM employees LIMIT 5 OFFSET 3;
-- SELECT NAME  FROM employees EXCEPT SELECT NAME FROM customers;
-- DROP DATABASE laboratory_work3;
