

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    hire_date DATE,
    performance_score INT
);

-- Insert sample data
INSERT INTO employees (employee_id, name, department, hire_date, performance_score)
VALUES
(1, 'John Doe', 'Sales', '2022-05-01', 85),
(2, 'Jane Smith', 'Marketing', '2021-06-15', 90),
(3, 'Samuel Lee', 'IT', '2020-03-22', 80);

-- Employee performance analysis by department
SELECT department, AVG(performance_score) AS avg_performance
FROM employees
GROUP BY department;
