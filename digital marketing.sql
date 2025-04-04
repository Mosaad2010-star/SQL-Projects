

-- Create campaigns table
CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(100),
    clicks INT,
    conversions INT,
    start_date DATE
);

-- Insert sample data
INSERT INTO campaigns (campaign_id, campaign_name, clicks, conversions, start_date)
VALUES
(1, 'Summer Sale', 1000, 50, '2025-04-01'),
(2, 'Black Friday', 2000, 150, '2025-04-02'),
(3, 'Christmas Offers', 500, 30, '2025-03-01');

-- Campaign performance analysis
SELECT campaign_name, (conversions * 10) AS revenue, clicks
FROM campaigns;
