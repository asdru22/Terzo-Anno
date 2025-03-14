## 1. Referenziazione a namespace
`*` corrisponde al namespace, in questo caso `haywire` seguito da `.` (carattere convenzionale separatore, potenzialmente da far specificare all'utente) per tags, scoreboard, bossbar, teams ("oggetti" di minecraft con scope globale, che possono creare conflitti se hanno lo stesso nome) e `:` per riferimenti a file esterni (json o funzioni, con l'eccezzione dei modelli, di cui parlo più avanti) e storage (il compilatore deve essere in grado di capire se il `*` si sta riferendo a un file, storage o ad oggetti specifici di minecraft). 
Potenzialmente se l'uso di `*` non ricade in questi due casi ma ad esempio viene usato come chiave di una struttura nbt `*:{id:"my_item"}` il compilatore potrebbe semplicemente sostituirlo con il namespace specificato nelle impostazioni del progetto.
## 2. Package
Si potrebbe far specificare all'utente se preferiscono usare `.` o `/` per navigare dentro i package. Non sono sicuro sia necessario definire il package, dato che coincide con la struttura delle cartelle/file (almeno per come ho organizzato i file io).
## 3. Gestione file json
La prassi per creare i file json è con https://misode.github.io/, non sono sicuro se sia necessario trovare un modo per migliorare la loro scrittura. Sia con mcfunction tradizionale e questo linguaggio ideale si fa copia-incolla dal sito.
classico:
```json
{
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:loot_table",
          "functions": [
            {
              "function": "minecraft:set_count",
              "count": {
                "type": "minecraft:score",
                "target": {
                  "type": "minecraft:fixed",
                  "name": "#count"
                },
                "score": "haywire.dummy"
              }
            }
          ],
          "value": "*items/moonlit_monolith"
        }
      ]
    }
  ],
  "random_sequence": "*blocks/moonlit_monolith"
}
```

ideale (il namespace è stato sostituito da `*` descritto nel punto 1):
```json
{
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:loot_table",
          "functions": [
            {
              "function": "minecraft:set_count",
              "count": {
                "type": "minecraft:score",
                "target": {
                  "type": "minecraft:fixed",
                  "name": "#count"
                },
                "score": "*dummy"
              }
            }
          ],
          "value": "*items/moonlit_monolith"
        }
      ]
    }
  ],
  "random_sequence": "*blocks/moonlit_monolith"
}
```
## 4. Modelli 3D
Non sono sicuro se l'implementazione delle texture sia la migliore, dato che i modelli 3d vengono creati molto facilmente o con https://misode.github.io/ o con un [software specifico](https://www.blockbench.net/) (simile a blender). Interferire con i path delle texture generati da essi porterà a più problemi che vantaggi.
## 5. Scope dei nomi file
```
predicate value_check.is_night = { // predicates/value_check/night (non fatto inline perché riutilizzato)
  "condition": "minecraft:time_check",
  "value": {
    "min": 13000,
    "max": 22999
  }
}
```
Se ho capito bene da quello che ci siamo detti, si può fare riferimento a un file del genere semplicemente prendendo l'ultimo valore del suo "path". In questo caso il nome del predicate è `night`. Si rischia di avere magari un predicate e una funzione con stesso nome. Suppongo spetti al compilatore scegliere il file giusto in base al contesto? altrimenti si può sollevare un eccezione che dice che i due file hanno lo stesso nome anche se in mcfunction normale non sarebbe un problema dato che predicate e function sono in cartelle diverse.
## 6. Scorciatoie scoreboard
Al posto di scrivere
```c
scoreboard players set #8 haywire.dummy 8

scoreboard players operation #moon_phase haywire.dummy %= #8 haywire.dummy
```
si potrebbe scrivere 
`operation #moon_phase *dummy %= 8` (avrei voluto usare `op` ma c'è un altro comando con lo stesso nome che non ha nulla a che fare con le operazioni)
Pero se si fanno operazioni di somma o sottrazione (`operation @s *dummy2 +=/-= 1`), si possono generare comandi del tipo `scoreboard players add/remove @s haywire.dummy2 1` che non richiedono l'assegnamento di una costante prima di essere usati (c'è il comando specifico per sommare/sottrare un valore costante). Di conseguenza si potrebbe anche implementare `operation @s *dummy2 ++` per incrementare/decrementare un valore di 1.
## 7. Scorciatoie execute
Si potrebbe omettere il comando `execute` e trattare i suoi sottocomandi come il comando vero e proprio.  `execute` è il comando più potente, che ha dei sottocomandi quali `if` per verificare una certa condizione, `as` per spostare l'esecuzione dei comandi su un altra entità ecc. Al posto di scrivere `execute as @p at @s ...` si potrebbe semplicemente scrivere `as @p at @s ...`, dato che non esistono comandi con nomi uguali a quelli dei sottocomandi di execute.
## 8. Aggiungere comandi in una funzione da un altro file
Ovviamente questo può essere fatto solo in casi dove l'ordine di esecuzione dei comandi non importa. Ad esempio
  ```c
append(*block.timers.10_second_clock){
		if entity @s[tag=*moonlit_monolith.fixed] run function *block.moonlit_monolith.ten_second_clock.main
}```
## 9. Traduzioni
Aggiungere coppie-chiave valore per traduzioni senza accedere al file .json
```c
lang."item.haywire.moonlit_monolith" = "Moonlit Monolith" // traduzione di default a inglese americano (en_us), che è anche fallback per tutte le traduzioni assenti nelle altre lingue
lang["it_it"]."item.haywire.moonlit_monolith" = "Monolite Lunare" // esempio di traduzione in italiano
```
normalmente si ha un unico file json per ogni lingua.
## 10. Suoni
Stessa cosa per i suoni
```c
sounds["block.moonlit_monolith.moonstone_vanishing"] = {
    "sounds":[
      {
        "name":"haywire:block/moonlit_monolith/moonstone_vanishing"
      }
    ],
    "subtitle": "subtitles.haywire.block.moonlit_monolith.moonstone_vanishing"
}
```
Anche qui c'è un problema simile a quello del punto 4. Dato che texture e suoni sono nei loro file png e ogg rispettivamente, forse la soluzione migliore è avere due cartelle apposta per texture e suoni.
## 11. Sintassi più veloce per macro
```c
with storage *temp root.macro_input {
    $data remove storage *storage root.balemoon[{moonlit_monolith:$(string_uuid)}]
}
// esempio con dati "costanti"
with {string_uuid:"0a602d40-a11f-43ec-808e-6db195d3913e"} {
    $data remove storage *storage root.balemoon[{moonlit_monolith:$(string_uuid)}]
}

```
anziché
```c
// remove storage.mcfunction
$data remove storage haywire:storage root.balemoon[{moonlit_monolith:$(string_uuid)}]

// chiamata alla funzione con macro
function remove_storage with storage haywire:temp root.macro_input
```
## 12. Syntax highlighting
mcfunction ha un estensione vscode per autocompletamento e syntax highlighting. 
![[Pasted image 20250314005001.png]]
se invece imposto vscode per applicare il syntax highlighting di GO ai file con estensione .mcf (estensione dei file con questo linguaggio ideale) si ha qualcosa di un pò sensato
![[Pasted image 20250314005147.png]]
## 13. Scorciatoie if/unless
- `if data block ~ ~ ~ {Items:[{components:{"minecraft:custom_data":{*{placed_block:1b,block:"moonlit_monolith"}}}}]} positioned ~ ~0.5 ~ run ...` sintassi classica ma con `execute` omesso
- `if (predicate in_the_expanse && block ~ ~-2 ~ vault) return run function place_fixed`: omissione execute e raggruppamento delle condizioni tra parentesi tonde. Inoltre uso `&&` al posto di un altro `if`
- `if(entity @s[tag=*moonlit_monolith.night] &! predicate night) function day`: dato che non si possono invertire gli esiti di controlli, ma solo controllare che non siano accaduti (con `unless`) al posto di scrivere `&& !<condizione>` si scrive `&!` (equivalente ad `unless`, che letteralmente significherebbe "e non")
- `if ... else` e `if ... else if ... else`: dovrebbe essere possibile implementarli usando `return` per fermare il flusso di esecuzione
(mi sono reso conto ora che mi sono dimenticato di dire che return può restituire anche comandi e non solo int come avevo detto all'ultimo incontro)
```c
say doing things
if(cond1) say 1
else if(cond2) say 2
else say 3
say do more things
```
diventa
```c
say doing things
function if_else1
say do more things

// if_else1.mcfunction:
execute if cond1 run return run say 1
execute if cond2 run return run say 2
say 3
```
questo blocco if-else va messo nella sua funzione perché altrimenti i comandi dopo al return non verrebbero eseguiti
```c
// cond2 = true
say doing things
execute if cond1 run return run say 1
execute if cond2 run return run say 2 // l'esecuzione termina qua
say 3
say do more things // questo che dovrebbe essere eseguito lostesso non viene eseguito per via del return chiamato prima
```
inoltre, se i comandi da eseguire se è verificata una condizione sono più di uno va creata una funzione per ciascuno di essi
```c
say doing things
if(cond1){
	say 1
	say this is the if
}
else if(cond2){
	say 2
	say this is the else if
}
else{
	say 3
	say this is the default
}
say do more things
```
diventa
```c
say doing things
function if_else1
say do more things

// if_else1.mcfunction:
execute if cond1 run return run function cond1
execute if cond2 run return run function cond2
// comandi chiamati solo se i primi due if sono falsi
say 3
say this is the default

//cond1.mcfunction
say 1
say this is the if

//cond2.mcfunction
say 2
say this is the if else
```

per lo stesso motivo di prima: se scrivessi
```c
execute if cond1 run return run say 1 // esecuzione funzione interrotta
execute if cond1 run return run say this is the if // mai raggiungibile
```