package it.unibo.sweng.bank;

public interface RemoteBankOperator {
    public boolean transfer(String destinationAccountCode, double amount);
}
