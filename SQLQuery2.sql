-- �������� ������ � ����������
--CREATE table employees(id int,name nvarchar(50),salary float,department nvarchar(50));

-- ������� � ������ ������� �������� ������:
INSERT INTO employees(name,salary,department)
VALUES
('���� ������', 75000.00, 'IT'),
('������� �������', 60000.00, '���������'),
('����� �������', 55000.00, 'HR'),
('������� ��������', 80000.00, 'IT'),
('���� ��������', 48000.00, '�������'),
('������ ��������', 65000.00, 'IT'),
('����� ��������', 52000.00, 'HR'),
('��������� �����', 90000.00, '���������'),
('��������� �������', 43000.00, '�������'),
('����� �������', 70000.00, 'IT');

-- ������ ��� ������� �� ������� employees.
SELECT * 
FROM employees

-- ������ ������ ����� (name) � �������� (salary) �����������.
SELECT name,salary 
FROM employees

-- ������ ����������� � ��������� ������ 50000.
SELECT * from employees
WHERE salary >50000

-- ���������� ����������� �� �������� ��������.
SELECT * 
FROM employees 
ORDER BY salary DESC

-- ������ ���-3 ����� ������������������ �����������.
SELECT TOP 3 * 
FROM employees 
ORDER BY salary DESC
