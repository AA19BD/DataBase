CREATE DATABASE laboratory_work2;

CREATE TABLE metropolises(
    id serial PRIMARY KEY ,
    name varchar(50),
    district_id integer,
    population integer
);
SELECT * FROM metropolises_new;
-- DROP TABLE metropolises;
-- DROP DATABASE laboratory_work2;
INSERT INTO metropolises VALUES(DEFAULT,'SARA','1','100');
INSERT INTO metropolises(id,name) VALUES(DEFAULT,'BOB');
INSERT INTO metropolises(district_id) VALUES(NULL);--OR (DEFAULT);
INSERT INTO metropolises VALUES(DEFAULT,'JOSH','23','101'),
                               (DEFAULT,'BILL','56','103'),
                               (DEFAULT,'MIKE','24','104');

ALTER TABLE metropolises
ALTER COLUMN name SET DEFAULT'Earth';
INSERT INTO metropolises(name) VALUES(DEFAULT);--8
INSERT INTO metropolises DEFAULT VALUES;

CREATE TABLE metropolises_new (LIKE metropolises);
SELECT * FROM metropolises_new;
-- DROP TABLE metropolises_new;
INSERT INTO metropolises_new SELECT * FROM metropolises;
UPDATE metropolises_new SET district_id=1 WHERE district_id IS NULL;
-------------------------------------
ALTER TABLE metropolises_new
ADD COLUMN New_Population integer;

UPDATE metropolises_new SET New_Population=population*1.15 WHERE population notnull;

DELETE FROM metropolises_new WHERE population<100000;

--------------------------
ALTER TABLE metropolises_new
ADD COLUMN country varchar(50);

INSERT INTO metropolises_new values(1,'JOSH','223','1031','1111','SPAIN');
SELECT * FROM metropolises_new;

SELECT * FROM metropolises_new WHERE population IS NOT NULL;