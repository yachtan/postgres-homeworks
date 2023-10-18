-- SQL-команды для создания таблиц
create table employees
(
	employee_id int primary key,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	title varchar(50) not null,
	birth_date varchar(10) not null,
	notes text not null
);

create table customers
(
	customer_id varchar(5) primary key,
	company_name varchar(50) not null,
	contract_name varchar(50) not null
);

create table orders
(
	order_id int primary key,
	customer_id varchar(5) references customers(customer_id),
	employee_id int references employees(employee_id),
	order_date varchar(10) not null,
	ship_city varchar(30) not null
);