CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR	
);

CREATE TABLE dept_emp (
	emp_no int,
	dept_no VARCHAR 
	);


CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no int	);

	
CREATE TABLE employees (
	emp_no int PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date date,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR,
	hire_date date);
	
CREATE TABLE salaries (
	emp_no int,
	salary int
);



CREATE TABLE titles (
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR
);

alter table dept_emp ADD CONSTRAINT fk_dept_emp_departments FOREIGN KEY(dept_no)REFERENCES  departments(dept_no);
alter table dept_emp ADD CONSTRAINT fk_dept_emp_employees FOREIGN KEY(emp_no)REFERENCES  employees(emp_no);
alter table employees ADD CONSTRAINT fk_employees_titles FOREIGN KEY(emp_title_id)REFERENCES  titles(title_id);
alter table dept_manager ADD CONSTRAINT fk_dept_manager_departments FOREIGN KEY(dept_no)REFERENCES  departments(dept_no);
alter table salaries ADD CONSTRAINT fk_salaries_employees FOREIGN KEY(emp_no)REFERENCES  employees(emp_no);





