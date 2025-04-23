CREATE TABLE LanguageLevel (
    LanguageLevel number PRIMARY KEY
);

CREATE TABLE Dim_Teacher (
    Teacher_ID number PRIMARY KEY,
    First_Name varchar2(25),
    Last_Name varchar2(25),
    Email varchar2(25),
    Phone_Number number,
    Hire_Date date,
    Birth_Date date
);

CREATE TABLE Dim_Course (
    Course_ID number PRIMARY KEY,
    LanguageLevel number,
    Teacher_ID number,
    Course_Name varchar2(25),
    Price number,
    Duration varchar2(255),
    Description varchar2(255),
    FOREIGN KEY (LanguageLevel) REFERENCES LanguageLevel(LanguageLevel),
    FOREIGN KEY (Teacher_ID) REFERENCES Dim_Teacher(Teacher_ID)
);

CREATE TABLE Dim_Student (
    Student_ID number PRIMARY KEY,
    First_Name varchar2(25),
    Last_Name varchar2(25),
    Birth_Date date,
    Email varchar2(25),
    Phone_Number number,
    Enrollment_Date date
);

CREATE TABLE Participation (
    Participation_ID number PRIMARY KEY,
    Student_ID number,
    Course_ID number,
    FOREIGN KEY (Student_ID) REFERENCES Dim_Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Dim_Course(Course_ID)
);

CREATE TABLE Fact_Exam (
    Exam_ID number PRIMARY KEY,
    Assessment_Date date,
    Participation_ID number,
    FOREIGN KEY (Participation_ID) REFERENCES Participation(Participation_ID)
);

CREATE TABLE ResultRules (
    Result number PRIMARY KEY,
    Min_score number,
    Max_score number
);

CREATE TABLE Fact_Scores (
    Score_ID number PRIMARY KEY,
    Exam_ID number,
    Score number,
    FOREIGN KEY (Exam_ID) REFERENCES Fact_Exam(Exam_ID)
);

CREATE TABLE Fact_Events (
    Event_ID number PRIMARY KEY,
    Date_Time date,
    Event_Name varchar2(25),
    Description varchar2(255)
);

CREATE TABLE EventParticipation (
    EventParticipation_ID number PRIMARY KEY,
    Student_ID number,
    FOREIGN KEY (Student_ID) REFERENCES Dim_Student(Student_ID)
);

CREATE TABLE Fact_Extra_Curricular_Activities (
    Activity_ID number PRIMARY KEY,
    Student_ID number,
    Date_Time date,
    Activity_Name varchar2(25),
    Description varchar2(255),
    FOREIGN KEY (Student_ID) REFERENCES Dim_Student(Student_ID)
);

--LanguageLevel
INSERT INTO LanguageLevel (LanguageLevel) VALUES (1);
INSERT INTO LanguageLevel (LanguageLevel) VALUES (2);
INSERT INTO LanguageLevel (LanguageLevel) VALUES (3);
INSERT INTO LanguageLevel (LanguageLevel) VALUES (4);
INSERT INTO LanguageLevel (LanguageLevel) VALUES (5);

--Dim_Teacher
INSERT INTO Dim_Teacher (Teacher_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Birth_Date)
VALUES (1, 'John', 'Doe', 'johndoe@dobry.com', 1234567890, TO_DATE('2015-01-10', 'YYYY-MM-DD'), TO_DATE('1980-05-15', 'YYYY-MM-DD'));
INSERT INTO Dim_Teacher (Teacher_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Birth_Date)
VALUES (2, 'Jane', 'Smith', 'janesmith@dobry.com', 1234567891, TO_DATE('2018-03-12', 'YYYY-MM-DD'), TO_DATE('1985-08-20', 'YYYY-MM-DD'));
INSERT INTO Dim_Teacher (Teacher_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Birth_Date)
VALUES (3, 'Michael', 'Johnson', 'michaeljohnson@dobry.com', 1234567892, TO_DATE('2019-04-22', 'YYYY-MM-DD'), TO_DATE('1982-11-30', 'YYYY-MM-DD'));
INSERT INTO Dim_Teacher (Teacher_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Birth_Date)
VALUES (4, 'Emily', 'Davis', 'emilydavis@dobry.com', 1234567893, TO_DATE('2020-05-18', 'YYYY-MM-DD'), TO_DATE('1990-02-14', 'YYYY-MM-DD'));
INSERT INTO Dim_Teacher (Teacher_ID, First_Name, Last_Name, Email, Phone_Number, Hire_Date, Birth_Date)
VALUES (5, 'Sophia', 'Wilson', 'sophiawilson@dobry.com', 1234567894, TO_DATE('2021-07-11', 'YYYY-MM-DD'), TO_DATE('1987-06-22', 'YYYY-MM-DD'));

--Dim_Course
INSERT INTO Dim_Course (Course_ID, LanguageLevel, Teacher_ID, Course_Name, Price, Duration, Description)
VALUES (1, 1, 1, 'English 101', 500, '10 weeks', 'Basic English course');
INSERT INTO Dim_Course (Course_ID, LanguageLevel, Teacher_ID, Course_Name, Price, Duration, Description)
VALUES (2, 2, 2, 'Advanced English', 700, '12 weeks', 'Advanced level English course');
INSERT INTO Dim_Course (Course_ID, LanguageLevel, Teacher_ID, Course_Name, Price, Duration, Description)
VALUES (3, 3, 3, 'French 101', 600, '10 weeks', 'Basic French course');
INSERT INTO Dim_Course (Course_ID, LanguageLevel, Teacher_ID, Course_Name, Price, Duration, Description)
VALUES (4, 4, 4, 'Spanish 101', 650, '10 weeks', 'Basic Spanish course');
INSERT INTO Dim_Course (Course_ID, LanguageLevel, Teacher_ID, Course_Name, Price, Duration, Description)
VALUES (5, 5, 5, 'German 101', 700, '10 weeks', 'Basic German course');

--Dim_Student
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (1, 'Alice', 'Brown', TO_DATE('2000-02-20', 'YYYY-MM-DD'), 'alicebrown@dobry.com', 9876543210, TO_DATE('2020-09-01', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (2, 'Bob', 'White', TO_DATE('1998-07-10', 'YYYY-MM-DD'), 'bobwhite@dobry.com', 9876543211, TO_DATE('2021-09-01', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (3, 'Charlie', 'Green', TO_DATE('2001-03-15', 'YYYY-MM-DD'), 'charliegreen@dobry.com', 9876543212, TO_DATE('2022-08-01', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (4, 'David', 'Black', TO_DATE('1999-12-25', 'YYYY-MM-DD'), 'davidblack@dobry.com', 9876543213, TO_DATE('2023-01-15', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (5, 'Eva', 'White', TO_DATE('2002-07-18', 'YYYY-MM-DD'), 'evawhite@dobry.com', 9876543214, TO_DATE('2023-05-20', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (6, 'Fiona', 'Brown', TO_DATE('2003-01-05', 'YYYY-MM-DD'), 'fionabrown@dobry.com', 9876543215, TO_DATE('2022-09-01', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (7, 'George', 'Wilson', TO_DATE('1997-11-12', 'YYYY-MM-DD'), 'georgewilson@dobry.com', 9876543216, TO_DATE('2023-02-10', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (8, 'Hannah', 'Clark', TO_DATE('1996-08-24', 'YYYY-MM-DD'), 'hannahclark@dobry.com', 9876543217, TO_DATE('2021-05-15', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (9, 'Ian', 'Lewis', TO_DATE('2004-04-03', 'YYYY-MM-DD'), 'ianlewis@dobry.com', 9876543218, TO_DATE('2022-07-21', 'YYYY-MM-DD'));
INSERT INTO Dim_Student (Student_ID, First_Name, Last_Name, Birth_Date, Email, Phone_Number, Enrollment_Date)
VALUES (10, 'Julia', 'Walker', TO_DATE('2002-12-01', 'YYYY-MM-DD'), 'juliawalker@dobry.com', 9876543219, TO_DATE('2020-03-10', 'YYYY-MM-DD'));

--Participation
INSERT INTO Participation (Participation_ID, Student_ID, Course_ID)
VALUES (1, 1, 1);
INSERT INTO Participation (Participation_ID, Student_ID, Course_ID)
VALUES (2, 2, 2);
INSERT INTO Participation (Participation_ID, Student_ID, Course_ID)
VALUES (3, 3, 3);
INSERT INTO Participation (Participation_ID, Student_ID, Course_ID)
VALUES (4, 4, 4);
INSERT INTO Participation (Participation_ID, Student_ID, Course_ID)
VALUES (5, 5, 5);
INSERT INTO Participation (Participation_ID, Student_ID, Course_ID)
VALUES (6, 6, 1);
INSERT INTO Participation (Participation_ID, Student_ID, Course_ID)
VALUES (7, 7, 2);

--Fact_Exam
INSERT INTO Fact_Exam (Exam_ID, Assessment_Date, Participation_ID)
VALUES (1, TO_DATE('2022-01-15', 'YYYY-MM-DD'), 1);
INSERT INTO Fact_Exam (Exam_ID, Assessment_Date, Participation_ID)
VALUES (2, TO_DATE('2022-02-15', 'YYYY-MM-DD'), 2);
INSERT INTO Fact_Exam (Exam_ID, Assessment_Date, Participation_ID)
VALUES (3, TO_DATE('2023-01-15', 'YYYY-MM-DD'), 3);
INSERT INTO Fact_Exam (Exam_ID, Assessment_Date, Participation_ID)
VALUES (4, TO_DATE('2023-02-15', 'YYYY-MM-DD'), 4);
INSERT INTO Fact_Exam (Exam_ID, Assessment_Date, Participation_ID)
VALUES (5, TO_DATE('2023-03-15', 'YYYY-MM-DD'), 5);
INSERT INTO Fact_Exam (Exam_ID, Assessment_Date, Participation_ID)
VALUES (6, TO_DATE('2023-04-15', 'YYYY-MM-DD'), 6);
INSERT INTO Fact_Exam (Exam_ID, Assessment_Date, Participation_ID)
VALUES (7, TO_DATE('2023-05-15', 'YYYY-MM-DD'), 7);

--ResultRules
INSERT INTO ResultRules (Result, Min_score, Max_score)
VALUES (1, 50, 100);
INSERT INTO ResultRules (Result, Min_score, Max_score)
VALUES (2, 0, 49);

--Fact_Scores
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (1, 1, 85);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (2, 2, 78);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (3, 1, 95);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (4, 2, 92);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (5, 1, 45);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (6, 2, 40);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (7, 3, 75);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (8, 4, 82);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (9, 5, 55);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (10, 6, 48);
INSERT INTO Fact_Scores (Score_ID, Exam_ID, Score)
VALUES (11, 7, 95);

--Fact_Events
INSERT INTO Fact_Events (Event_ID, Date_Time, Event_Name, Description)
VALUES (1, TO_DATE('2023-05-20', 'YYYY-MM-DD'), 'Science Fair', 'Annual science fair event');
INSERT INTO Fact_Events (Event_ID, Date_Time, Event_Name, Description)
VALUES (2, TO_DATE('2023-06-15', 'YYYY-MM-DD'), 'Sports Day', 'Annual sports day event');
INSERT INTO Fact_Events (Event_ID, Date_Time, Event_Name, Description)
VALUES (3, TO_DATE('2023-07-20', 'YYYY-MM-DD'), 'Art Exhibition', 'Annual art exhibition');
INSERT INTO Fact_Events (Event_ID, Date_Time, Event_Name, Description)
VALUES (4, TO_DATE('2023-08-15', 'YYYY-MM-DD'), 'Music Concert', 'Annual music concert');
INSERT INTO Fact_Events (Event_ID, Date_Time, Event_Name, Description)
VALUES (5, TO_DATE('2023-09-10', 'YYYY-MM-DD'), 'Drama Play', 'Annual drama play');
INSERT INTO Fact_Events (Event_ID, Date_Time, Event_Name, Description)
VALUES (6, TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'Tech Talk', 'Annual tech talk');
INSERT INTO Fact_Events (Event_ID, Date_Time, Event_Name, Description)
VALUES (7, TO_DATE('2023-11-01', 'YYYY-MM-DD'), 'Cultural Fest', 'Annual cultural festival');

--EventParticipation
INSERT INTO EventParticipation (EventParticipation_ID, Student_ID)
VALUES (1, 1);
INSERT INTO EventParticipation (EventParticipation_ID, Student_ID)
VALUES (2, 2);
INSERT INTO EventParticipation (EventParticipation_ID, Student_ID)
VALUES (3, 3);
INSERT INTO EventParticipation (EventParticipation_ID, Student_ID)
VALUES (4, 4);
INSERT INTO EventParticipation (EventParticipation_ID, Student_ID)
VALUES (5, 5);
INSERT INTO EventParticipation (EventParticipation_ID, Student_ID)
VALUES (6, 6);
INSERT INTO EventParticipation (EventParticipation_ID, Student_ID)
VALUES (7, 7);

--Fact_Extra_Curricular_Activities
INSERT INTO Fact_Extra_Curricular_Activities (Activity_ID, Student_ID, Date_Time, Activity_Name, Description)
VALUES (1, 1, TO_DATE('2023-04-10', 'YYYY-MM-DD'), 'Debate Club', 'Participation in debate club');
INSERT INTO Fact_Extra_Curricular_Activities (Activity_ID, Student_ID, Date_Time, Activity_Name, Description)
VALUES (2, 2, TO_DATE('2023-04-12', 'YYYY-MM-DD'), 'Music Club', 'Participation in music club');
INSERT INTO Fact_Extra_Curricular_Activities (Activity_ID, Student_ID, Date_Time, Activity_Name, Description)
VALUES (3, 3, TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Chess Club', 'Participation in chess club');
INSERT INTO Fact_Extra_Curricular_Activities (Activity_ID, Student_ID, Date_Time, Activity_Name, Description)
VALUES (4, 4, TO_DATE('2023-07-12', 'YYYY-MM-DD'), 'Science Club', 'Participation in science club');
INSERT INTO Fact_Extra_Curricular_Activities (Activity_ID, Student_ID, Date_Time, Activity_Name, Description)
VALUES (5, 5, TO_DATE('2023-08-14', 'YYYY-MM-DD'), 'Art Club', 'Participation in art club');
INSERT INTO Fact_Extra_Curricular_Activities (Activity_ID, Student_ID, Date_Time, Activity_Name, Description)
VALUES (6, 6, TO_DATE('2023-09-16', 'YYYY-MM-DD'), 'Drama Club', 'Participation in drama club');
INSERT INTO Fact_Extra_Curricular_Activities (Activity_ID, Student_ID, Date_Time, Activity_Name, Description)
VALUES (7, 7, TO_DATE('2023-10-18', 'YYYY-MM-DD'), 'Tech Club', 'Participation in tech club');
