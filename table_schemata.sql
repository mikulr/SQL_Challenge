--BUILD employee table (emp_no is primary key)
CREATE TABLE employees (
  emp_no INT NOT NULL UNIQUE PRIMARY KEY,
--After building everything, realized I forgot to add relationship to titles table
--see line78 where I altered table to add foreign key
  title_id VARCHAR (5) NOT NULL,
  birth_date DATE NOT NULL,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  gender VARCHAR(1) NOT NULL,
  hire_date DATE NOT NULL
);

-- After import, view all fields from the table
SELECT *
FROM employees;

--Confirm unique Primary Key of employee table
SELECT COUNT(DISTINCT emp_no), count(emp_no)
from employees;

--BUILD job title table (title_id is primary key)
CREATE TABLE titles (
    title_id VARCHAR(5) NOT NULL UNIQUE PRIMARY KEY,
    title VARCHAR (25) NOT NULL
);

-- After import, view all fields from the table
SELECT *
FROM titles;

--Confirm unique Primary Key of titles table
SELECT COUNT(DISTINCT title_id), count(title_id)
from titles;

--BUILD department table (dept_no is primary key)
CREATE TABLE departments (
    dept_no VARCHAR NOT NULL UNIQUE PRIMARY KEY ,
    dept_name VARCHAR NOT NULL 
);

-- After import, view all fields from the table to be sure it worked
SELECT *
FROM departments;

--Confirm unique Primary Key of departmemt table
SELECT COUNT(DISTINCT dept_no), count(dept_no)
from departments;

--BUILD salary table and link to emp_no from employees 
CREATE TABLE salaries (
    emp_no INT REFERENCES employees(emp_no),
    salary INT NOT NULL
);
-- After import, view all fields from the table
SELECT *
FROM salaries;


--BUILD manager table and link to emp_no from employees AND dept_no from department table
CREATE TABLE manager (
    dept_no VARCHAR REFERENCES departments(dept_no) NOT NULL,
    emp_no INT REFERENCES employees(emp_no) NOT NULL
);
-- After import, view all fields from the table
SELECT *
FROM manager;

--BUILD employee department table and link to emp_no from employees AND dept_no from department table
CREATE TABLE emp_dept (
    emp_no INT REFERENCES employees(emp_no) NOT NULL,
    dept_no VARCHAR REFERENCES departments(dept_no) NOT NULL
);
-- After import, view all fields from the table
SELECT *
FROM emp_dept;

--Fixing error of not adding relationship to title_id key when building table 
ALTER TABLE employees
ADD CONSTRAINT title_id FOREIGN KEY (title_id)
REFERENCES titles(title_id);
