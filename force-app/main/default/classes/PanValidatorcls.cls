public class PanValidatorcls {
 public String myPan {get; set;}
 public List<Lead> leadList {get; set;}
 public List<Lead> nullleadList{get; set;}
 public Lead le{get; set;}
 public integer count{get; set;}
 
 Boolean flag;
 
    public PanValidatorcls(ApexPages.StandardController controller) {
          le = (Lead)controller.getRecord();
      }
    
 public PanValidatorcls(){
 
 }
    
public PageReference displayInvalidPan(){
 leadList = [Select Id, PAN__c From Lead Where PAN__c!=null OR PAN__c!=''];
 return null;
 }
 public PageReference displayNullPan(){
 nullleadList = [Select Id, PAN__c From Lead Where PAN__c=null OR PAN__c=''];
 return null;
 } 
}