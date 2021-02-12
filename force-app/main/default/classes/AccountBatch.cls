global class AccountBatch implements Database.Batchable<sObject> {
     
    global Database.QueryLocator start(Database.BatchableContext BC) {
        
        String query = 'select id, name from account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        for(Account acc : scope) {
            acc.name = 'Mr'+acc.name;
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc) {
        // finish
    }
}