public class ContactTriggerHandler {
    public static void preventCreatePrimaryContactOnInsert(List<Contact> contactList){
        Set<Id> accountIdSet = new Set<Id>();
         map<Id, Contact> accountIdContactMap = new map<Id, Contact>();
        for(Contact contactObj:contactList){
            System.debug('');
            if(contactObj.Primary__c==true && contactObj.AccountId!=null){
                accountIdSet.add(contactObj.AccountId);
                System.debug('');
            }
        }
        if(accountIdSet!= null && accountIdSet.size()>0){
            System.debug('');
            for(Contact contObj:[select Id, Primary__c, AccountId From Contact Where AccountId in: accountIdSet 
                                 and primary__c=true]){
                accountIdContactMap.put(contObj.AccountId, contObj);
                                     System.debug('');
            }
            for(Contact contactObj:contactList){
                System.debug('');
                if(contactObj.Primary__c==true && contactObj.AccountId!=null && 
                   accountIdContactMap.get(contactObj.AccountId)!=null){
                    contactObj.addError('You can\' t create more than one Primary Contact');
                       System.debug('');
                }
                
            }
        }
    }
    public static void preventPrimaryContactOnUpdate(Map<Id,Contact> contactNewMap,Map<Id,Contact> contactOldMap){
         Set<Id> accountIdSet = new Set<Id>();
         map<Id, Contact> accountIdContactMap = new map<Id, Contact>();
        
         for(Contact contactObj:contactNewMap.values()){
             System.debug('');
            if(contactNewMap.get(contactObj.id).Primary__c!=contactOldMap.get(contactObj.Id).Primary__c 
               && contactNewMap.get(contactObj.id).Primary__c==true 
               && contactNewMap.get(contactObj.id).AccountId!=null){
                   System.debug('');
                accountIdSet.add(contactNewMap.get(contactObj.id).AccountId);
                   System.debug('');
                
            }
        }        
        if(accountIdSet!= null && accountIdSet.size()>0){
            System.debug('');
             for(Contact contObj:[select Id, Primary__c, AccountId From Contact Where AccountId in: accountIdSet 
                                 and primary__c=true]){
                                     System.debug('');
                accountIdContactMap.put(contObj.AccountId, contObj);
                                     System.debug('');
            }
            
            for(Contact contactObj:contactNewMap.values()){
                System.debug('');
            if(contactNewMap.get(contactObj.id).Primary__c!=contactOldMap.get(contactObj.Id).Primary__c 
               && contactNewMap.get(contactObj.id).Primary__c==true 
               && contactNewMap.get(contactObj.id).AccountId!=null
               && accountIdContactMap.get(contactNewMap.get(contactObj.id).AccountId)!=null){
                   System.debug('');
                contactObj.addError('You can\' t make more than one Contact as Primary.');
                   System.debug('');
            }
        }   
        }   
    }
}