
-- 1. Tạo database
CREATE DATABASE UniversityDB;

-- 2. Tạo schema
CREATE SCHEMA university;

-- 3. Tạo bảng Students
CREATE TABLE university.Students
(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50)  NOT NULL,
    last_name  VARCHAR(50)  NOT NULL,
    birth_date DATE,
    email      VARCHAR(100) NOT NULL UNIQUE
);


-- 4. Tạo bảng Courses
CREATE TABLE university.Courses
(
    course_id   SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits     INT
);


-- 5. Tạo bảng Enrollments (bảng phụ)
CREATE TABLE university.Enrollments
(
    enrollment_id SERIAL PRIMARY KEY,
    student_id    INT,
    course_id     INT,
    enroll_date   DATE,
    FOREIGN
        KEY(student_id) REFERENCES university.Students(student_id),
    FOREIGN
        KEY (course_id) REFERENCES university.Courses(course_id)

);


-- 6. Xem danh sách database
SELECT datname
FROM pg_database;


-- 7. Xem danh sách schema
SELECT schema_name
FROM information_schema.schemata;


-- 8. Xem cấu trúc bảng Students
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'students';


-- 9. Xem cấu trúc bảng Courses
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'courses';


-- 10. Xem cấu trúc bảng Enrollments
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'enrollments';

