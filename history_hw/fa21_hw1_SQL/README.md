# Fa21 Hw1 SQL

<https://15445.courses.cs.cmu.edu/fall2021/homework1/>

## Q2

If the table name is a keyword in SQL (e.g., `Order` in Q1), just wrap them with single quote.

## Q3

`IIF` function work just like `if` statement. 

## Q4

Use `CAST` function to convert datatype into `REAL` number. Otherwise, SQLite do integer division for two integers by default. 

## Q5

Difficult to understand the last column. 

## Q6 

Mis-understood question. There exists schema named `Discontinued` in table `Product`. And when `Discontinued` is not equal to `0` (i.e., `Discontinued = 1`), it is discontinued products.

## Q7

`LAG()` function takes in 3 arguments: column-name, number of lag behind (`1` by default) and plug-in for first row (`NULL` by default), respectively. 
