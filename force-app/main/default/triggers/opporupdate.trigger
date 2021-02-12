trigger opporupdate on Opportunity (before update) {
    Map<Id,Opportunity> oppOld = trigger.oldMap;
    Map<Id,Opportunity> oppNew = trigger.newMap;
    Set<Id> keys = oppOld.keySet();
    for(Id rid : keys) {
        Opportunity oldopt = oppOld.get(rid);
        Opportunity newopt = oppNew.get(rid);
        if(oldopt.StageName != 'Closed Won' && newopt.StageName == 'Closed Won') {
            newopt.CloseDate = System.today();
            newopt.Type = 'New Customer';
        }
    }
}