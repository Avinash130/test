public class MyContactsController {
    @AuraEnabled
    public static List<Contact> getContacts(List<Id> accountIds) {
        List<Contact> contactList = [Select Id, Name, AccountId, phone, Email from Contact where AccountId IN : accountIds];
        return contactList;
    }

}