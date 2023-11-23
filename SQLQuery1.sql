USE Academy
GO

DROP TABLE Subjects
GO
--10.��������� (Subjects)
--� ������������� (Id). ��������� ������������� ���������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ����� (Name). ����� ���������.
--? ��� ����� � nvarchar(100).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--? �� ���� ���������.

CREATE TABLE Subjects
(
id int identity(1,1)not null primary key,
Name nvarchar(100) not null default('---') unique,
)
GO
INSERT INTO Subjects VALUES ('Mathematics')
INSERT INTO Subjects VALUES ('Physics')
INSERT INTO Subjects VALUES ('Programming')
INSERT INTO Subjects VALUES ('History')
INSERT INTO Subjects VALUES ('Foreign Language')
INSERT INTO Subjects VALUES ('Ukrainian language')
INSERT INTO Subjects VALUES ('Economy')
GO
SELECT * FROM Subjects
GO
--11.��������� (Teachers)
--� ������������� (Id). �������� ������������� ���������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� �������� (IsProfessor). �� � �������� ����������.
--? ��� ����� � bit.
--? �� ���� ������ null-��������.
--? �������� �� ������������� � 0.
--� ��� (Name). ��� ���������.
--? ��� ����� � nvarchar(max).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--� ������ (Salary). ������ ���������.
--? ��� ����� � money.
--? �� ���� ������ null-��������.
--? �� ���� ���� ����� ��� ���� 0.
--� ������� (Surname). ������� ���������.
--? ��� ����� � nvarchar(max).
--? �� ���� ������ null-��������.
--? �� ����� ���� �������.
DROP TABLE Teachers
GO
CREATE TABLE Teachers
(
id int primary key identity(1,1) not null,
Name nvarchar(max) not null default('---'),
Surname nvarchar(max) not null default('---'),
Salary money not null CHECK(Salary >= 0 and Salary != 0),
IsProfessor bit not null default(0)
)
GO
INSERT INTO Teachers VALUES ('�����', '˳�����', 850, 0)
INSERT INTO Teachers VALUES ('�����', '�����������', 690, 0)
INSERT INTO Teachers VALUES ('�����', '�������', 1030, 1)
INSERT INTO Teachers VALUES ('������', '���������', 650, 0)
INSERT INTO Teachers VALUES ('������', '����������', 560, 0)
INSERT INTO Teachers VALUES ('�����', '�������', 1045, 1)
INSERT INTO Teachers VALUES ('���������', '��������', 1100, 1)
GO
--8. ������ (Lectures)
--� ������������� (Id). ��������� ������������� ������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ���� ���������� (Date). ���� ���������� ������.
--? ��� ����� � date.
--? �� ���� ������ null-��������.
--? �� ���� ���� ����� ������� ����.
--� ������������� ��������� (SubjectId). ���������, �� ��� �������� ������.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
--� ������������� ��������� (TeacherId). ��������, ���� ���� ������.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
DROP TABLE Lectures
GO
CREATE TABLE Lectures
(
id int primary key identity(1,1) not null,
Date date not null CHECK (Date <= GETDATE()),
SubjectId int not null foreign key references Subjects(id),
TeacherId int not null foreign key references Teachers(id)
)
GO
INSERT INTO Lectures VALUES ('2007-10-25', 1, 3)
INSERT INTO Lectures VALUES ('2000-05-03', 2, 5)
INSERT INTO Lectures VALUES ('2013-11-29', 3, 2)
INSERT INTO Lectures VALUES ('2020-03-01', 4, 1)
INSERT INTO Lectures VALUES ('2022-01-16', 5, 4)
INSERT INTO Lectures VALUES ('2003-09-30', 6, 7)
INSERT INTO Lectures VALUES ('1997-02-28', 7, 6)
GO
SELECT * FROM Lectures
GO
--6. ����� �� ������ (GroupsLectures)
--� ������������� (Id). ��������� ������������� ����� �� ������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ������������� ����� (GroupId). �����.
--? ��� ������ int.
--? �� ���� ������ null-��������.
--? ������� ����.
--� ������������� ������ (LectureId). ������.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
DROP TABLE GroupsLectures
GO
CREATE TABLE GroupsLectures
(
id int primary key identity(1,1) not null,
GroupId int not null foreign key references Groups(id),
LectureId int not null foreign key references Lectures(id)
)
GO
INSERT INTO GroupsLectures VALUES (1, 7)
INSERT INTO GroupsLectures VALUES (2, 4)
INSERT INTO GroupsLectures VALUES (3, 5)
INSERT INTO GroupsLectures VALUES (4, 6)
INSERT INTO GroupsLectures VALUES (5, 1)
INSERT INTO GroupsLectures VALUES (6, 3)
INSERT INTO GroupsLectures VALUES (7, 2)
GO
SELECT * FROM GroupsLectures
GO
--9. �������� (Students)
--� ������������� (Id). ��������� ������������� ��������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ��� (Name). ��� ��������..
--? ��� ����� � nvarchar(max).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--� ������� (Rating). ������� ��������.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? �� ���� � ������� �� 0 �� 5.
--� ������� (Surname). ������� ��������.
--? ��� ����� � nvarchar(max).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
CREATE TABLE Students
(
id int primary key identity(1,1) not null,
Name nvarchar(max) not null default '---',
Surname nvarchar(max) not null default '---',
Rating int not null CHECK (Rating >= 0 and Rating <= 5)
)
GO
INSERT INTO Students VALUES ('������', '�������', 5)
INSERT INTO Students VALUES ('������', '����', 4)
INSERT INTO Students VALUES ('������', '������', 3)
INSERT INTO Students VALUES ('���������', '�������', 0)
INSERT INTO Students VALUES ('���', '��������', 1)
INSERT INTO Students VALUES ('������', '����������', 3)
INSERT INTO Students VALUES ('�������', '������', 2)
GO
SELECT * FROM Students
GO
--7. ����� �� �������� (GroupsStudents)
--� ������������� (Id). ��������� ������������� ����� �� ��������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ������������� ����� (GroupId). �����.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
--� ������������� �������� (StudentId). �������.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
CREATE TABLE GroupsStudents
(
id int primary key identity(1,1) not null,
GroupId int not null foreign key references Groups(id),
StudentId int not null foreign key references Students(id)
)
GO
INSERT INTO GroupsStudents VALUES (1, 5)
INSERT INTO GroupsStudents VALUES (2, 4)
INSERT INTO GroupsStudents VALUES (3, 7)
INSERT INTO GroupsStudents VALUES (4, 6)
INSERT INTO GroupsStudents VALUES (5, 1)
INSERT INTO GroupsStudents VALUES (6, 3)
INSERT INTO GroupsStudents VALUES (7, 2)
GO
SELECT * FROM GroupsStudents
GO
--1. �������� (Curators)
--� ������������� (Id). ��������� ������������� ��������.
--? ��� ����� � int.
--? ���� ��������� .
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ��� (Name). ��� ��������.
--? ��� ����� � nvarchar(max).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--� ������� (Surname). ������� ��������
--? ��� ����� � nvarchar(max).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
DROP TABLE Curators
GO
CREATE TABLE Curators
(
id int primary key identity(1,1) not null,
Name nvarchar(max) not null default'---',
Surname nvarchar(max) not null default'---'
)
GO
INSERT INTO Curators VALUES ('���������', '����������')
INSERT INTO Curators VALUES ('�����', '������')
INSERT INTO Curators VALUES ('������', '�������')
INSERT INTO Curators VALUES ('��������', '��������')
INSERT INTO Curators VALUES ('��������', '��������')
INSERT INTO Curators VALUES ('���`�', '�����������')
INSERT INTO Curators VALUES ('���������', '��������')
GO
SELECT * FROM Curators
GO
--5. ����� �� �������� (GroupsCurators)
--� ������������� (Id). ��������� ������������� ����� �� ��������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ������������� �������� (CuratorId). �������.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
--� ������������� ����� (GroupId). �����.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
DROP TABLE GroupsCurators
GO
CREATE TABLE GroupsCurators
(
id int primary key identity(1,1) not null,
CuratorId int not null foreign key references Curators(id),
GroupId int not null foreign key references Groups(id)
)
GO
INSERT INTO GroupsCurators VALUES (1, 7)
INSERT INTO GroupsCurators VALUES (2, 2)
INSERT INTO GroupsCurators VALUES (3, 5)
INSERT INTO GroupsCurators VALUES (4, 3)
INSERT INTO GroupsCurators VALUES (5, 6)
INSERT INTO GroupsCurators VALUES (6, 1)
INSERT INTO GroupsCurators VALUES (7, 4)
GO
SELECT * FROM GroupsCurators
GO
--3. ���������� (Faculties)
--� ������������� (Id). ��������� ������������� ����������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ����� (Name). ����� ����������.
--? ��� ����� � nvarchar(100).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--? �� ���� ���������.
DROP TABLE Faculties
GO
CREATE TABLE Faculties
(
id int primary key identity(1,1) not null,
Name nvarchar(100) not null default '---' unique
)
GO
INSERT INTO Faculties VALUES ('Technological')
INSERT INTO Faculties VALUES ('Economic')
INSERT INTO Faculties VALUES ('Energy')
INSERT INTO Faculties VALUES ('Psychology')
INSERT INTO Faculties VALUES ('Architecture')
INSERT INTO Faculties VALUES ('Computer Science')
INSERT INTO Faculties VALUES ('Mathematics')
GO
SELECT * FROM Faculties
GO
--2. ������� (Departments)
--� ������������� (Id). ��������� ������������� �������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ������ (Building). ����� �������, � ����� ����������� �������.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? �� ���� � ������� �� 1 �� 5.
--� Գ���������� (Financing). ���� ������������ �������.
--? ��� ����� � money.
--? �� ���� ������ null-��������.
--? �� ���� ���� ����� �� 0.
--? �������� �� ������������� � 0.
--� ����� (Name). ����� �������.
--? ��� ����� � nvarchar(100).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--? �� ���� ���������.
--� ������������� ���������� (FacultyId). ���������, ��
--������ ����� �������� �������.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
DROP TABLE Departments
GO
CREATE TABLE Departments
(
id int primary key identity(1, 1) not null,
Building int not null Check(Building > 0 and Building <= 5),
Financing money not null check(Financing >= 0) default(0),
Name nvarchar(100) not null default('---') unique,
FacultyId int  not null foreign key references Faculties(id)
)
GO
INSERT INTO Departments VALUES (1, 36200, 'Mathematical', 7)
INSERT INTO Departments VALUES (5, 16500, 'Historical', 4)
INSERT INTO Departments VALUES (3, 10900, 'Foreign language', 6)
INSERT INTO Departments VALUES (1, 21600, 'Physics', 7)
INSERT INTO Departments VALUES (3, 34300, 'Software Development', 6)
INSERT INTO Departments VALUES (4, 7900, 'Economy', 2)
INSERT INTO Departments VALUES (2, 9900, 'Psychology', 4)
GO
SELECT * FROM Departments
GO
--4. ����� (Groups)
--� ������������� (Id). ��������� �������������.
--? ��� ����� � int.
--? ���� ���������.
--? �� ���� ������ null-��������.
--? ��������� ����.
--� ����� (Name). ����� �����.
--? ��� ����� � nvarchar(10).
--? �� ���� ������ null-��������.
--? �� ���� ���� �������.
--? �� ���� ���������.
--� ���� (Year). ���� (��) �� ����� ��������� �����.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? �� ���� � ������� �� 1 �� 5.
--� ������������� ������� (DepartmentId). �������, ��
--������ ��� �������� �����.
--? ��� ����� � int.
--? �� ���� ������ null-��������.
--? ������� ����.
DROP TABLE Groups
GO
CREATE TABLE Groups
(
id int primary key identity(1, 1) not null,
Name nvarchar(10) not null default '---' unique,
Year int not null check(Year > 0 and Year <= 5),
DepartmentId int  not null foreign key references Departments(id)
)
GO
INSERT INTO Groups VALUES ('TH545', 3, 5)
INSERT INTO Groups VALUES ('EC148', 2, 6)
INSERT INTO Groups VALUES ('EN361', 4, 3)
INSERT INTO Groups VALUES ('PH541', 5, 7)
INSERT INTO Groups VALUES ('AR505', 3, 4)
INSERT INTO Groups VALUES ('SD155', 3, 1)
INSERT INTO Groups VALUES ('PK234', 1, 2)
GO
SELECT * FROM Groups
GO
--1. ������� ������ �������, ���� �������� ���� ������������ ������������ 
--� ��� ������ �������� 10 000.
SELECT Departments.Building FROM Departments
GROUP BY Departments.Building
HAVING SUM(Departments.Financing) > 10000;
GO
--2. ������� ����� ���� 3-�� ����� ������� �Software Development�,
--�� ����� ����� 1 ���� �� ������ �������.
SELECT Groups.Name, Lectures.Date FROM Groups, GroupsLectures, Lectures, Departments
WHERE Groups.Year = 3 and Departments.id = Groups.DepartmentId
and Groups.id = GroupsLectures.GroupId and Lectures.id = GroupsLectures.LectureId
  AND Departments.Name = 'Software Development'
  AND Lectures.Date >= '1997-01-01' AND Lectures.Date <= '2023-12-07'
GROUP BY Groups.id, Groups.Name, Lectures.Date
HAVING COUNT(Lectures.id) >= 1;
GO
--3. ������� ����� ����, �� ����� ������� (������� �������
--��� �������� �����) ������, �� ������� ����� �PH541�.
SELECT Groups.Name, AVG(Students.Rating) as AVGRating FROM Groups, 
Students, GroupsLectures, Lectures
WHERE Groups.id = GroupsLectures.GroupId 
and Lectures.id = GroupsLectures.LectureId
and Students.id = Lectures.SubjectId
GROUP BY Groups.id, Groups.Name, Students.Rating, GroupsLectures.GroupId, 
Lectures.id, Lectures.SubjectId, GroupsLectures.LectureId
HAVING AVG(Students.Rating) > (SELECT AVG(Students.Rating) FROM Groups, 
Students, GroupsLectures, Lectures
WHERE Groups.id = GroupsLectures.GroupId 
and Lectures.id = GroupsLectures.LectureId
and Students.id = Lectures.SubjectId and Groups.Name = 'PH541')
GO
--4. ������� ������� �� ����� ����������, ������ ���� ����
--�� ������� ������ ���������.
SELECT CONCAT (Teachers.Name, ' ' ,Teachers.Surname) as Teachers, Teachers.Salary
FROM Teachers GROUP BY Teachers.Name, Teachers.Surname, Teachers.Salary
HAVING AVG(Teachers.Salary) > (SELECT AVG(Teachers.Salary) FROM Teachers
WHERE Teachers.IsProfessor = 1)
GO
--5. ������� ����� ����, �� ����� ������ ��������.
SELECT Groups.Name, CONCAT (Curators.Name, ' ' ,Curators.Surname) as Curators
FROM Groups, GroupsCurators, Curators
WHERE Groups.id = GroupsCurators.GroupId and Curators.id = GroupsCurators.CuratorId
GROUP BY Curators.Name, Curators.Surname, Groups.Name
HAVING COUNT (Curators.id) = 1
GO
--6. ������� ����� ����, �� ����� ������� (������� �������
--��� �������� �����) ������, �� ��������� �������
--���� 3-�� �����.
SELECT Groups.Name, Groups.Year, AVG(Students.Rating) as AVGRating
FROM Groups, GroupsLectures, Lectures, Students
WHERE Groups.id = GroupsLectures.GroupId and Lectures.id = GroupsLectures.GroupId
and Students.id = Lectures.SubjectId
GROUP BY Groups.Name, Students.Rating, Groups.Year
HAVING AVG(Students.Rating) < (SELECT MIN(Students.Rating) 
FROM Groups, GroupsLectures, Lectures, Students
WHERE Groups.id = GroupsLectures.GroupId and Lectures.id = GroupsLectures.GroupId
and Students.id = Lectures.SubjectId and Groups.Year = 3)
GO
--7. ������� ����� ����������, �������� ���� ������������ ������ ���� ������ �� 
--�������� ���� ������������ ������ ���������� �Psychology�.
SELECT Faculties.Name, SUM(Departments.Financing) as Financing
FROM Faculties, Departments
WHERE Faculties.id = Departments.FacultyId
GROUP BY Faculties.Name, Departments.Financing
HAVING SUM(Departments.Financing) < (SELECT SUM(Departments.Financing) 
FROM Departments, Faculties 
WHERE Faculties.id = Departments.FacultyId and Faculties.Name = 'Psychology')
GO
--8. ������� ����� �������� �� ���� ����� ����������, ��
--������� �� ���� ������ � ���.
SELECT Subjects.Name, CONCAT (Teachers.Name, ' ' ,Teachers.Surname) as Teachers
FROM Subjects, Lectures, Teachers
WHERE Subjects.id = Lectures.SubjectId and Teachers.id = Lectures.TeacherId
GROUP BY Subjects.Name, Teachers.Name, Teachers.Surname
HAVING COUNT (Subjects.Name) = 1
GO
--9. ������� ����� ���������, �� ���� �������� �������� ������.
SELECT Subjects.Name FROM Subjects, Lectures
WHERE Subjects.id = Lectures.SubjectId
GROUP BY Subjects.Name, Subjects.id, Lectures.id
HAVING COUNT(Lectures.id) = (SELECT MIN(LectureCount)
FROM (SELECT SubjectId, COUNT(id) as LectureCount
FROM Lectures GROUP BY SubjectId) AS LectureCounts)
GO
--10. ������� ������� �������� �� ��������, �� ���������
--�� ������ �Software Development�.
SELECT Departments.Name, COUNT(Students.id) as CountStudents, 
Count(Subjects.id) as CountSubjects
FROM Subjects, Lectures, GroupsLectures, Groups, Departments, Students, GroupsStudents
WHERE Subjects.id = Lectures.SubjectId and Lectures.id = GroupsLectures.LectureId
and Groups.id = GroupsLectures.GroupId and Departments.id = Groups.DepartmentId
and Students.id = GroupsStudents.StudentId and Groups.id = GroupsStudents.GroupId
GROUP BY Students.id, Subjects.id, Departments.Name
HAVING Departments.Name = 'Software Development'