public with sharing class AccountController {
    public static List<Account> getAllActiveAccounts() {
        return [select Id, Name, Active__c FROM Account Where Active__c  = 'Yes'];

    }
}