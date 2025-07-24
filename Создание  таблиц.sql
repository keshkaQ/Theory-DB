-- Создание таблицы пользователей
CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    login NVARCHAR(50) UNIQUE NOT NULL,
    password NVARCHAR(100) NOT NULL CHECK (LEN(password) BETWEEN 8 AND 100),
    first_name NVARCHAR(100) NOT NULL,
    last_name NVARCHAR(100) NOT NULL,
    patronymic NVARCHAR(100),
    email NVARCHAR(255) UNIQUE NOT NULL 
        CHECK (email LIKE '%_@%_.%'
        AND PATINDEX('%[^a-zA-Z0-9._%@-]%', email) = 0
        AND email NOT LIKE '@%'  
        AND email NOT LIKE '%@%@%'   
        AND email NOT LIKE '%.@%'     
        AND email NOT LIKE '%..%'  
        AND email LIKE '%@%.__%'
        AND LEN(email) >= 5 ), 
    phone NVARCHAR(20) NOT NULL
        CHECK ((phone LIKE '+7%' AND LEN(phone) = 12 
        AND PATINDEX('%[^0-9]%', phone) = 0)
        OR (phone LIKE '8%' AND LEN(phone) = 11 
        AND PATINDEX('%[^0-9]%', phone) = 0)),
    registration_date DATETIME NOT NULL DEFAULT GETDATE(),
);

-- Создание таблицы категорий
CREATE TABLE categories (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(200) NOT NULL UNIQUE,
    description NVARCHAR(1000) NOT NULL,
);

-- Создание таблицы продуктов
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(200) NOT NULL UNIQUE,
    description NVARCHAR(1000) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    quantity INT NOT NULL DEFAULT 0 CHECK (quantity >= 0),
    date_added DATETIME NOT NULL DEFAULT GETDATE()
);

-- Создание таблицы связей товаров и категорий
CREATE TABLE product_categories (
    product_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (product_id, category_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE CASCADE
);

-- Создание таблицы заказов
CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    date_created DATETIME NOT NULL DEFAULT GETDATE(),
    total_price DECIMAL(10,2) NOT NULL CHECK(total_price > 0),
    order_status NVARCHAR(50) NOT NULL 
        CHECK(order_status IN ('Ожидает оплаты', 'В обработке', 'Доставлен')),
    delivery_address NVARCHAR(500) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Создание таблицы элементов заказа
CREATE TABLE orderItems (
    order_item_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Создание таблицы истории заказов
CREATE TABLE orderHistory (
    history_id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT NOT NULL,
    previous_status NVARCHAR(50) NULL,
    new_status NVARCHAR(50) NOT NULL,
    change_date DATETIME NOT NULL DEFAULT GETDATE(),
    comment NVARCHAR(300) NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CHECK (new_status IN ('Ожидает оплаты', 'В обработке', 'Доставлен')),
    CHECK (previous_status IN ('Ожидает оплаты', 'В обработке', 'Доставлен') OR previous_status IS NULL)
);

