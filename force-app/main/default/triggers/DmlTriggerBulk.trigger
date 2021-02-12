trigger DmlTriggerBulk on Account (after update) {
List<Opportunity> relatedOpps = [select id, name, probability from opportunity
                                where AccountId IN : Trigger.New];
    List<Opportunity> oppsToUpdate = new List<Opportunity>();
    for(Opportunity opp : relatedOpps){
        if(opp.Probability>=50 && opp.Probability<100){
            opp.Description = 'New Description for opportunity';
            oppsToUpdate.add(opp);
        }
    }
    update oppsToUpdate;
}