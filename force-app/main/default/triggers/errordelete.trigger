trigger errordelete on Account (before delete) {
  Set<Id> acctId = new Set<Id>();
    for(account a : trigger.old) {
        acctId.add(a.Id);
    }
    map<Id,Account> accounts = new Map<Id,Account>([select Id, Name, (select LastName, FirstName From Contacts) From Account Where Id IN : acctId]);
    for(Account acc : trigger.old) {
        if(accounts.get(acc.Id).contacts.size()>=2) {
            acc.addError('You can not delete this account record');
        }
    }
}