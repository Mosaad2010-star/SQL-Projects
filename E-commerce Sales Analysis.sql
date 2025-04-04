-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO sales (sale_id, product_id, customer_id, sale_date, quantity, total_amount)
VALUES
(1, 101, 1001, '2025-04-01', 2, 200.00),
(2, 102, 1002, '2025-04-01', 1, 150.00),
(3, 101, 1003, '2025-04-02', 3, 300.00);

-- Sales analysis by product
SELECT product_id, SUM(total_amount) AS total_sales
FROM sales
GROUP BY product_id;
