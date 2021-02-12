global class AccountBatch1 implements database.Batchable<sObject> {
    global final String Query;
    global final String Entity;
    global final String Field;
    global final String Value;
    
    global AccountBatch1(String q){
        Query = q;
        }
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(query);
    }
    
     global void execute(Database.BatchableContext BC,List<sObject> scope)
   {
         List<Account> updateAccts = new List<Account>();
      for(Sobject s : scope)
      {
          Account a = (Account) s;
          a.Name = a.Name + 'Batch 1.';
      }     
      update updateAccts;
   }
    
    global void finish(Database.BatchableContext BC) {
        
    }
}