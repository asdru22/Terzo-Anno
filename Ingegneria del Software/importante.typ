#set heading(numbering: "1.1")
#set page(numbering: "1")
#let solid_pattern(name: str, p: content, s: content) = [== #name] + [*Problema*: ] + p + [\ *Soluzione*: ] + s
// bold unordered list
#let bul(i, c) = [- *#i*: #c\;]
#let dp(i, c) = [*#i*: #c]


= SOLID
- _Single Responsibility Principle_ (SRP): una classe deve avere una sola responsabilità e una sola ragione per cambiare.
- _Open-closed principle_ (OCP): le entità software devono essere aperte all'estensione, ma chiuse alla modifica. OCP può essere violato solo per fare refactoring.
- _Liskov Substitution Principle_ (LSP): si deve poter usare un tipo specifico (sottoclasse) al posto di quello generico (superclasse) senza alterare il comportamento atteso del sistema.
- _Interface Segregation Principle_ (ISP): le interfacce devono essere specifiche e non generiche, evitando di forzare le classi a implementare metodi che non usano.
- _Dependency Inversion Principle_ (DIP): le classi di alto livello non devono dipendere da quelle di basso livello, ma entrambe devono dipendere da astrazioni. Le astrazioni non devono dipendere dai dettagli, ma i dettagli dalle astrazioni.

= General Responsibility Assignment Software Patterns (GRASP)
Si attribuiscono responsabilità agli elementi e gli elementi dialogano in base alle responsabilità. Le responsabilità sono assegnate durante la fase di design degli oggetti. GRASP può essere usato per fare RDD (Responsibility-Driven Design) garantendo i principi SOLID o per imparare OO design con le responsabilità.

I pattern GRASP sono problemi ricorrenti ai quali si è trovata una soluzione riutilizzabile, il cui funzionamento è stato dimostrato. I pattern sono:

#solid_pattern(
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

#solid_pattern(
  name: [Information Expert],
  p: [Come si assegnano le _responsabilità_ a oggetti affinché i sistemi siano più facili da capire, mantenere ed estendere?],
  s: [Si assegna la responsabilità all'Information Expert, ovvero la classe che ha l'informazione necessaria per soddisfare la responsabilità],
)

#solid_pattern(
  name: [Controller],
  p: [Quale oggetto è _responsabile_ di gestire una system operation#footnote([_System Operation_: invocazione di un metodo che corrisponde all'attivazione di qualcosa nella UI.])?],
  s: [Si assegna la responsabilità a una classe che rappresenta:
    - tutto il sistema;
    - un oggetto radice;
    - un dispositivo su cui sta venendo eseguito il software;
    - un sottosistema grande
  ],
)

#solid_pattern(
  name: [Low Coupling],
  p: [Come si progetta un sistema con:
    - poche dipendenze;
    - facile da modificare
    - favorisce il riuso del codice
  ],
  s: [Si assegna la responsabilità affinché l'accoppiamento tra le parti rimanga basso: non si creano dipendenze tra classi che non sono necessarie per soddisfare le responsabilità.],
)

#solid_pattern(
  name: [High Cohesion],
  p: [Come si mantengono gli oggetti concentrati, comprensibili, gestibili e supportati per il Low Coupling?],
  s: [Si assegna la _responsabilità_ affinché la coesione rimanga alta],
)

#solid_pattern(
  name: [Pure Fabrication],
  p: [Cosa si fa quando nessuna classe ha le informazioni necessarie per soddisfare una _responsabilità_#footnote([Ovvero quando non c'è un information expert.])?],
  s: [Si crea una classe artificiale (non ispirata al dominio) per mantenere la coesione, ridurre l'accoppiamento e supportare altri principi come Single Responsibility.],
)

#solid_pattern(
  name: [Indirection],
  p: [Dove si assegna la _responsabilità_ per evitare Direct Coupling tra due o più oggetti?],
  s: [Si assegna la responsabilità a un oggetto intermediario che fa da mediatore tra gli altri due, riducendo il Direct Coupling e migliorando la manutenibilità.],
)

#solid_pattern(
  name: [Polimorfismo],
  p: [La variazione condizionale causata da statement del _control flow_ produce codice difficile da leggere #footnote([Il comportamento del codice varia in base al tipo di un oggetto e si usa un `if` o uno `switch` per controllare il tipo. Ad esempio `if(myDog instanceof Dog){...}`]).],
  s: [Si usano alternative basate sul tipo. Il polimorfismo permette di attivare comportamenti diversi in base all'oggetto usato senza andare ad utilizzare controlli di flusso ],
)

#solid_pattern(
  name: [Protected Variations (PV)],
  p: [Come si limitano le portate dei cambiamenti? Come si evitano cambiamenti a catena?],
  s: [Si assegnano le responsabilità per creare interfacce e classi astratte stabili attorno a punti dove si prevedono variazioni.],
)

Una corretta implementazione di PV aiuta a rispettare LSP.

= AGILE software development
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
  [Si scrive il codice in base a i test che deve passare#footnote([Al posto di scrivere il codice e poi eseguire test su di esso.])],
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
- Unit $->$ classe/metodo: poco costosi sia da scrivere che da eseguire
- Integrazione $->$ gruppo di moduli
- End to end $->$ intero sistema: si manda in esecuzione l'intera applicazione. Non sempre sono automatizzabili

*Analisi statica*: si controlla il codice per trovare bug, senza eseguire il codice. Si basa su metodi formali come _model checking_, _data-flow analysis_, _abstract interpolation_ e _symbolic execution_. Si usano pattern di bug per valutare la qualità del codice.

*Analisi dinamica*: il codice viene eseguito: il test viene progettato con un approccio
- _whitebox_: si usa la struttura del codice per definire i test
- _blackbox_: ci interessa solo il risultato senza guardare il codice che c'è dietro#footnote([Si testano punti di discontinuità, dei valori casuali attorno ad essi e tutte le combinazioni possibili dei parametri.]).

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

*Unit Testing*: si testa una singola funzione, il _subject_ è molto piccolo e non può essere ulteriormente scomposto. I SUT#footnote([SUT: System Under Testing]) devono essere isolati. Il test set di ogni unit deve avere casi indipendenti.

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

== Pattern strutturali
=== Privilegiare la composizione rispetto all'ereditarietà
Quando due o più classi condividono del comportamento comune, si hanno due opzioni:
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
  [Facade],
  [Consente di isolare un client dalla complessità interna di un sottosistema. Si definisce un'interfaccia di alto livello che rende un sottosistema più facile da usare.],
)

#dp(
  [Proxy],
  [Permette di intercettare e controllare l'accesso ad un oggetto per indirizzare problemi ortogonali #footnote([I problemi ortogonali sono problemi significativi che non fanno parte del dominio del problema.]). Il proxy fornisce il sostituto o un segnaposto per un altro oggetto per controllare l'accesso ad esso.],
)

#dp(
  [Decorator],
  [Si usa per aggiungere responsabilità ad un oggetto in modo dinamico. I decorator forniscono una flessibilità maggiore rispetto all'ereditarietà perché possono essere combinati.],
)

#dp(
  [Adapter],
  [ Permette a classi con interfacce incompatibili (parametri o tipi diversi) di collaborare tra loro, a differenza di Proxy dove l'intermediario ha la stessa interfaccia.],
)

#dp(
  [Bridge],
  [Si usa per separare un'astrazione dalla sua implementazione affinché le due possano variare indipendentemente. Ha la struttura uguale all'Adapter, ma quello che cambia è l'intento. Con questo pattern si rompe la gerarchia nel quale è il client a decidere. Adapter serve a far funzionare le cose dopo che sono state disegnate, mentre Bridge viene pensato prima ancora della creazione del modulo di basso livello.],
)

#dp(
  [Composite],
  [Si compongono gerarchie parte-tutto in strutture ad albero. Composite permette di trattare oggetti singoli e composizioni di oggetti in modo uniforme. Gli elementi dell'albero hanno due ruoli distinti: ruolo intermedio che rimanda ad altri elementi e ruolo terminale.],
)

#dp([Flyweight], [Si riduce l'uso di memoria condividendo quanti più dati possibili tra oggetti simili. Ha metodi per accedere allo stato condiviso. Il client non sa come è fatto l'oggetto, sa solo che può essere condiviso.])


== Pattern creazionali

=== `new` è pericoloso
Ogni volta che si crea una classe concreta con new `new` si crea una dipendenza di cattiva qualità che viola DIP: se cambia il costruttore della classe concreta bisogna cambiare ogni occorrenza di `new` di quella classe.

#dp(
  [Abstract Factory],
  [ Al posto di usare `new`, si delega la creazione dell'oggetto a una classe a parte, la Factory. Le factory separano il client #footnote([Con client si intende qualsiasi componente (classe, modulo, funzione, sistema...) che usa un altro componente per ottenere un servizio o una funzionalità.]) dal processo di istanziazione e delegano la creazione dell'oggetto a un'interfaccia comune. Questa è una dipendenza di buona qualità perché vi si possono solo aggiungere metodi. Nelle _Abstract Factory_, il client non sa come è fatto l'oggetto, ma sa che può essere creato.],
)

#dp(
  [Singleton],
  [ Garantisce che una classe abbia una sola istanza, fornendo un punto di accesso globale ad essa. Sono un tipo di _code smell_. In genere sono Singleton Factory, Logger, Classi di configurazione e accesso alle risorse. Si usa il Singleton solo quando l'unicità è parte del dominio stesso, non solo dell'implementazione.],
)

#dp(
  [Builder],
  [Si usa per costruire oggetti complessi passo per passo, separando la costruzione dalla rappresentazione finale. Un Director delega la costruzione di parti della struttura a diversi Builder (possono essere interfacce), e restituisce l'oggetto aggregato.],
)

#dp(
  [Prototype],
  [Si usano istanze di oggetti esistenti come prototipi per creare nuovi tipi. Si copiano oggetti esistenti senza rendere il codice dipendente dalle loro classi.],
)


== Pattern comportamentali
#dp(
  [Template Method],
  [ Si definisce lo scheletro di un algoritmo in un metodo #footnote([Questo metodo è il _template method_, in genere si trova in una classe astratta.]), delegando alcuni passi alle sottoclassi. I comportamenti più comuni saranno in cima all'albero di ereditarietà. In questo modo le dipendenze sono dirette verso elementi più stabili e si favorisce l'aderenza a OCP.],
)

#dp(
  [Strategy],
  [ Consente di separare un oggetto da parte del suo comportamento e cambiarlo a runtime. Si definisce una serie di algoritmi incapsulati tra loro intercambiabili. Strategy favorisce l'implementazione di OCP e obbedisce PV. Inoltre favorisce la composizione rispetto all'ereditarietà.],
)

#dp([State], [ State è come strategy solo l'oggetto cambia il suo comportamento in base al suo stato (interno).])

#dp(
  [Observer],
  [ Permette di propagare le modifiche di una classe su una serie di oggetti. Si fa si che gli oggetti interessati ricevono la notifica del cambiamento cambiato, non viceversa. Si crea una dipendenza uno a molti, cosi quando uno cambia stato, tutti i dipendenti sono notificati. Favorisce il disaccoppiamento.],
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
  [ Si definisce un oggetto che incapsula come un insieme di oggetti interagiscono. Il mediatore promuove il _loose coupling_ evitando che gli oggetti si riferiscano l'uno all'altro esplicitamente, e permette di variare le interazioni tra gli oggetti.],
)

#dp(
  [Visitor],
  [Simile all'Iterator, ma usa IoC. Al posto di usare `Iterator.next()` si richiama un metodo per ogni elemento, si prende ognuno degli elementi che compongono il Visitor e si invoca un metodo su di esso. Il Visitor ha metodi per ogni tipo di elemento, e il client non sa come è fatto l'element, ma sa che può essere visitato.],
)

#dp(
  [Command],
  [Si incapsula una richiesta come un oggetto, permettendo di parametrizzare i client con code e operazioni. Assomiglia a Visitor. Command permette di ritardare, mettere in coda le richieste.],
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
