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

#pagebreak()

= Introduzione ai DBMS
*Modello relazionale*: organizza i dati in record di dimensione fissa mediante tabelle. \
*Sistema informativo* (SI): componente di un'organizzazione il cui scopo è gestire le informazioni utili ai fini dell'organizzazione stessa. \
*DBMS*: sistema software in grado di gestire collezioni di dati grandi, condivise e persistenti in maniera efficiente e sicura. \
*Base di dati*: collezione di dati gestita da un DBMS. \
== Architettura a livelli del DBMS
Ogni livello è indipendente dall'altro
- *Schema#footnote[Descrizione della struttura del database.] esterno*: come si presenta il DB, e come varia in base ai permessi di accesso.
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
#ndef[Relazione Matematica][Dati $n$ insiemi $D_1,D_2,dots,D_n$, una relazione matematica su questi insiemi è un sottoinsieme del prodotto cartesiano $D_1 times D_2 times dots times D_n$.]

#ndef[Prodotto Cartesiano][Il prodotto cartesiano degli insiemi $D_1,D_2,dots,D_n$ è l'insieme di tutte le ennuple ordinate $(d_1,d_2,dots,d_n)$ con $d_i in D_i, forall i =1,dots,n$.]

#ex([Relazione])[$A={a,b,c,d,e},space B = {1,2,3}\ A times B = {(a,1),(a,2),(a,3),(b,1),(b,2), \ (b,3),(c,1),(c,2),(c,3),(d,1),(d,2),(d,3),(e,1),(e,2),(e,3)}\ R_1 subset.eq A times B = {(a,1),(a,2),(a,3)}\ R_2 subset.eq A times B = {(a,2),(b,1),(d,3),(e,3)}$\ $A$ e $B$ sono due tabelle con un solo campo. $a,b,c,dots,1,2,3$ sono le istanze. Il prodotto cartesiano unisce tutte le istanze facendo tutte le combinazioni possibili. Le istanze di $A times B$ sono tutte le combinazioni di $A$ e $B$. Le relazioni $R_1$ e $R_2$ sono sottoinsiemi del prodotto cartesiano, quindi sono relazioni.]
Una ennupla su un di attributi $X$ è una funzione che associa a ciascun attributo $A$ in $X$ un valore del dominio di $A$. \
$T[A]$ indica il valore dell'ennupla $T$ nell'attributo $A$. \

== Informazioni incomplete
In una relazione le ennuple devono essere omogenee, ossia avere tutte la stessa struttura. Se il valore di un attributo non è noto, si usa il valore #null. \
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
    - `numeric[(Precisione [,Scala])])`
    - `decimal[(Precisione [,Scala])])`
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
  - `set null` : imposta i valori a #null
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
  [Cancellare tutte le righe che soddisfano una condizione (cancella tutto se non specificata).
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
  ON GUIDATORI.NrPatente = VEICOLI.NrPatente
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
- *immediata*: il trigger viene attivato e completato subito, prima o dopo l'operazione che lo ha causato.
- *differita*: il trigger non viene eseguito immediatamente, ma alla fine della transazione corrente. Attenderà fino a quando tutte le modifiche della transazione saranno completate per poi essere eseguito come passaggio finale.
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
Estensione MySQL del costrutto `INSERT`. Consente di rimpiazzare delle righe preesistenti con delle nuove righe, qualora si verifichi un problema di inserimento con chiave doppia.
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
  VALUES (‘Michele','Rossi',1200);
  INSERT INTO IMPIEGATO (Nome, Cognome, Salario)
  VALUES (‘Carlo','Bianchi',1000);
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
  UPDATE ITEM SET Quantita=Quantita-1 WHERE (Codice=CodiceScelto));
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

#imp[Il gestore dell'affidabilità garantisce atomicità e persistenza tramite log e checkpoint. Il gestore della concorrenza carantisce isolamento in caso di esecuzione concorrente di più transazioni.]
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
+ Deadlock detection:  utilizzare algoritmi per identificare eventuali situazioni di deadlock, e prevedere meccanismi di recovery.

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
= NoSQL
#def[*NoSQL*\
  Movimento che promuove l'adozione di DBMS non basati sul modello relazionale. I sistemi NoSQ in genere:
  - sono database distribuiti
  - sono tool open source
  - non dispongono di uno schema
  - non supportano operazioni di join
  - non implementano le proprietà ACID delle transazioni
  - sono scalabili orrizzontalmente
  - sono in grado di gestire grandi basi di dati
  - supportano le repliche dei dati
]
== Motivi della diffusione dei database NoSQL
- Gestione dei big data#footnote[Big data: moli di dati, eterogenei, destrutturati, difficili da gestire attraverso tecnologie tradizionali.
  ]. Le quattro V dei big data
  - Volume: grossi moli di dati
  - Velocità: stream di dati
  - Varietà: dati eterogenei, multi-sorgente
  - Valore: possibilità di estrarre conoscenza dai big-data
- Limitazioni del modello relazionale:
  - SQL assume che i dati siano strutturati
  - alcune operazioni non possono essere implementate in SQL
  - scalabilità orrizzontale dei DBMS relazionali

#def[*Scalabilità*\
  Capacità di un sistema di migliorare le proprie prestazioni per un certo carico di lavoro, quando vengono aggiunte nuove risorse al sistema.
  - Scalabilità *orrizzontale*: aggiungere più nodi al cluster.
  - Scalabilità *verticale*: aggiungere più potenza di calcolo (RAM, CPU) a i nodi che gestiscono il DB.
]
- Teorema Cap
#def[*Cap Theorem*\
  Il teorema di Brewer (CAP Theorem) afferma che un sistema distribuito può soddisfare al massimo solo due di queste proprietà:
  - Consistency: Tutti i nodi della rete vedono gli stessi dati. Se l'utente $A$ modifica il dato $X$ sul server $1$, e $B$ legge $X$ dal server $2$, $B$ legge l'ultima versione disponibile di $X$.
  - Availability: Il servizio è sempre disponibile. Se un utente effettua una query sul server $A$ o $B$, la query restituisce un risultato.
  - Partion Tolerance: Il servizio continua a funzionare correttamente anche in presenza di perdita di messaggi o di partizionamenti della rete.
]
== Proprietà Base dei Sistemi NoSQL
- _Basically Available_: i nodi del sistema distribuito possono essere soggetti a guasti.
- _Soft State_: la consistenza dei dati non è garantita in ogni istante
- _Eventually Consistent_: il sistema diventa consistente dopo un certo intervallo di tempo, se le attività di modifica dei dati cessano.
Il termine NoSQL identifica una varietà di DBMS non relazionali,
basati su modelli logici differenti:
- database chiave-valore
- database document oriented (MongoDB)
- database graph oriented

= MongoDB
MongoDB è un DBMS non relazionale basato su DB document-oriented. #eacc un database organizzato in collezioni, le collezioni contengono liste di documenti. Ogni documento è un insieme di campi.
#figure(table(
  inset: 5pt,
  columns: 2,
  [*MongoDB*], [*RDBMS*],
  [collezione], [tabella],
  [documento], [riga],
  [campo], [colonna di una riga],
))
Si usano comandi javascript tramite shell MongoDB oppure applicazioni che si collegano a mongoDB. Utilizza il linguaggio JSON come input/output delle query di aggiornamento o selezione.
#ex[Documeto JSON in MongoDB][
  ```json
  {"nome": "Mario",
  "cognome": "Rossi",
  "eta": 45,
  "impiegato": false,
  "salario": 1205.50,
  "telefono": ["0243434", "064334343"],
  "ufficio": [
      {"nome": "A", "via": "Zamboni", "numero": 7},
      {"nome": "B", "via": "Irnerio", "numero": 49}
  ]}
  ```
]
#align(center, table(
  inset: 5pt,
  columns: 2,
  [*Comando*], [*Azione*],
  [`mongod`], [avvio server],
  [`mongo`], [avvio shell],
  [`use provaDB`], [utilizzo/creazione di un DB],
  [`db.createCollection("circoli")`], [creazione di una collezione vuota],
  table.cell(colspan: 2)[*Comandi shell MongoDB*],
  [`show DBS`], [mostra DB disponibili],
  [`show collections`], [mostra collezioni del DB],
  [`show users`], [mostra gli utenti del sistema],
  [`show rules`], [mostra il sistema di accessi],
  [`show logs`], [mostra i log disponibili],
))
#imp[Un documento in MongoDB è un oggetto JSON.]
Nella stessa collezione, è possibile inserire documenti eterogenei, ossia con strutture campo/valore differenti.
#ex[Inserimento di un documento in una collezione
][
  `db.NOMECOLLEZIONE.insert(DOCUMENTO)`

  ```
  db.anagrafica.insert({"name": "Marco", "cognome":
  "Rossi", "eta": 22})
  db.anagrafica.insert({"cognome: "Rossi", "eta": 22,
  "domicilio":["Roma", "Bologna"]})
  db.anagrafica.insert({"name": "Maria", "eta": 25})
  ```
]
Ogni documento contiene un campo `_id`, che corrisponde alla chiave primaria della collezione.
Il campo `_id` può essere definito esplicitamente, o viene aggiunto in maniera implicita da MongoDB. Può essere inserito esplicitamente, o aggiunto in automatico da MongoDB.
#align(center, table(
  inset: 5pt,
  columns: 2,
  table.cell(colspan: 2)[*Rimozione di un documento da una collezione*],
  [*Comando*], [*Azione*],
  [`db.collezione.remove`], [svuota la collezione],
  [`db.NOMECOLLEZIONE.remove(SELETTORE)`],
  [Elimina dalla collezione tutti i documenti che fanno matching con il selettore],
))

*Selettore*: Il selettore è un documento json che specifica un campo e un valore per filtrare i documenti in base a corrispondenze esatte.
#ex[Cercare documenti con il campo nome "Mario" o cognome "Rossi"][
  ```js
  db.utenti.find({
    $or: [
      { "name": "Mario" },
      { "cognome": "Rossi" }
    ]
  })
  ```
]

*Operatori di Confonto*:
#align(center, table(
  inset: 5pt,
  columns: 3,
  [`$GT`], [maggiore], [`{"età":{$GT:30}}`],
  [`$LT`], [minore], [`{"età":{$LT:30}}`],
  [`$GTE`], [maggiore o uguale], [`{"età":{$GTE:30}}`],
  [`$LTE`], [minore o uguale], [`{"età":{$LTE:30}}`],
  [`$NE`], [diverso], [`{"età":{$NE:30}}`],
  [`$IN`], [uno tra molti valori], [`{"nome":{$IN:["Mario","Lucia"]}}`],
))
#ex[Cercare utenti con età compresa tra i 18 e 30 anni][
  ```js
  db.utenti.find(
      {"età":{
          $GTE: 18,
          $LTE: 30
      }
  })
  ```
]
*Selettori Logici*
#align(center, table(
  inset: 5pt,
  columns: 3,
  [`$AND`], [e], [`{$AND:[{"età":{$GTE:18}},{"sesso":"M"}]}`],
  [`$OR`], [o], [`{$OR:[{"età":{$GTE:18}},{"sesso":"M"}]}`],
  [`$NOT`], [non], [`{"età":{$NOT:{$GT:30}}`],
))
#ex[Cercare utenti che siano uomini con almento 30 anni, oppire con nome Luca][
  ```json
  db.utenti.find(
      {
          $OR:[
              {$AND:[
                  {"sesso":"M"},
                  {"età":{$GTE:30}}
              ]},
              {"nome":"Luca"}
          ]
      }
  )
  ```
]

`$exists` controlla se un campo esiste o meno.
#ex[Cerca documenti con il campo `telefono`][
  ```
  db.utenti.find(
      {"telefono":{
          $EXIST:true
      }
  })
  ```
]
#figure(
  table(
    inset: 5pt,
    columns: 2,
    align: left,
    table.cell(colspan: 2, align: center)[*`update`*],
    [```
      db.nomecollezione.update(
        selettore,campi
        )```],
    [Trova i documenti filtrati poi modifica tutti i campi inseriti (se non esiste lo aggiunge), ma cancella tutti quelli non specificati nell'`update`.\
      ```
      db.anagrafica.update(
          {"name":"Mario"},
          {"età":45}
      )
      ```
      Il campo `"name":"Mario"` è cancellato#footnote[Perché non specificato nell'` update`] e viene inserito `"età":35`
    ],
    [```
      db.NOMECOLLEZIONE.update(
          SELETTORE,{$SET: CAMPI}
          )
      ```],
    [Uguale alla forma sopra, ma i campi non specificati non vengono cancellati. Si modificano soli i camp inseririti.
      ```
      db.anagrafica.update(
          {"name":"Mario"},
          {$set:{"eta":45}})
      ```
      Nel documento relativo all'impiegato Mario, aggiorna il campo età ponendolo pari a 45
    ],
    [```
      db.NOMECOLLEZIONE.update(
          SELETTORE,{$PUSH:CAMPI}
          )
      ```],
    [Aggiunge un elemento alla fine di un array specificato nel campo definito. Se il campo è un array, l'operatore `push` aggiunge un nuovo valore all'array esistente, altrimenti ne crea uno nuovo e aggiunge l'elemento.
      ```
      db.anagrafica.update(
          {"name":"Mario"},
          {$push:{"eta":45}})
      ```
      Nel documento relativo all'impiegato Mario, si aggiunge un nuovo campo età (array), impostandolo a 45.

    ],
  ),
)
`$EACH` serve per inserire più valori nell'array in una sola operazione.
#ex[`$EACH`][
  ```
  db.utenti.update(
      {"_id":"1"},
          {$PUSH:{
              "hobby":{
                  $EACH: ["scrittura", "sport"]
              }
          }
      }
  )
  ```
]
#figure(table(
  inset: 5pt,
  columns: 2,
  align: left,
  table.cell(colspan: 2, align: center)[*`find`*],
  [`db.nomecollezione.find()`], [Restituisce tutti i documenti presenti nella collezione.],
  [`db.nomecollezione.find(condizone)`],
  [Restituisce tutti i documenti, i cui campi rispettino la condizione espressa nella query.],
  [```
    db.NOMECOLLEZIONE.find(
      SELETTORE,PROJECTION
    )
    ```],
  [Filtra e con il `projection` si inseriscono i campi che si vuole vengano mostrati.],
))

#ex[`projection`][
  Voglio solo i campi nomi ed età escludendo `_id`\
  ```
  db.utenti.find(
      {"nome":"Mario"},
      {"nome":true,"età":true,"_id":false}
  )
  ```
  Se voglio che il campo sia incluso, lo imposto a `true` altrimenti a `false`.
]

#tab(
  2,
  [*Operatori*],
  [`db.nomecollezione.
    find(...).sort(campi)`],
  [`1`: ordinamento crescente, `-1`: ordinamento decrescente. In caso di più campi si guarda il primo.\
    ```
    db.anagrafica.
      find(...).sort({"età":1})
    ```
  ],
  [`db.collezione.find(...).count()`],
  [Conta i documenti],
  [`db.collezione.find(...).
  distinct(campo,condizione)`],
  [Restituisce un array con i valori distinti del campo `<campo>` per tutti i documenti che soddisfano la condizione `<condizione>`.\
    ```
    db.anagrafica.distinct(
      "età",
      {"nome":"Marco"}
    )
    ```],
)
#eacc possibile i comandi MongoDB in uno script javascript, eseguito nella shell di MongoDB o in un applicazione esterna tipo node.js. Il file di script può contenere costrutti iterativi come `while`, `if`,`else`,`...`. I cursori vengono usati per scorrere il risultato di una query.
#ex[Codice javascript che comunica con MongoDB][
  ```js
  conn = new Mongo();
  db = conn.getDB("tennis2");
  db.createCollection("soci");
  cursor = db.collection.find({"name"="mario"});
  while (cursor.hasNext()) {
      printjson(cursor.next());
  }
  cursor = db.collection.find({"name"="mario"});
  if (cursor.hasNext()) {
      print("Trovato!");
  }
  ```
]
== Correlazioni tra collezioni
Non esistono vincoli di integrità referenziale tra collezioni/tabelle.
- Le correlazioni possono essere costruite esplicitamente mediante campi "replicati" tra più collezioni.
```
db.circoli.insert({"nome":"tennis2000", "citta": "Bologna" })
db.soci.insert({"nome":"Mario", "cognome":"Rossi", "nomeCircolo":"tennis2000"})
```
- Le associazioni uno-a-molti, o molti-a-molti, tra documenti di diverse collezioni possono essere rappresentate sfruttando il fatto che in MongoDB il valore di un campo può essere anche un array, o una struttura complessa (es. documento annidato).
```
db.soci.insert({"name:"Mario", cognome:"Rossi",
circolo:{...})
```
*Come fare query che implementano il join tra collezioni*
+ usi lookup table
+ usi due query (prima trovi l'id, poi con quello fai la seconda)
== Aggregazione di dati
L'operatore `aggregate` consente di implementare una pipeline di operazioni da eseguire su una base di dati. Ad ogni passo, vengono eseguite operazioni che prendono in input dei documenti json e producono in output documenti json.
`collezione->operatore1->operatore2->risultato`
#tab(
  2,
  [Operazioni],
  [`$geonear`],
  [Ordina i documenti dal più lontano al più vicino rispetto ad una posizione data.],
  [`$match`],
  [Seleziona solo alcuni documenti che soddisfano le condizioni],
  [`$project`],
  [Seleziona i campi prescelti],
  [`$group`],
  [Raggruppa in base a uno o più campi.],
  [`$sort`],
  [Ordina il json in base ad alcuni campi.],
  [`$out`],
  [Scrive l'output su una collezione.],
  [`$lookup`],
  [Consente di effettuare il `join` tra collezioni che appartengono allo stesso DB.\
    ```
    {
        "lookup":{
            "from": collezione su cui fare il join,
            "local field": campo dalla collezione di partenza,
            "foreign field": campo della collezione del from,
            "as": nome del campo di destinazione
        }
    }
    ```
  ],
)
#ex[`aggregate`][
  ```
  db.anagrafica.aggregate([
    {
        $match: { "name":"A"}
    },
    {
        $group: {
            "_id":"$customId",
            "total":{$sum: "$amount"}
        }
  ])
  ```
  + Fa il `match` prima: prende tutti i documenti con nome `A` ```json
    {"_id":1,"name":"A","customId":101,"amount":10},
    {"_id":3,"name":"A","customId":101,"amount":15},
    {"_id":4,"name":"A","customId":103,"amount":5},
    ```
  + Raggruppa i documenti in base al campo `customId`. Verrà creato un documento per ogni valore unico di `customId`.
  ```json
  {"_id":101,"total":25},
  {"_id":103,"total":5},
  ```
]
= Progettazione di basi di dati
Le basi di dati implementate fino ad ora si basavano su uno schema relazionale già definito. Come si realizza un sistema informativo da zero?
- Problema 1: *dimensionamento del problema*\ Un DB di un sistema informativo di medie dimensioni può contenere decine di tavelle
- Problema 2: *analisi dei requisiti*\ Identificare specifiche, dati di interesse e operazioni da gestire
- Problema 3: *Traduzione nel modello logico* (relazionale)\ Passare da specifiche informali (testo scritto) a delle tabelle vere e proprie
Senza una buona progettazione, possono emergere anomalie ed errori nella fase di trazione del modello logico, come le ridondanze.

Esistono metodologie consolidate per progettare una buona base di dati a partire dai suoi requisiti.
#tab(
  1,
  [Schema di vita di un sistema informativo],
  [Studio di fattibilità],
  [#text(fill: red)[Raccolta/analisi dei requisiti]],
  [#text(fill: red)[Progettazione]],
  [Implementazione],
  [Validazione],
  [Funzionamento],
)

Si raccolgono le informazioni sulle specifiche dei requisiti sui dati (testo grezzo), poi le informazioni sulle specifiche delle operazioni sui dati.

== Analisi dei requisiti
#tab(
  2,
  [Analisi dei Requisiti],
  [*Fasi della progettazione*],
  [*Risultati*],
  [Progettazione concettuale],
  [schema concettuale],
  [Progettazione logica],
  [schema logico],
  [Progettazione fisica],
  [schema fisico],
)
=== Progettazione Concettuale
Ci si focalizza sul contenuto informativo dei dati ad alto livello di astrazione (senza concentrarsi sull'implementazione).
Si produce un modello concettuale indipendente dallo schema logico e dal DBMS in uso.\
Uno schema concettuale può essere prodotto con un modello E-R o con UML
=== Progettazione Logica
Traduzione dello schema concettuale in tabelle, ottimizzazione dello schema logico ottenuto.\ Dopo aver ottenuto lo schema logico, è neessario analizzare la qualità del prodotto finale:
- si rimuovono le ridondanze#footnote[Questo processo si chiama normalizzazione]
- si analizzano le prestazioni: si controlla se il costo delle singole operazioni rendono il prodotto efficiente.
=== Progettazione fisica
Si descrivono le strutture per la memorizzazione di dati su memoria secondaria, e l'accesso efficiente ai dati:
- strutture ad albero
- strutture sequenziali
- strutture ad acesso diretto (hash)

== Raccolta dei requisiti
La raccolta dei requisiti consiste nella completa indiviudazione dei problemi che il sistema informativo da realizzare deve risolvere e le caratteristiche che il sistema informativo deve avere: quelle dei *dati* e quelle delle *applicazioni*.

Queste informazioni vengono raccolte
- dagli utenti dell'applicazione con interviste e documentazioni
- da documentazioni esistenti
  - normative
  - procedure aziendali
  - regolamenti interni
- realizzazioni/applicazioni preesistenti

=== Come trovare i dati da gestire e le operazioni sui dati consentite
+ Produrre un documento di specifica (testo grezzo). Dato che il linguaggio naturale è fonte di ambiguità e fraintendimenti bisogna:
  - scegliere il corretto livello di astrazione
  - standardizzare la struttura delle frasi
  - evitare frasi contorte
  - individuare omonimi/sinonimi
  - esplicitare il riferimento tra termini
  Può essere utile scomporre le specifiche in frasi omogenee, relative agli stessi concetti
+ Costruire un glossario dei termini che contiene descrizioni, sinonimi e collegamenti #figure(table(
    columns: 4,
    table.header([*Termine*], [*Descrizione*], [*Sinonimi*], [*Collegamenti*]),
    [Partecipante], [...], [...], [...],
    [Docente], [...], [...], [...],
    [Corso], [...], [...], [...],
  ))
+ Definire le operazioni sui dati. Questa fase è utile per
  - Verificare la completezza dei modelli sviluppati nella fase di progettazione
  - Valutare le prestazioni dei modelli sviluppati nella fase di progettazione
  - Fornire linee guida per l'implementazione dei dati (procedure per le operazioni)

#import "@preview/cetz:0.4.0"

= Diagramma Entità-Relazionale
Sviluppato nella fase di progettazione concettuale, è indipendente dal modello logico (relazionale e non) e dal DBMS in uso, ed è un derivato del testo grezzo.
== Componenti del diagramma E-R
#def[*Entità*\
  #split[
    #cetz.canvas({
      import cetz.draw: *
      rect((0, 0), (2, 1))
    })
  ][#eacc una classe di oggetti della realtà di interesse con esistenza autonoma (impiegato, studente, professore,...).]
]
In una prima approssimazione, un'entità può essere tradotta in una tabella (del modello relazionale) di cui ancora non è definito lo schema. Ogni entità ha un nome e per convenzione si usano i nomi al singolare.
#def[*Istanza*\
  Un'istanza è uno specifico oggetto appartenente a quell'entità.
]

#ndef[Relazione][
  #split[
    #cetz.canvas({
      import cetz.draw: *
      line((0, 0), (0.5, 0.5), (1, 0), (0.5, -0.5), close: true, anchor: "north")
    })
  ][#eacc un legame logico fra due o più entità, rilevante nel sistema che si sta modellando.]
]
Una relazione è collegata a due o più entità.
#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import fletcher.shapes: diamond

#ex[Collegamento relazione][
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Impiegato], shape: rect),
    edge(),
    node((1, 0), [Lavoro], shape: diamond),
    edge(),
    node((2, 0), [Dipartimento], shape: rect),
  )
]

In una prima approssimazione, una relazione può essere tradotta in una tabella. Ogni relazione ha un nome, per convenzione al singolare.\ L'istanza della relazione è una combinazione di istanze dell'entità che prendono parte all'associazione.

== Attributi

#ndef[Attributo][
  #split[
    #diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [entità], shape: rect),
      edge(stroke: red, marks: (none, "O")),
      node((0, -1)),
    )

  ][#eacc una proprietà elementare di un'entità o di una relazione del modello. Ogni attributo è definito su un dominio specifico.
    #align(center)[
      #diagram(
        node-stroke: black + 0.5pt,
        node((0, 0), [Esame], shape: diamond),
        edge(marks: (none, "O")),
        node((0.5, -1), [Data], stroke: none),
        edge((0, 0), (-0.5, -1), marks: (none, "O")),
        node((-0.5, -1), [Voto], stroke: none),
      ),
    ]
  ]
]
#ex[Attributo Composto][
  #import fletcher.shapes: pill
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Impiegato], shape: rect),
    edge(marks: (none, "O")),
    node((0.5, -0.7), [Nome], stroke: none),
    edge((0, 0), (-0.5, -0.7), marks: (none, "O")),
    node((-0.5, -0.7), [Cognome], stroke: none),
    node((1, 0), [#text(fill: red, [Recapito])], shape: pill, stroke: red),
    edge((1, -0.5), marks: (none, "O"), stroke: red),
    edge((1.5, -0.5), marks: (none, "O"), stroke: red),
    node((1, -0.7), [#text(fill: red, [Via])], stroke: none),
    node((1.5, -0.7), [#text(fill: red, [Numero])], stroke: none),
    edge((0, 0), (1, 0)),
  )
]

== Cardinalità

#ex[Cardinalità delle relazioni][
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Informatico], shape: rect),
    edge()[$(1,30)$],
    node((2, 0), [Partecipazione], shape: diamond),
    edge()[$(0,100)$],
    node((4, 0), [Progetto], shape: rect),
  ) \
  - Ogni istanza di informatico deve comparire in almeno un'istanza della relazione partecipazione.
  - La stessa istanza di informatico può comparire al massimo 30 istanze delle relazione partecipazione.
  - La stessa istanza di progetto può comparire al massimo in 100 istanze della relazione partecipazione.

  Quindi un informatico può lavorare a 30 progetti diversi, e un progetto può essere preso a 100 informatici diversi.
]

Nella pratica si usano solo due valori per il *minimo*:
- $0$: partecipazione opzionale dell'entità
- $1$: partecipazione obbligatoria dell'entità
#figure(
  diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Paziente], shape: rect),
    edge()[$(0,dots)$],
    node((2, 0), [Cura], shape: diamond),
    edge(),
    node((4, 0), [Medico], shape: rect),
  ),
  caption: [Possono esistere pazienti che non sono in cura presso alcun medico.],
)

#figure(
  diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Paziente], shape: rect),
    edge()[$(1,dots)$],
    node((2, 0), [Cura], shape: diamond),
    edge(),
    node((4, 0), [Medico], shape: rect),
  ),
  caption: [Ogni paziente deve essere in cura presso almeno un medico.],
)


Nella pratica si usano solo due valori per il *massimo*:
- $1$: al massimo una entità coinvolta
- $N$: non esiste un limite massimo
#figure(
  diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Paziente], shape: rect),
    edge()[$(dots,1)$],
    node((2, 0), [Cura], shape: diamond),
    edge(),
    node((4, 0), [Medico], shape: rect),
  ),
  caption: [Ad ogni paziente corrisponde al masimo un medico.],
)

#figure(
  diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Paziente], shape: rect),
    edge()[$(dots,N)$],
    node((2, 0), [Cura], shape: diamond),
    edge(),
    node((4, 0), [Medico], shape: rect),
  ),
  caption: [Ogni paziente può essere in cura presso un numero arbitrario di medici],
)
#imp[
  *Relazioni più importanti*:
  - uno-ad-uno: $1-1$;
  - uno-a-molti: $1-N$;
  - molti-a-molti: $N-N$
]
Le cardinalità da usare dovrebbero emergere dal documento di specifica.
#ex[Cardinalità degli attributi][
  #import fletcher.shapes: pill
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Impiegato], shape: rect),
    edge(marks: (none, "O")),
    node((0.5, -0.7), [Nome], stroke: none),
    edge((0, 0), (-0.5, -0.7), marks: (none, "O")),
    node((-0.5, -0.7), [Codice], stroke: none),
    node((1, 0), [Recapito], shape: pill),
    edge((1, -0.7), marks: (none, "O")),
    edge((2, -0.5), marks: (none, "O"))[$(0,N)$],
    node((1, -0.7), [Indirizzo], stroke: none),
    node((2, -0.5), [Telefono], stroke: none),
    edge((0, 0), (1, 0))[$(1,N)$],
  )\
  Si può definire cardinalità minima e massima anche per attributi e attributi composti.
]
== Identificatori
#ndef[Idefntificatore][
  #split[
    #diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [entità], shape: rect),
      edge(stroke: red, marks: (none, "@")),
      node((0, -1), stroke: none, text(fill: red)[Nome]),
    )

  ][#eacc uno strumenoto per identificare in maniera univoca le istanze di un entità. Corrisponde al concetto di chiave nel modello relazionale, quindi deve godere del requisito di minimalità.\
    #imp[Ogni entità deve avere un identificatore, ma non le relazioni.]
  ]
]
- Identificatore *interno*: composto da attributi dell'entità;
- Identificatore *esterno*: Composto da attributi dell'entità ed entità esterne.

#ex[Identificatore interno composto da più attributi][
  #split(
    diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [Impiegato], shape: rect, name: <0>),
      node((1, -1), stroke: none, name: <1>, text(fill: red)[Data nascita]),
      node((1, -0), stroke: none, name: <2>, text(fill: red)[Cognome]),
      node((1, 1), stroke: none, name: <3>, [Nome]),
      edge(<0>, <1>, stroke: red, marks: (none, "@")),
      edge(<0>, <2>, stroke: red, marks: (none, "@")),
      edge(<0>, <3>, marks: (none, "O")),
    ),
    figure(
      diagram(
        node-stroke: black + 0.5pt,
        node((0, 0), [Impiegato], shape: rect, name: <0>),
        node((1, -1), stroke: none, name: <1>, [Data nascita]),
        node((1, -0), stroke: none, name: <2>, [Cognome]),
        node((1, 1), stroke: none, name: <3>, [Nome]),
        edge(<0>, <1>, marks: (none, "O")),
        edge(<0>, <2>, marks: (none, "O")),
        edge(<0>, <3>, marks: (none, "O")),
        edge((0.5, 0.2), (0.5, -1), stroke: red, marks: (none, "@")),
      ),
      caption: [Rappresentazione preferita],
    ),
  )
  Gli attributi che formano l'identificatore (interno) di
  un'entità devono avere cardinalità $(1,1)$.
]

#ex[Identificatore esterno][
  Include anche entità esterne, collegate attraverso relazioni all'entità corrente.
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 1), [Studente], shape: rect, name: <s>),
    edge()[$(1,1)$],
    node((2, 1), [Iscrizione], shape: diamond, name: <i>),
    edge()[$(0,N)$],
    node((4, 1), [Università], shape: rect, name: <u>),
    node((-0.5, 0), stroke: none)[Cognome],
    edge(<s>, marks: ("O", none)),
    node((0.5, 0), stroke: none)[Matricola],
    edge(<s>, marks: ("O", none)),
    node((0, 2), stroke: none)[Anno],
    edge(<s>, marks: ("O", none)),

    node((4, 0), stroke: none)[Nome],
    edge(<u>, marks: ("@", none)),
    node((4, 2), stroke: none)[Indirizzo],
    edge(<u>, marks: ("O", none)),

    edge((0, 0.5), (0.75, 1.5), bend: 45deg, marks: (none, "@"), stroke: red),
  )\

  Uno studente è identificato dal suo numero di matricola e dall'università cui è iscritto. L'entità esterna deve essere in relazione $1-1$ con l'entità corrente.
]

== Generalizzazioni
#let arrow(partial) = rotate(
  -90deg,
  scale(
    10%,
    cetz.canvas({
      import cetz.draw: *
      line(
        (0, 5),
        (9, 5),
        (9, -.5),
        (16, 6.5),
        (9, 13.5),
        (9, 8),
        (0, 8),
        close: true,
        fill: partial,
        stroke: black + 5pt,
      )
    }),
    reflow: true,
  ),
  reflow: true,
)

#diagram(
  node-stroke: black + 0.5pt,
  node((1, 0), [Dipdendente], shape: rect),
  node((1, 0.5), name: <i>),
  edge((1, 0), "=>"),
  node((0.5, 1), [Tecnico], shape: rect),
  edge(<i>),
  node((1.5, 1), [Sviluppatore], shape: rect),
  edge(<i>),
)\
Definisce una gerarchia tra entità basata su sul concetto di ereditarietà. Tutti gli attributi di dipendente (padre) sono anche attributi di tecnico e sviluppatore (figli). Quest'ultimi sono detti specializzazioni. Le specializzazioni partecipano a tutte le relazioni del padre.\
Le specializzazioni potrebbero avere attributi specializzati che il padre non possiede.\
Ci sono due tipi di generalizzazioni:
- Parziale #diagram(
    node-stroke: black + 0.5pt,
    edge((0, 0.25), (0, 0), "=>"),
  ): esistono occorrenze che sono solo dell'entità padre. (posso avere un dipendente che non è né tenico, né sviluppatore).
- Totale #diagram(
    node-stroke: black + 0.5pt,
    edge((0, 0.25), (0, 0), "=|>"),
  ): per forza ogni occorrenza dell'entità padre è occorrenza di almeno una delle entità figlie (un dipendente è per forza o un tecnico o uno sviluppatore).
#eacc possibile definire generalizzazioni a cascata.
== Dizionario dei dati
Il dizionario dei dati è una tabella contentente la descrizione delle entità/relazioni del modello E-R.
#figure(
  table(
    columns: 4,
    inset: 5pt,
    [Entità], [Descrizione], [Attributi], [Identificatore],
    [...], [...], [...], [...],
  ),
  caption: [Dizionario entità],
)
#figure(
  table(
    columns: 4,
    inset: 5pt,
    [Relazione], [Descrizione], [Attributi], [Identificatore],
    [...], [...], [...], [...],
  ),
  caption: [Dizionario relazioni],
)
== Problemi del modello E-R
Non tutti i vincoli presenti nelle specifiche sono esprimibili con il modello E-R. Ad esempio vincoli nei valori permessi negli attributi.
Per esprimere tali vincoli si usano le _business rules_.
#ndef[Business Rules][
  Descrizione di un concetto rilevante per l'applicazione, reappresentato nel glossario dei dati.
]
Tramite le business rules vengono raccolti vincoli sui dati dell'applicazione e derivazioni di concetti.
Le business rules possono essere raccolte in tabelle, e devono essere allegate al diagramma E-R.
#ex[Business Rules][
  #table(
    inset: 5pt
  )[*Regole di vincolo*][1. Il direttore di un dipartimento deve afferire a tale dipartimento.][
    2. Un impiegato non deve avere uno stipendio maggiore del direttore del dipartimento al quale afferisce.
  ][*Regole di derivazione*][
    1. Il budget di un dipartimento si ottiene sommando il budget dei profitti afferenti a quel dipartimento.
  ]
]

= Progettazione Concettuale
La costruzione di uno schema concettuale deve tenere conto di alcune proprietà generali che né determinano la qualità:
- Correttezza: utilizzo corretto (sintattio/semantico) del modello E-R;
- Completezza: rappresentazione di tutte i dati di interesse (e delle operazioni) descritti nel documento di specifica.
Queste proprietà dipendono dal progettista, ma esistono anche alcune metodologie di progettazione concettuale
== Strategie di progettazione
- *Top-down*: lo schema concettuale viene ottenuto attraverso una serie di raffinamenti successivi a partire da uno schema iniziale molto astratto;
- *Bottom-up*: le specifiche iniziali sono suddivise in componenti sempre più piccoli, e i vari schemi sono integrati tra loro in un secondo momento.
- *Inside out*: si individuano una serie di concetti importanti e poi si procede a partire da questi verso concentti correlati, con una estensione a macchia d'olio.
- *Strategia Mista*: è una combinazione delle strategie precedenti:
  + si individuano i concetti principali;
  + si realizza uno schema "scheletro";
  + si decompone lo schema;
  + si raffina, espande e integra lo schema.
In molti casi pratici, la strategia mista è la scelta migliore.

== Pattern di progettazione
Non esiste una rappresentazione univoca delle specifiche, nel dubbio ci si attiene alle regole concettuali (RC).
#ndef[Regole Concettuali][
  - RC1: se un concetto ha priorità significativa e descrive oggetti con esistenza autonoma è un entità;
  - RC2: se un concetto correla due o più entità è una relazione;
  - RC3: se un oggetto è un caso particolare dell'altro: è una generalizzazione
]

I *pattern* sono soluzioni di problemi ricorrenti. \
#ndef[Pattern 1: composizione][
  Concetti di tipo "parte-di" attraverso l'utilizzo di relazioni "uno a molti".\
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 1), [Dipartimento], shape: rect, name: <s>),
    edge()[$(1,1)$],
    node((2, 1), [Composizione], shape: diamond, name: <i>),
    edge()[$(1,N)$],
    node((4, 1), [Università], shape: rect, name: <u>),
    node((0.5, 0), stroke: none)[Nome],
    edge(<s>, marks: ("O", none)),


    node((4, 0), stroke: none)[Nome],
    edge(<u>, marks: ("@", none)),

    edge((0, 0.5), (0.75, 1.5), bend: 45deg, marks: (none, "@")),
  )\
  Le parti dipendono dal tutto.
]

#ndef[Pattern 2: gestione duplicati][
  #figure(
    diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [Studente], shape: rect, name: <s>),
      node((0, -1), [Matricola], stroke: none, name: <m>),
      edge(<s>, <m>, marks: (none, "@")),
      edge(<s>, <e>)[$(0,N)$],
      node((2, 0), [Esame], shape: diamond, name: <e>),
      node((1.5, -1), [Voto], stroke: none, name: <v>),
      node((2.5, -1), [Data], stroke: none, name: <d>),
      edge(<e>, <v>, marks: (none, "O")),
      edge(<e>, <d>, marks: (none, "O")),
      node((0, -1), [Matricola], stroke: none, name: <m>),
      edge(<e>, <c>)[$(0,N)$],
      node((4, 0), [Corso], shape: rect, name: <c>),
      edge(<c>, <co>, marks: (none, "@")),
      node((4, -1), [Codice], stroke: none, name: <co>),
    ),
    caption: [
      Uno studente può fare l'esame di un corso una sola volta. Questo perché la relazione STUDENTE - ESAME - CORSO è trattata come una relazione ternaria, e ogni tripla (studente, corso, esame) rappresenta un'istanza unica, quindi non c'è spazio per ripetere lo stesso esame dello stesso corso (non corretto).
    ],
  ),
  #figure(
    diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [Studente], shape: rect, name: <s>),
      node((0, -1), [Matricola], stroke: none, name: <m>),
      edge(<s>, <m>, marks: (none, "@")),
      edge(<s>, <se>)[$(0,N)$],

      node((1, 0), [S-E], shape: diamond, name: <se>),
      edge(<se>, <e>)[$(1,1)$],

      node((2, 0), [Esame], shape: rect, name: <e>),
      node((2, 1), [Voto], stroke: none, name: <v>),
      node((2, -1), [Data], stroke: none, name: <d>),
      edge(<e>, <v>, marks: (none, "O")),
      edge(<e>, <d>, marks: (none, "O")),

      node((3, 0), [E-C], shape: diamond, name: <ec>),

      node((0, -1), [Matricola], stroke: none, name: <m>),
      edge(<e>, <ec>)[$(1,1)$],
      node((4, 0), [Corso], shape: rect, name: <c>),
      edge(<ec>, <c>)[$(0,N)$],

      edge(<c>, <co>, marks: (none, "@")),
      node((4, -1), [Codice], stroke: none, name: <co>),

      edge((2.5, 0.2), (1.5, 0.2), bend: -90deg, marks: (none, "@")),
    ),
    caption: [
      Uno studente può sostenere più volte lo stesso esame per lo stesso corso. Questo avviene perché ora la relazione S-E (STUDENTE - ESAME) permette a uno studente di sostenere più esami (con date diverse, ad esempio). La combinazione delle chiavi (studente, corso, data) nell'entità ESAME consente di registrare esami separati, permettendo così più tentativi per lo stesso corso (corretto).
    ],
  )
]

#ndef[Pattern 3: storia di un concetto][
  Si utilizzano le generalizzazioni per tenere traccia della storia di un concetto (ossia, della sua istanza attuale e di quelle pregresse).\
  #diagram(
    node-stroke: black + 0.5pt,
    node((1, 0), [Software], shape: rect),
    node((1, 0.5), name: <i>),
    edge((1, 0), "=|>"),
    node((0.5, 1), [Software\ Obsoleto], shape: rect),
    edge(<i>),
    node((1.5, 1), [Software\ Aggiornato], shape: rect),
    edge(<i>),
  )\
  La generalizzazione consente di evitare duplicati tra le entità, inserendo solo gli attributi specifici del concetto aggiornato/storico.
]

#ndef[Pattern 4: evoluzione nel tempo di un concetto][
  Si utilizzano le generalizzazioni per tenere traccia dell'evoluzione nel tempo di un certo concetto (ossia creazione di nuove istanze diverse dal concetto originario)\
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Progetto], shape: rect),
    edge()[$(1,N)$],
    node((2, 0), [Partecipazione], shape: diamond),
    edge()[$(1,1)$],
    node((4, 0), [Ricercatore], shape: rect),
    edge((0, 1), (0, 0), "=>"),
    node((0, 1), [Progetto Accettato], shape: rect),
  )\
  Un "Progetto" può diventare (o meno) un "Progetto Accettato" nel tempo.
]
== Analisi di prestazione
Una volta realizzato il modello E-R è importante analizzare l'efficienza dal punto di vista prestazionale. Sono indici di prestazione:
- Costo operazionale: numero di entità/associazioni mediamente visitate per implementare una certa operazione sui dati;
- Occupazione di memoria: spazio di memoria necessario per memorizzare i dati.
Per poter stimare l'efficienza prestazionale di uno schema E-R, servono informazioni aggiuntive:
#ndef[Tavola dei Volumi][
  La tavola dei volumi fornisce una stima del numero di occorrenze di entità/relazioni presenti nel modello E-R.
  #table(
    inset: 5pt,
    columns: 3,
    [*Concetto*], [*Tipo*], [*Volume*],
    [Progetto], [E], [100],
    [Release], [E], [1000],
  )
  Stima del numero medio di occorrenze di un'entità.
]

#ndef[Tavola delle operazioni][
  Definisce:
  - L'insieme delle operazioni che devono essere implementate;
  - La tipologia delle operazioni (interattive/batch);
  - La frequenza delle operazioni (es. 100/gg).
  Le tavole vengono fornite dalla raccolta ed analisi dei requisiti.
  + Si assegna un dipendente al progetto;
  + Si visualizzano tutti i dati di un progetto, delle release e del direttore;
  + Per ciascun progetto si visualizzano tutti i dati dei dipedenti associati.
]
#ndef[Costo di un'operazione][
  Data un'operazione $O$ di tipo $T$, si definisce il suo costo $c(O_T)$ come $ c(O_T)= f(O_T) dot w_T dot (alpha dot N C_"write" + N C_"read") $
  - $f(O_T)$: frequenza dell'operazione;
  - $N C_"read"$: numero di accessi in lettura a componenti dello schema;
  - $N C_"write"$: numero di accessi in scrittura a componenti dello schema;
  - $w_T$: peso dell'operazione;
  - $alpha$: coefficiente moltiplicativo delle operazioni in scrittura

]

#ndef[Costo dello schema][
  Dato uno schema S, e un'insieme di operazioni sui dati $O^1, O^2, dots, O^N$ con costi $c(O^1), c(O^2),dots, c(O^n)$, il costo dello schema è definito come:
  $ c(S)= sum^n_(i=1) c(O^i) $
]
L'obiettivo del progettista è quello di determinare lo schema E-R di costo minimo.

#ndef[Occupazione di memoria][
  Conoscendo la tavola dei volumi, il tipo di ciascun attributo e la sua dimensione su disco, è possible stimare l'occupazione di memoria dello schema.
  $ M(S)= sigma_"entità" V("entità") dot "size"("entità") + sigma_"relazioni" V("relazioni") dot "size"("relazioni") $
  - $V(e), "size"(e)$: Tabella dei volumi e dimensione in termini di occupazione di memoria dell'entità $e$;
  - $V(r), "size"(r)$: Tabella dei volumi e dimensione in termini di occupazione di memoria della relazione $r$;
]

Si cerca di determinare il miglior trade-off tra occupazione di memoria e costo delle operazioni dello schema. Gli indici di prestazione di un diagramma E-R sono forniti come input alla fase di progettazione logica, e sono utilizzati per:
- tradurre il modello concettuale;
- analizzare le ridondanze.
#imp[
  + Analisi dei requisiti
  + Progettazione concettuale
    + Diagramma E-R;
    + Dizionario entità;
    + Dizionario relazioni;
    + Tabella delle business rules;
    + Analisi indici di stima
]
= Progettazione Logica
L'obiettivo della progettazione logica è realizzare il modello logico (es. relazionale), a partiire dalle informazioni del modello E-R.
#imp[Si vuole evitare di tradurre ogni entità e ogni relazione del modello in una tabella per evitare problemi di:
  - Efficienza: troppe tabelle ricuono l'efficienza delle operazioni sui dati;
  - Correttezza: dubbi sulla traduzzione delle generalizzazioni.
]
Per garantire la qualità dello schema prodotto, la progettazione logica tipicamente include due passaggi:
+ Ristrutturazione del modello concettuale: si modifica lo schema E-R al fine di abilitare la traduzione nel modello logico e di ottimizzare il progetto nel suo complesso.
+ Traduzione nel modello logico: traduzione dei costrutti del modello E-R nei costrutti equivalenti del modello relazionale.

== Ristrutturazione
Prima di tradurre il modello E-R, è necessario ristrutturarlo per motivi di correttezza/efficienza:
+ Eliminazione delle generalizzazioni
#ex[Soluzione 1][
  #diagram(
    node-stroke: black + 0.5pt,
    node((1, 0), [$E_0$], shape: rect),
    edge((0.5, -1), marks: (none, "@")),
    node((0.5, -1), [$A_(01)$], stroke: none),

    edge((1, 0), (1.5, -1), marks: (none, "O")),
    node((1.5, -1), [$A_(02)$], stroke: none),


    node((1, 0.5), name: <i>),
    edge((1, 0), "=|>"),
    node((0.5, 1), [$E_1$], shape: rect),
    edge(<i>),
    edge((0.5, 2), marks: (none, "O")),
    node((0.5, 2), [$A_(11)$], stroke: none),
    node((1.5, 1), [$E_2$], shape: rect),
    edge(<i>),
    edge((1.5, 2), marks: (none, "O")),
    node((1.5, 2), [$A_(21)$], stroke: none),

    edge((2, 0), (3, 0), "=>"),


    node((4, 0), [$E_0$], shape: rect),
    edge((3.5, -1), marks: (none, "@")),
    node((3.5, -1), [$A_(01)$], stroke: none),

    edge((4, 0), (4.5, -1), marks: (none, "O")),
    node((4.5, -1), [$A_(02)$], stroke: none),

    edge((4, 0), (5, 0), marks: (none, "O"), stroke: red),
    node((5, 0), [#text(fill: red, $A_"tipo"$)], stroke: none),

    edge((4, 0), (3.5, 1), marks: (none, "O")),
    node((3.5, 1), [$A_(11)$], stroke: none),

    edge((4, 0), (4.5, 1), marks: (none, "O")),
    node((4.5, 1), [$A_(21)$], stroke: none),
  )\
  Accoppiamento delle entità figlie nelll'entità genitore, con accoppiamento dei relativi attributi e relazioni.
]


#ex[Soluzione 2][
  #diagram(
    node-stroke: black + 0.5pt,
    node((1, 0), [$E_0$], shape: rect),
    edge((0.5, -1), marks: (none, "@")),
    node((0.5, -1), [$A_(01)$], stroke: none),

    edge((1, 0), (1.5, -1), marks: (none, "O")),
    node((1.5, -1), [$A_(02)$], stroke: none),

    edge((1, 0), (2, -0.5)),
    node((2, -0.5), [$R_(1)$], shape: diamond),


    node((1, 0.5), name: <i>),
    edge((1, 0), "=|>"),
    node((0.5, 1), [$E_1$], shape: rect),
    edge(<i>),
    edge((0.5, 2), marks: (none, "O")),
    node((0.5, 2), [$A_(11)$], stroke: none),
    node((1.5, 1), [$E_2$], shape: rect),
    edge(<i>),
    edge((1.5, 2), marks: (none, "O")),
    node((1.5, 2), [$A_(21)$], stroke: none),

    edge((2, 0), (3, 0), "=>"),

    node((3.5, 0), [$E_1$], shape: rect),
    edge((3, -1), marks: (none, "@")),
    node((3, -1), [$A_(01)$], stroke: none),

    edge((3.5, 0), (4, -1), marks: (none, "O")),
    node((4, -1), [$A_(02)$], stroke: none),

    edge((3.5, 0), (3.5, -1), marks: (none, "O")),
    node((3.5, -1), [$A_(11)$], stroke: none),

    edge((3.5, 0), (3.5, 1)),
    node((3.5, 1), [$R_(1)$], shape: diamond),


    node((5, 0), [$E_2$], shape: rect),
    edge((4.5, -1), marks: (none, "@")),
    node((4.5, -1), [$A_(01)$], stroke: none),

    edge((5, 0), (5.5, -1), marks: (none, "O")),
    node((5.5, -1), [$A_(02)$], stroke: none),

    edge((5, 0), (5, -1), marks: (none, "O")),
    node((5, -1), [$A_(21)$], stroke: none),

    edge((5, 0), (5, 1)),
    node((5, 1), [$R_(1)$], shape: diamond),
  )\
]

#ex[Soluzione 3][
  #diagram(
    node-stroke: black + 0.5pt,
    node((1, 0), [$E_0$], shape: rect),
    edge((0.5, -1), marks: (none, "@")),
    node((0.5, -1), [$A_(01)$], stroke: none),

    edge((1, 0), (1.5, -1), marks: (none, "O")),
    node((1.5, -1), [$A_(02)$], stroke: none),

    edge((1, 0), (2, -0.5)),
    node((2, -0.5), [$R_(1)$], shape: diamond),


    node((1, 0.5), name: <i>),
    edge((1, 0), "=|>"),
    node((0.5, 1), [$E_1$], shape: rect),
    edge(<i>),
    edge((0.5, 2), marks: (none, "O")),
    node((0.5, 2), [$A_(11)$], stroke: none),
    node((1.5, 1), [$E_2$], shape: rect),
    edge(<i>),
    edge((1.5, 2), marks: (none, "O")),
    node((1.5, 2), [$A_(21)$], stroke: none),

    edge((2, 0), (3, 0), "=>"),


    node((3.5, 0), [$E_0$], shape: rect, name: <e0>),
    edge((3, -1), marks: (none, "@")),
    node((3, -1), [$A_(01)$], stroke: none),

    edge((3.5, 0), (4, -1), marks: (none, "O")),
    node((4, -1), [$A_(02)$], stroke: none),

    edge((3.5, 0), (4.5, -0.5)),
    node((4.5, -0.5), [$R_(1)$], shape: diamond),
    node((3, 2), [$E_1$], shape: rect),
    edge()[$(1,1)$],
    node((3, 1), [$R_(01)$], shape: diamond, name: <r1>),
    node((4, 1), [$R_(02)$], shape: diamond, name: <r2>),
    edge((4, 2))[$(1,1)$],

    node((4, 3), [$A_(21)$], stroke: none),
    node((4, 2), [$E_2$], shape: rect),
    node((3, 3), [$A_(11)$], stroke: none),

    edge(<e0>, <r1>)[$(0,1)$],
    edge(<e0>, <r2>)[$(0,1)$],

    edge((3, 2), (3, 3), marks: (none, "O")),
    edge((4, 2), (4, 3), marks: (none, "O")),

    edge((2.75, 1.35), (3.25, 1.35), marks: (none, "@")),
    edge((3.75, 1.35), (4.25, 1.35), marks: (none, "@")),
  )
]

- Soluzione 1 introduce valori #null ed un attributo aggiuntivo, ma è conveniente quando non ci sono troppe differenze concettuali tra $E_0, E_1, E_2$;
- Soluzione 2 è possibile solo se la generalizzazione è totale, non introduce valori #null, ma è conveniente quando ci sono operazioni che coinvolgono per lo più $E_1$ ed $E_2$ ma non l'entità genitore $E_0$;
- Soluzione 3 non introduce valori #null, ed è utile quando ci sono operazioni che si riferiscono solo ad istanze di $E_1$, $E_2$ ed $E_0$, ma presenta la necessità di introdurre dei vincoli:
  - Un'occorrenza di $E_0$ non può partecipare in contemporanea a $R_(01)$ e $R_(02)$.
  - Se la generalizzazione è totale, ogni occorrenza di $E_0$ deve partecipare a a $R_(01)$ o $R_(02)$.

== Eliminazione degli attributi multi-valore
Gli attributi multivalore non sono presenti nel modello logico, ma possono essere modellati anche con una relazione uno-a-molti.
#ex[Eliminazione attributi multi-valore][
  #diagram(
    node-stroke: black + 0.5pt,


    node((0, -2), [Persona], shape: rect, name: <s2>),
    node((1, -2), [Telefono], stroke: none, name: <t>),

    node((-0.5, -3), [Nome], stroke: none, name: <m2>),
    node((0.5, -3), [Cognome], stroke: none, name: <cg2>),
    edge(<s2>, <m2>, marks: (none, "@")),
    edge(<s2>, <cg2>, marks: (none, "O")),
    edge(<s2>, <t>, marks: (none, "O"))[$(1,N)$],

    edge((0, -1.5), (0, -1), "=>"),


    node((0, 0), [Persona], shape: rect, name: <s>),
    node((-0.5, -1), [Nome], stroke: none, name: <m>),
    node((0.5, -1), [Cognome], stroke: none, name: <cg>),
    edge(<s>, <m>, marks: (none, "@")),
    edge(<s>, <cg>, marks: (none, "O")),
    edge(<s>, <e>)[$(1,N)$],
    node((2, 0), [R], shape: diamond, name: <e>),

    edge(<e>, <c>)[$(1,1)$],
    node((4, 0), [Telefono], shape: rect, name: <c>),
  )\
  La soluzione non introduce valori #null ma aumenta il numero di entità presenti nel sistema.
]

== Partizionamento/accorporamento di concetti
Per un dato modello E-R, è possibile ridurre il numero di accessi:
- Separando attributi che vengono acceduti separatamente (partizionamento);
- Raggruppando attributi di entità diverse acceduti allo stesso tempo (accorporamento);
- #eacc necessario avere una stima sul volume dei dati per valutare se/come partizionare/accorpare entità.

== Analisi delle ridondanze
Nel modello potrebbero essere presenti ridondanze sui dati, ossia informazioni significative derivabili da altre già presenti nel modello E-R.
#tab(
  2,
  [Ridondanze],
  [*Vantaggi*],
  [*Svantaggi*],
  [Operazioni sui dati più efficienti],
  [Maggiore occupazione di memoria],
  [],
  [Maggiore complessità degli aggiornamenti
  ],
)
Per scegliere cosa fare di un attributo ridondante, è possible utilizzare l'analisi del modello E-R visto nella progettazione concettuale.
Sia $S$ lo schema E-R senza ridondanze, e $S_"RID"$ lo schema con ridondanze:
Si calcolano il costo e l'occupazione di memoria di entrambi gli schemi e poi si valuta $C(S)$ vs $C(S_"RID")$.\
Per effettuare l'analisi del modello E-R, è necessario disporre delle tavole dei volumi e delle operazioni.
#ex[Analisi modello E-R][
  - OP1: inserire una nuova persona (200/gg);
  - OP2: visualizzare tutti i dati di una città (5/gg);
  *Analisi dello schema $S_"RID"$* (con ridondanza)\
  $
    f("OP1")= 200, w_I = 1, alpha =2 \
    c("OP1")=200 dot 1 dot (3 dot 2) = 1200 \
    f("OP2")= 5, w_I = 1, alpha =2\
    c("OP2")=5 dot 1 dot (0 dot 2 + 1) = 5
  $

  *Analisi dello schema $S$* (senza ridondanza)\
  $
    f("OP1")= 200, w_I = 1, alpha =2 \
    c("OP1")=200 dot 1 dot (2 dot 2 + 0) = 800 \
    f("OP2")= 5, w_I = 1, alpha =2\
    c("OP2")=5 dot 1 dot (0 dot 2 + 5001) = 25005
  $

  $
    c(S_"RID") & = 1200 + 5   \
          c(S) & = 800 +25005
  $
  *Occupazione di memoria*\
  $M(S)= X$ (byte)\
  $M(S_"RID")= X+100 dot 4$ (byte)\
  In questo caso, è conveniente mantenere l'attributo
]

== Traduzione nel modello logico
Le entità diventano tabelle sugli stessi attributi; le relazioni del modello E-R diventano tabelle suglo identificatori delle entità coinvolte (con gli attributi propri). Sono possibili traduzioni differenti in base alle cardinalità.
#ex[Traduzione di entità con identificatore interno][
  #split[#diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [Impiegato], shape: rect, name: <0>),
      node((1, -1), stroke: none, name: <1>, [Data nascita]),
      node((1, -0), stroke: none, name: <2>, [Cognome]),
      node((1, 1), stroke: none, name: <3>, [Nome]),
      node((0, -1), stroke: none, name: <4>, [Matricola]),

      edge(<0>, <1>, marks: (none, "O")),
      edge(<0>, <2>, marks: (none, "O")),
      edge(<0>, <3>, marks: (none, "O")),
      edge(<0>, <4>, marks: (none, "@")),
    ),][impiegato(#underline[Matricola],nome,cognome,data)]
]
#ex[Traduzione identificatore esterno][
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 1), [Studente], shape: rect, name: <s>),
    edge()[$(1,1)$],
    node((2, 1), [Rel], shape: diamond, name: <i>),


    edge()[$(1,N)$],
    node((4, 1), [Università], shape: rect, name: <u>),
    node((0.5, 0), stroke: none)[Matricola],
    edge(<s>, marks: ("O", none)),


    node((4, 0), stroke: none)[Nome],
    edge(<u>, marks: ("@", none)),

    edge((0, 0.5), (0.75, 1.5), bend: 45deg, marks: (none, "@")),

    node((-0.5, 2), [Nome], stroke: none, name: <n>),
    node((0.5, 2), [Cognome], stroke: none, name: <cg>),

    edge(<s>, <n>, marks: (none, "O")),
    edge(<s>, <cg>, marks: (none, "O")),

    node((3.5, 2), [Città], stroke: none, name: <c>),
    node((4.5, 2), [Indirizzo], stroke: none, name: <i>),

    edge(<u>, <c>, marks: (none, "O")),
    edge(<u>, <i>, marks: (none, "O")),
  )\
  studente(#underline[Matricola], #underline[Nome università], Nome, Cognome)\
  università(#underline[Nome], città, indirizzo)
]

#ex[Molti a molti][
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Impiegato], shape: rect, name: <i>),
    node((-0.5, -1), [Matricola], stroke: none, name: <m>),
    node((0.5, -1), [Cognome], stroke: none, name: <cg>),

    edge(<i>, <m>, marks: (none, "@")),
    edge(<i>, <cg>, marks: (none, "O")),

    edge(<i>, <l>)[$(0,N)$],
    node((1.5, 0), [Lavoro], shape: diamond, name: <l>),
    node((1.5, -1), [Data], stroke: none, name: <d>),
    edge(<l>, <d>, marks: (none, "O")),
    edge(<l>, <p>)[$(0,N)$],
    node((3, 0), [Progetto], shape: rect, name: <p>),
    edge(<p>, <co>, marks: (none, "@")),
    node((3, -1), [Codice], stroke: none, name: <co>),
    node((2.5, 1), [Descrizione], stroke: none, name: <de>),
    node((3.5, 1), [Budget], stroke: none, name: <b>),

    edge(<p>, <de>, marks: (none, "O")),
    edge(<p>, <b>, marks: (none, "O")),
  )\

  impiegato(#underline[Matricola], cognome)\
  progetto(#underline[Codice],descrizione, budget)\
  lavoro(#underline[impiegato],#underline[codice progetto], data)
]
#ex[Uno a molti][
  #diagram(
    node-stroke: black + 0.5pt,
    node((0, 0), [Giocatore], shape: rect, name: <g>),
    node((-0.5, -1), [Nome], stroke: none, name: <m>),
    node((0.5, -1), [Cognome], stroke: none, name: <cg>),
    node((0, 1), [Ruolo], stroke: none, name: <r>),

    edge(<g>, <m>, marks: (none, "O")),
    edge(<g>, <cg>, marks: (none, "O")),
    edge(<g>, <r>, marks: (none, "O")),

    edge(<g>, <co>)[$(1,1)$],
    node((1.5, 0), [Contratto], shape: diamond, name: <co>),
    node((1.5, -1), [Ingaggio], stroke: none, name: <i>),
    edge(<co>, <i>, marks: (none, "O")),
    edge(<co>, <s>)[$(0,N)$],
    node((3, 0), [Squadra], shape: rect, name: <s>),
    edge(<s>, <n>, marks: (none, "@")),
    node((3, -1), [Nome], stroke: none, name: <n>),
    node((2.5, 1), [Città], stroke: none, name: <ci>),
    node((3.5, 1), [Sede], stroke: none, name: <se>),

    edge(<s>, <ci>, marks: (none, "O")),
    edge(<s>, <se>, marks: (none, "O")),

    edge((0.5, -0.5), (-0.5, -0.5), marks: (none, "@")),
  )\
  Ci sono due traduzioni:
  + Si traduce la relazione come una tabella separata:\
    giocatore(#underline[Nome], #underline[Cognome], ruolo)\
    squadra(#underline[Nome],Città, Sede)\
    contratto(#underline[Nome],#underline[Cognome],Nome Squadra, Ingaggio)

  + Si ingloba la relazione nell'entità con cardinalità al massimo 1:\
    giocatore(#underline[Nome], #underline[Cognome], ruolo, Nome Squadra, Ingaggio)\
    squadra(#underline[Nome],Città, Sede)\
]

#ex[Uno ad uno][
  Ci sono 3 Casi:
  + #diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [Impiegato], shape: rect, name: <g>),
      node((-0.5, -1), [Nome], stroke: none, name: <m>),
      node((0.5, -1), [Cognome], stroke: none, name: <cg>),
      node((0, 1), [Stipendio], stroke: none, name: <r>),

      edge(<g>, <m>, marks: (none, "O")),
      edge(<g>, <cg>, marks: (none, "O")),
      edge(<g>, <r>, marks: (none, "O")),

      edge(<g>, <co>)[$(1,1)$],
      node((1.5, 0), [Direzione], shape: diamond, name: <co>),
      node((1.5, -1), [Data], stroke: none, name: <i>),
      edge(<co>, <i>, marks: (none, "O")),
      edge(<co>, <s>)[$(1,1)$],
      node((3, 0), [Squadra], shape: rect, name: <s>),
      edge(<s>, <n>, marks: (none, "@")),
      node((3, -1), [Nome], stroke: none, name: <n>),
      node((2.5, 1), [Città], stroke: none, name: <ci>),
      node((3.5, 1), [Sede], stroke: none, name: <se>),

      edge(<s>, <ci>, marks: (none, "O")),
      edge(<s>, <se>, marks: (none, "O")),

      edge((0.5, -0.5), (-0.5, -0.5), marks: (none, "@")),
    )\ Si traduce il modello inglobando la relazione in una delle due entità:\ impiegato(#u[Nome],#u[Cognome], Stipendio, Data, Nome Ufficio)\ ufficio(#u[Nome], Città, Sede)\
  + #diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [Impiegato], shape: rect, name: <g>),
      node((-0.5, -1), [Nome], stroke: none, name: <m>),
      node((0.5, -1), [Cognome], stroke: none, name: <cg>),
      node((0, 1), [Stipendio], stroke: none, name: <r>),

      edge(<g>, <m>, marks: (none, "O")),
      edge(<g>, <cg>, marks: (none, "O")),
      edge(<g>, <r>, marks: (none, "O")),

      edge(<g>, <co>)[$(0,1)$],
      node((1.5, 0), [Direzione], shape: diamond, name: <co>),
      node((1.5, -1), [Data], stroke: none, name: <i>),
      edge(<co>, <i>, marks: (none, "O")),
      edge(<co>, <s>)[$(1,1)$],
      node((3, 0), [Squadra], shape: rect, name: <s>),
      edge(<s>, <n>, marks: (none, "@")),
      node((3, -1), [Nome], stroke: none, name: <n>),
      node((2.5, 1), [Città], stroke: none, name: <ci>),
      node((3.5, 1), [Sede], stroke: none, name: <se>),

      edge(<s>, <ci>, marks: (none, "O")),
      edge(<s>, <se>, marks: (none, "O")),

      edge((0.5, -0.5), (-0.5, -0.5), marks: (none, "@")),
    )\ Si traduce inglobando la relazione nell'entità che ha la partecipazione obbligatoria:\  impiegato(#u[Nome],#u[Cognome], Stipendio)\ ufficio(#u[Nome], Città, Data, Nome Direttore, Cognome Direttore)\
  + #diagram(
      node-stroke: black + 0.5pt,
      node((0, 0), [Impiegato], shape: rect, name: <g>),
      node((-0.5, -1), [Nome], stroke: none, name: <m>),
      node((0.5, -1), [Cognome], stroke: none, name: <cg>),
      node((0, 1), [Stipendio], stroke: none, name: <r>),

      edge(<g>, <m>, marks: (none, "O")),
      edge(<g>, <cg>, marks: (none, "O")),
      edge(<g>, <r>, marks: (none, "O")),

      edge(<g>, <co>)[$(0,1)$],
      node((1.5, 0), [Direzione], shape: diamond, name: <co>),
      node((1.5, -1), [Data], stroke: none, name: <i>),
      edge(<co>, <i>, marks: (none, "O")),
      edge(<co>, <s>)[$(0,1)$],
      node((3, 0), [Squadra], shape: rect, name: <s>),
      edge(<s>, <n>, marks: (none, "@")),
      node((3, -1), [Nome], stroke: none, name: <n>),
      node((2.5, 1), [Città], stroke: none, name: <ci>),
      node((3.5, 1), [Sede], stroke: none, name: <se>),

      edge(<s>, <ci>, marks: (none, "O")),
      edge(<s>, <se>, marks: (none, "O")),

      edge((0.5, -0.5), (-0.5, -0.5), marks: (none, "@")),
    )\ Si traduce il modello traducendo la relazione come una tabella a sé stante (analogo del caso uno-a-molti).\   impiegato(#u[Nome],#u[Cognome], Stipendio)\ ufficio(#u[Nome], Città, Sede)\ direzione(#u[Nome Ufficio],Nome Direttore, Cognome Direttore, Data)
]
Come per la fase di progettazione concettuale, è necessario associare lo schema logico con una opportuna documentazione perchè non tutti i vincoli sono esprimibili nello schema logico:
- Tabella delle business rules (vista in precedenza)
- Insieme dei vincoli di integrità referenziali
  - Rappresentati attraverso tabella
  - Rappresentati in maniera grafica (diagramma logico).

= Normalizzazione dei dati
Le ridondanze sui dati possono essere di due tipi:
+ *Ridondanza Concettuale*: Non ci sono duplicazioni dello stesso dato, ma sono memorizzate informazioni che possono essere ricavate da altre già contenute nel DB#footnote[Esempi di ridondanze concettuali che possono presentarsi già nel
    diagramma E-R.].
+ *Ridondanza Fisica*: esistono duplicazioni sui dati, che possono generare anomalie nelle operazioni sui dati.
#ex[Ridondanza Fisica][
  #db(
    6,
    [Università],
    [#u[Docente]],
    [Livello],
    [Salario],
    [Dipartimento],
    [Direttore],
    [#u[Corso]],
    [Rossi],
    [4],
    [15000],
    [Fisica],
    [Neri],
    [Mat. Discreta],
    [Rossi],
    [4],
    [15000],
    [Chimica],
    [Rossini],
    [Analisi I],
    [Bianchi],
    [3],
    [10000],
    [Informatica],
    [Viola],
    [Basi di Dati],
    [Neri],
    [4],
    [15000],
    [Informatica],
    [Viola],
    [Programmazione],
    [Neri],
    [4],
    [15000],
    [Matematica],
    [Bruni],
    [Inf. di base],
    [Rossi],
    [3],
    [15000],
    [Matematica],
    [Bruni],
    [Geometria],
  )
  Questo provoca:
  - Anomalia di aggiornamento: se varia lo stipendio, bisogna modificare tutte le tuple del docente.
  - Anomalia di cancellazione: se un docente non ha corsi, bisogna eliminare tutti i suoi dati.
  *Vincoli sui dati*:
  - Ogni dipartimento ha un solo direttore;
  - Ogni docente ha un solo stipendio anche se ha più corsi;
  - Lo stipendio dipende dal livello e non dal dipartimento del corso tenuto.
    #imp[#eacc stata usata un unica tabella per rappresentare informazioni eterogenee.]
]
Le ridondanze derivano da
- traduzioni non corrette nel modello logico relazionale;
- errori durante la progettazione concettuale
Per risolvere questo tipo di anomalie, si introduce un nuovo
concetto del modello relazionale: la Dipendenza Funzionale (DF).
#ndef[Dipendenza Funzionale][Data una tabella su uno schema $R(X)$ e due attributi $Y={Y_0,Y_1,dots,Y_n}$ e $Z={Z_1,Z_2,dots,Z_n}$ di $X$, esiste la dipendenza funzionale $Y->Z$ se per ogni coppia di tuple $t_1$ e $t_2$ di $r$#footnote[Relazione, cioè una tabella istanziata sullo schema $R(X)$.]. con $t_1[Y]=t_2[Y]$, si ha anche che $t_1[Z]= t_2[Z]$.
]
#ex[Dipendenza Funzionale][
  #db(
    5,
    [Azienda],
    [#u[Impiegato]],
    [Stipendio],
    [#u[Progetto]],
    [Sede],
    [Ruolo],
    [Rossi],
    [20000],
    [Marte],
    [Roma],
    [Tecnico],
    [Verdi],
    [35000],
    [Giove],
    [Bologna],
    [Tecnico],
    [Verdi],
    [35000],
    [Venere],
    [Milano],
    [Progettista],
    [Neri],
    [55000],
    [Venere],
    [Milano],
    [Direttore],
    [Neri],
    [55000],
    [Giove],
    [Bologna],
    [Direttore],
    [Neri],
    [55000],
    [Marte],
    [Roma],
    [Tecnico],
    [Bianchi],
    [48000],
    [Venere],
    [Milano],
    [Consulente],
  )
  - DF1: impiegato #arr stipendio (ogni impiegato ha un unico stipendio)
  - DF2: progetto #arr sede (ogni progetto ha un'unica sede)
  - DF3: impiegato #arr impiegato
  - DF4: impiegato progetto #arr ruolo (un impiegato può coprire un unico ruolo per progetto)
]
#imp[Le dipendenze funzionali sono definite a livello di schema e non a livello di istanza: una dipendenza funzionale è una regola logica che riguarda come devono essere strutturati i dati in una tabella, indipendentemente dai dati effettivi presenti in quel momento.]

#imp[Le dipendenze funzionali hanno sempre un verso.\ corso #arr docente _ok_, docente $<-$ corso _no_]

Le dipendenze funzionali sono una generalizzazione del vincolo di chiave e superchiave.\
Data una tabella con schema $R(X)$ e superchiave $K$, esiste un vincolo di dipendenza funzionale tra $K$ e qualsiasi attributo della tabella o combinazione degli stessi. $ K->X_1, X_1 subset.eq X $
#ex[Dipendenza Funzionale e chiavi][
  #db(5, [Azienda], [#u[Impiegato]], [Stipendio], [#u[Progetto]], [Sede], [Ruolo])
  Impiegato - Progetto è una superchiave della relazione. Non possono esistere due tuple con lo stesso valore della coppia `(impiegato, progetto)`.
  - $"DF"_1$ impiegato progetto: stipendio;
  - $"DF"_2$ impiegato progetto: sede;
  - $"DF"_3$ impiegato progetto: ruolo;
  - $"DF"_4$ impiegato progetto: sede ruolo;
  - $dots$;
  - $"DF"_N$ impiegato progetto: impiegato stipendio progetto sede ruolo
]
Dipendenze funzionali sono cattive se causano problemi come ridondanza, anomalie di aggiornamento o cancellazione. Una dipendenza è considerata buona quando non determina ridondanza.

== Forma Normale di Boyce-Codd

#ndef[Forma Normale di Boyce-Codd (FNBC)][Uno schema $R(X)$ si dice in forma normale di Boyce e Codd se per ogni dipendenza funzionale non banale#footnote[Dipendenza banale: $Z$ è contenuto in $Y$. Se non lo è si dice che è una dipendenza non banale.] $Y->Z$ definita su di esso, $Y$ è una superchiave di $R(X)$.\
  Se una tabella è in FNBC non presenta anomalie e ridondanze. Se una tabella non è in FNBC, bisogna normalizzarla (se possibile) in FNBC.
]
Per normalizzare una tabella si creano tabelle separate per ogni dipendenza funzionale
#ex[Normalizzazione][#grid(
    columns: 2,
    inset: 5pt,
    db(2, [impiegato #arr stipendio], [#u[Impiegato]], [Stipendio]),
    db(3, [impiegato, progetto #arr ruolo], [#u[Impiegato]], [#u[Progetto]], [Ruolo]),
  )
  #db(2, [progetto #arr sede], [#u[Progetto]], [Sede])
  - DF1: impiegato #arr sede: ogni impiegato lavora in una sola sede;
  - DF2: progetto #arr sede (ogni impiegato ha la stessa sede)
]
#ndef[Decomposizione][
  La decomposizione di una tabella (relazione) è il processo con cui una tabella viene suddivisa in due o più tabelle più piccole, allo scopo di:
  - Eliminare ridondanze;
  - Evitare anomalie (di aggiornamento, cancellazione, inserimento);
  - Rispettare le forme normali.
]
#imp[Se si combinano le due tabelle della decomposizione tramite operatore di `join`, non si riottiene la tabella di partenza  (decomposizione con perdita/aggiunta).]

#ndef[Decomposizione senza perdita][Uno schema R(X) si decompone senza perdita se negli schemi $R_1(X_1)$ ed $R_2(X_2)$ se per ogni possibile istanza $r$ di $R(X)$, il join naturale delle $X_1$ ed $X_2$ produce la tabella di partenza.
  $pi_X_1(r) #decomp pi_X_2(r) = r$
]
In caso di decomposizione con perdite/aggiunte, possono generarsi delle tuple *spurie* dopo il join.

Anche se una decomposizione è senza perdite, può comunque
presentare dei problemi di conservazione delle dipendenze.
#imp[
  La decomposizione deve soddisfare 3 prorpietà per essere buona:
  + Soddisfare FNBC: ogni tabella deve essere in FNBC;
  + Decomporre senza perdita: il `join` delle tabelle decomposte deve produrre la relazione originaria.
  + Conservare le dipendenze: il `join` delle tabelle decomposte deve rispettare tutte le dipendenze funzionali dello schema originario.
]

Non è sempre possibile ottenere una decomposizione in FNBC, per questo si introduce una nuova forma normale meno restrittiva di quella di Boyce e Codd.

== Terza Forma Normale

#ndef[Terza Forma Normale (TFN)][
  Una tabella $r$ è in terza forma normale se per ogni dipendenza funzionale $X->A$ non banale dello schema, almeno una delle seguenti condizioni è verificata:
  - $X$ è una superchiave di $r$;
  - $A$ appartiene ad almeno una chiave $K$ di $r$.
]
#db(
  2,
  [TFN rispetto a FNBC],
  [Svantaggi],
  [Vantaggi],
  [Tollera alcune ridondanze e anomalie sui dati],
  [Sempre ottenibile, qualsiasi sia la tabella tramite un algoritmo di normalizzazione],
  [Certifica meno la qualità dello schema ottenuto],
  [],
)

Data una relazione $r$ con schema $R(X)$ non in TFN, normalizzare in TFN implica decomporre $r$ nelle relazioni $r_1, r_2, dots, r_n$ garantendo che
- Ogni $r_i (1 lt.eq i lt.eq n)$ è in TFN;
- La decomposizione è senza perdite: $r_1 #decomp r_2 #decomp r_n = r$;
- La decomposizione conserva tutte le dipendenze $F$ definite sullo schema $R(X)$ di partenza.


Idee alla base dell'algoritmo di normalizzazione:
- Semplificare l'insieme di dipendenze $F$, rimuovendo quelle non necessarie e trasformando ogni dipendenza in modo che nella parte destra compaia un singolo attributo;
- Raggruppare gli attributi coinvolti nelle stesse dipendenze, e costruire le tabelle corrispondenti;
- Assicurarsi che almeno una tabella prodotta contenga la chiave della tabella originaria

#ndef[Implicazione Funzionale][Dato un insieme di dipendenze funzionali $F$, ed una dipendenza funzionale $f$, si dice che $F$ implica $f$ se ogni tabella che soddisfa $F$ soddisfa anche $f$\
  $F: {"impiegato"->"Livello", space "Livello"->"Stipendio"}$\
  $f: "impiegato"->"stipendio"$\
  In questo caso $F$ implica $f$.

]

#ndef[Chiusura di una dipendenza funzionale][
  Dato uno schema $R(U)$, con un insieme di dipendenze $F$, sia $X$ un insieme di attributi contenuti in $U$. Si definisce chiusura di $X$ rispetto ad $F$ $(X^+_F)$ l'insieme degli attributi che dipendono funzionalmente da $X$:
  $
    X^+_F={A|A in U and F "implica" X->A }
  $
]

#ex[Chiusura di una dipendenza funzionale][
  + $R=("ABCDE"), F={A->B,A->C}$. Vogliamo conoscere la chiusura di A. $A^+_F = {B,C}$.
  + $R=("ABCDE"), F={A->B,A->C,C->D}$ Vogliamo conoscere la chiusura di A. $A^+_F = {B,C,D}$.
]

#ndef[Normalizzazione dei dati][
  *Input*: $X$ (attributi), $F$ (dipendenze)\
  *Output*: #chxf (chiusura di $X$ rispetto ad $F$)
  $
    1) & X^+_F = X                                                            \
    2) & forall "dipendenza" f: Y->A in F                                     \
       & "se" (Y subset.eq chxf) and (A in.not chxf) => chxf = chxf union {A} \
    3) & "Ripeti 2 finchè non è possibile aggiungere nuovi elementi in" chxf.
  $
]

#ex[Normalizzazione dei dati][
  $
          R & =("ABCDE"), F={A->B,"BC"->D,B->E,E->C}               \
    1) chaf & = {A}                                                \
    2) chaf & = {A,B}                                &    (f:A->B) \
    3) chaf & = {A,B,E}                              &    (f:B->E) \
    4) chaf & = {A,B,E,C}                            &    (f:E->C) \
    5) chaf & = {A,B,E,C,D}                          & (f:"BC"->D)
  $
]

#imp[
  Come verificare se $F$ implica $f:X->Y$\
  + Calcolare la chiusura #chxf
  + Se $Y$ in #chxf, allora $F$ implica $f$
  #ex(none)[
    $
      & R=("ABCDE"), F={A->B,"BC"->D,B->E,E->C}, f:A->E \
      & chaf ={A,B,E,C,D}                               \
      & "quindi" F "implica" A->E
    $
  ]
]

Data una tabella con schema $R(U)$, l'algoritmo per determinare la chiusura #chxf può essere usato anche per verificare se $X$ è una superchiave di $R$.\
#imp[
  Dato uno schema $R(U)$, con un insieme $F$ di dipendenze funzionali, allora un insieme di attributi $K$ è una (super)chiave di $R(U)$ se $F$ implica $K->U$
]
#ex[Usare alg. di normalizzazione per identificare una chiave][
  $
    R=("ABCDE"), F={A->B,"BC"->D,B->E,E->C}, f:A->E
  $
  Se $A$ è una chiave allora $F$ implica $A->"ABCDE"$\
  $chaf ={A,B,E,C,D}$, quindi $A$ è una chiave.
]

#ndef[Insiemi di dipendenze funzionali equivalenti][
  Dati due insiemi di dipendenze funzionali $F_1$ e $F_2$, essi si dicono equivalenti se $F_1$ implica ciascuna dipendenza funzionale di $F_2$ e viceversa.
  #ex(none)[
    $
      F={A->B,"AB"->C} F_1={A->B,A->C}
    $
    $F$ e $F_1$ sono equivalenti.
  ]
]

#ndef[Insiemi di dipendenze funzionali non ridondanti][
  Dato un insieme di dipendenze funzionali $F$ definito su uno schema $R(U)$, esso si dice non ridondante se non esiste una dipendenza $f$ di $F$, tale che $F-{f}$ implica $f$.
  #ex(none)[
    $F={A->B,"AB"->C,A->C}$, $F$ è ridondante perché $F-{A->C}$ implica $A->C$.
  ]
]

#ndef[Insiemi di dipendenze ridotte][
  Dato un insieme di dipendenze funzionali $F$ definito su uno schema $R(U)$, esso si dice ridotto se:
  + non è ridondante;
  + non è possibile ottenere un insieme $F'$ equivalente eliminando attributi dai primi membri di una o più dipendenze di $F$.
  #ex(none)[
    $F={A->B,"AB"->C}$\
    $F$ non è ridotto perché B può essere eliminato da $"AB"->C$ e si ottiene ancora un insieme $F_2$ equivalente ad $F$.
  ]
]

Dato uno schema $R(U)$ con un insieme di dipendenze $F$, per trovare una copertura ridotta di $F$ si procede in 3 passi:
+ *Sostituire $F$ con $F_1$, che ha tutti i secondi membri composti da un singolo attributo*\ $ M->"RSDG", "MS"-> "CD", G->R, D->S, S->D,"MPD"->"AM"\
  F_1={ M->R, M->S, M->D, M->G, "MS" -> C, \ "MS" ->D, G->R, D->S, S->D, "MPD" ->A, "MPD" -> M } $
+ *Eliminare gli attributi estranei*\
  Supponiamo di avere $F={"AB"->C,A->B}$ e calcoliamo #chaf:
  \ $chaf = {A,B,C}$. $C$ dipende solo da $A$, quindi l'attributo $B$ in $"AB"->C$ può essere eliminato preservando l'uguaglianza. $F_1={A->C,A->B}$\
  Se si ha una dipendenza funzionale del tipo $A X->B$, si stabilisce se l'attributo $A$ può essere eliminato preservano l'uguaglianza ricalcolando $X^+$ e verificando se include $B$.
+ *Eliminare le dipendenze non necessarie*\
  $F={B->C,B->A,C->A}$. $B->A$ è ridondante, in quanto bastano le dipendenze $B->C$ e $C->A$ per capire che $A$ dipende da $B$.\
  Formalmente bisognerebbe dimostreare che $F-{B->A} "implica" {B->A}$, quindi verificare che $A in B^+_(F-{B->A})$. Se $A$ è incluso, si elimina la dipendenza funzionale.

#ndef[Algoritmo di normalizzazione in TFN][
  Dati $R(U)$, e un insieme di dipendenze $F$, l'algoritmo di normalizzazione in TFN procede come segue:
  + Costruire una copertura ridotta $F_1$ di $F$.\ $     F & ={M->"RSDG","MS"->"CD",G arr D,D arr S, S arr D, "MPD" arr "AM"}     \
    equiv                                                                        \
      F_1 & = {M arr D, M arr G, M arr C, G arr R, D arr S, S arr D, "MP" arr A} $
  + Decomporre $F_1$ nei sottonsiemi $F_1^((1)),F_1^((2)),dots, F_1^((n))$: ad ogni sottoinsieme appartengono dipendenze con gli stessi lati sinistri.\ $ F_1^((1)) & = {M arr D, M arr G, M arr C} \
    F_1^((2)) & = {G arr R}                   \
    F_1^((3)) & = {D arr S}                   \
    F_1^((4)) & = {S arr D}                   \
    F_1^((5)) & = {"MP" arr A} $
  + Se due o più lati sinistri delle dipendenze si implicano a vicenda, si fondono i relativi insiemi\ $ F_1^((1)) & = {M arr D, M arr G, M arr C} \
    F_1^((2)) & = {G arr R}                   \
    F_1^((3)) & = {D arr S,S arr D}           \
    F_1^((4)) & = {"MP" arr A} $
  + Trasformare ciascun $F_1^((i))$ in una tabella $R^((i))$ con gli attributi contenuti in ciascuna dipendenza, il lato sinistro diventa la chiave della relazione.\ $ F_1^((1)) & = {M arr D, M arr G, M arr C}: & R^((1))(underline(M)"DGC") \
    F_1^((2)) & = {G arr R} :                  &     R^((2))(underline(G)R) \
    F_1^((3)) & = {D arr S,S arr D}:           &     R^((3))(underline(S)D) \
    F_1^((4)) & = {"MP" arr A} :               &  R^((4))(underline("MP")A) $
  + Se nessuna relazione $R^((i))$ così ottenuta contiene una chiave $K$ di $R(U)$, si inserisce una nuova tabella $R^((i+1))$ contenente gli attributi della chiave.\ Nel nostro caso la chiave è costituita da $("MP")$.\ $ R^((1))(underline(M)"DGC"), R^((2))(underline(G)R),R^((3))(underline(S)D) , R^((4))(underline("MP")A) $\
  $R^((4))(underline("MP")A)$ contiene la chiave, quindi non serve aggiungere altre tabelle.
]
Si chiama _Terza_ Forma Normale perché, la prima si suppone sia sempre rispettata, la seconda è una variante debole della TFN.
== Seconda Forma Normale
#ndef[Seconda Forma Normale][Una relazione $r$ con schema $R(U)$ è in Seconda Forma Normale quando non presenta dipendenze parziali della forma $Y arr A$, dove:
  - $Y$ è un sottoinsieme proprio della chiave;
  - $A$ è un qualsiasi sottoinsieme di $R(U)$

]
$
  & "impiegato"(underline("impiegato"),"stipendio",underline("progetto"),"budget") \
  & "impiegato"->"stipendio"                                                       \
  & "progetto"->"budget" "dipendenza parziale"
$
Non è né in SFN né in TFN.
$
  & "impiegato"(underline("impiegato"),"categoria","stipendio") \
  & "impiegato"->"categoria"                                    \
  & "categoria"->"stipendio"
$
#eacc è in SFN, ma non in TFN.


#ndef[Quarta Forma Normale][Una tabella con schema $R(U)$ è in Quarta Forma Normale (4FN) se non presenta dipendenze multivalore non banali diverse da una chiave della tabella ($X->Y$ space $X->Z$)]

#ndef[Quinta Forma Normale][Una tabella con schema $R(U)$ è in Quinta Forma Normale (5FN) se non è possibile decomporre ulteriormente la tabella senza perdere informazioni.]
