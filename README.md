# Introduction to Relational Joins 
By: Alan Wang and Dominnic Chant

This repository contains our final project for our MSDS 610: Communications for Analytics course.

## Introduction
In the world of data science, people use SQL (Structured Query Languag) to interact with relational databases. Oftentimes, you need to access data across multiple tables. Imagine if you could only work with one table at a time, it would be extremely restricted and painful. Fortunately, this isn’t anything we have to worry about. The `JOIN` clause allows us to combine the columns from two or more tables based on shared column values. Once you learn the `JOIN` statement, you can start linking data together, which expands the possibility how you can explore data. We are going to introduce five different `JOIN`s here. They are `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN` and `CROSS JOIN`. 

## Inner Join

### Concept
`INNER JOIN` returns records that have a match in both tables based on the join condition.

<img src=figures/inner_join.png width=300>

### Example
Create two tables `student` and `score`.
```
-- Create Table
CREATE TABLE student(
	name VARCHAR,
	class VARCHAR);

CREATE TABLE score(
	student_id INTEGER,
	score INTEGER);
```

`student` has all the students' information. 
```
-- Insert Data
INSERT INTO student 
VALUES	('Bob', 'class 1'), 
	('Alice', 'class 1'), 
	('Evi', 'class 2'),
	('John', 'class 3');
```

name | class
------------- | ------------- 
Bob | class 1
Alice | class 1
Evi | class 2
John | class 3

`score` has all the students' test score.
```
-- Insert Data
INSERT INTO score 
VALUES	('Bob', 92), 
	('Alice', 88),
	('Evi', 95),
	('Peter', 68);
```

 student_name | score
------------ | -------------
Bob | 92
Alice | 88
Evi | 95
Peter | 68

```
-- Inner Join
SELECT *
FROM student
INNER JOIN score
ON student.name = score.student_name;
```

`INNER JOIN` returns records that are in both tables you join with. Notice that `John` is not in `score` and `Peter` is not in `student`. Therefore, those records would be ignored and the query returns the following results:

name | class | student_name | score
------------- | ------------- | ------------- | ------------- 
Alice | class 1 | Alice | 88
Bob | class 1 | Bob | 92
Evi | class 2 | Evi | 95

## Left Join

### Concept

`LEFT JOIN` will return all records from the left table (i.e. the table you list first in the `JOIN`) and only matching records from the right (i.e. second) table.

<img src=figures/left_join.png width=300>

### Example
```
-- Left Join
SELECT *
FROM student
LEFT JOIN score
ON student.name = score.student_name;
```

The query would keep all the records from `student` and find matches in `score`. Notice that `John` is not in `score`, the query would not find a match from the right table and would leave null value in the corresponding columns.

name | class | student_name | score
------------- | ------------- | ------------- | ------------- 
Alice | class 1 | Alice | 88
Bob | class 1 | Bob | 92
Evi | class 2 | Evi | 95
John | class 2 | null | null