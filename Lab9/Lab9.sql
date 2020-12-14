CREATE DATABASE lab9;
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

-- SELECT * FROM orders;
CREATE VIEW salesman_city AS SELECT * FROM salesman WHERE city='New York';--3
select * FROM salesman_city;

CREATE VIEW order_names---4
    AS SELECT s.name,c.cust_name
    FROM ((orders o INNER JOIN customers c ON o.customer_id=c.customer_id)
         INNER JOIN salesman s ON o.salesman_id=s.salesman_id);
SELECT * FROM order_names;

CREATE OR REPLACE VIEW highest_grade--5
    AS SELECT cust_name,grade  FROM customers c ORDER BY grade DESC NULLS LAST;
SELECT * FROM highest_grade;

CREATE OR REPLACE VIEW number_salesman---6.1
    AS SELECT c.city,count(s.salesman_id)
    FROM customers c
        INNER JOIN salesman s  ON c.salesman_id = s.salesman_id GROUP BY c.city;
SELECT * FROM number_salesman;

CREATE OR REPLACE VIEW number_salesman2---6.2
    AS SELECT c.city,s.name,count(s.salesman_id)
    FROM customers c
        INNER JOIN salesman s  ON c.salesman_id = s.salesman_id GROUP BY c.city,s.name;
SELECT * FROM number_salesman2;

CREATE OR REPLACE VIEW customer_and_salesman---7
    AS SELECT s.name,count(c.customer_id)
    FROM customers c INNER JOIN salesman s ON c.salesman_id=s.salesman_id GROUP BY s.name
    HAVING  count(c.customer_id)>1;
SELECT * FROM customer_and_salesman;

CREATE OR REPLACE VIEW like_operator AS SELECT city FROM customers WHERE city LIKE '%n';--8
SELECT * FROM like_operator;

CREATE OR REPLACE VIEW join_statement---9
    AS SELECT c.cust_name,o.ord_date,s.name
    FROM((orders o INNER JOIN customers c ON o.customer_id = c.customer_id)
    INNER JOIN salesman s ON s.salesman_id=o.salesman_id) ORDER BY o.ord_date;
select * from join_statement;

CREATE OR REPLACE VIEW union_view AS SELECT city FROM customers UNION SELECT city FROM salesman;
SELECT * FROM union_view;--10

CREATE OR REPLACE VIEW order_view--11
    AS SELECT s.name,o.purch_amt FROM orders o
        INNER JOIN salesman s
        ON o.salesman_id = s.salesman_id
    ORDER BY o.purch_amt DESC ;
SELECT * FROM order_view;

CREATE VIEW abc AS SELECT * FROM orders;---12
ALTER VIEW abc RENAME TO xyz;
SELECT * FROM xyz;

CREATE OR REPLACE VIEW group_by_view--13
    AS SELECT s.salesman_id,s.name,count(o.ord_no) as orders
    FROM orders o
        INNER JOIN salesman s ON o.salesman_id = s.salesman_id
    GROUP BY s.salesman_id
    ORDER BY orders DESC ;
SELECT * FROM group_by_view;
