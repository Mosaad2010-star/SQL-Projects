

-- Create traffic table
CREATE TABLE website_traffic (
    page_id INT PRIMARY KEY,
    page_name VARCHAR(100),
    visits INT,
    bounce_rate DECIMAL(5, 2),
    visit_date DATE
);

-- Insert sample data
INSERT INTO website_traffic (page_id, page_name, visits, bounce_rate, visit_date)
VALUES
(1, 'Home Page', 2000, 50.00, '2025-04-01'),
(2, 'Product Page', 1500, 30.00, '2025-04-01'),
(3, 'Contact Us', 800, 60.00, '2025-04-01');

-- Most visited pages analysis
SELECT page_name, SUM(visits) AS total_visits
FROM website_traffic
GROUP BY page_name;
