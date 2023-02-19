select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from titles;

--List the employee number, last name, first name, sex, and salary of each employee.
select distinct e.emp_no,last_name,first_name,sex,salary from employees e
inner join salaries s
on e.emp_no=s.emp_no
;


--List the first name, last name, and hire date for the employees who were hired in 1986.

select  last_name,first_name,hire_date 
from employees
where hire_date between '01-JAN-1986' and '31-DEC-1986'
;

--more analysis
--there are two diff emplyees with same last name and first name has the same hiring date 
select  count(*), last_name,first_name,hire_date 
from employees
where hire_date between '01-JAN-1986' and '31-DEC-1986'
group by last_name,first_name,hire_date
having count(*) >1
order by 1,2,3
;
--2	"Heusch"	"Keung"	"1986-06-01"
--2	"Shiratori"	"Chiradeep"	"1986-09-18"

select  *
from employees
where hire_date between '01-JAN-1986' and '31-DEC-1986'
and first_name in ('Keung','Chiradeep')
and last_name in ('Heusch','Shiratori')
order by 4,5
;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dept_name,d.dept_no,title,e.emp_no,last_name,first_name
from dept_emp de
inner join employees e
on de.emp_no=e.emp_no
inner join departments d
on d.dept_no=de.dept_no
inner join titles t
on e.emp_title_id=t.title_id
where title='Manager';

select last_name||' '||first_name||' Employee # '||e.emp_no||' Is The '||title||' Of '||dept_name ||' Department # '||d.dept_no
from dept_emp de
inner join employees e
on de.emp_no=e.emp_no
inner join departments d
on d.dept_no=de.dept_no
inner join titles t
on e.emp_title_id=t.title_id
where title='Manager';


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select d.dept_no,e.emp_no,last_name,first_name,dept_name
from dept_emp de
inner join employees e
on de.emp_no=e.emp_no
inner join departments d
on d.dept_no=de.dept_no
inner join titles t
on e.emp_title_id=t.title_id
;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name,last_name,sex from employees
where first_name ='Hercules'
and last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.

select e.emp_no,last_name,first_name
from  employees e
inner join dept_emp de
on de.emp_no=e.emp_no
inner join departments d
on d.dept_no=de.dept_no
where dept_name='Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no,last_name,first_name,dept_name
from  employees e
inner join dept_emp de
on de.emp_no=e.emp_no
inner join departments d
on d.dept_no=de.dept_no
where dept_name in ('Sales','Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select count(*),last_name from employees
group by last_name
order by 1 desc;


