#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#set heading(numbering: "1.1")
#set page(numbering: "1")

#let solid_pattern(name: str, p: content, s: content) = [== #name] + [*Problema*: ] + p + [\ *Soluzione*: ] + s
// bold unordered list
#let bul(i, c) = [- *#i*: #c\;]
#let dp(i, c) = [*#i*: #c]
#let arr = $->$

#align(outline(depth: 1, title: [Ingegneria Software]), center)

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
- Unit #arr classe/metodo: poco costosi sia da scrivere che da eseguire
- Integrazione #arr gruppo di moduli
- End to end #arr intero sistema: si manda in esecuzione l'intera applicazione. Non sempre sono automatizzabili

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

== Pattern Strutturali
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
  [Facade (GoF)],
  [Si usa quando è necessaria un'interfaccia comune e unificata verso un insieme disparato di implementazioni o interfacce all'interno di un sottosistema. Il problema sorge quando c'è un accoppiamento indesiderato verso molti elementi interni del sottosistema, o quando l'implementazione del sottosistema è suscettibile al cambiamento. Con Facade si ha un unico punto di contatto verso il sottosistema. Fornisce protected variations rispetto ai cambiamenti nell'implementazione di un sottosistema e supporta low coupling tramite un oggetto Indirection #footnote([Indirection: introduzione di un livello intermedio tra due entità, con lo scopo di disaccoppiarle, aumentare la flessibilità, o ritardare una decisione di binding.]). Le facade sono accessibili tramite Singleton. Un Adapter che nasconde un sistema esterno può anche essere considerato una forma di Facade],
)

#dp(
  [Proxy],
  [Permette di intercettare e controllare l'accesso ad un oggetto per indirizzare problemi ortogonali #footnote([I problemi ortogonali sono problemi significativi che non fanno parte del dominio del problema.]). Il proxy fornisce il sostituto o un segnaposto per un altro oggetto per controllare l'accesso ad esso, aggiungendo un livello di indirection. Fornisce protected variations e low coupling.],
)

#dp(
  [Decorator (GoF)],
  [Si usa per aggiungere responsabilità ad un oggetto interno tramite incapsulamento. I decorator forniscono una flessibilità maggiore rispetto all'ereditarietà perché possono essere combinati. Un Decorator interpone un servizio sull'oggetto incapsulato.],
)

#dp(
  [Adapter (GoF)],
  [Permette a classi con interfacce incompatibili (parametri o tipi diversi) di collaborare tra loro, a differenza di Proxy dove l'intermediario ha la stessa interfaccia. Adapter coinvolge quattro componenti principali:
    - Target: l'interfaccia attesa dal client.
    - Client: utilizza l'interfaccia Target.
    - Adaptee: la classe esistente con un'interfaccia incompatibile.
    - Adapter: adatta l'interfaccia di Adaptee a quella di Target.
  ],
)

#dp(
  [Bridge],
  [Si usa per separare un'astrazione dalla sua implementazione affinché le due possano variare indipendentemente. Ha la struttura uguale all'Adapter, ma quello che cambia è l'intento. Con questo pattern si rompe la gerarchia nel quale è il client a decidere. Adapter serve a far funzionare le cose dopo che sono state disegnate, mentre Bridge viene pensato prima ancora della creazione del modulo di basso livello.],
)

#dp(
  [Composite],
  [Si compongono gerarchie parte-tutto in strutture ad albero. Composite permette di trattare oggetti singoli e composizioni di oggetti in modo uniforme. Gli elementi dell'albero hanno due ruoli distinti: ruolo intermedio che rimanda ad altri elementi e ruolo terminale.],
)

#dp(
  [Flyweight],
  [Si riduce l'uso di memoria condividendo quanti più dati possibili tra oggetti simili. Ha metodi per accedere allo stato condiviso. Il client non sa come è fatto l'oggetto, sa solo che può essere condiviso.],
)


== Pattern Creazionali

=== `new` è pericoloso
Ogni volta che si crea una classe concreta con new `new` si crea una dipendenza di cattiva qualità che viola DIP: se cambia il costruttore della classe concreta bisogna cambiare ogni occorrenza di `new` di quella classe.

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
  [Singleton],
  [Garantisce che una classe abbia una sola istanza, fornendo un punto di accesso globale ad essa. Sono un tipo di _code smell_. In genere sono Singleton Factory, Logger, Classi di configurazione e accesso alle risorse. Si usa il Singleton solo quando l'unicità è parte del dominio stesso, non solo dell'implementazione.],
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

#dp(
  [Principio Holliwoodiano],
  [Si incoraggia a scrivere codice che non dipende da implementazioni specifiche, ma piuttosto da interfacce o astrazioni. Un componente di basso livello non controlla il flusso, ma è invitato a collaborare da un componente di livello superiore solo quando serve. Questo principio è spesso associato all'Inversione di Controllo #footnote([Sarà B ad attivare un comportamento di A, e non A ad attivarsi da sola.])],
)

#dp(
  [Null Object],
  [Si usa per specificare che un parametro non è inizializzato. Si ritorna un oggetto convenzionale al posto di `null` per far capire che l'oggetto non è istanziato. Il vantaggio di usare questa istanza convenzionale è che si può specificare questo oggetto implementando delle funzionalità di default per vari metodi.],
)

#dp(
  [Dependency Injection (DI)],
  [Si forniscono le dipendenze ad un oggetto dall'esterno piuttosto che crearle internamente (basato su IoC). Si riduce il coupling, facilitando il testing#footnote([Si elimina la dipendenza da `new` e Factory.]) e la modularità. Si fa injection, ovvero si passano gli oggetti come argomenti di costruttore, metodi setter, interfacce o un metodo specifico.],
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
