trigger accountowner on Account (before insert) {
  User u = [Select Id From User Where UserName = 'avinash1@salesforce.com'];
    for(Account a : Trigger.New) {
        if(a.Industry == 'Education') {
            a.OwnerId = u.Id;
        }
    }
}