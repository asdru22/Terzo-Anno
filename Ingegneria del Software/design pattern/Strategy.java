public class Strategy {

    // Interfaccia strategia
    interface OperazioneStrategia {
        int esegui(int a, int b);
    }

    // Strategia concreta: Somma
    static class SommaStrategia implements OperazioneStrategia {
        @Override
        public int esegui(int a, int b) {
            return a + b;
        }
    }

    // Strategia concreta: Sottrazione
    static class SottrazioneStrategia implements OperazioneStrategia {
        @Override
        public int esegui(int a, int b) {
            return a - b;
        }
    }

    // Contesto che usa la strategia
    static class Calcolatrice {
        private OperazioneStrategia strategia;

        public void setStrategia(OperazioneStrategia strategia) {
            this.strategia = strategia;
        }

        public int calcola(int a, int b) {
            if (strategia == null) {
                throw new IllegalStateException("Nessuna strategia impostata.");
            }
            return strategia.esegui(a, b);
        }
    }

    // Metodo main per testare il pattern
    public static void main(String[] args) {
        Calcolatrice calc = new Calcolatrice();

        // Strategia: somma
        calc.setStrategia(new SommaStrategia());
        System.out.println("10 + 5 = " + calc.calcola(10, 5));

        // Strategia: sottrazione
        calc.setStrategia(new SottrazioneStrategia());
        System.out.println("10 - 5 = " + calc.calcola(10, 5));
    }
}
