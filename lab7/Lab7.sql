CREATE DATABASE lab7;
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
                            (3007,'Brad Davis','New York',200,5001),
                            (3005,'Graham Zusi','California',200,5002),
                            (3008,'Julian Green','London',300,5002),
                            (3004,'Fabian Johnson','Paris',300,5006),
                            (3009,'Geoff Cameron','Berlin',100,5003),
                            (3003,'Jozy Altidor','Moscow',200,5007),
                            (3001,'Brad Guzan','London',null,5005);


INSERT INTO salesman VALUES(5001,'James Hoog','New York',0.15),
                           (5002,'Nail Knite','Paris',0.13),
                           (5005,'Pit Alex','London',0.11),
                           (5006,'Mc Lyon','Paris',0.14),
                           (5007,'Paul Adam','Rome',0.13),
                           (5003,'Lauson Hen','San Jose',0.12);
-- INSERT INTO salesman VALUES(1111,null,null,null);

INSERT INTO orders VALUES(70001,150.5,'2012-10-05',3005,5002),
                          (70009,270.65,'2012-09-10',3001,5005),
                          (70002,65.26,'2012-10-05',3002,5001),
                          (70004,110.5,'2012-08-17',3009,5003),
                          (70007,948.5,'2012-09-10',3005,5002),
                          (70005,2400.6,'2012-07-27',3007,5001),
                          (70008,5760,'2012-09-10',3002,5001),
                          (70010,1983.43,'2012-10-10',3004,5006),
                          (70003,2480.4,'2012-10-10',3009,5003),
                          (70012,250.45,'2012-06-27',3008,5002),
                          (70011,75.29,'2012-08-17',3003,5007),
                          (70013,3045.6,'2012-04-25',3002,5001);

SELECT s.name,customers.cust_name,s.city,customers.city FROM customers INNER JOIN salesman s on s.salesman_id = customers.salesman_id and s.city=customers.city;
----3----
SELECT orders.ord_no,orders.purch_amt,customers.cust_name,customers.city FROM orders INNER JOIN customers ON orders.customer_id = customers.customer_id WHERE purch_amt BETWEEN 500 AND 2000;
----4----
SELECT s.name,c.cust_name FROM customers c INNER JOIN salesman s ON c.salesman_id = s.salesman_id;
----5----
SELECT c.* FROM customers c INNER JOIN salesman s on s.salesman_id = c.salesman_id WHERE s.commission>0.12;
----6----
SELECT c.cust_name,c.city,o.ord_no,o.ord_date,o.purch_amt FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id ORDER BY o.ord_date;
----7----
SELECT s.name,count(s.salesman_id) FROM salesman s LEFT JOIN customers c   ON s.salesman_id = c.salesman_id GROUP BY s.name ORDER BY count(s.salesman_id);
-------Additional Task----------
INSERT INTO  orders (ord_no,customer_id) values (NULL,3005);
INSERT INTO  orders (ord_no,customer_id) values (NULL,3002);
SELECT c.cust_name,o.ord_no FROM customers c left JOIN orders o ON c.customer_id = o.customer_id where ord_no is NULL;
