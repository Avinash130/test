public class componentController {
    
    @AuraEnabled
    public static List<Map<String, Object>> findAccountAges(List<String> emails) {
        List<Map<String, Object>> ret = new List<Map<String, Object>>();
        List<Contact> contacts = [SELECT Name, Account.Name, Account.createdDate
                                 FROM Contact
                                 WHERE Contact.Email IN : emails];
        for(Contact c : contacts) {
            Map<String, Object> item = new Map<String, Object>();
            item.put('name', c.Account.Name);
            item.put('age',
                    Date.valueOf(c.Account.createdDate).daysBetween(
                    System.Date.today()));
            ret.add(item);
        }
        return ret;
    }
    
    @AuraEnabled
    public static List<Map<String, Object>> findOpportunityCloseDateTime(List<String> emails) {
        List<Map<String, Object>> ret = new List<Map<String, Object>>();
        List<OpportunityContactRole> contacts = [Select Opportunity.Name, Opportunity.CloseDate
                                               FROM OpportunityContactRole
                                               WHERE isPrimary=true AND Contact.Email IN : emails];
        for(OpportunityContactRole c : contacts) {
            Map<String, Object> item = new Map<String, Object>();
            item.put('name', c.Opportunity.Name);
            item.put('closeIn', System.Date.Today().daysBetween(
            Date.valueOf(c.Opportunity.CloseDate)));
            ret.add(item);
        }
        return ret;
    }
}