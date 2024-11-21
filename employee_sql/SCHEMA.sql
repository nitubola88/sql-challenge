DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;



CREATE TABLE departments(
    dept_no VARCHAR(4) PRIMARY KEY,
    dept_name TEXT NOT NULL
);
CREATE TABLE titles(
    title_id VARCHAR(5) PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE employees(
	emp_no INT PRIMARY KEY,
	emp_title VARCHAR(5) NOT NULL,
	birth_date date NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	gender VARCHAR(2) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)

)


CREATE TABLE dept_emp(
emp_no INT NOT NULL ,
dept_no VARCHAR(5) NOT NULL,
PRIMARY KEY (emp_no, dept_no),
FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
    PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);
CREATE TABLE salaries(
	emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no, salary),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

