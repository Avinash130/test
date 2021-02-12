global with sharing class HotelRemoter11 {
    @RemoteAction
    global static List<Hotel__c> findAll() {
         return [SELECT Id, Name, Location__Latitude__s, Location__Longitude__s
                    FROM Hotel__c];
    }

}