CREATE DATABASE if not exists company_training;
USE company_training;
CREATE TABLE if not exists departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE if not exists employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);
-- 1 ADD A PRIMARY KEY CONSTRAINT ONDEPARTMENT DEPARTMENT_ID 
alter table departments 
add primary key (department_id);

-- 2. Add a PRIMARY KEY constraint on employees.employee_id.
alter table employees
add primary key (employee_id);

-- 3. Add a new column named location of type VARCHAR(100) to the departments table.
alter table departments
add location varchar(100);

-- 4. Rename the column dept_name to department_name in the departments table, keeping its existing data type and
NOT NULL requirement.
alter table departments
rename column dept_name to department_name;
desc departments;
select * from departments;

-- 5.Modify employees.salary to DECIMAL(12,2) and ensure that it does not allow NULL values.
alter table employees
modify column salary decimal(12.2) not null;

-- 6. Set the default value of employees.status to Active.
alter table employees
alter column status set default 'active';

-- 7. Add a UNIQUE constraint on employees.email.
alter table employees 
modify column email varchar (120) unique;

-- 8 Rename the employees table to staff.
alter table employees
rename to staff;

-- 9. Add a FOREIGN KEY constraint on staff.department_id referencing departments.department_id.
alter table staff 
add constraint fk_staff_department 
foreign key (department_id)
references departments(department_id);

-- 10. Drop the UNIQUE constraint added to staff.email in Question 7.
alter table staff 
drop constraint unique_email;

-- 11. Drop the FOREIGN KEY constraint created in Question 9 without dropping the department_id column.
alter table staff 
drop foreign key fk_staff_department;

-- 12 Drop the PRIMARY KEY constraint from the staff table, retaining its employee_id column.
 alter table staff 
 drop primary key;
 
 -- 13 Add the PRIMARY KEY constraint back on staff.employee_id.
 alter table staff 
 add primary key (employee_id);
 
 -- 14 Drop the location column from the departments table
 alter table departments
 drop column location;
 
 -- 15. Rename the database from company_training to company_management using MySQL-supported DDL operations.
Create the new database, move both tables to it, and remove the old empty database. (MySQL does not support a
direct RENAME DATABASE cammand.

create database if not exists company_managment;
use company_managment;
CREATE TABLE if not exists departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE if not exists employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);

drop database company_training;




