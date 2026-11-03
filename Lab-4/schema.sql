CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;

CREATE TABLE department (
    dept_id VARCHAR(10) PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE student (
    roll_no INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id VARCHAR(10),
    year INT,
    marks INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    dept_id VARCHAR(10),
    salary DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department VALUES
('CSE','Computer Science'),
('ECE','Electronics'),
('ME','Mechanical'),
('CIVIL','Civil Engineering');

INSERT INTO student VALUES
(101,'Asha Rao','CSE',2,78),
(102,'Kiran Nair','ECE',3,55),
(103,'Meera Iyer','CSE',1,91),
(104,'Rahul Dev','ME',2,40),
(105,'Divya Menon','CSE',4,66);

INSERT INTO employee VALUES
(1,'Sundar','CSE',45000),
(2,'Anitha','ECE',38000),
(3,'Rahim','ME',52000);

CREATE TABLE salary_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    changed_on DATETIME
);