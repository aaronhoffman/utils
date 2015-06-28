/*
There is a table with data like the following:
AAA
AAA
AAA
BBB
BBB
CCC

You would like the data to look like this:
AAA, 1
AAA, 2
AAA, 3
BBB, 1
BBB, 2
CCC, 1
*/

SELECT ColumnName, ROW_NUMBER() OVER (PARTITION BY ColumnName ORDER BY ColumnName) AS RunningCount
FROM TableName