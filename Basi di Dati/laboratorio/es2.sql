CREATE TABLE Circolo
(
    Nome              VARCHAR(50),
    Città             VARCHAR(50),
    NumeroCampiTennis INT
);

INSERT INTO Circolo (Nome, Città, NumeroCampiTennis)
VALUES ('Supertennis', 'Bologna', 10),
       ('Tennis 2000', 'Bologna', 7),
       ('GiardiniMargherita', 'Bologna', 5),
       ('TennisClub', 'Rimini', 4),
       ('TennisWorld', 'Modena', 6),
       ('TennisLandia', 'Piacenza', 2);

CREATE TABLE Socio
(
    Cf          VARCHAR(10),
    NomeCircolo VARCHAR(50),
    Nome        VARCHAR(50),
    Cognome     VARCHAR(50),
    AnnoNascita INT
);

INSERT INTO Socio (Cf, NomeCircolo, Nome, Cognome, AnnoNascita)
VALUES ('MR90', 'Supertennis', 'Mario', 'Rossi', 1990),
       ('MB95', 'TennisWorld', 'Michela', 'Bianchi', 1995),
       ('AN10', 'Tennis 2000', 'Andrea', 'Neri', 2010),
       ('DV05', 'GiardiniMargherita', 'Daniela', 'Viola', 2005),
       ('MA10', 'TennisWorld', 'Marco', 'Arancio', 2010),
       ('MR00', 'Supertennis', 'Maria', 'Rosa', 2000),
       ('MN98', 'Supertennis', 'Maria', 'Nerone', 1998),
       ('MR70', 'GiardiniMargherita', 'Mario', 'Rossini', 1970);

CREATE TABLE NumeroTelefono
(
    Numero  VARCHAR(15),
    CfSocio VARCHAR(10)
);

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


select c.nome, c.città
from circolo c, socio s
where s.nome = 'Marco' and
      s.cognome = 'Arancio' and
      s.NomeCircolo = c.nome;

select count(*)
from socio
where AnnoNascita < 2000;

select c.nome, count(*)
from socio s, circolo c
where s.NomeCircolo = c.Nome
group by c.nome;

select nome, cognome
from socio
join numerotelefono on (cf = cfsocio)
group by cf, nome, cognome
having count(numero) >=2;

select città, sum(NumeroCampiTennis)
from circolo
group by città
having sum(NumeroCampiTennis) >= 5;

select c.nome
from circolo c
left join socio s on (c.nome = s.NomeCircolo)
where NumeroCampiTennis > 3 and cf is null;

# Scrivere la query che calcola i nomi dei circoli
# che si trovano a Bologna oppure che hanno almeno 3 soci.
select c.nome
from circolo c
left join socio s on (c.nome = s.NomeCircolo)
where città = 'Bologna'
group by c.nome, c.Città
having count(s.cf) >= 3 or c.Città = 'Bologna';

# Scrivere la query che calcola, per ogni socio iscritto
# ad un circolo di Bologna, il numero di recapiti telefonici a
# disposizione [VINCOLO: Usare l’operatore di JOIN].
select s.cf, count(*)
from socio s
join numerotelefono n on (s.cf = n.CfSocio)
join circolo c on (s.NomeCircolo = c.nome)
where c.Città = 'Bologna'
group by s.cf;

# Scrivi la query che calcola Nome, Cognome
# e numero di telefono per i membri nati dopo
# il 1996 [VINCOLI: Utilizzare l'operatore JOIN].
select s.nome, s.cognome, n.numero
from socio s
join numerotelefono n on (s.cf = n.CfSocio)
where s.AnnoNascita > 1995;

# Scrivere la query che calcola Nome e Cognome dei soci
# nati dopo il 1992 ed iscritti a circoli di Bologna
# [VINCOLO: Usare query aggregate semplici].

select s.nome, s.cognome
from socio s, circolo c
where(
    s.AnnoNascita > 1992 and
    s.NomeCircolo = c.Nome and
    c.Città = 'Bologna'
         );

# Scrivere la query che calcola il numero dei soci iscritti
# a circoli di Bologna [VINCOLO: Usare operatore di EXISTS].
select count(*)
from socio s
where exists(
    select s.Nome
    from circolo c
    where c.nome = s.NomeCircolo and
          c.città = 'Bologna'
);

# Scrivere la query che calcola nome e cognome del
# SOCIO più giovane.
select s.nome, s.Cognome
from socio s
where s.AnnoNascita = (
    select max(AnnoNascita)
    from socio s
    );

# Scrivere la query che calcola Nome e Città dei CIRCOLI
# che NON hanno SOCI nati dopo il 1998.
select c.nome, c.città
from circolo c
where not exists (
    select s.annonascita
    from socio s
    where s.AnnoNascita > 1998 and
          s.NomeCircolo = c.Nome
);

# Scrivere la query che calcola Nome e Città del CIRCOLO
# con più soci nati dopo il 1996.
select c.nome, c.città
from circolo c
where C.nome = (
    select s.nomecircolo
    from socio s
    where s.AnnoNascita > 1996
    group by s.nomecircolo
    order by count(*) desc
    limit 1 # restituisce il primo (quello con più elementi)
    );


select s.nome, s.cognome
from socio s
where s.AnnoNascita = (
    select min(AnnoNascita)
    from socio 
    );

select s.nome, s.cognome, s.cf  
from socio s
right join numerotelefono n on s.cf = n.CfSocio
group by s.nome, s.cognome, s.cf