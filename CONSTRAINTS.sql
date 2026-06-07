
CREATE TABLE classes (
    class_id SERIAL PRIMARY KEY,
    class_name VARCHAR(50) NOT NULL
);

-- Insert sample classes
INSERT INTO classes (class_name) VALUES
('Computer Science'),
('Mathematics'),
('Physics');


SELECT * FROM CLASSES

------------------------

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,                          -- PRIMARY KEY + SERIAL
    first_name VARCHAR(50) NOT NULL, 			            -- NOT NULL
    last_name VARCHAR(50) NOT NULL,                  	    -- NOT NULL
    email VARCHAR(100) UNIQUE NOT NULL,             	    -- UNIQUE + NOT NULL
    age INT CHECK (age >= 18 AND age <= 60),        	    -- CHECK constraint
    status VARCHAR(10) DEFAULT 'non-active',           	    
    class_id INT,                                   	    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (class_id) REFERENCES classes(class_id) ON DELETE SET NULL
	);

SELECT * FROM STUDENTS

-- Insert students with valid constraints
INSERT INTO students (first_name, last_name, email, age, status, class_i234wqqasZd)
VALUES
('SRI', 'HARINI', 'sri.harini@example.com', 22, 'active', 1),
('SARU', 'MATHI', 'saru.mathi@example.com', 25, DEFAULT, 2),
('PRIYA', 'DHARSHINI', 'priya.dharshini@example.com', 30, 'non-active', 3),
('NEGA', 'dharshini', 'nega.@example.com', 28, 'active', NULL);   -- NULL allowed for foreign key
-------------------------------

create table departments(
dept_id int primary key,
dept_name varchar(50)
);


create table employees(
emp_id int primary key,
name varchar(50),
dept_id int references departments(dept_id)
);

insert into departments(dept_id,dept_name)values
(10,'HR'),
(20,'IT'),
(30,'TRANING'),
(40,'ACCOUNTS'),
(50,'SALES');

insert into employees(emp_id,name,dept_id)values
(1,'kalai',10),
(2,'jana',20),
(3,'karthi',30),
(4,'sasi',40),
(5,'siva',null),
(6,'vishnu',20),
(7,'arun',null);

select * from departments
select * from employees 

-----------------inner joins---------------
select employees.name,departments.dept_name
from employees
inner join departments
on employees.dept_id=departments.dept_id

select e.name,d.dept_name
from employees e
left join departments d
on e.dept_id=d.dept_id

select e.name,d.dept_name
from employees e
right join departments d
on e.dept_id=d.dept_id

select e.name,d.dept_name
from employees e
full join departments d
on e.dept_id=d.dept_id

select e1.name as employees1,e2.name as employees2,d.dept_name
from employees e1
join employees e2 on e1.dept_id=e2.dept_id
join departments d on e1.dept_id=d.dept_id
where e1.emp_id<>e2.emp_id

select employees.name,departments.dept_name
from employees
cross join departments