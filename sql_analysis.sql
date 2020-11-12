-- ANALYSIS
-- 1. List employee details (employee number, last name, first name, sex, and salary)
SELECT e.emp_no, e.last_name, e.firt_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no;

-- 2. List first, last, and hire date of employees who were hired in 1986
SELECT firt_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1985-12-31' AND '1987-01-01';

-- 3. List the manager of each department with dept number, dept name, managers emp number, last name, first name
SELECT e.firt_name, e.last_name, e.emp_no, d.dept_no, dd.dept_name
FROM employees AS e
JOIN department_manager AS d
ON d.emp_no = e.emp_no
JOIN departments AS dd
ON d.dept_no = dd.dept_no
WHERE d.emp_no = e.emp_no;

-- 4. List the department of each employee with emp number, last, first name, and dept name
SELECT e.emp_no, e.firt_name, e.last_name, d.dept_name
FROM employees AS e
JOIN department_employee AS dd
on e.emp_no = dd.emp_no
JOIN departments AS d
on d.dept_no = dd.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is 'Hercules' and last name begins with 'B'
SELECT e.firt_name, e.last_name, e.sex 
FROM employees AS e
WHERE e.firt_name = 'Hercules'
AND e.last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their emp number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.firt_name, d.dept_name
FROM employees AS e
JOIN department_employee AS dd
on e.emp_no = dd.emp_no
JOIN departments AS d
on dd.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, include: emp number, last, first name, and dept name
SELECT e.emp_no, e.last_name, e.firt_name, d.dept_name
FROM employees AS e
JOIN department_employee AS dd
on e.emp_no = dd.emp_no
JOIN departments AS d
on dd.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

-- 8. In descending order, list the frequency count of eomployee last name (how many employees share each last name)
SELECT last_name, COUNT(last_name) AS "name_count"
FROM employees
GROUP BY last_name
ORDER BY "name_count" DESC;

SELECT * FROM departments