package it.unibo.sweng.bank;

public class SETRemoteBankOperator {

	//perform a transaction with a remote back using the SET protocol
	public boolean transfer(String destinationAccountCode, double amount) {
		System.out.println(String.format("REALLY REALLY transferring %f to %s using SET", amount, destinationAccountCode));
		return true;
	}
}
