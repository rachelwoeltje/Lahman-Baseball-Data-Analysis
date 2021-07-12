/* Q1
What range of years for baseball games played does the provided database cover? */
SELECT
MAX (year),
MIN(year),
MAX (year)-MIN(year) AS span_of_years
FROM homegames;
