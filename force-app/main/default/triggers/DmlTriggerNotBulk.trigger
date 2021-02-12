trigger DmlTriggerNotBulk on Account (after update) {
    List<Opportunity> relatedOpps = [select id, name, probability from opportunity
                                    Where AccountId IN : Trigger.New];
    for(Opportunity opp : relatedOpps){
        if((opp.Probability>=50) && (opp.Probability<100)){
            opp.Description = 'New Description for Opportunity';
            update opp;
        }
    }

}