create view employee_data as
select 
	employees.emp_no,
	employees.first_name,
    employees.last_name,
    employees.gender,
    salaries.emp_no as "Sal_emp_no"
from employees
inner join salaries on 
	employees.emp_no = salaries.emp_no;

create view hire_date_employees as
select 
	employees.emp_no,
    employees.first_name,
    employees.last_name,
    employees.hire_date
from employees
	where employees.hire_date between
		'1986-01-01' and '1986-12-31';
		
create view dept_managers as
select
	dp.dept_no,
	dp.dept_name,
	dpm.emp_no,
	employees.first_name,
	employees.last_name,
	dpm.from_date,
	dpm.to_date
from departments as dp
inner join dept_manager as dpm on
	dp.dept_no = dpm.dept_no
inner join employees on
	dpm.emp_no = employees.emp_no;
	
create view emp_dept as
select
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name,
	dp.dept_name
from dept_emp
inner join employees on
	dept_emp.emp_no = employees.emp_no
inner join departments as dp on
	dept_emp.dept_no = dp.dept_no;
	
create view hercules as
select
	first_name,
	last_name
from employees
	where first_name = 'Hercules'
		and last_name like 'B%';
		
create view sales_emp as
select
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name,
	dp.dept_name
from dept_emp
inner join employees on
	dept_emp.emp_no = employees.emp_no
inner join departments as dp on
	dept_emp.dept_no = dp.dept_no
		where dp.dept_name = 'Sales';
		
create view sales_and_dev as
select
	dept_emp.emp_no,
	employees.first_name,
	employees.last_name,
	dp.dept_name
from dept_emp
inner join employees on
	dept_emp.emp_no = employees.emp_no
inner join departments as dp on
	dept_emp.dept_no = dp.dept_no
		where dp.dept_name = 'Sales'
		or dp.dept_name = 'Development';
		
create view last_name_freq as
select
	last_name,
	count(last_name) as "Frequency"
from employees
group by last_name
order by count(last_name) desc;