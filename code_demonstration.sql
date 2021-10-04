--drop tables
DROP TABLE IF EXISTS paid;
DROP TABLE IF EXISTS sales;

--create tables
CREATE TABLE paid(
	name VARCHAR,
	paid VARCHAR);
	
CREATE TABLE sales(
	name VARCHAR,
	items_bought INTEGER);

--create data
INSERT INTO paid 
VALUES ('Bob', 'Y'), 
	   ('John', 'N'), 
	   ('Jerry', 'N'),
	   ('Tom', 'Y');
	
INSERT INTO sales 
VALUES ('John', 12), 
	   ('Jerry', 30), 
	   ('Jack', 14),
	   ('Tom', 17);

--check table  
SELECT * 
FROM paid;

SELECT * 
FROM sales;

--left join
SELECT *
FROM paid
LEFT JOIN sales
ON paid.name = sales.name;

--right join
SELECT *
FROM paid
RIGHT JOIN sales
ON paid.name = sales.name;

--inner join
SELECT *
FROM paid
JOIN sales
ON paid.name = sales.name;

--full join
SELECT *
FROM paid
FULL JOIN sales
ON paid.name = sales.name;

--drop table
DROP TABLE IF EXISTS nba;

--create table
CREATE TABLE nba(
	East VARCHAR,
	West VARCHAR);

--create data
INSERT INTO nba VALUES
('Philadelphia 76ers', 'Golden State Warriors'), 
('Brooklyn Nets', 'Los Angeles Lakers'),
('Milwaukee Bucks', 'Phoenix Suns');

--check table
SELECT
	*
FROM nba

--cross join
SELECT
	t1.west,
	t2.east
FROM nba t1
CROSS JOIN nba t2;