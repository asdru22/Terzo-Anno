public class Decorator {

    // Interfaccia base
    interface Notifier {
        void send(String message);
    }

    // Componente concreto
    static class SimpleNotifier implements Notifier {
        public void send(String message) {
            System.out.println("Messaggio inviato: " + message);
        }
    }

    // Decorator astratto
    static abstract class NotifierDecorator implements Notifier {
        protected Notifier wrapped;

        public NotifierDecorator(Notifier notifier) {
            this.wrapped = notifier;
        }

        public void send(String message) {
            wrapped.send(message);
        }
    }

    // Decoratore concreto: aggiunge logging
    static class LoggingNotifier extends NotifierDecorator {
        public LoggingNotifier(Notifier notifier) {
            super(notifier);
        }

        public void send(String message) {
            System.out.println("[LOG] Invio del messaggio: " + message);
            super.send(message);
        }
    }

    // Decoratore concreto: converte il messaggio in maiuscolo
    static class UppercaseNotifier extends NotifierDecorator {
        public UppercaseNotifier(Notifier notifier) {
            super(notifier);
        }

        public void send(String message) {
            super.send(message.toUpperCase());
        }
    }

    // Metodo main per il test
    public static void main(String[] args) {
        Notifier simple = new SimpleNotifier();

        Notifier logged = new LoggingNotifier(simple);
        Notifier upperAndLogged = new UppercaseNotifier(logged);

        System.out.println("== Notifier base ==");
        simple.send("ciao");

        System.out.println("\n== Notifier con logging ==");
        logged.send("ciao");

        System.out.println("\n== Notifier con logging + uppercase ==");
        upperAndLogged.send("ciao");
    }
}
