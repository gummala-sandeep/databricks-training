-- Week 1 - Day 1 SQL Practice

-- Q1. Select all columns from Employee table
SELECT *
FROM Employee;

-- Q2. Select employee names and salaries
SELECT name, salary
FROM Employee;

-- Q3. Display employees older than 30
SELECT *
FROM Employee
WHERE age > 30;

-- Q4. Display all department names
SELECT name
FROM Department;

-- Q5. Display employees working in IT department
SELECT *
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Department
    WHERE name = 'IT'
);

-- Q6. Display employees whose names start with 'J'
SELECT *
FROM Employee
WHERE name LIKE 'J%';

-- Q7. Display employees whose names end with 'e'
SELECT *
FROM Employee
WHERE name LIKE '%e';

-- Q8. Display employees whose names contain 'a'
SELECT *
FROM Employee
WHERE name LIKE '%a%';

-- Q9. Display employees whose names are exactly 9 characters long
SELECT *
FROM Employee
WHERE LENGTH(name) = 9;

-- Q10. Display employees whose second character is 'o'
SELECT *
FROM Employee
WHERE name LIKE '_o%';

-- Q11. Display employees hired in 2020
SELECT *
FROM Employee
WHERE YEAR(hire_date) = 2020;

-- Q12. Display employees hired in January
SELECT *
FROM Employee
WHERE MONTH(hire_date) = 1;

-- Q13. Display employees hired before 2019
SELECT *
FROM Employee
WHERE hire_date < '2019-01-01';

-- Q14. Display employees hired on or after March 1, 2021
SELECT *
FROM Employee
WHERE hire_date >= '2021-03-01';

-- Q15. Display employees hired in the last 2 years
SELECT *
FROM Employee
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Q16. Find total salary of all employees
SELECT SUM(salary) AS total_salary
FROM Employee;

-- Q17. Find average salary of employees
SELECT AVG(salary) AS average_salary
FROM Employee;

-- Q18. Find minimum salary among employees
SELECT MIN(salary) AS minimum_salary
FROM Employee;

-- Q19. Count employees in each department
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

-- Q20. Find average salary in each department
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;

-- Q21. Find total salary for each department
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;
