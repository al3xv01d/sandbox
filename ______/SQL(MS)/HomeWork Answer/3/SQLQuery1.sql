--********************************************************************************
--                            �������������� �������.
--********************************************************************************
/*�������  
������������� ���� ������ ��� ������� ������ ������.*/

--�������� �� ��� ������ ������ ����������� � ��������� CompanyDB

CREATE DATABASE CompanyDB 
ON							  -- ������ ��������� ���� ������.
(
	NAME = 'CompanyDB',				-- ��������� ���������� ��� �� (������������ ��� ��������� � ��).
	FILENAME = 'D:\CompanyDB.mdf',	-- ��������� ���������� ������ ��� ����� ��.
	SIZE = 30MB,                    -- ������ ��������� ������ ����� ��.
	MAXSIZE = 100MB,				-- ������ ������������ ������ ����� ��.
	FILEGROWTH = 10MB				-- ������ ��������, �� ������� ����� ������������� ������ ����� ��.
)
LOG ON						  -- ������ ��������� ������� ���� ������.
( 
	NAME = 'LogCompanyDB',		       -- ��������� ���������� ��� ������� �� (������������ ��� ��������� � ������� ��).
	FILENAME = 'X:\CompanyDB.ldf',      -- ��������� ���������� ������ ��� ����� ������� ��.
	SIZE = 5MB,                        -- ������ ��������� ������ ����� ������� ��.
	MAXSIZE = 50MB,                    -- ������ ������������ ������ ����� ������� ��.
	FILEGROWTH = 5MB                   -- ������ ��������, �� ������� ����� ������������� ������ ����� ������� ��.
)               
COLLATE Cyrillic_General_CI_AS

--������� ������� ������ � CompanyDB:
--1� ������� "�����" � ���������: ��� ������, �������� ������.
--2� ������� "����������" � ���������: ��� ����������, �������,
--���, ��������, ���� ��������, �����, �������, ��� ������.
--3� ������� "�������" � ���������: ��� �������, ��������,
--���� ������ ������, ��� ����������. 

USE CompanyDB             
GO   

--�������� ������.

CREATE TABLE Department
(                                      
	DepartmentID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	DepartmentName varchar(30) NOT NULL
)
GO	  

CREATE TABLE Employees
(                                      
	EmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	FrsName varchar(25) NOT NULL,
	LastName varchar(25) NOT NULL,
	SecName varchar(25) NOT NULL,
	BirthDate date NOT NULL,
	Address1 varchar(25) NOT NULL,
	Phone char(12) NOT NULL,
	DepartmentID int NOT NULL						                        
    FOREIGN KEY REFERENCES Department(DepartmentID) -- ����� ���� �� ������.
)
GO	


CREATE TABLE Task
(                                      
	TaskID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Task varchar(50) NOT NULL,
	DateBegin date NOT NULL,
	EmployeesID int NOT NULL						                        
    FOREIGN KEY REFERENCES Employees(EmployeesID) -- ����� ���� �� ������.
)
GO	

--������� ������ � �������

INSERT INTO Department																			   
VALUES
('����� ����������'),
('����� �����');	
GO

Select * From Department	

INSERT INTO Employees																			   
(FrsName, SecName, LastName, BirthDate, Address1, Phone, DepartmentID)
VALUES
('�����', '��������', '�����',   '08/08/1987', '����������� 22','(093)1231212',1),
('�����', '����������', '�����', '05/12/1985', '������������� 100, 2','(063)1161232',1),	
('�����', 'C��������', '������', '05/12/1985', 'U��������� 28, 34','(067)2261734',2);
GO

Select * From Employees

INSERT INTO Task	
(Task, DateBegin, EmployeesID)																	   
VALUES
('�������� ������','05/02/2012', 1),
('������ ����������','07/01/2014', 2),
('���������� ��������� ������','07/01/2014', 2),
('������� ������','05/01/2013', 3);
GO

Select * From Department
Select * From Employees
Select * From Task
--********************************************************************************
--                            �������� ���� ������ (������� �2).
--********************************************************************************

/*�������� ���� ������ ������������ ������������ 100 ��, 
�������������� ��� ����� �������������� ����� 30 ��. 
������� ��� ����������� ���������. ������ ���������� 
������ ���� ���������� �� ������ ���������� ����� (���� ����� �������).*/

CREATE DATABASE StokDB -- �����
ON							  -- ������ ��������� ���� ������.
(
	NAME = 'StokDB',				-- ��������� ���������� ��� �� (������������ ��� ��������� � ��).
	FILENAME = 'D:\StokDB.mdf',	-- ��������� ���������� ������ ��� ����� ��.
	SIZE = 30MB,                    -- ������ ��������� ������ ����� ��.
	MAXSIZE = 100MB,				-- ������ ������������ ������ ����� ��.
	FILEGROWTH = 10MB				-- ������ ��������, �� ������� ����� ������������� ������ ����� ��.
)
LOG ON						  -- ������ ��������� ������� ���� ������.
( 
	NAME = 'LogStokDB',		       -- ��������� ���������� ��� ������� �� (������������ ��� ��������� � ������� ��).
	FILENAME = 'X:\StokDB.ldf',      -- ��������� ���������� ������ ��� ����� ������� ��.
	SIZE = 5MB,                        -- ������ ��������� ������ ����� ������� ��.
	MAXSIZE = 50MB,                    -- ������ ������������ ������ ����� ������� ��.
	FILEGROWTH = 5MB                   -- ������ ��������, �� ������� ����� ������������� ������ ����� ������� ��.
)               
COLLATE Cyrillic_General_CI_AS -- ������ ��������� ��� ���� ������ �� ���������



--********************************************************************************
--                  �������������� ���� ������ (������� �2).
--********************************************************************************

USE StokDB             
GO   

/*������������� ���� ������ ��� �������� ������, � �������� ���� ���������� �������, 
��������, ���������� ���������. ���� ������ ��������� ��������������. */ 

--�������� ������� ���������.

 CREATE TABLE Staff 
(                                      
	StaffID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Name varchar(25) NOT NULL,
	Post varchar(40) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12) NOT NULL
)
GO	

 --�������� ������� ���������.  

CREATE TABLE Provider 
(                                      
	ProvaiderID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	ProviderName varchar(25) NOT NULL,
	Product varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	Contact  varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Phone char(12) NOT NULL,
	StaffID int NOT NULL						                        
    FOREIGN KEY REFERENCES Staff(StaffID)
)
GO		


--�������� ������� ���������.

CREATE TABLE Customers
(                                      
	CustomerID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Name varchar(25) NOT NULL,
	Address1 varchar(25) NOT NULL,
	City     varchar(15) NOT NULL,
	Contact  varchar(25) NOT NULL,
	Phone char(12) NOT NULL,
	StaffID int NOT NULL						                        
    FOREIGN KEY REFERENCES Staff(StaffID) -- ����� ���� �� ������.
)
GO	

--������� ������ � �������


INSERT INTO Staff 																			   
(Name, Post, Contact, Phone)
VALUES
('������� �. �.', '�������� �� ��������','Andreev32@mail.ru','(093)9831282'),
('��������� �. �.', '�������� �� ��������','Tarasov@gmail.ru','(093)1991252');
GO

Select * From Staff 

INSERT INTO Provider 																			   
(ProviderName, Product, Address1, City, Contact, Phone, StaffID )
VALUES
('XCompany', '��������','������������� 1','����', 'xcompany@gmail.ru','(098)2391555', 1),
('YCompany', '��������� ��������','�������� 25','�����', 'ycom@gmail.ru','(063)1411525', 1);
GO

Select * From Provider 

INSERT INTO Customers 																			   
(Name, Address1, City, Contact, Phone, StaffID )
VALUES
('������ �. �.', '�������� 3','����', 'garmash90@mail.ru','(067)4591335', 2);
GO


Select * From Staff 
Select * From Provider
Select * From Customers