#let close(arg) = $arg^+_F$
#let impl = $tack.r.double$

/ Prima Forma Normale: Uno schema è in prima forma normale se tutti i domini degli attributi contengono solo valori atomici, ovvero non possono essere ulteriormente divisi. Ogni cella della tabella deve contenere un solo valore, non una lista, un array, un insieme, o un campo strutturato.

/ Dipendenza Parziale: Dato uno schema $R(X)$ con chiave primaria $K$, una dipendenza $A-> B$ è parziale se $A subset K and B in.not K $.

/ Seconda Forma Normale: Una relazione è in seconda forma normale quando ogni attributo non chiave dipende dall'intera chiave primaria, e non solo da una parte di essa. Uno schema $R(X)$ è in 2FN se è in 1FN e non esistono dipendenze funzionali parziali. \ Se gli attributi sono $(underline(A),B,underline(C),D)$, e si ha una dipendenze funzionale $A->B$, lo schema non è in 2FN.

/ Dipendenza Funzionale: In una relazione $r$ su uno schema $R(X)$, un insieme di attributi $Y$ determina#footnote[Identifica in maniera univoca] un altro insieme di attributi $Z$, e si indica $ Y->Z $ Le righe che hanno gli stessi valori di $Y$ devono avere anche gli stessi valori di $Z$.
/ Forma normale di Boyce-Codd: Uno schema $R(X)$ è in forma normale di Boyce-Codd se per ogni dipendenza funzionale non banale $Y->Z$ valida nello schema, $Y$ è una superchiave dello schema.\ Una tabella è in Forma Normale di Boyce-Codd se tutte le dipendenze funzionali che esistono partono da una superchiave. $ forall X -> Y, X equiv "superchiave" => R(X) in "FNBC"$

/ Terza Forma Normale: Una tabella $r$ su uno schema $R(X)$ è in terza forma normale se per ogni dipendenza funzionale non banale $X->A$ valida nello schema, è soddisfatta almeno una delle seguenti condizioni:
  - $X$ è una superchiave dello schema;
  - $A$ appartiene ad almeno una chiave $K$ di $r$.
  In 3NF si ammettono dipendenze funzionali anche da attributi che non sono superchiavi, purché il valore dipendente (quello a destra) faccia parte di una chiave. $forall X->Y, X equiv "superchiave" or Y subset.eq K => R(X) in "3FN" $

/ Implicazione Funzionale: Sia $F$ un insieme di dipendenze funzionali, e $f:X->Y$ una dipendenza funzionale, si dice che $F$ implica $f$ $(F impl f)$ se ogni relazione che soddisfa tutte le dipendenze in $F$, soddisfa anche $f$, ovvero $f$ segue logicamente da $F$.\ Supponiamo $F={A->B,B->C}$. $F impl f= A->C$? Sì, perché per ogni tabella che rispetta $A->B$ e $B->C$ si può concludere che anche $A->C$ vale per transitività.

/ Chiusura di una Dipendenza Funzionale: Dato uno schema $R(U)$, con un insieme di dipendenze $F$, sia $X$ un insieme di attributi contenuti in $U$. Si definisce chiusura di $X$ rispetto ad $F$ $(close(X))$ l'insieme degli attributi che dipendono funzionalmente da $X$: $ ={A|A in U and F impl X->A } $ La chiusura è l'insieme di tutti gli attributi che sono determinati funzionalmente da $X$, usando le dipendenze in $F$.

/ Algoritmo per Calcolare la Chiusura $close(X)$: #smallcaps[input]: $X$: insieme di attributi, $F$: insieme di dipendenze funzionali. #smallcaps[output]: $close(X)$: l'insieme di tutti gli attributi determinati da $X$ tramite le dipendenze in $F$. #smallcaps[passaggi]:
  + Inizializza La chiusura: $close(X)<-X$;
  + Itera su tutte le dipendenze funzionali $Y->A$ in F:
    Se l'insieme $Y$ è contenuto in $close(X)$ e se $A$ non è ancora in $close(X)$, allora $close(X)<-close(X) union{A}$;
  + Ripeti il punto 2 finché non si riesce più ad aggiungere nuovi attributi in $close(X)$.

/ Insieme di Dipendenze Funzionali Equivalenti: Dati due insiemi di dipendenze funzionali $F_1$ e $F_2$, essi si dicono equivalenti se $F_1$ implica ciascuna dipendenza funzionale di $F_2$ e viceversa. In altre parole, ogni dipendenza in $F_2$ può essere dedotta da $F_1$, e ogni dipendenza in $F_1$ può essere dedotta da $F_2$.

/ Insieme di Dipendenze Funzionali non Ridondanti: Un insieme di dipendenze funzionali $F$ è non ridondante se:
  - Ogni dipendenza in $F$ è necessaria;
  - Nessuna dipendenza può essere dedotta dalle altre;
  - Se si rimuove una qualsiasi dipendenza $f$ da $F$, allora non è più possibile dedurla da quelle rimaste. $ exists.not f in F| F-{f} impl f $ Se esiste una dipendenza $f$ in $F$ che può essere dedotta anche senza di lei, cioè da $F-{f}$, allora $F$ è un insieme ridondante.

/ Insieme di Dipendenze Ridotte: Un insieme di dipendenze funzionali $F$ su uno schema $R(U)$ si dice ridotto se soddisfa due condizioni:
  + Non è ridondante: $forall f in F, F-{f} tack.r.double.not f$;
  + I lati sinistri sono minimali: $forall X->A in F$, nessun attributo di $X$ è superfluo.
