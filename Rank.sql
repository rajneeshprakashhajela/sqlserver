CREATE TABLE [dbo].[Employee](  
    [EMPID] [nvarchar](30) NOT NULL,  
    [Name] [nvarchar](150) NULL,  
    [Salary] [money] NULL  
)   

INSERT [dbo].[Employee] ([EMPID], [Name], [Salary]) VALUES ('EMP101', 'A', 15000)  
INSERT [dbo].[Employee] ([EMPID], [Name], [Salary]) VALUES ('EMP102', 'B', 20000)  
INSERT [dbo].[Employee] ([EMPID], [Name], [Salary]) VALUES ('EMP105', 'C', 10000)  
INSERT [dbo].[Employee] ([EMPID], [Name], [Salary]) VALUES ('EMP106', 'D', 18000) 
INSERT [dbo].[Employee] ([EMPID], [Name], [Salary]) VALUES ('EMP108', 'E', 20000)  
INSERT [dbo].[Employee] ([EMPID], [Name], [Salary]) VALUES ('EMP109', 'F', 15000)  
INSERT [dbo].[Employee] ([EMPID], [Name], [Salary]) VALUES ('EMP111', 'G', 20000) 


select * from employee
select EMPID, Name,Salary,  
RANK() over (order by Salary desc) as _Rank ,
DENSE_RANK () over (order by Salary desc) as DenseRank ,  
ROW_NUMBER() over (order by Salary desc) as RowNumber from Employee  
=====
--deleting records from CTE where row number is greater than one

with empCTE as  
(  
select *, ROW_NUMBER() over(partition by EMPID order by EMPID) as rowno from Employee  
)  
select * from empCTE 
--====
with empCTE as  
(  
select *, ROW_NUMBER() over(partition by EMPID order by EMPID) as rowno from Employee  
)  
delete from empCTE where rowno>1  
select * from Employee 
=========================================
Q.3 Temptabel vs table variable

CREATE TABLE #StudentTemp
(
    StudentID int,
    Name varchar(50),
    Address varchar(150)
)
GO
INSERT INTO #StudentTemp VALUES ( 1, 'Dipendra','Pune');
GO
SELECT * FROM #StudentTemp
===========

--table variable
DECLARE @TStudent TABLE
 (
    RollNo INT IDENTITY(1,1),
    EMpID varchar(20),
    Name varchar(1),
	Salary int
 )
 --Insert data to Table variable @TStudent
 INSERT INTO @TStudent(EMpID,Name,Salary) select * from employee

 --Select data from Table variable @TStudent
 SELECT * FROM @TStudent

 ================
 --Procedure:
 CREATE PROCEDURE uspGetEmployeeList
AS
BEGIN
 select EMpID,Name,Salary from employee
END
 select EMpID,Name,Salary from employee

 select * from dept
 with CTE as
 (
 select *, row_
 )


  select EMpID,Name,Salary from employee

  alter tabl

 Create function fnGetEmpFullName
(
 @FirstName varchar(50),
 @LastName varchar(50)
)
returns varchar(101)
As
Begin return (Select @FirstName + ' '+ @LastName);
end 
--==================

Create function fnGetEmployee()
returns Table
As
 return (Select * from Employee) 
 Select * from fnGetEmployee()
 =================================
 

 drop table Course
  create table Course(CourseID int primary key, CourseName varchar(20))
 insert into Course values(1,'Computer') 
 insert into Course values(2,'English') 
 insert into Course values(3,'Math') 
 insert into Course values(4,'Advance Computer') 

 drop table Student
 create table Student(StudentID int primary key, name varchar(10),Age int)
 insert into Student values(1,'A',18)
 insert into Student values(2,'B',19)
 insert into Student values(3,'C',20)
 insert into Student values(4,'D',18)
 insert into Student values(5,'E',19)


 
  create table StudentCourse(CourseID int, CourseName varchar(20), StudentID int,
  FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
  FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
  )
 insert into StudentCourse values(1,'Computer',1) 
 insert into StudentCourse values(2,'English',2) 
 insert into StudentCourse values(3,'Math',3) 
 insert into StudentCourse values(4,'Advance Computer',4) 

 select * from Course
 select * from StudentCourse
 select * from Student

  SELECT Student.StudentID,,StudentCourse.CourseID, Student.NAME, Student.AGE 
 FROM Student INNER JOIN StudentCourse ON Student.StudentID = StudentCourse.StudentID

 
 SELECT Student.StudentID, StudentCourse.CourseID, Student.NAME, Student.AGE 
 FROM Student left outer JOIN StudentCourse ON Student.StudentID = StudentCourse.StudentID

 
 SELECT Student.StudentID, StudentCourse.CourseID, Student.NAME, Student.AGE 
 FROM Student right outer JOIN StudentCourse ON Student.StudentID = StudentCourse.StudentID

 
 SELECT Student.StudentID, StudentCourse.CourseID, Student.NAME, Student.AGE 
 FROM Student cross JOIN StudentCourse -- (5*4 =20 Row)


 select * from Student
 select * from Course
 select * from StudentCourse
 


