public with sharing class QuickContactController {
   @AuraEnabled
    public static Account getAccount(Id accountId) {
        // Perform isAccessible() chechs here
        return [Select Name, BillingCity, BillingState FROM Account Where Id = :accountId];
    }
    @AuraEnabled
    public static Contact saveContactWithAccount(Contact contact, id accountId) {
        contact.AccountId = accountId;
        upsert contact;
        return contact;
    }
}