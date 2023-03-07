
-- ACTIVITY_1
DROP DATABASE if exists StudentDatabase;
CREATE DATABASE StudentDatabase;
USE StudentDatabase;

-- ACTIVITY_2
CREATE TABLE StudentDetails(
	ID  VARCHAR(10) NOT NULL,
	FirstName  VARCHAR(20) NOT NULL,
	LastName  VARCHAR(25),
	Gender TINYTEXT NOT NULL,
	Email  VARCHAR(50) NOT NULL,
	YearOfBirth  DATE NOT NULL,
    PRIMARY KEY(ID)
);

-- ACTIVITY_3
ALTER TABLE StudentDetails
ADD YearOfAdmission YEAR;

ALTER TABLE StudentDetails
RENAME COLUMN YearOfBirth to DateOfBirth;

describe StudentDetails;

-- ACTIVITY_4
INSERT INTO StudentDetails 
VALUES("19EC1021",
	   "Teja Vardhan",
	   "Chinthapatla",
	   "Male",
	   "chvsstejavardhan901@gmail.com",
	   "2002-01-09",
       "2023"
);
INSERT INTO StudentDetails 
VALUES("19EC1021",
	   "Teja Vardhan",
	   "Chinthapatla",
	   "Male",
	   "chvsstejavardhan901@gmail.com",
	   "2002-01-09",
       "2023"
);
INSERT INTO StudentDetails 
VALUES("19EC1021",
	   "Teja Vardhan",
	   "Chinthapatla",
	   "Male",
	   "chvsstejavardhan901@gmail.com",
	   "2002-01-09",
       "2023"
);
INSERT INTO StudentDetails 
VALUES("19EC1021",
	   "Teja Vardhan",
	   "Chinthapatla",
	   "Male",
	   "chvsstejavardhan901@gmail.com",
	   "2002-01-09",
       "2023"
);
INSERT INTO StudentDetails 
VALUES("19EC1021",
	   "Teja Vardhan",
	   "Chinthapatla",
	   "Male",
	   "chvsstejavardhan901@gmail.com",
	   "2002-01-09",
       "2023"
);
INSERT INTO StudentDetails 
VALUES("19EC1021",
	   "Teja Vardhan",
	   "Chinthapatla",
	   "Male",
	   "chvsstejavardhan901@gmail.com",
	   "2002-01-09",
       "2023"
);
INSERT INTO StudentDetails 
VALUES("19EC1021",
	   "Teja Vardhan",
	   "Chinthapatla",
	   "Male",
	   "chvsstejavardhan901@gmail.com",
	   "2002-01-09",
       "2023"
);




select * from StudentDetails;



                                  

