public class MerchandiseController {
 
    public List<Merchandise__c> getAllMerchandise(){
          List<Merchandise__c> theMerchandise = 
              [SELECT Name, Price__c FROM Merchandise__c LIMIT 10000];
        return(theMerchandise);
    }
}