DROP DATABASE IF EXISTS fresher;
CREATE DATABASE fresher;
USE fresher;
CREATE TABLE Trainee (
TraineeID			TINYINT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
Full_Name			NVARCHAR(20) NOT NULL,
Birth_Date			DATE,
Gender				ENUM('MALE','FEMALE','UNKNOWN'),
ET_IQ				TINYINT UNSIGNED CHECK (ET_IQ<= 20),
ET_Gmath			TINYINT UNSIGNED CHECK (ET_Gmath<= 20),
ET_English			TINYINT UNSIGNED CHECK (ET_English<=20 ),
Training_Class		VARCHAR(20) NOT NULL,
Evaluation_Notes	VARCHAR(20) 	NOT NULL
);
INSERT INTO Trainee (		Full_Name,		Birth_Date,	Gender,	ET_IQ,	ET_Gmath,	ET_English,	Training_Class,	Evaluation_Notes)
VALUES				('Trịnh Văn Hà'  ,  '2001/03/12',	'MALE' ,   15 ,	  16	 ,	14		  , 'VTI001'	   ,	'DHBKHN'	),
					('Dương Lè Loi'	 ,	'2001/06/15',  'FEMALE',  10  ,    20	 ,   7         , 'VTI002'		,   'DHCNTT'	),
                    ('Lê Văn Luyện'	 ,  '2001/07/1' ,  'FEMALE',   7  ,    0     ,   1         , 'VTI001'		,	'DHNDHN'	),
                    ('Đinh Văn Thanh',  '2001/11/11',  'MALE'  ,   20 ,    20    ,   20        ,  'VTI003'		,    'DHKTQD'	),
                    ('Lô Văn Đề '    ,  '2001/12/12',  'FEMALE',   10 ,    10    ,   19        ,  'VTI002'       ,    'DHTM'	),
                    ('Trịnh Minh Khả',  '2001/02/28',  'FEMALE',   19 ,    18    ,   17        ,  'VTI001'       ,    'DHBK'	),
                    ('Hoàng Kim Ngân',  '2001/09/12',   'MALE' ,   14 ,    10    ,    4        ,  'VTI004'		,	 'DHCN'     ),
                    ('Nguyễn Thuỷ Tú',  '2001/10/17',  'MALE'  ,  13  ,   20     ,   20        ,  'VTI004'       ,    'DHBCTT'	),
                    ('Hồ Không Minh' ,  '2001/05/05',  'FEMALE',  12  ,   10     ,   5         ,  'VTI002'       ,   'DHBK'   ),
                    ('Đỗ Học'        ,  '2001/03/16',  'FEMALE',   20 ,   20     ,   0         ,  'VTI001'       ,   'DGDYVF'   ),
                    ('Nhả Minh Cậc'  ,  '2001/02/26', 'UNKNOWN',  20  ,   20     ,   20        ,  'VTI003'       ,    'DGFAH'	);
                    
 --   Question 4 :
 SELECT * FROM Trainee 
 WHERE ET_IQ >= 12 AND ET_Gmath >= 12 AND ET_English >= 20;
 --   Question 5 : 
 SELECT * FROM Trainee 
 WHERE Full_Name LIKE 'N%''%C';
  --   Question 6 : 
  SELECT * FROM Trainee 
 WHERE Full_Name LIKE '_G%';
   --   Question 7 : 
   SELECT * FROM Trainee 
 WHERE Full_Name LIKE '__________c';    
    --   Question 8 :
    SELECT DISTINCT Full_Name FROM Trainee;
	--   Question 9 :
     SELECT DISTINCT Full_Name FROM Trainee
     ORDER BY Full_Name ASC;
--   Question 10 :
    SELECT Full_Name
FROM Trainee
WHERE LENGTH(Full_Name) = (
	SELECT MAX(LENGTH(Full_Name))
	FROM `Trainee`);
--   Question 11 : 
SELECT Full_Name,TraineeID,Birth_Date
FROM Trainee
WHERE LENGTH(Full_Name) = (
	SELECT MAX(LENGTH(Full_Name))
	FROM `Trainee`);
    --   Question 12 : 
SELECT Full_Name,	ET_IQ,	ET_Gmath,	ET_English
FROM Trainee
WHERE LENGTH(Full_Name) = (
	SELECT MAX(LENGTH(Full_Name))
	FROM `Trainee`); 
--   Question 13 : 
 SELECT (ROUND(DATEDIFF(CURDATE(), Birth_Date) / 365, 0)) AS Tuổi
			FROM Trainee
			ORDER BY Tuổi ASC
            LIMIT 5 ;
--   Question 14 :
SELECT * FROM Trainee 
 WHERE ET_IQ >= 8 AND ET_Gmath >= 8 AND ET_English >= 18 OR ET_IQ+ET_Gmath >=20;
 --   Question 15 :
 DELETE
 FROM Trainee
 WHERE TraineeID = 5 ;
--   Question 16 :
 DELETE
 FROM Trainee
 WHERE  ET_IQ+ET_Gmath <= 15;
 --   Question 17 :
 DELETE
 FROM Trainee
 WHERE ROUND(DATEDIFF(CURDATE(), Birth_Date) / 365, 0) > 30;
  --   Question 18 :
  UPDATE Trainee
  SET TraineeID =3
  WHERE Training_Class = 'VTI003';
    --   Question 19 :
     UPDATE Trainee
  SET  Full_Name = ('Le Van A'),
	   ET_IQ	     = ('10'),
	   ET_Gmath 	 = 15,
	   ET_English	 = 30
WHERE  TraineeID =10 ;
    --   Question 20 :
 SELECT Training_Class, COUNT(Training_Class)
FROM Trainee
GROUP BY Training_Class
HAVING  Training_Class = 'VTI001';
    --   Question 21 :
 SELECT COUNT(TraineeID) AS Số_học_viên
FROM Trainee
WHERE Training_Class = 'VTI001'+'VTI003';
    --   Question 22 :  
SELECT Gender, COUNT(Gender)
FROM Trainee
GROUP BY Gender;
    --   Question 23 :  
 SELECT Training_Class, COUNT(Training_Class)
FROM Trainee
GROUP BY Training_Class
HAVING  COUNT(Training_Class) > 3  ;
    --   Question 24 :
  SELECT Evaluation_Notes, COUNT(Evaluation_Notes)
FROM Trainee
GROUP BY Evaluation_Notes
HAVING  COUNT(Evaluation_Notes) > 1;  
     --   Question 25 :   
  SELECT  Full_Name,TraineeID,Training_Class
  FROM Trainee
  WHERE Training_Class = 'VTI001'
  UNION
   SELECT  Full_Name,TraineeID,Training_Class
  FROM Trainee
  WHERE Training_Class = 'VTI002';
    