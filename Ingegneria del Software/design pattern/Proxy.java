public class Proxy {

    // Interfaccia comune
    interface Document {
        void display();
    }

    // Oggetto reale
    static class RealDocument implements Document {
        private String filename;

        public RealDocument(String filename) {
            this.filename = filename;
            loadFromDisk(); // simulazione caricamento pesante
        }

        private void loadFromDisk() {
            System.out.println("Caricamento documento: " + filename);
        }

        public void display() {
            System.out.println("Visualizzazione documento: " + filename);
        }
    }

    // Proxy che controlla l'accesso
    static class DocumentProxy implements Document {
        private RealDocument realDocument;
        private String filename;
        private String userRole;

        public DocumentProxy(String filename, String userRole) {
            this.filename = filename;
            this.userRole = userRole;
        }

        public void display() {
            if ("admin".equals(userRole)) {
                if (realDocument == null) {
                    realDocument = new RealDocument(filename);
                }
                realDocument.display();
            } else {
                System.out.println("Accesso negato: solo gli admin possono visualizzare il documento.");
            }
        }
    }

    // Metodo main per il test
    public static void main(String[] args) {
        Document doc1 = new DocumentProxy("file1.pdf", "admin");
        doc1.display();  // Accesso consentito, documento caricato e mostrato

        Document doc2 = new DocumentProxy("file2.pdf", "guest");
        doc2.display();  // Accesso negato
    }
}
