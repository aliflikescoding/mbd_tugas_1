-- USERS (100)
INSERT INTO users (name, email, password)
SELECT 
    'User ' || i,
    'user' || i || '@gmail.com',
    'password123'
FROM generate_series(1,100) AS s(i);


-- CATEGORIES (5)
INSERT INTO categories (name)
VALUES 
('Electronics'),
('Fashion'),
('Books'),
('Food'),
('Accessories');


-- PRODUCTS (100)
INSERT INTO products (name, price, stock, category_id)
SELECT
    'Product ' || i,
    (random() * 1000000)::numeric(12,2),
    (random() * 100)::int,
    (random() * 4 + 1)::int
FROM generate_series(1,100) AS s(i);


-- ORDERS (100)
INSERT INTO orders (user_id, total_price, status)
SELECT
    (random() * 99 + 1)::int,
    (random() * 2000000)::numeric(12,2),
    'completed'
FROM generate_series(1,100);


-- ORDER ITEMS (200)
INSERT INTO order_items (order_id, product_id, quantity, price)
SELECT
    (random() * 99 + 1)::int,
    (random() * 99 + 1)::int,
    (random() * 5 + 1)::int,
    (random() * 100000)::numeric(12,2)
FROM generate_series(1,200);


-- PAYMENTS (100)
INSERT INTO payments (order_id, payment_method, payment_status, paid_at)
SELECT
    id,
    'Transfer',
    'paid',
    NOW()
FROM orders;


-- REVIEWS (100)
INSERT INTO reviews (user_id, product_id, rating, comment)
SELECT
    (random() * 99 + 1)::int,
    (random() * 99 + 1)::int,
    (random() * 4 + 1)::int,
    'Good product'
FROM generate_series(1,100);