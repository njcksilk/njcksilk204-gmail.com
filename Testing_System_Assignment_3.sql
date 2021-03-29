-- testing_System_Assignment_3
-- Question 2:
SELECT*
FROM department;
-- Question 3:
SELECT *
FROM department
WHERE DepartmentName =('Sale');
-- Question 4:
SELECT *
FROM `Account`
WHERE LENGTH(FullName) = (
	SELECT MAX(LENGTH(FullName))
	FROM `Account`);
-- Question 5:
SELECT *
FROM `Account`
WHERE LENGTH(FullName) = (
	SELECT MAX(LENGTH(FullName))
	FROM `Account`) AND DepartmentID = 3 ;
    -- Question 6:
SELECT * FROM `Group`
WHERE CreateDate > 22/3/2021;
-- Question 7:
SELECT QuestionID , COUNT(QuestionID) AS tong_so_lan_xuat_hien
FROM answer
Group by QuestionID 
HAVING COUNT(QuestionID) >=2;
-- Question 8:
SELECT*
FROM exam
GROUP BY Duration
HAVING Duration >= '60' AND CreateDate > 27/3/2021;
-- Question 9:
SELECT GroupID , MAX(CreateDate) FROM `Group`
WHERE CreateDate > 27/3/2021
GROUP BY GroupID;
-- Question 10:
SELECT DepartmentID ,COUNT(DepartmentID) AS Nhân_viên_các_phòng_ban
FROM `Account`
WHERE DepartmentID = 3;
-- Question 11:
SELECT *
FROM `Account`
WHERE UserName LIKE '%n''l%';
-- Question 12:
DELETE
FROM Exam
WHERE CreateDate < 28/03/2021;
-- Question 13:
DELETE
FROM Answer
WHERE Content = ('choi do');

-- Question 14:
SET SQL_SAFE_UPDATES=0;
UPDATE `Account`
SET FullName	 = ('nguyễn bá lộc'),
    Email		 = ('loc.nguyenba@vti.com.vn')
WHERE	AccountID =5 ;
-- Question 15: 
UPDATE `GroupAccount`
SET AccountID = 5
WHERE GroupID  = 4











