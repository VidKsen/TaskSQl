/*Какая таблица в учебной базе данных dvd-rental имеет больше всего записей?
Узнать это можно, выполнив запрос. Проверка 4-ёх таблиц*/

/*Первая таблица с названием "rental" будет находиться в стобце "table_name".
Count посчитает количество строк в этой таблице и выdедет в новый столбец "record_count"*/
/*UNION - это оператор SQL для объединения результирующего набора данных нескольких запросов. Данный оператор выводит только уникальные строки в запросах*/
/*UNION ALL - то оператор SQL для объединения результирующего набора данных нескольких запросов, а вот данный оператор, выведет уже абсолютно все строки, даже дубли.*/
SELECT 'rental' AS table_name, COUNT(*) AS record_count FROM rental 
UNION ALL
SELECT 'payment', COUNT(*) FROM payment /*Добавляет в вывод название таблицы "payment" в "table_name" и количество строк в этой таблице в новый столбец "record_count"*/
UNION ALL
SELECT 'film', COUNT(*) FROM film /*Добавляет в вывод название таблицы "film" в "table_name" и количество строк в этой таблице в новый столбец "record_count"*/
union all
SELECT 'customer', COUNT(*) FROM customer; /*Добавляет в вывод название таблицы "customer" в "table_name" и количество строк в этой таблице в новый столбец "record_count"*/

