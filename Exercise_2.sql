USE StudentDatabase;
select * from StudentDetails;

DROP TABLE IF EXISTS StudentMarks;
CREATE TABLE StudentMarks(
	ID VARCHAR(10) ,
	maths INT NOT NULL,
	science INT NOT NULL,
	social INT NOT NULL,
    PRIMARY KEY(ID)
);

INSERT INTO StudentMarks VALUES("19EC1021",99,94,92);
INSERT INTO StudentMarks VALUES("19EC1020",100,90,92);
INSERT INTO StudentMarks VALUES("19EC1018",90,86,89);
INSERT INTO StudentMarks VALUES("19EC1025",67,94,87);
INSERT INTO StudentMarks VALUES("19EC1029",55,51,71);
INSERT INTO StudentMarks VALUES("19EC2003",82,49,60);
INSERT INTO StudentMarks VALUES("19EC1056",89,66,76);
INSERT INTO StudentMarks VALUES("19EC2005",79,77,80);
INSERT INTO StudentMarks VALUES("19EC1002",100,99,100);

SELECT * FROM StudentMarks;

SELECT StudentDetails.ID,StudentDetails.FirstName,StudentDetails.LastName, 
SUM(StudentMarks.maths+StudentMarks.science+StudentMarks.social) AS TotalMarksAbtained
FROM StudentDetails INNER JOIN StudentMarks ON StudentDetails.ID=StudentMarks.ID
GROUP BY StudentDetails.ID
ORDER BY TotalMarksAbtained DESC;

SELECT StudentDetails.ID,StudentDetails.FirstName,StudentDetails.LastName, 
SUM(StudentMarks.maths+StudentMarks.science+StudentMarks.social) AS TotalMarksAbtained
FROM StudentDetails INNER JOIN StudentMarks ON StudentDetails.ID = StudentMarks.ID 
WHERE StudentMarks.maths >= 50 AND StudentMarks.science >= 50 AND StudentMarks.social >=50 
GROUP BY StudentDetails.ID
HAVING TotalMarksAbtained >= 200
ORDER BY TotalMarksAbtained DESC;


















