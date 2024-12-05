# Alberi di decisione
1. Selezionare l'affermazione corretta sugli alberi di decisione:
- Possono essere utilizzati solo con features discrete
+ Possono esprimere qualunque funzione di classificazione
- Non presentano problemi di overfitting
- Il costo computazionale della produzione è piuttosto elevato

2. Selezionare la sentenza erronea riguardo gli alberi di decisione
+ Possono essere utilizzati solo con features discrete
- Il costo computazionale è molto basso
- Hanno una forte tendenza all'overfitting
- Possono esprimere qualunque funzione di classificazione

3. Nel caso di un albero di decisione con features discrete, cosa si può dire della profondità dell'albero?
+ È minore o uguale al numero delle features
- Non si può dire nulla
- È minore o uguale al numero delle classe
- È sicuramente maggiore del logaritmo in base due del numero dei dati

# Random forest
1. Selezionare la sentenza errata relativa alle random forest (foreste di alberi decisionali)
- Richiedono tecniche opportune per la creazione di alberi di decisione diversi relativi ad uno stesso dataset
+ Tendono a migliorare l'explainability (spiegabilità) degli alberi di decisione riducendo l'instabilità nella selezione degli attributi
- Tentano di mitigare il fenomeno dell'overfitting tipico degli alberi di decisione
- È una tecnica di apprendimento ad "ensemble" basata su una combinazione di alberi di decisione

# AlexNet
1. AlexNet, la prima rete convoluzionale profonda vincitrice della ImageNet competition è stata realizzata in quale anno:
+ 2012
- 1993
- 1971
- 2019

# Apprendimento supervisionato
1. Selezionare la sentenza errata riguardo all'apprendimento supervisionato
+ Richiede la costante supervisione di un esperto durante il training
- Può comprendere sia problemi di regressione che di classificazione
- Si riferisce all'apprendimento di funzioni basato su esempi di training composti da coppie di input-output
- La definizione della ground truth può richiedere l'intervento umano ed essere onerosa

2. Che cosa si intende con apprendimento supervisionato?
- Apprendimento sotto la supervisione diretta di un esperto
- Apprendimento che tende ad imitare il comportamento di un esperto
- Apprendimento che non fa uso di tecniche statistiche o probabilistiche
+ Apprendimento di funzioni basato su esempi di training composti da coppie input-output

3. In che situazioni si parla di apprendimento auto-supervisionato? (self supervised)
- Quando il modello è in grado di configurare in modo automatico la propria architettura
- Quando il modello è supposto contribuire alla creazione di nuovi dati di training
+ Qualora i dati di input possano essere considerati come annotazioni (labels) per guidare l'apprendimento, come nel caso degli autoencoders
- Quando l'apprendimento prevede una sinergia tra l'uomo e la macchina

# Autoencoders
1. Quale delle seguenti sentenze relative agli autoencoders è scorretta?
+ Gli autoencoders richiedono l'uso di livelli densi
- Possono essere utilizzate per la rimozione di rumore (denoising)
- L'encoder e il decoder non devono essere necessariamente simmetrici
- La rappresentazione interne prodotta dall'encoder abitualmente ha una dimensione ridotta rispetto a quella di partenza

2. Quale delle seguenti sentenze relative agli autoencoders è corretta?
- Gli autoencoders richiedono l'uso di livelli densi
- L'encoder e il decoder devono essere strettamente simmetrici
+ La rappresentazione interna prodotta abitualmente ha una dimensione ridotta rispetto a quella di partenza
- È una rete neurale che codifica se stessa

3. Quale delle seguenti non è una applicazione tipica degli autoencoders?
+ Segmentazione di immagini (semantic segmentation)
- Rimozione del rumore (denoising)
- Riduzione delle dimensioni (dimensionality reduction)
- Rilevamento di anomalie ( anomaly detection)

# backpropagation per reti neurali
1. Selezionare la sentenza scorretta relativa alla backpropagation per reti neurali
- Richiede la memorizzazione delle attivazioni di tutti i neuroni della rete durante la forward pass
- Ha un costo computazionale paragonabile a quello del calcolo "in avanti" (inference) lungo la rete
+ Si basa tipicamente su algoritmi di tipo generico
- Tipicamente, si effettua solo durante la fase di "training" della rete

2. Quale delle seguenti affermazioni relative alla backpropagation è corretta?
+ Si effettua solo durante il "training"
- Viene fatta sia durante la fase di "inference" (calcolo in avanti) che in quella di "training"
- È molto più costosa, in termini di tempo, del calcolo in avanti lungo la rete
- Viene effettuata unicamente lungo le skip connections delle reti residuali, per evitare perdita del gradiente

3. Selezionare la sentenza scorretta relativa alla backpropagation per reti neurali
- È l'algoritmo per il calcolo della derivata parziale della loss rispetto a ogni parametro della rete
+ Tipicamente, il gradiente viene artificialmente rinforzato ad ogni layer attraversato per contrastare il fenomeno della sua scomparsa (vanishing)
- Si riduce a semplici calcoli algebrici facilmente parallelizzabili in strutture di calcolo tipo GPU
- L'algoritmo calcola il gradiente un layer alla volta, sfruttando la regola matematica per la derivazione di funzioni composte

# Learning rate
1. Selezionare la sentenza errata relativa al learning rate
+ È una metrica che misura la capacità di apprendimento del modello
- Un learning rate alto tipicamente velocizza il training ma potrebbe saltare sopra al minimo
- È un iper-parametro che definisce la lunghezza del passo durante la discesa del gradiente
- Il learning rate può variare durante il training

# Campo recettivo (receptive field) di un neurone di una CNN
1. Selezionare la sentenza scorretta relativa al campo ricettivo di un neurone di una CNN:
- Definisce la porzione dell'input che influenza l'attivazione di un determinato neurone
- Dipende dalla profondità del layer in cui si trova il neurone e dalle dimensioni e gli striders dei kernel dei layers precedenti
+ È sempre almeno pari alla dimensione spaziale del dato di input
- Aumenta rapidamente con l'attraversamento di livelli con downsampling

2. Il campo ricettivo (receptive field) di un neurone di una CNN dipende da:
+ La profondità del layer in cui si trova il neurone e le dimensioni e gli striders dei kernel dei layers precedenti
- La profondità del layer in cui si trova il neurone e le dimensioni dei kernel dei layers precedenti, ma non dai loro striders
- La dimensione del kernel e il numero dei canali del layer in cui si trova il neurone
- Unicamente dalla profondità del layer a cui si trova il neurone

3. Componendo due layer Conv2D con stride 1, il primo con kernel 5x5 e il secondo con kernel 3x3 quale sarà il campo ricettivo dei neuroni finali?
+ 7
- 8
- Dipende dal padding
- 3

# classificazione lineare
1. In quale di questi casi una tecnica di classificazione lineare potrebbe non fornire risultati soddisfacenti?
- Quando le features sono indipendenti tra loro, data la classe
- Quando non tutte le features di input sono rilevanti ai fini della classificazione
+ Quando la classificazione dipende da un confronto tra features
- Quando esiste una elevata correlazione tra le features

# Dadi / monete / probabilità
1. Ci sono due dadi, uno normale e uno truccato che restituisce 6 con probabilità 0.5 e gli altri valori con probabilità 0.1. Faccio tre lanci con lo stesso dado e osservo un 3, un 6 e un 2, cosa posso concludere?
- La probabilità di usare uno o l'altro dei dadi è esattamente la stessa
- Nulla
- È più probabile che il dado sia normale
+ È più probabile che il dado sia truccato

2. Ci sono due dadi, uno normale e uno truccato che restituisce 6 con probabilità 0.5 e gli altri valori con probabilità 0.1. Faccio tre lanci con lo stesso dado e osservo un 3 e un 6 cosa posso concludere?
- La probabilità di usare uno o l'altro dei dadi è esattamente la stessa
- Nulla
- È più probabile che il dado sia normale
+ È più probabile che il dado sia truccato

3. Ci sono due monete, una normale e una che restituisce testa con probabilità ¾ e croce con probabilità ¼. Faccio due lanci con la stessa moneta e osservo una testa e una croce. Che cosa posso concludere?
- Nulla
+ È più probabile che la moneta sia normale
- È più probabile che la moneta sia truccata
- La probabilità di usare uno o l'altra moneta è esattamente la stessa

# dataset / recall del modello
1. Un dataset contiene 1/3 di positivi e 2/3 di negativi. La recall del modello è di 2/3. Che percentuale dei dati sono i falsi positivi?
- 2/9
- 1/9
- 1/3
+ Non può essere stabilito

2. Un dataset contiene 1/3 di positivi e 2/3 di negativi. La recall del modello è di 2/3. Che percentuale dei dati sono i falsi negativi?
- 2/9
+ 1/9
- 1/3
- Non può essere stabilito

3. Un dataset contiene 2/3 di positivi e 1/3 di negativi. La precisione del modello è 9/10. Che percentuale dei dati totali sono falsi positivi?
- 1/9
+ Non può essere stabilito
- 2/27
- 1/10

# Deep features
1. Cosa si intende con "deep" features?
+ Features sintetizzate in modo automatico a partire da altre features
- Features ottenute mediante utilizzo di sensori ottici di profondità
- Features relative a dati in 2 o più dimensioni
- Features soggette a una approfondita supervisione da parte umana

# Distribuzione congiunta di probabilità
1. Selezionare la sentenza corretta relativa alla distribuzione congiunta di probabilità
- Non permette il calcolo di eventi condizionali
- Non permette di fare nessun tipo di predizione
- Non consente una visione distinta delle singole features
+ Il suo calcolo presenta problemi di scalabilità all'aumentare delle features

2. Selezionare la sentenza errata relativa alla distribuzione congiunta di probabilità per N variabili aleatorie discrete
- È la distribuzione di probabilità di tutte le possibili tuple di valori per le variabili
+ Richiede il calcolo di un numero esponenziale di parametri
+ Non permette il calcolo di probabilità condizionali tra le features
- Consente il calcolo delle probabilità marginali delle singole features

# Probabilità condizionata
1. Selezionare le sentenza corretta relativa alla probabilità condizionata P(A|B) tra due eventi A e B
+ P(A|B) è sicuramente maggiore o uguale di P(A and B)
- P(A|B) è sicuramente maggiore o uguale di P(A)
- P(A|B) è sicuramente minore o uguale di P(A and B)
- P(A|B) è sicuramente minore o uguale a P(A) 

# entropia / crossentropy
1. Se un modello calcola una distribuzione di probabilità, aggiungere alla funzione obiettivo una componente tesa a diminuire l'entropia avrà l'effetto di:
- Nessun effetto concreto
+ Focalizzare le scelte sui casi più probabili
- Ridistribuire le probabilità in bodo più bilanciato tra tutti i casi
- Favorire l'uscita da minimi locali

2. Se un modello calcola una distribuzione di probabilità, aggiungere alla funzione obiettivo una componente tesa ad aumentare l'entropia avrà l'effetto di:
- Nessun effetto concreto
- Focalizzare le scelte sui casi più probabili
+ Ridistribuire le probabilità in bodo più bilanciato tra tutti i casi
- Favorire l'uscita da minimi locali

3. Selezionare la sentenza corretta relativa alla crossentropy H(P,Q) tra P e Q
+ È uguale alla divergenza di kullback-Leibler KL(P,Q) più l'entropia H(P) di P
- Misura la logilikelihood di P data la distribuzione di Q
- Ha un valore massimo quando P=Q
- È una funzione simmetrica H(P,Q)=H(Q,P)

4. Selezionare la sentenza erronea relativa alla crossentropy H(P,Q) tra P e Q
- È uguale alla divergenza di kullback-Leibler KL(P,Q) più l'entropia H(P) di P
- Misura la logilikelihood di Q data la distribuzione di P
- Ha un valore minimo quando P=Q
+ È una funzione simmetrica H(P,Q)=H(Q,P)

5. Selezionare la sentenza errata relativa all'entropia per la distribuzione di probabilità di una variabile aleatoria discreta 
- Il suo valore è minimo (e uguale a 0) quando la probabilità è tutta concentrata in una classe
- Il range del suo valore è tra 0 e log n dove n sono i possibili valori di X
- È una misura del grado di disordine della variabile aleatoria
+ Il suo valore è minimo (e uguale a 0) quando la probabilità è equamente distribuita tra tutte le classi

6. Il range dell'entropia per la distribuzione di probabilità di una variabile aleatoria discreta è
- Tra 0 e 1
+ Tra 0 e log n dove n sono i possibili valori di x
- Tra 0 e infinito
- Tra -1 e 1

7. Una variabile aleatoria discreta con valori a,b e c ha la seguente distribuzione di probabilità: P(a)=1/4, P(b)=1/2, P(c)=1/4. Qual è la sua entropia?
+ 3/2
- Log(3)
- 4/5
- 5/4

8. Siano date le seguenti distribuzioni di probabilità P e Q: P(0)=3/8, P(1)=1/2, P(2)=1/8 and Q(0)=1/2, Q(1)=1/4, Q(2)=1/4. Quanto vale la crossentropy H(P|Q) tra P e Q?
+ 13/8
- 3/2+log(3)
- 5/2-log(3)/2
- 2

# Funzione logistica
1. Selezionare la sentenza errata relativa alla derivata della funzione logistica
+ È una funzione monotona
- Tende a 0 quando x tende a -inf
- Ha il suo massimo in corrispondenza dello 0
+ È una funzione simmetrica

2. La derivata della funzione logistica δ(x) è
- δ(x)/ δ(1-x)
+ δ(x) * (1 – δ(x))
- δ(x) / (1 – δ(x))
- δ(x) * δ(1-x)

# funzione loss in rete neurale
1. Quale funzione di loss è tipicamente utilizzata in una rete neurale per classificazione binaria che utilizza una sigmoid come attivazione finale?
- Categorical crossentropy
- Absolute error
+ Binary crossentropy
- Mean squared error

2. Quale funzione di loss è tipicamente utilizzata in una rete neurale per classificazione a categorie multiple che utilizza softmax come attivazione finale?
- Binary crossentropy
+ Categorical crossentropy
- Absolute error
- Mean squared error

# GAN
1. Selezionare la sentenza corretta:
- Una GAN è una rete che permette di generare attacchi per un qualunque modello predittivo
- Le GAN hanno una struttura encoder-decoder simile a quella di un autoencoder
+ Le GAN possono soffrire del fenomeno di "mode collapse" cioè la tendenza a focalizzare la generazione su un unico o pochi esempi
- Le GAN basano il loro training su una funzione di logilikelihood relativa ai dati generali

# layer convolutivo 2D
1. Il tensore di input di un layer convolutivo 2D ha dimensione (16,16,32). Sintetizzo 8 kernel con dimensione spaziale (3,3), stride 2, nessun padding (valid mode). Quale sarà la dimensione dell'output?
- (7,7,15)
- (8,8,8)
+ (7,7,8)
- (8,8,32)

2. Il tensore di input di un layer convolutivo 2D ha dimensione (32,32,8). Sintetizzo un unico kernel con dimensione spaziale (4,4), stride 2, nessun padding (valid mode). Quale sarà la dimensione dell'output?
- (16,16,1)
- (16,16,8)
- (15,15,8)
+ (15,15,1)

3. Il tensore di input di un layer convolutivo 2D ha dimensione (16,16,8). Sintetizzo 4 kernel con dimensione spaziale (5,5), stride 2, nessun padding (valid mode). Quale sarà la dimensione dell'output?
+ (6,6,4)
- (8,8,8)
- (7,7,4)
- (7,7,8)

4. Un layer convolutivo 2D con stride 1, kernel size 3x3, e senza padding prende in input un layer con dimensioni (32,32,3) e restituisce un layer di dimensione (32,32,16). Quanti sono i suoi parametri?
- 160
- 28
- 432
+ 448

5. Il numero dei parametri di un layer convolutivo dipende da:
- Unicamente dalle dimensioni dei layer di input e di output
- Lo stride dei kernel e di tutte le dimensioni di input e output, compresi i canali
+ La dimensione spaziale dei kernel e il numero dei canali di input e output
- Lo stride dei kernel e le dimensioni spaziali di input e output

6. Un layer convolutivo 2D con stride 1, kernel size 1x1, e senza padding prende in input un layer con dimensioni (32,32,16) e restituisce un layer di dimensione (32,32,4). Quanti sono i suoi parametri?
- 2
+ 68
- 8
- 64

# Long-short term memory models (LSTMs)
1. Selezionare la sentenza scorretta relativa ai Long-Short Term Memory Models (LSTMs):
- Utilizzano delle particolari porte (gates) per gestire l'evoluzione della cella di memoria durante l'elaborazione di una sequenza di dati
- Sono una particolare tipologia di Rete Ricorrente
- Sono prevalentemente utilizzati per l'elaborazione di sequenze di dati
+ Sono prevalentemente utilizzati per la segmentazione di immagini mediche

2. I long-short term memory models (LSTMs) sono modelli utilizzati prevalentemente per:
- Segmentazione per immagini mediche
+ Elaborazione di sequenze di dati
- Predirre traiettorie per agenti a guida autonoma
- Elaborazione di immagini

# MaxPooling (derivata)
1. Qual è la derivata della funzione di MaxPooling?
- L'identità
- Non è una funzione derivabile
+ 1 in corrispondenza del massimo e 0 altrove
- 1 ovunque

# Minibatch
1. Qual è l'effetto tipico dell'aumento della dimensione del minibatch durante il training?
- La backpropagation è effettuata più frequentemente e l'aggiornamento dei parametri è più accurato
- La backpropagation è effettuata più frequentemente ma l'aggiornamento dei parametri è meno accurato
- La backpropagation è effettuata meno frequentemente e l'aggiornamento dei parametri è meno accurato
+ La backpropagation è effettuata meno frequentemente ma l'aggiornamento dei parametri è più accurato

2. Qual è l'effetto tipico della riduzione della dimensione del minibatch durante il training?
- La backpropagation è effettuata più frequentemente e l'aggiornamento dei parametri è più accurato
+ La backpropagation è effettuata più frequentemente ma l'aggiornamento dei parametri è meno accurato
- La backpropagation è effettuata meno frequentemente e l'aggiornamento dei parametri è meno accurato
- La backpropagation è effettuata meno frequentemente ma l'aggiornamento dei parametri è più accurato

# modelli generativi
1. Selezionare la sentenza scorretta riguardo i modelli generativi
- Un tipico esempio di tecnica generativa è Naive Bayes
- Sono modelli che cercano di apprendere la distribuzione di probabilità dei dati
- Generative adversarial networks, variational autoencoders e diffusion models sono esempi di tecniche generative profonde
+ Sono modelli meta-teorici rivolti alla automatizzazione della generazione di reti neurali

2. Con modelli generativi si intende:
- Il processo di automatizzazione della generazione di reti neurali
+ Modelli che cercano di apprendere la distribuzione di probabilità dei dati
- L'uso di attacchi avversariali allo scopo di aumentare la robustezza di modelli
- L'applicazione di tecniche genetiche al deep learning

# mutua informazione (information gain)
1. Selezionare la risposta scorretta relativa alla mutua informazione I(X,Y) tra due variabili aleatorie X e Y (anche detta Information Gain nel contesto degli alberi di decisione)
- È una funzione simmetrica I(X,Y)=I(Y,X)
+ Coincide con l'entropia H(Y|X) di Y dato X
- Può essere utilizzata per guidare la selezione degli attributi durante la costituzione di un albero di decisione
- Misura il guadagno di informazione su Y dopo aver osservato X

# Naive Bayes
1. Selezionare la sentenza errata relativa alla tecnica Naive Bayes
- È una tecnica di tipo generativo in quanto cerca di determinare la distribuzione delle varie categorie dei dati
- Deriva dall'ipotesi teorica semplificativa che le features sono indipendenti tra loro, date le classi
+ Non può essere utilizzata se le features non sono tra loro indipendenti, date le classi
- Fornisce un modo computazionalmente efficiente per approssimare la distribuzione congiunta di probabilità delle features

2. Perché la tecnica Naive Bayes è detta "Naive" (ingenua)?
+ Perché suppone ingenuamente che le features siano indipendenti tra loro, date le classi
- Perché suppone ingenuamente che i dati di training rispecchino i dati reali
- Perché fornisce un modo semplice ma preciso di calcolare la distribuzione congiunta di probabilità delle features
- Perché suppone ingenuamente che la teoria possa avere applicazioni pratiche

3. Avendo 5 categorie di dati e 3 features di input booleane, quanti parametri indipendenti devono essere stimati secondo la tecnica Naive Bayes (compresi i priors)
- 15
- 16
+ 19
- 20

# neuroni artificiali
1. Selezionare la sentenza scorretta relativa ai neuroni artificiali
- Un neurone artificiale tipicamente calcola una combinazione lineare dei suoi input, seguita dalla applicazione di una funzione di attivazione non lineare
- Il numero dei parametri di un neurone artificiale è lineare nel numero dei suoi input
- Un neurone artificiale definisce un semplice modello matematico che simula il neurone biologico
+ Un neurone artificiale può apprendere qualunque funzione dei suoi input

2. Selezionare la sentenza corretta
- Il numero dei parametri di un neurone artificiale è quadratico nella dimensione dei suoi input
+ Un neurone artificiale tipicamente calcola una combinazione lineare dei suoi input, seguita dalla applicazione di una funzione di attivazione non lineare
- Un neurone artificiale può apprendere qualunque funzione dei suoi input
- Un neurone artificiale può apprendere solo funzioni lineari

# Overfitting
1. Quale delle seguenti tecniche non può essere utilizzata per contrastare l'overfitting?
- Early stopping
- Data augmentation
- Introduzione di dropout layers
+ Aggiunta di skip connections

2. Quale delle seguenti situazioni non è particolarmente problematica dal punto di vista dell'overfitting?
- Avere pochi dati di training
+ Avere dati molto rumorosi
- Disporre di un modello molto espressivo
- Effettuare un training molto prolungato

# regressione logistica
1. Selezionare la sentenza scorretta riguardo alla regressione logistica
- Permette di associare una probabilità alla predizione della classe
- Il calcolo della predizione si basa sulla logilikelihood dei dati di training
- La predizione dipende dal bilanciamento dei dati di training rispetto alle classi
+ I parametri del modello possono essere tipicamente calcolati in forma chiusa, mediante una forma esplicita

2. Selezionare la sentenza errata riguardo alla regressione logistica
- Si basa su una combinazione lineare delle features in input
- La probabilità della predizione cresce se ci si allontana dalla superficie di confine tra le classi
+ Non dipende dal bilanciamento dei dati di training rispetto alle classi
- Nel caso di classificazione binaria la superficie di confine tra le classi è un iperpiano

3. In quali di questi casi la regressione logistica potrebbe essere in difficoltà?
- Quando non tutte le features di input sono rilevanti ai fini della classificazione
- Quando esiste una elevata correlazione tra le features
+ Quando la classificazione dipende da un confronto tra le features
- Quando le features sono indipendenti tra loro, data la classe

4. Selezionare la sentenza corretta riguardo la regressione logistica
+ I parametri del modello sono tipicamente calcolati mediante discesa del gradiente
- La predizione non dipende dal bilanciamento dei dati di training rispetto alle classi
- I parametri del modello possono essere tipicamente calcolati in forma chiusa, mediante una formula esplicita
- Il calcolo della predizione non si basa sulla logilikelihood dei dati di training, in quanto si tratta di una tecnica discriminativa

# regressione multinomiale
1. Riguardo alla regressione multinomiale , selezionare la sentenza corretta tra le seguenti:
- Per n features di input e m classi, il numero dei parametri del modello cresce come O(n+m)
+ Il peso con cui è valutata ogni feature è tipicamente diverso per ogni classe
- I pesi delle features sono sempre tutti positivi, i bias possono essere negativi
- Per ogni input, esiste almeno una classe con probabilità >0.5

2. Riguardo alla regressione multinomiale , selezionare la sentenza errata tra le seguenti:
- Per n features di input e m classi, il numero dei parametri del modello è n x m + m
- Il peso con cui è valutata ogni feature è tipicamente diverso per ogni classe
- Il peso delle features indica la loro importanza ai fini della classificazione
+ Per ogni input, esiste almeno una classe con probabilità >0.5

# Regressione lineare
1. Selezionare la sentenza errata relativa alla regressione lineare
+ Cerca di determinare un iperpiano di separazione tra due categorie di dati
- Il problema di ottimizzazione ammette una soluzione in forma chiusa
- La funzione di loss è tipicamente una distanza quadratica tra i valori predetti e quelli osservati
- cerca di stabilire una relazione tra i valori di una variabile di output e i valori di una o più features di input

# reti per classificazione di immagini
1. Quale di queste reti non è stata progettata per classificare immagini?
- Inception – v3
+ U-Net
- VGG19
- ResNet

2. Quale è la tipica struttura per una rete neurale di classificazione delle immagini?
- Solo livelli densi
- Un encoder seguito da un decoder
+ Una sequenza alternata di convoluzioni e downsampling seguita da flattening e pochi livelli densi finali
- Una sequenza di convoluzioni che preservano la dimensione spaziale dell'input

# ReLU(x) (Rectified linear unit)
1. Selezionare la sentenza errata relativa alla funzione ReLU(x) (rectified linear unit)
- Lei o le sue varianti sono tipicamente utilizzate per i livelli interni delle reti neurali profonde
- La sua derivata è una funzione a gradino
- È una funzione monotona non decrescente
+ Non può essere usata per layer convoluzionali

# scomparsa del gradiente (vanishing gradient)
1. Selezionare la sentenza scorretta relativa al problema della scomparsa del gradiente (vanishing gradient)
+ Se il gradiente tende a zero anche i parametri e le attivazioni dei neuroni tendono a zero
- Se il gradiente tende a zero i parametri non sono più aggiornati e la rete smette di apprendere
- Il problema è mitigato dall'uso di link residuali all'interno della rete
- Il problema è fortemente attenuato dall'uso di ReLU (o sue varianti) come funzione di attivazione per i livelli nascosti della rete

2. Il problema della scomparsa del gradiente (vanishing gradient) si riferisce ad una progressiva diminuzione dell'intensità del gradiente dovuta a
+ Backpropagation in reti profonde
- Dati troppo rumorosi o malamente processati
- Troppi pochi dati di training a disposizione
- Training eccessivamente lungo

# Softmax
1. Selezionare la sentenza corretta relativa alla funzione softmax
- Non può essere utilizzata nel caso di una classificazione binaria
+ Restituisce una distribuzione di probabilità sulle classi
- Per una data classe, la somma dei valori su tutti gli input di un minibatch è sempre 1
- Produce valori compresi nell'intervallo [-1,1]

2. Selezionare la sentenza errata relativa alla funzione softmax
- Generalizza la funzione logistica al caso multiclasse
- Permette di calcolare una distribuzione di probabilità sulle classi
- Per una dato input, la somma dei suoi valori su tutte le classi è sempre 1
+ Produce valori compresi nell'intervallo [-1,1]

# stride in un layer convolutivo
1. Qual è l'effetto di uno stride non unitario (>1) in un layer convolutivo?
+ La dimensione spaziale diminuisce
- Nessun effetto spaziale, il numero dei canali decresce
- La dimensione spaziale aumenta
- Nessun effetto spaziale, il numero dei canali aumenta

# tecniche discriminative
1. Selezionare la sentenza corretta relativa alle tecniche discriminative
- Cercano di determinare le distribuzioni di probabilità delle varie classi di dati
+ Si focalizzano sulla definizione delle frontiere di decisione (decision boundaries)
- Si applicano per lo più in ambito di apprendimento non supervisionato
- Sono tipicamente meno espressive delle tecniche generative

2. Cosa si intende con tecniche discriminative?
- Tecniche tipiche di unsupervised learning che tentano di separare dati in cluster distinti
+ Tecniche di classificazione che si focalizzano sulla definizione delle frontiere di decisione (decision boundaries)
- Tecniche che cercano di discriminare i dati in base alle diverse distribuzioni di probabilità delle varie classi
- tecniche che cercano di identificare gli outliers all'interno dei data set 

# tecnica a discesa del gradiente
1. selezionare la sentenza corretta relativa alla tecnica a discesa del gradiente
- permette sempre di individuare il minimo globale, se questo esiste
- il risultato non dipende dalla inizializzazione dei parametri del modello
- può essere applicata solo se la funzione da minimizzare ha una superficie concava
+ potrebbe convergere ad un minimo locale

2. Selezionare la sentenza scorretta relativa alla tecnica a discesa del gradiente
- Potrebbe convergere ad un minimo locale
+ Può essere applicata solo se la funzione da minimizzare ha una superficie concava
- Il risultato può dipendere dalla inizializzazione dei parametri del modello
- È opportuno decrementare il learning rate verso la fine dell'apprendimento

# transposed convolutions
1. Selezionare la sentenza errata relativa alle transposed convolutions
- Possono essere interpretate come convoluzioni normali con stride subunitario
- Sono prevalentemente utilizzate in architetture per Image-to-Image processing, come autoencoders o U-Nets
- Sono essenzialmente equivalenti alla applicazione di un livello di upsampling seguito da una convoluzione normale
+ Richiedono la trasposizione dell'input prima di calcolare la convoluzione dei kernel

# U-net
1. Selezionare la sentenza scorretta relativa alla U-Net
- È un componente tipico dei modelli generativi a diffusione
- È spesso impiegata per problemi di segmentazione semantica di immagini
- Può essere usata per la rimozione del rumore (denoising) di immagini
+ Viene spesso utilizzata nell'ambito della classificazione dei generi musicali

2. Quale tra i seguenti è un tipico campo di applicazione della U-Net?
+ Segmentazione semantica
- Generazione musicale
- Object detection
- Natural Language Processing

# Inception module
1. Selezionare la sentenza errata relativa all' "inception module"
- Sfrutta kernel di dimensione diversa
- Tende a ridurre il costo computazionale sfruttando convoluzioni unitarie per diminuire il numero dei canali
+ Utilizza al proprio interno delle skip-connections per bypassare l'applicazione di parte dei kernel
- È un componente tipico della rete Inception-v3

# Minimi locali – fase training
1. Quale delle seguenti tecniche non può aiutare ad uscire dai minimi locali durante la fase di training?
- Ridurre la dimensione del minibatch
+ Fare clipping del gradiente in un range prefissato
- Aumentare il learning rate
- Aggiungere un "momento" al gradiente, cioè parte del gradiente del passo precedente

# Intersection over Union (IoU)
1. Selezionare la sentenza SCORRETTA relativa alla Intersection overUnion (IoU)
- E' frequentemente utilizzata come misura di similitudine tra bounding boxes
- Restituisce un valore nel range [0,1]
+ Non è una funzione simmetrica dei suoi input
- E' una metrica principalmente utilizzata nel campo della Object Detection

# Transformers
1. Quale è l'obiettivo principale dell'algoritmo di clustering K-means?
- Ridurre il numero di clusters al minimo
- Trovare il punto medio del dataset
+ Raggruppare i punti di un cluster attorno al loro centroide
- Ottimizzare il numero dei clusters basandosi sulla distribuzione gaussiana dei dati

2. Qual'è lo scopo dell'optimizer in Tensorflow/Keras?
+ Definire l'algoritmo che calcola i gradienti della loss e aggiorna i pesi del modello
- Salvare i migliori pesi del modello durante il processo di training
- Contrastare l'overfitting
- Aggiungere una pentalità ai pesi del layer su cui viene istanziato

3. Selezionare la sentenza errata relativa ai transformers
- Hanno una tipica struttura encoder-decoder, ognuno formato da uno stack di sottocomponenti modulari
- Sono alla base delle reti della famiglia BERT e GPT
- Utilizzano pesantemente il meccanismo di attenzione
+ Aggiungono ad ogni livello della rete un encoding posizionale

4. Selezionare la sentenza SCORRETTA relativa all'overfitting
- Può essere particolarmente pericolosa per i modelli altamenti espressivi
+ L'acquisizione di nuovi dati di training non può che peggiorare la situazione
- Può essere contrastata con tecniche di regolarizzazione
- Può essere contrastata con la tecnica di early stopping durante la fase di training

5. Un traning set è composto da 10000 dati. Se la batchsize è 50, quante volte verrà effettuata la backpropagation durante una singola epoca?
- 50
- 10000
+ 200
- Nessuna delle altre risposte è corretta