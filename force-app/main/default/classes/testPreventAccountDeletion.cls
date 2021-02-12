@isTest
public class testPreventAccountDeletion {

    static testmethod void testPreventAccDel() {
        Account accRecord = new Account(Name='testAccount');
        insert accRecord;
        
        try{
            delete accRecord;
        }
                catch (Exception e) {
                    System.assert(e.getMessage().contains('Account can not be deleted'), 'Account can not be deleted');
                }
            }
        }