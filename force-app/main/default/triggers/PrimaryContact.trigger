trigger PrimaryContact on Contact (after insert,after update) {

    set<Id> getid = new set<Id>();
    string contactId;
    List<Contact> conList = new List<Contact>();
    
    //Trigger Functionality
    if(Trigger.isUpdate && Trigger.isInsert){
        
        for(Contact cont : Trigger.New){
            if(cont.Primary__c==true){
                getid.add(cont.AccountId);
            }
        }
    }
    
    // Fetching the other contact which has primary__c has checked
    
    List<Contact> cList = [select id, Primary__c from contact where accountId in : getid
                            AND Primary__c=true];
    // Uncheking the already checked primary__c
    
    if(cList.size()>0){
        
        for(Contact newClst: cList){
            if(newClst.id!=contactId){
                newClst.Primary__c=false;
                conList.add(newClst);
            }
        }
    }
    update conList;
}