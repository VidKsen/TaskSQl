/*
-- Создайте view с колонками клиент (ФИО; email) и title фильма, который он брал в прокат последним

CREATE VIEW practice_1 AS
WITH cte AS (
SELECT r.*, ROW_NUMBER() OVER (PARTITION BY r.customer_id
ORDER BY r.rental_date DESC)
FROM rental r
)
SELECT c.last_name, c.email, f.title
FROM cte
JOIN customer c ON c.customer_id = cte.customer_id
JOIN inventory i ON i.inventory_id = cte.inventory_id
JOIN film f ON f.film_id = i.film_id
WHERE row_number = 1

*/

/*
DROP VIEW practice_1;
*/