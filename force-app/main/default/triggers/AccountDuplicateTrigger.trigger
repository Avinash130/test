trigger AccountDuplicateTrigger on Account (before insert, before update) {
    Map<String,Account> accountmap = new Map<String,Account>();
    
    for(Account acc : Trigger.New) {
        if((acc.Name != null) && (trigger.isInsert || trigger.isUpdate || (acc.Name != trigger.oldmap.get(acc.Id).Name))){
            if(accountmap.containsKey(acc.Name)) {
                acc.Name.addError('Account name already exists');
            } else {
                accountmap.put(acc.Name, acc) ; 
            }
        }
    }
    for(Account acc: [select Id, Name FROM Account Where Name IN : accountmap.keySet()]) {
        account acctmap = accountmap.get(acc.Name);
        acctmap.Name.adderror('Account with this name already exixts');
    }
}