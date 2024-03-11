--1. Returnați într-o singură coloană numele întreg al tuturor clienților (FirstName, MiddleName, LastName).
SELECT FirstName ,MiddleName, LastName
FROM 'Customers';
--2. Returnați toate produsele într-o coloană și o a doua coloană cu categoria din care fac parte. Creați trei categorii de produse (low-end, high-end, premium) în funcție de costul fiecărui produs: <1000, 1000-2000, >=2000.


--3. Dacă culoarea produsului este NULL să apară 'No Color'.


--4. Scoateți cratimele din numele produselor.


--5. Câte secunde s-au scurs de la începutul anului curent. Aici nu aveți nevoie de FROM.


--6. Afișați data fiecărei comenzi în format american (mm/dd/yyyy).


--7.Returnați toți vânzătorii și creați-le fiecăruia un cod unic compus din prima literă uppercase a numelui de familie, prima literă uppercase a prenumelui și patru cifre care să conțină ID-ul fiecăruia (ex: Andrei Neagu cu ID-ul 1 se transformă în AN0001, Bogdan Ștefănescu cu ID-ul 12 se transformă în BS0012).


--8. Returnați al doilea cuvânt din numele produselor.


--9.Returnați o singură valoare/celulă cu toate numele clienților despărțite de virgulă.


--10.Folosind UPDATE modificați câteva comenzi altfel încât să existe în tabel comenzi cu toate statusurile de la 1 la 5. Apoi faceți un select care să returneze toate comenzile și înlocuiți numărul statusului cu descrierea lui: 1=registered, 2=paid, 3=processed, 4=sent, 5=delivered.


--11.Afișați trei coloane. Prima să fie OrderID. În a doua coloană calculați data de peste 7 zile de la data înregistrării comenzii. În a treia coloană afișați cuvântul 'Alert' dacă ShipDate este mai mare decât valoarea din a doua coloană.

