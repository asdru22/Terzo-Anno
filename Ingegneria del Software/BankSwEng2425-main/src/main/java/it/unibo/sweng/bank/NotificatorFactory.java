package it.unibo.sweng.bank;

public class NotificatorFactory {
    private static final NotificatorFactory INSTANCE = new NotificatorFactory();

    // classe non istanziabile
    private NotificatorFactory() {}

    public static NotificatorFactory getInstance() {
        return INSTANCE;
    }

    public Notificator create(){
        return Configuration.getConfiguration().isTesting() ? new FakeNotificator() : new EmailNotificator();
    }

}
