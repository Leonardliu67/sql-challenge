-- 1. List the employee number, last name, first name, sex, and salary of each employee. 

SELECT e.emp_no, e.last_name, e.first_name, e.sex ,s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT e.last_name, e.first_name, e.hire_date
FROM employees as e
WHERE e.hire_date BETWEEN '01/01/1986' AND '31/12/1986'
ORDER BY hire_date;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no,dm.emp_no,dp.dept_name,e.last_name,e.first_name
FROM dept_manager as dm
JOIN departments as dp
ON dp.dept_no = dm.dept_no
JOIN employees as e 
ON dm.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,dp.dept_no
FROM employees as e
JOIN dept_emp as dp
ON e.emp_no = dp.emp_no;

-- 5.  List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.last_name,e.first_name,e.sex
FROM employees as e 
WHERE e.first_name = 'Hercules' and e.last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no,e.last_name,e.first_name,dp.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as dp
ON dp.dept_no = de.dept_no
WHERE dp.dept_no = 'd007'
ORDER BY e.emp_no ASC;

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,dp.dept_name
FROM employees as e
JOIN dept_emp as de
ON e.emp_no = de.emp_no
JOIN departments as dp
ON dp.dept_no = de.dept_no
WHERE dp.dept_no = 'd007' or dp.dept_no = 'd005';


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name). 
SELECT e.last_name, COUNT(e.last_name) AS "Name_Frequency"
FROM employees as e
GROUP BY e.last_name
ORDER BY "Name_Frequency" DESC;