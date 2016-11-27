--********************************************************************************
--                            �������������� �������.
--********************************************************************************
/*�������������� ���� ������ ��� ����������� ������� 
������ ������, �������� ������������ ���� ������*/

CREATE DATABASE HomeWork1
ON							  -- ������ ��������� ���� ������.
(
	NAME = 'HomeWork1',				-- ��������� ���������� ��� �� (������������ ��� ��������� � ��).
	FILENAME = 'D:\HomeWork1.mdf',	-- ��������� ���������� ������ ��� ����� ��.
	SIZE = 5MB,                    -- ������ ��������� ������ ����� ��.
	MAXSIZE = 30MB,				-- ������ ������������ ������ ����� ��.
	FILEGROWTH = 5MB				-- ������ ��������, �� ������� ����� ������������� ������ ����� ��.
)
LOG ON						  -- ������ ��������� ������� ���� ������.
( 
	NAME = 'LogHomeWork1',		       -- ��������� ���������� ��� ������� �� (������������ ��� ��������� � ������� ��).
	FILENAME = 'X:\HomeWork1.ldf',      -- ��������� ���������� ������ ��� ����� ������� ��.
	SIZE = 5MB,                        -- ������ ��������� ������ ����� ������� ��.
	MAXSIZE = 30MB,                    -- ������ ������������ ������ ����� ������� ��.
	FILEGROWTH = 5MB                   -- ������ ��������, �� ������� ����� ������������� ������ ����� ������� ��.
)               
COLLATE Cyrillic_General_CI_AS -- ������ ��������� ��� ���� ������ �� ���������

USE HomeWork1
GO


CREATE TABLE Info
(
    EmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,
	Name varchar(60) NOT NULL,
	Post varchar(70) NOT NULL,
	Info varchar(60) NOT NULL,
	History varchar(60) NOT NULL
)
GO

INSERT INTO Info
VALUES
('������� �������� $1000','������� �. �. (093)9831282 andreev44@mail.ru', '�� ����� ���� 08/15/1975', '�������� 2 �. Google'),
('������� �������� $1000','������� �. �. (093)9831282 andreev44@mail.ru', '�� ����� ���� 08/15/1975', '�������� 5 �. Microsoft'),
('�������� $500 ','����� M. �. (067)9831311 boyko_M_K@gmail.ru', '����� ����� 01/01/1990', '���'),
('������� $200 ', '����� �. �. (098)9831411 gus@mail.ru', '�� ����� ���� 03/11/1985', '�������� 3 �. ASUS'),
('�������� $400 ', '������ �. �. (097)9811182 krava@ukr.net','�� ����� ������ 05/10/1977', '5 �. HP'),
('������� $250  ','��������� �. �. (063)1491352 tarasenko_v@ukr.net','����� ������� 02/04/1991', '���');


SELECT * FROM Info
--������������

/*������ ���������� �����(1NF)����������� ������������� ������,
����� ���� ����� ������ ������ ������ ���� ��������.*/

/*������ ���������� �����(2NF)�������� ���������������� ���������� 
�������� ������� � ������ ��, � ����� ������ �� �������� ������� ������� 
����������� � 1��,������ �������� �� ����� �����.*/

/*������ ���������� �����(3NF)�������� ���������������� ���������� �������� 
������� �� ������ ��,� ��� �� �� � ����� �� �������� ������� �� ����� ����
����������� �� ������� �� ��������� �������.��� �� �� ����������� ������� 
� ������� ����������� ������.*/


/*
1)��������� ������ � ������� Name Post, Info � History
2)������� ������� Name, Post, Info � History � �������� ������� 	
3)������� ������� ����������
4)������� ��� ������� 
*/

 --�������� ������� ���������.
 CREATE TABLE Post
(                                      
	PostID int IDENTITY NOT NULL 
    PRIMARY KEY,
	Post varchar(25) NOT NULL,				  
)
GO	

 --�������� ������� ����������.
 CREATE TABLE Employees
(                                      
	EmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY,
	Name varchar(25) NOT NULL,				  
	Phone char(12) Not NULL,
	Contact varchar(30) NOT NULL,
	Salary money NOT NULL,
	PostID int NOT NULL 					                        
    FOREIGN KEY REFERENCES Post(PostID)
)
GO	
 --�������� ������� ����������.  

CREATE TABLE InfoEmployees
(                                      
	InfoEmployeesID int IDENTITY NOT NULL 
    PRIMARY KEY
    FOREIGN KEY REFERENCES Employees(EmployeesID),				  
	MaritalStatus varchar(25) NOT NULL,
	BirthDate date NOT NULL, 
	Locations Varchar (30) NOT NULL
)
GO	

-- �������� ������� �������� �������.
CREATE TABLE WorkHistory
(                                      
	WorkHistoryID int IDENTITY NOT NULL ,				  
	PostID int NOT NULL						                        
    FOREIGN KEY REFERENCES Post(PostID),
	Experience varchar(25) NOT NULL, 
	Company Varchar (30) NOT NULL,
	EmployeesID int NOT NULL						                        
    FOREIGN KEY REFERENCES Employees(EmployeesID),
	PRIMARY KEY (WorkHistoryID, EmployeesID)
)
GO	

--������� ������ � �������

INSERT INTO Post																			   
VALUES
('������� ��������'),
('��������'),
('�������');
GO

INSERT INTO Employees																			   
(Name, Phone, Contact, Salary, PostID)
VALUES
('������� �. �.','(093)9831282','andreev44@mail.ru','$1000',1 ),
('����� M. �.','(067)9831311','boyko_M_K@gmail.ru','$500',2),
('����� �. �.','(098)9831411','gus@mail.ru','$200',3),
('������ �. �.','(097)9811182','krava@ukr.net','$400',2),
('��������� �. �.', '(063)1491352','tarasenko_v@ukr.net','$250',3);
GO


INSERT INTO InfoEmployees																			   
(MaritalStatus, Locations, BirthDate)
VALUES
('�� �����','����', '08/15/1975'),
('�����','�����',   '01/01/1990'),
('�� �����','����', '03/11/1985'),
('�� �����','������','05/10/1977'),
('�����','�������', '02/04/1991');
GO

INSERT INTO WorkHistory																			   
(PostID, Experience, Company, EmployeesID)
VALUES
(2,'2 �.', 'Google', 1),
(2,'5 �.', 'Microsoft', 1),
(2,'3 �.', 'ASUS', 3),
(3,'5 �.','HP', 4);

GO

SELECT * FROM Info 
Select * From Post
Select * From Employees
Select * From InfoEmployees
Select * From WorkHistory

SELECT P.Post, Salary, Name, Phone, Contact, MaritalStatus, Locations, BirthDate, W.PostID, Experience, Company
FROM Post P INNER JOIN Employees E ON P.PostID = E.PostID
INNER JOIN InfoEmployees I ON E.EmployeesID = I.InfoEmployeesID
INNER JOIN WorkHistory W ON E.EmployeesID = W.EmployeesID


Select * From Info
--********************************************************************************
--                            �������� ���� ������ (������� �2).
--********************************************************************************

/*�������� ���� ������ ������������ ������������ 100 ��, 
�������������� ��� ����� �������������� ����� 30 ��. 
������� ��� ����������� ���������. ������ ���������� 
������ ���� ���������� �� ������ ���������� ����� (���� ����� �������).*/


CREATE DATABASE HomeWork4 
ON							  -- ������ ��������� ���� ������.
(
	NAME = 'HomeWork4 ',				-- ��������� ���������� ��� �� (������������ ��� ��������� � ��).
	FILENAME = 'D:\HomeWork4 .mdf',	-- ��������� ���������� ������ ��� ����� ��.
	SIZE = 30MB,                    -- ������ ��������� ������ ����� ��.
	MAXSIZE = 100MB,				-- ������ ������������ ������ ����� ��.
	FILEGROWTH = 10MB				-- ������ ��������, �� ������� ����� ������������� ������ ����� ��.
)
LOG ON						  -- ������ ��������� ������� ���� ������.
( 
	NAME = 'LogHomeWork4 ',		       -- ��������� ���������� ��� ������� �� (������������ ��� ��������� � ������� ��).
	FILENAME = 'X:\HomeWork4 .ldf',      -- ��������� ���������� ������ ��� ����� ������� ��.
	SIZE = 5MB,                        -- ������ ��������� ������ ����� ������� ��.
	MAXSIZE = 50MB,                    -- ������ ������������ ������ ����� ������� ��.
	FILEGROWTH = 5MB                   -- ������ ��������, �� ������� ����� ������������� ������ ����� ������� ��.
)               
COLLATE Cyrillic_General_CI_AS -- ������ ��������� ��� ���� ������ �� ���������



--********************************************************************************
--                  �������� ������� � ���� ������ MyDB.
--********************************************************************************

USE HomeWork4               
GO   

----------------------------------------------------------------------------------
/*�������������� ������ �������:  */

CREATE TABLE Info
(                                      
	InfoID int IDENTITY NOT NULL 
    PRIMARY KEY,				  
	Name varchar(35) NOT NULL, --�������
	Platoon varchar(25) NOT NULL, --�����
	Weapons varchar(15) NOT NULL, --������
	GiveRank  varchar(35) NOT NULL, --������ �����
)
GO		

--������� ������

INSERT INTO Info																			   
VALUES
('������ �.�.,��.205', '222', '��-47', '����� �. �., �����'),
('������ �.�.,��.205', '222', '����20', '������� �.�., �����'),
('������� �.�.,��.221', '232', '��-74', '��������� �.�., ������������'),
('������� �.�.,��.221', '232', '����20', '������� �.�.,�����'),
('�������� �.�.,��.201', '212', '��-47', '����� �. �., �����'),
('�������� �.�.,��.201', '212', '����20', '������� �. �., �����'),
('����� �.�.', '200', '��-47', '����� �. �., �����');


SELECT * FROM Info

/*������ ���������� �����(1NF)����������� ������������� ������,
����� ���� ����� ������ ������ ������ ���� ��������.*/

/*������ ���������� �����(2NF)�������� ���������������� ���������� 
�������� ������� � ��������, � ����� ������ �� �������� ������� ������� 
����������� � 1��,������ �������� �� ����������.*/

/*������ ���������� �����(3NF)�������� ��������������� ����������� �������� 
������� �� ������ ��,� ��� �� �� � ����� �� �������� ������� �� ����� ����
����������� �� ������� �� ��������� �������.��� �� �� ����������� ������� 
� ������� ����������� ������.*/

/*
1)��������� ������ � ������� Name � ������� GiveRank
2)������� ������� GiveRank � Weapons � �������� ������� 	
3)������� ������� ������ 
4)������� ��� ������� 
*/

--������������
--�������� ������ "���������� ������"
CREATE TABLE ArmoryCustomer
(
	ArmoryCustomerID int IDENTITY NOT NULL
	PRIMARY KEY,
	Name varchar(20) NOT NULL,
	[Off] varchar(10) NULL,
	Platoon int NOT NULL
)
GO

--�������� ������� "������ ������"
CREATE TABLE ArmoryProvider
(
	ArmoryProviderID int IDENTITY NOT NULL 
	PRIMARY KEY,
	Name Varchar(20) NOT NULL,
	[Rank] Varchar(20) NOT NULL
)
GO

--�������� ������� "������"
 CREATE TABLE Weapons
 (
	WeaponsId smallint IDENTITY NOT NULL 
	PRIMARY KEY,
	Name Varchar(20) NOT NULL,
 )
 GO

 --�������� ������� "��������"
 CREATE TABLE Give
(
	GiveId int IDENTITY NOT NULL
	PRIMARY KEY,
	ArmoryCustomerID int NOT NULL FOREIGN KEY 
	REFERENCES ArmoryCustomer(ArmoryCustomerID),
	ArmoryProviderID int NOT NULL FOREIGN KEY 
	REFERENCES ArmoryProvider(ArmoryProviderID),
	WeaponsId smallint NOT NULL FOREIGN KEY 
	REFERENCES Weapons(WeaponsId)
)
GO 


INSERT INTO ArmoryCustomer  
VALUES
('������ �.�.', 205, 222), 
('������� �.�.' , 221, 232),
('�������� �.�.', 201, 212),
('����� �.�', NULL, 200)
GO



INSERT INTO ArmoryProvider  
VALUES
('����� �.�.', '�����'), 
('������� �.�.' , '�����'),
('��������� �.�.', '������������')
GO

INSERT INTO Weapons  
VALUES
('��-47'), 
('����20'),
('��-74')

INSERT INTO Give 
VALUES
(1,  1, 1), 
(1,  2, 2),
(2,  3, 3),
(2,  2, 2),
(3,  1, 1),
(3,  2, 2),
(4,  1, 1)
GO
SELECT * FROM Info
SELECT * FROM ArmoryCustomer
SELECT * FROM ArmoryProvider
SELECT * FROM Weapons
SELECT * FROM Give 

SELECT AC.Name, AC.[Off], AC.Platoon,
W.Name, AP.Name, AP.[Rank]
FROM 
ArmoryCustomer AC INNER JOIN Give G ON AC.ArmoryCustomerID = G.ArmoryCustomerID
INNER JOIN ArmoryProvider AP ON G.ArmoryProviderID = AP.ArmoryProviderID
INNER JOIN Weapons W ON G.WeaponsID = W.WeaponsID

SELECT * FROM Info