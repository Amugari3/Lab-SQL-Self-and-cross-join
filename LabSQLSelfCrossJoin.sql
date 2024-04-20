-- Get all pairs of actors that worked together.
SELECT DISTINCT 
    a1.actor_id AS actor1_id,
    a1.first_name AS actor1_first_name,
    a1.last_name AS actor1_last_name,
    a2.actor_id AS actor2_id,
    a2.first_name AS actor2_first_name,
    a2.last_name AS actor2_last_name,
    f1.title AS Película
FROM 
    sakila.actor a1
JOIN 
    sakila.film_actor fa1 ON a1.actor_id = fa1.actor_id
JOIN 
    sakila.film f1 ON fa1.film_id = f1.film_id
JOIN 
    sakila.film_actor fa2 ON f1.film_id = fa2.film_id
JOIN 
    sakila.actor a2 ON fa2.actor_id = a2.actor_id
WHERE 
    a1.actor_id < a2.actor_id
ORDER BY 
    a1.actor_id, a2.actor_id;
    
-- Get all pairs of customers that have rented the same film more than 3 times.
SELECT DISTINCT
    c1.customer_id AS customer1_id,
    c1.first_name AS customer1_first_name,
    c1.last_name AS customer1_last_name,
    c2.customer_id AS customer2_id,
    c2.first_name AS customer2_first_name,
    c2.last_name AS customer2_last_name,
    i.film_id
FROM
    sakila.rental r1
JOIN
    sakila.rental r2 ON r1.inventory_id = r2.inventory_id AND r1.customer_id < r2.customer_id
JOIN
    sakila.customer c1 ON r1.customer_id = c1.customer_id
JOIN
    sakila.customer c2 ON r2.customer_id = c2.customer_id
JOIN
    sakila.inventory i ON r1.inventory_id = i.inventory_id
GROUP BY
    c1.customer_id, c2.customer_id, i.film_id
HAVING
    COUNT(*) > 1
ORDER BY
    c1.customer_id, c2.customer_id, i.film_id;
    
-- Get all possible pairs of actors and films.
SELECT 
  a.actor_id, 
  a.first_name, 
  a.last_name, 
  f.film_id, 
  f.title
FROM 
  sakila.actor a
CROSS JOIN 
  sakila.film f;
