--********************************************************************************
--                            ������� 2.
--********************************************************************************
/*������� � ���� ������ �MyJoinsDB�, ��� ��������� � ���������� ����� �������������. 
���������������, ����� ���� �������� ������ �� ��������� � ���������� �������� 
������� ��������.*/
USE MyJoinsDB           
GO  
 
--������ �������� ��� ������� Employees
SELECT * FROM sys.indexes
WHERE object_id = (SELECT object_id FROM sys.tables
				   WHERE name = 'Employees')
GO	

--������ �������� ��� ������� Salary
SELECT * FROM sys.indexes
WHERE object_id = (SELECT object_id FROM sys.tables
				   WHERE name = 'Salary')
GO	


--������ �������� ��� ������� InfoEmployees
SELECT * FROM sys.indexes
WHERE object_id = (SELECT object_id FROM sys.tables
				   WHERE name = 'InfoEmployees')
GO	
--********************************************************************************
--                            ������� 3.
--********************************************************************************
/*������� ���� ������� �� ��������, ��������� � ���������� �������� ������� 
� ��������� �� �������������.*/ 
drop table Employees
drop table Salary
drop table InfoEmployees

--�������� ������� ����������.
CREATE TABLE Employees
(                                      
	EmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,
	Name varchar(25) NOT NULL,				  
	Phone char(12) Not NULL UNIQUE
)
GO	

--������ �������� ��� ������� Employees

SELECT * FROM sys.indexes
WHERE object_id = (SELECT object_id FROM sys.tables
				   WHERE name = 'Employees')
GO	

--�������� ������� � ��������.  

CREATE TABLE Salary
(                                      
	SalaryID int IDENTITY NOT NULL 
    UNIQUE,				  
	Post varchar(25) NOT NULL,
	Salary money NOT NULL,
	EmployeesID int NOT NULL						                        
    FOREIGN KEY REFERENCES Employees(EmployeesID)-- ����� ���� �� ������.
)
GO		

--������ �������� ��� ������� Salary
SELECT * FROM sys.indexes
WHERE object_id = (SELECT object_id FROM sys.tables
				   WHERE name = 'Salary')
GO	

--�������� ������� ���������� � �����������.

CREATE TABLE InfoEmployees
(                                      
	InfoEmployeesID int IDENTITY NOT NULL 
    ,				  
	MaritalStatus varchar(25) NOT NULL,
	BirthDate date NOT NULL, 
	Locations Varchar (30) NOT NULL,
	EmployeesID int NOT NULL						                        
    FOREIGN KEY REFERENCES Employees(EmployeesID) -- ����� ���� �� ������.
)
GO	

--������ �������� ��� ������� InfoEmployees
SELECT * FROM sys.indexes
WHERE object_id = (SELECT object_id FROM sys.tables
				   WHERE name = 'InfoEmployees')
GO	

/*������� � ������� ��������� �������� ������ �� ������������ ������ ��� �������� ���� ������� � �������.*/

--������� ������ � �������

INSERT INTO Employees																			   
(Name, Phone)
VALUES
('������� �. �.','(093)9831282'),
('����� M. �.','(067)9831311'),
('����� �. �.','(098)9831411'),
('������ �. �.','(097)9811182'),
('��������� �. �.', '(063)1491352');
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

Select * From InfoEmployees

--********************************************************************************
--                            ������� 4.
--********************************************************************************

USE MyJoinsDB           
GO   

/*�������� ������������� ��� ����� �������: 
1. ���������� ������ ���������� ������ ����������� (������ ���������, ����� ����������). 
2. ���������� ������ ���������� � ���� �������� ���� �� ������� ����������� � ������ ��������� ���� �����������. 
3. ���������� ������ ���������� � ���� �������� ���� ����������� � ���������� �������� � ������ ��������� ���� �����������. 
*/

--1. ���������� ������ ���������� ������ ����������� (������ ���������, ����� ����������). 

CREATE VIEW InfoEmployees1   -- �������� �������������
AS 
SELECT  Name, Phone, Locations FROM 
Employees  
INNER JOIN  -- �������� �����������.
InfoEmployees 
ON Employees.EmployeesID = InfoEmployees.EmployeesID -- ������� ����������� ��� ������� �������� � ������������ ������� ������ ���������.
GO

SELECT * FROM InfoEmployees1; -- ������� �� �������������

--2. ���������� ������ ���������� � ���� �������� ���� �� ������� ����������� � ������ ��������� ���� �����������. 

CREATE VIEW InfoEmployees2   -- �������� �������������
AS 
SELECT  Name, BirthDate, Phone FROM 
Employees  
INNER JOIN  -- �������� �����������.
InfoEmployees 
ON Employees.EmployeesID = InfoEmployees.EmployeesID
WHERE MaritalStatus = '�� �����';
GO

SELECT * FROM InfoEmployees2; -- ������� �� �������������

--3. ���������� ������ ���������� � ���� �������� ���� ����������� � ���������� �������� � ������ ��������� ���� �����������. 

CREATE VIEW InfoEmployees3   -- �������� �������������
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

SELECT * FROM InfoEmployees3; -- ������� �� �������������