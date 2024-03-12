/*
create table author(
	author_id serial primary key,
	author_name varchar(100) not null,
	nick_name varchar(50),
	birthday date not null,
	create_date timestamp default now()	
);
*/
/*
insert into author(author_name, nick_name, birthday) 
values ('Джеральд Бром', 'Бром', to_date('9 march 1965','DD Month YYYY')),
('Тина Раффаэле','Кристина Генри', to_date('13 august 1974','DD Month YYYY')),
('Маргарет Астрид', 'Робин Хобб', to_date('5 march 1952','DD Month YYYY'));
*/
--alter table author add column born_place varchar(50);
/*
update author set born_place = 'America' where author_id=1;
update author set born_place = 'America' where author_id=2;
update author set born_place = 'America' where author_id=3;
*/



/*
create table book(
	book_id serial primary key,
	book_title varchar(70),
	book_year int2 not null check(book_year >=0 and book_year <= 2100),
	author_id integer references author(author_id),
	create_date timestamp default now()	
);
*/
/*
insert into book (book_title, book_year)
values('Вырывашка', '2018'),
('Ученик убийцы', '1996');
*/
/*
update book set author_id = '1' where book_year=2018;
update book set author_id = '3' where book_year=1996;
*/

delete from  author where id = 1


--select * from author;
--select * from book;
