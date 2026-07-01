-- Create database
CREATE DATABASE IF NOT EXISTS product_db;
USE product_db;

-- Create table (for reference — Hibernate auto-creates this via ddl-auto=update)
CREATE TABLE IF NOT EXISTS products (
    id          BIGINT          AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(255)    NOT NULL,
    description TEXT,
    price       DECIMAL(10,2)   NOT NULL,
    category    VARCHAR(255),
    stock       INT             NOT NULL DEFAULT 0,
    created_at  DATETIME,
    updated_at  DATETIME
);

-- Mock data (25 products across categories)
INSERT INTO products (name, description, price, category, stock, created_at, updated_at) VALUES
('Wireless Mouse',       'Ergonomic wireless mouse with USB receiver',           29.99,  'Electronics',   120, NOW(), NOW()),
('Mechanical Keyboard',  'RGB backlit mechanical keyboard, blue switches',       89.99,  'Electronics',    45, NOW(), NOW()),
('USB-C Hub',            '7-in-1 USB-C hub with HDMI, USB 3.0, SD card',         34.50,  'Electronics',   200, NOW(), NOW()),
('Bluetooth Headphones', 'Over-ear noise-cancelling bluetooth headphones',       149.99, 'Electronics',    30, NOW(), NOW()),
('Webcam 1080p',         'Full HD 1080p webcam with built-in microphone',        59.99,  'Electronics',    75, NOW(), NOW()),
('Running Shoes',        'Lightweight running shoes, breathable mesh',           79.99,  'Sports',         60, NOW(), NOW()),
('Yoga Mat',             'Non-slip exercise yoga mat, 6mm thick',                 24.99,  'Sports',        150, NOW(), NOW()),
('Water Bottle',         'Stainless steel insulated water bottle 750ml',          19.99,  'Sports',        300, NOW(), NOW()),
('Dumbbell Set',         'Adjustable dumbbell set 2-20kg',                       129.99,  'Sports',         25, NOW(), NOW()),
('Resistance Bands',     'Set of 5 resistance bands for home workout',            14.99,  'Sports',        180, NOW(), NOW()),
('Cotton T-Shirt',       'Premium cotton crew neck t-shirt, unisex',              22.50,  'Clothing',      250, NOW(), NOW()),
('Denim Jacket',         'Classic denim jacket with button closure',              69.99,  'Clothing',       40, NOW(), NOW()),
('Wool Scarf',           'Soft merino wool scarf, winter collection',             34.99,  'Clothing',       80, NOW(), NOW()),
('Running Shorts',       'Quick-dry running shorts with zipper pocket',           29.99,  'Clothing',      120, NOW(), NOW()),
('Leather Belt',         'Genuine leather belt, 35mm width',                      39.99,  'Clothing',       65, NOW(), NOW()),
('Novel: The Horizon',   'Bestselling fiction novel, hardcover',                  24.99,  'Books',         100, NOW(), NOW()),
('Java Programming',     'Complete guide to Java 17, 3rd edition',                44.99,  'Books',          55, NOW(), NOW()),
('Cookbook: Italian',    'Traditional Italian recipes, 200+ pages',               29.99,  'Books',          70, NOW(), NOW()),
('Notebook A5',          'Hardcover lined notebook, 200 pages',                    9.99,  'Stationery',    500, NOW(), NOW()),
('Ballpoint Pen Set',    'Set of 10 smooth-writing ballpoint pens, blue ink',      7.99,  'Stationery',    400, NOW(), NOW()),
('Desk Organizer',       'Wooden desk organizer with 5 compartments',             32.99,  'Stationery',     90, NOW(), NOW()),
('Sticky Notes',         'Pack of 12 sticky note pads, assorted colors',           6.99,  'Stationery',    350, NOW(), NOW()),
('Whiteboard Markers',   'Set of 8 low-odor whiteboard markers',                  12.99,  'Stationery',    200, NOW(), NOW()),
('LED Desk Lamp',        'Adjustable LED desk lamp with USB charging port',       45.99,  'Furniture',      60, NOW(), NOW()),
('Office Chair',         'Ergonomic mesh office chair with lumbar support',       299.99, 'Furniture',      15, NOW(), NOW());
