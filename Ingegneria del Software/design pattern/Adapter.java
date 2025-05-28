public class Adapter {

    // Target: l'interfaccia che il client conosce
    interface Display {
        void display();
    }

    // Adaptee: classe esistente con un'interfaccia incompatibile
    static class LegacyPrinter {
        public void printText(String text) {
            System.out.println("LegacyPrinter: " + text);
        }
    }

    // Adapter: adatta LegacyPrinter a Display
    static class PrinterAdapter implements Display {
        private LegacyPrinter legacyPrinter;
        private String message;

        public PrinterAdapter(LegacyPrinter legacyPrinter, String message) {
            this.legacyPrinter = legacyPrinter;
            this.message = message;
        }

        public void display() {
            legacyPrinter.printText(message);
        }
    }

    // Metodo main per testare
    public static void main(String[] args) {
        LegacyPrinter oldPrinter = new LegacyPrinter();

        // Adapter permette di usare LegacyPrinter dove è richiesto Display
        Display adaptedPrinter = new PrinterAdapter(oldPrinter, "Messaggio adattato");

        adaptedPrinter.display();  // Output: LegacyPrinter: Messaggio adattato
    }
}
