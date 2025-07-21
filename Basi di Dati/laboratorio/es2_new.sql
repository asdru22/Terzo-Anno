CREATE TABLE Circolo
(
    Nome              VARCHAR(50),
    Città             VARCHAR(50),
    NumeroCampiTennis INT
);

CREATE TABLE Socio
(
    Cf          VARCHAR(10),
    NomeCircolo VARCHAR(50),
    Nome        VARCHAR(50),
    Cognome     VARCHAR(50),
    AnnoNascita INT
);

CREATE TABLE NumeroTelefono
(
    Numero  VARCHAR(15),
    CfSocio VARCHAR(10)
);

INSERT INTO Circolo (Nome, Città, NumeroCampiTennis)
VALUES ('Supertennis', 'Bologna', 10),
       ('Tennis 2000', 'Bologna', 7),
       ('GiardiniMargherita', 'Bologna', 5),
       ('TennisClub', 'Rimini', 4),
       ('TennisWorld', 'Modena', 6),
       ('TennisLandia', 'Piacenza', 2);



INSERT INTO Socio (Cf, NomeCircolo, Nome, Cognome, AnnoNascita)
VALUES ('MR90', 'Supertennis', 'Mario', 'Rossi', 1990),
       ('MB95', 'TennisWorld', 'Michela', 'Bianchi', 1995),
       ('AN10', 'Tennis 2000', 'Andrea', 'Neri', 2010),
       ('DV05', 'GiardiniMargherita', 'Daniela', 'Viola', 2005),
       ('MA10', 'TennisWorld', 'Marco', 'Arancio', 2010),
       ('MR00', 'Supertennis', 'Maria', 'Rosa', 2000),
       ('MN98', 'Supertennis', 'Maria', 'Nerone', 1998),
       ('MR70', 'GiardiniMargherita', 'Mario', 'Rossini', 1970);



INSERT INTO NumeroTelefono (Numero, CfSocio)
VALUES ('05112454', 'MR90'),
       ('05117453', 'MR90'),
       ('05112455', 'MB95'),
       ('05112356', 'AN10'),
       ('05112154', 'DV05'),
       ('05111354', 'MA10'),
       ('05199432', 'MA10'),
       ('05188881', 'MA10'),
       ('05115454', 'MR00'),
       ('05118954', 'MN98'),
       ('05119754', 'MR70');

select c.nome, c.Città
from circolo as c
where (select s.NomeCircolo
       from socio as s
       where s.nome = 'Marco' and s.Cognome = 'Arancio') = c.nome;

select count(*)
from Socio
where AnnoNascita <2000;

select circolo.nome, count(*)
from circolo, socio
where Circolo.nome = socio.NomeCircolo
group by circolo.nome;

select s.nome, s.cognome
from socio s
join numerotelefono on cf = cfsocio
group by cf,nome,Cognome
having count(numero) >= 2;

SELECT nome, cognome
FROM socio
WHERE cf IN (
    SELECT cfsocio
    FROM numerotelefono
    GROUP BY cfsocio
    HAVING COUNT(*) >= 2
);


select città, sum(NumeroCampiTennis)
from circolo
group by città
having sum(NumeroCampiTennis)>=5;

select c.nome
from circolo c
left join socio s on c.nome = s.NomeCircolo
where C.NumeroCampiTennis > 3
and S.cf is null;

select c.nome
from circolo c
left join socio S on c.nome = s.NomeCircolo
where c.città = 'Bologna'
group by c.nome, c.Città
having count(s.cf>=3) or c.Città = 'Bologna';

select nome
from circolo
where Città = 'Bologna'
   or nome in (
    select NomeCircolo
    from socio
    group by NomeCircolo
    having count(*) >= 3
);

select s.cf, count(*)
from socio s
join circolo c on s.NomeCircolo = c.nome
join NumeroTelefono t on s.cf = t.CfSocio
where c.Città = 'Bologna'
group by s.cf;

select s.nome, s.cognome, t.numero
from socio s
join numerotelefono t on s.cf = t.CfSocio
where s.AnnoNascita > 1995;

select nome, cognome
from socio
group by Cf,Nome,Cognome,AnnoNascita,NomeCircolo
having AnnoNascita> 1992 and
       NomeCircolo in (
           SELECT Nome
           FROM Circolo
           WHERE Città = 'Bologna'
);


select count(*)
from socio s
where exists(
    select s.nome
    from circolo c
    where s.NomeCircolo = c.Nome
    and c.Città = 'Bologna'
);

select nome, cognome
from socio
where AnnoNascita = (
    select max(AnnoNascita)
    from socio
    );

select nome, città
from circolo c
where not exists(
    select AnnoNascita
    from socio s
    where AnnoNascita > 1998 and
          s.NomeCircolo = c.nome
);


select c.nome, c.città
from circolo c
where C.nome = (
    select s.nomecircolo
    from socio s
    where s.AnnoNascita > 1996
    group by s.nomecircolo
    order by count(*) desc
    limit 1
);

select s.nome, s.cognome
from socio s
where s.AnnoNascita < all (
    select AnnoNascita
    from Socio
    where NomeCircolo = 'Roma Tennis Club'
);

select nome, cognome
from socio
where NomeCircolo in (
    select nome
    from circolo
    where Città = 'Bologna'
    )