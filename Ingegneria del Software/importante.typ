#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set heading(numbering: "1.1")
#set page(numbering: "1")

#let grasp_pattern(name: str, p: content, s: content) = [== #name] + [*Problema*: ] + p + [\ *Soluzione*: ] + s
// bold unordered list
#let bul(i, c) = [- *#i*: #c\;]
#let dp(i, c) = [+ *#i*: #c]
#let arr = $->$

#fletcher.MARKS.update(m => (
  m
    + (
      "<|>": (inherit: "stealth", stealth: -1),
    )
    + (
      "<>": (inherit: "stealth", stealth: -1, fill: none),
    )
    + (
      "!": (inherit: "stealth", stealth: 0, fill: none),
    )
    + (
      ">": (inherit: "stealth", stealth: 0.999, fill: none),
    )
))
#align(outline(depth: 1, title: [Ingegneria Software]), center)

= UML
*Elementi*:
- Classe: gruppo di oggetti con attributi e metodi comuni.
- Caso d'uso: descrive un'interazione tra un attore e il sistema, rappresenta una funzionalità del sistema.

*Relazioni*:
- Associazione: dato un oggetto A, si può risalire ad un oggetto B legato concettualmente ad A. #scale(
    150%,
    diagram(node((0, 0), [A]), node((1, 0), [B]), edge((0, 0), (1, 0), "-")),
    reflow: true,
  )

- Generalizzazione: un elemento B è la specializzazione di un elemento A, ovvero B è un tipo di A. #scale(
    150%,
    diagram(node((0, 0), [B]), node((1, 0), [A]), edge((0, 0), (1, 0), "-!")),
    reflow: true,
  )

- Dipendenza: un elemento A utilizza le funzionalità di un'altra classe B (relazione "utilizzatore-fornitore"). #scale(
    150%,
    diagram(node((0, 0), [A]), node((1, 0), [B]), edge((0, 0), (1, 0), "-->")),
    reflow: true,
  )

- Realizzazione: un elemento A realizza, o implementa un'interfaccia B. #scale(
    150%,
    diagram(node((0, 0), [B]), node((1, 0), [A]), edge((0, 0), (1, 0), "--!")),
    reflow: true,
  )

= Use Classe
I casi d'uso sono storie scritte usate per registrare e identificare i requisiti. Con i diagrammi dei casi d'uso si specificano i confini del sistema, il suo comportamento e le interazioni tra gli attori e il sistema stesso.

*Elementi*:
- Attore: soggetto dotato di comportamento, esterno al Sistema in Discussione.
- Sistema in Discussione: oggetto a cui si applicano i casi d'uso. Gli attori rimangono disegnati esternamente nel caso d'uso di sistema.
- Caso d'uso: collezione di scenari correlati, di successo e fallimento, che descrivono un attore che usa un sistema per raggiungere un obiettivo. I casi d'uso sono requisiti, soprattutto funzionali e comportamentali, che indicano che cosa farà il sistema. Ogni caso d'uso descrive un'unità di funzioni complete che l'oggetto fornisce ai propri utenti.
- Scenario: sequenza specifica di azioni e interazioni tra il sistema e alcuni attori, descrive una particolare storia nell'uso del sistema o un percorso attraverso il caso d'uso.

*Relazioni*:
- Associazione: un attore è associato ad un caso d'uso quando interagisce con esso. Gli attori possono essere associati ai casi d'uso solo tramite associazione binaria #footnote([non usato nella modellazione concettuale.]).
- Generalizzazione: un elemento è generalizzazione di uno più generale. #scale(
    125%,
    diagram(node((0, 0), [Login]), node((1, 0), [Web User Authentication]), edge((0, 0), (1, 0), "-!", label: text(size: 6pt, [generalizza]))),
    reflow: true,
  )

- Estensione: si vuole sottolineare che c'è un comportamento addizionale e opzionale che non sempre ha luogo. #scale(
    125%,
    diagram(node((0, 0), [Get help on registration]), node((1, 0), [Registration]), edge((0, 0), (1, 0), "-->", label: text(size: 6pt, [\<\<extend>>]))),
    reflow: true,
  )

- Inclusione: si tratta di un refactoring e di un collegamento del testo per evitare la duplicazione. La relazione di inclusione serve a specificare dei passi ulteriori che caratterizzano un certo caso d'uso e che vengono eseguiti sempre. #scale(
    125%,
    diagram(node((0, 0), [Deposit Funds]), node((0, 1), [Withdraw Cash]), node((1, 0.5), [Customer Authentication]), edge((0, 0), (1, 0.5), "-->", label: text(size: 6pt, [\<\<include>>])), edge((0, 1), (1, 0.5), "-->", label: text(size: 6pt, [\<\<include>>]))),
    reflow: true,
  )

Non esiste una notazione standard per quanto riguarda i dettagli dei casi d'uso, ma ci sono diversi template che possono essere usati. Quello più semplice è:
#table(
  rows: 6,
  table.header([*Use case Name*]),
  [ID], [Actors], [Pre-conditions], [Main Sequence], [Alternative Sequences], [Post-conditions]
)

= UML Class Diagram
Una classe è rappresentata da un rettangolo, in cui in alto è presente il nome della classe. Il rettangolo può essere diviso in compartimenti (righe orizzontali) che possono contenere informazioni addizionali, tra cui metodi e attributi.

Il diagramma delle classi UML nasce per rappresentare le classi come elementi di un programma. Serve a progettare soluzioni e sistemi SW, quindi viene utilizzato nel dominio della soluzione.

*Modificatori di visibilità*
- +: public;
- : private;
- \#: protected;
- \~: package, visibile a tutti gli elementi presenti nel package.
*Molteplicità*

Le molteplicità servono a specificare quante volte operazioni, proprietà sono presenti: `<multiplicity-range> ::= [<lower>..] <upper>`. Molteplicità utilizzate frequentemente:
- $1$ → proprietà obbligatoria
- $0..1$: proprietà che può esserci 0 o 1 una volta, quindi facoltativa
- $1…*$: proprietà che deve essere presente almeno 1 volta
- $*$: proprietà presente 0 o più volte (\*).

*Istanza*

Il diagramma degli oggetti definisce le istanze. Un'istanza è un oggetto che ha un'identità, uno stato e un comportamento. Il diagramma degli oggetti è una rappresentazione statica di un sistema in un momento specifico, utile per visualizzare le relazioni tra gli oggetti e le loro istanze. La notazione grafica dell'istanza si distingue da quella della classe perché il nome è sottolineato ed è composto da una concatenazione `instanceName : Class`.

*Relazioni*

- Generalizzazione/Specializzazione: corrisponde alla frase "è un..." e dal verso opposto si può leggere come specializzazione. #scale(
    120%,
    diagram(
      node-stroke: 1pt,
      node(
        (0, 0),
        [
          Polygon
        ],
      ),
      node((1, 0), [Shape]),
      edge((0, 0), (1, 0), "-!", label: text(size: 8pt, [è un])),
    ),
    reflow: true,
  )

- Dipendenza: relazione di tipo "utilizzatore/fornitore" fra gli elementi. #scale(
    125%,
    diagram(
      node-stroke: 1pt,
      node((0, 0), [A]),
      node((1, 0), [B]),
      edge((0, 0), (1, 0), "-->", label: text(size: 6pt, [\<\<uses>>])),
    ),
    reflow: true,
  )

- Realizzazione: dichiara che un elemento ne realizza un altro. Il caso più comune è quando le classi realizzano/implementano un'interfaccia. #scale(
    125%,
    diagram(
      node-stroke: 1pt,
      node((0, 0), [A]),
      node((0, 1), [B]),
      node((1, 0.5), [C]),
      edge((0, 0), (1, 0.5), "-->"),
      edge((0, 1), (1, 0.5), "-->"),
    ),
    reflow: true,
  )
A e B implementano C.

- Associazione: dichiara che ci possono essere collegamenti tra le istanze dei tipi associati: dato un elemento A si è in grado di risalire ad un elemento B di un altro tipo, legato ad A in maniera concettuale.
#table(
  columns: 2,
  scale(
    125%,
    diagram(
      node-stroke: 1pt,
      node((0, 0), [A]),
      node((1, 0), [B]),
      edge((0, 0), (1, 0), "->"),
    ),
    reflow: true,
  ),
  [Se è presente la freccia dato A sono capace di risalire facilmente all'elemento che gli è associato.],

  scale(
    125%,
    diagram(
      node-stroke: 1pt,
      node((0, 0), [C]),
      node((1, 0), [D]),
      edge((0, 0), (1, 0), "x->"),
    ),
    reflow: true,
  ),
  [Se è presente una croce, allora dato C non è immediato ottenere l'elemento a cui è associato (D).],

  scale(
    125%,
    diagram(
      node-stroke: 1pt,
      node((0, 0), [E]),
      node((1, 0), [F]),
      edge((0, 0), (1, 0), "-"),
    ),
    reflow: true,
  ),
  [Se non è presente né freccia né croce è indeterminata la facilità con cui si può risalire all'elemento associato.],
)

#underline([Aggregazione e composizione sono due tipi particolari di associazione.])

- Aggregazione: è un rafforzamento del legame dell'associazione, ma l'elemento aggregato esiste anche senza l'altro elemento. L'elemento che viene aggregato generalmente ha una cardinalità aperta (\*). #scale(
    150%,
    diagram(node-stroke: 1pt, node((0, 0), [Book]), node((1, 0), [Shelf]), edge((0, 0), (1, 0), "-<>")),
    reflow: true,
  )
Book esiste anche senza shelf.


- Composizione: è ancora più forte dell'aggregazione, perché l'elemento che è associato dipende/è parte dell'elemento aggregante. #scale(
    150%,
    diagram(node-stroke: 1pt, node((0, 0), [File]), node((1, 0), [Directory]), edge((0, 0), (1, 0), "-<|>")),
    reflow: true,
  )
Il file non può esistere senza la directory che lo contiene..

*Classe Astratta*: il nome di una classe astratta è compreso fra graffe o viene scritto in corsivo: `{abstract}`

*Interfaccia*: il nome delle interfacce viene compreso fra ghirne `<< >>`.

= Domain Model
Illustra i concetti significativi di un dominio, le caratteristiche e come si relazionano tra loro. Un modello di dominio è una rappresentazione visuale di classi concettuali o di oggetti del mondo reale di un dominio. #underline([Il modello di dominio è una rappresentazione di classi concettuali del mondo reale, non di oggetti software]), è un dizionario visuale delle astrazioni significative della terminologia del dominio e del contenuto informativo del dominio.

*Come creare un modello di dominio*

+ Trovare le classi concettuali: ci sono 3 strategie:
  + usare o modificare modelli esterni;
  + utilizzare un elenco di categorie;
  + identificare nomi e locuzioni nominali.\
+ Disegnarle come class in un diagramma delle classi UML;
+ Aggiungere associazioni e attributi.

= UML Activity Diagram
diagramma di attività è un diagramma UML del comportamento che mostra le attività sequenziali e parallele in un processo. Un'attività non può cominciare finché un'altra non è terminata.
I diagrammi di attività possono essere usati per modellare il comportamento di casi d'uso, interfacce, componenti, operazioni delle classi, algoritmi. Ci sono dei token che scorrono attraverso il grafo dell'attività.

*Elementi*:
- L'elemento principale è l'attività che si sta descrivendo. Viene rappresentata come un flusso di azioni coordinato. L'attività è strutturata in nodi #footnote([Activity Node: un elemento che rappresenta un'azione o un'attività in un diagramma di attività.]).

- Activity edges permettono di collegare fra loro i vari nodi e definiscono come i flussi si muovono all'interno dell'attività.
  - Il control flow indica la posizione del token
  - Object flow indica il passaggio di dati tra le azioni.
  È possibile specificare delle guardie che definiscono dei predicati che devono essere veri perché il token possa attraversare l'edge.

L'idea dei diagrammi di attività è quella di definire un insieme di azioni e specificare come si evolvono nel corso del tempo. Questa struttura di controllo permette di esprimere le alternative che il flusso di controllo può realizzare
all'interno del modello.

- La barra verticale abilita due flussi: cioè entra un flusso e ne escono due paralleli.

- Object node: nodo che definisce un punto del flusso in cui diverse azioni si passano dei dati sotto forma di oggetto. L'object node specifica dei dati che vengono trasportati tra un'azione e l'altra.

- Azione: elemento a cui è associato un nome, che rappresenta un passo atomico all'interno dell'attività.

- Event action: azione che corrisponde a eventi/segnali/messaggi generati.
- Una call behavior action rappresenta la chiamata di un'attività, cioè l'attività si espande in un diagramma di sotto-attività.

- Gli activity parameter nodes sono object nodes situati o all'inizio o alla fine del flusso, in quanto rappresentano che la prima azione per avviarsi necessita di un parametro.

- Le Input pin sono object node che ricevono valori da altre azioni attraverso object flows. Le Output pin sono object node che ritornano valori a altre azioni attraverso object flows.

- I connectors sono una notazione che permette di evitare di disegnare degli edge lunghissimi e semplificare la grafica dell'AD. Sono elementi puramente notazionali, quindi non hanno nessun effetto sul diagramma.

- Un control node è un activity node usato per coordinare i flussi fra altri nodi.

- Structured activity nodes sono nodi che contengono altri nodi, ovvero presentano una struttura particolare.
  - Il conditional node è un structured activity node che rappresenta una scelta esclusiva fra un certo numero di alternative (è una specie di if).
  - Un loop node è un structured activity node che rappresenta un loop con setup, testo e body (è una specie di for).
  - Una expansion region è un structured node che prende in input una collezione e su ogni elemento di questa agisce individualmente producendo come output una collezione. Tale procedimento può avvenire sequenzialmente ("iterative"), concorrentemente ("parallel").

- L'attività può essere partizionata per sottolineare che un determinate azioni hanno alcune caratteristiche in comune. Alle partizioni vengono applicati dei vincoli.

- Interruptable region (regione interrompibile) è un tipo di activity region che definisce un meccanismo per il quale se avviene un certo evento, mentre gli elementi all'interno di tale regione sono attivi, allora queste attività devono essere interrotte.
- L' Interrputing edge serve a specificare l'evento che fa interrompere la regione ed eventualmente l'azione da intraprendere dopo l'interruzione.

= Sequence Diagram
Questo diagramma fa parte della più comune categoria dei diagrammi di interazione, esso si concentra sullo scambio del messaggio tra un numero di lifeline. Il diagramma di sequenza descrive un'interazione concentrandosi sulla sequenza dei messaggi che sono scambiati e le loro occorrenze specifiche sulle lifeline (usato specialmente per la programmazione ad oggetti).
*Elementi*
- La lifeline rappresenta un oggetto o un attore che partecipa all'interazione. È rappresentato da una linea verticale tratteggiata che si estende verso il basso dal nome dell'oggetto o dell'attore.
- Un message è un elemento che definisce uno specifico tipo di comunicazione tra lifeline di un'interazione ed è rappresentato da una freccia. Il messaggio può essere:
  - Una chiamata sincrona: tipicamente rappresenta operazioni di chiamata/invio;
  - Una chiamata asincrona: si manda il messaggio e si continua immediatamente senza aspettare la risposta;
  - Un segnale asincrono: diverso da messaggio asincrono, il messaggio è una richiesta, non un'invocazione di una specifica richiesta
  - Un reply message: il messaggio di risposta ad una operazione call è mostrato come una linea tratteggiata e freccia con la "testa" aperta
  - Un create message: il messaggio di creazione è mandato alla lifeline in modo che lo crei lei stessa.
  - Un delete message: il messaggio di eliminazione è mandato per terminare un'altra lifeline.

- Lost and founds: si spedisce il messaggio a qualcuno che non si vuole modellare oppure si ricevono messaggi da qualcuno di non modellato
- Un interaction fragment è un elemento che rappresenta la più generale unità di interazione, esso descrive cosa avviene in un sistema #footnote([Ogni interaction fragment è concettualmente uguale ad un'interazione.]). Sono interaction fragment:
  - Occurrence: rappresenta un momento nel tempo (evento) all'inizio o alla fine di un messaggio o all'inizio/fine di una execution.
  - Execution: rappresenta un periodo nella lifetime del partecipante in cui:
    + Si esegue una unità di comportamento o azione nei limiti della lifetime;
    + Si manda un signal ad un altro partecipante;
    + Si aspetta una risposta al message da un altro partecipante.
  - Combined: definisce una combinazione di interaction fragment. Serve per definire una regione del diagramma che può o meno avere luogo.
  - Una interaction use è un interaction fragment che consente di usare (o chiamare) un'altra interazione.

Il diagramma di sequenza serve per modellare il dominio della soluzione, il livello di dettaglio
è molto ricco nel descrivere ciò che avviene. Con esso si vuole specificare una possibile traccia di esecuzione,
non tutte perché altrimenti si complicherebbe.

== Communication Diagram
I communication diagram quindi servono per fare la stessa cosa dei sequence diagram ma sono meno potenti. In questo caso si usa una numerazione per rappresentare l'orizzonte temporale. La notazione dei messaggi nei communication diagram segue le stesse regole dei sequence diagram.
L'evoluzione dei messaggi di sistema ha una sequence expression: essa serve per capire l'ordine temporale dei messaggi.
```
Sequence-expression ::=
Sequence-term '.' ... ':' message-name
Sequence-term ::= [integer[name]][recurrence]
```
= UML State Machine Diagram
I diagrammi a stati di UML mostrano una vista dinamica, fanno parte dei diagrammi comportamentali e sono usati per la progettazione. Illustra gli eventi e gli stati interessanti per un oggetto, e il suo comportamento in reazione a un evento, mostra cioè il ciclo di vita di un oggetto.

Le state machine sono applicate in due modi:
+ Per modellare il comportamento di un oggetto reattivo complesso, in risposta agli eventi: behavioral state machine;
+ Per modellare le sequenze valide delle operazioni, ovvero specifiche di protocollo o di linguaggio: protocol state machine.

*Stato*: Condizione di un oggetto in un certo intervallo di tempo, caratterizzato da un insieme di reazioni e risposte. Dire che un sistema è in un certo stato vuol dire che offre le stesse risposte di altri nello stesso stato, altrimenti sono in stati differenti. Oggetti dipendenti dallo stato reagiscono in modo diverso agli eventi a seconda del loro stato. Gli stati sono rappresentati con rettangoli arrotondati, ma possono essere internamente
suddivisi in più scomparti.

Gli stati possono essere:
- Semplici: senza vertici interni o transazioni
- Compositi: contengono una o più regioni, gli stati in queste regioni sono chiamati sottostati
- Descritti da macchine
Gli stati possono essere associati ai seguenti comportamenti:
- Enter: si attiva quando il sistema entra in uno stato;
- Exit: si attiva quando il sistema esce da uno stato;
- doActivity: si attiva quando il sistema è nello stato.

*Transizione*: In un diagramma gli stati sono collegati da transizioni. La transizione è una relazione tra due stati che descrive in modo atomico che quando si verifica un evento, l'oggetto passa da uno stato all'altro. Una transizione può essere caratterizzata anche da una guardia condizionale, ovvero un test booleano.

Le transizioni sono atomiche, cioè il token o si trova allo stato sorgente o allo stato destinazione, ma una transizione può essere raggiunta, attraversata o completata.
Le guardie sono valutate prima che una transizione abbia luogo, a meno che non partano da uno pseudostato. Le guardie tra stati possono bloccare il token, me quelle tra pseudostati no.

*Evento*: avvenimento significativo o degno di nota, cioè un'occorrenza osservabile che avviene in un momento specifico.

*Stato FInale*: definisce il termine del comportamento modellato attraverso il diagramma.

*Pseudostato*: è simile al nodo di controllo del flusso, ma ha una semantica diversa: non è in grado di trattenere il token. Sono pseudostati:
- Initial: Quando parte il sistema viene messo un token nello pseudostato iniziale, la transizione
all'uscita da questo pseudostato non può essere associata né un evento né una guardia
- Join: È il duale del fork, serve per rimettere insieme due comportamenti che provengono da regioni ortogonali differenti;
- Fork: Divide una transizione in entrata in una o più transizioni#footnote([In genere è meglio non usare join e fork.]).
- Choice: il token entra ed esce in una delle due parti, alternativamente.
- History: usato per tenere traccia dello stato di una regione. Permettono di uscire da una regione, per poi rientrarvi con lo stesso stato che si aveva al momento dell'uscita.


= SOLID
- _Single Responsibility Principle_ (SRP): una classe deve avere una sola responsabilità e una sola ragione per cambiare.
- _Open-closed principle_ (OCP): le entità software devono essere aperte all'estensione, ma chiuse alla modifica. OCP può essere violato solo per fare refactoring.
- _Open-closed principle_ (OCP): le entità software devono essere aperte all'estensione, ma chiuse alla modifica. OCP può essere violato solo per fare refactoring.
- _Liskov Substitution Principle_ (LSP): si deve poter usare un tipo specifico (sottoclasse) al posto di quello generico (superclasse) senza alterare il comportamento atteso del sistema.
- _Interface Segregation Principle_ (ISP): le interfacce devono essere specifiche e non generiche, evitando di forzare le classi a implementare metodi che non usano.
- _Dependency Inversion Principle_ (DIP): le classi di alto livello non devono dipendere da quelle di basso livello, ma entrambe devono dipendere da astrazioni. Le astrazioni non devono dipendere dai dettagli, ma i dettagli dalle astrazioni.

= General Responsibility Assignment Software Patterns (GRASP)
Si attribuiscono responsabilità agli elementi e gli elementi dialogano in base alle responsabilità. Le responsabilità sono assegnate durante la fase di design degli oggetti. GRASP può essere usato per fare RDD (Responsibility-Driven Design) garantendo i principi SOLID o per imparare OO design con le responsabilità.

I pattern GRASP sono problemi ricorrenti ai quali si è trovata una soluzione riutilizzabile, il cui funzionamento è stato dimostrato. I pattern sono:

#grasp_pattern(
  name: [Creator],
  p: [Chi è _responsabile_ dell'istanziazione di un oggetto $A$?],
  s: [Si assegna a $B$ la responsabilità di creare $A$ se una delle seguenti condizioni è vera:
    - $B$ aggrega $A$;
    - $B$ contiene $A$;
    - $B$ usa spesso metodi di $A$;
    - $B$ registra $A$;
    - $B$ ha tutti i dati per creare $A$
  ],
)

#grasp_pattern(
  name: [Information Expert],
  p: [Come si assegnano le _responsabilità_ a oggetti affinché i sistemi siano più facili da capire, mantenere ed estendere?],
  s: [Si assegna la responsabilità all'Information Expert, ovvero la classe che ha l'informazione necessaria per soddisfare la responsabilità],
)

#grasp_pattern(
  name: [Controller],
  p: [Quale oggetto è _responsabile_ di gestire una system operation #footnote([_System Operation_: invocazione di un metodo che corrisponde all'attivazione di qualcosa nella UI.])?],
  s: [Si assegna la responsabilità a una classe che rappresenta:
    - tutto il sistema;
    - un oggetto radice;
    - un dispositivo su cui sta venendo eseguito il software;
    - un sottosistema grande
  ],
)

#grasp_pattern(
  name: [Low Coupling],
  p: [Come si progetta un sistema con:
    - poche dipendenze;
    - facile da modificare
    - favorisce il riuso del codice
  ],
  s: [Si assegna la responsabilità affinché l'accoppiamento tra le parti rimanga basso: non si creano dipendenze tra classi che non sono necessarie per soddisfare le responsabilità.],
)

#grasp_pattern(
  name: [High Cohesion],
  p: [Come si mantengono gli oggetti concentrati, comprensibili, gestibili e supportati per il Low Coupling?],
  s: [Si assegna la _responsabilità_ affinché la coesione rimanga alta],
)

#grasp_pattern(
  name: [Pure Fabrication],
  p: [Cosa si fa quando nessuna classe ha le informazioni necessarie per soddisfare una _responsabilità_ #footnote([Ovvero quando non c'è un information expert.])?],
  s: [Si crea una classe artificiale (non ispirata al dominio) per mantenere la coesione, ridurre l'accoppiamento e supportare altri principi come Single Responsibility.],
)

#grasp_pattern(
  name: [Indirection],
  p: [Dove si assegna la _responsabilità_ per evitare Direct Coupling tra due o più oggetti?],
  s: [Si assegna la responsabilità a un oggetto intermediario che fa da mediatore tra gli altri due, riducendo il Direct Coupling e migliorando la manutenibilità.],
)

#grasp_pattern(
  name: [Polimorfismo],
  p: [La variazione condizionale causata da statement del _control flow_ produce codice difficile da leggere #footnote([Il comportamento del codice varia in base al tipo di un oggetto e si usa un `if` o uno `switch` per controllare il tipo. Ad esempio `if(myDog instanceof Dog){...}`]).],
  s: [Si usano alternative basate sul tipo. Il polimorfismo permette di attivare comportamenti diversi in base all'oggetto usato senza andare ad utilizzare controlli di flusso ],
)

#grasp_pattern(
  name: [Protected Variations (PV)],
  p: [Come si limitano le portate dei cambiamenti? Come si evitano cambiamenti a catena?],
  s: [Si assegnano le responsabilità per creare interfacce e classi astratte stabili attorno a punti dove si prevedono variazioni.],
)

Una corretta implementazione di PV aiuta a rispettare LSP.

= AGILE Software Development
AGILE è una collezione di principi e pratiche per lo sviluppo software che enfatizza la collaborazione, la flessibilità e la consegna continua di valore.

== Pratiche AGILE
#bul(
  [Code Review],
  [prima di essere rilasciato sul mercato, il codice deve passare dei test. La revisione viene fatta da tutti i membri del team],
)
#bul(
  [Pair Programming],
  [il codice viene scritto a coppie: ci si alterna tra pilota (scrive) e navigatore (fa code review)],
)

#bul(
  [Test Driven Design],
  [Si scrive il codice in base a i test che deve passare #footnote([Al posto di scrivere il codice e poi eseguire test su di esso.])],
)

== User Stories
Le user stories sono descrizioni funzionali dal punto di vista dell'utente finale. Sono uno strumento AGILE per comunicare i requisiti in modo semplice.
Sono implementate con dei template:
- `as a <role>, I want <goal> so that <benefit>`
- _given-when-then_
Le storie non devono sopravvivere al loro processing, ma i loro acceptance test si.

#bul(
  [Storia],
  [descrive le feature di alto livello, non è molto specifica e viene raffinata nel corso del progetto],
)

#bul(
  [Epica],
  [storia grande sviluppata in più di un'interazione],
)

#bul(
  [Tema],
  [collezione di storie correlate],
)

== INVEST
Criteri per valutare la qualità di una storia
#bul(
  [Independent],
  [le storie non devono dipendere l'una dall'altra],
)
#bul(
  [Negotiable],
  [le storie sono il risultato di una negoziazione e possono essere ri-negoziate],
)
#bul(
  [Valuable],
  [le storie devono fornire valore],
)
#bul(
  [Estimable],
  [il team deve essere in grado di stimare il livello di complessità e la quantità di lavoro richiesta per l'analisi della storia],
)
#bul(
  [Small],
  [una storia deve essere realizzata in un'iterazione],
)
#bul(
  [Testable],
  [una storia è finita solo quando le feature corrispondenti passano i test di accettazione],
)

== Extreme Programming
Metodo di sviluppo software basato su caratteristiche AGILE. Si basa su 4 attività: coding, testing, listening e designing. E 5 valori: comunicazione, semplicità, feedback, coraggio e rispetto.

Pratiche dell'extreme programming sono:

#bul(
  [Test Driven Development],
  [si inizia a scrivere il codice scrivendo i test],
)
#bul(
  [Whole Team],
  [tutte le figure necessarie per lo sviluppo lavorano insieme in modo collaborativo e continuo],
)
#bul(
  [Continuous Process],
  [
    - interazione continua;
    - miglioramento del design;
    - aggiornamenti piccoli.
    L'indicatore dello stato del progetto è la funzionalità del software],
)
#bul(
  [Planning Game],
  [processo di pianficazione basato sulle storie. Si fa prima di ogni iterazione ed è composto da
    - pianificazione delle release con i clienti;
    - pianificazione dell'iterazione solo tra sviluppatori
    I clienti ordinano le storie in base alla loro importanza, gli sviluppatori in base al rischio. Si scelgono le storie da completare entro la prossima release],
)

= Testing
Il testing è l'attività principale tra quelle di _validazione e verifica_, usate per controllare che il software testato sia conforme alle specifiche. Con il testing si rileva la presenza di un qualche tipo di errore logico.

Livelli di testing:
- Unit #arr classe/metodo: poco costosi sia da scrivere che da eseguire
- Integrazione #arr gruppo di moduli
- End to end #arr intero sistema: si manda in esecuzione l'intera applicazione. Non sempre sono automatizzabili

*Analisi statica*: si controlla il codice per trovare bug, senza eseguire il codice. Si basa su metodi formali come _model checking_, _data-flow analysis_, _abstract interpolation_ e _symbolic execution_. Si usano pattern di bug per valutare la qualità del codice.

*Analisi dinamica*: il codice viene eseguito: il test viene progettato con un approccio
- _whitebox_: si usa la struttura del codice per definire i test
- _blackbox_: ci interessa solo il risultato senza guardare il codice che c'è dietro #footnote([Si testano punti di discontinuità, dei valori casuali attorno ad essi e tutte le combinazioni possibili dei parametri.]).

#table(
  columns: 3,
  inset: 10pt,
  align: horizon,
  table.header(
    table.cell([], stroke: none),
    [*Contro*],
    [*Pro*],
  ),

  [*_white_*],
  [Complesso],
  [
    Copertura maggiore \
    Si acquisisce conoscenza sul codice creando i test
  ],

  [*_black_*], [Copertura sconosciuta], [ I tester non devono essere sviluppatori, si avvicina di più ai requisiti],
)

I test vengono validati creando mutazioni del codice che poi viene testato. Se questo passa, vuol dire che c'è un problema.

*Unit Testing*: si testa una singola funzione, il _subject_ è molto piccolo e non può essere ulteriormente scomposto. I SUT #footnote([SUT: System Under Testing]) devono essere isolati. Il test set di ogni unit deve avere casi indipendenti.

*Isolation*: si creano degli oggetti finiti finti che sostituiscono le dipendenze reali. Si caricano gli oggetti finiti con il minimo dispensabile per poter far funzionare i test. Una classe testabile deve essere associata ad un'interfaccia.

= Design Pattern
#align(
  center,
  table(
    columns: 5,
    inset: 5pt,
    align: center,
    table.cell(colspan: 2, rowspan: 2, [], stroke: none), table.cell(
      colspan: 3,
      [*Purpose*],
    ), [*Creational*], [*Structural*], [*Behavioral*],
    table.cell(
      rowspan: 2,
      rotate(-90deg, reflow: true)[
        *Scope*
      ],
      align: horizon,
    ), table.cell(
      rotate(-90deg, reflow: true)[
        *Class*
      ],
      align: horizon,
    ), [Factory Method], [Adapter], [Interpreter\ Template Method], table.cell(
      rotate(-90deg, reflow: true)[*Object*],
      align: horizon,
    ), [Abstract Factory\ Builder\ Prototype\ Singleton], [Adapter\ Bridge\ Composite\ Decorator\ Facade\ Flyweight\ Proxy], [Chain of Responsibility\ Command\ Iterator\ Mediator\ Memento\ Observer\ State\ Strategy\ Visitor]
  ),
)

== Pattern Strutturali
*Privilegiare la composizione rispetto all'ereditarietà*: Quando due o più classi condividono del comportamento comune, si hanno due opzioni:
- Ereditarietà: creare una superclasse con il metodo comune da ereditare.
- Composizione: creare una classe separata che contiene il comportamento comune e farla usare (delegare) alle classi interessate.
Si privilegia la composizione:
- *Problemi dell'ereditarietà*:
  - È troppo generosa: oltre alla sostituibilità (Liskov), porta con sé anche il codice (i metodi) della superclasse.
  - Se si eredita, non c'e scelta: si prende tutto, anche parti che non servono.
  - Il linguaggio (come Java) verifica automaticamente la compatibilità dei tipi, ma presume che se A estende B, allora A può essere usata ovunque sia previsto B (principio di sostituibilità). Questo non è sempre vero nel comportamento pratico.
  - Non rispetta OCP e PV.
- *Vantaggi della composizione*:
  - Le classi non sono legate da una gerarchia rigida.
  - Il comportamento comune viene delegato a una classe esterna.
  - Le classi contengono un riferimento a un oggetto (aggregation), e delegano ad esso.
  - Si ha più controllo e minore accoppiamento.

#dp(
  [Facade (GoF)],
  [Si usa quando è necessaria un'interfaccia comune e unificata verso un insieme disparato di implementazioni o interfacce all'interno di un sottosistema. Il problema sorge quando c'è un accoppiamento indesiderato verso molti elementi interni del sottosistema, o quando l'implementazione del sottosistema è suscettibile al cambiamento. Con Facade si ha un unico punto di contatto verso il sottosistema. Fornisce protected variations rispetto ai cambiamenti nell'implementazione di un sottosistema e supporta low coupling tramite un oggetto Indirection #footnote([Indirection: pattern GRASP che introduce di un livello intermedio tra due entità, con lo scopo di disaccoppiarle, aumentare la flessibilità, o ritardare una decisione di binding.]). Le facade sono accessibili tramite Singleton. Un Adapter che nasconde un sistema esterno può anche essere considerato una forma di Facade.],
)

#dp(
  [Proxy],
  [Permette di intercettare e controllare l'accesso ad un oggetto per indirizzare problemi ortogonali #footnote([I problemi ortogonali sono problemi significativi che non fanno parte del dominio del problema.]). Il proxy fornisce il sostituto o un segnaposto per un altro oggetto per controllare l'accesso ad esso, aggiungendo un livello di indirection. Fornisce protected variations e low coupling.],
)

#dp(
  [Decorator (GoF)],
  [Si usa per aggiungere responsabilità ad un oggetto interno tramite incapsulamento. I decorator forniscono una flessibilità maggiore rispetto all'ereditarietà perché possono essere combinati. Un Decorator interpone un servizio sull'oggetto incapsulato. Applica il principio di indirection.],
)

#dp(
  [Adapter (GoF)],
  [Permette a classi con interfacce incompatibili (parametri o tipi diversi) di collaborare tra loro, a differenza di Proxy dove l'intermediario ha la stessa interfaccia. Adapter coinvolge quattro componenti principali:
    - Target: l'interfaccia attesa dal client.
    - Client: utilizza l'interfaccia Target.
    - Adaptee: la classe esistente con un'interfaccia incompatibile.
    - Adapter: adatta l'interfaccia di Adaptee a quella di Target.

    Fornisce un livello di indirection tra il client e il componente adattato. Supporta protected variations dato che protegge i client o le parti interne del sistema dalle variazioni o instabilità nelle interfacce esterne. Riduce l'accoppiamento mantenendo il client accoppiato solo all'interfaccia stabile dell'Adapter. Può essere considerato una forma di Pure Fabrication.
    L'Adapter si concentra sulla conversione delle interfacce tra componenti esistenti con interfacce non corrispondenti, mentre Facade si concentra sulla semplificazione dell'accesso a un sottosistema complesso, fornendo un'interfaccia unificata e di alto livello.
  ],
)

#dp(
  [Bridge],
  [Si usa per separare un'astrazione dalla sua implementazione affinché le due possano variare indipendentemente. Ha la struttura uguale all'Adapter, ma quello che cambia è l'intento. Con questo pattern si rompe la gerarchia nel quale è il client a decidere. Adapter serve a far funzionare le cose dopo che sono state disegnate, mentre Bridge viene pensato prima ancora della creazione del modulo di basso livello.],
)

#dp(
  [Composite],
  [Si usa per gestire un gruppo o una struttura di composizione di oggetti allo stesso modo (polimorficamente). Si definiscono classi per oggetti compositi e atomici in modo che implementino la stessa interfaccia. Sia gli oggetti individuali (chiamati anche "oggetti atomici" o "foglia") che gli oggetti che rappresentano un gruppo di questi oggetti implementano questa stessa interfaccia. Un oggetto composito contiene una collezione di altri oggetti che implementano la stessa interfaccia. Questa collezione può includere sia oggetti atomici che altri oggetti compositi, creando così una struttura ad albero. Gli elementi dell'albero hanno due ruoli distinti: ruolo intermedio che rimanda ad altri elementi e ruolo terminale. È basato sul principio del Polymorphism, poiché oggetti di tipi diversi (atomico e composito) rispondono allo stesso messaggio tramite un'interfaccia comune. Fornisce protected variations, proteggendo il cliente dalla variabilità nella struttura (singolo oggetto vs. gruppo).],
)

#dp(
  [Flyweight],
  [Si riduce l'uso di memoria condividendo quanti più dati possibili tra oggetti simili. Ha metodi per accedere allo stato condiviso. Il client non sa come è fatto l'oggetto, sa solo che può essere condiviso. Il flyweight ha una singola (single responsibility) responsabilità: rappresentare lo stato intrinseco. I client sono disaccoppiati dalla logica di condivisione: non gestiscono come i flyweight sono riutilizzati, favorendo low coupling.],
)


== Pattern Creazionali

*`new` è pericoloso*: Ogni volta che si crea una classe concreta con new `new` si crea una dipendenza di cattiva qualità che viola DIP: se cambia il costruttore della classe concreta bisogna cambiare ogni occorrenza di `new` di quella classe.

#dp(
  [Abstract Factory (GoF)],
  [Al posto di usare `new`, si delega la creazione dell'oggetto a una classe a parte, la Factory. Le factory separano il client #footnote([Con client si intende qualsiasi componente (classe, modulo, funzione, sistema...) che usa un altro componente per ottenere un servizio o una funzionalità.]) dal processo di istanziazione e delegano la creazione dell'oggetto a un'interfaccia comune. Questa è una dipendenza di buona qualità perché vi si possono solo aggiungere metodi. La abstract factory si usa per creare famiglie di oggetti correlati che implementano un'interfaccia comune, favorendo la variabilità (protected variations).],
)

#dp(
  [Factory],
  [
    Consente a una classe di delegare l'istanziazione di oggetti a sottoclassi, permettendo così di decidere quale classe concreta istanziare al momento dell'esecuzione. Si basa sull'ereditarietà: le sottoclassi sovrascrivono il metodo factory per creare oggetti specifici. Permette alle sottoclassi di modificare il tipo di oggetto creato. Viene utilizzato per separare la responsabilità della creazione complessa in oggetti ausiliari coesi. È un oggetto _pure fabrication_ la cui responsabilità è gestire la creazione di altri oggetti #footnote([ "Pure Fabrication" è una classe inventata per la convenienza del designer, non ispirata direttamente da un concetto del dominio]). Garantisce Low Coupling e aumenta il potenziale di riuso. Dato che in genere serve una sola istanza delle factory, sono spesso accessibili tramite il pattern Singleton. Factory è una semplificazione delle Abstract Factory: al posto di coordinare la creazione di famiglie di oggetti correlati, si concentra sulla creazione di un unico oggetto complesso.
  ],
)

#dp(
  [Singleton (GoF)],
  [Garantisce che una classe abbia una sola istanza, fornendo un punto di accesso globale ad essa. Sono un tipo di _code smell_. In genere sono Singleton: Factory, Logger, Classi di configurazione e accesso alle risorse. Si usa il Singleton solo quando l'unicità è parte del dominio stesso, non solo dell'implementazione. Singleton è spesso utilizzato per gli oggetti Factory e Facade, ed è una Pure Fabrication.],
)

#dp(
  [Builder],
  [Si usa per costruire oggetti complessi passo per passo, separando la costruzione dalla rappresentazione finale. Un Director delega la costruzione di parti della struttura a diversi Builder (possono essere interfacce), e restituisce l'oggetto aggregato.],
)

#dp(
  [Prototype],
  [Si usano istanze di oggetti esistenti come prototipi per creare nuovi tipi. Si copiano oggetti esistenti senza rendere il codice dipendente dalle loro classi.],
)


== Pattern Comportamentali
#dp(
  [Template Method (GoF)],
  [Si definisce lo scheletro di un algoritmo in un metodo #footnote([Questo metodo è il _template method_, in genere si trova in una classe astratta.]), che contiene a sua volta chiamate a metodi astratti (hook methods) che verranno implementati nelle sottoclassi. È comune che il Template Method sia `public`, mentre gli "hook methods" siano `protected`. I comportamenti più comuni saranno in cima all'albero di ereditarietà. In questo modo le dipendenze sono dirette verso elementi più stabili e si favorisce l'aderenza a OCP.],
)

#dp(
  [Strategy (GoF)],
  [ Consente di separare un oggetto da parte del suo comportamento e cambiarlo a runtime. Si definisce una serie di algoritmi incapsulati tra loro intercambiabili: ogni algoritmo è definito in una classe separata (pure fabrication), ma hanno un'interfaccia comune. Strategy favorisce l'implementazione di OCP e obbedisce PV. Inoltre favorisce la composizione rispetto all'ereditarietà. Usa il polimorfismo e favorisce il low coupling.],
)

#dp(
  [State (GoF)],
  [
    State è come Strategy solo l'oggetto cambia il suo comportamento in base al suo stato (interno). Si definiscono classi separate per ciascuno stato. L'oggetto il cui comportamento è stato-dipendente (_context_) mantiene un riferimento all'oggetto che rappresenta il suo stato corrente. Quando il _context_ riceve una richiesta la cui gestione dipende dallo stato, delega l'esecuzione specifica a questo oggetto stato. Le classi di stato concrete sono un esempio di Pure Fabrication. La loro creazione supporta High Cohesion e Low Coupling.
  ],
)

#dp(
  [Observer (GoF)],
  [Si usa quando diversi tipi di oggetti "sottoscrittori" (subscriber) sono interessati ai cambiamenti di stato o agli eventi di un oggetto "editore" (publisher), e desiderano reagire in modo unico quando l'editore genera un evento: si propagano le modifiche di una classe su una serie di oggetti. Gli oggetti interessati ricevono la notifica del cambiamento, non viceversa. Si crea una dipendenza uno a molti, cosi quando uno cambia stato, tutti i dipendenti sono notificati. Favorisce il disaccoppiamento. Observer è basato sul Polimorfismo: L'editore interagisce con i suoi sottoscrittori tramite un'interfaccia comune, e il comportamento effettivo (come reagire all'evento) è polimorfico, definito nelle classi concrete dei sottoscrittori. L'Observer fornisce Protected Variations e Low Coupling. Se Facade è usato per la collaborazione da un layer inferiore ad uno superiore, l'Observer è usato per la comunicazione da un layer superiore ad uno inferiore.],
)

#dp(
  [Memento],
  [
    Si usa per catturare ed esternalizzare lo stato interno di un oggetto affinché possa essere ripristinato in un momento successivo senza violare l'incapsulamento.
    + Un _caretaker_ chiede ad un _originator_ di salvare il suo stato.
    + Il _caretaker_ ripristina lo stato quando necessario
    + Il _caretaker_ non sa come è fatto lo stato ma sa che può essere ripristinato
    + Il _Memento_ è l'oggetto che contiene lo stato dell'originator. Non può essere modificato dall'esterno
  ],
)

#dp(
  [Iterator],
  [Fornisce un modo per accedere agli elementi di un oggetto aggregato senza esporre la sua rappresentazione interna. Il client non sa come è fatto l'oggetto aggregato, ma sa che può essere iterato.],
)

#dp(
  [Mediator],
  [ Si definisce un oggetto che incapsula come un insieme di oggetti interagiscono. Il mediatore promuove il _loose coupling_ evitando che gli oggetti si riferiscano l'uno all'altro esplicitamente, e permette di variare le interazioni tra gli oggetti. Inserendo un intermediario si favorisce il principio di Indirection.],
)

#dp(
  [Visitor],
  ['l'Iterator, ma usa _Inversion of Control_ #footnote([IoC: Si inverte il flusso di controllo rispetto alla programmazione tradizionale: non è il codice dell'applicazione a controllare il flusso, ma è il framework o l'ambiente a chiamare il codice.]). Al posto di usare `Iterator.next()` si richiama un metodo per ogni elemento, si prende ognuno degli elementi che compongono il Visitor e si invoca un metodo su di esso. Il Visitor ha metodi per ogni tipo di elemento, e il client non sa come è fatto l'element, ma sa che può essere visitato.],
)

#dp(
  [Command (GoF)],
  [Si incapsula una richiesta come un oggetto Command che contiene tutte le informazioni necessaire sull'azione da eseguire. Cosi si parametrizzano i client con code e operazioni. Assomiglia a Visitor. Command permette di ritardare, mettere in coda le richieste. Command viene spesso utilizzato insieme al pattern Composite.],
)

#dp(
  [Chain of Responsibility],
  [Si passa una richiesta lungo una catena di _handler_. La catena di responsabilità permette di invocare più oggetti senza sapere chi gestirà la richiesta. Favorisce il decoupling e la flessibilità.],
)

#dp(
  [Interpreter],
  [Si definisce la grammatica di una lingua con una struttura ad albero. Favorisce modularità del codice ed estensione.],
)

== Pattern Moderni

#dp(
  [Hollywood Principle],
  [Si incoraggia a scrivere codice che non dipende da implementazioni specifiche, ma piuttosto da interfacce o astrazioni. Un componente di basso livello non controlla il flusso, ma è invitato a collaborare da un componente di livello superiore solo quando serve. Questo principio è spesso associato all'Inversione di Controllo #footnote([Sarà B ad attivare un comportamento di A, e non A ad attivarsi da sola.])],
)

#dp(
  [Null Object],
  [Si usa per specificare che un parametro non è inizializzato. Si ritorna un oggetto convenzionale al posto di `null` per far capire che l'oggetto non è istanziato. Il vantaggio di usare questa istanza convenzionale è che si può specificare questo oggetto implementando delle funzionalità di default per vari metodi.],
)

#dp(
  [Dependency Injection (DI)],
  [Si forniscono le dipendenze ad un oggetto dall'esterno piuttosto che crearle internamente (basato su IoC). Si riduce il coupling, facilitando il testing footnote([Si elimina la dipendenza da `new` e Factory.]) e la modularità. Si fa injection, ovvero si passano gli oggetti come argomenti di costruttore, metodi setter, interfacce o un metodo specifico.],
)

#dp(
  [Clean Dependency Injection],
  [Sono delle linee guida per implementare DI aderendo ai principi SOLID, in particolare SRP e DIP.
    - dipendenze che non cambiano nel ciclo di vita del dell'istanza #arr _constructor injection_;
    - dipendenze necessarie durante l'invocazione del metodo #arr _dependency injection_;
    - quando il binding (scelta dell'implementazione concreta) deve essere fatto a runtime, si passa una factory invece dell'oggetto stesso.
    Clean DI avviene solo nella _composition root_, #footnote([La Composition Root è l'unico punto del sistema dove si conosce l'implementazione concreta di un'interfaccia.]) tutto il resto del codice dipende da astrazioni (interfacce).
  ],
)

= Scrum
Scrum è una metodologia per lo sviluppo software in aziende di piccole-medie dimensioni. Fa parte dei metodi AGILE, ma se non è una metodologia completa: si focalizza sugli aspetti di gestione del progetto ed è infatti comune usare Scrum con altre pratiche del mondo AGILE.

Scrum ha un ciclo di vita iterativo: la fase di sprint si ripete più volte fino alla realizzazione di un prodotto potenzialmente rilasciabile.
#text(
  9pt,
  diagram(
    node-stroke: 1pt,
    spacing: 4em,
    node((0, 0), [Product\ Backlog]),
    edge((0, 0), (1, 0), "->"),
    node((1, 0), [Sprint\ Planning]),
    edge((1, 0), (2, 0), "->"),
    node((2, 0), [Sprint\ Backlog]),
    edge((2, 0), (3, 0), "->"),
    node((2.5, -1), [Sprint\ Retrospective]),
    edge((3, 0), (4, 0), "->"),
    node((3, 0), [Sprint\ Execution]),
    node((3, 1), [Daily Scrum]),
    node((4, 0), [Sprint\ Review]),
    edge((4, 0), (5, 0), "->"),

    node((5, 0), [Potentially\ Shippable\ Increment]),


    edge((3, 0), (3, 1), "->", bend: -30deg),
    edge((3, 1), (3, 0), "->", bend: -30deg),
    edge((4, 0), (2.5, -1), "->", bend: -30deg),
    edge((2.5, -1), (1, 0), "->", bend: -30deg),
  ),
)
== Ruoli
- *Core* (committed):
  - _product owner_: proiezione degli stakeholder all'interno del progetto. Rappresenta le richieste del cliente e ha il compito di decidere le priorità, deadline e specifiche del progetto. Ha potere di veto sul lavoro che è stato svolto.
  - _scrum master_: figura senior all'interno dell'organizzazione, attiva nello sviluppo, con buona conoscenza di scrum e al servizio dei colleghi. È responsabile della corretta applicazione delle pratiche scrum all'interno del progetto.
  - _development team_: team composto da 5-9 persone che si occupa di realizzare le task .Le task sono l'insieme di attività che servono per ogni interazione, non imposte dal product owner, ma autoassegnate per realizzare il progetto. In questo team devono esserci tutte le figure necessarie per completare il progetto, non si vogliono avere dipendenze esterne per evitare tempi di attesa.
- *Additional* (involved):
  - clienti
  - _executive manager_

== Artefatti
*Product backlog*: Lista di tutte le cose che devono essere fatte nel progetto. Verrà completato in più iterazioni. In questa lista, curata dal _product owner_, ci sono:
- Requisiti funzionali (user stories)
- bugfix
- requisiti non funzionali
- chores: elementi che vengono inseriti dai membri del team e che servono a produrre valore al team di sviluppo e non ai clienti, come aggiornare l'ambiente di sviluppo.

*Storie, epiche e temi*

*Sprint Backlog*: tutto cio che deve essere fatto all'interno dello sprint in un dato intervallo di tempo. Ad ogni task è associata un tempo per completarla (in genere inferiore ad una giornata).

*Burn down chart*: diagramma che mostra come nel tempo varia il numero di task e le ore disponibili.

== Sprint Planning
Momento in cui si stabilisce come riempire lo sprint backlog. Solitamente si fa una riunione di 1-2 giorni e ci si organizza in due fasi:
+ Product owner definisce gli obiettivi e presenta gli elementi essenziali che vuole all'interno del prodotto e per ogni elemento viene indicato dettaglio e le richieste, stimando l'impegno e tempo necessario.
+ (Solo dal team) si selezionano gli elementi da dividere in task, popolando poi lo sprint backlog.

== Scrum Estimation
Si stabilisce quante task ad altra priorità scegliere. Le task si stimano in ore, mentre gli elementi nel product si valutano con le user stories. Queste vengono valutate in base alla loro complessita e agli story points che misurano il valore prodotto. L'assegnazione delle user stories avviene con il planning poker.\
Il numero di storie da scegliere per completare lo sprint backlog può essere in base a:
- *Capacity driven planning*: le storie vengono analizzate in base al tempo richiesto ed effort.
- *Velocity driven planning*: le storie vengono scelte dal backlog in base ai _story points_ associati. Questa stima è accurata per team che conoscono la loro velocity #footnote([Velocity: metrica di avanzamento che indica quanti story point macina un team di sviluppo.]).

== Daily Scrum
Riunione giornaliera di 15 minuti dove ogni membro del team dice
- cosa ha fatto ieri per contribuire allo sprint;
- cosa farà oggi per contribuire allo sprint;
- se prevede ostacoli per il raggiungimento del goal dello sprint.

== Sprint Review
Alla fine di uno sprint si fa la review con tutti i membri del team e gli stakeholder, dove vene presentato l'incremento con tutti i problemi e soluzioni. Si discute anche delle tempistiche di consegna.

== Retrospecting
Dopo allo _sprint review_, _scrum master_ e team di sviluppo discutono delle problematiche riscontrate nello sviluppo, cercando di identificare miglioramenti prima del prossimo sprint.

== Scrum Considerato Dannoso/Pericoloso
In caso di assenza dello _scrum master_, il compito viene svolto da uno o più membri del team di sviluppo. A rotazione, questo però potrebbe anche essere un vantaggio se dimostrato praticamente.

== Kanban
Kanban è un metodo di gestione del lavoro che nasce nella produzione industriale, adattato allo sviluppo software da David Anderson. Si basa su un approccio snello (lean) e just-in-time, cioè produce valore in modo continuo e sostenibile, limitando gli sprechi e migliorando il flusso di lavoro.\
A differenza di Scrum che lavora a sprint, Kanban non ha iterazioni fisse: il lavoro avanza in modo continuo lungo una pipeline, composta da più stadi come:
- To Do;
- In Progress;
- Testing;
- Done
Ogni elemento di lavoro (feature, bug, task) scorre attraverso questi stadi fino alla conclusione. \
La Kanban board rappresenta visivamente la pipeline e consente al team di:
- vedere lo stato attuale del lavoro;
- identificare colli di bottiglia;
- limitare il lavoro simultaneo.
C'è un limite al lavoro in corso (WIP limit):
Ogni stadio della pipeline ha un numero massimo di elementi che può contenere. Se uno stadio è pieno, non si possono aggiungere altri elementi finché non se ne libera uno. Questo previene colli di bottiglia, promuove il focus, e mantiene un ritmo di lavoro costante.\
In Kanban, la metrica principale è il Cycle Time: il tempo medio che un task impiega per attraversare tutta la pipeline, dal primo stadio a "Done".
Il WIP (Work in Progress) è invece la quantità attuale di lavoro in ogni stadio, e serve a monitorare il carico di lavoro del team.

#pagebreak()



#{
  let grasp = (
    "Low Coupling",
    "High Cohesion",
    "Pure Fabrication",
    "Indirection",
    "Polymorphism",
    "Protected Variations",
  )
  let solid = (
    "Single Responsibility",
    "Open-Closed",
    "Liskov Substitution",
    "Interface Segregation",
    "Dependency Inversion",
  )

  let y = emoji.checkmark
  let m = "?"
  let n = none


  let new_dp(name, gof, solid_in, grasp_in, design_patterns, pattern_type, ioc) = {
    let r = (name,)


    r.push(gof)

    for i in range(solid.len()) {
      if (i < solid_in.len()) {
        r.push(solid_in.at(i))
      } else {
        r.push(none)
      }
    }

    for i in range(grasp.len()) {
      if (i < grasp_in.len()) {
        r.push(grasp_in.at(i))
      } else {
        r.push(none)
      }
    }
    r.push(ioc)
    r.push(design_patterns)

    r.push(pattern_type)

    return r.map(x => [#x])
  }

  let dp_c(name, gof, solid_in, grasp_in, design_patterns, ioc) = new_dp(
    name,
    gof,
    solid_in,
    grasp_in,
    design_patterns,
    "Creational",
    ioc,
  )

  let dp_s(name, gof, solid_in, grasp_in, design_patterns, ioc) = new_dp(
    name,
    gof,
    solid_in,
    grasp_in,
    design_patterns,
    "Structural",
    ioc,
  )
  let dp_b(name, gof, solid_in, grasp_in, design_patterns, ioc) = new_dp(
    name,
    gof,
    solid_in,
    grasp_in,
    design_patterns,
    "Behavioural",
    ioc,
  )

  let dp_m(name, solid_in, grasp_in, design_patterns, ioc) = new_dp(
    name,
    n,
    solid_in,
    grasp_in,
    design_patterns,
    "Modern",
    ioc,
  )

  let solid_start = 1


  align(
    center,
    table(
      fill: (x, y) => if (x == 1) { rgb("#f3f5ea") } else if (x > solid_start and x <= solid_start + solid.len()) {
        rgb("EAF2F5")
      } else if (
        x > solid_start + solid.len() and x <= solid_start + solid.len() + grasp.len()
      ) { rgb("#ecf5ea") } else if (x == solid_start + solid.len() + grasp.len() + 1 and y > 0) { rgb("#f5eaed") },
      columns: 5 + solid.len() + grasp.len(),
      inset: 4pt,
      align: center,
      table.cell(colspan: 2, none, stroke: none),
      table.cell(colspan: solid.len(), [_SOLID_]),
      table.cell(colspan: grasp.len(), [_Grasp_]),
      table.cell(colspan: 3, none, stroke: none),
      table.cell(
        none,
        stroke: none,
      ), rotate(90deg, reflow: true, [*GoF*]), ..solid.map(x => rotate(
        90deg,
        reflow: true,
        [*#x*],
      )), ..grasp.map(x => [*#rotate(90deg, reflow: true, x)*]), rotate(
        90deg,
        reflow: true,
        [*Inversion of Control*],
      ), rotate(
        90deg,
        reflow: true,
        [*Related Patterns*],
      ), rotate(90deg, reflow: true, [*Pattern Type*]),
      ..dp_s("Facade", y, (m, n, n, n, m), (y, n, n, y, n, y), "Singleton, Adapter", n),
      ..dp_s("Proxy", n, (m, m, m, n, n), (y, n, n, y, n, y), none, n),
      ..dp_s("Decorator", y, (n, n, n, m, n), (n, n, n, y, n, n), none, n),
      ..dp_s("Adapter", y, (m, m, n, n, m), (y, n, y, y, n, y), "Facade", n),
      ..dp_s("Bridge", n, (m, m, n, n, m), (), "Adapter", n),
      ..dp_s("Composite", n, (), (n, n, n, n, y, y), none, n),
      ..dp_s("Flyweight", n, (m, m), (y,), none, n),
      ..dp_c("Abstract Factory", y, (m, m, m, n, m), (y, n, n, n, n, y), none, n),
      ..dp_c("Factory", n, (), (y, n, y), "Singleton, Abstract Factory", n),
      ..dp_c("Singleton", y, (), (n, n, y), "Factory, Facade", n),
      ..dp_c("Builder", n, (), (), none, n),
      ..dp_c("Prototype", n, (), (), none, n),
      ..dp_b("Template Method", y, (n, y), (), none, n),
      ..dp_b("Strategy", y, (n, y), (y, n, y, n, y, y), none, n),
      ..dp_b("State", y, (), (y, y), none, n),
      ..dp_b("Observer", y, (), (y, n, n, n, y, y), "Facade", n),
      ..dp_b("Memento", n, (), (), none, n),
      ..dp_b("Iterator", n, (), (), none, n),
      ..dp_b("Mediator", n, (), (y, n, n, y), none, n),
      ..dp_b("Visitor", n, (), (), "Iterator", y),
      ..dp_b("Command", y, (), (n, n, y), "Visitor, Composite", n),
      ..dp_b("Chain of Responsibility", n, (), (), none, n),
      ..dp_b("Interpreter", n, (), (), none, n),
      ..dp_m("Hollywood Principle", (), (), none, y),
      ..dp_m("Null Object", (), (), none, n),
      ..dp_m("Dependency Injection", (), (y,), none, y),
      ..dp_m("Clean Dependency Injection", (y, n, n, n, y), (), "Dependency Injection", n),
    ),
  )
}
