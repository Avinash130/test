public class MyMapController {
  @AuraEnabled
    public static Map<String,String> getMyMap(){
        Map<String,String> newMap = new Map<String,String>();
        newMap.put('key1', 'Apple');
        newMap.put('key2', 'Mango');
        return newMap;
    }
}