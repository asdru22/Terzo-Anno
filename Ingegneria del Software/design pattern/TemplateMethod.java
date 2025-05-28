public class TemplateMethod {

    static abstract class BevandaCalda {
        public final void prepara() {
            bolleAcqua();
            infusione();
            versaInTazza();
            aggiungiCondimenti();
        }

        private void bolleAcqua() {
            System.out.println("Bollendo l'acqua...");
        }

        private void versaInTazza() {
            System.out.println("Versando nella tazza...");
        }

        protected abstract void infusione();
        protected abstract void aggiungiCondimenti();
    }

    static class Te extends BevandaCalda {
        @Override
        protected void infusione() {
            System.out.println("Infondendo la bustina di tè...");
        }

        @Override
        protected void aggiungiCondimenti() {
            System.out.println("Aggiungendo limone...");
        }
    }

    static class Caffe extends BevandaCalda {
        @Override
        protected void infusione() {
            System.out.println("Filtrando il caffè...");
        }

        @Override
        protected void aggiungiCondimenti() {
            System.out.println("Aggiungendo zucchero e latte...");
        }
    }

    public static void main(String[] args) {
        BevandaCalda te = new Te();
        te.prepara();
        System.out.println();

        BevandaCalda caffe = new Caffe();
        caffe.prepara();
    }
}
