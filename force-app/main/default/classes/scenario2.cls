@isTest
private class scenario2 {
@isTest
    static void testme(){
        integer count = [select count() from account];
        Account a = new Account(Name='aaa');
        try{
            insert a;
        }catch(Exception e){
            System.debug(e);
        }
        Integer size = [select count() from account];
        System.assertEquals(count, size);
    }
}