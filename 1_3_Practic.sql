/*

create table table_one (
	name_one varchar(255) not null
);

create table table_two (
	name_two varchar(255) not null
);

insert into table_one (name_one)
values ('one'), ('two'), ('three'), ('four'), ('five');

insert into table_two (name_two)
values ('four'), ('five'), ('six'), ('seven'), ('eight');

*/

--INNER JOIN
select table_one.name_one, table_two.name_two
from table_one
inner join table_two on table_one.name_one = table_two.name_two;


--LEFT JOIN

select t1.name_one, t2.name_two
from table_one t1 
left join table_two t2 on t1.name_one = t2.name_two;

--RIGHT JOIN
select t1.name_one, t2.name_two
from table_one t1 
right join table_two t2 on t1.name_one = t2.name_two;

--FULL JOIN
select t1.name_one, t2.name_two
from table_one t1 
full join table_two t2 on t1.name_one = t2.name_two;

--CROSS JOIN
select t1.name_one, t2.name_two
from table_one t1 
cross join table_two t2;

--EXCEPT и EXCEPT ALL
select *
from (
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 2 as y) t
except all --distinct
select 1 as x, 1 as y;

select *
from (
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 2 as y) t
except all -- not distinct
select 1 as x, 1 as y;

--INTERSECT и INTERSECT ALL
select *
from (
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 2 as y) t
intersect --distinct
select *
from (
		select 1 as x, 1 as y
		union all
		select 1 as x, 1 as y
	);

select *
from (
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 1 as y
	union all
	select 1 as x, 2 as y) t
intersect all -- not distinct
select *
from (
		select 1 as x, 1 as y
		union all
		select 1 as x, 1 as y
	);

--CASE 
select payment_id, amount,
	case
		when amount < 5 then 'малый платеж'
		when amount between 5 and 10 then 'средний платеж'
		else 'большой платеж'
	end
from payment;

--CASE с выводом осного и промежуточного столбца
select *
from (
	select amount,
		case
			when amount < 5 then 'малый платеж'
			when amount between 5 and 10 then 'средний платеж'
			else 'большой платеж'
		end alias_for_case
	from payment
	);
	
--CASE с агрегатной функцией
	select ca, count(*)
from (
	select payment_id, amount,
		case
			when amount < 5 then 'малый платеж'
			when amount between 5 and 10 then 'средний платеж'
			else 'большой платеж'
		end ca
	from payment) t
group by ca