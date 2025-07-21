drop table stato;
drop table citta;

CREATE TABLE CITTA
(
    Nome           VARCHAR(50),
    NumeroAbitanti INT,
    AnnoFondazione VARCHAR(10)
);

INSERT INTO CITTA (Nome, NumeroAbitanti, AnnoFondazione)
VALUES ('Roma', 2873000, '753ac'),
       ('Milano', 1352000, '400ac'),
       ('Parigi', 2161000, '259ac'),
       ('Barcellona', 1620000, NULL),
       ('Brasilia', 3039000, '1960'),
       ('Pechino', 21540000, NULL),
       ('Lagos', 16384000, '1967');

CREATE TABLE STATO
(
    Nome         VARCHAR(50),
    NomeCapitale VARCHAR(50),
    Superficie   INT,
    Continente   VARCHAR(50)
);

INSERT INTO STATO (Nome, NomeCapitale, Superficie, Continente)
VALUES ('Italia', 'Roma', 301000, 'Europa'),
       ('Francia', 'Parigi', 543000, 'Europa'),
       ('Nigeria', 'Lagos', 923000, 'Africa'),
       ('Brasile', 'Brasilia', 8516000, 'America'),
       ('Cina', 'Pechino', 9597000, 'Asia'),
       ('Svezia', NULL, 528447, 'Europa'),
       ('Australia', NULL, 7688000, 'Oceania');


select * from citta;

select nome from citta
where NumeroAbitanti <3000000;

select * from citta
where AnnoFondazione is null;


select citta.nome, citta.NumeroAbitanti
from citta, stato
where (citta.nome = stato.NomeCapitale) and
      (stato.Continente= 'Europa');

select stato.nome, stato.continente
from stato, citta
where (citta.nome = stato.NomeCapitale) and
    (citta.NumeroAbitanti between 1000000 and 3000000);

select count(*)
from stato;

select avg(STATO.Superficie)
from stato
where stato.Continente = 'Europa';

select count(*)
from stato, citta
where (citta.nome = stato.NomeCapitale) and
    (citta.NumeroAbitanti < 3000000);

SELECT DISTINCT S1.Continente
FROM STATO S1, STATO S2
WHERE S1.Continente = S2.Continente
  AND S1.Nome <> S2.Nome;

select count(*), continente
from stato, citta
where citta.NumeroAbitanti>=2500000 and
      citta.Nome = stato.NomeCapitale
group by continente;

select s.Continente
from stato as s
group by Continente
having count(*)= 3