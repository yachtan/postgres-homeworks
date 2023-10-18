"""Скрипт для заполнения данными таблиц в БД Postgres."""
import psycopg2
import csv

file_name_emp = 'north_data/employees_data.csv'
file_name_cus = 'north_data/customers_data.csv'
file_name_ord = 'north_data/orders_data.csv'

conn = psycopg2.connect(host='localhost', database='north', user='postgres', password='2112')
try:
    with conn:
        with conn.cursor() as cur:
            with open(file_name_emp) as file_emp:
                DictReader_emp = csv.DictReader(file_emp)
                for i in DictReader_emp:
                    emp = (i["employee_id"], i["first_name"], i["last_name"], i["title"], i["birth_date"], i["notes"])
                    cur.execute('INSERT INTO employees VALUES (%s, %s, %s, %s, %s, %s)', emp)

            with open(file_name_cus) as file_cus:
                DictReader_cus = csv.DictReader(file_cus)
                for i in DictReader_cus:
                    cus = (i["customer_id"], i["company_name"], i["contact_name"])
                    cur.execute('INSERT INTO customers VALUES (%s, %s, %s)', cus)

            with open(file_name_ord) as file_ord:
                DictReader_ord = csv.DictReader(file_ord)
                for i in DictReader_ord:
                    ord = (i["order_id"], i["customer_id"], i["employee_id"], i["order_date"], i["ship_city"])
                    cur.execute('INSERT INTO orders VALUES (%s, %s, %s, %s, %s)', ord)

finally:
    conn.close()
