-- создание таблцы с атрибутами
--CREATE table employees(id int,name nvarchar(50),salary float,department nvarchar(50));

-- Вставка в пустую таблицу тестовых данных:
INSERT INTO employees(name,salary,department)
VALUES
('Иван Петров', 75000.00, 'IT'),
('Алексей Смирнов', 60000.00, 'Маркетинг'),
('Мария Иванова', 55000.00, 'HR'),
('Дмитрий Кузнецов', 80000.00, 'IT'),
('Анна Соколова', 48000.00, 'Финансы'),
('Сергей Васильев', 65000.00, 'IT'),
('Ольга Морозова', 52000.00, 'HR'),
('Александр Белов', 90000.00, 'Маркетинг'),
('Екатерина Козлова', 43000.00, 'Финансы'),
('Павел Новиков', 70000.00, 'IT');

-- Выведи все столбцы из таблицы employees.
SELECT * 
FROM employees

-- Выведи только имена (name) и зарплаты (salary) сотрудников.
SELECT name,salary 
FROM employees

-- Выведи сотрудников с зарплатой больше 50000.
SELECT * from employees
WHERE salary >50000

-- Отсортируй сотрудников по убыванию зарплаты.
SELECT * 
FROM employees 
ORDER BY salary DESC

-- Выведи топ-3 самых высокооплачиваемых сотрудников.
SELECT TOP 3 * 
FROM employees 
ORDER BY salary DESC
