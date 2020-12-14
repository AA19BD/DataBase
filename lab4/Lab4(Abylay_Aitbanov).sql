CREATE DATABASE laboratory_work_4;--1
CREATE TABLE Warehouses(--2
    code  INTEGER  PRIMARY KEY,
    location character varying(255),
    capacity INTEGER
);
CREATE TABLE Packs(--2
    code character(4),
    contents character varying(255),
    value real,
    warehouse INTEGER,
    FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);
INSERT INTO Warehouses VALUES(1,'Chicago',3),
                             (2,'Chicago',4),
                             (3,'New York',7),
                             (4,'Los Angeles',2),
                             (5,'San Francisco',8);
-- DROP TABLE Warehouses CASCADE ;
-- DROP TABLE Packs CASCADE;
-- DROP DATABASE laboratory_work_4;
-- SELECT * FROM Warehouses;
INSERT INTO Packs VALUES('0MN7','Rocks',180,3),
                         ('4H8P','Rocks',250,1),
                         ('4RT3','Scissors',190,4),
                         ('7G3H','Rocks',200,1),
                         ('8JN6','Papers',75,1),
                         ('8Y6U','Papers',50,3),
                         ('9J6F','Papers',175,2),
                         ('LL08','Rocks',140,4),
                         ('P0H6','Scissors',125,1),
                         ('P2T6','Scissors',150,2),
                         ('TU55','Papers',90,5);

SELECT * FROM Packs;--4
SELECT * FROM Packs WHERE value>180;--5
SELECT DISTINCT (contents) FROM Packs;--6
SELECT warehouse,count(contents) FROM Packs GROUP BY warehouse;--7
SELECT warehouse,count(contents) FROM Packs  GROUP BY warehouse HAVING count(contents)>2;--8
INSERT INTO Warehouses VALUES(6,'Texas',5);--9
INSERT INTO Packs VALUES('H5RT','Papers',350,2);--10
UPDATE Packs SET value=value*0.82 WHERE value=(SELECT value FROM Packs ORDER BY value DESC LIMIT 1 OFFSET 2);--11
DELETE FROM Packs WHERE value<=150;--12
DELETE FROM Packs WHERE warehouse in(SELECT code FROM Warehouses WHERE location='Chicago')
RETURNING *;--13
----------Aditional Task----------------------------------------------------------
-- Prepare please examples on expression Case,Coalesce, IN, NOT IN, exists, any, some, all on your table.
SELECT contents,value,
CASE
    WHEN value=150 THEN 'MEDIUM PRICE'
    WHEN VALUE>200 THEN 'EXPENSIVE PRICE'
    ELSE 'NORMAL PRICE'
END
FROM Packs;

INSERT INTO Packs(contents) VALUES (NULL);
INSERT INTO Packs(contents) VALUES (NULL);
INSERT INTO Packs(contents) VALUES (NULL);

SELECT COALESCE(contents) FROM Packs;

SELECT * FROM Packs WHERE warehouse IN(1,3);
SELECT * FROM Packs WHERE warehouse NOT IN (1,4);

SELECT warehouse FROM Packs WHERE EXISTS(SELECT CODE FROM Warehouses WHERE Warehouses.code=Packs.warehouse);
SELECT contents,warehouse AS CITY_NUMBER FROM Packs WHERE warehouse=ANY(SELECT CODE FROM Warehouses WHERE capacity>4);

SELECT location FROM Warehouses WHERE code=SOME(SELECT warehouse FROM Packs WHERE value>200);

SELECT location,capacity FROM Warehouses WHERE code=ALL(SELECT warehouse FROM Packs WHERE contents='Rocks' );




