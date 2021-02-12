public class NewAccounts {
    public static void sObjectsInsert(Integer value){
       Integer counter = 1;
        //create a list to add our accounts
        List<Account> teaFactoryAccounts = new List<Account>();
        
        while(counter <= value){
            // display the current counter value
            System.debug('Counter Value Before Incrementing ' + counter);
            
            //create a new Account
            Account store = new Account();
            store.Name = 'The Tea Factory' + counter;
            store.AccountNumber = '35629' + counter;
            teaFactoryAccounts.add(store);
            System.debug('teaFactoryAccounts');
            
            //increment the counter
            counter = counter + 1;
            System.debug('Counter Value After Incrementing ' + counter);
            
        }    
        System.debug('Size Of Account List:'  + teaFactoryAccounts.size()); 
        System.debug('Elements in Account List: ' + teaFactoryAccounts);
        insert teaFactoryAccounts;
        
        }
    }