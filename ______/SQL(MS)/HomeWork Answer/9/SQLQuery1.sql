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
--                            ������� �4.
--********************************************************************************
/*�������� ��� ���� ��������� �� ���� ��������, ����� �������� �� ������������ �������� ������. */

--������� ��  ���������� �������


CREATE TRIGGER TR_InfoEmployees ON InfoEmployees
FOR INSERT
AS
 IF EXISTS (SELECT *
            FROM inserted
            WHERE MaritalStatus != '�����' AND MaritalStatus !='�� �����')
  BEGIN 
   RAISERROR('������!!!', 1, 16);
   ROLLBACK TRANSACTION
  END

INSERT INTO InfoEmployees																			   
(MaritalStatus, Locations, BirthDate, EmployeesID)
VALUES
('�������','���', '08/15/1975', 5);

SELECT * FROM InfoEmployees

--������� �� ����������

CREATE TRIGGER TR_Employees ON Employees
FOR UPDATE
AS
 IF UPDATE (Name) 
  BEGIN
   RAISERROR('������ �������� ������� � ��������!!!', 1, 16);
   ROLLBACK TRANSACTION
  END

UPDATE Employees
SET Name = '������� �. �.' 
WHERE Name = '����� M. �.'

SELECT * FROM Employees
--������� �� ��������

CREATE TRIGGER TR_Salary ON Salary
FOR DELETE
AS
 IF EXISTS (SELECT *
            FROM deleted)
  BEGIN 
   RAISERROR('������ ������� ������!!!', 1, 16);
   ROLLBACK TRANSACTION
  END

DELETE FROM Salary
WHERE Post = '��������';

SELECT * FROM Salary
--********************************************************************************
--                            ������� �4.
--********************************************************************************
/*��������� ��� �������, ��������� � �������� � ��������� 1-� ����������. 
���������� ������������ ������ �������� � ������ ���������� ��� �������� ������� ����� ��� ��������� ������.*/
drop TRIGGER TR_InfoEmployees
drop TRIGGER TR_Employees
drop TRIGGER TR_Salary

SELECT * FROM InfoEmployees;
SELECT * FROM Salary;

BEGIN TRANSACTION; -- ������ ����������

INSERT INTO InfoEmployees																			   
(MaritalStatus, Locations, BirthDate, EmployeesID)
VALUES
('�� �����','���������', '08/11/1975', 5);

UPDATE Salary
SET Salary = '$300' 
WHERE Post = '�������'

DELETE FROM InfoEmployees
WHERE Locations = '����';

ROLLBACK TRANSACTION; --  -- ���������� ����� ����������  

SELECT * FROM InfoEmployees;
SELECT * FROM Salary;



BEGIN TRANSACTION; -- ������ ����������

INSERT INTO InfoEmployees																			   
(MaritalStatus, Locations, BirthDate, EmployeesID)
VALUES
('�� �����','���������', '08/11/1975', 5);

UPDATE Salary
SET Salary = '$300' 
WHERE Post = '�������'

DELETE FROM InfoEmployees
WHERE Locations = '����';

COMMIT TRANSACTION; -- �������� ���������� ����������   

SELECT * FROM InfoEmployees;
SELECT * FROM Salary;