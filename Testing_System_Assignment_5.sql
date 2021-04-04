 -- Question 1: 
 CREATE OR REPLACE VIEW Question1 AS
SELECT *
FROM `Account`ac
JOIN department dp ON ac.DepartmentID = dp.DepartmentID
WHERE dp.DepartmentName = 'Sale';
-- Question 2: 
SELECT * FROM GroupAccount gc
GROUP BY gc.AccountID
HAVING COUNT(gc.AccountID) = (select max(countgr)
							FROM (SELECT gc.GroupID , count(gc.AccountID) as countgr
							FROM GroupAccount gc
                            GROUP BY gc.AccountID ) AS MAXGR );
-- Question 3: 
 CREATE OR REPLACE VIEW Question3 AS
SELECT Content
FROM Answer
WHERE LENGTH(Content) > 10;
DELETE
FROM Question3 ;
-- Question 4:
 CREATE OR REPLACE VIEW Question4 AS
SELECT DepartmentName, Max(tong_so_nhan_vien) AS phong_ban_nhieu_nv
FROM (SELECT dt.DepartmentName, COUNT(a.DepartmentID) AS tong_so_nhan_vien
FROM `Account`a
JOIN Department dt ON a.DepartmentID = dt.DepartmentID
Group by dt.DepartmentID ) AS MAXNV ;
-- Question 5:
 CREATE OR REPLACE VIEW Question5 AS
SELECT qt.QuestionID, FullName FROM `Account` ac
JOIN Question qt ON ac.AccountID = qt.CreatorID
WHERE FullName LIKE 'Lee%'