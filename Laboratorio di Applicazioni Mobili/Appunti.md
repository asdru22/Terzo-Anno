Un'applicazione mobile ibrida può essere sviluppata usando librerie native e tecnologie web per ottenere il meglio dai due. La porzione nativa dell'app può essere scritta come un'applicazione nativa.
Applicazioni mobili basate su web app e Progressive Web Apps sono sviluppate con gli stessi strumenti usati per lo sviluppo di siti web per mobile.
Applicazioni ibride si dividono in ibride native e ibride-web.
# Architettura Android
basato su Linux
Android 4.4 introduce una nuova JVM 
Android 6.0 richiede i permessi per l'uso delle app solamente quando un certo permesso è richiesto e non all'installamento dell'app.

Basato sull'architettura Linux, multi utente.
In android gli utenti sono le app.
Le app vengono eseguite in un sandbox. Le app non possono accedere a file o directory al difuori delle sue.
Hardware abstraction layer: il kernel Linux e lo stesso per tutti i dispositivi.
C'è un API per comunicare con i livelli inferiori. Cosi da sopra si vede uguale per tutti
ART: java virtual machine di android, ottimizzata per dispositivi con poca memoria
Si cerca sempre di eseguire un linguaggio macchina piuttosto che compilare bytecode
Java->bytecode->codice macchina

Ci sono applicazioni privilegiate (app di sistema) che hanno accesso a parti di codice che le app di terze parti non hanno.

# Componenti App
Activity è un componente che corrisponde a una schermata dell'applicazione. E un unità coesa che può comprendere più schermate.
Ogni activity è composto da componenti grafici.
Ogni view può generare un evento che deve essere gestito da callback.
Una funzione di callback non viene esplicitamente chiamata da nessuno nel codice, reagiscono ad eventi: programmazione reattiva.
Intents: messaggi asincroni (mediati dal sistema operativo per accedere a componenti di altre applicazioni), usati per passare da un activity ad un altra.
Services: controparti delle activities ma con componenti di background.