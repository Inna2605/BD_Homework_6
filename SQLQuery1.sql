USE Academy
GO

DROP TABLE Subjects
GO
--10.Дисципліни (Subjects)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор дисципліни.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Назва (Name). Назва дисципліни.
--? Тип даних — nvarchar(100).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.

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
--11.Викладачі (Teachers)
--¦ Ідентифікатор (Id). нікальний ідентифікатор викладача.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Професор (IsProfessor). Чи є викладач професором.
--? Тип даних — bit.
--? Не може містити null-значення.
--? Значення за замовчуванням — 0.
--¦ Ім’я (Name). Ім’я викладача.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
--¦ Ставка (Salary). Ставка викладача.
--? Тип даних — money.
--? Не може містити null-значення.
--? Не може бути менше або рівне 0.
--¦ Прізвище (Surname). Прізвище викладача.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не может буть порожнім.
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
INSERT INTO Teachers VALUES ('Андрій', 'Літовкін', 850, 0)
INSERT INTO Teachers VALUES ('Вадим', 'Пономаренко', 690, 0)
INSERT INTO Teachers VALUES ('Олена', 'Коротка', 1030, 1)
INSERT INTO Teachers VALUES ('Валерія', 'Лоскутова', 650, 0)
INSERT INTO Teachers VALUES ('Валерій', 'Безкровний', 560, 0)
INSERT INTO Teachers VALUES ('Андрій', 'Горяной', 1045, 1)
INSERT INTO Teachers VALUES ('Костянтин', 'Науменко', 1100, 1)
GO
--8. Лекції (Lectures)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор лекції.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Дата проведення (Date). Дата проведення лекції.
--? Тип даних — date.
--? Не може містити null-значення.
--? Не може бути більше поточної дати.
--¦ Ідентифікатор дисципліни (SubjectId). Дисципліна, по якій читається лекція.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
--¦ Ідентифікатор викладача (TeacherId). Викладач, який читає лекцію.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
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
--6. Групи та лекції (GroupsLectures)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор групи та лекції.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Ідентифікатор групи (GroupId). Група.
--? Тип даних– int.
--? Не може містити null-значення.
--? Зовнішній ключ.
--¦ Ідентифікатор лекції (LectureId). Лекція.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
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
--9. Студенти (Students)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор студентів.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Ім’я (Name). Ім’я студента..
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
--¦ Рейтинг (Rating). Рейтинг студента.
--? Тип даних — int.
--? Не може містити null-значення.
--? Має бути в діапазоні від 0 до 5.
--¦ Прізвище (Surname). Прізвище студента.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
CREATE TABLE Students
(
id int primary key identity(1,1) not null,
Name nvarchar(max) not null default '---',
Surname nvarchar(max) not null default '---',
Rating int not null CHECK (Rating >= 0 and Rating <= 5)
)
GO
INSERT INTO Students VALUES ('Дмитро', 'Галушко', 5)
INSERT INTO Students VALUES ('Карина', 'Борщ', 4)
INSERT INTO Students VALUES ('Назарій', 'Білоус', 3)
INSERT INTO Students VALUES ('Владислав', 'Мазурик', 0)
INSERT INTO Students VALUES ('Юрій', 'Заріцький', 1)
INSERT INTO Students VALUES ('Олексій', 'Касьяненко', 3)
INSERT INTO Students VALUES ('Світлана', 'Череда', 2)
GO
SELECT * FROM Students
GO
--7. Групи та студенти (GroupsStudents)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор групи та студенти.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Ідентифікатор групи (GroupId). Група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
--¦ Ідентифікатор студента (StudentId). Студент.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
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
--1. Куратори (Curators)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор куратора.
--? Тип даних — int.
--? Авто збільшення .
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Ім’я (Name). Ім’я куратора.
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
--¦ Прізвище (Surname). Прізвище куратора
--? Тип даних — nvarchar(max).
--? Не може містити null-значення.
--? Не може бути порожнім.
DROP TABLE Curators
GO
CREATE TABLE Curators
(
id int primary key identity(1,1) not null,
Name nvarchar(max) not null default'---',
Surname nvarchar(max) not null default'---'
)
GO
INSERT INTO Curators VALUES ('Володимир', 'Задорожний')
INSERT INTO Curators VALUES ('Ірина', 'Гунько')
INSERT INTO Curators VALUES ('Олексій', 'Юрченко')
INSERT INTO Curators VALUES ('Анастасія', 'Петренко')
INSERT INTO Curators VALUES ('Катерина', 'Федорова')
INSERT INTO Curators VALUES ('Дар`я', 'Самохвалова')
INSERT INTO Curators VALUES ('Костянтин', 'Науменко')
GO
SELECT * FROM Curators
GO
--5. Групи та куратори (GroupsCurators)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор групи та куратора.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Ідентифікатор куратора (CuratorId). Куратор.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
--¦ Ідентифікатор групи (GroupId). Група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
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
--3. Факультети (Faculties)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор факультету.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Назва (Name). Назва факультету.
--? Тип даних — nvarchar(100).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
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
--2. Кафедри (Departments)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор кафедри.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Корпус (Building). Номер корпусу, в якому розташована кафедра.
--? Тип даних — int.
--? Не може містити null-значення.
--? Має бути в діапазоні від 1 до 5.
--¦ Фінансування (Financing). Фонд фінансування кафедри.
--? Тип даних — money.
--? Не може містити null-значення.
--? Не може бути менше ніж 0.
--? Значення за замовчуванням — 0.
--¦ Назва (Name). Назва кафедри.
--? Тип даних — nvarchar(100).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
--¦ Ідентифікатор факультету (FacultyId). Факультет, до
--складу якого належить кафедра.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
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
--4. Групи (Groups)
--¦ Ідентифікатор (Id). Унікальний ідентифікатор.
--? Тип даних — int.
--? Авто збільшення.
--? Не може містити null-значення.
--? Первинний ключ.
--¦ Назва (Name). Назва групи.
--? Тип даних — nvarchar(10).
--? Не може містити null-значення.
--? Не може бути порожнім.
--? Має бути унікальним.
--¦ Курс (Year). Курс (рік) на якому навчається група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Має бути в діапазоні від 1 до 5.
--¦ Ідентифікатор кафедри (DepartmentId). Кафедра, до
--складу якої належить група.
--? Тип даних — int.
--? Не може містити null-значення.
--? Зовнішній ключ.
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
--1. Вивести номери корпусів, якщо сумарний фонд фінансування розташованих 
--у них кафедр перевищує 10 000.
SELECT Departments.Building FROM Departments
GROUP BY Departments.Building
HAVING SUM(Departments.Financing) > 10000;
GO
--2. Вивести назви груп 3-го курсу кафедри “Software Development”,
--які мають хочаб 1 пару на перший тиждень.
SELECT Groups.Name, Lectures.Date FROM Groups, GroupsLectures, Lectures, Departments
WHERE Groups.Year = 3 and Departments.id = Groups.DepartmentId
and Groups.id = GroupsLectures.GroupId and Lectures.id = GroupsLectures.LectureId
  AND Departments.Name = 'Software Development'
  AND Lectures.Date >= '1997-01-01' AND Lectures.Date <= '2023-12-07'
GROUP BY Groups.id, Groups.Name, Lectures.Date
HAVING COUNT(Lectures.id) >= 1;
GO
--3. Вивести назви груп, які мають рейтинг (середній рейтинг
--усіх студентів групи) більший, ніж рейтинг групи “PH541”.
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
--4. Вивести прізвища та імена викладачів, ставка яких вища
--за середню ставку професорів.
SELECT CONCAT (Teachers.Name, ' ' ,Teachers.Surname) as Teachers, Teachers.Salary
FROM Teachers GROUP BY Teachers.Name, Teachers.Surname, Teachers.Salary
HAVING AVG(Teachers.Salary) > (SELECT AVG(Teachers.Salary) FROM Teachers
WHERE Teachers.IsProfessor = 1)
GO
--5. Вивести назви груп, які мають одного куратора.
SELECT Groups.Name, CONCAT (Curators.Name, ' ' ,Curators.Surname) as Curators
FROM Groups, GroupsCurators, Curators
WHERE Groups.id = GroupsCurators.GroupId and Curators.id = GroupsCurators.CuratorId
GROUP BY Curators.Name, Curators.Surname, Groups.Name
HAVING COUNT (Curators.id) = 1
GO
--6. Вивести назви груп, які мають рейтинг (середній рейтинг
--усіх студентів групи) менший, ніж мінімальний рейтинг
--груп 3-го курсу.
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
--7. Вивести назви факультетів, сумарний фонд фінансування кафедр яких більший за 
--сумарний фонд фінансування кафедр факультету “Psychology”.
SELECT Faculties.Name, SUM(Departments.Financing) as Financing
FROM Faculties, Departments
WHERE Faculties.id = Departments.FacultyId
GROUP BY Faculties.Name, Departments.Financing
HAVING SUM(Departments.Financing) < (SELECT SUM(Departments.Financing) 
FROM Departments, Faculties 
WHERE Faculties.id = Departments.FacultyId and Faculties.Name = 'Psychology')
GO
--8. Вивести назви дисциплін та повні імена викладачів, які
--читають по одній лекцій з них.
SELECT Subjects.Name, CONCAT (Teachers.Name, ' ' ,Teachers.Surname) as Teachers
FROM Subjects, Lectures, Teachers
WHERE Subjects.id = Lectures.SubjectId and Teachers.id = Lectures.TeacherId
GROUP BY Subjects.Name, Teachers.Name, Teachers.Surname
HAVING COUNT (Subjects.Name) = 1
GO
--9. Вивести назву дисципліни, за якою читається найменше лекцій.
SELECT Subjects.Name FROM Subjects, Lectures
WHERE Subjects.id = Lectures.SubjectId
GROUP BY Subjects.Name, Subjects.id, Lectures.id
HAVING COUNT(Lectures.id) = (SELECT MIN(LectureCount)
FROM (SELECT SubjectId, COUNT(id) as LectureCount
FROM Lectures GROUP BY SubjectId) AS LectureCounts)
GO
--10. Вивести кількість студентів та дисциплін, що читаються
--на кафедрі “Software Development”.
SELECT Departments.Name, COUNT(Students.id) as CountStudents, 
Count(Subjects.id) as CountSubjects
FROM Subjects, Lectures, GroupsLectures, Groups, Departments, Students, GroupsStudents
WHERE Subjects.id = Lectures.SubjectId and Lectures.id = GroupsLectures.LectureId
and Groups.id = GroupsLectures.GroupId and Departments.id = Groups.DepartmentId
and Students.id = GroupsStudents.StudentId and Groups.id = GroupsStudents.GroupId
GROUP BY Students.id, Subjects.id, Departments.Name
HAVING Departments.Name = 'Software Development'