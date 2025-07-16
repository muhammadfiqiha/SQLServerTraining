------------ Study Case 2 Employee Training Management in Plants --------------
-- Create database
CREATE DATABASE EmployeeTrainingMgmt;

USE EmployeeTrainingMgmt;

-- Create table
-- Relationship
-- 1. Training has instructor who are also plant employees
-- 2. Store Training Participation Record

-- Employee
CREATE TABLE Employee (
	EmployeeID INT PRIMARY KEY IDENTITY(1,1),
	FirstName VARCHAR(15) NOT NULL,
	MiddleName VARCHAR(15),
	LastName VARCHAR(15) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	PhoneNumber VARCHAR(15) NOT NULL,
);

-- Training Course
CREATE TABLE TrainingCourse (
	CourseID INT PRIMARY KEY IDENTITY(1,1),
	Title VARCHAR(25) NOT NULL,
	CourseDesc TEXT NOT NULL,
	HoursDuration FLOAT NOT NULL,
)

-- Instructor
CREATE TABLE Instructor (
	InstructorID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeID INT NOT NULL,

	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
);

-- Participation Record
CREATE TABLE ParticipationRecord (
	RecordID INT PRIMARY KEY IDENTITY(1,1),
	DateAttended DATE NOT NULL,
	IsPass BIT NOT NULL,
	SessionID INT NOT NULL,
	EmployeeID INT NOT NULL,

	FOREIGN KEY (SessionID) REFERENCES TrainingSession(SessionID),
	FOREIGN KEY (EmployeeID) REFERENCES ParticipationRecord(EmployeeID),
);

-- Training Session
CREATE TABLE TrainingSession (
	SessionID INT PRIMARY KEY IDENTITY(1,1),
	InstructorID INT NOT NULL,
	CourseID INT NOT NULL,

	FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID),
	FOREIGN KEY (CourseID) REFERENCES TrainingCourse(CourseID),
);

-- Employee Course
CREATE TABLE EmployeeCourse (
	EmployeeCourseID INT PRIMARY KEY IDENTITY(1,1),
	EmployeeID INT NOT NULL,
	CourseID INT NOT NULL,

	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
	FOREIGN KEY (CourseID) REFERENCES TrainingCourse(CourseID),
);
