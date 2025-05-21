#set heading(numbering: "1.1")
#set math.equation(numbering: "(1)", supplement: [Eq.])

= Concorrenza e decisioni sequenziali
Stackleberg simile a Cournot: entrambe scelgono le quantità, ma in modo sequenziale. \
1 agisce per prima ed effettua la sua scelta tenendo conto della risposta di 2 alla sua scelta di $q_1$.
$ q_2^* =((A-c)) / (2B)-q_1 / 2 $ <risposta>

@risposta descrive quello che farà l'impresa 2 in risposta a ciascuna scelta di $q_1$ che l'impresa 1 potrebbe effettuare.

$ Pi_1[q_1,q_2^*(q_1)]=((A-c) / 2-B / 2q_1)q_1 $ <profitti>

@profitti afferma che la domanda e i profitti dell'impresa 1 dipendono esclusivamente dalla seclta di $q_1$.

$ Q^s=(3(A-c)) / (4B) = 3 / 4 (A-c) / B $ <stackleberg>
$ Q^c=(2(A-c)) / (3B) = 2 / 3 (A-c) / B $ <cournot-nash>

@stackleberg implica un output maggiore di @cournot-nash, di conseguenza, il prezzo di equilibrio è minore nel modello di Stackleberg rispetto a quello di Cournot.

Il leader ottiene una quota di mercato molto più ampia e profitti molto maggiori rispetto al follower. L'impresa 2 ottene risultati peggiori quando è in possesso di informazioni complete (caso di stackleberg) sulla scelta di $q_1$, piuttosto di quando è a disposizione di informazioni incomplete (caso di Cournot).

Se leader e follower competono sui prezzi invece che sulla quantità, ciascuna produce un bene identico allo stesso costo marginale $c$, e i consumatori acquistano da chi pratica il prezzo più basso. Se $p_1=p_2$ si smezzano il mercato.

*Hotelling con localizzazione fissa*: che sceglie per primo ha un profitto più elevato. IL vantaggio della seconda mossa è vincolato da chi è in grado di abbassare i prezzi.

- Gioco simultaneo: $pi_1=pi_2=1/2N t$
- Gioco sequenziale $pi_2=18/32N t, pi_2=25/18N t$

Le imprese hanno risultati migliori quando competono in modo sequenziale sui prezzi, piuttosto che in modo sequenziale sulle quantità: il prezzo medio è maggiore ed entrambe ottengono profitti maggiori. Nel gioco sequenziale del prezzo, l'impresa deve rimanere fedele a quel prezzo.

Un'impresa ha vantaggio su un'altra nel gioco sequenziale della quantità perché la mossa iniziale è irrevocabile fino al momento che il secondo giocatore effettua la propria.

Sia nella scelta della quantità che del prezzo, l'impegno credibile è di fondamentale importanza. Gli esiti dei giochi dinamici dipendono dalla credibilità delle strategie.

Se in un periodo vengono fatte delle minacce, prestarvi fede fa parte di un equilibrio di Nash in un periodo successivo, nel caso in cui dovesse presentarsi l'occasione per farlo.

= Prezzo limite e deterrenze all'entrata
- tattiche predatorie: buttare fuori concorrenti dal mercato
- prezzo limite: evitare l'ingresso nel mercato di nuovi concorrenti
Queste strategie sono efficaci solo se creano profitti. L'azione intrapresa genera profitto solo se provocano l'uscita dal mercato di un'impresa o dissuadono un entrante.
Queste strategie hanno portato alla creazione di leggi antitrust.

Le condotte predatorie spesso implicano delle minacce, e queste devono essere credibili.

= Comportamento predatorio
La logica del comportamento predatorio richiede almeno due periodi: il primo per estromettere o tenere fuori dal mercato il concorrente, il secondo per goderne i benefici. Entrare nel mercato deve avere dei costi fissi.

Modello successivo alla Scuola di Chicago basato sull'asimmetria informativa tra l'entrant B e l'incumbent A. B osserva il prezzo fissato da A sul mercato e in seguito decide se entrare o no.\
- $t=1$ incumbent monopolista
- $t=2$ possibile entrata
$ "entrata B" cases(
    "costo basso:" &cases(
        Pi_I^2=50,
        Pi_E^2=-20
    ),
    "costo alto:" &cases(
        Pi^I_2=20,
        Pi_2^E=20
    )
) $

= Identificazione e contrastazione della collusione
Fattori che facilitano la collusione:
+ Elevata concentrazione nell'industria per due motivi
  + $"concentrazione"arrow.t=> "tasso di sconto critico" arrow.b$
  + nei mercati reali non è facile individuare chi devia, in particolare quando ci sono molte imprese
+ Barriere all'entrata. La facilità di ingresso riduce la capacità del cartello di perseguire il suo obiettivo di massimizzazione del proftto. Inoltre aumenta la concentrazione.
+ Ordini frequenti e regolari: un'industria dove le imprese ricevono ordini rari e irregolari non è una che tende a fissare i prezzi.\ Ordini rari$arrow.t=>$tempo per punire un'impresa che devia dal cartello$arrow.t$.
+ Rapida crescita del mercato: una deviazione precoce da un mercato in crescita genera profitto a breve termine, ma si perdono i profitti derivati dalla collusione a lungo termine in un mercato in fase di crescita.
+ Simmetria nella tecnologia o nei costi: se due imprese hanno costi differenti, sarà più difficile formulare un accordo collusivo con un impresa con disponibilità diverse.
+ Concorrenza su più mercati $arrow$ guadagno collusione $arrow.t$, danno deviazione $arrow.t->$ collusione più facile.
+ Omogeneità del prodotto. Se i prodotti sono differenziati, l'accordo di cartello è più complesso.
  - Molti prezzi da controllare
  - Difficile da trovare il grado ottimale di differenziazione del prodotto
  - La punizione per chi devia è più complessa da trovare in un contesto differenziato.

Individuazione cartelli
- Spie
- Dichiarazione dell'industria
- Ridurre le pene per indurre i cartelli ad autodichiararsi
- Il primo membro di un cartello che dichiara di farne parte ha immunità, gli altri sono soggetti a pene pesanti.
In genere è difficile identificare i cartelli, il risultato collusivo può apparire come concorrenziale (teorema dell'indistinguibilità).
