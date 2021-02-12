trigger SoqlTriggerNotBulk on Account (after update) {
    for(Account a : Trigger.new){
        Opportunity[] opps = [SELECT Id, name, closedate 
                              FROM Opportunity Where AccountId = :a.Id];
    }
}