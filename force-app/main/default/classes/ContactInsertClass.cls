public class ContactInsertClass {
    @AuraEnabled
    
    public static contact insertContact(String parentAccountId, String FirstName1, String lastName1) {
        System.debug('Test');
        Contact con = new Contact();
        con.FirstName = FirstName1;
        con.LastName = LastName1;
        con.AccountId = parentAccountId;
        insert con;
        return con;
    }
    
}