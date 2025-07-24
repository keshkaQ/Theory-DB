-- 1) Напишите функционал по добавлению пользователя
INSERT INTO users(login, password, first_name, last_name, patronymic, email, phone)
VALUES('banar', 'keshka89', 'Кирилл', 'Банарь', 'Юрьевич', 'kirillbanar@gmail.com', '+79503452122');
-- Проверяем добавился ли пользователь 
SELECT * FROM users
WHERE login = 'banar'

-- 2) Напишите функционал по добавлению продукта и присваиванию для него категории
INSERT INTO products (name,description,price,quantity)
VALUES('Клавиатура', 'Игровая клавиатура беспроводная','2999.99',20);
-- Клавиатуре присвоился product_id = 27, у электроники id равен 1, поэтому добавляем в таблицу ProductCategories 
-- запись со значениями (product_id = 27,category_id = 1)
INSERT INTO product_categories (product_id, category_id)
VALUES (27,1);

-- Проверяем категорию у клавиатуры
SELECT c.name FROM products as p
JOIN product_categories  as pc on p.product_id = pc.product_id
JOIN categories as c on c.category_id = pc.category_id
where p.name = 'Клавиатура'


-- 3) Получения продуктов по категории
SELECT DISTINCT p.name, p.price FROM products as p
JOIN product_categories as pc ON p.product_id = pc.product_id
JOIN categories as c on c.category_id = pc.category_id
where c.name = 'Электроника'

-- 4) Поиск продукта по названию
SELECT * FROM products as p
JOIN product_categories as pc ON p.product_id = pc.product_id
JOIN categories as c on c.category_id = pc.category_id
WHERE p.name = 'Ноутбук Pro'

-- 5) Получить самые популярные товары TOP (10)
SELECT TOP 10 p.name, SUM(oi.quantity) as total_ordered
FROM products p
JOIN orderItems oi ON p.product_id = oi.product_id
GROUP BY p.name
ORDER BY total_ordered DESC;

-- 6) Представление для информации о пользователях (без паролей)
CREATE VIEW ViewUsers as
SELECT user_id,
CASE WHEN patronymic is NULL then first_name + ' ' + last_name
ELSE first_name + ' ' + last_name + ' ' + patronymic 
END as full_name, 
email, phone,registration_date
FROM Users
-- Вывод данных из представления
SELECT * FROM ViewUsers

-- 7) Получить кол-во продуктов (группировка по категориям) купленных для двух категорий 
-- Группировка по всем категориям и количество купленных товаров
SELECT c.name, SUM(oi.quantity) as total_purchased
FROM categories c
JOIN product_categories pc ON c.category_id = pc.category_id
JOIN orderItems oi ON pc.product_id = oi.product_id
GROUP BY c.name
-- группировка по электронике и бытовой технике
SELECT c.name, SUM(oi.quantity) as total_purchased
FROM categories c
JOIN product_categories pc ON c.category_id = pc.category_id
JOIN orderItems oi ON pc.product_id = oi.product_id
WHERE c.name in ('Электроника', 'Бытовая техника')
GROUP BY c.name
