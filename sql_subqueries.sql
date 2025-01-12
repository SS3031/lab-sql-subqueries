-- Challenge
-- Write SQL queries to perform the following tasks using the Sakila database:
use sakila;
-- Determine the number of copies of the film "Hunchback Impossible" that exist in the
-- inventory system.
SELECT COUNT(*) AS num_copies
FROM inventory
WHERE film_id = (
    SELECT film_id
    FROM film
    WHERE title = 'Hunchback Impossible'
);

-- List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT *
FROM film
WHERE length > (
    SELECT AVG(length)
    FROM film
);
-- Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_id = (
        SELECT film_id
        FROM film
        WHERE title = 'Alone Trip'
    )
);
SELECT a.actor_id, a.first_name, a.last_name, f.title AS film_title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Alone Trip';
