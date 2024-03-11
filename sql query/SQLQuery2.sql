SELECT GETDATE()DECLARE @d datetime SET @d = '2023-06-22 20:00:10' SELECT DATEADD(dd, 2, @d) As DataDupa2ZileSELECT DATEADD(mm, 2, @d) As DataDupa2LuniSELECT DATEADD(mi,20, @d) As DataDupa20MinuteSELECT DATEADD(ss, x, @d) As DataDupaxSecundeSELECT DATEDIFF(dd, @d, '2023-04-20') As DiferentaDeZileIntreCele2DateSELECT DATEFROMPARTS(2023, 5, 20) As [DataFormataDinParti:AN,LUNA,ZI]SELECT YEAR(@d), MONTH(@d), DAY(@d) As SelecteazaAnulLunaZiua

--Returnați în ce dată vom fi peste 300 de zile
SELECT GETDATE()DECLARE @d datetime SET @d = '2023-06-22 20:00:10' SELECT DATEADD(dd, 300, @d) As DataDupa300Zile
--Returnați câte secunde au trecut de la @d la data curentă
SELECT GETDATE()DECLARE @d datetime SET @d = '2023-06-22 20:00:10' 
SELECT DATEDIFF(ss, @d , GETDATE()) As SecundeDeIeri
--Returnați prima zi a lunii curente
SELECT GETDATE()DECLARE @d datetime 
SET @d = '2023-06-29 20:00:10' 

--Returnați câte zile mai sunt din luna curentă
SELECT GETDATE()DECLARE @d datetime SET @d = '2023-06-22 20:00:10' 
SELECT DATEDIFF(dd, @d, '2023-06-30') As ZileRamaseLunaCurenta
--Returnați ultima zi a lunii curente
SELECT GETDATE()DECLARE @d datetime SET @d = '2023-06-22 20:00:10' 
SELECT DATEADD(dd, 8, @d) As UltimaZi
--Returnați 1 dacă anul curent este bisect sau 0 dacă nu este an bisect
SELECT GETDATE()DECLARE @d datetime SET @d = '2023-01-01 20:00:10' 
SELECT DATEDIFF(dd, @d, '2023-12-31') As DiferentaDeZileIntreCele2Date

