CREATE DATABASE lab5;--1
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

INSERT INTO customers VALUES(3002,'Nick Rimando','New York',100,5001),
                            (3005,'Graham Zusi','California',200,5002),
                            (3001,'Brad Guzan','London',null,5005),
                            (3004,'Fabian Johns','Paris',300,5006),
                            (3007,'Brad Davis','New York',200,5001),
                            (3009,'Geoff Camero','Berlin',100,5003),
                            (3008,'Julian Green','London',300,5002);

INSERT INTO salesman VALUES(5001,'James Hoog','New York',0.15),
                           (5002,'Nail Knite','Paris',0.13),
                            (5005,'Pit Alex','London',0.11),
                            (5006,'Mc Lyon','Paris',0.14),
                            (5003,'Lauson Hen',null,0.12),
                            (5007,'Paul Adam','Rome',0.13);
INSERT INTO orders VALUES(70001,150.5,'2012-10-05',3005,5002),
                          (70009,270.65,'2012-09-10',3001,5005),
                          (70002,65.26,'2012-10-05',3002,5001),
                          (70004,110.5,'2012-08-17',3009,5003),
                          (70007,948.5,'2012-09-10',3005,5002),
                          (70005,2400.6,'2012-07-27',3007,5001),
                          (70008,5760,'2012-09-10',3002,5001);
-- SELECT * FROM customers;
-- SELECT * FROM salesman;
-- SELECT * FROM orders;
SELECT SUM(purch_amt) FROM orders;--3
SELECT avg(purch_amt) FROM orders;--4
SELECT COUNT(cust_name) FROM customers;--5
SELECT MIN(purch_amt) FROM ORDERS;--6
SELECT * FROM customers WHERE cust_name LIKE '__b%b';--7
SELECT * FROM orders WHERE customer_id in(SELECT customer_id FROM customers WHERE city='New York');--8
SELECT * FROM customers WHERE customer_id in(SELECT customer_id FROM orders WHERE purch_amt>10);--9
select sum(grade) from customers;--10
SELECT * FROM customers WHERE cust_name IS NOT NULL;--11
SELECT MAX(grade) FROM customers;


