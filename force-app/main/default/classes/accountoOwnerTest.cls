@isTest
public class accountoOwnerTest {
 @isTest
    static void testme() {
        User u = [Select Id From User Where UserName = 'avinash1@salesforce.com'];
        Integer count = [Select COUNT() From Account];
        Account a = new Account(Name='Test',Industry='Education');
        try{
            insert a;
        } Catch(Exception e){
            System.debug(e);
        }
        Integer size = [Select COUNT() FROM Account];
        System.assertEquals(size, count + 1);
        Account acc = [Select Id, OwnerId FROM Account Where Id = :a.Id];
        System.assertEquals(acc.OwnerId, u.Id);
    }
}