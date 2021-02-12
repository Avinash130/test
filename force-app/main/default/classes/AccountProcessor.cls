public class AccountProcessor {
    @future(callout=true)
    public static void countContacts(Set<Id> setId) {
        List<Account> lstAccount = [Select id,Number_of_Contacts__c,(select id from contacts) from Account
                                   Where id in : setId];
        for(Account acc:lstAccount) {
            List<Contact> lstCont = acc.Contacts;
            acc.Number_of_Contacts__c = lstCont.size();
        }
        update lstAccount;
    }

}