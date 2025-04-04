


-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    location VARCHAR(100),
    total_spend DECIMAL(10, 2)
);

-- Insert sample data
INSERT INTO customers (customer_id, name, age, location, total_spend)
VALUES
(1001, 'Alice Brown', 25, 'New York', 500.00),
(1002, 'Bob White', 35, 'California', 1000.00),
(1003, 'Charlie Green', 28, 'Texas', 750.00);

-- Customer spending analysis by location
SELECT location, AVG(total_spend) AS avg_spend
FROM customers
GROUP BY location;
