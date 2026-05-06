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
WHERE YEAR(hire_date)<2019;

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

-- Q22. Find average age in each department
SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;

-- Q23. Count employees hired each year
SELECT YEAR(hire_date) AS hire_year,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date);

-- Q24. Find highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

-- Q25. Find department with highest average salary
SELECT department_id, AVG(salary) AS avg_salary
FROM Employee
GROUP BY department_id
ORDER BY avg_salary DESC
LIMIT 1;

-- Q26. Display departments with more than 2 employees
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

-- Q27. Display departments with average salary greater than 55000
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

-- Q28. Display years where more than 1 employee was hired
SELECT YEAR(hire_date) AS hire_year,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

-- Q29. Display departments with total salary less than 100000
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

-- Q30. Display departments where maximum salary is greater than 75000
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

-- Q31. Display employees ordered by salary in ascending order
SELECT *
FROM Employee
ORDER BY salary ASC;

-- Q32. Display employees ordered by age in descending order
SELECT *
FROM Employee
ORDER BY age DESC;

-- Q33. Display employees ordered by hire date
SELECT *
FROM Employee
ORDER BY hire_date ASC;

-- Q34. Display employees ordered by department and salary
SELECT *
FROM Employee
ORDER BY department_id, salary;

-- Q35. Display departments ordered by total salary
SELECT department_id,
       SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;
