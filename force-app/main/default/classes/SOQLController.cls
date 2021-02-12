public class SOQLController {
    public String name {
        get { return name;}
        set { name = value;}
    }
    public PageReference query() {
        String queryName = '%' + name + '%';
       List<Contact> queryResult = [SELECT Id FROM Contact WHERE
                                   (IsDEleted = false and Name Like :queryName)];
        return null;
    }
}