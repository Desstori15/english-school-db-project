
--1. Show all the students' scores on the last test
SELECT ds.Student_ID, ds.First_Name, ds.Last_Name, fs.Score
FROM Dim_Student ds
JOIN Participation p ON ds.Student_ID = p.Student_ID
JOIN Fact_Exam fe ON p.Participation_ID = fe.Participation_ID
JOIN Fact_Scores fs ON fe.Exam_ID = fs.Exam_ID
WHERE fe.Assessment_Date = (
    SELECT MAX(fe2.Assessment_Date)
    FROM Fact_Exam fe2
);


--2. Calculate the average grade of the students based on the results of all tests
SELECT AVG(fs.Score) AS Average_Grade
FROM Fact_Scores fs;

--3. Count how many people were at the last event
SELECT COUNT(ep.Student_ID) AS Number_of_Attendees
FROM EventParticipation ep
JOIN Fact_Events fe ON ep.EventParticipation_ID = fe.Event_ID
WHERE fe.Date_Time = (
    SELECT MAX(Date_Time)
    FROM Fact_Events
);

--4. Show all the students who joined our school in the last year
SELECT ds.Student_ID, ds.First_Name, ds.Last_Name, ds.Enrollment_Date
FROM Dim_Student ds
WHERE ds.Enrollment_Date >= ADD_MONTHS(TO_DATE('2023-06-01', 'YYYY-MM-DD'), -12);

--5. Show the students who got an 'A' on their last test
SELECT ds.Student_ID, ds.First_Name, ds.Last_Name, fs.Score
FROM Dim_Student ds
JOIN Participation p ON ds.Student_ID = p.Student_ID
JOIN Fact_Exam fe ON p.Participation_ID = fe.Participation_ID
JOIN Fact_Scores fs ON fe.Exam_ID = fs.Exam_ID
WHERE fe.Assessment_Date = (
    SELECT MAX(Assessment_Date)
    FROM Fact_Exam
)
AND fs.Score BETWEEN 90 AND 100;


--6. Show the teacher with the busiest schedule
SELECT dt.Teacher_ID, dt.First_Name, dt.Last_Name, COUNT(*) AS Number_of_Courses
FROM Dim_Teacher dt
JOIN Dim_Course dc ON dt.Teacher_ID = dc.Teacher_ID
GROUP BY dt.Teacher_ID, dt.First_Name, dt.Last_Name
ORDER BY Number_of_Courses DESC
FETCH FIRST 1 ROWS ONLY;

--7. Which student didn't pass the last exam
SELECT ds.Student_ID, ds.First_Name, ds.Last_Name, fs.Score
FROM Dim_Student ds
JOIN Participation p ON ds.Student_ID = p.Student_ID
JOIN Fact_Exam fe ON p.Participation_ID = fe.Participation_ID
JOIN Fact_Scores fs ON fe.Exam_ID = fs.Exam_ID
WHERE fe.Assessment_Date = (
    SELECT MAX(fe2.Assessment_Date)
    FROM Fact_Exam fe2
)
AND fs.Score < 50;

--8. Show students who didn't attend any of the events
SELECT ds.Student_ID, ds.First_Name, ds.Last_Name
FROM Dim_Student ds
LEFT JOIN EventParticipation ep ON ds.Student_ID = ep.Student_ID
WHERE ep.Student_ID IS NULL;

--9. Show students participating in the last activity
SELECT ds.Student_ID, ds.First_Name, ds.Last_Name, fe.Event_Name, fe.Date_Time
FROM Dim_Student ds
JOIN EventParticipation ep ON ds.Student_ID = ep.Student_ID
JOIN Fact_Events fe ON ep.EventParticipation_ID = fe.Event_ID
WHERE fe.Date_Time = (
    SELECT MAX(Date_Time)
    FROM Fact_Events
);

--10. Show all courses in which the student is enrolled, by instructor
SELECT ds.Student_ID, ds.First_Name, ds.Last_Name, dc.Course_Name, dt.First_Name AS Teacher_First_Name, dt.Last_Name AS Teacher_Last_Name
FROM Dim_Student ds
JOIN Participation p ON ds.Student_ID = p.Student_ID
JOIN Dim_Course dc ON p.Course_ID = dc.Course_ID
JOIN Dim_Teacher dt ON dc.Teacher_ID = dt.Teacher_ID
ORDER BY ds.Student_ID, dc.Course_Name;

--11. Show all extracurricular activities in which students participated in the last 6 months
SELECT ds.Student_ID, ds.First_Name, ds.Last_Name
FROM Dim_Student ds
LEFT JOIN EventParticipation ep ON ds.Student_ID = ep.Student_ID
WHERE ep.Student_ID IS NULL;