trigger UpdateSalesRep on Account (before insert, before update) {
    Set<Id> setAccowner = new Set<Id>();
    for(Account Acc : Trigger.New) {
        setAccowner.add(Acc.OwnerId);
    }
    
    Map<Id, user> usermap = new Map<Id, user>([SELECT Name FROM user WHERE Id IN: setAccowner]);
    for(Account Acc : Trigger.New) {
        User usr = usermap.get(Acc.OwnerId);
        Acc.Sales_Rep__c = usr.Name;
    }

}