-- 1. Show employees whose salary is NULL.
SELECT *
FROM Employees
WHERE salary IS NULL;

-- 2. Show employees whose manager_id is NULL.
SELECT *
FROM Employees
WHERE manager_id IS NULL;

-- 3. Show employees where both salary and bonus are NULL.
SELECT *
FROM Employees
WHERE salary IS NULL
AND bonus IS NULL;

-- 4. Show employees where salary exists but bonus is NULL.
SELECT *
FROM Employees
WHERE salary IS NOT NULL
AND bonus IS NULL;

-- 5. Count employees whose salary is NULL.
SELECT COUNT(*) AS null_salary_count
FROM Employees
WHERE salary IS NULL;

-- 6. Replace NULL salary with 0 using IFNULL().
SELECT name,
       IFNULL(salary, 0) AS salary
FROM Employees;

-- 7. Replace NULL bonus with 1000.
SELECT name,
       IFNULL(bonus, 1000) AS bonus
FROM Employees;

-- 8. Display employee total income using salary + bonus.
SELECT name,
       COALESCE(salary,0) + COALESCE(bonus,0) AS total_income
FROM Employees;

-- 9. Replace NULL manager_id with 999.
SELECT name,
       IFNULL(manager_id, 999) AS manager_id
FROM Employees;

-- 10. Show employee salary status using IFNULL().
SELECT name,
       IFNULL(salary, 'Salary Missing') AS salary_status
FROM Employees;

-- 11. Show employee income using salary → bonus → 1000 with COALESCE().
SELECT name,
       COALESCE(salary, bonus, 1000) AS employee_income
FROM Employees;

-- 12. Show first available payment source using COALESCE().
SELECT name,
       COALESCE(bonus, salary, 0) AS payment_source
FROM Employees;

-- 13. Show employee compensation using salary + IFNULL(bonus,0).
SELECT name,
       salary + IFNULL(bonus,0) AS compensation
FROM Employees;

-- 14. Replace all NULL values using COALESCE().
SELECT emp_id,
       name,
       COALESCE(salary,0) AS salary,
       COALESCE(bonus,0) AS bonus,
       COALESCE(manager_id,999) AS manager_id
FROM Employees;

-- 15. Show employees whose salary is NULL but bonus exists.
SELECT *
FROM Employees
WHERE salary IS NULL
AND bonus IS NOT NULL;

-- 16. Convert bonus to NULL if bonus = 0 using NULLIF().
SELECT name,
       NULLIF(bonus,0) AS updated_bonus
FROM Employees;

-- 17. Convert salary to NULL if salary = 50000.
SELECT name,
       NULLIF(salary,50000) AS updated_salary
FROM Employees;

-- 18. Use NULLIF() to avoid divide-by-zero.
SELECT emp_id,
       salary / NULLIF(bonus,0) AS salary_bonus_ratio
FROM Employees;

-- 19. Replace manager_id with NULL if manager_id = 101.
SELECT name,
       NULLIF(manager_id,101) AS updated_manager
FROM Employees;

-- 20. Compare salary and bonus using NULLIF().
SELECT name,
       NULLIF(salary,bonus) AS comparison_result
FROM Employees;
