public class TestMyBatch {
    public string cname{get;set;}
    public pageReference show() {
        CustomerBatch mybatch = new CustomerBatch(cname);
        Id id = Database.executeBatch(mybatch, 400);
        System.debug('My job id' + id);
        PageReference pageRef = new PageReference(id);
        return pageRef;
        
        
    }

}