-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
create table student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
)

-- 2. Добавить в таблицу student колонку middle_name varchar
alter table student add column middle_name varchar

-- 3. Удалить колонку middle_name
alter table student drop column middle_name

-- 4. Переименовать колонку birthday в birth_date
alter table student rename birthday to birth_date

-- 5. Изменить тип данных колонки phone на varchar(32)
alter table student alter column phone set data type varchar(32)

-- 6. Вставить три любых записи с автогенерацией идентификатора
insert into student (first_name, last_name, birth_date, phone)
values ('Anna', 'Petrova', '01.10.1988', '8-911-123-45-68'),
('Ivan', 'Petrov', '05.11.1998', '8-955-123-00-68'),
('Tamara', 'Sirotkina', '15.03.2000', '8-923-123-00-77')

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
truncate table student restart identity
