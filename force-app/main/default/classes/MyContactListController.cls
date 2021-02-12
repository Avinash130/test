public class MyContactListController {
 @AuraEnabled
    public static List<Contact> getContacts(Id recordId) {
        return [select Id, FirstName, LastName, Email, Phone From Contact Where AccountId = :recordId];
    }
}