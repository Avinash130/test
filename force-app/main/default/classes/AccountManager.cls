@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
  @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accountId  = request.requestURI.substringBetween('Accounts/','/contacts');
        System.debug(accountId);
        Account objAccount = [Select Id,Name,
                              (select Id,name from contacts) 
                              from Account 
                              Where Id = :accountId
                              LIMIT 1];
        return objAccount;
        
    }
}