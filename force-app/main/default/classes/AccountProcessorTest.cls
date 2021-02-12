@isTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest() {
        Account a = new Account(Name='Test Account');
        insert a;
        
        Contact c=new Contact(LastName='Bob',
                             FirstName='Masters',
                             AccountId=a.Id);
        insert c;
        
        set<Id> setAccId = new set<Id>();
        setAccId.add(a.Id);
        
        Test.startTest();
         AccountProcessor.countContacts(setAccId);
        Test.stopTest();
        
        Account acc = [select Number_of_Contacts__c from Account where id = :setAccId LIMIT 1];
        System.assertEquals(Integer.valueOf(acc.No_of_Contacts__c), 1);
    }
}