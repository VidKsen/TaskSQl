--=============== МОДУЛЬ 5. РАБОТА С POSTGRESQL =======================================
--= ПОМНИТЕ, ЧТО НЕОБХОДИМО УСТАНОВИТЬ ВЕРНОЕ СОЕДИНЕНИЕ И ВЫБРАТЬ СХЕМУ PUBLIC===========
SET search_path TO public;

--======== ОСНОВНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--Сделайте запрос к таблице payment и с помощью оконных функций добавьте вычисляемые колонки согласно условиям:
--Пронумеруйте все платежи от 1 до N по дате платежа
--Пронумеруйте платежи для каждого покупателя, сортировка платежей должна быть по дате платежа
--Посчитайте нарастающим итогом сумму всех платежей для каждого покупателя, сортировка должна 
--быть сперва по дате платежа, а затем по размеру платежа от наименьшей к большей
--Пронумеруйте платежи для каждого покупателя по размеру платежа от наибольшего к
--меньшему так, чтобы платежи с одинаковым значением имели одинаковое значение номера.
--Можно составить на каждый пункт отдельный SQL-запрос, а можно объединить все колонки в одном запросе.


SELECT payment_id, customer_id, payment_date, amount,
    ROW_NUMBER() OVER(ORDER BY payment_date) AS payment_sequence_number, -- Пронумеровать все платежи по дате
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY payment_date) AS customer_payment_sequence, -- Пронумеровать платежи для каждого покупателя по дате
    SUM(amount) OVER(PARTITION BY customer_id ORDER BY payment_date, amount ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_payment_amount, -- Нарастающий итог для каждого покупателя
    DENSE_RANK() OVER(PARTITION BY customer_id ORDER BY amount DESC) AS payment_rank_by_amount -- Пронумеровать платежи по размеру от большего к меньшему с одинаковым номером для одинаковых сумм
FROM payment ORDER BY customer_id, payment_date;


--ЗАДАНИЕ №2
--С помощью оконной функции выведите для каждого покупателя стоимость платежа и стоимость 
--платежа из предыдущей строки со значением по умолчанию 0.0 с сортировкой по дате платежа.


SELECT customer_id, payment_date, amount,
    COALESCE(LAG(amount) OVER(PARTITION BY customer_id ORDER BY payment_date), 0.0) AS previous_payment_amount
FROM payment ORDER BY customer_id, payment_date;



--ЗАДАНИЕ №3
--С помощью оконной функции определите, на сколько каждый следующий платеж покупателя больше или меньше текущего.


SELECT customer_id, payment_date, amount,
    COALESCE(LEAD(amount) OVER(PARTITION BY customer_id ORDER BY payment_date) - amount, 0) AS difference_to_next_payment
FROM payment ORDER BY customer_id, payment_date;


--ЗАДАНИЕ №4
--С помощью оконной функции для каждого покупателя выведите данные о его последней оплате аренды.


SELECT DISTINCT customer_id,
    FIRST_VALUE(payment_date) OVER(PARTITION BY customer_id ORDER BY payment_date DESC) AS last_payment_date,
    FIRST_VALUE(amount) OVER(PARTITION BY customer_id ORDER BY payment_date DESC) AS last_payment_amount
FROM payment ORDER BY customer_id;



--======== ДОПОЛНИТЕЛЬНАЯ ЧАСТЬ ==============

--ЗАДАНИЕ №1
--С помощью оконной функции выведите для каждого сотрудника сумму продаж за август 2005 года 
--с нарастающим итогом по каждому сотруднику и по каждой дате продажи (без учёта времени) 
--с сортировкой по дате.

--ЗАДАНИЕ №2
--20 августа 2005 года в магазинах проходила акция: покупатель каждого сотого платежа получал
--дополнительную скидку на следующую аренду. С помощью оконной функции выведите всех покупателей,
--которые в день проведения акции получили скидку

--ЗАДАНИЕ №3
--Для каждой страны определите и выведите одним SQL-запросом покупателей, которые попадают под условия:
-- 1. покупатель, арендовавший наибольшее количество фильмов
-- 2. покупатель, арендовавший фильмов на самую большую сумму
-- 3. покупатель, который последним арендовал фильм






