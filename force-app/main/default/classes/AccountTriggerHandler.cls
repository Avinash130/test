public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accts) {
        for(Account a : accts) {
            if(a.ShippingState != a.billingState) {
                a.ShippingState = a.BillingState;
            }
        }
    }

}