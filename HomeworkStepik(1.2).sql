/*CREATE TABLE IF NOT EXISTS `billing_simple`.`billing` (
  `payer_email` VARCHAR(255) NULL,
  `recipient_email` VARCHAR(255) NULL,
  `sum` DECIMAL(18,2) NULL,
  `currency` VARCHAR(3) NULL,
  `billing_date` DATE NULL,
  `comment` TEXT NULL)
ENGINE = InnoDB;
*/

-- 1) Выведите поступления денег от пользователя с email 'vasya@mail.com'.

SELECT *
FROM billing
where payer_email = 'vasya@mail.com'

-- 2) Добавьте в таблицу одну запись о платеже со следующими значениями:
-- email плательщика: 'pasha@mail.com'
-- email получателя: 'katya@mail.com'
-- сумма: 300.00
-- валюта: 'EUR'
-- дата операции: 14.02.2016
-- комментарий: 'Valentines day present)'

INSERT INTO billing
VALUES ('pasha@mail.com', 'katya@mail.com', 300.00, 'EUR', '2016-02-14','Valentines day present)')


-- 3) Измените адрес плательщика на 'igor@mail.com' для всех записей таблицы, где адрес плательщика 'alex@mail.com'.

UPDATE billing
SET payer_email = 'igor@mail.com'
WHERE payer_email = 'alex@mail.com'


-- 4) Удалите из таблицы записи, где адрес плательщика или адрес получателя установлен в неопределенное значение или пустую строку.

DELETE FROM billing
WHERE (payer_email is NULL or payer_email = '') or (recipient_email is NULL or recipient_email = '')