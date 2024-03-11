﻿SELECT GETDATE()

--Returnați în ce dată vom fi peste 300 de zile
SELECT GETDATE()
--Returnați câte secunde au trecut de la @d la data curentă
SELECT GETDATE()
SELECT DATEDIFF(ss, @d , GETDATE()) As SecundeDeIeri
--Returnați prima zi a lunii curente
SELECT GETDATE()
SET @d = '2023-06-29 20:00:10' 

--Returnați câte zile mai sunt din luna curentă
SELECT GETDATE()
SELECT DATEDIFF(dd, @d, '2023-06-30') As ZileRamaseLunaCurenta
--Returnați ultima zi a lunii curente
SELECT GETDATE()
SELECT DATEADD(dd, 8, @d) As UltimaZi
--Returnați 1 dacă anul curent este bisect sau 0 dacă nu este an bisect
SELECT GETDATE()
SELECT DATEDIFF(dd, @d, '2023-12-31') As DiferentaDeZileIntreCele2Date
