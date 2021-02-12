trigger City_Opportunity on Account (after update) {
   List<Opportunity> oppor = new List<Opportunity>();
    for(Opportunity opp : [select id, Stagename, CloseDate, City__c From Opportunity]) {
        for(Account a : trigger.old) {
            if(a.City__c == 'Hyderabad') {
                opp.City__c = 'Mumbai';
                oppor.add(opp);
            }
        }
    }
    update oppor;

}