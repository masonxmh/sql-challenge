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