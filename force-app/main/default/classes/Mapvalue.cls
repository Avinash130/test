public class Mapvalue {
    @AuraEnabled     // Method must be AuraEnabled in apex
    public static map<string,string> getmymap()
    {
        map<string,string> putkeyvalue= new map<string,string>();
        putkeyvalue.put('key1', 'Value1');
         putkeyvalue.put('key2', 'Value2');
         putkeyvalue.put('key3', 'Value3');
        return putkeyvalue;
    }

}