-- Drop table if exists
DROP TABLE departments;

-- CREAT TBALE departments
CREATE TABLE departments (
			dept_no VARCHAR NOT NULL PRIMARY KEY,
			dept_name VARCHAR NOT NULL
           );
-- import date from departments.csv			
SELECT * FROM departments
-- -----------------------------------------------------------------
-- Drop table if exists
DROP TABLE employees;

-- CREAT TABLE dept_manager
CREATE TABLE employees (
			emp_no INT NOT NULL PRIMARY KEY,
			birth_date DATE,
			first_name VARCHAR,
			last_name VARCHAR,
			gender VARCHAR(1) NOT NULL,
			hire_date DATE);
-- import date from departments.csv
select * FROM employees
-- ---------------------------------------------------------
-- Drop table if exists
DROP TABLE dept_emp;

-- CREATE TABLE dept_emp
CREATE TABLE dept_emp (
			emp_no INT NOT NULL ,
			dept_no VARCHAR NOT NULL,
			from_date DATE,
	        to_date DATE,
	        FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
            FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
           );
-- import date from departments.csv			
select * FROM dept_emp
-- COPY dept_emp
-- FROM 'C:\Users\Mason\Desktop\USC Bootcamp\sql-challenge\data\dept_emp.csv'
-- DELIMITER ',' CSV HEADER;
-- -----------------------------------------------------
-- Drop table if exists
DROP TABLE dept_manager;

-- CREAT TABLE dept_manager
CREATE TABLE dept_manager (
			dept_no VARCHAR,
			emp_no INT,
			from_date DATE,
			to_date DATE,
            FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
           );
-- import date from departments.csv
select * FROM dept_manager
-- --------------------------------------------------------
-- Drop table if exists
DROP TABLE salaries;

-- CREAT TABLE dept_manager
CREATE TABLE salaries (
			emp_no INT,
			salary INT,
			from_date DATE,
			to_date DATE,
            FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
            );
-- import date from departments.csv
select * FROM salaries
-- ---------------------------------------------------------
-- Drop table if exists
DROP TABLE titles;

-- CREAT TABLE dept_manager
CREATE TABLE titles (
			emp_no INT,
			title VARCHAR,
			from_date DATE,
			to_date DATE,
            FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
            );
-- import date from departments.csv
select * FROM titles
-- ==================================================================================================================================
-- ----------------------------------------------------------------------------
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   employees.gender,
	   salaries.salary
FROM salaries
INNER JOIN employees ON
salaries.emp_no = employees.emp_no;
-- **********************************************************************************************************************************
-- 2. List employees who were hired in 1986.
SELECT * FROM employees;
SELECT * FROM employees where extract(YEAR FROM hire_date)= 1986;
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
dept_emp.dept_no = departments.dept_no;
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
WHERE dept_name = 'Sales';
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
WHERE dept_name = 'Sales' OR dept_name = 'Development';
-- *******************************************************************************************************************************************
-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT * FROM employees;
-- select last_name and count
SELECT last_name, COUNT (last_name) FROM employees
GROUP BY last_name
ORDER BY COUNT DESC;
