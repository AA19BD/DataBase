
CREATE DATABASE lab_10;
CREATE TABLE Reviewer(----------------------1
    rID serial PRIMARY KEY,
    name varchar(250)
);
CREATE TABLE Rating(
    rID integer references Reviewer,
    mID integer references Movie,
    stars integer,
    ratingDate date
);
CREATE TABLE Movie(
    mID serial primary key,
    title varchar(250),
    year integer,
    director varchar(250)
);
CREATE TABLE customers(
    customer_id INTEGER PRIMARY KEY,
    cust_name varchar(250),
    city varchar(250),
    grade INTEGER,
    salesman_id INTEGER references salesman
);

CREATE TABLE orders(
    ord_no INTEGER,
    purch_amt real,
    ord_date date,
    customer_id INTEGER references customers,
    salesman_id INTEGER references salesman

);
CREATE TABLE salesman(
    salesman_id INTEGER primary key,
    name varchar(250),
    city varchar(250),
    commission real
);
INSERT INTO Reviewer VALUES (201,'Sarah Martinez'),
                            (202,'Daniel Lewis'),
                            (203,'Brittany Harris'),
                            (204,'Mike Anderson'),
                            (205,'Chris Jackson'),
                            (206,'Elizabeth Thomas'),
                            (207,'James Cameron'),
                            (208,'Ashley White');
INSERT INTO Movie VALUES (101,'Gone with the Wind',1939,'Victor Fleming'),
                         (102,'Stars Wars',1977,'George Lukas'),
                         (103,'The Sound of Music',1965,'Robert Wise'),
                         (104,'E.T',1982,'Steven Spielberg'),
                         (105,'Titanic',1997,'James Cameron'),
                         (106,'Snow White',1937,null),
                         (107,'Avatar',2009,'James Cameron'),
                         (108,'Raiders of the Lost Ark',1981,'Steven Spielberg');
INSERT INTO Rating VALUES (201,101,2,'2011-01-22'),
                          (201,101,4,'2011-01-27'),
                          (202,106,4,NULL),
                          (203,103,2,'2011-01-20'),
                          (203,108,4,'2011-01-12'),
                          (203,108,2,'2011-01-30'),
                          (204,101,3,'2011-01-09'),
                          (205,103,3,'2011-01-27'),
                          (205,104,2,'2011-01-22');
INSERT INTO salesman VALUES(5001,'James Hoog','New York',0.15),
                           (5002,'Nail Knite','Paris',0.13),
                           (5005,'Pit Alex','London',0.11),
                           (5006,'Mc Lyon','Paris',0.14),
                           (5003,'Lauson Hen',NULL,0.12),
                           (5007,'Paul Adam','Rome',0.13);
-- SELECT * FROM salesman;
INSERT INTO customers VALUES(3002,'Nick Rimando','New York',100,5001),
                            (3005,'Graham Zusi','California',200,5002),
                            (3001,'Brad Guzan','London',null,5005),
                            (3004,'Fabian Johnson','Paris',300,5006),
                            (3007,'Brad Davis','New York',200,5001),
                            (3009,'Geoff Cameron','Berlin',100,5003),
                            (3008,'Julian Green','London',300,5002);
-- SELECT * FROM customers;
INSERT INTO orders VALUES(70001,150.5,'2012-10-05',3005,5002),
                          (70009,270.65,'2012-09-10',3001,5005),
                          (70002,65.26,'2012-10-05',3002,5001),
                          (70004,110.5,'2012-08-17',3009,5003),
                          (70007,948.5,'2012-09-10',3005,5002),
                          (70005,2400.6,'2012-07-27',3007,5001),
                          (70008,5760,'2012-09-10',3002,5001);

CREATE ROLE junior_dev WITH LOGIN;---2
ALTER ROLE junior_dev PASSWORD '123';

CREATE VIEW order_salesman_and_customer---3
    AS SELECT s.name,c.cust_name FROM ((orders o INNER JOIN salesman s
        ON o.salesman_id = s.salesman_id) INNER JOIN customers c ON c.customer_id=o.customer_id);


GRANT ALL ON order_salesman_and_customer  TO junior_dev;
SELECT * FROM order_salesman_and_customer;

CREATE OR REPLACE VIEW highest_grade AS SELECT c.cust_name,c.grade--4
FROM customers c
ORDER BY grade DESC NULLS LAST;

GRANT select ON highest_grade TO junior_dev;
select * FROM highest_grade;

CREATE ROLE intern INHERIT LOGIN password '123'; --5
GRANT junior_dev TO intern;


CREATE VIEW movie_stars AS SELECT m.title,m.year,r.stars--6
FROM Movie m INNER JOIN Rating r on m.mID = r.mID WHERE r.stars in(4,5) ORDER BY r.stars;
SELECT * FROM movie_stars;

CREATE ROLE ex_of_role WITH LOGIN CREATEROLE INHERIT ;--7

GRANT postgres TO ex_of_role;--8

CREATE ROLE student WITH LOGIN PASSWORD '123'--9
VALID UNTIL '2022-01-01';
CREATE ROLE admin WITH CREATEDB createrole ;

ALTER ROLE student PASSWORD '12';--10

SELECT * FROM pg_roles;