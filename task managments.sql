


-- Create projects and tasks table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

CREATE TABLE tasks (
    task_id INT PRIMARY KEY,
    project_id INT,
    task_name VARCHAR(100),
    task_status VARCHAR(50),
    due_date DATE,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert sample data
INSERT INTO projects (project_id, project_name, start_date, end_date)
VALUES
(1, 'Project X', '2025-01-01', '2025-06-01');

INSERT INTO tasks (task_id, project_id, task_name, task_status, due_date)
VALUES
(1, 1, 'Task A', 'In Progress', '2025-04-01'),
(2, 1, 'Task B', 'Completed', '2025-03-15');

-- Task status by project
SELECT p.project_name, t.task_status, COUNT(*) AS task_count
FROM tasks t
JOIN projects p ON t.project_id = p.project_id
GROUP BY p.project_name, t.task_status;
