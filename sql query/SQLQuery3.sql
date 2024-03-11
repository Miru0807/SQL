--1. Toate comenzile din martie 2012 (două modalități).
--a) 
SELECT * FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate)='2012' and MONTH(DueDate)='03'
--b)
--2. Toate produsele care nu conțin cifre în nume, sunt negre și pot avea mărimile L și XL (două modalități).
--a)
SELECT * FROM Production.Product
WHERE Name NOT LIKE '%[0-9]%';
SELECT * FROM Production.Product
WHERE Color LIKE 'Black'
SELECT * FROM Production.Product
WHERE Size LIKE '%L%' OR Size LIKE '%XL%'
--b)
SELECT * FROM Production.Product
WHERE Name NOT LIKE '%0%'
  AND Name NOT LIKE '%1%'
  AND Name NOT LIKE '%2%'
  AND Name NOT LIKE '%3%'
  AND Name NOT LIKE '%4%'
  AND Name NOT LIKE '%5%'
  AND Name NOT LIKE '%6%'
  AND Name NOT LIKE '%7%'
  AND Name NOT LIKE '%8%'
  AND Name NOT LIKE '%9%'
  AND Color = 'BLACK'
  AND Size = 'L' OR SIZE = 'XL' ;
--3. Adăugați un client nou cu numele Thierry D'Hers. Apoi creați un query care să returneze toți clienții care conțin apostrof în LastName.
SELECT * FROM Person.Person


--4. Toate ID-urile pare de produse.
SELECT * FROM Purchasing.PurchaseOrderDetail
WHERE ProductID % 2 = '0';
--5. Toate comenzile pentru care a trecut mai mult de 7 zile până la livrare.
SELECT * FROM Purchasing.PurchaseOrderDetail
WHERE DueDate > 7;
--6. Toate comenzile care au fost date intr-o zi impara din luna.
SELECT * FROM Purchasing.PurchaseOrderDetail
WHERE DueDate % 2 = '1';
--7. Toate produsele pentru care timpul de fabricare depasteste 2 zile si costa mai putin de 200 sau timpul de fabricare e maxim o zi si costa peste 1000. 
SELECT * FROM Production.Product
WHERE (DaysToManufacture > 2 AND StandardCost < 200 )
OR (DaysToManufacture <= 1 AND ListPrice > 1000)
--8. Toate persoanele care si-au modificat cardul de credit in ultimele 6 luni.
SELECT * FROM Person.Person
WHERE ModifiedDate > 6 AND ;

--6. Câți JobCandidates au în CV cuvântul 'manager'.
SELECT * FROM HumanResources.JobCandidate
WHERE Resume = 'manager'
--7. Un singur câmp cu numele complet al persoanelor (din tabelul Person.Person) pentru care AdditionalContactInfo conține stringul 'weekend access'.
SELECT * FROM Person.Person  
WHERE AdditionalContactInfo LIKE 'weekend access';
FirstName AND MiddleName AND LastName