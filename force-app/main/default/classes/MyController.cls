public with sharing class MyController {
  
   
    public Account getAccount() {
        return [select id, name from account
               where id = :ApexPages.currentPage().getParameters().get('id')];
    }
    public PageReference save() {
        return null;
    }
    public String getName() {
        return 'MyCotroller';
    }
}