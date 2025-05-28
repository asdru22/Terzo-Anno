public class State {

    // Interfaccia dello stato
    interface StatoMacchina {
        void premiPulsante(MacchinaContesto contesto);
    }

    // Stato concreto: Spenta
    static class Spenta implements StatoMacchina {
        @Override
        public void premiPulsante(MacchinaContesto contesto) {
            System.out.println("Macchina accesa.");
            contesto.setStato(new Accesa());
        }
    }

    // Stato concreto: Accesa
    static class Accesa implements StatoMacchina {
        @Override
        public void premiPulsante(MacchinaContesto contesto) {
            System.out.println("Macchina spenta.");
            contesto.setStato(new Spenta());
        }
    }

    // Contesto
    static class MacchinaContesto {
        private StatoMacchina stato;

        public MacchinaContesto() {
            stato = new Spenta(); // stato iniziale
        }

        public void setStato(StatoMacchina stato) {
            this.stato = stato;
        }

        public void premiPulsante() {
            stato.premiPulsante(this);
        }
    }

    // Main
    public static void main(String[] args) {
        MacchinaContesto macchina = new MacchinaContesto();

        macchina.premiPulsante(); // accende
        macchina.premiPulsante(); // spegne
        macchina.premiPulsante(); // accende
    }
}
