trigger AddRelatedRecord on Account (after insert, after update) {
List<Opportunity> oppList = new List<Opportunity>();
    
    Map<Id,Account> acctsWithOpps = new Map<Id,Account>([Select Id, (Select Id From Opportunities) From Account
                                                        Where Id IN : Trigger.New]);
    for(Account a: Trigger.New){
        System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
        if(acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
            oppList.add(new Opportunity(Name = a.Name + 'Opportuinity',
                                       StageName='Prospecting',
                                       CloseDate = System.today().addmonths(1),
                                       AccountId = a.Id));
        }
               }
    if(oppList.size()>0){
        insert oppList;
    }
                    }