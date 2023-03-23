-- set autocommit=0;
-- ACTIVITY_1
DROP DATABASE if exists StudentDatabase;
CREATE DATABASE StudentDatabase;
USE StudentDatabase;

-- ACTIVITY_2
CREATE TABLE StudentDetails(
	ID  VARCHAR(10) NOT NULL,
	FirstName  VARCHAR(25) NOT NULL,
	LastName  VARCHAR(25) NOT NULL,
	Gender TINYTEXT NOT NULL,
	Email  VARCHAR(50) NOT NULL,
	YearOfBirth  DATE NOT NULL,
    PRIMARY KEY (ID ,Email) 
);

-- ACTIVITY_3
ALTER TABLE StudentDetails
ADD YearOfAdmission YEAR NOT NULL;

ALTER TABLE StudentDetails
RENAME COLUMN YearOfBirth to DateOfBirth;


-- ACTIVITY_4
INSERT INTO StudentDetails 
VALUES("19EC1021",
	   "Teja",
	   "Chinthapatla",
	   "Male",
	   "chvsstejavardhan901@gmail.com",
	   "2002-01-09",
       "2019"
);
INSERT INTO StudentDetails 
VALUES("19EC1020",
	   "Karthik",
	   "Ch",
	   "Male",
	   "chkarthik@gmail.com",
	   "2002-02-18",
       "2019"
);
INSERT INTO StudentDetails 
VALUES("19EC1025",
	   "Ramanand",
	   "Datta",
	   "Male",
	   "ramd202@gmail.com",
	   "2002-04-14",
       "2020"
);
INSERT INTO StudentDetails 
VALUES("19EC1029",
	   "Teja",
	   "Eduru",
	   "Male",
	   "eduruteja09@gmail.com",
	   "2000-08-11",
       "2019"
);
INSERT INTO StudentDetails 
VALUES("19EC1018",
	   "Priya",
	   "Manchi",
	   "Female",
	   "ppriya0576@gmail.com",
	   "2002-05-07",
       "2019"
);
INSERT INTO StudentDetails 
VALUES("19EC1056",
	   "Priya",
	   "Manchi",
	   "Female",
	   "mmanila0707@gmail.com",
	   "2002-12-31",
       "2020"
);
INSERT INTO StudentDetails 
VALUES("19EC2005",
	   "Rajendra",
	   "Datta",
	   "Male",
	   "draju0005@gmail.com",
	   "2000-07-12",
       "2019"
);
INSERT INTO StudentDetails 
VALUES("19EC2003",
	   "Bhagavan",
	   "Krishna",
	   "Male",
	   "kbt001@gmail.com",
	   "2001-10-25",
       "2022"
);

-- INSERT INTO StudentDetails
-- VALUES("19EC1002",
-- 	   "Harshini",
-- 	   "Datta",
-- 	   "Female",
-- 	   "harshini0808@gmail.com",
-- 	   "2001-06-06",
-- 	   "2022"
-- );

-- ACTIVITY_5
ALTER TABLE StudentDetails
ADD Branch VARCHAR(20) NOT NULL, ADD Std VARCHAR(10) NOT NULL;

UPDATE StudentDetails
SET Branch="NA",Std="10th"
WHERE ID="19EC1021";

UPDATE StudentDetails
SET Branch="CSE",Std="MCA"
WHERE ID="19EC1020";

UPDATE StudentDetails
SET Branch="NA",Std="10th"
WHERE ID="19EC1025";

UPDATE StudentDetails
SET Branch="ECE",Std="UG"
WHERE ID="19EC1029";

UPDATE StudentDetails
SET Branch="NA",Std="10th"
WHERE ID="19EC1056";

UPDATE StudentDetails
SET Branch="NA",Std="7th"
WHERE ID="19EC1018";

UPDATE StudentDetails
SET Branch="CSE",Std="UG"
WHERE ID="19EC2005";

UPDATE StudentDetails
SET Branch="MPC",Std="11th"
WHERE ID="19EC2003";

-- commit;
-- rollback;
INSERT INTO StudentDetails 
VALUES("19EC1002",
	   "Harshini",
	   "Datta",
	   "Female",
	   "harshini0808@gmail.com",
	   "2001-06-06",
	   "2022",
	   "NA",
	   "9th");

-- describe StudentDetails;
select * from StudentDetails;

-- ACTIVITY_6
SELECT COUNT(DateOfBirth) AS NoOfStudents
FROM StudentDetails
WHERE (YEAR(DateOfBirth)="2002");

-- ACTIVITY_7 
SELECT YearOfAdmission,COUNT(*) AS NoOfStudents
FROM StudentDetails
GROUP BY YearOfAdmission;


-- ACTIVITY_8
SELECT YearOfAdmission,Gender,COUNT(*) AS NoOfStudents 
FROM StudentDetails
GROUP BY Gender,YearOfAdmission;


-- ACTIVITY_9_SAME_FIRST_NAME_METHOD_1
SELECT DISTINCT(A.ID),A.FirstName,A.LastName
FROM StudentDetails A, StudentDetails B
WHERE A.FirstName = B.FirstName
	AND A.LastName!=B.LastName
	AND A.ID != B.ID;
-- METHOD_2
SELECT FirstName, COUNT(*) AS NoOfStudents
FROM StudentDetails
GROUP BY FirstName
HAVING NoOfStudents > 1;

-- ACTIVITY_9_SAME_LAST_NAME_METHOD_1
SELECT DISTINCT(A.ID),A.FirstName,A.LastName
FROM StudentDetails A, StudentDetails B
WHERE A.FirstName != B.FirstName
	AND A.LastName=B.LastName
	AND A.ID != B.ID;
-- METHOD_2
SELECT LastName, COUNT(*) AS NoOfStudents
FROM StudentDetails
GROUP BY LastName
HAVING NoOfStudents > 1;


-- ACTIVITY_9_SAME_FIRST_AND_LAST_NAME_METHOD1
SELECT A.FirstName,A.LastName,A.ID
FROM StudentDetails A, StudentDetails B
WHERE A.FirstName=B.FirstName
    AND A.LastName=B.LastName
    AND A.ID!=B.ID;
-- METHOD_2
SELECT FirstName ,Lastname, COUNT(*) AS NoOfStudents
FROM StudentDetails 
GROUP BY FirstName,LastName
HAVING NoOfStudents > 1;

-- ACTIVITY_10_MAX_No_Of_Students_In_A_Year
SELECT YearOfAdmission -- ,COUNT(*) AS max_occurrence
FROM StudentDetails
GROUP BY YearOfAdmission
ORDER BY COUNT(*) desc
LIMIT 1;


-- ACTIVITY_10_MIN_No_Of_Students_In_A_Year
SELECT YearOfAdmission, COUNT(*) AS min_occurrence
FROM StudentDetails
GROUP BY YearOfAdmission
ORDER BY min_occurrence asc
LIMIT 1;

-- ACTIVITY_11
SELECT * FROM StudentDetails
ORDER BY DateOfBirth
LIMIT 5;

select FirstName 
From StudentDetails
where FirstName Like "_A%";

select * from StudentDetails;

-- EXERCISE_2
-- 2
-- DROP TABLE Marks;
CREATE TABLE Marks(
	ID VARCHAR(10) NOT NULL,
    subject VARCHAR(20) NOT NULL,
    mark INT ,
    constraint fk_student FOREIGN KEY (ID) REFERENCES StudentDetails(ID) on delete cascade
    );
    
INSERT INTO Marks VALUES("19EC1021",'maths',99);
INSERT INTO Marks VALUES("19EC1021",'social',100);
INSERT INTO Marks VALUES("19EC1020",'maths',89);
INSERT INTO Marks VALUES("19EC1020",'social',96);
INSERT INTO Marks VALUES("19EC1018",'maths',87);
INSERT INTO Marks VALUES("19EC1018",'social',null);
INSERT INTO Marks VALUES("19EC1025",'maths',90);
INSERT INTO Marks VALUES("19EC1025",'social',80);
INSERT INTO Marks VALUES("19EC1029",'maths',77);
INSERT INTO Marks VALUES("19EC1029",'social',84);
INSERT INTO Marks VALUES("19EC2003",'maths',97);
INSERT INTO Marks VALUES("19EC2003",'social',91);
INSERT INTO Marks VALUES("19EC1056",'maths',null);
INSERT INTO Marks VALUES("19EC1056",'social',88);
INSERT INTO Marks VALUES("19EC2005",'maths',93);
INSERT INTO Marks VALUES("19EC2005",'social',78);
INSERT INTO Marks VALUES("19EC1002",'maths',null);
INSERT INTO Marks VALUES("19EC1002",'social',null);

select * from Marks;

-- 3
SELECT FirstName,subject,mark,Std
FROM StudentDetails JOIN Marks
ON StudentDetails.ID=Marks.ID 
WHERE Marks.mark>90
;  -- AND StudentDetails.YEAR(YearOfAdmission)='2022';

-- 4
SELECT FirstName, subject, mark, std
FROM StudentDetails
JOIN Marks ON StudentDetails.ID = Marks.ID
WHERE mark > 90
  AND subject IN (
    SELECT DISTINCT subject
    FROM Marks
    WHERE mark > 90
  );

  
-- 5
-- DELETE FROM StudentDetails
-- WHERE ID='19EC1018';

SELECT * from StudentDetails;
select * from Marks;

-- 6
-- DROP TABLE StudentAddress;
CREATE TABLE StudentAddress(
	ID VARCHAR(10) NOT NULL,
    doorNo VARCHAR(10) NOT NULL,
    city VARCHAR(20) NOT NULL,
    state VARCHAR(20) NOT NULL,
    PRIMARY KEY(doorNo),
    FOREIGN KEY(ID) REFERENCES StudentDetails(ID)
    );

INSERT INTO StudentAddress VALUES('19EC1021','1-1641','tirupati','AP');
INSERT INTO StudentAddress VALUES('19EC1020','1-1642','chennai','TN');
INSERT INTO StudentAddress VALUES('19EC1018','1-1643','pondy','PDY');
INSERT INTO StudentAddress VALUES('19EC1025','1-1644','tirupati','AP');
INSERT INTO StudentAddress VALUES('19EC1029','1-1645','gudur','AP');
INSERT INTO StudentAddress VALUES('19EC1056','1-1646','nellore','AP');
INSERT INTO StudentAddress VALUES('19EC2005','1-1647','tambaram','TN');
INSERT INTO StudentAddress VALUES('19EC2003','1-1648','srikalahasti','AP');
INSERT INTO StudentAddress VALUES('19EC1002','1-1649','potheri','TN');

select * from StudentAddress;

SELECT StudentDetails.FirstName,StudentDetails.Branch 
FROM StudentDetails JOIN StudentAddress
ON StudentDetails.ID = StudentAddress.ID
WHERE StudentAddress.State = 'AP';

-- 7
SELECT  DISTINCT StudentDetails.ID,StudentDetails.FirstName,StudentDetails.Branch
FROM StudentDetails LEFT JOIN Marks
ON  StudentDetails.ID = Marks.ID
WHERE Marks.mark IS NULL;

-- 8
SELECT DISTINCT FirstName FROM (SELECT StudentDetails.FirstName, Marks.subject, Marks.mark, StudentDetails.Std
FROM StudentDetails
JOIN Marks ON StudentDetails.ID = Marks.ID
WHERE Marks.mark > 90) AS sampletable ;
-- AND (Marks.academic_year = 'current' OR Marks.academic_year = 'previous');


-- 9_A
SELECT  DISTINCT StudentDetails.ID,StudentDetails.FirstName,StudentDetails.LastName,SUM(Marks.mark) AS total
FROM StudentDetails  JOIN Marks
ON StudentDetails.ID = Marks.ID
GROUP BY StudentDetails.ID,StudentDetails.FirstName,StudentDetails.LastName
ORDER BY total DESC
LIMIT 1;

-- 9_B
SELECT  DISTINCT StudentDetails.ID,StudentDetails.FirstName,StudentDetails.LastName,SUM(Marks.mark) AS total
FROM StudentDetails JOIN Marks
ON StudentDetails.ID = Marks.ID
GROUP BY StudentDetails.ID,StudentDetails.FirstName,StudentDetails.FirstName,StudentDetails.LastName
ORDER BY total ASC
LIMIT 1;



















    
    
    
    


 












                                  

