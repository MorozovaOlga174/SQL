Morozova_Olga

-- 1. Вывести все поля и все строки из таблицы students    
	
SELECT *
FROM students

-- 2. Вывести список имен всех студентов из таблицы students    

SELECT name
FROM students

-- 3. Вывести поля name и email из таблицы students     

SELECT name, email
FROM students

-- 4. Вывести поля id, name, email и дату создания пользователей из таблицы students

SELECT id, name, email, created_on
FROM students

-- 5. Вывести всех пользователей из таблицы students которые были созданы 2022-05-15

SELECT *
FROM students
WHERE created_on = '2022-05-15'

-- 6. Вывести всех пользователей из таблицы students у которых в имени есть слово Иван  

SELECT *
FROM students 
WHERE name LIKE '%Иван%'

-- 7. Вывести всех пользователей из таблицы students которые были созданы 2022-07-12 
 и у которых в имени есть слово Andrey   

SELECT *
FROM students 
WHERE created_on = '2022-07-12' AND name LIKE '%Andrey%'
 
-- 8. Вывести пользователя из таблицы students у которого id равен 10     
	
SELECT id
FROM students
WHERE id = 10
 
-- 9. Вывести всех пользователей из таблицы students у которых id больше 40   
  
SELECT *
FROM students
WHERE id > 40

-- 10. Вывести всех пользователей из таблицы students у которых id меньше 25 или больше 65 
    
SELECT *
FROM students
WHERE id < 25 or id > 65

-- 11. Вывести всех пользователей из таблицы students у которых id равен 25, 130, 12345 
    
SELECT *
FROM students
WHERE id in ('25','130','12345')

-- 12. Вывести минимальный id из таблицы students   
   
SELECT min(id) 
FROM students

-- 13. Вывести максимальный id из таблицы students   
     
SELECT max(id)
FROM students

-- 14. Вывести из таблицы students среднюю стоимость оплаты за обучение

SELECT AVG (price)
FROM students

-- 15. Вывести количество пользователей внесенных в таблицу students 
   
SELECT COUNT(*)
FROM students

-- 16. Вывести из таблицы students список городов проживания студентов так,
 чтобы их наименования были уникальны (не повторялись)

SELECT DISTINCT city
FROM students

-- 17. Вывести из таблицы students количество уникальных стран проживания студентов

SELECT COUNT (DISTINCT country)
FROM students

-- 18. Вывести  из таблицы students уникальные сочетания города и страны проживания студентов
 
SELECT DISTINCT city, country
FROM students

-- 19. Вывести из таблицы students количество студентов зарегистрированных после 2022-05-15

SELECT COUNT(*)
FROM students 
WHERE created_on > '2022-05-15'

-- 20. Вывести из таблицы students список учащихся проживающих за пределами России

SELECT *
FROM students
WHERE country <> 'Russia'

-- 21. Вывести из таблицы students список учащихся проживающих за пределами России, США и Канады 

SELECT *
FROM students
WHERE country NOT IN ('Russia', 'USA', 'Canada')

-- 22. Вывести из таблицы students список учащихся, проживающих в городах 
Moscow, Saint Petersburg, Tver

SELECT *
FROM students
WHERE city = 'Moscow' OR city = 'Saint Petersburg' OR city = 'Tver';

SELECT *
FROM students
WHERE city IN ('Moscow','Saint Petersburg', 'Tver')


-- 23. Вывести из таблицы students список учащихся, зарегистрированных после 2022-05-15
 и проживающих в городах Moscow, Saint Petersburg
 
SELECT *
FROM students
WHERE created_on > '2022-05-15' AND (city = 'Moscow' OR city = 'Saint Petersburg')

-- 24. Вывести из таблицы students список учащихся, зарегистрированных в пероид 
 с 2022-05-15 по 2022-06-15 включительно

SELECT *
FROM students
WHERE created_on >= '2022-05-15' AND created_on <= '2022-06-15'

-- 25. Вывести из таблицы students количество учащихся,
 зарегистрированных в пероид с 2022-05-15 по 2022-06-15 включительно

SELECT COUNT(*)
FROM students
WHERE created_on BETWEEN '2022-05-15' AND '2022-06-15'

-- 26. Вывести из таблицы students список имен студентов по всем потокам в алфавитном порядке (по возрастанию).
 Студент одновременно может обучаться на нескольких потоках, поэтому нужен список именно уникальных значений.

SELECT DISTINCT name
FROM students
ORDER BY name ASC

-- 27. Вывести из таблицы students список имен студентов по всем потокам в алфавитном порядке (по возрастанию)
 и список городов, в обратном алфавитному порядку (по убыванию)

SELECT DISTINCT name, city
FROM students
ORDER BY name ASC, city DESC

-- 28. Вывести из таблицы students даты регистрации студентов из Канады с сортировкой по убыванию

SELECT created_on, country
FROM students
WHERE country = 'Canada'
ORDER BY created_on DESC

-- 29. Вывести из таблицы students количество всех учеников, прошедших более 40 уроков,
 сгруппировав результат по странам проживания и отсортировать по количеству. 
(Результат: сколько в каждой стране учеников, прошедших более 40 уроков, начиная с самого большого кол-ва учеников)

SELECT country, COUNT(*)
FROM students
WHERE past lessons > 40
GROUP BY country
ORDER BY COUNT(*) DESC

-- 30. Вывести из таблицы students  рассчетную сумму стоимости проведенных уроков,
 сгруппированных по категориям id (английский, французский и остальные прочие категории уроков),
 при этом сумма проведенных уроков более 5000 рублей и отсортирована по убыванию

SELECT category_id SUM(past lessons * lesson price)
FROM students
GROUP BY category_id
HAVING SUM(past lessons * lesson price) > 5000
ORDER BY SUM(past lessons * lesson price) DESC

-- 31. Вывести все страны из таблиц students и teachers. Объединение.

SELECT country
FROM students
UNION
SELECT country
FROM teachers

-- 32. Вывести список стран из таблиц students и teachers в которых одновременно присутствуют
 и ученики и учителя. Пересечение.

SELECT country
FROM students
INTERSECT
SELECT country
FROM teachers

-- 33. Вывести из таблиц students и teachers список стран, в которых проживают студенты,
 но в которых не проживают учителя. Исключение.

SELECT country
FROM student
EXCEPT
SELECT country
FROM teachers
