public class classController {
// crate properties in apex class
    @AuraEnabled public String DeveloperName {get;set;}
    @AuraEnabled public integer DeveloperAge {get;set;}
    @AuraEnabled public String DeveloperPhone {get;set;}
    @AuraEnabled public String DeveloperEmail {get;set;}
    @AuraEnabled public List<Account> lstOfAccount {get;set;}
    
    @AuraEnabled 
    public static classController initClass() {
        // create class instance
        classController obj  = new classController();
        obj.DeveloperName = 'Avinash Kumar';
        obj.DeveloperAge = 25;
        obj.DeveloperPhone = '9818568678';
        obj.DeveloperEmail = 'test1.dp@gmail.com';
        
        // query accounts list for lstOfAccount property
        obj.lstOfAccount = [select Id, Name, Phone, Email__c, Industry FROM Account LIMIT 10];
        return obj;
    }
}