trigger Opportunitystageclosedwon_updatesaccountrating on Opportunity (after insert,before update, after update) {
    List<Account> accts = new List<Account>();
    for(Account acc  :[select Name, rating From Account]){
        for(Opportunity opp : trigger.new) {
            if(opp.StageName == 'Closed Won') {
                acc.Rating = 'Hot';
                accts.add(acc);
            }
        }  
    }
    update accts;
    for(Account acc  :[select Name, Type From Account]){
        for(Opportunity opp : trigger.old){
            if(opp.StageName == 'Closed Won'){
                
                acc.Type.addError('You can not changet the Type');
            }
            
        }
    } 

}