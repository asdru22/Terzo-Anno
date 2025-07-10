#import "settings.typ": *

#set page(
  paper: "a4",
  flipped: true,
  numbering: "1",
  columns: 2,
  margin: 20pt,
)
#set heading(numbering: "1.1")
#outline(title: "Indice", depth: 2)

#show raw: it => box(it, fill: luma(240), inset: (x: 3pt, y: 0pt), outset: (y: 3pt), radius: 2pt, width: if it.block {
  100%
} else { auto })

= Introduzione ai DBMS
*Modello relazionale*: organizza i dati in record di dimensione fissa mediante tabelle. \
*Sistema informativo* (SI): componente di un'organizzazione il cui scopo è gestire le informazioni utili ai fini dell'organizzazione stessa. \
*DBMS*: sistema software in grado di gestire collezioni di dati grandi, condivise e persistenti in maniera efficiente e sicura. \
*Base di dati*: collezione di dati gestita da un DBMS. \
== Architettura a livelli del DBMS
Ogni livello è indipendente dall'altro
- *Schema esterno*: come si presenta il DB, e come varia in base ai permessi di accesso.
- *Schema logico*: come sono strutturati i dati e che relazioni hanno. In genere il modello logico utilizzato è quello relazionale, dove i dati sono organizzati in tabelle. Si usano delle regole per modellare eventuali vincoli e restrizioni sui dati.
- *Schema fisico*: come/dove sono memorizzati i dati.
#hb
SQL è un linguaggio orientato ai dati, usato per il modello relazionale. \
Un DBMS si usa quando:
- i dati sono condivisi da più utenti;
- i dati sono persistenti;
- i dati sono voluminosi e complessi;
- servono meccanismi di sicurezza e controllo degli accessi;

= Modello relazionale
Siamo nello schema logico: definiamo le tabelle, le relazioni tra di esse e i vincoli sui dati. \
Il modello relazionale è il più utilizzato, garantisce indipendenza tra i livelli e si basa su nozioni di algebra relazionale. \
== Struttura
I dati sono organizzati in record di dimensione fissa e divisi in tabelle (relazioni). \
- Colonne: rappresentano gli attributi, hanno un nome e un tipo di dato. \
- Intestazione della tabella (nome tabella + nome attributi): *schema* della relazione. \
- Righe della tabella: istanze della relazione (ennuple)#footnote([Un'ennupla (o tupla) corrisponde ad un istanza della relazione.]). \
L'ordine delle righe e delle colonne non ha importanza, ma l'ordine degli attributi sì. \
== Vincoli sui dati della relazione
- non possono esistere attributi con lo stesso nome;
- non possono esistere righe uguali;
- i dati di una colonna devono essere omogenei (omogeneità di tipo);
Si possono avere schemi senza istanze, ma non istanze senza schema. \
== Prima forma normale (PFN)
Una relazione è in PMF se tutti gli attributi sono atomici, cioè non possono essere ulteriormente divisi. \
Non è possibile omettere un valore da una ennupla: devono avere tutti i campi obbligatoriamente.
#hb
Una base di dati può essere costituita da molte tabelle. Spesso, le informazioni contenute in relazioni diverse sono correlate logicamente tra loro. Nel modello relazionale, i riferimenti tra dati in relazioni differenti sono espressi mediante valori.
#figure(
  grid(
    columns: 2,
    inset: 4pt,
    db(
      3,
      [Corsi],
      [Nome corso],
      [Codice Corso],
      [Nome Docente],
      [Basi di dati],
      [#text(fill: red)[BD001]],
      [Mario Rossi],
      [Sistemi informativi],
      [SI002],
      [Giovanni Verdi],
    ),
    db(
      3,
      [Esami],
      [Corso],
      [Studente],
      [Voto],
      [#text(fill: red)[BD001]],
      [Luca Bianchi],
      [30],
      [BD001],
      [Anna Neri],
      [28],
    ),
  ),
  caption: [Esami contiene un codice che è lo stesso di corsi],
)

Nella progettazione, bisogna tradurre le informazioni in dati del modello relazionale. Ci si chiede quali dati devono essere gestiti e quante tabelle servono. \
== Schema matematico del modello relazionale
#def()[Dati $n$ insiemi $D_1,D_2,dots,D_n$, una relazione matematica su questi insiemi è un sottoinsieme del prodotto cartesiano $D_1 times D_2 times dots times D_n$.]

#def()[Il prodotto cartesiano degli insiemi $D_1,D_2,dots,D_n$ è l'insieme di tutte le ennuple ordinate $(d_1,d_2,dots,d_n)$ con $d_i in D_i, forall i =1,dots,n$.]

#ex([Relazione])[$A={a,b,c,d,e},space B = {1,2,3}\ A times B = {(a,1),(a,2),(a,3),(b,1),(b,2), \ (b,3),(c,1),(c,2),(c,3),(d,1),(d,2),(d,3),(e,1),(e,2),(e,3)}\ R_1 subset.eq A times B = {(a,1),(a,2),(a,3)}\ R_2 subset.eq A times B = {(a,2),(b,1),(d,3),(e,3)}$\ $A$ e $B$ sono due tabelle con un solo campo. $a,b,c,dots,1,2,3$ sono le istanze. Il prodotto cartesiano unisce tutte le istanze facendo tutte le combinazioni possibili. Le istanze di $A times B$ sono tutte le combinazioni di $A$ e $B$. Le relazioni $R_1$ e $R_2$ sono sottoinsiemi del prodotto cartesiano, quindi sono relazioni.]
Una ennupla su un di attributi $X$ è una funzione che associa a ciascun attributo $A$ in $X$ un valore del dominio di $A$. \
$T[A]$ indica il valore dell'ennupla $T$ nell'attributo $A$. \

== Informazioni incomplete
In una relazione le ennuple devono essere omogenee, ossia avere tutte la stessa struttura. Se il valore di un attributo non è noto, si usa il valore #null.
$T[A] in A or$ #null $forall "attributo" A$.\
Per definizione, il valore #null non è uguale a nessun altro valore, nemmeno a se stesso #footnote([#null $eq.not$ #null.]). \

== Vincoli di integrità
I vincoli di integrità sono regole che limitano i valori che possono essere inseriti in una relazione. \
Un vincolo è una funzione booleana che associa ad una istanza $r$ di una base di dati definita su uno schema $R={R_1(x_1),dots, R_k(x_k)}$ un valore booleano. Un'istanza è lecita se soddisfa tutti i vincoli.
=== Vincoli intra-relazionali
I vincoli intra-relazionali sono regole che limitano i valori che possono essere inseriti in una singola relazione. \
*Vincoli di ennupla*: questi vincoli esprimono condizioni su una ennupla, considerata singolarmente. Possono essere espressi tramite espressioni algebriche o booleane.

#ex([Vincolo di ennupla])[`((voto>=18) and (voto<=30))`, `not((lode=true) and (voto!=30))`, `(saldo = entrate-uscite)`]

*Vincoli di chiave*: una chiave è un insieme di attributi che consente di identificare in maniera univoca le ennuple di una relazione.

#ex([Chiave])[La matricola di uno studente: studenti(matricola, cognome, nome, data). Non esistono due studenti con la stessa matricola: data la matricola di uno studente è possibile risalire a tutti i suoi dati.]

#def()[*Superchiave*\ Un sottoinsieme di $k$ attributi di una relazione è una superchiave se non contiene due ennuple distinte $T_1$ e $T_2$ con $T_1[k]=T_2[k]$. Nell'esempio di prima, matricola è una superchiave]
#def()[*Superchiave Minimale*\ La superchiave $k "è minimale" arrow.l.r.double.long exists.not k' | k subset.eq k'$. $k$ è la superchiave più piccola, non ne esiste un'altra che la contenga. ]
In una relazione esiste sempre almeno una superchiave alla peggio si prendono tutti i campi#footnote([Per definizione non possono esserci due ennuple uguali.]).

#imp()[Le chiavi servono per accedere a ciascuna ennupla della base di dati in maniera univoca e correlare dati tra relazioni (tabelle) differenti.]

#def()[*Chiave Primaria* \ Chiave di una relazione su cui non sono attesi valori #null. Gli attributi che formano la chiave primaria sono per convenzione sottolineati.
  #ex([Chiave primaria])[studenti(#underline([matricola]), nome, cognome)]
  #ex([Chiave primaria con più attributi])[partita(#underline([squadra1]),#underline([squadra2]),#underline([data]),punti1, punti2)]
]
Ogni relazione deve disporre di una chiave primaria. Se tutti i campi presentano dei valori #null, si aggiunge un codice univoco o un identificativo progressivo.

=== Vincoli inter-relazionali
Una base di dati può essere composta da molte relazioni collegate tra loro. I collegamenti tra relazioni differenti sono espressi tramite valori comuni in attributi replicati.
#imp()[Ogni riga della tabella referenziante si collega al massimo ad una riga della tabella referenziata, in base ai valori comuni nell'attributo replicato.
  #grid(
    rows: 2,
    inset: 5pt,
    [tabella referenziata (chiave primaria)],
    [tabella referenziante (chiave secondaria)],
  )
]

Un vincolo di integrità referenziale (chiave esterna) fra gli attributi $x$ di $R_1$ e un'altra relazione $R_2$ impone ai valori su $x$ in $R_1$ di comparire come valori della chiave primaria di $R_2$.
#imp()[Il vincolo garantisce che non ci siano riferimenti a elementi inesistenti: ogni valore usato come chiave esterna in una tabella deve esistere come chiave primaria nell'altra tabella a cui si riferisce.]
== Problemi
Se un operazione di aggiornamento o modifica causa violazioni dei vincoli di integrità su altre relazioni
- non si consente l'operazione;
- si elimina a cascata
- si inseriscono valori #null

= Linguaggio SQL
#def()[*Relational DataBase Management System (RDBMS)* \
  Un RDBMS è un software che consente di creare, gestire, modificare e interrogare basi di dati strutturate in forma relazionale e usa SQL per operare sui dati.]
I linguaggi data-oriented permettono di implementare il modello relazionale in un RDBMS. Essi dispongono di UI, linguaggi basati su proprietà algebrico-logiche. Il più famoso è SQL.

Si applicano i concetti del modello relazionale, ma con delle differenze:
- si parla di tabelle e non di relazioni;
- il sistema dei vincoli è più espressivo;
- ci possono essere tabelle con righe duplicate se non c'è la chiave primaria;
- il vincolo di integrità referenziale è meno stringente.

== SQL-DDL
Contiene i costrutti necessari per la creazione e modifica dello schema della base di dati.
#table(
  inset: 5pt,
  columns: 2,
  [`create database[if not exists] <nome DB>`], [crea DB],
  [`drop database[if exists] <nome DB>`], [cancella DB],
  [```
    create table NOMETABELLA(
      NOMEATTRIBUTO1 DOMINIO[<val default>][<vincoli>]
      ...
    )
    ```],
  [crea tabella],
)

#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*Domini*]),
  [`character[<lunghezza max>][<lunghezza>]` alternativa `varchar(<lunghezza>)`],
  [Se la lunghezza non è specificata accetta un singolo carattere],
  [
    -`numeric[(Precisione [,Scala])])`
    -`decimal[(Precisione [,Scala])])`
    - `integer`
    - `smallint`
  ],
  [I tipi numerici esatti consentono di rappresentare valori esatti, interi o con una parte decimale di lunghezza prefissata.],
  [
    - `integer auto_increment`
    - `smallint auto_increment`
  ],
  [La keyword `auto_increment` consente di creare campi numerici che si auto-incrementano ad ogni nuovo inserimento nella tabella.],
  [
    - `float [<precision>]`
    - `real`
    - `double [<precision>]`
  ],
  [I tipi numerici approssimati consentono di rappresentare valori reali con rappresentazione in virgola mobile.],
  [
    - `date [(Precisione)]`
    - `time [(Precisione)]`
    - `timestamp`
  ],
  [I domini temporali consentono di rappresentare informazioni temporali o intervalli di tempo.],
  [`boolean`],
  [I domini booleani consentono di rappresentare valori booleani],
  [
    - `blob`
    - `cblob`
  ],
  [I domini blob e cblob consentono di rappresentare oggetti di grandi dimensioni come sequenza di valori binari (`blob`) o di caratteri (`cblob`).],
  [```
    create domain NomeDominio as TipoDati
      [Valore di default]
      [Vincolo]
    ```],
  [Tramite il costrutto `domain`, l'utente può costruire un proprio dominio di dati a partire dai domini elementari.
    ```sql
    CREATE DOMAIN Voto AS SMALLINT
    DEFAULT NULL
    CHECK ( value >=18 AND value <= 30 )
    ```],
)
=== Vincoli
Per ciascun dominio o attributo è possibile definire dei vincoli che devono essere rispettati da tutte le istanze di quel dominio o attributo.
- Vincoli *intra-relazionali*:
  - vincoli generici di ennupla
  - vincolo `not null`
  - vincolo `unique`
  - vincolo `primary key`
- Vincoli *inter-referenziali*:
  - vincolo `references`

#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*Vincoli*]),
  [`check(<condizione>)`],
  [Il vincolo viene valutato ennupla per ennupla.\ `VOTO SMALLINT CHECK((VOTO>=18) and (VOTO<=30))`],
  [`not null`],
  [Il vincolo `not null` indica che il valore #null non è ammesso come valore dell'attributo.\ `NUMEROORE SMALLINT NOT NULL`],
  [
    - `Attributo Dominio [<default value>] unique`: la superchiave è un solo attributo
    - `unique(Attributo1, Attributo2, ...)`: la superchiave è composta da più attributi
  ],
  [Il vincolo `unique` impone che l'attributo/attributi su cui sia applica non presenti valori comuni in righe differenti, ossia che l'attributo/i sia una superchiave della tabella. Con `unique` sono ammessi valori #null dato che sono considerati diversi tra loro.],
  [
    - `Attributo Dominio [ValDefault] primary key`: la chiave è un solo attributo.
    - `primary key(Attributo1, Attributo2, ...)`: la chiave è composta da più attributi.
  ],
  [Il vincolo `primary key` impone che l'attributo/attributi su cui sia applica non presenti valori comuni in righe differenti e non assuma valori #null: ossia che l'attributo/i sia una chiave primaria.
    ```sql
    CREATE TABLE IMPIEGATI (
      ARTICOLO INTEGER NOT NULL
      AUTO_INCREMENT PRIMARY KEY,
      ...
    )
    ```
  ],
)

I vincoli `references` e `foreign key` consentono di definire dei vincoli di integrità referenziale tra i valori di un attributo nella tabella in cui è definito (tabella interna) ed i valori di un attributo in una seconda tabella (tabella esterna).
#imp()[L'attributo/i cui si fa riferimento nella tabella esterna
  deve/devono essere soggetto/i al vincolo unique.]

```sql
CREATE TABLE ESAMI (
CORSO VARCHAR(4) REFERENCES CORSI(CODICE)
STUDENTE VARCHAR(20),
PRIMARY KEY(CORSO, MATRICOLA),
...
)
```
#figure(
  grid(
    columns: 2,
    inset: 4pt,
    db(
      3,
      [Corsi],
      [Nome corso],
      [#underline([Codice Corso], stroke: 2pt)],
      [Nome Docente],
      [Basi di dati],
      [BD001],
      [Mario Rossi],
      [Sistemi informativi],
      [SI002],
      [Giovanni Verdi],
    ),
    db(
      3,
      [Esami],
      [#underline([Corso], stroke: 2pt)],
      [Studente],
      [Voto],
      [BD001],
      [Luca Bianchi],
      [30],
      [BD001],
      [Anna Neri],
      [28],
    ),
  ),
  caption: [Vincoli di integrità referenziale],
)
Il costrutto `foreign key` si utilizza nel caso il vincolo di integrità referenziale riguardi più di un attributo delle tabelle interne/esterne.
```sql
CREATE TABLE STUDENTE (
  MATRICOLA CHARACTER(20) PRIMARY KEY,
  NOME VARCHAR(20),
  COGNOME VARCHAR(20),
  DATANASCITA DATE,
  FOREIGN KEY(NOME,COGNOME,DATANASCITA) REFERENCES
  ANAGRAFICA(NOME,COGNOME,DATA)
);
```
Se un valore nella tabella esterna viene cancellato o viene
modificato il vincolo di integrità referenziale nella tabella interna potrebbe non essere più valido.
#imp[Si possono associare azioni specifiche da eseguire sulla tabella interna in caso di violazioni del vincolo di integrità referenziale.\
  `on (delete | update) (cascade | set null | set default| no action)`
  - `cascade`: elimina/aggiorna righe (della tabella interna)
  - `set default`: ripristina il valore di default
  - `no action`: non consente l'azione (sulla tabella esterna)
  - `set null` : setta i valori a #null
]

#eacc possibile modificare gli schemi di dati precedentemente creati tramite le primitive di `alter` (modifica) e `drop` (cancellazione).

- `drop (schema|domain|table|view) NomeElemento`
- `drop (restrict|cascade) NomeElemento`
```sql
alter NomeTabella
  alter column NomeAttributo
  add column NomeAttributo
  drop column NomeAttributo
  add constraint DefVincolo
```

== SQL-DML
Contiene i costrutti per le interrogazioni, inserimento, eliminazione e modifica dei dati.
=== Query
```sql
select attributo1, ... , attributoM
from tabella1, ... , tabellaN
where condizione
```
#imp[Fa il prodotto cartesiano tra #underline([tabella1,..., tabellaN]). Da queste, estrai le righe che rispettano la #underline([condizione]). Di quest'ultime, preleva solo le colonne corrispondenti ad #underline([attributo1, ... ,AttributoM]).]
Il risultato è una tabella con le righe e colonne richieste dalla query.

Nella clausola `where`, è possibile fare confronti tra stringhe usando l'operatore `like` e l'utilizzo di wildcard:
- `_`: singolo carattere arbitrario
- `%`: sequenza di caratteri arbitraria
#ex([Wildcard])[
  ```sql
  SELECT CODICE
  FROM IMPIEGATI
  WHERE (NOME LIKE "M_R%O")
  ```]
`between` consente di verificare l'appartenenza ad un certo insieme di valori.
#ex([`between`])[Trovare i codici degli impiegati il cui stipendio sia compreso tra i 24000 ed i 34000 euro annui:
  ```sql
  SELECT NOME
  FROM IMPIEGATI
  WHERE (STIPENDIO BETWEEN 24000 AND 34000)
  ```
]

#eacc possibile ridenominare le colonne del risultato di una
query attraverso il costrutto `as`.
#ex([`as`])[
  ```sql
  SELECT NOME as Name, Cognome as LastName
  FROM IMPIEGATI
  WHERE (NOME="Marco")
  ```
]

#ex([`select` su più tabelle])[
  ```sql
  SELECT TELEFONO AS TEL
  FROM IMPIEGATI, SEDI
  WHERE (UFFICIO=UFFNUM) AND (CODICE=145)
  ```
  + Si effettua il prodotto cartesiano delle due tabelle
  + Si selezionano le righe dove `UFFICIO=UFFNUM` nelle tue tabelle
  + Si selezionano le righe $r_(145)$ relative all'impiegato con `codice=145`
  + Si seleziona la colonna dell'attributo Telefono ($c_("tel")$)
  + Si costruisce il risultato finale ($r_(145) inter c_("tel")= 2035434$)
]
Se le tabelle della clausola `from` hanno attributi con nomi uguali si può utilizzare la notazione `NomeTabella.NomeAttributo` per far riferimento ad un attributo in maniera non ambigua.
```sql
SELECT TELEFONO AS TEL
FROM IMPIEGATI, SEDI
WHERE (IMPIEGATI.UFFICIO=SEDI.UFFICIO) AND (CODICE=145)
```
Il costrutto `distinct` (nella `select`) consente di rimuovere i duplicati nel risultato. Il comportamento di default `all` non lo fa.
#ex([`select distinct`])[
  ```sql
  SELECT DISTINCT NOME AS NAME
  FROM IMPIEGATI AS I
  WHERE (STIPENDIO >20000)
  ```
]
Il costrutto `order by` consente di ordinare le righe del risultato di un'interrogazione in base al valore di un attributo specificato.
`order by Attributo1 [asc|desc], ... , AttributoN [asc|desc]`
#ex([`order by`])[
  ```sql
  SELECT *
  FROM IMPIEGATI
  WHERE (UFFICIO=“A”)
  ORDER BY STIPENDIO
  ```
]

=== Operatori Aggregati
Gli operatori aggregati producono come risultato un solo valore.
Solitamente sono inseriti nella `select` e valutati dopo il `where` e `from`.

#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*Operatori Aggregati*]),
  [`count (* | [distinct|all] Lista Attributi)`],
  table.cell(rowspan: 2)[`*` si applica su tutti gli attributi, in pratica conta il numero di righe],
  [
    - `sum(Lista Attributi)`
    - `avg(Lista Attributi)`
    - `min(Lista Attributi)`
    - `max(Lista Attributi)`
  ],
)
#ex(`count(*)`)[
  ```sql
  SELECT COUNT(*) AS CONTATORE
  FROM STRUTTURATI
  WHERE (DIPARTIMENTO="FISICA")
  ```
  + Si considerano le tabelle indicate nella clausola `FROM`
  + Si effettua il prodotto cartesiano delle tabelle.
  + Si selezionano le righe che soddisfano la condizione del `WHERE`.
  + Si considera l'Attributo della `SELECT` e si applica l'operatore aggregato su tutti i valori della colonna.
  + Dalla colonna si calcola un solo valore come risultato della query
]

L'operatore di raggruppamento consente di dividere la
tabella in gruppi, ognuno caratterizzato da un valore
comune dell'attributo specificato nell'operatore. Ogni gruppo produce una sola riga nel risultato finale.
#imp[`groupby` combina
  - `SELECT ATTRIBUTI FROM WHERE` che valuta i valori di ciascuna riga in isolamento.
  - `SELECT OP(ATTRIBUTI) FROM WHERE`  che valuta i valori delle righe corrispondenti alle colonne della `SELECT` in modo aggregato.
]

#ex(`groupby`)[
  ```sql
  SELECT DIPARTIMENTO AS DIP, COUNT(*) AS NUMERO
  FROM STRUTTURATI
  GROUPBY DIPARTIMENTO
  ```
  + Partizionamento della tabella (in questo caso si raggruppano quelle con lo stesso dipartimento)
  + Si applica la `select` su ciascun gruppo
  + Si costruisce il risultato finale (si riuniscono le tabelle restituite dalla `select`)
]

#eacc possibile filtrare i gruppi in base a determinate condizioni, attraverso il costrutto `having`.
#ex([`having`])[
  ```sql
  SELECT ListaAttributi1
  FROM ListaTabelle
  WHERE Condizione
  GROUPBY ListaAttributi2
  HAVING Condizione
  ```
  + Prodotto cartesiano delle tabelle
  + Estrazione delle righe che rispettano la condizione della clausola `WHERE`
  + Partizionamento della tabella (`groupby ...`)
  + Selezione dei gruppi (`having ... `)
  + Selezione dei valori delle colonne o esecuzione degli operatori aggregati su ciascuno dei gruppi, e composizione della tabella finale. (`select ...`)
]

#imp[Nel `where` non si possono mettere gli operatori aggregati, nell'`having` si.\
  `where` valuta riga per riga, `having` valuta su ciascun gruppo a livello aggregato.
]
=== Operazioni Insiemistiche
#eacc possibile effettuare operazioni insiemistiche o risultati di `select` se gli attributi hanno tipi compatibili.
#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*Operazioni Insiemistiche*]),
  [`union`],
  [Estrarre nome e cognome di tutto il personale universitario (strutturati + tecnici)
    ```sql
    SELECT NOME, COGNOME
    FROM STRUTTURATI
    UNION
    SELECT NOME, COGNOME
    FROM TECNICI
    ```],
  [`intersect`],
  [Estrarre nome e cognome degli strutturati che hanno degli omonimi che lavorano come tecnici.
    ```sql
    SELECT NOME, COGNOME
    FROM STRUTTURATI
    INTERSECT
    SELECT NOME, COGNOME
    FROM TECNICI
    ```],
  [`except`],
  [
    Estrarre nome e cognome degli strutturati che non hanno degli omonimi che lavorano come tecnici
    ```sql
    SELECT NOME, COGNOME
    FROM STRUTTURATI
    EXCEPT
    SELECT NOME, COGNOME
    FROM TECNICI
    ```],
)
=== Modifica dell'istanza
#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*Modifica dell'Istanza*]),
  [`insert`],
  [Inserire una riga esplicitando i valori degli attributi oppure estraendo le righe da altre tabelle del database.
    ```sql
    INSERT INTO IMPIEGATI(Codice, Nome, Cognome, Ufficio)
    values ("8","Vittorio","Rossi","A")
    ```
    I valori non specificati di default sono #null.],
  [`delete`],
  [Cancellare tutte le righe che soddisfano una condizione(cancella tutto se non specificata).
    ```sql
    DELETE FROM IMPIEGATI
    DELETE FROM IMPIEGATI WHERE (UFFICIO="A")
    DELETE FROM TABELLA WHERE NOME IN (
    SELECT NOME FROM IMPIEGATICOMUNE)
    ```],
  [`update`],
  [Aggiornare il contenuto di uno o più attributi di una tabella che rispettano una certa condizione.
    ```sql
    update NomeTabella
    set attributo = expr|SELECT|null|default
    [where Condizione]
    UPDATE IMPIEGATI
    SET NOME="Mario"
    WHERE (CODICE=5)
    ```
    ```sql
    UPDATE IMPIEGATI SET NOME=(SELECT NOME FROM IMPIEGATICOMUNE WHERE CODICE=5) WHERE (CODICE=5)
    ```
  ],
)
=== Join
#eacc possibile implementare il `join` tra tabelle in due modi distinti (ma equivalenti nel risultato):
- Inserendo le condizioni del `JOIN` direttamente nella clausola del `WHERE`;
- Attraverso l'utilizzo dell'operatore di `inner JOIN` nella clausola `FROM`.
#ex([`inner join`])[
  ```sql
  SELECT Modello
  FROM GUIDATORI JOIN VEICOLI
  ON GUIDATORI.NrPatente
  =VEICOLI.NrPatente
  WHERE (Nome="Sara")
  ```
]

#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*Varianti del `join`*]),
  [`left join`],
  [Risultato dell'`inner join` + righe della tabella di sinistra che non hanno un corrispettivo a destra (completate con valori #null).
    ```sql
    SELECT ListaAttributi
    FROM Tabella LEFT JOIN Tabella ON CondizioneJoin
    [WHERE Condizione]
    ...
    ```
  ],
  [`right join`],
  [Risultato dell'`inner join` + righe della tabella di destra che non hanno un corrispettivo a sinistra (completate con valori #null).
    ```sql
    SELECT ListaAttributi
    FROM Tabella RIGHT JOIN Tabella ON CondizioneJoin
    [WHERE Condizione]
    ...
    ```
  ],
  [`full join`],
  [Risultato dell'inner join + righe della tabella di sinistra/destra che non hanno un corrispettivo a destra/sinistra (completate con valori #null).
    ```sql
    SELECT ListaAttributi
    FROM Tabella FULL JOIN Tabella ON CondizioneJoin
    [WHERE Condizione]
    ...
    ```
  ],
)

== Interrogazioni Annidate
Nella clausola `where`#footnote[Non è possibile annidare due query nelle altre clausole.], oltre ad espressioni semplici, possono comparire espressioni complesse in cui il valore di un attributo viene confrontato con il risultato di un'altra query.

#ex([Query annidate])[Estrarre il codice dello strutturato che riceve lo stipendio più alto.
  ```sql
  SELECT CODICE
  FROM STRUTTURATI
  WHERE (STIPENDIO = SELECT MAX(STIPENDIO) # query interna
  FROM STRUTTURATI)
  ```
]
#ex([Query interna restituisce più di un valore])[
  Nome e cognome dei dipendenti del dipartimento di INFORMATICA, il cui stipendio è uguale a quello di un dipendente del dipartimento di FISICA
  ```sql
  SELECT NOME, COGNOME
  FROM STRUTTURATI
  WHERE (DIPARTIMENTO="INFORMATICA") AND
    (STIPENDIO = (SELECT STIPENDIO # query interna
    FROM STRUTTURATI               # può restituire più di una riga
    WHERE (DIPARTIMENTO="FISICA")))
  ```
]
Operatori speciali di confronto per query annidate:
- `any`: la riga soddisfa la condizione se è vero il confronto tra il valore dell'attributo ed #underline([almeno uno]) dei valori ritornati dalla query annidata.
- `all`: la riga soddisfa la condizione se eè vero il confronto tra il valore dell'attributo e #underline[tutti] i valori ritornati dalla query annidata.

Il costrutto `in` restituisce `true` se un certo valore è contenuto nel risultato di una interrogazione nidificata, `false` altrimenti.
#ex[`in`][  ```sql
    SELECT ListaAttributi
    FROM TabellaEsterna
    WHERE Valore/i IN SELECT ListaAttributi2
        FROM TabellaInterna
        WHERE Condizione
  ```]

Il costrutto `exists` restituisce true se l'interrogazione nidificata restituisce un risultato non vuoto ($>=1$ elemento trovato).
#ex[`exists`][  ```sql
  SELECT ListaAttributi
  FROM TabellaEsterna
  WHERE EXISTS SELECT ListaAttributi2 # controlla se il numero di
      FROM TabellaInterna             # righe della query interna >0
      WHERE Condizione
  ```]

=== Interrogazioni annidate semplici
Non c'è passaggio di binding#footnote[ Momento in cui il DBMS "capisce" a quale colonna o tabella ti riferisci quando scrivi, ad esempio, STIPENDIO o DIPARTIMENTO.] tra un contesto
all'altro. Le interrogazioni vengono valutate dalla più interna alla più esterna..
#ex[Query annidate semplici][
  Estrarre chi, tra gli informatici, guadagna più di qualunque fisico.
  ```sql
  SELECT NOME, COGNOME
  FROM STRUTTURATI
  WHERE (DIPARTIMENTO="INFORMATICA") AND
      (STIPENDIO > ALL (SELECT STIPENDIO #
      FROM STRUTTURATI                   # query interna
      WHERE (DIPARTIMENTO="FISICA")))    #
  ```
  + Viene valutata la query più interna;
  + Viene confrontata ciascuna riga della tabella più esterna con il risultato della query interna
]
=== Interrogazioni annidate complesse
C'è passaggio di binding attraverso variabili condivise tra le varie interrogazioni. In questo caso, le interrogazioni più interne vengono valutate su ogni tupla.
#ex[Interrogazioni annidate complesse][Estrarre nome/cognome degli impiegati che hanno omonimi.
  ```sql
  SELECT NOME, COGNOME
  FROM IMPIEGATI AS I
  WHERE (I.NOME,I.COGNOME) = ANY  (SELECT NOME, COGNOME
      FROM IMPIEGATI AS I2
      WHERE (I.NOME=I2.NOME)
      AND (I.COGNOME=I2.COGNOME)    # stesso nome
      AND (I.CODICE <> I2.CODICE))  # codice diverso
  ```
  La query più interna viene valutata su ciascuna tupla della query più esterna
]
== Viste
Le viste rappresentano "tabelle virtuali" ottenute da dati contenuti in altre tabelle del DB. Ogni vista ha associato un nome ed una lista attributi, e si ottiene da una `select`.
```sql
create view nomeview [lista attributi]
as SELECTSQL [with [local | cascade] check option]
```
Le viste esistono a livello di schema, ma non hanno istanze proprie.
Sono utilizzate per:
- Far visualizzare solamente certi dati ad alcuni utenti
#ex[`view`][
  ```sql
  CREATE VIEW STUDENTI(CODICE,NOME,COGNOME,
  DATANASCITA) AS
  SELECT CODICE,NOME,COGNOME,NASCITA
  FROM PROFESSORI
  ```
]
- tabella di appoggio per semplificare una query
- garantire la retro-compatibilità con versioni precedenti dello schema del DB
L'opzione `WITH CHECK OPTION` consente di definire viste aggiornabili, a condizione che le tuple aggiornate continuino ad appartenere alla vista (in pratica, la tupla aggiornata non deve violare la clausola `WHERE`)
#ex[`Viste with check option`][
  ```sql
  CREATE VIEW
  PROFESSORIRICCHI(CODICE,NOME,COGNOME,STIPENDIO) AS
  SELECT CODICE,NOME,COGNOME,STIPENDIO
  FROM PROFESSORI
  WHERE (STIPENDIO>=30000)
  ```
]
== Common Table Expression (CTE)
Le CTE rappresentano viste temporanee che possono essere usate in una query come se fossero una vista a tutti gli effetti.
A differenza delle viste, le CTE non esistono a livello di schema del DB.
```sql
WITH
NAME(Attributi) AS
SQL Query
```
Una CTE è valida solo per le query fatte dopo la sua creazione.
== Assertion
Le asserzioni sono un costrutto per definire vincoli generici a livello di schema.
```sql
create assertion NomeAsserzione check Condizione
```
Consentono di definire vincoli non altrimenti definibili con i costrutti visti fin qui. Il vincolo può essere immediato o differito (ossia verificato al termine di una transazione).
#ex[Asserzione][La tabella STUDENTI non può essere vuota.
  ```sql
  CREATE ASSERTION TabellaValida
  CHECK (
    (SELECT COUNT(*) FROM STUDENTI) >= 1
  );
  ```]
== Costrutti Avanzati
=== Procedure/Stored Procedures
Frammenti di codice SQL, con la possibilità di specificare un nome, dei parametri in ingresso e dei valori di ritorno.
Con le stored procedure si ha maggior efficienza, espressività e sicurezza.
```sql
CREATE PROCEDURE myPROC (IN param1 INT, OUT param2 INT)
SELECT COUNT(*) INTO param2
FROM tabella
WHERE name = param1;
mysql>> CALL myPROC("Test",@variable);
```
Le estensioni procedurali consentono di:
- Aggiungere strutture di controllo al linguaggio SQL (es. cicli, strutture condizionali `if then else`, etc).
- Dichiarare variabili e tipi di dato user-defined.
- Definire procedure sui dati avanzate, che sono ritenute "sicure" dal DBMS.
=== Trigger
Si usano per implementare comportamenti automatici.
#ex[Trigger][Ogni mese, vengono rimosse tutte le righe presenti dalla tabella `ORDINI` e spostate nella tabella `ORDINI_PENDENTI`.
  ```sql
  Create trigger Nome
  [before/after] [insert/delete/update] on Tabella  #evento
  [referencing Referenza] # variabili globali per aumentare l'espressività del trigger
  [for each Livello] # Livello può essere row (Il trigger agisce a livello di righe) o statement (Il trigger agisce globalmente a livello di tabella)
  [when (IstruzioneSQL)]  #condizione
  Istruzione/ProceduraSQL #azione
  ```

]
I trigger sono meccanismi di gestione della base di dati basati sul paradigma ECA (Evento/Condizione/Azione).
- Evento: primitive per la manipolazione dei dati (`insert`, `delete`, `update`)
- Condizione: predicato booleano
- Azione: sequenza di istruzioni SQL, talvolta procedure SQL specifiche del DBMS.

Ci sono due modalità di esecuzione:
- immediata: il trigger viene attivato e completato subito, prima o dopo l'operazione che lo ha causato.
- differita: il trigger non viene eseguito immediatamente, ma alla fine della transazione corrente. Attenderà fino a quando tutte le modifiche della transazione saranno completate per poi essere eseguito come passaggio finale.
#ex[Trigger][
  ```sql
  CREATE TRIGGER CHECKAUMENTO
  BEFORE UPDATE OF CONTO ON IMPIEGATO
  FOR EACH ROW
  WHEN (NEW.STIPENDIO > OLD.STIPENDIO * 1.2)
  SET NEW.STIPENDIO=OLD.STIPENDIO * 1.2
  ```
  - Modo: `before`.
  - Evento: `update`.
  - Livello: `row`.
]
=== Permessi
I permessi sono meccanismi di controllo di accesso alle risorse dello schema del DB.
Di default, ogni risorsa appartiene all'utente che l'ha definita Su ciascuna risorsa sono definiti dei privilegi (grant):
#align(center, table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*Privilegi*]),
  [`insert`/`update`/`delete`],
  [tabelle/viste],
  [`select`], [tabelle/viste], [`references`], [tabelle/attributi], [`usage`], [domini],
))
Il comando `grant` consente di assegnare privilegi su una certa risorsa ad utenti specifici. ```sql
grant Privilegio on Risorsa/e to Utente/i [with grant option]
```
L'opzione `with grant option` consente di propagare il
privilegio ad altri utenti del sistema.

Il comando `revoke` consente di revocare privilegi su una certa
risorsa ad utenti specifici.
```sql
revoke Privilegio on Risorsa/e from Utente/i [cascade|restrict]
```
In SQL3 è possibile definire dei ruoli per regolare l'accesso alle risorse di un database.
#imp[Ruolo: raccoglitore di privilegi.
  ```sql
  create role/set ruolo
  ```
]
#ex[Creazione ruolo][
  ```sql
  create role analyst
  grant select, insert on tabella clienti to analyst
  grant analyst to marco
  ```
  Il ruolo `analyst` ha accesso in lettura e inserimento sulla tabella `clienti`
]
= MySQL
MySQL è un DBMS basato sul modello relazionale (RDBMS). Supporta gran parte dei costrutti di SQL 2.0, con trigger e viste aggiornabili. Supporta l'esecuzione di transazioni su un tipo particolare di tabelle (INNODB). Dispone di un proprio linguaggio di estensione procedurale per gestire le stored procedures. Non ha limiti espliciti sulla dimensione massima di un DB. Non esistono problemi dal punto di vista della concorrenza in termini di numeri massimi di connessioni simultanee al server MySQL.

Come interagire con MySQL:
- Riga di comando
- Interfaccia grafica
- Applicazioni/linguaggi di programmazione
== Autenticazione
Via shell: `mysql –u <utente> –p <password>`.\
La gestione dei dati degli utenti avviene attraverso la tabella `mysql.user`.
- Creare un nuovo utente (locale): `CREATE USER nome@localhost;`
- Impostare la password di un utente:
`SET PASSWORD FOR nome@localhost=PASSWORD("passwd");`
- Creare un nuovo utente con password: `CREATE USER nome@localhost IDENTIFIED BY "passwd";`
- Cancellare un utente: `DROP USER nome@localhost;`
== Creazione database
- Creare un nuovo database: `CREATE DATABASE [IF NOT EXIST] nome_db;`
- Rimuovere un database: `DROP DATABASE [IF EXISTS] nome_db;`
- Vedere quali db sono presenti nel sistema: `SHOW databases;`
- Impostare il db corrente: `USE nome_database;`
- Assegnare/rimuovere un privilegio ad un determinato utente:
  - Comandi SQL: `REVOKE | INSERT`
  - Aggiornare tabelle `mysql.user`, `mysql.db`, `mysql.tables_priv` attraverso `INSERT/UPDATE`.

Per creare una tabella
```sql
CREATE [TEMPORARY] TABLE
    nome_tabella | nome_db.nome_tabella
    [definizione attributi]
    [opzioni]
    [select]
```
Con `temporary` si crea una tabella valida solo per la sessione corrente. Si può popolare una tabella con il risultato di una `select` da altre tabelle.

Ci sono due tipo di tabelle/_storage engine_:
- INNODB
  - supporta il sistema transazionale
  - supporta i vincoli di chiave esterni
  - maggiore robustezza ai guasti
- MyISAM
  - non supporta il sistema transazionale
  - maggiore efficienza
  - minore consumo di spazio su memoria secondaria
Un sistema transazionale garantisce le proprietà ACID.

Esempi di #underline[opzioni] valide sulle tabelle:
- `ENGINE = TIPO_TABELLA (INNODB/MyISAM)`
- `AUTO_INCREMENT = <VALORE>` (valore da cui si inizia a contare)
- `AVG_ROW_LENGTH = <VALORE>`
- `CHECKSUM = {0|1}`
- `COMMENT = <STRING>`
- `MAX_ROWS = <VALORE>`

Definizione di #underline[attributi]
```sql
Nome_colonna TIPO
[NOT NULL | NULL] [DEFAULT valore]
[AUTO_INCREMENT]
[UNIQUE | PRIMARY KEY]
[COMMENT "commento"]
```

Per definire i vincoli di integrità referenziale (solo con INNODB):
```sql
FOREIGN KEY (nome_colonna_interna)
REFERENCES nome_tabella_esterna
(nome_colonna_esterna)
[ON DELETE | ON UPDATE
RESTRICT | CASCADE | SET NULL |
NO ACTION ]
```
== Tipi di dato
- numerici
  - `BIT`
  - `TINYINT [UNSIGNED][ZEROFILL]`
  - `SMALLINT [UNSIGNED][ZEROFILL]`
  - `MEDIUMINT [UNSIGNED][ZEROFILL]`
  - `INT [UNSIGNED][ZEROFILL]`
  - `BIGINT [UNSIGNED][ZEROFILL]`
  - `FLOAT [UNSIGNED][ZEROFILL]`
  - `DOUBLE [UNSIGNED][ZEROFILL]`
  - `DECIMAL [UNSIGNED][ZEROFILL]`
- temporali
  - `DATE`
  - `DATETIME`
  - `TIMESTAMP [M]`
  - `TIME`
  - `YEAR [(2,4)]`
Per conoscere data/timestamp correnti: `SELECT NOW();`,`SELECT CURTIME();`
- stringa di caratteri o byte
  - `CHAR(M) [BINARY | ASCII | UNICODE]`
  - `VARCHAR(M) [BINARY]`
  - `BINARY(M)`
  - `VARBINARY(M)`
  - `TINYBLOB`
  - `TINYTEXT`
  - `BLOB(M)`
  - `TEXT(M)`
  - `LONGBLOB`

#ex[Creazione tabella in MySQL][
  ```sql
  CREATE TABLE IMPIEGATI (
  Codice smallint auto_increment primary key,
  Nome varchar(200) not null,
  Cognome varchar(100) not null,
  Salario double default 1000,
  Anno date)
  engine=innodb;
  ```
]

== Comandi CRUD
- `insert`: popolamento dati
```sql
INSERT [LOW_PRIORITY|DELAY|HIGH_PRIORITY]
[INTO] nome_tabella [(nome_colonne,...)]
VALUES ({espressione | DEFAULT}, ...)
[ON DUPLICATE KEY UPDATE nome_colonna=espressione, ...]
```
- `replace`: popolamento dati
```sql
REPLACE [LOW_PRIORITY | DELAYED]
[INTO] nome_tabella [(nome_colonna, ...)]
VALUES ({espressione | DEFAULT}, ...)
```
Estensione MySQL del costrutto `INSERT`. Consente di rimpiazzare delle righe presistenti con delle nuove righe, qualora si verifichi un problema di inserimento con chiave doppia.
- `load`: popolamento dati
```
LOAD DATA [LOCAL] INFILE 'file.txt'
[REPLACE | IGNORE]
INTO TABLE nome_tabella
[FIELDS
[TERMINATED BY 'stringa']
[ENCLOSED BY 'stringa']
[ESCAPED BY 'stringa'] ]
[LINES
[STARTING BY 'stringa]
[TERMINATED BY 'stringa']]
[IGNORE numero LINES]
```
- `select`: ricerca dati
```
SELECT [ALL | DISTINCT | DISTINCTROW]
lista_colonne
[INTO OUTFILE 'nome_file' |
INTO DUMPFILE 'nome_file' ]
FROM lista_tabelle
[WHERE condizione]
[GROUP BY {nome_colonna}]
[HAVING condizione]
[ORDER BY {nome_colonna}]
[LIMIT [offset,] numero_righe]
```
- `delete`: cancellazione dati
```
DELETE [LOW_PRIORITY][IGNORE][QUICK]
FROM nome_tabella
[WHERE condizione]
[LIMIT numero_righe]
```
- `truncate`: rimuove tutto il contenuto
```
TRUNCATE nome_tabella
```
- `update`: aggiornamento di dati
```
UPDATE [LOW_PRIORITY][IGNORE]
SET {nome_colonna=espressione, ….}
WHERE condizione
```
== Creazione di Trigger
Creazione di regole attive attraverso il costrutto di `TRIGGER`.
```sql
CREATE TRIGGER nome tipo
ON tabella FOR EACH ROW istruzioniSQL
```
Il tipo specifica l'evento che attiva il trigger: `BEFORE INSERT`, `BEFORE UPDATE`, `BEFORE DELETE`, `AFTER INSERT`, `AFTER UPDATE`, `AFTER DELETE`
#ex[Definizione di trigger][
  ```sql
  CREATE TRIGGER upd_check
  BEFORE INSERT ON Impiegati
  FOR EACH ROW
  BEGIN
  IF NEW.Salario > 300 THEN
  SET NEW.Salario=300;
  END IF;
  END;
  ```
]
== Creazione di Viste
Creazione di regole attive attraverso il comando `VIEW`.
```sql
CREATE [OR REPLACE]
[ALGORITHM = (UNDEFINED | MERGE | TEMPTABLE)]
VIEW nome [(lista colonne)]
AS selectSQL
[WITH [CASCADED|LOCAL] CHECK OPTION]
```
`WITH CHECK OPTION` definisce visite aggiornabili.
== Creazione di Stored Procedures
```
CREATE PROCEDURE nomeProcedura
([IN|OUT] nomeParametro tipo)
BEGIN
[dichiarazione di variabili locali]
[istruzioni SQL]
END;
```
Insieme di istruzioni SQL memorizzate nel DBMS, cui è associato un nome. Può ricevere parametri in input, può restituire più di un valore in output. Il corpo contiene istruzioni SQL.
```sql
CREATE PROCEDURE nomeImpiegato
(IN cod INT, OUT nomeI VARCHAR(200))
BEGIN
SELECT NOME AS NOMEI
FROM IMPIEGATI
WHERE (CODICE=cod);
END;

CALL nomeImpiegato(200,@var);
SELECT @var;
```
#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, [*Creazione di Stored procedures*]),
  [Dichiarazione di variabili locali],
  [`DECLARE a INT DEFAULT 0;`],
  [Costrutti di selezione (`if ... then ... else`)],
  [```IF Condizione THEN
    IstruzioniSQL
    [ELSE IstruzioniSQL]
    ENDIF;
    ```],
  [Costrutti iterativi (`WHILE`/`LOOP`/`REPEAT`):],
  [```sql
    [nome] WHILE Condizione DO
    IstruzioniSQL
    END WHILE [nome];
    ```],
  [Cursori di query],
  [```sql
    DECLARE nomeCursore CURSOR FOR selectSQL;
    OPEN nomeCursore
    FETCH nomeCursore INTO nomeVariabili;
    CLOSE nomeCursore
    ```],
)
I cursori consentono di eseguire query SQL e salvare il risultato (result set) in una lista. La lista risultante può essere iteratamente visitata attraverso il comando di `FETCH`.
#ex[Stored procedure con cursori][
  ```sql
  CREATE PROCEDURE nomeImpiegato
  (IN salarioMax INT, OUT valido BIT)
  BEGIN
      DECLARE fine INT DEFAULT 0;
      DECLARE cur CURSOR FOR
      SELECT salario FROM IMPIEGATI;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET
  fine=1;

  SET valido=1;
  OPEN cur;
  ciclo: WHILE NOT fine DO
      FETCH cur INTO salarioCor;
      IF salarioCor > salarioMax THEN
          valido=0;
      END IF;
  END WHILE ciclo;
  END;

  ```
  Questa procedura verifica se esistono impiegati con un salario maggiore di `salarioMax`, passato come input. Se trova almeno un impiegato con salario maggiore di `salarioMax`, imposta il parametro di output `valido` a 0, altrimenti a 1.
]

== Gestione delle transazioni per tabelle INNODB.
Di default, la modalità `autocommit` è abilitata, quindi tutti gli aggiornamenti sono effettuati immediatamente sul database. Nel caso in cui gli autocommit siano disabilitati, è necessario indicare l'inizio della transazione con `START TRANSACTION` e terminarla con un comando di `COMMIT` o `ROLLBACK`.
#ex[Transazione][
  ```sql
  SET AUTOCOMMIT = 0;
  START TRANSACTION
  INSERT INTO IMPIEGATO (Nome, Cognome, Salario)
  VALUES (‘Michele’,’Rossi’,1200);
  INSERT INTO IMPIEGATO (Nome, Cognome, Salario)
  VALUES (‘Carlo’,’Bianchi’,1000);
  COMMIT
  ```
]
MySQL offre quattro livelli di isolamento:
- `READ UNCOMMITTED`: sono visibili gli aggiornamenti non consolidati fatti da altri.
- `READ COMMITTED`:aggiornamenti visibili solo se consolidati (ossia solo dopo `COMMIT`).
- `REPEATABLE READ`: tutte le letture di un dato operate da una transazione leggono sempre lo stesso valore (comportamento di default).
- `SERIALIZABLE`: lettura di un dato blocca gli aggiornamenti fino al termine della transazione stessa che ha letto il dato (lock applicato ad ogni `SELECT`).

== Utilities
```sql
set[global|session] transaction isolation level {
    READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE
}
```
Il tool MySQLDump consente di effettuare backup del contenuto di un database (o di tutti).
#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*MySQLDump*]),
  [Backup di tutti i database],
  [`mysqldump -single-transaction -all-database > nomefile`
  ],
  [Backup di uno specifico database],
  [`mysqldump -single-transaction nomedb > nomefile`
  ],
  [Ripristino di un database (o tutti) da un file di backup],
  [`mysql [nomedb] < nomefile
`],
)
= Gestione delle Transazioni
#ex[Sistema va in crash tra due operazioni che modificano tabelle][
  ```
  UPDATE ITEM SET Quantita=Quantita-1 WHERe (Codice=CodiceScelto));
  ! X-> CRASH !
  INSERT INTO ORDINE(Data,Ordinante,ItemOrdinato) VALUES (NOW(),
  ```
  Causa un problema di coerenza tra i dati
]
Le transazioni sono unità di lavoro elementari (insiemi di istruzioni SQL) che modificano il contenuto di unabase di dati.
#ex[Transazione][
  ```sql
  start transaction
  update SalariImpiegati
  set conto=conto-10
  where (CodiceImpiegato = 123)
  if var > 0 then commit work;
  else rollback work;
  ```
  Le transazioni sono comprese tra una `start transaction` ed una `commit/rollback`.
]
*Proprietà ACID delle transazioni*:
- Atomicità: La transazione deve essere eseguita con la regola del "tutto o niente".
- Consistenza: La transazione deve lasciare il DB in uno stato consistente, eventuali vincoli di integrità non devono essere violati.
- Isolamento: L'esecuzione di una transazione deve essere indipendente dalle altre.
- Persistenza: L'effetto di una transazione che ha fatto commit work non deve essere perso.

#imp[Il gestore dell'affidabilità garantisce atomicità e persistenza tramite log e checkpoint. Il gestore della concorrenza carantisce isolamento in caso di esecuzione concorrente di più transazioni].
#def[*Schedule*\
  Dato un insieme di transazioni $T_1, T_2,dots,T_n$ di cui ciascuna formata da un certo insieme di operazioni di _writing_ $w_i$ e _reading_ $r_i$#footnote[#smallcaps[ex]: $T_1 = r_1(x) space r_2(x) space r_3(x) space w_1(x) space dots$], si definisce schedule la sequenza di operazioni di tutte le transazioni così come eseguite sulla base di dati: $r_1(x) space r_2(y) space r_1(y) space w_4(y) space w_2(z)$
]
#imp[Lo schedule è l'insieme di tutte le operazioni delle transazioni eseguite sulla base di dati.
  Nell'insieme possono essere mescolate operazioni di transazioni diverse, ma deve essere sempre rispettato l'ordine interno delle singole transazioni.
  Lo schedule rappresenta l'esecuzione reale, mentre le transazioni rappresentano solo le intenzioni logiche di ciascun utente o processo.]

#def[*Schedule Seriale*\
  Uno schedule si dice seriale se le azioni di ciascuna transazione appaiono in sequenza, senza essere inframezzate da quelle di altre transazioni.
  $ S={T_1,T_2, dots T_n} $
]
Le transazioni devono essere eseguite una alla volta ed essere completamente indipendenti l'una dall'altra#footnote[Scenario non realistico e non probabile].
In un sistema reale, le transazioni vengono eseguite in concorrenza per ragioni di efficienza / scalabilità.\
L'esecuzione concorrente determina un insieme di problematiche che devono essere gestite.
#align(center, [
  #figure(
    table(
      inset: 5pt,
      columns: 2,
      table.cell(colspan: 2, align(center)[*Perdita di aggiornamento* ($x=3$)]),
      [$T_1$], [$T_2$],
      [read(x)], [],
      [x=x+1], [],
      [], [read(x)],
      [], [x=x+1],
      [], [write(x)],
      [],
      [commit work],
      [
        write(x)],
      [],
      [commit work], [],
    ),
    caption: [Sia $T_1$ che $T_2$ scrivono 4],
  )

  #figure(
    table(
      inset: 5pt,
      columns: 2,
      table.cell(colspan: 2, align(center)[*Lettura Sporca* ($x=4$)]),
      [$T_1$], [$T_2$],
      [read(x)], [],
      [x=x+1], [],
      [write(x)], [],
      [], [read(x)],
      [], [commit work],
      [rollback work],
    ),
    caption: [$T_2$ legge 4],
  )

  #figure(
    table(
      inset: 5pt,
      columns: 2,
      table.cell(colspan: 2, align(center)[*Lettura Sporca* ($x=3$)]),
      [$T_1$], [$T_2$],
      [read(x)], [],
      [], [read(x)],
      [], [x=x+1],
      [], [write(x)],
      [], [commit work],
      [read(x)],
    ),
    caption: [$T_1$ legge prima 3 poi 4],
  )
])
#def[*Schedule Serializzabile*\
  Uno schedule $S$ si dice serializzabile quando lo schedule corrente porta allo stesso risultato che otterebbe con uno schedule seriale $S'$.
]

Per implementare il controllo della concorrenza si usano i lock: per poter effettuare un'operazione su una risorsa è necessario aver precedentemente acquisito il controllo (lock) su di essa.
- Lock in *lettura*: accesso condiviso a più transazioni
- Lock in *scrittura*: mutua esclusione, solo una transazione alla volta
Su ogni lock possono essere definite due operazioni:
- Richiesta del lock in lettura/scrittura.
- Rilascio del lock (unlock) acquisito in precedenza.
== Lock Manager
#def[*Lock Manager*\
  Componente del DBMS responsabile di gestire i lock alle risorse del DB, e di rispondere alle richieste delle transazioni.
]
Metodi di ciascun oggetto $x$ del DBMS:
- `State(x)`: stato dell'oggetto (libero/r_locked/w_locked)
- `Active(x)`: lista transazioni attive sull'oggetto
- `Queued(x)`: lista transazioni bloccate sull'oggetto
Azioni del lock manager
+ riceve una richiesta da una transazione $T$ su un oggetto $x$
+ controlla la tabella stato
+ se la risposta è OK, aggiorna lo stato della risorsa, e concede il controllo alla transazione $T$
+ se la risposta è NO, inserisce la transazione $T$ in una coda associata ad $x$.

== Gestione delle transazioni
#def[*2 Phase Lock* (2PL)\
  Una transazione, dopo aver rilasciato un lock, non può acquisirne un altro.
]
Una transazione prima acquisisce tutti i lock delle risorse di cui necessita. \
Ogni schedule che rispetta 2PL è anche serializzabile perché 2PL garantisce l'ordine delle operazioni delle transazioni in modo tale da evitare conflitti che potrebbero portare a inconsistenze nei dati. \
Si evita aggiornamento fantasma, lettura inconsistente, perdita di aggiornamento, ma non la lattura sporca.
#def[*Strict 2PL*\
  I lock di una transazione sono rilasciati solo dopo aver effettuato le operazioni di `commit`/`abort`.
]
S2PL è usata solo in alcuni DBMS commerciali.\
Uno schedule che rispetta lo S2PL eredita tutte le proprietà del 2PL, ed inoltre NON presenta anomalie causate da problemi di lettura sporca.
== Deadlock
I protocolli 2PL e S2PL possono generare schedule con situazioni di deadlock. Per gestirli si usano 3 tecniche:
+ Uso dei timeout: ogni operazione di una transazione ha un timeout entro il quale deve essere completata, pena annullamento (`abort`) della transazione stessa. $T_1$:`r_lock(x,4000), r(x), w_lock(y,2000), w(y), commit, unlock(x), unlock(y)`
+ Deadlock avoidance: prevenire le configurazioni che potrebbero portare ad un deadlock tramite:
  - Lock/Unlock di tutte le risorse allo stesso tempo.
  - Utilizzo di time-stamp o di classi di priorità tra transazioni (può causare starvation!)
+ Deadlock detection:  utilizzare algoritmi per identificare eventuali situazioni di deadlock, e prevedere meccanismi di recovery dal deadlock.

== Timestamp (TS)
TS è un metodo alternativo al 2PL per la gestione della concorrenza che utilizza i time-stamp delle transazioni.
+ Ad ogni transazione si associa un timestamp che rappresenta il momento di inizio della transazione.
+ Ogni transazione non può leggere o scrivere un dato scritto da una transazione con timestamp maggiore.
+ Ogni transazione non può scrivere su un dato già letto da una transazione con timestamp maggiore.
Ad ogni oggetto $x$ si associano due indicatori:
+ `WTM(x)`: timestamp della transazione che ha fatto l'ultima scrittura su $x$.
+ `RTM(x)`: timestamp dell'ultima transazione (ultima=con t più alto) che ha letto $x$.

#table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2, align(center)[*Livelli di Isolamento*]),
  [read uncommitted],
  [La transazione non emette lock in lettura, e non rispetta i lock esclusivi delle altre transazioni.],
  [read committed], [Richiede lock condivisi per effettuare le letture.],
  [repeatable read], [Applica S2PL anche in lettura],
  [serializable], [Applica S2PL con lock di predicato],
)
