-- Напишите запросы, которые выводят следующую информацию:
-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)

select customer_id, company_name as customer
from customers where city='London'

select employee_id, CONCAT(first_name, ' ', last_name) as employee
from employees where city='London';

select customer_id, employee_id
from orders
where ship_via=(select shipper_id from shippers
where company_name='United Package')


-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях .Dairy Products и Condiments
-- Отсортировать результат по возрастанию количества оставшегося товара.
select product_name, units_in_stock, category_id
from products
where discontinued=0 and units_in_stock<25
and category_id in (select category_id
from categories where category_name in ('Dairy Products', 'Condiments'))

select contact_name, phone, supplier_id
from suppliers

select product_id, supplier_id
from products


-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
select company_name from customers
where customer_id not in (select customer_id from orders)


-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
select product_name
from products
where product_id in (select distinct product_id
from order_details
where quantity=10)
