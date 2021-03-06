DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
CREATE TABLE Department (
DepartmentID 	TINYINT UNIQUE PRIMARY KEY,
DepartName		NVARCHAR(20)
);
CREATE TABLE `Position`(
PositionID		TINYINT UNSIGNED PRIMARY KEY ,
PositionName	NVARCHAR(20)
);
CREATE TABLE `Account`(
AccountID		TINYINT UNSIGNED PRIMARY KEY,
Email			VARCHAR(30) NOT NULL,
`UserNăme`		VARCHAR(20) NOT NULL,
FullName		NVARCHAR(20) NOT NULL,
DepartmentID	TINYINT UNIQUE ,
PositionID		TINYINT UNSIGNED ,
CreateDate		DATETIME,
FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID),
FOREIGN KEY	(DepartmentID) REFERENCES Department(DepartmentID)
);
CREATE TABLE `Group`(
GroupID			TINYINT UNSIGNED PRIMARY KEY,
GroupName		NVARCHAR(20),
CreatorID		TINYINT UNSIGNED,
CreateDate		DATETIME
);
CREATE TABLE GroupAccount(
GroupID			TINYINT UNSIGNED,
AccountID		TINYINT UNSIGNED,
JoinDate		DATETIME,
FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);
CREATE TABLE TypeQuestion(
TypeID			TINYINT UNSIGNED PRIMARY KEY,
TypeName 		VARCHAR(20)
);
CREATE TABLE CategoryQuestion(
CategoryID		TINYINT UNSIGNED PRIMARY KEY,
CategoryName	VARCHAR(20)

);
CREATE TABLE Question(
QuestionID		TINYINT UNSIGNED PRIMARY KEY,
Content			VARCHAR(29),
TypeID			TINYINT UNSIGNED,
CategoryID		TINYINT UNSIGNED,
CreatorID		TINYINT UNSIGNED,
CreateDate 		DATETIME

);
CREATE TABLE Answer (
AnswerID		TINYINT UNSIGNED PRIMARY KEY,
Content			VARCHAR(20),
QuestionID		TINYINT UNSIGNED,
isCorrect		ENUM('Đúng','Sai') NOT NULL,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
CREATE TABLE Exam (
ExamID			TINYINT UNSIGNED PRIMARY KEY,
`Code`			TINYINT UNSIGNED ,
Title			VARCHAR(20),
CategoryID		TINYINT UNSIGNED,
Duration		TIME,
CreatorID		TINYINT	UNSIGNED,
CreateDate		DATETIME
);
CREATE TABLE ExamQuestion (
ExamID			TINYINT UNSIGNED,
QuestionID		TINYINT UNSIGNED,
FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
)





