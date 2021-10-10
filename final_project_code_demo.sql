--drop tables
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS score;

--create tables
CREATE TABLE student(
	name VARCHAR,
	class VARCHAR);
	
CREATE TABLE score(
	student_name VARCHAR,
	score INTEGER);

--create data
INSERT INTO student 
VALUES ('Bob', 'class 1'), 
	   ('Alice', 'class 1'), 
	   ('Evi', 'class 2'),
	   ('John', 'class 3');
	
INSERT INTO score 
VALUES ('Bob', 92), 
	   ('Alice', 88),
	   ('Evi', 95),
	   ('Peter', 68);

--check table  
SELECT * 
FROM student;

SELECT * 
FROM score;

--left join
SELECT *
FROM student
LEFT JOIN score
ON student.name = score.student_name;

--right join
SELECT *
FROM student
RIGHT JOIN score
ON student.name = score.student_name;

--inner join
SELECT *
FROM student
INNER JOIN score
ON student.name = score.student_name;

--full join
SELECT *
FROM student
FULL JOIN score
ON student.name = score.student_name;

--drop table
DROP TABLE IF EXISTS food;
DROP TABLE IF EXISTS drink;

--create table
CREATE TABLE food(
	food VARCHAR);

CREATE TABLE drink(
	drink VARCHAR);

--create data
INSERT INTO food VALUES
('Cheeseburger'),
('Fried Rice'),
('Fish Taco');

INSERT INTO drink VALUES
('Coke'),
('Sprite'),
('La Croix');

--check table
SELECT
	*
FROM food;

SELECT
	*
FROM drink;

--cross join
SELECT
	*
FROM food
CROSS JOIN drink;

--non caffeinated drink combo
SELECT
	*
FROM food
CROSS JOIN drink
WHERE drink != 'Coke';