public class NewAndExistingController1 {
    public Account account {get; private set;}
    public NewAndExistingController1(){
        Id id = ApexPages.currentPage().getParameters().get('Id');
        account = (id == null) ? new Account() :
        [SELECT Name, phone, Industry FROM Account WHERE Id = :id];
    }  
    
    public PageReference save(){
        try{
            upsert(account);
        }catch(System.DmlException e){
           ApexPages.addMessages(e);
            return null;
        }
        PageReference redirectSuccess =  new ApexPages.StandardController(Account).view();
        return(redirectSuccess);
    }
}