package it.unibo.sweng.bank;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

import static org.mockito.Mockito.*;

public class AccountTest {

    final static double EPSILON = 1E-5;

    @BeforeEach
    public void setTesting(){
        Configuration.getConfiguration().setTesting(true);
    }

    @Test
    public void makeTransferSuccessful() {

        Notificator fakeNotificator = mock(Notificator.class);
        RemoteBankOperator fakeRemoteBankOperator = mock(RemoteBankOperator.class);
        when(fakeRemoteBankOperator.transfer(anyString(),anyDouble())).thenReturn(true);

        Account account = Account.builder()
                .setOwner("Superpippo")
                .setEmail("super@pippo.com")
                .setBalance(1000)
                .setNotificator(fakeNotificator)
                .setRemoteBankOperator(fakeRemoteBankOperator)
                .build();

        boolean success = account.makeTransfer("24", 300);
        double balance_left = account.getBalance();

        assertTrue(success);
        assertEquals(700, balance_left, EPSILON);
    }
}
