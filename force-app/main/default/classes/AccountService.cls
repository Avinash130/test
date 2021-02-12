public with sharing class AccountService {
    public Account createAccount( String accountName, String accountNumber, String tickerSymbol ) {
        Account newAcct = new Account(
        Name = accountName,
            AccountNumber = accountnumber,
            TickerSymbol = accountNumber
        );
        return newAcct;
    }
}