--Transactions
DROP TABLE IF EXISTS BRDBankAccount
DROP TABLE IF EXISTS INGBankAccount
GO
SELECT TOP 5 
	MIN(CustomerID) AS CustomerID, 
	REPLACE(MIN(SUBSTRING(AccountNumber,1,5)+CAST(CAST(SUBSTRING(AccountNumber,6,5) AS int)*2+7 AS varchar(10))),'AW','BRD') AS AccountNumber, 
	MAX(FirstName) AS FirstName, 
	LastName, 
	10000 AS Balance
INTO BRDBankAccount
FROM Sales.Customer c
INNER JOIN Person.Person p
	ON c.PersonID = p.BusinessEntityID
GROUP BY LastName

SELECT TOP 5 
	MIN(CustomerID) AS CustomerID, 
	REPLACE(MIN(SUBSTRING(AccountNumber,1,5)+CAST(CAST(SUBSTRING(AccountNumber,6,5) AS int)*2+13 AS varchar(10))),'AW','ING') AS AccountNumber, 
	MAX(FirstName) AS FirstName, 
	LastName, 
	1000 AS Balance
INTO INGBankAccount
FROM Sales.Customer c
INNER JOIN Person.Person p
	ON c.PersonID = p.BusinessEntityID
GROUP BY LastName

SELECT * FROM BRDBankAccount
SELECT * FROM INGBankAccount
GO

CREATE TRIGGER TRG_ING ON INGBankAccount
INSTEAD OF UPDATE
AS
SET NOCOUNT ON
IF EXISTS (

SELECT * FROM deleted as d
INNER JOIN inserted as i
	ON d.CustomerID = i.CustomerID
WHERE i.Balance - d.Balance > 5000
)
RAISERROR('Transferuri mai mari de 5000 RON nu sunt permise!',16,1)

ELSE
	UPDATE ing SET [AccountNumber] = i.AccountNumber
				  ,[FirstName] = i.FirstName
				  ,[LastName] = i.LastName
				  ,[Balance] = i.Balance
	FROM INGBankAccount as ing
	INNER JOIN inserted as i
		ON ing.CustomerID = i.CustomerID



------------------------------------------------------------------------------

DROP TABLE IF EXISTS Books
CREATE TABLE Books (ISBN varchar(50), Name varchar(50), Author varchar(50))

INSERT INTO Books VALUES 
	('978-1-891830-75-4', 'Any Empire', 'Nate Powell'), 
	('978-1-60309-050-6', 'The 120 Days of Simon', 'Simon Gardenfors'),
	('978-1-60309-369-9','Apocrypha Now','Shannon Wheeler'),
	('978-1-60309-069-8','August Moon','Diana Thung')

SELECT langid as LangId, alias as Alias INTO Languages FROM sys.syslanguages

----------------------------------------------------

DROP TABLE IF EXISTS Employees
SELECT e.BusinessEntityID, e2.BusinessEntityID AS ManagerID, p.FirstName, p.LastName, e.BirthDate, e.MaritalStatus, e.Gender, e.HireDate 
INTO Employees 
FROM HumanResources.Employee e
LEFT JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
LEFT JOIN HumanResources.Employee e2 ON e2.OrganizationNode = e.OrganizationNode.GetAncestor(1)

SELECT OrganizationNode.GetAncestor(1), * FROM HumanResources.Employee

UPDATE Employees SET ManagerID = 291 WHERE ManagerID IS NULL

DELETE FROM Employees WHERE BusinessEntityID = 1

-------------------------------------

CREATE TABLE [dbo].[Clienti](
	[id] [int] NULL,
	[nume] [varchar](10) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Clienti] ([id], [nume]) VALUES (1, N'Marcel')
GO
INSERT [dbo].[Clienti] ([id], [nume]) VALUES (2, N'Ionut')
GO
INSERT [dbo].[Clienti] ([id], [nume]) VALUES (3, N'George')
GO
INSERT [dbo].[Clienti] ([id], [nume]) VALUES (4, N'Tudor')
GO
INSERT [dbo].[Clienti] ([id], [nume]) VALUES (5, N'Cornel')
GO

---------------------------------------------------

USE [AdventureWorks2016]
GO
/****** Object:  Table [dbo].[Credit]    Script Date: 02-Feb-20 4:05:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credit](
	[ClientID] [int] NULL,
	[CreditID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance]    Script Date: 02-Feb-20 4:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance](
	[ClientID] [int] NULL,
	[PolicyID] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Credit] ([ClientID], [CreditID]) VALUES (1, 634678)
GO
INSERT [dbo].[Credit] ([ClientID], [CreditID]) VALUES (3, 34685)
GO
INSERT [dbo].[Credit] ([ClientID], [CreditID]) VALUES (8, 234687)
GO
INSERT [dbo].[Credit] ([ClientID], [CreditID]) VALUES (12, 97533)
GO
INSERT [dbo].[Credit] ([ClientID], [CreditID]) VALUES (14, 738553)
GO
INSERT [dbo].[Credit] ([ClientID], [CreditID]) VALUES (25, 34568)
GO
INSERT [dbo].[Credit] ([ClientID], [CreditID]) VALUES (46, 8563)
GO
INSERT [dbo].[Credit] ([ClientID], [CreditID]) VALUES (47, 59423)
GO
INSERT [dbo].[Insurance] ([ClientID], [PolicyID]) VALUES (12, 76347597)
GO
INSERT [dbo].[Insurance] ([ClientID], [PolicyID]) VALUES (23, 652447)
GO
INSERT [dbo].[Insurance] ([ClientID], [PolicyID]) VALUES (25, 693654)
GO
INSERT [dbo].[Insurance] ([ClientID], [PolicyID]) VALUES (49, 467865)
GO
INSERT [dbo].[Insurance] ([ClientID], [PolicyID]) VALUES (57, 47883)
GO
INSERT [dbo].[Insurance] ([ClientID], [PolicyID]) VALUES (62, 967352)
GO

-------------------------

SELECT YEAR(OrderDate) AS Year, SUM(TotalDue) AS SalesTotal INTO YearlySales FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)

-------------------------

DROP TABLE IF EXISTS Employees
SELECT e.BusinessEntityID, e2.BusinessEntityID AS ManagerID, p.FirstName, p.LastName, e.BirthDate, e.MaritalStatus, e.Gender, e.HireDate 
INTO Employees 
FROM HumanResources.Employee e
LEFT JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
LEFT JOIN HumanResources.Employee e2 ON e2.OrganizationNode = e.OrganizationNode.GetAncestor(1)

SELECT OrganizationNode.GetAncestor(1), * FROM HumanResources.Employee

UPDATE Employees SET ManagerID = 291 WHERE ManagerID IS NULL

DELETE FROM Employees WHERE BusinessEntityID = 1
