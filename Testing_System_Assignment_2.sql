DROP DATABASE IF EXISTS Testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;
CREATE TABLE Department (
DepartmentID 	TINYINT UNIQUE PRIMARY KEY AUTO_INCREMENT,
DepartmentName		NVARCHAR(20) NOT NULL
);
CREATE TABLE `Position`(
PositionID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
PositionName	ENUM ('Dev','Test','Scrum Master ','PM') NOT NULL
);
CREATE TABLE `Account`(
AccountID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Email			NVARCHAR(30) NOT NULL,
`UserName`		NVARCHAR(30) NOT NULL,
FullName		NVARCHAR(30) NOT NULL,
DepartmentID	TINYINT NOT NULL ,
PositionID		TINYINT UNSIGNED ,
CreateDate		DATETIME DEFAULT NOW(),
FOREIGN KEY (PositionID) REFERENCES `Position`(PositionID),
FOREIGN KEY	(DepartmentID) REFERENCES Department (DepartmentID)
);
CREATE TABLE `Group`(
GroupID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
GroupName		NVARCHAR(20),
CreatorID		TINYINT UNSIGNED,
CreateDate		DATETIME DEFAULT NOW(),
FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)

);
CREATE TABLE GroupAccount(
GroupID			TINYINT UNSIGNED NOT NULL,
AccountID		TINYINT UNSIGNED NOT NULL,
JoinDate		DATETIME DEFAULT NOW(),
FOREIGN KEY (GroupID) REFERENCES `Group`(GroupID),
FOREIGN KEY (AccountID) REFERENCES `Account`(AccountID)
);
CREATE TABLE TypeQuestion(
TypeID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
TypeName 		VARCHAR(20)
);
CREATE TABLE CategoryQuestion(
CategoryID		TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
CategoryName	NVARCHAR(20)

);
CREATE TABLE Question(
QuestionID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Content			VARCHAR(29),
TypeID			TINYINT UNSIGNED NOT NULL,
CategoryID		TINYINT UNSIGNED NOT NULL,
CreatorID		TINYINT UNSIGNED NOT NULL,
CreateDate 		DATETIME DEFAULT NOW(),
FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)

);
CREATE TABLE Answer (
AnswerID		TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
Content			VARCHAR(20),
QuestionID		TINYINT UNSIGNED NOT NULL,
isCorrect		BIT DEFAULT 1,
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
CREATE TABLE Exam (
ExamID			TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
`Code`			TINYINT UNSIGNED ,
Title			VARCHAR(20),
CategoryID		TINYINT UNSIGNED NOT NULL,
Duration		ENUM('60','180','90'),
CreatorID		TINYINT	UNSIGNED NOT NULL,
CreateDate		DATETIME DEFAULT NOW(),
FOREIGN KEY (CreatorID) REFERENCES `Account`(AccountID)
);
CREATE TABLE ExamQuestion (
ExamID			TINYINT UNSIGNED NOT NULL,
QuestionID		TINYINT UNSIGNED NOT NULL,
FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
INSERT INTO Department (DepartmentName)
VALUES					('Sale'),
						('PR'),
                        ('Marketing'),
                        ('Trưởng Phòng'),
                        ('Giám Đốc');
INSERT INTO `Position` (PositionName)
VALUES					('Dev'),
						('Test'),
                        ('Scrum Master'),
                        ('PM');
INSERT INTO	`Account`	(Email		,	UserName	,FullName	,DepartmentID	,PositionID		)
VALUES					('ABC@gmail.com','khabanh'		,'Ngô Bá Khá'   , 		4		,		2		),
						('z2@gmail.com' ,'lee'			,'Lee Loi'		,		3		,		1		),
                        ('dsf@gcv.com'	,'moi'			,'dau cat moi'	,		5		,		3		),
                        ('anhdev@gmail.cn','dev'			,'Voi Thanh Xuân',	2		,		4		),
                        ('jcv@gmail.com','tho'		,'tho nguyen'   ,		1		,		2		);
INSERT INTO `Group`		(GroupName	,CreatorID	)
VALUES					('Bay lac',		1		),
						('Zay đầm',		2		),
                        ('Tổ Lái',		4		),
                        ('Nghiện',		3		),
                        ('Meme'	  ,		1		);
                        
INSERT INTO GroupAccount (GroupID,AccountID)
VALUES					(	1	,	2	),
						(	2	,	1	),
                        (	3	,	4	),
                        (	4	,	3	),
                        (	2	,	5	);
INSERT INTO TypeQuestion (TypeName)
VALUES					('Multiple-Choice'),
						('Essay'			),
                        ('Essay'			),
                        ('Essay'			),
                        ('Multiple-Choice'	);
INSERT INTO CategoryQuestion (CategoryName)
VALUES						('Java'),
							('NET'),
                            ('SQL'),
                            ('Postman'),
                            ('Ruby');
INSERT INTO	Question (Content	,	CategoryID	,	TypeID	,CreatorID	)
   VALUES			('đôt nhà'	,		1		,		2	,	3		),
					('zootube'	,		2		,		3	,	4		),
					('công Nghiệp',		4		,		1	,	2		),
                    ('An Cuc'	,		3		,		4	,	1		),
                    ('bay nhay'	,		5		,		5	,	5		);
INSERT INTO	Answer 	(Content	,	QuestionID	,	isCorrect)
VALUES				('choi do'	,	1			,		1	),
					('Sieu to'	,	4			,		0	),
                    ('May nghien ',	5			,		1	),
					('bán hoa',		2			,		1	),
                    ('1900'		,	3			,		0	);
INSERT INTO Exam 	(`code`		,	Title		,CategoryID	,	Duration	,	CreatorID)
VALUES				(	1		,'đề 01'		,		1	,	'90'		,	1	),
					(	2		,'đề 02'		,		4	, 	'60'			,	2	),
                    (   4		,'đề 03'		,		3	,	'90'			,	4	),
                    (	3		,'đề 04'		,		2	,	'90'			,	3	),
                    (	5		,'đề 05'		,		5	,	'180'			,	5	);
INSERT	INTO ExamQuestion (ExamID,QuestionID)
VALUES						(	2,	3	),
							(	3,	4	),
                            (	4,	5	),
                            (	5,	1	),
                            (	1,	2	);





