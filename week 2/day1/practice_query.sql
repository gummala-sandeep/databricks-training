-- 21. Assign row numbers based on salary (highest first).
SELECT emp_name,
       department,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employee_data;

-- 22. Assign row numbers within each department.
SELECT emp_name,
       department,
       salary,
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employee_data;

-- 23. Assign row numbers based on latest join_date.
SELECT emp_name,
       join_date,
       ROW_NUMBER() OVER(ORDER BY join_date DESC) AS row_num
FROM employee_data;

-- 24. Assign row numbers alphabetically by emp_name.
SELECT emp_name,
       ROW_NUMBER() OVER(ORDER BY emp_name) AS row_num
FROM employee_data;

-- 25. Get highest paid employee from each department.
SELECT *
FROM (
    SELECT emp_name,
           department,
           salary,
           ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS rn
    FROM employee_data
) t
WHERE rn = 1;

-- 26. Rank employees based on salary.
SELECT emp_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employee_data;

-- 27. Rank employees within each department.
SELECT emp_name,
       department,
       salary,
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employee_data;

-- 28. Rank employees based on earliest join_date.
SELECT emp_name,
       join_date,
       RANK() OVER(ORDER BY join_date ASC) AS join_rank
FROM employee_data;

-- 29. Rank employees alphabetically.
SELECT emp_name,
       RANK() OVER(ORDER BY emp_name) AS alpha_rank
FROM employee_data;

-- 30. Show top 2 ranked employees.
SELECT *
FROM (
    SELECT emp_name,
           salary,
           RANK() OVER(ORDER BY salary DESC) AS salary_rank
    FROM employee_data
) t
WHERE salary_rank <= 2;

-- 31. Dense-rank employees based on salary.
SELECT emp_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_salary_rank
FROM employee_data;

-- 32. Dense-rank employees within department.
SELECT emp_name,
       department,
       salary,
       DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_dept_rank
FROM employee_data;
