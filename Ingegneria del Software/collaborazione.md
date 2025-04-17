# 1. Version Control
## 1.1 Ciclo di vita degli artefatti
![[Pasted image 20250408092148.png]]Non si vuole che tutti i salvataggi fatti siano recuperati.
Quando si fa un commit, un sistema prende la copia attuale del file e la mette da un'altra parte dove può poi essere recuperata.
## 1.2 Gestire le revisioni
Implementare un operazione di commit che fa *snapshot* di file. Una *repository* contiene file versionati, i cui snapshot possono essere presi e ripristinati (operazione di *restore*).
Ogni file può avere associato altri dati (metadati):
- data e timestamp dello snapshot
- chi ha modificato il file
- perché è stato fatto
## 1.2.1 Il *Changeset*
Quando si creano revisioni spesso si opera non su i singoli file, ma su un gruppo di file correlati che sono stati tutti modificati per uno stesso fine. Questo gruppo di file si chiama *changeset*
Lo stream di snapshot:
![[Pasted image 20250408093126.png]]
Quello a sinistra è quello più vecchio. Non serve memorizzare un file negli snapshot successivi se non è stato modificato.
## 1.3 Collaborazione
Il sistema di revisione è un sistema distribuito
- Approccio client-server (centralizzato): il sistema di revisione è un servizio su un host remoto che espone un'API
- Approccio peer-to-peer (distribuito): tutte le workstation hanno repository locali che possono essere sincronizzate con quelle remote. In genere si ha un'unica repository remota e più repository locali che possono essere sincronizzate con quella remota.
### 1.3.1 Conflitti
- Sistema centralizzato: si usa un lock: solo l'utente che ha il lock per un certo file può creare revisioni per quel file. Questo sistema ha dei problemi:
	- Ognuno può vedere le revisioni degli altri
	- È un problema se qualcuno si dimentica di rilasciare un lock.
	- cattive abitudini di gestione del lock influenzano tutti gli sviluppatori
	- Se il server è spento tutti sono bloccati.
	- Se non c'è la rete non si può lavorare.
- Sistema distribuito: si gestiscono: si definiscono workflows per minimizzare l'impatto dei conflitti. Quando ci sono cambiamenti contemporanei, si sceglie uno tra i cambiamenti o si fa un merge manuale.
## 1.4 Git
Git è un sistema di versionamento distribuito. 
![[Pasted image 20250408100751.png]]
È l'utente a scegliere quali file modificati inserire nel prossimo snapshot. Nella staging area si sceglie quali file includere nello snapshot e quali no (i file esclusi non fanno parte del changeset).
**Gli stati dei file**
![[Pasted image 20250408101046.png]]
Una volta che il file è tracciato, il file si può trovare in 3 stati
- *committed*: l'ultima versione del file locale coincide con quella sulla repository remota
- *modified*: l'ultima versione del file locale non coincide con quella sulla repository remota
- *staged*: il file modificato sarà inserito nel prossimo changeset.

![[Pasted image 20250408101715.png]]
## 1.4.1 Branching
Un branch è una linea temporale che diverge da quella principale. I branches devono essere esplicitamente creati e nominati.
I branch non divergono per sempre, a un certo punto si vuole fare riconciliare i branches.
### 1.4.2 Hashs, refs e tags
I commit sono identificati da un id univoco (un hash SHA-1).
I refs sono nomi che possono sostituire gli hashs. Git usa ref per tenere traccia dello stato della repository. 
### 1.4.3 HEAD
Lo stato della directory è elaborato in relazione a una specifica commit. HEAD è il riferimento che punta a quel commit. Quando si cambia branch corrente, si fa puntare HEAD a quel branch, il quale a sua volta farà riferimento alla commit in cima. 
>In genere head punta al commit più recente del branch su cui si sta lavorando

 