--=============== МОДУЛЬ 3. ОСНОВЫ SQL =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Выведите для каждого покупателя его адрес проживания, 
--город и страну проживания.

select c.customer_id, c.first_name, c.last_name, ad.address, ci.city, co.country
from customer c left join address ad on c.address_id = ad.address_id
left join city ci on ad.city_id = ci.city_id 
left join country co on ci.country_id = co.country_id;
/*select c.customer_id, c.first_name, c.last_name, ad.address, ci.city, co.country
from customer c left join address ad using(address_id)
left join city ci using(city_id) 
left join country co using(country_id);*/



--ЗАДАНИЕ №2
--С помощью SQL-запроса посчитайте для каждого магазина количество его покупателей.

select s.store_id, count(c.customer_id)
from store s join customer c on s.store_id = c.store_id
group by s.store_id;



--Доработайте запрос и выведите только те магазины, 
--у которых количество покупателей больше 300-от.
--Для решения используйте фильтрацию по сгруппированным строкам 
--с использованием функции агрегации.

select s.store_id, count(c.customer_id)
from store s join customer c on s.store_id = c.store_id
group by s.store_id
having count(c.customer_id)> 300;



-- Доработайте запрос, добавив в него информацию о городе магазина, 
--а также фамилию и имя продавца, который работает в этом магазине.

select sto.store_id, count(c.customer_id), ci.city, sta.last_name, sta.first_name
from store sto join customer c on sto.store_id = c.store_id
join address ad on sto.address_id=ad.address_id
join city ci on ad.city_id=ci.city_id
join staff sta on sto.manager_staff_id=sta.staff_id
group by 1, ci.city_id, sta.staff_id
having count(c.customer_id)> 300;



--ЗАДАНИЕ №3
--Выведите ТОП-5 покупателей, 
--которые взяли в аренду за всё время наибольшее количество фильмов

select cu.customer_id, count(fi.film_id)
from customer cu join rental к using(customer_id)
join inventory inv using(inventory_id)
join film fi using(film_id)
group by cu.customer_id
order by count(fi.film_id) desc
limit 5;



--ЗАДАНИЕ №4
--Посчитайте для каждого покупателя 4 аналитических показателя:
--  1. количество фильмов, которые он взял в аренду
--  2. общую стоимость платежей за аренду всех фильмов (значение округлите до целого числа)
--  3. минимальное значение платежа за аренду фильма
--  4. максимальное значение платежа за аренду фильма

select cus.customer_id, count(f.film_id), sum(pa.amount), min(pa.amount), max(pa.amount)
from customer cus join rental r using(customer_id)
join inventory inv using(inventory_id)
join film f using(film_id)
join payment pa using(rental_id)
group by cus.customer_id --, f.film_id, pa.payment_id
order by cus.customer_id;



--ЗАДАНИЕ №5
--Используя данные из таблицы городов, составьте все возможные пары городов так, чтобы 
--в результате не было пар с одинаковыми названиями городов. Решение должно быть через Декартово произведение.

select distinct c1.city, c2.city
from city c1, city c2
where c1.city != c2.city;



--ЗАДАНИЕ №6
--Используя данные из таблицы rental о дате выдачи фильма в аренду (поле rental_date) и 
--дате возврата (поле return_date), вычислите для каждого покупателя среднее количество 
--дней, за которые он возвращает фильмы. В результате должны быть дробные значения, а не интервал.
 
select cu.customer_id, AVG(EXTRACT(epoch FROM (r.return_date - r.rental_date)) / 86400) 
from customer cu join rental r on cu.customer_id = r.customer_id
group by cu.customer_id order by cu.customer_id;



--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Посчитайте для каждого фильма сколько раз его брали в аренду и значение общей стоимости аренды фильма за всё время.





--ЗАДАНИЕ №2
--Доработайте запрос из предыдущего задания и выведите с помощью него фильмы, которые отсутствуют на dvd дисках.





--ЗАДАНИЕ №3
--Посчитайте количество продаж, выполненных каждым продавцом. Добавьте вычисляемую колонку "Премия".
--Если количество продаж превышает 7300, то значение в колонке будет "Да", иначе должно быть значение "Нет".







