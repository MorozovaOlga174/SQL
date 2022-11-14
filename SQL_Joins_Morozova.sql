Morozova_Olga

-- 1. Вывести из таблиц suppliers и products список продуктов, поставляемых соответствующими компаниями, 
количество продуктов находящихся на складе и отсортировать остатки товара по убыванию

SELECT product_name, compani_name, units_in_stock
FROM products
INNER JOIN suppliers ON products.supplier_id = suppliers.supplier_id
ORDER BY units_in_stock DESC

-- 2. Вывести из таблиц products и categories количество едениц товаров находящихся на складе по категориям товаров,
 указав наименование категории, отсортировав сумму товаров по убыванию и из всего списка вывести только 5 позиций

SELECT category_name, SUM(units_in_stock)
FROM products
INNER JOIN categaries ON products.category_id = categories.category_id
GROUP BY category_name
ORDER BY SUM(units_in_stock) DESC
LIMIT 5

-- 3.Вывести из таблиц orders и employees список заказов, их покупателей и закрепленных за этими заказами 
менеджеров(имя и фамилия сотрудников)

SELECT order_id, customer_id, first_name, iast_name
FROM orders
INNER JOIN employees ON orders.employee_id = employees.emploee_id

-- 4. Из таблиц orders, orders_details и products вывести дату, когда был сделан заказ, какой товар был заказан,
 в какую страну этот заказ нужно доставить, цену товара, количество товара и скидку.

SELECT order_date, product_name, country, unit_price, quantity, discount
FROM orders
INNER JOIN order_details ON orders.order_id = order_details.order_id
INNER JOIN products ON order_details.product_id = products.product_id

SELECT order_date, product_name, country, unit_price, quantity, discount
FROM orders
INNER JOIN order_details USING(order_id)
INNER JOIN products USING(product_id)

-- 5. Из таблиц products и categories сгруппировать товар по категориям, посчитать сумму в денежном эквиваленте
 на которую продается товаров в каждой категории, исключить товары которых нет в продаже
 и отфильтровать (удалить) те категории, в которых товары продаются меньше чем на 5 000 рублей, 
 отсортировать по убыванию суммы

SELECT category_name, SUM(unit_price * units_in_stock)
FROM products
INNER JOIN categories ON products.category_id = categories.category_id
WHERE discontinued <> 1
GROUP BY category_name
HAVING SUM(unit_price * units_in_stock) > 5000
ORDER BY SUM(unit_price * units_in_stock) DESC

-- 6. Из таблиц customers и orders вывести список компаний, которые не заказывали товар

SELECT company_name, order_id
FROM customers
LEFT JOIN orders ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL

SELECT company_name, order_id
FROM orders
RIGHT JOIN customers ON orders.customer_id = customers.customer_id
WHERE order_id IS NULL

-- 7. Из таблиц employees и orders вывести список работников, которые не обрабатывают никакие заказы
 (убедиться, что все работники задействованы)

SELECT last_name, order_id
FROM employees
LEFT JOIN orders ON orders.emploee_id = emploees.emploee_id
WHERE order_id IS NULL

