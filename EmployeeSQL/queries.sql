-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   employees.gender,
	   salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no = employees.emp_no
ORDER BY employees.emp_no;
-- **********************************************************************************************************************************
-- 2. List employees who were hired in 1986.
SELECT employees.last_name,
       employees.first_name,
	   employees.hire_date
FROM employees WHERE EXTRACT(YEAR FROM hire_date)= 1986
ORDER BY employees.last_name;
-- **********************************************************************************************************************************
-- 3.List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_manager.dept_no,
	   departments.dept_name,
	   dept_manager.emp_no,
	   employees.last_name,
	   employees.first_name,
	   dept_manager.from_date,
	   dept_manager.to_date
	   
From dept_manager
INNER JOIN employees ON
employees.emp_no = dept_manager.emp_no 
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no
ORDER BY departments.dept_no;
-- *************************************************************************************************************************************
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
-- 	   dept_emp.dept_no,
       departments.dept_name

FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no;
-- ***************************************************************************************************************************************
-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees;
SELECT first_name,last_name FROM employees where first_name = 'Hercules' and LEFT(last_name , 1) ='B';
-- ****************************************************************************************************************************************
-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
--        dept_emp.dept_no,
       departments.dept_name
	   
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
ORDER BY employees.emp_no;
-- ******************************************************************************************************************************************
-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
--        dept_emp.dept_no,
       departments.dept_name
	   
FROM employees
INNER JOIN dept_emp ON
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY employees.emp_no;
-- *******************************************************************************************************************************************
-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT * FROM employees;
-- select last_name and count
SELECT last_name, COUNT (last_name) FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;
