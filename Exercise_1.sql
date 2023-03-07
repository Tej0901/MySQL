
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
	   "Priya",
	   "Female",
	   "ppriya0576@gmail.com",
	   "2002-05-07",
       "2019"
);
INSERT INTO StudentDetails 
VALUES("19EC1056",
	   "Manila",
	   "Manila",
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
SET Branch="MPC",Std="12th"
WHERE ID="19EC2003";


-- describe StudentDetails;
select * from StudentDetails;

-- ACTIVITY_6
SELECT COUNT(DateOfBirth)
FROM StudentDetails
WHERE (YEAR(DateOfBirth)="2002");

-- ACTIVITY_7




                                  

