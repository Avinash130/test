public class myClass {
    public void init(){
        Id id = ApexPages.currentPage().getParameters().get('0016F00003RbAnPQAV');
        Account obj = [select id, Name FROM Account WHERE id= :id];
        delete obj;
        return;
    }

}