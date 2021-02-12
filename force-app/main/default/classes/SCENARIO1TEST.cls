@isTest
public class SCENARIO1TEST {
@isTest
    static void test(){
    integer count = [SELECT Count() FROM Account];
        Account a1 = new Account(Name='aaa', Industry='Banking');
        try{
            insert a1;
        }catch(Exception e){
            System.debug(e);
        }
        Integer size = [select count() from account];
        System.assertEquals(COUNT+1,size);
        Account acc = [select id,annualrevenue from account where id= :a1.Id];
        System.assertEquals(acc.AnnualRevenue, 50000);
    }
}