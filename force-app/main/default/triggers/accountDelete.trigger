trigger accountDelete on Account (before delete) {
List<Account> lstAccount = [Select id,Name,(Select Id FROM Contacts) FROM Account WHERE Id IN : Trigger.Old];
    for(Account a : lstAccount) {
        if(a.contacts.size() > 0) {
            a.addError('You can not delete this Account');
        }
    }
}