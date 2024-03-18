
/*
Выведите таблицу с тремя полями: название
фильма, имя актера и количество фильмов,
в которых он снимался

select f.title, a.first_name, count(f.film_id) over(partition by a.actor_id)
from film f join film_actor fa on f.film_id = fa.film_id join actor a on fa.actor_id=a.actor_id;
*/


/*
При помощи CTE выведите таблицу со следующим
содержанием: фамилия, имя сотрудника (staff)
и количество прокатов DVD (rental),
которые он реализовал
*/
with cte as (
	select s.last_name, s.first_name, count(r.rental_id)
	from staff s join rental r using(staff_id)
	group by s.staff_id
)
select * from cte

