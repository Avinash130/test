@isTest
public class MixedDMLFutureTest {
    @isTest static void test1(){
        User thisUser = [SELECT Id FROM User WHERE ID = :UserInfo.getUserId()];
        System.runAs(thisUser){
        Test.startTest();
        MixedDMLFuture.useFutureMethod();
        Test.stopTest();
        }    
        
        Account[] accts = [SELECT Id From Account Where Name='Acme'];
        System.assertEquals(1, accts.size());
        
        User[] users = [SELECT Id From User Where username='mruiz@awcomputing.com'];
                  System.assertEquals(1, users.size());
    }
    
}