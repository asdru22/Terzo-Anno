package it.unibo.sweng.bank;

public class RemoteBankOperatorFactory {
    private static final RemoteBankOperatorFactory INSTANCE = new RemoteBankOperatorFactory();

    // classe non istanziabile
    private RemoteBankOperatorFactory() {}

    public static RemoteBankOperatorFactory getInstance() {
        return INSTANCE;
    }

    public RemoteBankOperator create(){
        return Configuration.getConfiguration().isTesting() ? new FakeRemoteBankOperator() : new SETRemoteBankOperator();
    }

}
