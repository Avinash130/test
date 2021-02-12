public class CampingListController {
  @AuraEnabled 
    public static List<Camping_Item__c> getItems() {
        List<Camping_Item__c> campingItems = [SELECT Id,Name,Price__c,Packed__c,Quantity__c FROM Camping_Item__c];
        //return the list of camping items
        return campingItems;
    }
    @AuraEnabled
   public static void saveItem (Camping_Item__c campingItem) {
        //insert the campingItem record
        insert campingItem;
    }
}