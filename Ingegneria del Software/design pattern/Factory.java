public class Factory {

    // Interfaccia prodotto
    interface Forma {
        void disegna();
    }

    // Implementazione concreta: Cerchio
    static class Cerchio implements Forma {
        public void disegna() {
            System.out.println("Disegno un cerchio");
        }
    }

    // Implementazione concreta: Quadrato
    static class Quadrato implements Forma {
        public void disegna() {
            System.out.println("Disegno un quadrato");
        }
    }

    // Interfaccia della factory
    interface FormaFactory {
        Forma creaForma();
    }

    // Factory concreta per cerchio
    static class CerchioFactory implements FormaFactory {
        public Forma creaForma() {
            return new Cerchio();
        }
    }

    // Factory concreta per quadrato
    static class QuadratoFactory implements FormaFactory {
        public Forma creaForma() {
            return new Quadrato();
        }
    }

    // Main per testare
    public static void main(String[] args) {
        FormaFactory factory1 = new CerchioFactory();
        Forma forma1 = factory1.creaForma();
        forma1.disegna();

        FormaFactory factory2 = new QuadratoFactory();
        Forma forma2 = factory2.creaForma();
        forma2.disegna();
    }
}
