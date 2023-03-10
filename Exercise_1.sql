-- set autocommit=0;
-- ACTIVITY_1
DROP DATABASE if exists StudentDatabase;
CREATE DATABASE StudentDatabase;
USE StudentDatabase;

-- ACTIVITY_2
CREATE TABLE StudentDetails(
	ID  VARCHAR(10) NOT NULL,
	FirstName  VARCHAR(20) NOT NULL,
	LastName  VARCHAR(25) NOT NULL,
	Gender TINYTEXT NOT NULL,
	Email  VARCHAR(50) NOT NULL,
	YearOfBirth  DATE NOT NULL,
    PRIMARY KEY(ID)
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

-- ACTIVITY_5
ALTER TABLE StudentDetails
ADD Branch VARCHAR(20) NOT NULL, ADD Std VARCHAR(10) NOT NULL;

UPDATE StudentDetails
SET Branch="ECE",Std="UG"
WHERE ID="19EC1021";

UPDATE StudentDetails
SET Branch="CSE",Std="MCA"
WHERE ID="19EC1020";

UPDATE StudentDetails
SET Branch="IT",Std="UG"
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
	   "Laxman",
	   "Female",
	   "harshini0808@gmail.com",
	   "2001-06-06",
	   "2022",
	   "NA",
	   "9th");

-- describe StudentDetails;
select * from StudentDetails;

-- ACTIVITY_6
SELECT COUNT(DateOfBirth)
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





                                  

