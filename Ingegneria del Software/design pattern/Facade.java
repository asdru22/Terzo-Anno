public class Facade {

    // CLASSI DEL SOTTOSISTEMA
    static class LettoreDVD {
        public void accendi() { System.out.println("Lettore DVD acceso"); }
        public void riproduci(String film) { System.out.println("Riproduzione del film: " + film); }
    }

    static class Proiettore {
        public void accendi() { System.out.println("Proiettore acceso"); }
        public void impostaModalita(String modalita) { System.out.println("Modalità proiezione: " + modalita); }
    }

    static class Amplificatore {
        public void accendi() { System.out.println("Amplificatore acceso"); }
        public void impostaVolume(int volume) { System.out.println("Volume impostato a: " + volume); }
    }

    // FACADE
    static class HomeTheaterFacade {
        private final LettoreDVD dvd;
        private final Proiettore proiettore;
        private final Amplificatore amplificatore;

        public HomeTheaterFacade(LettoreDVD dvd, Proiettore proiettore, Amplificatore amplificatore) {
            this.dvd = dvd;
            this.proiettore = proiettore;
            this.amplificatore = amplificatore;
        }

        public void guardaFilm(String film) {
            System.out.println("Preparazione alla visione del film...");
            proiettore.accendi();
            proiettore.impostaModalita("cinema");
            amplificatore.accendi();
            amplificatore.impostaVolume(7);
            dvd.accendi();
            dvd.riproduci(film);
        }
    }

    // CLIENT
    public static void main(String[] args) {
        LettoreDVD dvd = new LettoreDVD();
        Proiettore proiettore = new Proiettore();
        Amplificatore amplificatore = new Amplificatore();

        HomeTheaterFacade homeTheater = new HomeTheaterFacade(dvd, proiettore, amplificatore);
        homeTheater.guardaFilm("Inception");
    }
}
