-- SELECT * FROM pg_statistic;---stores statistical data about the contents of the database
-- select * from pg_indexes;--save all created  indexes
-- TRUNCATE  table;--delete all from the table
CREATE DATABASE lab8;
CREATE TABLE countries(
    location_id SERIAL PRIMARY KEY ,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);
ALTER TABLE countries
RENAME COLUMN  street_address TO name;

CREATE TABLE departments(
    department_id SERIAL PRIMARY KEY ,
    department_name varchar(50) UNIQUE,
    budget INTEGER,
    location_id INTEGER REFERENCES countries
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
INSERT INTO countries VALUES (1,'ABAYA','US','TARAZ','NUM1'),
                             (2,'NURSULTANA','SA','ALMATY','NUM2'),
                             (3,'KABANBAYA','PS','ASTANA','NUM3'),
                             (4,'BOGENBAYA','AS','NEW YORK','NUM4'),
                             (5,'ASATAYA','TLP','LA','NUM5'),
                             (6,'ASATAYA','TDE','LA','NUM6'),
                             (7,'ASATAYA','TD','LA','NUM7'),
                             (8,'ASATAYA','TAF','LA','NUM8'),
                             (9,'ASATAYA','AFF','LA','NUM10'),
                             (10,'ASATAYA','AF1','LA','NUM11'),
                             (11,'ASATAYA','DSRG','LA','NUM12'),
                             (12,'ASATAYA','TDFG','LA','NUM13'),
                             (13,'ASATAYA','HJ','LA','NUM14'),
                             (14,'ASATAYA','TSF','LA','NUM15'),
                             (15,'ASATAYA','LG','LA','NUM16'),
                             (16,'BOGENBAYA','GG','LA','NUM17'),
                             (17,'BOGENBAYA','GWE','LA','NUM18'),
                             (18,'BOGENBAYA','DF','LA','NUM20'),
                             (19,'BOGENBAYA','DF','LA','NUM21'),
                             (20,'BOGENBAYA','RFV','LA','NUM22'),
                             (21,'ASATAYA','FVD','LA','NUM23'),
                             (22,'ASATAYA','SDV','LA','NUM24'),
                             (23,'ASATAYA','TSFV','LA','NUM25'),
                             (24,'ASATAYA','AF','LA','NUM26'),
                             (25,'ASATAYA','SEF','LA','NUM27'),
                             (26,'ASATAYA','SEFS','LA','NUM28'),
                             (27,'ASATAYA','SCC','LA','NUM29'),
                             (28,'ABAYA','SF','LA','NUM30');
SELECT * FROM countries;
INSERT INTO departments VALUES(40,'ALFA',11000,1),
                               (50,'BETA',12000,2),
                               (60,'GAMMA',13000,3),
                               (70,'DELTA',14000,4),
                               (80,'CERA',15000,5),
                               (90,'CERA0',16000,6),
                               (100,'CERA1',17000,7),
                               (120,'CERA2',18000,8),
                               (130,'CERA3',15000,9),
                               (140,'CERA4',19000,10),
                               (150,'CERA5',22000,11),
                               (160,'CERA6',234000,12),
                               (170,'CERA7',152300,13),
                               (180,'CERA8',1530,14),
                               (190,'CERA9',113400,15),
                               (200,'CERA10',1000,16),
                               (210,'CERA11',150,17),
                               (220,'CERA12',152000,18),
                               (230,'CERA13',15200,19),
                               (240,'CERA14',150200,20),
                               (250,'CERA15',1120,21),
                               (260,'CERA16',33300,22),
                               (270,'CERA17',1400,23),
                               (280,'CERA18',134000,24),
                               (290,'CERA19',14400,25),
                               (300,'CERA20',153200,26),
                               (310,'CERA21',150230,27),
                               (320,'CERA22',1500330,28);


-- SELECT * FROM departments;

INSERT INTO employees VALUES (10,'ABYLAY','a','abylay@gmailcom','87770101',34000,40),
                             (20,'BILL','B','bill@gmail.com','877701',54000,50),
                             (30,'CARL','C','carl@gmail.com','87770101',64000,60),
                             (40,'DEN','D','den@gmail.com','8777010',74000,70),
                             (50,'STEVE','S','ellenQ@gmail.com','8777010',84000,80),
                             (60,'EBOB','E','ellWen@gmail.com','8777010',84000,90),
                             (70,'JORSH','J','ellDen@gmail.com','8777010',184000,100),
                             (90,'STEGAN','E','ellSen@gmail.com','8777010',8314000,120),
                             (100,'SEM','E','ellADen@gmail.com','8777010',8314000,130),
                             (120,'BARAK','E','ellAFen@gmail.com','8777010',3184000,140),
                             (130,'KLAN','E','elAEFlen@gmail.com','8777010',834000,150),
                             (140,'KHAN','E','ellAEFen@gmail.com','8777010',184000,160),
                             (150,'WILL','E','ellCDen@gmail.com','8777010',8144000,170),
                             (160,'ELLEN','E','ellADFen@gmail.com','8777010',5840400,180),
                             (170,'ELLEN','E','elWERlen@gmail.com','8777010',24000,190),
                             (180,'WILLIAM','E','eSADlen@gmail.com','8777010',224000,200),
                             (190,'ROGER','E','ellAFen@gmail.com','8777010',82500,210),
                             (200,'SHERLOCK','E','SFellen@gmail.com','8777010',22200,220),
                             (210,'WATSON','E','SDGellen@gmail.com','8777010',253500,230),
                             (220,'STEVENSON','E','SFellen@gmail.com','8777010',8235000,240),
                             (230,'SLEX','E','SGGRellen@gmail.com','8777010',2350,250),
                             (240,'ALEX','E','EHFellen@gmail.com','8777010',243500,260),
                             (250,'DAVID','E','DRGellen@gmail.com','8777010',23500,270),
                             (260,'JONA','E','RTHTellen@gmail.com','8777010',114000,280),
                             (270,'STEVE','E','THRTDellen@gmail.com','8777010',2344000,290),
                             (280,'ZAIN','E','ERGRellen@gmail.com','8777010',11340,300),
                             (290,'NATALIE','E','ERGEellen@gmail.com','8777010',4444000,310),
                             (300,'ALEXANDRE','E','ERGellen@gmail.com','8777010',100,320);

SELECT * FROM countries WHERE name='ASATAYA';---1
EXPLAIN ANALYSE SELECT  * FROM countries WHERE NAME='ASATAYA';
CREATE INDEX name_index ON countries(name);
ANALYSE ;
-- DROP INDEX name_index;
SELECT * FROM employees WHERE first_name='ALEXANDRE' AND last_name='E';----2
EXPLAIN ANALYSE SELECT * FROM employees WHERE first_name='ALEXANDRE' AND last_name='E';
CREATE INDEX name_surname_index ON employees(first_name,last_name);
analyse ;
-- DROP INDEX name_surname_index;
SELECT  * FROM employees WHERE salary<1000000 AND salary>100;-----3
CREATE UNIQUE INDEX unique_index ON employees(salary);
EXPLAIN analyse SELECT  * FROM employees WHERE salary<1000000 AND salary>100;
ANALYSE;
-- DROP INDEX unique_index;
SELECT  * FROM employees WHERE substring(first_name from 1 for 3)='STE';----4
CREATE INDEX substring_index ON employees(substring(first_name from 1 for 3));
EXPLAIN ANALYSE SELECT  * FROM employees WHERE substring(first_name from 1 for 3)='STE';
ANALYSE;
-- DROP INDEX substring_index;
SELECT * FROM employees e JOIN departments d on e.department_id = d.department_id WHERE d.budget>100 and d.budget<1000000;---5
CREATE INDEX budget_index ON employees(department_id);
-- CREATE INDEX budget_index1 ON departments(department_id);
EXPLAIN  ANALYSE SELECT * FROM employees e JOIN departments d on e.department_id = d.department_id WHERE d.budget>100 and d.budget<1000000;
ANALYSE ;
-- DROP INDEX budget_index;
ALTER TABLE employees
ADD COLUMN p point;
INSERT INTO employees(p) VALUES (point '(1,1)'), (point '(3,2)'), (point '(6,3)'),(point '(5,5)'), (point '(7,8)'), (point '(8,6)');---6
CREATE INDEX rtree_index ON employees USING rtree(p);
explain analyse  select p from employees;
analyse;
-- DROP index rtree_index;
CREATE INDEX name_index ON departments USING hash(department_name);---7
EXPLAIN ANALYSE SELECT department_name FROM departments;
ANALYSE;
-- DROP INDEX name_index;
CREATE UNIQUE INDEX name_index ON countries(state_province,name);---8
explain analyse select state_province,name from countries;
analyse;
drop index name_index;


