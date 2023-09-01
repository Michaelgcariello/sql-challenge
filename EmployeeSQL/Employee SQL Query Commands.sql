--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM public."Employees" e
INNER JOIN public."Salaries" s ON s.emp_no=e.emp_no

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM public."Employees" e
WHERE hire_date LIKE '%1986'

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.emp_no, dm.dept_no, d.dept_name, e.last_name, e.first_name
FROM public."Dept_Manager" dm
JOIN public."Departments" d ON dm.dept_no = d.dept_no
JOIN public."Employees" e ON dm.emp_no = e.emp_no

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Dept_Emp" de
JOIN public."Departments" d ON de.dept_no = d.dept_no
JOIN public."Employees" e ON de.emp_no = e.emp_no

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT e.first_name, e.last_name, e.sex
FROM public."Employees" e
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT de.emp_no, e.first_name, e.last_name, 
FROM public."Dept_Emp" de
JOIN public."Employees" e ON de.emp_no = e.emp_no
JOIN public."Departments" d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales'

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.first_name, e.last_name, d.dept_name
FROM public."Dept_Emp" de
JOIN public."Employees" e ON de.emp_no = e.emp_no
JOIN public."Departments" d ON de.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*)
FROM public."Employees"
GROUP BY last_name
ORDER BY COUNT (*) DESC;