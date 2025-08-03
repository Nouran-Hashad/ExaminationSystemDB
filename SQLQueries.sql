--***** CREATE DATABASE *****
CREATE DATABASE ExaminationDB;
--***** CREATE SCHEMAS *****
--auth, academic, exams
CREATE SCHEMA auth;
CREATE SCHEMA academic;
CREATE SCHEMA exams;
--***** CREATE TABLES ******

--1.USERS table
CREATE TABLE auth.USERS
(
userId INT IDENTITY(1,1) PRIMARY KEY,
Fname VARCHAR(20) NOT NULL,
Lname VARCHAR(20) NOT NULL,
Email VARCHAR(255) UNIQUE,
Password VARCHAR(255) CHECK (LEN(password)>=8) NOT NULL,
Role VARCHAR(255),
lastLogin DATE DEFAULT GETDATE()
);
--2.STUDENTS table
CREATE TABLE auth.STUDENTS
(
studentID INT PRIMARY KEY,
personalInfo VARCHAR(255),
Status VARCHAR(255)
);
--3.INSTRUCTORS table
CREATE TABLE auth.INSTRUCTORS
(
instructorId INT PRIMARY KEY,
Specilization VARCHAR(255),
Qualifications VARCHAR(255),
yearsOfExperience INT
);
--4.MANGER table
CREATE TABLE auth.training_manager
(
managerId INT PRIMARY KEY
);
--5.BRANCHES table
CREATE TABLE academic.BRANCHES
(
branchId INT PRIMARY KEY,
Name VARCHAR(255),
Description VARCHAR(255)
);
--6.INTAKES table
CREATE TABLE academic.INTAKES 
(
IntakeID INT PRIMARY KEY,
StartDate DATE,
EndDATE DATE,
TrackID INT 
);
--7.TRACKS table
CREATE TABLE academic.TRACKS
(
TrackID INT PRIMARY KEY,
Name VARCHAR(255),
Description VARCHAR(255),
BranchID INT
);
--8.COURSES table
CREATE TABLE academic.COURSES
(
CourseID INT PRIMARY KEY,
Name VARCHAR(255),
Description VARCHAR(255),
MaxDegree INT,
MinDegree INT,
mng_id INT,
intake_id INT
);
--9.instr_intake_course table
CREATE TABLE academic.instr_intake_course
(
instructor_id INT,
intake_id INT,
course_id INT,
HireDate DATE,
PRIMARY KEY(instructor_id,intake_id, course_id)
);
--10.QUESTIONS table
CREATE TABLE exams.QUESTIONS
(
QuestionID INT PRIMARY KEY,
Content VARCHAR(255),
Type VARCHAR(255),
Points INT,
CorrectAnswer VARCHAR(255),
BestAcceptedAnswer VARCHAR(255),
course_id INT
);
--11.Student_Answers table
CREATE TABLE exams.student_answer
(
StudentAnswerID INT PRIMARY KEY,
student_id INT,
question_id INT,
);
--12.answer_options table
CREATE TABLE exams.answer_options
(
AnswerOptionID INT PRIMARY KEY,
Content VARCHAR(225),
IsCorrect CHAR(1),
question_id INT
);
--13.EXAMS table
CREATE TABLE exams.EXAMS
(
ExamID INT PRIMARY KEY,
StartTime DATETIME,
EndTime DATETIME,
TotalPoints INT,
Type VARCHAR(30) DEFAULT 'exam',
course_id INT,
instructor_id INT
);
--14.exam_questions table
CREATE TABLE exams.exam_questions
(
ExamID INT,
QuestionID INT,
PRIMARY KEY(ExamID, QuestionID)
);

--***** ADDING GOREIGN KEY CONSTRAINT TO TABLES *****

--1.USERS table
--2.STUDENTS table
--3.INSTRUCTORS table
--4.MANGER table
--5.BRANCHES table
--6.INTAKES table
--7.TRACKS table
--8.COURSES table
--9.instr_intake_course table
--10.QUESTIONS table
--11.Student_Answers table
--12.Answer_Options table
--13.EXAMS table
--14.exam_questions table

--***** INSERTING DATA INTO TABLE *****

--1.ADD BRANCHES 
--2.ADD INTAKES 
--3.ADD TRACKS
--4.ADD STUDENT
--5.ADD INSTRUCTOR 
--6.ADD MANAGER 
--7.ADD QUESTIONS 
--8.Student_Answers table
--9.Answer_Options table
--10.COURSES table
--11.EXAMS table
--12.instr_intake_course table
--13.exam_questions table

--***** CREATE VIEWS *****
