public class AccountDataTable {
  @AuraEnabled
    public static List<Account> getAccount() {
        List<Account> accountList = new List<Account>();
        for(Account acc : [Select Name, Industry, Type, VIP_Account__c FROM Account ORDER By LastModifiedDate DESC LIMIT 20]) {
            accountList.add(acc);
        }
        return accountList;
    }
}