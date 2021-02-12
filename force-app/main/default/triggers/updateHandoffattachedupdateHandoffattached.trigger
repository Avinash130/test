trigger updateHandoffattachedupdateHandoffattached on Top_X_Designation__c (after insert, after update, after delete) {
   Map<Id, Top_X_Designation__c> maptop = new Map<Id, Top_X_Designation__c>();
    Set<Id> oppId = new Set<Id>();
    Map<Id, Top_X_Designation__c> maptopfalse = new Map<Id, Top_X_Designation__c>();
    Set<Id> oppIdfalse = new Set<Id>();
    List<Opportunity> opplist = new List<Opportunity>();
    List<Opportunity> opptoupdate = new List<Opportunity>();
    Opportunity opp = new Opportunity();
    if(Trigger.isAfter) {
        if(trigger.isInsert || trigger.isDelete) {
            for(Top_X_Designation__c top : trigger.New) {
                 if(top.Document_Attached__c == true && ((top.Type__c=='Contract Flow Down') || (top.Type__c=='Handoff'))) {
                       top.put(top.OppLookUp__c, top);                                                   
                                                                          }
            }
        }
    }
}