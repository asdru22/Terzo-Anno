package it.unibo.sweng.bank;

public class EmailNotificator {

	public void notify(Account account, String message) {
		System.out.println(
            String.format("REALLY REALLY sending email with text: \"%s\" to %s", message, account.getEmail()));
	}
}
