-- WORK DONE BY ABYLAY AITBANOV 13.09.20
CREATE DATABASE laboratory_work1;

CREATE TABLE shoppers(
    num serial,
    fist_name varchar(50),
    last_name varchar(50),
    middle_name varchar(50),
    birth_date date
);
SELECT * FROM shoppers;
insert into shoppers(fist_name,last_name,middle_name,birth_date)
values('Abylay','AITBANOV','TOYMAGANBETOV','3.3.2000');

ALTER TABLE shoppers
ADD COLUMN admin_group integer;

ALTER TABLE shoppers
ADD COLUMN salary integer;

ALTER TABLE shoppers ALTER COLUMN admin_group DROP DEFAULT;
ALTER TABLE shoppers ALTER admin_group TYPE bool USING admin_group::boolean;

ALTER TABLE shoppers ALTER COLUMN admin_group SET DEFAULT FALSE;

ALTER TABLE shoppers ALTER COLUMN salary SET DEFAULT 100000;

ALTER TABLE shoppers ADD PRIMARY KEY (num);

CREATE TABLE jobs(
    num serial,
    name varchar(50),
    shoppers_num integer,
    description varchar(50)
);
-- SELECT * FROM jobs;
DROP TABLE jobs;
DROP DATABASE laboratory_work1;
DROP TABLE shoppers;

ALTER TABLE shoppers ADD COLUMN city varchar(50);
-- insert into shoppers(city)
-- values('Almaty');
ALTER TABLE shoppers
ALTER COLUMN city SET DEFAULT 'Almaty';
