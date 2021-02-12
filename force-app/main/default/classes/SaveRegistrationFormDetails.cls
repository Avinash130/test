public class SaveRegistrationFormDetails {

    @AuraEnabled
    public static Id SaveRegistraionDetails(Registration_Form__c regForm) {
     insert regForm;
        return regForm.Id;
    }
    
    @AuraEnabled
    public static Id SaveEducationalDetails(Educational_Detail__c EduDet) {
        insert EduDet;
        return EduDet.Id;
    }   
}