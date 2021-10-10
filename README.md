# Introduction to Relational Joins 

By: Alan Wang and Dominnic Chant

This repository contains our final project for our MSDS 610: Communications for Analytics course.

## Introduction

In the world of data science, people use SQL (Structured Query Languag) to interact with relational databases. Oftentimes, you need to access data across multiple tables. Imagine if you could only work with one table at a time, it would be extremely restricted and painful. Fortunately, this isn’t anything we have to worry about. The `JOIN` clause allows us to combine the columns from two or more tables based on shared column values. Once you learn the `JOIN` statement, you can start linking data together, which expands the possibility how you can explore data. We are going to introduce five different `JOIN`s here. They are `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN` and `CROSS JOIN`. 

## INNER JOIN

### Concept

`INNER JOIN` returns records that have a match in both tables based on the join condition.

<img src=figures/inner_join.png width=300>

### Example

Have two tables `student` and `score`.

`student` has all the students' information. 

 id | name | gender | class
------------ | ------------- | ------------- | -------------
1 | Bob | M | Class 1
2 | Alice | F | Class 1
3 | John | M | Class 2
4 | Evi | F | Class 3

`score` has all the students' test score.

 id | score
------------ | -------------
1 | 92
2 | 88
3 | 79
4 | 95
5 | 75