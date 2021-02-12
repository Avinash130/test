trigger AccountDeletion on Account (before insert) {
     
    for(Account a : [select Id From Account
                    Where Id IN (Select AccountId From Opportunity) AND
                    Id IN : trigger.old]) {
                        trigger.oldMap.get(a.Id).addError('Cannot delete account with related opportunities.');
        
    }
}