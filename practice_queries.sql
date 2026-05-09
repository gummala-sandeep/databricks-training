-- Q51. Display employees whose salary is equal to the department maximum salary
SELECT e.*
FROM Employee e
JOIN (
    SELECT department_id,
           MAX(salary) AS max_salary
    FROM Employee
    GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.salary = d.max_salary;

-- Q52. Display employees hired after the average hire date
SELECT *
FROM Employee
WHERE hire_date > (
    SELECT AVG(hire_date)
    FROM Employee
);

-- Q53. Display departments with the highest total salary
SELECT department_id,
       SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 1;

-- Q54. Display employees who work on projects belonging to their department
SELECT e.name AS employee_name,
       p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- Q55. Display employees whose age is greater than the average age
SELECT *
FROM Employee
WHERE age > (
    SELECT AVG(age)
    FROM Employee
);

-- Q56. Display the department with the minimum average salary
SELECT department_id,
       AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary ASC
LIMIT 1;

-- Q57. Display employees whose names contain more than one 'a'
SELECT *
FROM Employee
WHERE LENGTH(name) - LENGTH(REPLACE(name, 'a', '')) > 1;

-- Q58. Display the total number of projects in each department
SELECT department_id,
       COUNT(*) AS total_projects
FROM Project
GROUP BY department_id;

-- Q59. Display employees who have the same salary as another employee
SELECT *
FROM Employee
WHERE salary IN (
    SELECT salary
    FROM Employee
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- Q60. Display departments with more than one project
SELECT department_id,
       COUNT(*) AS total_projects
FROM Project
GROUP BY department_id
HAVING COUNT(*) > 1;

-- Q61. Display employees whose names start and end with the same letter
SELECT *
FROM Employee
WHERE LEFT(name, 1) = RIGHT(name, 1);

-- Q62. Display the youngest employee in each department
SELECT e.*
FROM Employee e
JOIN (
    SELECT department_id,
           MIN(age) AS min_age
    FROM Employee
    GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.age = d.min_age;

-- Q63. Display departments where the total salary exceeds 150000
SELECT department_id,
       SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) > 150000;

-- Q64. Display employees hired in the earliest year
SELECT *
FROM Employee
WHERE YEAR(hire_date) = (
    SELECT MIN(YEAR(hire_date))
    FROM Employee
);

-- Q65. Display employees whose salary is between 50000 and 70000
SELECT *
FROM Employee
WHERE salary BETWEEN 50000 AND 70000;
