# Glossario
## Stakeholder
Coloro che hanno interesse nel progetto. Includono almeno i clienti finali e coloro che lo stanno finanziando (committenti).
## Elicitazione
Estrazione di informazioni dal modello mentale dello stakeholder, tradurre il modello mentale in modello di analisi. Si elicita intervistando il committente, guardando i competitor, facendo questionari, osservando l'ambiente, simulazioni, prototipizzazione, modellistica.
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