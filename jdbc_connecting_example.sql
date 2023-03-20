CREATE DATABASE JDBC_CONNECT;
USE  JDBC_CONNECT;

CREATE TABLE EmployeeDetails(
	EmployeeID VARCHAR(10) NOT NULL,
    EmployeeName VARCHAR(25) NOT NULL,
    DateOfJoining date NOT NULL,
    Age INT NOT NULL
    );
    
INSERT INTO EmployeeDetails VALUES('pt-7068','teja','2023-01-18',21);
INSERT INTO EmployeeDetails VALUES('pt-7043','Akash','2023-01-16',24);
INSERT INTO EmployeeDetails VALUES('pt-7002','Harish','2023-01-10',23);
INSERT INTO EmployeeDetails VALUES('pt-6009','Akshat','2022-11-08',21);

SELECT * FROM EmployeeDetails;

SELECT EmployeeID,EmployeeName,Age 
FROM EmployeeDetails
WHERE Age=23;

DELETE FROM EmployeeDetails WHERE EmployeeID="pt-7000";

SELECT EmployeeID 
FROM EmployeeDetails;





