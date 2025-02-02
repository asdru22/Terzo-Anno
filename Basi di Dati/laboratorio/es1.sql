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

select Nome
from citta
where NumeroAbitanti < 3000000;

select *
from citta
where AnnoFondazione is null;

select c.nome, c.numeroabitanti
from citta as c, stato as s
where s.Continente = 'Europa' and s.NomeCapitale = c.nome;

select s.nome, s.Continente
from stato as s, citta as c
where s.NomeCapitale = c.Nome and
    c.NumeroAbitanti between 1000000 and 3000000;

select count(*) as Count from citta;

select avg(s.Superficie) as SuperficieMedia
from stato as s
where s.Continente='Europa';

select count(*) as CittaPiccole
from citta as c, stato as s
where c.nome = s.NomeCapitale and
    c.NumeroAbitanti < 3000000;

select distinct s1.continente
from stato as s1, stato as s2
where s1.Continente = s2.Continente and
      s1.nome <> s2.Nome;

select s.continente, count(*) as Numerocitta
from citta c
         join stato s on c.nome = s.NomeCapitale
where c.NumeroAbitanti > 2500000
group by s.continente;

select continente
from stato
group by continente
having count(*) = 3;
