-- ��������� ������� �� ������ ��������� �������
SELECT category, SUM(price) as total_revenue FROM SALES
GROUP BY category

-- ������� ��� �� ������ ���������
SELECT category, AVG(price) as avg_sale FROM SALES
GROUP BY category

-- ��������� �������, � ������� ����� ������� ��������� 100 000
SELECT category, SUM(price) as total_revenue FROM SALES
GROUP BY category
HAVING SUM(price) > 100000

-- ����, � ������� ���� ������� ������ 5 �������
SELECT sale_date FROM sales
GROUP BY sale_date
HAVING SUM(quantity) > 5