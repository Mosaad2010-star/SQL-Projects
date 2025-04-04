


-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    hire_date DATE,
    department VARCHAR(100),
    status VARCHAR(50)
);

-- Insert sample data
INSERT INTO employees (employee_id, name, hire_date, department, status)
VALUES
(1, 'John Doe', '2022-05-01', 'Sales', 'Active'),
(2, 'Jane Smith', '2021-06-15', 'Marketing', 'Inactive'),
(3, 'Samuel Lee', '2020-03-22', 'IT', 'Active');

-- Employee status by department
SELECT department, COUNT(*) AS active_employees
FROM employees
WHERE status = 'Active'
GROUP BY department;
