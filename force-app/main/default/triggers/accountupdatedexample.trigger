trigger accountupdatedexample on Account (before insert) {
    Map<Id,Account> accold = new Map<Id,Account>();
    Map<Id,Account> accnew = new Map<Id,Account>();
    
    Set<Id> keys = accold.keySet();
    List<Id> myid = new List<Id>();
    for(ID K : keys) {
        account oldvalues = accold.get(K);
        account newvalues = accnew.get(K);
        if(oldvalues.Phone != newvalues.Phone) {
           myid.add(K); 
        }
    }
    for(Contact con : [select LastName, Phone From Contact Where AccountId IN : myid]) {
        account a = accold.get(con.AccountId);
        account b = accnew.get(con.AccountId);
        con.OtherPhone = a.Phone;
        con.HomePhone = b.Phone;
    }
}