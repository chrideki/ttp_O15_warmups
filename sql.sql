--Which are the 10 longest R rated movies?
SELECT *
FROM film 
WHERE rating = 'R'
ORDER BY length DESC
LIMIT 10;

-- What are the NEXT 10 longest R rated movies?
-- hint: google "how to get next 10 records in sql"
SELECT *
FROM film 
WHERE rating = 'R'
ORDER BY length DESC
OFFSET 10 ROWS
LIMIT 10;

--How many films are as long as the longest film?
-- RETURN an exact number
SELECT COUNT(*)
FROM film 
WHERE length = (SELECT MAX(length)
                FROM film);

--Which are the 10 longest R rated movies, SORTED IN ALPHABETICAL ORDER?
-- hint: might need a subquery
WITH top_10_R AS( 
    SELECT *
    FROM film 
    WHERE rating = 'R'
    ORDER BY length DESC
    LIMIT 10
) SELECT *
    FROM top_10_R
    ORDER BY title;


--Which are the 10 kids films with the longest description?
-- G, PG, PG-13
--hint: google "SQL count length of string"
WITH kid_movie AS(
    SELECT *
    FROM film 
    WHERE rating = 'G' OR rating = 'PG' OR rating = 'PG-13'
) SELECT title, length(description) AS description_length
    FROM kid_movie
    ORDER BY description_length DESC
    LIMIT 10;


-- How many unique release_years are there in the dvd rental database?
-- Return an exact number
SELECT COUNT(DISTINCT release_year)
FROM film;