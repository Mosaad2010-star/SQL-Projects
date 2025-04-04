


-- Create inventory table
CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity_in_stock INT,
    reorder_level INT
);

-- Insert sample data
INSERT INTO inventory (product_id, product_name, quantity_in_stock, reorder_level)
VALUES
(101, 'Laptop', 50, 10),
(102, 'Smartphone', 30, 5),
(103, 'Headphones', 100, 20);

-- Products that need reordering
SELECT product_name, quantity_in_stock
FROM inventory
WHERE quantity_in_stock <= reorder_level;
