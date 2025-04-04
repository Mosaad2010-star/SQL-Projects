

-- Create table for customers
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    signup_date DATE,
    subscription_end_date DATE,
    status VARCHAR(50) -- Active or Churned
);

-- Create table for customer activity (monthly usage data)
CREATE TABLE customer_activity (
    activity_id INT PRIMARY KEY,
    customer_id INT,
    activity_date DATE,
    activity_type VARCHAR(100),
    duration INT, -- Duration in minutes
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert sample data into customers table
INSERT INTO customers (customer_id, name, signup_date, subscription_end_date, status)
VALUES
(1, 'Alice Brown', '2022-01-01', '2025-01-01', 'Active'),
(2, 'Bob White', '2021-06-01', '2025-06-01', 'Active'),
(3, 'Charlie Green', '2021-03-01', '2023-03-01', 'Churned');

-- Insert sample data into customer activity table
INSERT INTO customer_activity (activity_id, customer_id, activity_date, activity_type, duration)
VALUES
(1, 1, '2025-03-01', 'Video Streaming', 120),
(2, 1, '2025-03-02', 'Music Streaming', 50),
(3, 2, '2025-03-01', 'Video Streaming', 180),
(4, 3, '2025-02-28', 'Video Streaming', 90),
(5, 3, '2025-02-27', 'Music Streaming', 40);

-- Calculate churn rate
WITH churn_analysis AS (
    SELECT customer_id, status, COUNT(*) AS total_activities
    FROM customer_activity
    JOIN customers ON customer_activity.customer_id = customers.customer_id
    GROUP BY customer_id, status
)
SELECT status, 
       COUNT(*) AS churned_customers, 
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customers)) AS churn_rate_percentage
FROM churn_analysis
WHERE status = 'Churned'
GROUP BY status;

-- Analyze active users’ behavior over time
WITH active_user_activity AS (
    SELECT customer_id, activity_date, SUM(duration) AS total_duration
    FROM customer_activity
    WHERE customer_id IN (SELECT customer_id FROM customers WHERE status = 'Active')
    GROUP BY customer_id, activity_date
)
SELECT customer_id, 
       MIN(activity_date) AS first_activity, 
       MAX(activity_date) AS last_activity, 
       SUM(total_duration) AS total_usage
FROM active_user_activity
GROUP BY customer_id;

-- Identify patterns in churn based on last usage date
WITH churn_patterns AS (
    SELECT c.customer_id, c.status, ca.activity_date
    FROM customers c
    LEFT JOIN customer_activity ca ON c.customer_id = ca.customer_id
    WHERE c.status = 'Churned'
)
SELECT status, 
       COUNT(*) AS churned_customers, 
       MAX(activity_date) AS last_activity_date,
       DATEDIFF(CURRENT_DATE, MAX(activity_date)) AS days_since_last_activity
FROM churn_patterns
GROUP BY status;
