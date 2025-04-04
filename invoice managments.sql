

-- Create invoices table
CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    customer_id INT,
    invoice_date DATE,
    due_date DATE,
    total_amount DECIMAL(10, 2),
    payment_status VARCHAR(50)
);

-- Insert sample data
INSERT INTO invoices (invoice_id, customer_id, invoice_date, due_date, total_amount, payment_status)
VALUES
(1, 1001, '2025-03-01', '2025-03-10', 300.00, 'Paid'),
(2, 1002, '2025-03-01', '2025-03-05', 450.00, 'Unpaid'),
(3, 1003, '2025-03-01', '2025-03-07', 500.00, 'Paid');

-- Unpaid invoices analysis
SELECT customer_id, SUM(total_amount) AS unpaid_amount
FROM invoices
WHERE payment_status = 'Unpaid'
GROUP BY customer_id;
