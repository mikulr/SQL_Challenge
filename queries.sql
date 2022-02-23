--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, gender, salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no,  d.dept_name, m.emp_no, e.last_name, e.first_name 
FROM manager m
	INNER JOIN employees e ON m.emp_no = e.emp_no
	INNER JOIN departments d ON d.dept_no = m.dept_no;
	
--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e
	INNER JOIN emp_dept x ON x.emp_no = e.emp_no
	INNER JOIN departments d ON d.dept_no = x.dept_no;
	
--List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."
-- USED ILIKE IN CASE SOMETHING WAS NOT CAPITALIZED
SELECT first_name, last_name, gender
FROM employees
WHERE first_name ILIKE 'hercules'
AND last_name ILIKE 'b%';

--List all employees in the Sales department, including their 
--employee number, last name, first name, and department name
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e
	INNER JOIN emp_dept x ON x.emp_no = e.emp_no
	INNER JOIN departments d ON d.dept_no = x.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, dept_name
FROM employees e
	INNER JOIN emp_dept x ON x.emp_no = e.emp_no
	INNER JOIN departments d ON d.dept_no = x.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names
--i.e., how many employees share each last name.
SELECT last_name, COUNT(emp_no) AS name_count
FROM employees
GROUP BY last_name
ORDER BY COUNT(emp_no) DESC;


--BONUS LOOKUP of "my badge number "
SELECT *
FROM employees e
JOIN salaries s
ON e.emp_no = s.emp_no
WHERE e.emp_no = '499942'