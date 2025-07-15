-- Суммарная выручка по каждой категории товаров
SELECT category, SUM(price) as total_revenue FROM SALES
GROUP BY category

-- Средний чек по каждой категории
SELECT category, AVG(price) as avg_sale FROM SALES
GROUP BY category

-- Категории товаров, у которых общая выручка превышает 100 000
SELECT category, SUM(price) as total_revenue FROM SALES
GROUP BY category
HAVING SUM(price) > 100000

-- Даты, в которые было продано больше 5 товаров
SELECT sale_date FROM sales
GROUP BY sale_date
HAVING SUM(quantity) > 5