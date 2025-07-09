#set quote(block: true)

#set page(
  paper: "a4",
  flipped: true,
  numbering: "1",
  columns: 2,
)
#set heading(numbering: "1.1")
#outline(title: "Indice", depth: 1)

#counter(heading).update(0)

#let hb = line(length: 100%, stroke: 0.1pt)

#let db(col, nome, ..content) = {
  show table.cell.where(y: 1): strong
  table(
    columns: col,
    fill: (x, y) => if y == 1 { (rgb("#d2d2d2")) },

    table.cell(colspan: 3, align: left)[#nome],
    ..content
  )
}

#let def(content) = box(stroke: 1pt, inset: 6pt, radius: 1pt)[#smallcaps([def]): #content]

#let ex(nome, content) = box(stroke: 1pt, inset: 6pt, radius: 5pt)[#smallcaps([ex]): #nome \ #v(1pt) #content]

#let imp(content) = box(stroke: 2pt + red, inset: 7pt)[#content]

#let null = { smallcaps("null") }

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

Nella progettazione, bisogna tradurre le informazioni in dati del modello relazionale. Ci si chiede qualo dato devono essere gestiti e quante tabelle servono. \
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
#imp()[Il vincolo garantisce che non ci siano riferimenti a elementi inesistenti: ogni valore usato come chiave esterna in una tabella deve esistere come chiave primaria nell’altra tabella a cui si riferisce.]
== Problemi
Se un operazione di aggiornamento o modifica causa violazioni dei vincoli di integrità su altre relazioni
- non si consente l'operazione;
- si elimina a cascata
- si inseriscono valori #null
