/*
Предзаписанные лекции к занятию 1.3 «Основы SQL.
Присоединенеие таблиц. Практика. Задание 1
*/
select film.title, language.name from film join language on film.language_id = language.language_id;


/*
Часть 1. Присоединенеие таблиц. Практика. Задание 2
*/
select actor.actor_id, actor.first_name, actor.last_name, actor.last_update from actor left join film_actor on actor.actor_id=film_actor.actor_id 
left join film on film_actor.film_id=film.film_id
where film.film_id=508;


/*
Часть 2. Агрегатные функции. Практика. Задание 1
*/
select count(film_actor.actor_id) as count_actor from film_actor
left join film on film_actor.film_id=film.film_id
where film.film_id=384


/*
Часть 3. Группировка данных. Практика. Задание 1
*/
select film.title, count(film_actor.actor_id) as count_actor
from film
inner join film_actor on film_actor.film_id=film.film_id 
group by film.film_id, 
having count(film_actor.actor_id)>10



/*
Часть 5. Оператор case. Задание 1

select customer_id, sum(amount),
	CASE
		WHEN SUM(amount) > 200 THEN 'Good user',
		WHEN SUM(amount) < 200 THEN 'Bad user'
		ELSE 'Avarage user'
	END
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;
*/