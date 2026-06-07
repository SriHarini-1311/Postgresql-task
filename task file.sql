CREATE TABLE course_data (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE student_data (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    course_id INT
);

CREATE TABLE institute (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(50)
);

CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);


INSERT INTO course_data VALUES
(101, 'Java'),
(102, 'Python'),
(103, 'React.js'),
(104, 'SQL'),
(105, 'Power BI');

INSERT INTO student_data VALUES
(1, 'Kumar', 101),
(2, 'Priya', 102),
(3, 'Arun', 103),
(4, 'Divya', 104),
(5, 'Karthik', 103),
(6, 'Meena', NULL),
(7, 'Ravi', 110);

INSERT INTO institute VALUES
(1, 'Chennai'),
(2, 'Coimbatore'),
(3, 'Madurai');

INSERT INTO course VALUES
(101, 'Java'),
(102, 'Python'),
(103, 'React.js'),
(104, 'SQL');


select * from course_data
select * from student_data
select * from institute
select * from course

-------------------inner joins------------
SELECT s.student_name, c.course_name    ----- student name with course name
FROM student_data s
INNER JOIN course_data c
ON s.course_id = c.course_id;

SELECT s.*                              ------students joind in available course
FROM student_data s
INNER JOIN course_data c
ON s.course_id = c.course_id;

SELECT s.student_id, s.student_name, c.course_name         ------displays stuname, stuid,course name
FROM student_data s
INNER JOIN course_data c
ON s.course_id = c.course_id;
   
SELECT s.student_name, c.course_name                   ---------find the course 
FROM student_data s
INNER JOIN course_data c
ON s.course_id = c.course_id
WHERE s.student_name='Kumar';

SELECT s.student_name                           ----find stu joined curse react.js
FROM student_data s
INNER JOIN course_data c
ON s.course_id = c.course_id
WHERE c.course_name='React.js';

SELECT s.*                                     ----matching course id in both table
FROM student_data s
INNER JOIN course_data c
ON s.course_id = c.course_id;

SELECT count(*) as total_students             -----count of students
FROM student_data s
INNER JOIN course_data c
ON s.course_id = c.course_id;

---------------------left joins----------------
SELECT s.*, c.course_name                 -------display stuname with missing course details
FROM student_data s
LEFT JOIN course_data c
ON s.course_id = c.course_id;


SELECT s.*                                 -----------who did not get course allocation
FROM student_data s
LEFT JOIN course_data c
ON s.course_id = c.course_id
WHERE c.course_id IS NULL;

SELECT s.student_name, c.course_name          ------- course_name =null
FROM student_data s
LEFT JOIN course_data c
ON s.course_id = c.course_id
WHERE c.course_id IS NULL;

SELECT s.student_name, c.course_name             -------show stu name with course
FROM student_data s
LEFT JOIN course_data c
ON s.course_id = c.course_id;

SELECT * 
FROM student_data s
LEFT JOIN course_data c
ON s.course_id = c.course_id;

----------------------------right join-----------------------

SELECT s.student_name, c.course_name
FROM student_data s
RIGHT JOIN course_data c
ON s.course_id = c.course_id;

SELECT c.*
FROM student_data s
RIGHT JOIN course_data c
ON s.course_id = c.course_id
WHERE  s.student_id  IS  NULL;

SELECT c.course_name
FROM student_data s
RIGHT JOIN course_data c
ON s.course_id = c.course_id
WHERE s.student_name IS NULL;

 
