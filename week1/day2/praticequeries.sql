-- Q36. Display employee names along with their department names
SELECT e.name AS employee_name,
       d.name AS department_name
FROM Employee e
JOIN Department d
ON e.department_id = d.department_id;

-- Q37. Display project names along with department names
SELECT p.name AS project_name,
       d.name AS department_name
FROM Project p
JOIN Department d
ON p.department_id = d.department_id;

-- Q38. Display employee names along with project names
SELECT e.name AS employee_name,
       p.name AS project_name
FROM Employee e
JOIN Project p
ON e.department_id = p.department_id;

-- Q39. Display all employees and their departments including employees without departments
SELECT e.name AS employee_name,
       d.name AS department_name
FROM Employee e
LEFT JOIN Department d
ON e.department_id = d.department_id;

-- Q40. Display all departments and employees including departments without employees
SELECT d.name AS department_name,
       e.name AS employee_name
FROM Department d
LEFT JOIN Employee e
ON d.department_id = e.department_id;

-- Q41. Display employees who earn more than the average salary
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

-- Q42. Display employees working in the same department as John
SELECT *
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John'
);

-- Q43. Display the employee with the highest salary
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

-- Q44. Display departments having more employees than the average department size
SELECT department_id,
       COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > (
    SELECT AVG(emp_count)
    FROM (
        SELECT COUNT(*) AS emp_count
        FROM Employee
        GROUP BY department_id
    ) AS department_counts
);

-- Q45. Display employees whose salary is greater than any employee in department 1
SELECT *
FROM Employee
WHERE salary > ANY (
    SELECT salary
    FROM Employee
    WHERE department_id = 1
);

-- Q46. Display employees whose salary is greater than all employees in department 2
SELECT *
FROM Employee
WHERE salary > ALL (
    SELECT salary
    FROM Employee
    WHERE department_id = 2
);

-- Q47. Display employees who are not assigned to any department
SELECT *
FROM Employee
WHERE department_id IS NULL;

-- Q48. Display departments that do not have any employees
SELECT *
FROM Department
WHERE department_id NOT IN (
    SELECT department_id
    FROM Employee
    WHERE department_id IS NOT NULL
);

-- Q49. Display the second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

-- Q50. Display employees whose salary is above the department average salary
SELECT e.*
FROM Employee e
JOIN (
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM Employee
    GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;
