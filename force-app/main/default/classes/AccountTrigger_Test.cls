@isTest
public class AccountTrigger_Test {
    @isTest static void TestCreateNewAccountInBulk(){
        // Test Setup data
        // Create 200 new Accounts
        List<Account> accts = new List<Account>();
        for(integer i=0; i<200; i++) {
            Account acct = new Account(
            Name='Test Account' + i);
            accts.add(acct);
        }
        Test.startTest();
        insert accts;
        Test.stopTest();
        // Verify that 200 new Accounts were inserted
        List<Account> VerifyAccount = [select id from account];
        System.assertEquals(200, VerifyAccount.size());
        // Also verify that 200 new Opportunities were inserted
        List<Opportunity> VerifyOpportunity = [select id from opportunity];
        System.assertEquals(200, VerifyOpportunity.size());
    }

}