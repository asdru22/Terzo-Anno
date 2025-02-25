# Glossario
## Stakeholder
Coloro che hanno interesse nel progetto. Includono almeno i clienti finali e coloro che lo stanno finanziando (committenti).
## Elicitazione
Estrazione di informazioni dal modello mentale dello stakeholder, tradurre il modello mentale in modello di analisi. Si elicita intervistando il committente, guardando i competitor, facendo questionari, osservando l'ambiente, simulazioni, prototipizzazione, modellistica.
# Valore
Produrre valore vuol dire interagire con un sistema software per giungere ad un obiettivo, determinato dal valore del prodotto.
# 0. Introduzione
**Software engineering**: costruzione di software multi-versione attraverso team di multi-persone.
Per affrontare un sistema complesso si usa:
## 0.1 Astrazione 
L'astrazione è il processo attraverso il quale si generalizzano delle idee in modo che siano applicabili a classi di idee. L'astrazione è utile per definire dei ragionamenti generali che non si applicano a singoli elementi, ma a classi generali.
Il processo di sviluppo del software è una sequenza di attività ad alta astrazione a bassa astrazione
- Analisi
- Design
- Costruzione (codice sorgente/asset). Il codice è un modello che specifica ogni comportamento che il sistema deve avere.

## 0.2 Modelli
I modelli sono astrazioni o rappresentazioni della realtà in maniera più semplice rispetto a quella che è effettivamente. Sono rappresentazioni in grado di fornire risposte alle domande di un sistema.
Il processo software è un raffinamento dei modelli (opposto dell'astrazioone)
- Modello mentale (*problem space*): modelli che rispondono alla domanda "cosa deve fare il sistema?". In genere è incompleto.
- Modello di analisi (*problem space*): "come deve fare il sistema?"
- Modello di design (*solution space*)
- Modello di costruzione (*solution space*): modello più dettagliato, completo e carico di informazioni.

Bisogna aggiungere informazioni a modelli astratti.
Un modello deve **rispondere a delle domande**.  
# 1. Modello di analisi
## 1.1 Obiettivi
- Capire cosa deve fare il sistema software realizzato
- Comunicare lo sviluppo al team di sviluppatori e agli azionisti
- Definire una serie di requisiti che possono essere validati dal software una volta costruito: **fornire gli strumenti di validazione**.

Qualsiasi forma di modello che consente di rispondere alle domande va bene. Il linguaggio naturale è ambiguo, va usato in maniera controllata.
## 1.2 Artefatti dei modelli di analisi
Servono per analizzare da punti di vista diversi i problemi dello sviluppo.
- Documenti delle richieste
- Glossario
- Modello dominante
- Specifiche supplementari

## 1.3 Requisiti
Servono per specificare quello che il software deve fare e i vincoli che deve rispettare. *Requirements engineering* si occupare della gestione sistematica dei requisiti. La gestione dei requisiti richiede una serie di competenze
- [[#Elicitazione]]
- Analisi
- Specificazione
- Validazione: definire i meccanismi per verificare che il sistema finito è coerente con i requisiti iniziali.

Il committente ha un modello mentale non coerente e spesso difficile da spiegare. I requisiti sono **indipendenti dall'implementazione**.
### 1.3.1 Formalizzare i requisiti
Standard ISO che indica come vanno rappresentati i requisiti e i documenti che li raccolgono:
##### 1.3.1.1 *Stakeholder requirements specification document*: StRS 
Requisiti dello stakeholder: requisiti per un sistema che possono fornire i servizi richiesti dagli utenti e altri stakeholder.
#### 1.3.1.2 *System & software requirements specification document*: SyRS/SRS
Requisiti del sistema: specificazioni da parte del fornitore delle caratteristiche, attributi e requisiti di performance del sistema affinché possa soddisfare i requisiti dello stakeholder.
### 1.3.2 Scrivere un requisito
Si usa un linguaggio il meno ambiguo possibile (linguaggio controllato). Deve essere steso con uno o più template. 
Ad esempio `[Condition] [Subject] [Action] [Object] [Constraint]` o `[Condition] [Action or Constraint] [Value]`.
#### 1.3.2.1 Caratteristiche di un requisito
Un requisito deve essere:
- non ambiguo
- coinciso
- consistente
- completo: deve specificare una funzionalità del sistema nella sua interezza
- singolare: un qualunque requisito deve essere comprensibile senza l'utilizzo degli altri
- fattibile: deve rappresentare funzionalità che si è effettivamente in grado di realizzare
- tracciabile: si devono avere meccanismi che permettono di capire da dove emergono i requisiti
- verificabile: deve essere possibile definire un meccanismo che permette di affermare che un requisito è stato rispettato

#### 1.3.2.2 Caratteristiche di un insieme di requisiti
I requisiti devono essere:
- completi
- consistenti
- convenienti: specifiche minime necessarie che garantiscono il funzionamento e le prestazioni richieste, rimanendo all'interno di un determinato budget.
- vincolati: anche se non è al momento completo, l'insieme dei requisiti sarà completato. Vincoli di budget, tecnici e temporali.

#### 1.3.2.3 Metadati dei requisiti
- Identificativo
- Priorità dello stakeholder: quali sono le funzionalità più critiche, quale requisito ha più valore agli occhi dello stakeholder
- Dipendenze
- Rischi: le funzionalità da implementare sono più o meno facili da implementare nel contesto di tempo e risorse disponibili
- Sorgente: rende il rischio tracciabile
- Razionale
- Difficoltà: quanto è difficile realizzare software che implementi il richiesto
- Tipo

##### 1.3.2.3.1 Tipi dei requisiti
- **Funzionali**: descrivono come ci aspettiamo che funzioni il sistema in relazione all'ambiente in quale opera. Lega l'azione, lo stato del sistema e la reazione. Indicano *cosa* fa il sistema.
- **Non funzionali**: proprietà misurabili/percettibili dei sistemi non direttamente collegate agli aspetti funzionali. Indicano *come* il sistema lo fa.

|                      | Funzionale                             | Non Funzionale                                                   |
| -------------------- | -------------------------------------- | ---------------------------------------------------------------- |
| **Obiettivo**        | Descrive cosa fa il prodotto           | Descrive come funziona il prodotto                               |
| **Risultato finale** | Definisce le funzionalità del prodotto | Definisce le proprietà del prodotto                              |
| **Focus**            | Si concentra sui requisiti dell'utente | Si concentra sulle aspettative dell'utente                       |
| **Origine**          | Generalmente definito dall'utente      | Generalmente definito dagli sviluppatori o altri esperti tecnici |
| **Testing**          | Prima dei test non funzionali          | Dopo i test funzionali                                           |
#### 1.3.2.4 Tassonomia FURPS+ per i requisiti
- *Functional*
- *Usability*: sforzo cognitivo di un utente per giungere ad un obiettivo
- *Reliability*
- *Performance*: tempi di attesa, uso delle risorse, accuratezza, disponibilità
- *Supportability*: mantenutibilità
- +: implementazione, interfaccia, packaging

#### 1.3.2.5 Processo di analisi dei requisiti
Lo scopo è rendere la vista basata su requisiti dello stakeholder dei servizi richiesti in una vista tecnica di un prodotto richiesto che può fornire quei servizi.
Se ci sono vincoli, vanno documentati all'interno del modello.
#### 1.3.2.6 I Requisiti vanno memorizzati
I requisiti devono essere registrati in una forma adeguata per la gestione lungo tutto il ciclo di vita del progetto e oltre. Per progetti complessi, è consigliato l'uso di uno strumento di gestione dei requisiti, che permetta di tracciare i collegamenti tra di essi per evidenziare le relazioni.
## 2. Modelli
Un modello è una rappresentazione astratta della realtà, sono usati per catturare proprietà rilevanti di un sistema. Permette di catturare astrazioni e condividere conoscenze all'interno di un progetto (modelli **prescrittivi**, non descrittivi).
I modelli possono essere espressi con linguaggi diversi da quello naturale. I linguaggi sono utilizzati per caratterizzare le entità del modello, le loro proprietà e relazioni.
## 2.1 Paradigma *Object Oriented*
Si caratterizza un sistema (software) non focalizzandosi sui singoli dati, ma cercando di definire la struttura in termine di entità autonome caratterizzate da uno stato e un comportamento. Uno stato è l'insieme di informazioni memorizzate nell'oggetto. Invocando metodi si attivano i comportamenti.
### 2.1.1 Principi *Object Oriented*
**Astrazione**: meccanismo attraverso il quale ci si focalizza sulle caratteristiche essenziali di un elemento, senza essere a conoscenza degli elementi strutturali che non ci interessano. Ci interessa solo l'interfaccia dell'oggetto, ma non come funzione internamente.
**Incapsulamento**: non ci interessa come vengono ottenute le informazioni. Sono incapsulate nel codice..
**Ereditarietà**: il comportamento e lo stato possono essere specializzati (con l'*override* di parte dei comportamenti della classe base). Si riusa un prototipo o classe esistente. L'istanza di una sottoclasse è un'istanza della superclasse. Un oggetto può essere sia impiegato che persona. Un'oggetto può appartenere a più tipi diversi (polimorfismo).
**Polimorfismo**: il comportamento degli oggetti dipende da che oggetti sono.
Il polimorfismo è legato al concetto di ereditarietà. Un oggetto può essere di due o più tipi.
## 2.2 *Object Oriented Modelling* con UML
UML è un linguaggio di modellazione, che usa un approccio object oriented sia per l'analisi che per la progettazione/design. L'analisi si concentra sull problema, la progettazione sulla soluzione.
UML è un linguaggio grafico semi-formale: gli artefatti sono grafici. Semi-formale vuol dire che ha una **sintassi e semantica ben definita** (nonostante la sua natura grafica). UML è stato soggetto a una serie di revisioni per ridurre l'ambiguità nel suo utilizzo.
Le regole sintattiche definiscono come creare diagrammi validi. Le regole semantiche indicano come creare diagrammi con significato.
### 2.2.1 I 13 Diagrammi UML
Sono divisi in 2 famiglie
- Diagrammi strutturali
- Diagrammi comportamentali
Le frecce indicano l'ereditarietà
### 2.2.2 Le primitive UML
Sono elementi uguali indipendentemente dal tipo del modello.
**Package**: raggruppano elementi e li da un namespace.
**Annotazioni**: commenti che non hanno effetto sul modello
**Relazioni**: linee che collegano due o più elementi di un modello
- Associazione
- Generalizzazione
- Dipendenza: se cambia l'oggetto sulla punta della freccia, può riflettersi sull'oggetto da dove parte la freccia.
- Realizzazione

La loro semantica cambia in base a come vengono usate.
**Elementi**: forme geometriche
**Stereotipi**: parole chiave che permettono di specializzare concetti esistenti. Permettono di estendere il vocabolario di UML per creare nuovi elementi del modello. Specificano la semantica di un elemento.
### 2.2.3 Object Constraint Language
OCL è un linguaggio dichiarativo utilizzato per specificare vincoli che si applicano a UML. Questi vincoli possono essere
- invarianti
- pre-condizioni
- post-condizioni

# 3. UML *use case* (casi d'uso)
## 3.1 Diagramma dei casi d'uso
È un diagramma comportamentale che serve per descrivere un'insieme di azioni (caso d'uso) che un certo sistema deve realizzare in collaborazione con uno o più entità esterne, chiamate attori. Ogni *use case*  dovrebbe fornire un risultato osservabile e di [[#Valore]] agli attori o ad altri stakeholder.
Ci saranno azioni che gli attori potranno operare sul sistema, e il sistema risponderà a queste azioni. I casi d'uso si limitano sempre ad interazioni osservabili.
Il concetto di caso d'uso è indipendente dal diagramma dei casi d'uso. Il diagramma non è in grado da solo di catturare tutto quello che si vuole sapere riguardo ad un caso d'uso.
## 3.2 Uso dei diagrammi dei casi d'uso [completare]
- Usati per catturare i requisiti di un sistema: alternativa a documenti di requisiti software.
-  La funzionalità offerta da un soggetto
- Requisiti che il soggetto specificato applica nel suo ambiente.

L'elemento **attore** si può rappresentare con una qualunque icona che rappresenti gli attori del sistema. L'attore è un entità esterna al sistema, che ci interagisce scambiando dati. Con gli attori si vuole catturare le classi di utenti.
Il **soggetto** è il sistema da analizzare o progettare, sul quale si applicano gli use case. Può essere un sistema fisico o software, ed è rappresentato da un rettangolo, il cui nome è in un angolo in alto. Gli attori sono al difuori di questo rettangolo.
Ogni **caso d'uso** è usato per descrivere una completa funzionalità che il sistema fornisce. Sono rappresentati con un'ellissi.
La relazioni tra gli elementi del diagramma fanno parte della sintassi UML.
Tra attori può esserci solo la relazione di **generalizzazione** (legato all'ereditarietà).
### 3.2.1 Generalizzazione
La relazione di generalizzazione serve a identificare che un elemento è più generico di un altro. Le frecce puntano verso l'elemento più generale, e si legge come "A è un B". A fa tutto quello che fa B, più qualcos'altro. 
Questa struttura è tipica della programmazione object-oriented. Al posto di fare *override* di un metodo, si fa *override* del caso d'uso.
> Non si possono riportare diagrammi che abbiano relazioni diverse da quella di generalizzazione tra attori.

### 3.2.2 Associazione
Un attore è **associato** a un caso d'uso solamente da una relazione di associazione. Quando il soggetto è tutto il sistema, viene lasciato implicito.
Questa è l'unica relazione che può esserci tra attori e casi d'uso (relazione binaria). La rappresentazione grafica è un segmento.
## 3.3 Relazioni tra casi d'uso
### 3.3.1 Generalizzazione
Il caso d'uso è una sequenza di passi di interazione che sottointendono un obiettivo.. Un attore interagisce con il sistema quando ha un obiettivo. Il caso d'uso è sempre identificato da un obiettivo. 
![[Pasted image 20250224124551.png]]
I nomi dei casi d'uso vengono definiti in base al loro obiettivo.
La specializzazione (operazione inversa della generalizzazione) sono operazioni che hanno lo stesso obiettivo.
### 3.3.2 Estensione
Definisce un comportamento supplementare **opzionale** (e non obbligatorio come l'inclusione).
Se un caso d'uso definisce il suo comportamento con passi di interazione, estendere un caso d'uso vuol dire aggiungere passi se è soddisfatta una certa condizione. In UML deve essere il caso base ad essere disposto ad estendere il proprio comportamento, definendo ***extension points***.
La rappresentazione grafica di un estensione usa uno stereotipo *extends*.
![[Pasted image 20250224125253.png]]
L'extension point viene definito all'interno del caso d'uso.
La freccia va dal comportamento addizionale verso il comportamento che viene esteso.
### 3.3.3 Inclusione
Il comportamento addizionale avviene sempre, non c'è una condizione.
L'inclusione si usa quando:
- ci sono parti comuni a più casi d'uso.
- si vuole semplificare un caso d'uso dividendolo in più parti.

Nella rappresentazione grafica, la freccia va dal comportamento base verso il caso d'uso incluso.
![[Pasted image 20250224125810.png]]
### 3.4 Come identificare i casi d'uso
- rappresentano la più piccola unità di attività che produce risultati tangibili
- sono definiti da obiettivi raggiungibili in una sessione d'uso, **immediatamente perseguibili**
- hanno al massimo una dozzina di passi
- quando un caso d'uso ha più attori con più obiettivi (ad esempio bisogna aspettare la reazione di un altro attore/utente), deve essere modellato con più casi d'uso. I casi d'uso non possono restare in attesa per un tempo indefinito. Il tempo può essere un attore.

Possono esserci dei comportamenti del sistema che il caso d'uso non è in grado di catturare. Per i processi automatizzati si usa il tempo come attore, rappresentato da una clessidra. Non ci interessa come gli attori agiscono al difuori del sistema.
## 3.5 Modello dei casi d'uso
Il diagramma UML degli use case non è un modello degli use case. Il diagramma è un riassunto.
I casi d'uso cominciano con l'attore che interagisce per primo. Non è mai il sistema che fa qualcosa per primo.
Le **pre-condizioni** sono condizioni che devono essere vere affinché si possa realizzare il caso d'uso.
Le **post-condizioni** sono i cambiamenti allo stato del sistema dopo che il caso d'uso è concluso.
## 3.6 Notazioni più semplici per i casi d'uso
- Id
- Attori
- Pre-condizioni
- Sequenza principale
- Sequenze alternative
- Post-condizioni

## 3.7 Scenari
Uno scenario è un esempio possibile del caso d'uso, un possibile modo in cui il caso d'uso ha luogo. Sono **istanze** dei casi d'uso. Si può verificare la correttezza dei casi d'uso generando dei test di accettazione.
Un modello è soggetto a più raffinamenti iterativi.
- Stabilire l'obiettivo
- Capire la struttura
- Completare la prima storia
- Completare un numero sufficiente di storie
- Completare tutte le storie

## 3.8 Esercizio
> A blog is a web application presenting a collection of date-tagged messages (posts) on miscellaneous topics. Messages are posted by the blog owner who puts them online. The author can associate messages to one or more categories (expressed using keywords). 
> Blog’s visitors can comment messages; the comments, if approved by a moderator (usually the blog’s owner), appear in a specific section under the original message.

1. Fare il diagramma UML
	1. Definire il sistema
	2. Identificare gli attori (blog owner, visitor, author, moderator). Eventuali attori omessi non possono essere "immaginati", si contatta il committente. Lo stesso fare per ambiguità: blog owner e author sono la stessa categoria di utente.
	3. Riscrivere il documento di specifica in base alle informazioni che emergono.
	4. Identificare i casi d'uso: si guardano gli obiettivi degli attori. Contattare il committente per risolvere eventuali ambiguità (il visitatore si deve autenticare per diventare autore). 
2. Usare un template per descrivere un use case (esempio commento)
	- ID: UC3
	- Actors: Visitor
	- Precondizione: il visitatore si trova nella pagina di visualizzazione del messaggio.
	- Postcondizione: il messaggio è aggiunto alla lista di moderazione
	- Sequenza principale
		1. il visitatore seleziona l'opzione per inserire il commento (interazione osservabile)
		2. sistema mostra area per inserire il commento
		3. visitatore inserisce commento
		4. il sistema mostra messaggio di successo
	- Sequenze alternative: in questo caso non ci sono