--********************************************************************************
--                            �������� ���� ������ (������� �2).
--********************************************************************************

/*�������� ���� ������ � ������ �MyFunkDB�. */


CREATE DATABASE MyFunkDB
ON							  -- ������ ��������� ���� ������.
(
	NAME = 'MyFunkDB',				-- ��������� ���������� ��� �� (������������ ��� ��������� � ��).
	FILENAME = 'D:\MyFunkDB.mdf',	-- ��������� ���������� ������ ��� ����� ��.
	SIZE = 5MB,                    -- ������ ��������� ������ ����� ��.
	MAXSIZE = 30MB,				-- ������ ������������ ������ ����� ��.
	FILEGROWTH = 5MB				-- ������ ��������, �� ������� ����� ������������� ������ ����� ��.
)
LOG ON						  -- ������ ��������� ������� ���� ������.
( 
	NAME = 'LogMyFunkDB',		       -- ��������� ���������� ��� ������� �� (������������ ��� ��������� � ������� ��).
	FILENAME = 'X:\MyFunkDB.ldf',      -- ��������� ���������� ������ ��� ����� ������� ��.
	SIZE = 5MB,                        -- ������ ��������� ������ ����� ������� ��.
	MAXSIZE = 30MB,                    -- ������ ������������ ������ ����� ������� ��.
	FILEGROWTH = 5MB                   -- ������ ��������, �� ������� ����� ������������� ������ ����� ������� ��.
)               
COLLATE Cyrillic_General_CI_AS -- ������ ��������� ��� ���� ������ �� ���������



--********************************************************************************
--                            �������������� ���� ������ (������� �3).
--********************************************************************************

USE MyFunkDB         
GO   

/*� ���� ������ �MyFunkDB�, �������� 3 �������. 
� 1-� ������� ������� ����� � ������ ��������� ����������� ��������. 
� 2-� ������� ������� ��������� �� �� ��������, � ����������: 
������� ��������, ��������, �������.  
� 3-� ������� ������� ���������� � �������� ���������, ���� �������� � ����� ����������. */

--�������� ������� ����������.

 CREATE TABLE Employees
(                                      
	EmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,
	Name varchar(25) NOT NULL,				  
	Phone char(12) Not NULL
)
GO	

 --�������� ������� � ��������.  

CREATE TABLE Salary
(                                      
	SalaryID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Post varchar(25) NOT NULL,
	Salary money NOT NULL,
	EmployeesID int NOT NULL						                        
    FOREIGN KEY REFERENCES Employees(EmployeesID)-- ����� ���� �� ������.
)
GO		

--�������� ������� ���������.

CREATE TABLE InfoEmployees
(                                      
	InfoEmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	MaritalStatus varchar(25) NOT NULL,
	BirthDate date NOT NULL, 
	Locations Varchar (30) NOT NULL,
	EmployeesID int NOT NULL						                        
    FOREIGN KEY REFERENCES Employees(EmployeesID) -- ����� ���� �� ������.
)
GO	

--������� ������ � �������

INSERT INTO Employees																			   
(Name, Phone)
VALUES
('������� �. �.','(093)9831282'),
('����� M. �.','(067)9831312'),
('����� �. �.','(098)9831412'),
('������ �. �.','(097)9811182'),
('��������� �. �.','(063)1491352');
GO

Select * From Employees

INSERT INTO Salary																			   
(Post, Salary, EmployeesID)
VALUES
('������� ��������','$1000',1),
('��������','$500',2),
('��������','$500',3),
('�������','$200',4),
('�������','$200',5);
GO

Select * From Salary

INSERT INTO InfoEmployees																			   
(MaritalStatus, Locations, BirthDate, EmployeesID)
VALUES
('�� �����','����', '08/15/1975', 1),
('�����','�����',   '01/01/1990', 2),
('�� �����','����', '03/11/1985', 3),
('�� �����','������','05/10/1977', 4),
('�����','�������', '02/04/1991', 5);
GO
 
Select * From Employees
Select * From Salary
Select * From InfoEmployees

--********************************************************************************
--                            �������� ������ / ���������.(������� �4).
--********************************************************************************
--1) ��������� ������ ���������� ������ ����������� 
--(������ ���������, ����� ����������). 

CREATE PROC spEmployee1 -- �������� �������� ���������.
AS
SELECT  Name, Phone, Locations FROM 
Employees  
INNER JOIN  -- �������� �����������.
InfoEmployees 
ON Employees.EmployeesID = InfoEmployees.EmployeesID -- ������� ����������� ��� ������� �������� � ������������ ������� ������ ���������. 
GO 

EXEC spEmployee1; --����� �������� ���������.
GO

CREATE FUNCTION fnEmployee1()-- C������� �������
RETURNS table -- ������������ ��� TABLE ��������� �� �� ��� ������������ ����� �������
AS
RETURN 
(SELECT  Phone, Locations FROM 
Employees  
INNER JOIN  -- �������� �����������.
InfoEmployees 
ON Employees.EmployeesID = InfoEmployees.EmployeesID); -- ������� ����������� ��� ������� �������� � ������������ ������� ������ ���������. 
GO

SELECT * FROM dbo.fnEmployee1(); -- ������� ��� ���������� �� ������� ������������� ��� ������ ������� ;
GO

--2) ��������� ������ ���������� � ���� �������� ���� �� ������� ����������� � ������ ��������� ���� �����������. 

CREATE PROC spEmployee2 -- �������� �������� ���������.
AS
SELECT  Name, BirthDate, Phone FROM 
Employees  
INNER JOIN  -- �������� �����������.
InfoEmployees 
ON Employees.EmployeesID = InfoEmployees.EmployeesID
WHERE MaritalStatus = '�� �����';
GO 

EXEC spEmployee2; --����� �������� ���������.
GO

CREATE FUNCTION fnEmployee2()-- �������� �������
RETURNS table -- ������������ ��� TABLE ��������� �� �� ��� ������������ ����� �������
AS
RETURN (SELECT Name, BirthDate, Phone FROM 
Employees  
INNER JOIN  -- �������� �����������.
InfoEmployees 
ON Employees.EmployeesID = InfoEmployees.EmployeesID
WHERE MaritalStatus = '�� �����');
GO

SELECT * FROM dbo.fnEmployee2(); -- ������� ��� ���������� �� ������� ������������� ��� ������ ������� ;
GO

--3) ��������� ������ ���������� � ���� �������� ���� ����������� � ���������� �������� � ������ ��������� ���� �����������.*/ 

CREATE PROC spEmployee3 -- �������� �������� ���������.
AS
SELECT  Name, BirthDate, Phone FROM 
(Employees  
INNER JOIN  -- �������� �����������.
Salary	
ON Employees.EmployeesID = Salary.EmployeesID) -- ������� ����������� ��� ������� �������� � ������������ ������� ������ ���������. 
INNER JOIN  -- �������� �����������.
InfoEmployees 
ON Employees.EmployeesID = InfoEmployees.EmployeesID
WHERE Post = '��������';
GO 

EXEC spEmployee3; --����� �������� ���������.
GO

CREATE FUNCTION fnEmployee3()-- �������� �������
RETURNS table -- ������������ ��� TABLE ��������� �� �� ��� ������������ ����� �������
AS
RETURN (SELECT  Name, BirthDate, Phone FROM 
(Employees  
INNER JOIN  -- �������� �����������.
Salary	
ON Employees.EmployeesID = Salary.EmployeesID) -- ������� ����������� ��� ������� �������� � ������������ ������� ������ ���������. 
INNER JOIN  -- �������� �����������.
InfoEmployees 
ON Employees.EmployeesID = InfoEmployees.EmployeesID
WHERE Post = '��������');
GO

SELECT * FROM dbo.fnEmployee3(); -- ������� ��� ���������� �� ������� ������������� ��� ������ ������� ;
GO