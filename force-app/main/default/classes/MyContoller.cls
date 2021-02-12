public class MyContoller {
    private final Account account;
    public MyContoller(){
        account = [SELECT Id, Name, Site FROM Account WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
        
    }

    public Account getAccount(){
        return account;
        
    }
    public PageReference save(){
        update account;
        return null;
    }
}