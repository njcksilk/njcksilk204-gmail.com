DROP DATABASE IF EXISTS fresher;
CREATE DATABASE fresher;
USE fresher;

CREATE TABLE Trainee(
TraineeID		 VARCHAR(20),
Full_Name		VARCHAR(20),
Birth_Date		DATE,
Gender			VARCHAR(7),
ET_IQ			VARCHAR(2),
ET_Gmath		VARCHAR(2),
ET_English		VARCHAR(2),
Training_Class	VARCHAR(15),
Evaluation_Notes VARCHAR(100)
);