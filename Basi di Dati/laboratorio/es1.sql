drop database if exists idrologia;
create database if not exists idrologia;
use idrologia;
create table provincia(
	nome varchar(30) primary key,
	regione varchar(30) not null,
	sigla varchar(2) unique,
    numerofiumi int default 0
) engine = "INNODB";

create table fiume(
	nome varchar(30) primary key,
	lunghezza int default 0,
	portata float default 0
) engine = "INNODB";

create table attraversamento(
	codice int auto_increment,
	nomefiume varchar(30),
    nomeprovincia varchar(30),
    primary key(codice),
    foreign key(nomefiume) references fiume(nome),
    foreign key(nomeprovincia) references provincia(nome)
) engine = "INNODB";

create view provincia_er(nome, sigla) as
select nome, sigla
from provincia
where (regione="ER");

delimiter $
create trigger AggiornaFiume
after insert on attraversamento
for each row
	begin
	update provincia
	set numerofiumi  = numerofiumi + 1
	where (nome=new.nomeprovincia);
	end
$ delimiter ;

delimiter $
create procedure NuovoAttraversamento(in NFiume varchar(30), in NCitta varchar(30))
	begin
    declare condizioneFiume int;
	declare condizioneProvincia int;
    
    #declare n varchar(30);
    #declare l int;
    #declare p int;
    #declare mioCursore cursor for select * from fiume;
    #open mioCursore;
    ## a ogni operazione di fetch, il puntatore si sposta sulla riga seguente
    #fetch mioCursrore into n, l, p;
    #close mioCursore;
    
    set condizioneFiume = (
		select count(*)
        from fiume
        where (nome = NFiume)
        
    );
    
    set condizioneProvincia = (
		select count(*)
        from provincia
        where (nome = NCitta)
        
    );
    
    if (condizioneFiume > 0 and condizioneProvincia > 0) then
		insert into attraversamento(nomefiume, nomeprovincia) values(NFiume, NCitta);
	end if;
    end
$ delimiter ;

insert into provincia(nome,regione,sigla) values("Bologna", "ER", "BO");
insert into provincia(nome,regione,sigla) values("Modena", "ER", "MO");
insert into provincia(nome,regione,sigla) values("Parma", "ER", "PR");
insert into provincia(nome,regione,sigla) values("Firenze", "Toscana", "FI");

insert into fiume values("Reno",200,5000.00);
insert into fiume values("Arno",240,2000.00);

call NuovoAttraversamento("Reno","Bologna");
call NuovoAttraversamento("Arno","Firenze");
call NuovoAttraversamento("Tevere","Roma");
call NuovoAttraversamento("Arno","Arezzo");

#insert into attraversamento(nomefiume, nomeprovincia) values("Reno", "Bologna");
#insert into attraversamento(nomefiume, nomeprovincia) values("Arno", "Firenze");

select * from attraversamento