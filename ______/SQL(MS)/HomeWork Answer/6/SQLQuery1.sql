--********************************************************************************
--                            �������������� �������.
--********************************************************************************
/*����������� ����� ���� ������ AdventureWorks2012, ������� 4 ��������������� �������.*/

--4 ��������������� �������:
--1.Production.ProductModel
--2.Production.ProductModelIllustration
--3.Production.ProductModelProductDescriptionCulture
--4.Production.ProductDescription
--********************************************************************************
--                            �������� ���� ������ (������� �2).
--********************************************************************************

/*�������� ���� ������ � ������ �MyJoinsDB�. */

CREATE DATABASE MyJoinsDB
ON							  -- ������ ��������� ���� ������.
(
	NAME = 'MyJoinsDB',				-- ��������� ���������� ��� �� (������������ ��� ��������� � ��).
	FILENAME = 'D:\MyJoinsDB.mdf',	-- ��������� ���������� ������ ��� ����� ��.
	SIZE = 5MB,                    -- ������ ��������� ������ ����� ��.
	MAXSIZE = 30MB,				-- ������ ������������ ������ ����� ��.
	FILEGROWTH = 5MB				-- ������ ��������, �� ������� ����� ������������� ������ ����� ��.
)
LOG ON						  -- ������ ��������� ������� ���� ������.
( 
	NAME = 'LogMyJoinsDB',		       -- ��������� ���������� ��� ������� �� (������������ ��� ��������� � ������� ��).
	FILENAME = 'X:\MyJoinsDB.ldf',      -- ��������� ���������� ������ ��� ����� ������� ��.
	SIZE = 5MB,                        -- ������ ��������� ������ ����� ������� ��.
	MAXSIZE = 30MB,                    -- ������ ������������ ������ ����� ������� ��.
	FILEGROWTH = 5MB                   -- ������ ��������, �� ������� ����� ������������� ������ ����� ������� ��.
)               
COLLATE Cyrillic_General_CI_AS -- ������ ��������� ��� ���� ������ �� ���������



--********************************************************************************
--                            �������������� ���� ������ (������� �3).
--********************************************************************************

USE MyJoinsDB          
GO   

/*� ���� ������ �MyJoinsDB�, �������� 3 �������. 
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

--�������� ������� ���������� � �����������.

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
 
Select * From Employees
Select * From Salary
Select * From InfoEmployees




--********************************************************************************
--                            ������� ��� ������ ��������� �������� (������� �4).
--********************************************************************************
--�������� ������� ��� ������ ��������� �������� ��� ����� �����:  
--1) ��������� ������ ���������� ������ ����������� 
--(������ ���������, ����� ����������).  

SELECT Name, Phone, Locations FROM Employees AS emp, InfoEmployees AS info
WHERE emp.EmployeesID IN 
                     (SELECT EmployeesID FROM InfoEmployees    -- ��������� ������
					  WHERE emp.EmployeesID = info.InfoEmployeesID); 

--2) ��������� ������ ���������� � ���� �������� ���� �� ������� �����������
-- � ������ ��������� ���� �����������.

SELECT  Name, BirthDate, Phone FROM Employees AS emp, InfoEmployees AS info
WHERE emp.EmployeesID IN 
                     (SELECT EmployeesID FROM InfoEmployees    -- ��������� ������
					  WHERE emp.EmployeesID = info.InfoEmployeesID)
					  AND  MaritalStatus = '�� �����';

--3) ��������� ������ ���������� � ���� �������� ���� ����������� 
--� ���������� �������� � ������ ��������� ���� �����������. 

SELECT Name, BirthDate, Phone 
FROM Employees AS emp, InfoEmployees 
WHERE emp.EmployeesID = 
                     (SELECT sal.EmployeesID FROM Salary AS sal -- ��������� ������
                     WHERE sal.SalaryID =(SELECT info.EmployeesID
					 FROM InfoEmployees AS info    WHERE sal.SalaryID = info.EmployeesID)
                     AND emp.EmployeesID = sal.EmployeesID
					 AND emp.EmployeesID = InfoEmployeesID
					 AND Post = '��������');












--1
SELECT Phone, Locations FROM Employees AS emp, InfoEmployees AS info
WHERE emp.EmployeesID = 
                     (SELECT EmployeesID FROM Salary AS sal -- ��������� ������
                     WHERE emp.EmployeesID = sal.EmployeesID 
                     and emp.EmployeesID = info.InfoEmployeesID);			
--2
SELECT  BirthDate, Phone FROM Employees AS emp, InfoEmployees AS info
WHERE emp.EmployeesID = 
                     (SELECT sal.EmployeesID FROM Salary AS sal -- ��������� ������
                     WHERE emp.EmployeesID = sal.EmployeesID 
                     AND emp.EmployeesID = info.InfoEmployeesID)
					 AND  MaritalStatus = '�� �����';
--3
SELECT  BirthDate, Phone 
FROM Employees AS emp, InfoEmployees 
WHERE emp.EmployeesID = 
                     (SELECT sal.EmployeesID FROM Salary AS sal -- ��������� ������
                     WHERE sal.SalaryID =(Select info.SalaryID
					 From InfoEmployees AS info    WHERE sal.SalaryID = info.SalaryID)
                     AND emp.EmployeesID = sal.EmployeesID
					 AND emp.EmployeesID = InfoEmployeesID
					 AND Post = '��������');

--!!!
SELECT  Name,BirthDate, Phone FROM Employees AS emp, InfoEmployees AS info 
WHERE emp.EmployeesID IN
                     (SELECT EmployeesID FROM Salary as Sal   -- ��������� ������
					  WHERE emp.EmployeesID IN (
					  SELECT EmployeesID FROM InfoEmployees       -- ��������� ������
					  WHERE emp.EmployeesID = info.InfoEmployeesID)
					  AND emp.EmployeesID = sal.EmployeesID  AND Post = '��������');



