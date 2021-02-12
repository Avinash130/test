global class CustomerBatch implements
 Database.Batchable<sObject> {
     public string myname;
     
     global CustomerBatch(string myname) {
         this.myname = myname;
     }
     global database.QueryLocator start(Database.BatchableContext bc) {
         return Database.getQueryLocator('select id, Account_Type__c FROM Account WHERE Name=' +myname);
     }
     global void execute(Database.BatchableContext BC, List<Customer__c> scope) {
         List<Customer__c> cust = new List<Customer__c>();
         for(Customer__c c : cust) {
             c.Account_Type__c = 'Saving';
             cust.add(c);
         }
         update cust;
     }
     global void finish(Database.BatchableContext BC) {
         
         Messaging.SingleEmailMessage myemail = new Messaging.SingleEmailMessage();
         
         String[] toadd = new String[] {'avinash1.dpcb@gmail.com'};
             myemail.setToAddresses(toadd);
         myemail.setSubject('Batchproccessed');
         myemail.setPlainTextBody('Batch completed successfully');
         Messaging.sendEmail(new Messaging.SingleEmailMessage[]{myemail});
     }
 }