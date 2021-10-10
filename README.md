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

`student` has all the students' information. 

```
-- Create Table
CREATE TABLE student(
	id INTEGER,
	name VARCHAR,
	class VARCHAR);

-- Insert Data
INSERT INTO student 
VALUES	(1, 'Bob', 'class 1'), 
	(2, 'Alice', 'class 1'), 
	(3, 'Evi', 'class 2'),
	(4, 'John', 'class 3');
```

 id | name | class
------------ | ------------- | ------------- 
1 | Bob | class 1
2 | Alice | class 1
3 | Evi | class 2
4 | John | class 3

`score` has all the students' test score.

```
-- Create Table
CREATE TABLE score(
	student_id INTEGER,
	score INTEGER);

-- Insert Data
INSERT INTO score 
VALUES	(1, 92), 
	(2, 88),
	(3, 95),
	(5, 68);
```

 id | score
------------ | -------------
1 | 92
2 | 88
3 | 95
5 | 68

```
-- Inner Join
SELECT *
FROM student
INNER JOIN score
ON student.id = score.student_id;
```

`INNER JOIN` returns records that are in both tables you join with. Notice that `id = 4` is not in `score` table and `id = 5` is not in `student` table. Therefore, the query returns the following results:

 id | name | class | student_id | score
------------ | ------------- | ------------- | ------------- | ------------- 
1 | Bob | class 1 | 1 | 92
2 | Alice | class 1 | 2| 88
3 | Evi | class 2 | 3| 95


