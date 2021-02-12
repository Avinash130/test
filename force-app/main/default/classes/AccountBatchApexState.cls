global class AccountBatchApexState implements Database.Batchable<sObject>, Database.Stateful {
    global integer numberofDirectCustomers = 0;
    
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String q = 'select Name, AccountNumber, Type From Account';
        return Database.getQueryLocator(q);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> acc) {
        for(Account a : acc) {
            if(a.Type.equals('Customer - Direct')) {
               numberofDirectCustomers++;
            }
        }
    }
    global void finish(Database.BatchableContext bc) {
        
    }

}