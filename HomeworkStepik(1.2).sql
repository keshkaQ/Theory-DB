/*CREATE TABLE IF NOT EXISTS `billing_simple`.`billing` (
  `payer_email` VARCHAR(255) NULL,
  `recipient_email` VARCHAR(255) NULL,
  `sum` DECIMAL(18,2) NULL,
  `currency` VARCHAR(3) NULL,
  `billing_date` DATE NULL,
  `comment` TEXT NULL)
ENGINE = InnoDB;
*/

-- 1) �������� ����������� ����� �� ������������ � email 'vasya@mail.com'.

SELECT *
FROM billing
where payer_email = 'vasya@mail.com'

-- 2) �������� � ������� ���� ������ � ������� �� ���������� ����������:
-- email �����������: 'pasha@mail.com'
-- email ����������: 'katya@mail.com'
-- �����: 300.00
-- ������: 'EUR'
-- ���� ��������: 14.02.2016
-- �����������: 'Valentines day present)'

INSERT INTO billing
VALUES ('pasha@mail.com', 'katya@mail.com', 300.00, 'EUR', '2016-02-14','Valentines day present)')


-- 3) �������� ����� ����������� �� 'igor@mail.com' ��� ���� ������� �������, ��� ����� ����������� 'alex@mail.com'.

UPDATE billing
SET payer_email = 'igor@mail.com'
WHERE payer_email = 'alex@mail.com'


-- 4) ������� �� ������� ������, ��� ����� ����������� ��� ����� ���������� ���������� � �������������� �������� ��� ������ ������.

DELETE FROM billing
WHERE (payer_email is NULL or payer_email = '') or (recipient_email is NULL or recipient_email = '')