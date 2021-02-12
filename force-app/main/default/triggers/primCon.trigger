trigger primCon on Contact ( before update, before insert) {
   List<Id> accounts=new List<Id>();
   
    for(contact c: Trigger.New){
        if( c.AccountId!=Null)
            accounts.add(c.AccountId);
            
    }
        List<contact> contacts= [select id, phone from contact WHERE Primary__c= true AND AccountId IN:accounts];
  
         
    for(contact c:trigger.New){
        if(c.Primary__c==true){
             for(contact con: contacts){
                con.Primary__c=false;
                
               
            }
            update contacts;
          
        }
       
    }
       }