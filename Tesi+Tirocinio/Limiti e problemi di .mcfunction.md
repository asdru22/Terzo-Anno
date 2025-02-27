## Glossario
**Datapack**: gruppo di funzioni e altri file, paragonabile al "progetto" vero e proprio.
.mcfunction: formato di file, definibile come funzione che contiene comandi e commenti. Vengono messe nella cartella `function` dei datapack
**Comando**: qualsiasi riga di codice in un file mcfunction (ad esempio `scoreboard`, `data`, `function`. 
**Entità**: Qualsiasi cosa dinamica e interattiva che esiste nel mondo ma che non appartiene alla griglia dei blocchi. Le entità includono giocatori, mostri, proiettili e altro.
**Funzione**: gruppo di comandi scritti in un file `.mcfunction`
**NBT data**: rappresentazione dati paragonabili a JSON, tuttavia la chiave non è circondata da `"`. Tutte le entità, oggetti e certi blocchi la possiedono.
**Macro**: feature relativamente nuova che consente di inserire valori in funzioni da una sorgente NBT (con casting implicito a stringa). Un comando che contiene una macro inizia sempre con `$`
```c
test_macro.mcfunction:
	$say $(parameter) // $(<paramatro>) 
	$say $(integer).$(decimal) //esempio di concatenazione di stringhe
macro_call.mcfunction:
	function my_pack:test_macro {parameter:"ciao",integer:1,decimal:6}

// output:
// ciao
// 1.5
```
**Selettori**: usati per selezionare entità applicando controlli quali distanza dal contesto di esecuzione, valori delle loro scoreboard, NBT e altro. Ad esempio `say @e[nbt={Health:20f}]` seleziona tutte le entità con 20 punti vita (`@e` seleziona tutte le entità).
**Contesto di esecuzione**: l'entità e posizione su cui sta venendo eseguito il comando. L'entità che sta eseguendo il comando è selezionabile tramite `@s` (at self). Il contesto di esecuzione rimane lo stesso nelle chiamate di funzioni seguenti a meno che non venga esplicitamente cambiato.
**Command stack**: gli sviluppatori hanno implementato i comandi per essere inviati al gioco uno alla volta (non esiste multithreading), prendendo il primo in cima ad uno stack.
## I comandi più importanti
- `execute`: consente di eseguire comandi se sono soddisfatte certe condizioni e di spostare il contesto di esecuzione da un entità a un altra o da una coordinata a un altra. `execute as @a at @s run setblock ~ ~-1 ~ stone` esegue i seguenti passi
	- seleziona tutti i giocatori e per ognuno di essi
	- imposta il giocatore come entità che sta eseguendo il comando (`as @a`)
	- sposta il luogo di esecuzione dei comandi a dove si trova il giocatore `at @s`
	- relativamente a quella posizione, al blocco sotto metti un blocco di pietra (`setblock ~ ~-1 ~ stone`) 
- `say`: stampa stringhe su console
- `tellraw`: stampa strutture più complesse e ha una struttura NBT (simile a JSON)
- `function namespace:path/to/function`: chiama ed esegue una funzione
- `scoreboard`: esegue operazioni tra interi https://minecraft.wiki/w/Scoreboard#Score_operations
- `data`: legge e modifica dati NBT da qualsiasi sorgente (entità, blocchi, storage)  
- `schedule`:  esegue una funzione dopo un intervallo di tempo resettando il contesto di esecuzione.
### Necessità di definire `scoreboard` prima di poterle usare per fare operazioni matematiche
Non si può fare  `scoreboard players operation a math += b math` senza aver prima dichiarato la scoreboard `math` con `scoreboard objectives add math dummy`.
### Necessità di utilizzare namespace per evitare conflitti tra progetti diversi
Nell'esempio precedente, se due progetti diversi usano il nome `math` per le loro scoreboard, possono esserci dei conflitti se da un lato viene fatto `scoreboard players set temp dummy 1` e dall'altro `scoreboard players set temp dummy 2`.  Per evitare questo problema si usano namespace per ogni progetto: `scoreboard players set temp foo.dummy 1`
e `scoreboard players set temp bar.dummy 2`.
Questo problema non è limitato a scoreboard ma si applica anche a 
- Tags: stringhe memorizzate in un array, usate per identificare/filtrare delle entità specifiche. Ad esempio, se aggiungo uno zombie che è molto lento ma ha molta vita, non voglio che questo venga selezionato dalle funzioni di un altro datapack che rende tutti gli zombie più veloci. Per questo il mio zombie avrà `Tags:[foo.custom_zombie]`  e l'altro avrà `Tags:[bar.custom_zombie]`. 
- Storage: i data storage sono spazi di memoria persistente che possono essere modificati o letti. Permettono di memorizzare dati non collegati a entità, blocchi o oggetti. Anche questi devono avere namespace perché se dichiaro uno storage che memorizza i dati di un oggetto: `data modify storage my_storage item set value {id:"diamond_sword",count:1}`. Se un altro datapack lo modifica con `data modify storage my_storage item set value {id:"dirt",count:64}`, e in seguito io volevo dare l'oggetto memorizzato su storage a un giocatore, esso avrà una 64 blocchi di terra piuttosto che una spada in diamante. Dunque per evitare questi conflitti entrambi gli sviluppatori usano namespace diversi:
```c
data modify storage foo:my_storage item set value {id:"diamond_sword",count:1}

data modify storage my_storage item set value {id:"dirt",count:64}
```  
### Utilizzo di simboli illegali per non impostare scoreboard con giocatori
Dato che le scoreboard sono state pensate per assegnare punteggi a giocatori reali, la sintassi è 
`scoreboard players set <selector> <objetive> <value>`. il selector accetta nomi di giocatori, quindi ci si potrebbe trovare nel caso in cui un valore è assegnato a un giocatore. Il 99% delle volte questo non crea problemi, tuttavia per essere sicuri di non selezionare giocatori si inseriscono nei selettori simboli che non possono essere messi nel proprio username quando si crea un account. 
Lo standard è `$` per le variabili e `#` per le costanti. Ad esempio ```scoreboard players set #100 math 100```
### Necessità di utilizzare costanti già dichiarate per fare operazioni diverse da somma e sottrazione
Riprendendo il paragrafo precedente, se si vuole moltiplicare o dividere un valore per un numero costante, bisogna aver già dichiarato quella costante in precedenza.
La somma e sottrazione di valori costanti è supportata con
```scoreboard players <add/remove> <selector> <scoreboard> <value>```
Ma non si può fare lo stesso con moltiplicazioni e divisioni. `x*=5` si deve scrivere come
```c
scoreboard players set #5 math 5
scoreboard players operation $x math *= #5 math
```
la dichiarazione delle costanti va fatta solo una volta dato che in teoria non verranno mai modificate.
### Non si può fare `c = a+b` lasciando `a` e `b` invariati (con una sola operazione)
Le operazioni di somma, moltiplicazione e divisione possono essere utilizzate solo come `a+=b` (per questo c'è `=` dopo gli operatori `+`,`-`,`/` e `*` . `c = a+b` si può scrivere nel seguente modo:
```c
scoreboard players operation $c math = $a math
scoreboard players operation $c math += $b math
```
che equivale a 
```c
int c = a
c+=b
```
e per ogni operazione in più va aggiunta un altra riga
### Operazioni limitate a int a 32 bit
Il dominio delle operazioni tra scoreboard è $\mathbb{Z} \cap [-2^{31}, 2^{31}-1]$. Divisioni che avrebbero risultati decimali vengono approssimate all'intero più vicino. Ad esempio se si vuole calcolare il 5% di 40, bisogna stare attenti all'ordine delle operazioni:
(ometto la dichiarazione delle costanti `#100` e `#5`)
```c
scoreboard players operation set $temp math 40
scoreboard players operaton $temp math /= #100 math
scoreboard players operation $temp math *= #5 math
```
$=0$ dato che $\frac{40}{100}=0$, mentre
```c
scoreboard players operation set $temp math 40
scoreboard players operation $temp math *= #5 math
scoreboard players operaton $temp math /= #100 math
```
$=2$, dato che $40\times5>100$, quindi dividendolo per $100$ non verrà approssimato a 0.
Per evitare questi problemi di perdita di precisione in genere si moltiplica e poi divide per $10^n$.
Si moltiplica il valore per 100 o 1000 a seconda della precisione richiesta, si fanno le operazioni, e poi lo si divide per 100 o 1000 memorizzando il valore in uno storage (dato che sono in grado di contenere double, float e long.
Per esempio se voglio indicare la percentuale di mana di un giocatore mostrando anche le cifre decimali
```c
// ipotizzo di aver 41 mana e 53 max_mana
scoreboard players operation $mana_perc math = @s mana 
scoreboard players operation $mana_perc math *= #10000 math
scoreboard players operation $mana_perc math /= @s max_mana
execute store result storage my_storage perc_mana int 0.01 run scoreboard players get $mana_perc math
tellraw @s ["Max Mana",{"nbt":"perc_mana","storage":"my_storage"}] // comando per stampare al giocatore
```
Tuttavia questo metodo può essere problematico se scalando, il valore è maggiore di $2^{31}-1$. Se $\textup{mana}=4100000$ e $\textup{max mana}=5100000$,
$\textup{mana\_perc}=-3.82$.

### Assenza di C-style code blocks
Non si può raggruppare codice in blocchi, quindi se voglio eseguire comandi solo se una certa condizione è vera devo creare una nuova funzione. Questa è una tecnica comune in programmazione quando le righe di codice magari sono numerose, o per motivi di chiarezza. Tuttavia in mcfunction
- le funzioni sono in un altro file. Quindi bisogna passare da un tab all'altro per vedere cosa sta facendo la funzione che si sta chiamando
- queste funzioni possono avere anche solo due comandi. Se per esempio voglio che tutti le entità che hanno preso danno ricevano forza e un oggetto posso scrivere:
```c
execute as @e if entity @s[nbt={HurtTime:10s}] run effect give @s strength
execute as @e if entity @s[nbt={HurtTime:10s}] run item replace entity @s weapon.mainhand stone_sword
```
Il problema è che accedere ai dati nbt delle entità è un processo costoso dato che deve essere tutta serializzata, quindi per migliorare la performance si in genere si scrive:
```c
execute as @e if entity @s[nbt={HurtTime:10s}] run function my_pack:on_hurt

// on_hurt.mcfunction:
effect give @s strength
item replace entity @s weapon.mainhand stone_sword
```
Per fare questo bisogna creare un nuovo file, e considerando quanto spesso si utilizzano if nella programmazione in generale, si può ipotizzare quanto possa diventare noioso, anche senza considerare la scomodità di passare da un tab a un altro per leggere il codice. Sarebbe ideale poter scrivere
```c
execute as @e if entity @s[nbt={HurtTime:10s}] run {
	effect give @s strength
	item replace entity @s weapon.mainhand stone_sword 
}
```
ma questo non è possibile.
Un altro caso in cui sarebbe comodo essere in grado di raggruppare comandi in blocchi senza dover creare un nuovo file è scrivere `if...else if ...else` o `switch` statements
Se voglio stampare chi ha vinto, controllando un valore intero, si può fare usando il comando `return` per interrompere l'esecuzione di comandi all'interno di una funzione.
Se vogliamo scrivere il seguente codice in .mcfunction
```c
if(team==1) print("blue won")
else if(team==2) print("red won")
else if(team==3) print("green won")
else print("no one won")
 ```
si può scrivere:
```c
execute if score $team var matches 1 run return run say blue won
// se il flusso di esecuzione raggiunge questo punto vuol dire che $team != 1
execute if score $team var matches 2 run return run say red won
// se il flusso di esecuzione raggiunge questo punto vuol dire che $team != 1 e 2
execute if score $team var matches 3 run return run say green won
// se il flusso di esecuzione raggiunge questo punto vuol dire che nessun team ha vinto
say no one won
```
considerando sempre che se si vogliono eseguire più comandi bisogna creare una nuova funzione, ovvero un nuovo file per ogni caso, anche perché scrivendo
```c
execute if score $team var matches 1 run return run say blue won
execute if score $team var matches 1 run return run fill 0 0 0 0 10 0 blue_wool // comando per riempire i blocchi tra due coordinate con "lana blu"
```
il secondo comando (e tutti quelli dopo) non viene eseguito per via del return del comando precedente.
Un metodo alternativo a controllare ogni valore (evitare hardcoding) consiste nell'usare macro per controllare in modo dinamico il valore, e chiamare una funzione che ha come nome o contiene nel nome quel valore.
```c
// if(team<1||team>3) team = -1
// si assegna un valore di default/fallback se il valore non è tra quelli che vogliamo
execute unless score $team var matches 1..3 run scoreboard players set $team var -1
execute store result storage my_storage team.value int 1 run scoreboard players get $team var
function mypack:check_value with storage my_storage team

// check_value.mcfunction:
$execute if score $team var matches $(value) run function mypack:team$(value)
```
poi si dovranno fare 4 funzioni chiamate `team1.mcfunction`, `team2.mcfunction`, `team3.mcfunction`, `team-1.mcfunction`. Questo non è né chiaro ne rapido da scrivere se i casi sono molti.
### Assenza di un (classico) array indexing
Riprendendo l'assenza di code blocks per il ciclo for citati nel paragrafo precedente, iterare su elementi di un array è fattibile in due modi
- combinazione di macro e ricorsione: complicato ma efficiente.
```c
data modify storage my_storage food set value ["apple","chicken","bread"]
execute store result score $length var run data get storage my_storage food
execute if score $length var matches 1.. run function my_pack:iter {i:0}

// iter.mcfunction:
$tellraw @p {"nbt":"food[$(i)]","storage":"my_storage"}
$scoreboard players set $i var $(i)
scoreboard players add $i var 1
execute if score $i var >= $length run return fail // si esce dal ciclo se l'indice supera la lunghezza

exeute store result storage my_storage data.i int 1 run scoreboard players get $i var
function my_pack:iter storage my_storage data //si passa lo storage alla funzione da cui verrà presa la i
```
- copia e ricorsione: facile ma costoso, dato che si copia un intero array
```c
data modify storage my_storage food set value ["apple","chicken","bread"]

data modify storage my_storage temp set from storage my_storage food // copa dell'array da food a temp
function mypack:iter

// iter.mcfunction:
tellraw @p {"nbt":"temp[0]","storage":"my_storage"}
data remove storage my_storage temp[0]
if data storage my_storage temp[] run function mypack:iter // se ci sono elementi in temp, ripeti
```

