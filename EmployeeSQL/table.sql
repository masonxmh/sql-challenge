-- Drop table if exists
DROP TABLE IF EXISTS departments;

-- CREAT TBALE departments
CREATE TABLE departments (
			dept_no VARCHAR NOT NULL PRIMARY KEY,
			dept_name VARCHAR NOT NULL
           );
-- import date from departments.csv			
SELECT * FROM departments;

--================================================================
-- Drop table if exists
DROP TABLE IF EXISTS employees;

-- CREAT TABLE employees
CREATE TABLE employees (
			emp_no INT NOT NULL PRIMARY KEY,
			birth_date DATE NOT NULL,
			first_name VARCHAR NOT NULL,
			last_name VARCHAR NOT NULL,
			gender VARCHAR NOT NULL,
			hire_date DATE NOT NULL);
-- import date from departments.csv
SELECT * FROM employees;

--==================================================================
DROP TABLE IF EXISTS dept_emp;
-- CREATE TABLE dept_emp
CREATE TABLE dept_emp (
			emp_no INT NOT NULL,
			dept_no VARCHAR NOT NULL,
			from_date DATE NOT NULL,
	        to_date DATE NOT NULL,
	        FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
            FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	        PRIMARY KEY(emp_no,dept_no)
           );
-- import date from departments.csv			
SELECT * FROM dept_emp;

--==========================================================================
-- Drop table if exists
DROP TABLE IF EXISTS dept_manager;

-- CREAT TABLE dept_manager
CREATE TABLE dept_manager (
			dept_no VARCHAR NOT NULL,
			emp_no INT NOT NULL,
			from_date DATE NOT NULL,
			to_date DATE NOT NULL,
            FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	        FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	        PRIMARY KEY(emp_no,dept_no)
           );
-- import date from departments.csv
SELECT * FROM dept_manager;
--===========================================================================
-- Drop table if exists
DROP TABLE IF EXISTS salaries;

-- CREAT TABLE dept_manager
CREATE TABLE salaries (
			emp_no INT NOT NULL PRIMARY KEY,
			salary INT NOT NULL,
			from_date DATE NOT NULL,
			to_date DATE NOT NULL,
            FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
            );
-- import date from departments.csv
SELECT * FROM salaries;
-- ---------------------------------------------------------
-- Drop table if exists
DROP TABLE IF EXISTS titles;

-- CREAT TABLE dept_manager
CREATE TABLE titles (
			emp_no INT NOT NULL,
			title VARCHAR NOT NULL,
			from_date DATE NOT NULL,
			to_date DATE NOT NULL,
            FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
            );
-- import date from departments.csv
SELECT * FROM titles;

