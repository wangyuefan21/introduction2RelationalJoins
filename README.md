# Introduction to Relational Joins 
By: Alan Wang and Dominnic Chant

This repository contains our final project for MSDS 610: Communications for Analytics.

## Introduction
In the world of data science, people use SQL (Structured Query Language) to interact with relational databases. Oftentimes, you need to access data across multiple tables. Imagine if you could only work with one table at a time, doing analysis or modeling would be extremely restricted and painful. Fortunately, this isn’t anything we have to worry about. The `JOIN` clause allows us to combine the columns from two or more tables based on shared column values. Once you learn the `JOIN` statement, you can start linking data together, which expands the possibility of how you can explore data. We are going to introduce five different `JOIN`s. They are `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN` and `CROSS JOIN`. 

## Inner Join

### Concept
`INNER JOIN` returns records that have a match in both tables based on the join condition.

<img src=figures/inner_join.png width=300>

### Example
We are going to use an example to illustrate how `INNER JOIN` works. This example will be further developed for `LEFT JOIN`, `RIGHT JOIN` and `FULL JOIN` as well. 

Create two tables called `student` and `score`.
```
-- Create Tables
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
INSERT INTO student VALUES	
	('Bob', 'class 1'), 
	('Alice', 'class 1'), 
	('Evi', 'class 2'),
	('John', 'class 3');

-- Check Table
SELECT * 
FROM student;
```

name | class
------------- | ------------- 
Bob | class 1
Alice | class 1
Evi | class 2
John | class 3

`score` has all the students' test scores.
```
-- Insert Data
INSERT INTO score VALUES	
	('Bob', 92), 
	('Alice', 88),
	('Evi', 95),
	('Peter', 68);

-- Check Table
SELECT * 
FROM score;
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
ON student.name = score.student_name; -- this is the join condition
```

`INNER JOIN` returns records that are in both tables you join. Notice that `John` is not in `score` and `Peter` is not in `student`. Therefore, those records would be ignored and the query returns the following results:

name | class | student_name | score
------------- | ------------- | ------------- | ------------- 
Alice | class 1 | Alice | 88
Bob | class 1 | Bob | 92
Evi | class 2 | Evi | 95

## Left Join

### Concept

`LEFT JOIN` will return all records from the left table (i.e. the table you list first in the `JOIN`) and only match records from the right (i.e. second) table.

<img src=figures/left_join.png width=300>

### Example
```
-- Left Join
SELECT *
FROM student -- this is the "left" table
LEFT JOIN score -- this is the "right" table
ON student.name = score.student_name;
```

The query would keep all the records from `student` and find matches in `score`. Notice that `John` is not in `score`, so it would not find a match and would leave `NULL` value.

name | class | student_name | score
------------- | ------------- | ------------- | ------------- 
Alice | class 1 | Alice | 88
Bob | class 1 | Bob | 92
Evi | class 2 | Evi | 95
John | class 2 | NULL | NULL

## Right Join

### Concept

`RIGHT JOIN` is very similar to `LEFT JOIN`, but does the inverse. It will return all records from the right (second) table and only those that have a match from the left (first) table.

<img src=figures/right_join.png width=300>

### Example
```
-- Right Join
SELECT *
FROM student -- this is the "left" table
RIGHT JOIN score -- this is the "right" table
ON student.name = score.student_name;
```

`score` is the right table. The query would keep all records from `score` and find matches from `student`. Notice that `Peter` is not in `student`. Therefore, doing `RIGHT JOIN` would not find a match for `Peter` and would have `NULL` in that row. 

name | class | student_name | score
------------- | ------------- | ------------- | ------------- 
Alice | class 1 | Alice | 88
Bob | class 1 | Bob | 92
Evi | class 2 | Evi | 95
NULL | NULL | Peter | 68

## FULL Join

### Concept

`FULL JOIN` is essentially the combination of a `LEFT JOIN` and a `RIGHT JOIN`. The result set will include all rows from both tables, populating the columns with table values when possible or with `NULL`s when there is no match in the counterpart table. 

<img src=figures/full_join.png width=300>

### Example
```
-- Full Join
SELECT *
FROM student
FULL JOIN score
ON student.name = score.student_name;
```

This is the query results:

name | class | student_name | score
------------- | ------------- | ------------- | ------------- 
Alice | class 1 | Alice | 88
Bob | class 1 | Bob | 92
Evi | class 2 | Evi | 95
John | class 2 | NULL | NULL
NULL | NULL | Peter | 68

## Cross Join

### Concept

`Cross JOIN` retrieves the Cartesian product of both tables. Basically, this gives you the combination of all records from both tables. Since it returns all combinations, `Cross JOIN` doesn't require any join condition.

<img src=figures/cross_join.png width=300>

### Example

Since `Cross JOIN` is a little different from other `JOIN`s, we are going to use a different example to illustrate it. Imagine you walk in a restaurant and you need to pick a `food` and a `drink` to make a meal.

```
-- Create Tables
CREATE TABLE food(
	food VARCHAR);

CREATE TABLE drink(
	drink VARCHAR);

-- Insert data
INSERT INTO food VALUES
('Cheeseburger'),
('Fried Rice'),
('Fish Taco');

INSERT INTO drink VALUES
('Coke'),
('Sprite'),
('La Croix'),
('Iced Tea');
```

This is the `food` menu:
```
SELECT * 
FROM food;
```

food |
------------- |
Cheeseburger |
Fried Rice |
Fish Taco |

This is the `drink` menu:
```
SELECT * 
FROM drink;
```

drink |
------------- |
Coke |
Sprite |
La Croix |
Iced Tea |

If you want to see all the combinations of `food` and `drink` we can possibly get for your meal, you can use `CROSS JOIN`. We can pick your favorite meal combo from the results of `CROSS JOIN`.
```
--cross join
SELECT
	*
FROM food
CROSS JOIN drink;
```

food | drink
------------- | -------------
Cheeseburger | Coke 
Cheeseburger | Sprite
Cheeseburger | La Croix
Cheeseburger | Iced Tea
Fried Rice | Coke 
Fried Rice | Sprite
Fried Rice | La Croix
Fried Rice | Iced Tea
Fish Taco | Coke 
Fish Taco | Sprite
Fish Taco | La Croix
Fish Taco | Iced Tea

## Summary
In conclusion, joins is a simple and efficient way to combine two tables of data together. Specifically, `Cross JOIN` is extremely applicable to cases where you might want to see every possible combination of rows between two tables, whereas `Inner JOIN`, `Full JOIN`, `Left JOIN`, and `Right JOIN`, are good for combining two sets of data together through some common key. What is the next step now that we know how to join two sets of data? In general it can be in the form of using two or more distinct tables or even using a more advanced technique called sub-querying where you combine queries together instead of the original tables. 
Maybe I want to only see the scores of students in class 1, then I would need to join the score table to the student table where it's only the students from class 1. 
Maybe I want to only see the food and drink combo for cheeseburger, then I would have to first query from the food table to only have cheeseburgers, before joining. 
There an infinite number of ways to combine sets of date and we can use joins to help us put together a clean and concise ready for analysis. 




