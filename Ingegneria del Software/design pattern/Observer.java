import java.util.ArrayList;
import java.util.List;

public class Observer {

    // INTERFACCIA DELL'OSSERVATORE
    interface Osservatore {
        void aggiorna(String stato);
    }

    // INTERFACCIA DEL SOGGETTO
    interface Soggetto {
        void aggiungiOsservatore(Osservatore o);
        void rimuoviOsservatore(Osservatore o);
        void notificaOsservatori();
    }

    // IMPLEMENTAZIONE CONCRETA DEL SOGGETTO
    static class Notizie implements Soggetto {
        private final List<Osservatore> osservatori = new ArrayList<>();
        private String notizia;

        public void pubblicaNotizia(String testo) {
            this.notizia = testo;
            notificaOsservatori();
        }

        public void aggiungiOsservatore(Osservatore o) {
            osservatori.add(o);
        }

        public void rimuoviOsservatore(Osservatore o) {
            osservatori.remove(o);
        }

        public void notificaOsservatori() {
            for (Osservatore o : osservatori) {
                o.aggiorna(notizia);
            }
        }
    }

    // OSSERVATORE CONCRETO
    static class Utente implements Osservatore {
        private final String nome;

        public Utente(String nome) {
            this.nome = nome;
        }

        public void aggiorna(String stato) {
            System.out.println(nome + " ha ricevuto la notizia: " + stato);
        }
    }

    // MAIN
    public static void main(String[] args) {
        Notizie notiziario = new Notizie();

        Utente alice = new Utente("Alice");
        Utente bob = new Utente("Bob");

        notiziario.aggiungiOsservatore(alice);
        notiziario.aggiungiOsservatore(bob);

        notiziario.pubblicaNotizia("È uscito Java 21!");
        notiziario.pubblicaNotizia("Nuova vulnerabilità scoperta in Log4j!");
    }
}
