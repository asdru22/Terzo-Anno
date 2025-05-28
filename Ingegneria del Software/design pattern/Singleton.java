public class Singleton {

    // Istanza unica creata all'avvio della classe
    private static final Singleton instance = new Singleton();

    // Variabile di esempio
    private String value;

    // Costruttore privato per impedire l'istanziazione da fuori
    private Singleton() {
        value = "default";
    }

    // Metodo statico per accedere all'unica istanza
    public static Singleton getInstance() {
        return instance;
    }

    // Getter e setter
    public String getValue() {
        return value;
    }

    public void setValue(String newValue) {
        value = newValue;
    }

    // Metodo main per testare il pattern
    public static void main(String[] args) {
        Singleton s1 = Singleton.getInstance();
        Singleton s2 = Singleton.getInstance();

        s1.setValue("nuovo valore");

        System.out.println("s1: " + s1.getValue());  // Stampa "nuovo valore"
        System.out.println("s2: " + s2.getValue());  // Anche questo stampa "nuovo valore"
        System.out.println("s1 e s2 sono la stessa istanza? " + (s1 == s2));  // true
    }
}
