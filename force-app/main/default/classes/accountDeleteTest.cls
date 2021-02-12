@isTest
private class accountDeleteTest {
 @isTest
    static void testMe(){
        Account a1=new Account(Name='Test');
        insert a1;
        Contact c1=new Contact(LastName='test',accountId=a1.id);
        insert c1;
        Account a2=new Account(name='Demo');
        insert a2;
        Integer myCount=[select count() from Account];
        try{
            delete a1;
        }catch(Exception e){
            System.debug(e);
        }
        Integer count=[select count() from Account];
        System.assertEquals(count,mycount);
        try{
            delete a2;
        }catch(Exception e){
            System.debug(e);
        }
        Integer size=[select count() from Account];
        System.assertEquals(size,mycount-1);
    }
}