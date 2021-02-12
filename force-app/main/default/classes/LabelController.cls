public class LabelController {
    @AuraEnabled
    public static String getLabel(){
        String s1 = 'Hello from Apex Controller, ' ;
            String s2 = System.Label.Expire_On;
        return s1 + s2;
    }
}