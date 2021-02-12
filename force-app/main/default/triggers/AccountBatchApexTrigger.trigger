trigger AccountBatchApexTrigger on Account (after insert) {
List<Account> lstAccount = new List<Account>();
    for(Account acc : trigger.New) {
        if(acc.Type.equals('Customer - Direct')) {
            lstAccount.add(acc);
        }
    }
    if(lstAccount.size() > 0) {
        AccountBatchApex51 abs51 = new AccountBatchApex51();
        Database.executeBatch(abs51, 200);
    }
}