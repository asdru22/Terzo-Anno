DBMS basato sul modello relazionale (RDBMS)
Ha un'architettura client server

```SQL
drop database if exists idrologia

create database if not exists idrologia

use idrologia

  

create table provincia(

  nome varchar(30) primary key,

  regione varchar(30) not null,

  sigla varchar(2) unique

) engine = "INNODB"

  

create table fiume(

  nome varchar(30) primary key,

  lunghezza int default 0,

  portata float default 0

) engine = "INNODB"

  

create table attraversamento(

  codice int auto_increment

  nomefiume varchar(30),

  nomeprovincia varchar(30)

  foreign key(nomefiume) references fiume(nome)

  foreign key(nomeprovincia) references provincia(nome)

) engine = "INNODB"

  

insert into provincia values("Bologna", "ER", "BO")

insert into provincia values("Modena", "ER", "BO")

insert into provincia values("Parma", "ER", "BO")

insert into attraversamento(nomefiume, nomeprovincia) values(

  "Vomano", "Teramo"

)

select * from provincia


```