trigger Accountcountcontacts on Contact (after insert, after update, after delete, after undelete) {
    Set<Id> acctids = new Set<Id>();
    List<Contact> contacts = new List<Contact>();
    for(Contact con : trigger.isDelete ? trigger.old : trigger.new) {
        if(con.accountId != null) {
            acctids.add(con.accountId);
        }
    }
    List<Account> lstacct = new List<Account>();
    for(aggregateresult ar : [select accountid accid, count(id) contactcount from contact where accountid in : acctids group by accountid]) {
        Account a = new Account();
        a.Id = (Id)ar.get('accid');
        a.Number_of_Contacts__c = (decimal)ar.get('contactcount');
        lstacct.add(a);
    }
   update lstacct;
}