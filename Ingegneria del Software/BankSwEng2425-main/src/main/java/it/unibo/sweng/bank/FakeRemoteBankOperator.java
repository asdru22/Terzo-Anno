package it.unibo.sweng.bank;

public class FakeRemoteBankOperator implements RemoteBankOperator {
    @Override
    public boolean transfer(String destinationAccountCode, double amount) {
        return true;
    }
}
