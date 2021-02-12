public class MutlipicklistFieldValue {
    public MutlipicklistFieldValue () {   
    }
    public void insertAccount() {
       Account acc = new Account();
        acc.Name = 'Testing Multipicklist Value';
        string values = 'A;B;C';
        acc.Test_MultiSelect__c = values;
        insert acc;
        System.debug('acc' + acc);
    }

}