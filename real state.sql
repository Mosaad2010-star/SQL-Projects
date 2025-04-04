

-- Create real estate sales table
CREATE TABLE real_estate (
    property_id INT PRIMARY KEY,
    property_name VARCHAR(100),
    location VARCHAR(100),
    price DECIMAL(15, 2),
    size INT
);

-- Insert sample data
INSERT INTO real_estate (property_id, property_name, location, price, size)
VALUES
(1, 'Villa A', 'New York', 500000, 2000),
(2, 'Apartment B', 'California', 350000, 1500),
(3, 'House C', 'Texas', 250000, 1800);

-- Property price analysis by location
SELECT location, AVG(price) AS avg_price
FROM real_estate
GROUP BY location;
