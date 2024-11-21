--1. List the employee number, last name, first name, sex, and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no;
   -- 300,024 results

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;
  -- 36150  results

--3. List the manager of each department along with their department number, department name,
--employee number, last name, and first name.
SELECT 
 	d.dept_name,
	d.dept_no,
	e.emp_no,  
	e.last_name,
    e.first_name
  
FROM 
    employees e
JOIN 
    dept_manager dm ON e.emp_no = dm.emp_no
JOIN 
    departments d ON dm.dept_no = d.dept_no;
	--24 results



--4. List the department number for each employee along with that employee’s employee number
--last name, first name, and department name.
SELECT 
 	d.dept_name,
	e.emp_no,  
	e.last_name,
    e.first_name
  
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no;
	    -- 331,603 results


--5.List first name, last name, and sex of each employee whose first name
--is Hercules and whose last name begins with the letter B.

SELECT first_name,last_name,gender from employees
	where first_name='Hercules' AND last_name LIKE 'B%';
		-- 20 results

		
--6.List each employee in the Sales department, 
--including their employee number, last name, and first name.
SELECT 
	e.emp_no,  
	e.last_name,
    e.first_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
WHERE d.dept_name='Sales';
    	-- 52,245 results

--7.List each employee in the Sales and Development departments,
--including their employee number, last name, first name, and department name.	
SELECT 
 	e.emp_no,  
	e.last_name,
    e.first_name,
    d.dept_name
FROM 
    employees e
JOIN 
    dept_emp de ON e.emp_no = de.emp_no
JOIN 
    departments d ON de.dept_no = d.dept_no
	WHERE d.dept_name='Sales' OR d.dept_name='Development';		
		-- 137,952 results

--8.List the frequency counts, in descending order,of all the employee last names .
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
		-- 1,638 different last names
		