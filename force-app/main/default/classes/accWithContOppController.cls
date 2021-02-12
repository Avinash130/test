public class accWithContOppController {
@AuraEnabled 
    public static List<Account> fetchAccount() {
        // query 10 records from account with their relevant contacts and opportunities return query.
        List<Account> lstOfAcc = [Select Name, AnnualRevenue, BillingState, (Select LastName From Contacts), (Select Name From Opportunities) From Account Limit 10];
        return lstOfAcc;
    }
}