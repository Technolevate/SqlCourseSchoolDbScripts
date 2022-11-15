--School Database

--If db exits drop to re-create - NOT NEEDED
--if('School' is null)
--begin 
--	drop database School
--end

go

------Create Database
create database School

use School

------------------------------------------------------------------------------------
--Create Tables
create table Teacher
(
	ID int not null primary key identity(1,1),
	Firstname varchar(100),
	Lastname varchar(100)
)

create table Course
(
	ID int not null primary key identity(1,1),
	Name varchar(500),
	TeacherID int foreign key references Teacher(ID)
)

create table Student
(
	ID int not null primary key identity(1,1),
	Firstname varchar(100),
	Lastname varchar(100)
)

--many:many course & student

create table StudentCourse
(
	StudentID int foreign key references Student(ID),
	CourseID int foreign key references Course(ID),
	Primary key(StudentID, CourseID)
)

create table Enrolment
(
	ID int primary key not null identity(1,1),
	StudentID int foreign key references Student(ID),
	CourseID int foreign key references Course(ID),
	StartDate date,
	EndDate date,
	constraint UC_StudentCourse unique(StudentID, CourseID)
)

--subject 
---will be linked to course and teacher

--enums


------Alter tables

--------------------------------------------------------------------------------------
--NOTES

--Teacher
--Student
--Classroom
--Class
--Exam
--StudentExam

--String/Text Data Types
---char(n)
---varchar(n)
---varchar(max)

--Numeric Data Types
---bit
---int
---decimal
---money

--Date and Time Data Types
---date

----https://www.w3schools.com/sql/sql_datatypes.asp#:~:text=SQL%20Server%20Data%20Types