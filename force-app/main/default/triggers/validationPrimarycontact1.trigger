trigger validationPrimarycontact1 on Contact (before Insert,after update) {
    List<Contact> acclist = new List<Contact>();
set<Id> accIdSet = new set<Id>();
Set<Id> ContactIds = new Set<Id>();
if(Trigger.IsUpdate){
for ( Contact s : trigger.new ){
        if(s.AccountId != null)
        accIdSet.add(s.AccountId);   
        Contact oldcon = Trigger.oldMap.get(s.Id);       
        if(oldcon.id != null)
        ContactIds.add(oldcon.id);
       
                                }

acclist=[select id, name,Account.name,Primary__c from Contact where AccountId IN : accIdSet AND Id NOT IN : ContactIds];

system.debug('*******Runish'+acclist);

List<Contact> conlist=new List<Contact>();
Contact c1=new Contact();
    
        for ( Contact s : Trigger.new)

             {         
            if(s.Primary__c ==true)
                {
                  for(Contact a :acclist)
                      {
                         a.Primary__c =false;
                         c1=a;            
                      }
          
                    update c1; 
                }  
              }
           update acclist;
                       }
        
        
      ////next is trigger for after insert
        
        
        if(Trigger.isInsert){
                for ( Contact s : trigger.new ){
                        if(s.AccountId != null)
                        accIdSet.add(s.AccountId);   
                        Contact oldcon = Trigger.newMap.get(s.Id);       
                        if(oldcon.id != null)
                        ContactIds.add(oldcon.id);
       
                                                }

acclist=[select id, name,Account.name,Primary__c from Contact where AccountId IN : accIdSet AND Id NOT IN : ContactIds];

system.debug('*******Runish'+acclist);

List<Contact> conlist=new List<Contact>();
Contact c1=new Contact();

for ( Contact s : Trigger.new)
         {      
            if(s.Primary__c ==true)
                {
                  for(Contact a :acclist)
                          {
                             a.Primary__c =false;
                              c1=a;            
                          }
                     update c1; 
        
        }  
        
       }
       update acclist;
       }
        
        }