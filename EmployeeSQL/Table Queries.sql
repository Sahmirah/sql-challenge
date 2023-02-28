--1. List the employee number, last name, first name, sex, and salary of each employee.

Select salaries.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
From employees 
inner join salaries
on salaries.emp_no = employees.emp_no
order by salaries.emp_no;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT emp_no, last_name, first_name, hire_date
From employees
Where extract(year from hire_date) = 1986;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
inner join departments
on dept_manager.dept_no = departments.dept_no
inner join employees
on dept_manager.emp_no = employees.emp_no

--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
left join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT employees.last_name, employees.first_name, employees.sex
From employees
where (employees.first_name = 'Hercules') and (lower(employees.last_name) like 'b%')

--6. List each employee in the Sales department, including their employee number, last name, and first name.
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
from employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where lower(departments.dept_name) = 'sales'

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
From employees
inner join dept_emp
on employees.emp_no = dept_emp.emp_no
inner join departments
on dept_emp.dept_no = departments.dept_no
where (lower(departments.dept_name) = 'sales') or (lower(departments.dept_name) = 'development')


--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;

