public class afterupdateopptrigg {
    public static void afterupdate(map<Id,Opportunity> oldMap,map<Id,Opportunity> newMap){
        List<opportunity> oppt = new List<opportunity>();
        User u = [Select Id, Name From User Where Alias = 'akumar'];
        for(Id Key : oldMap.keyset()) {
            Opportunity oldopt = oldMap.get(Key);
            Opportunity newopt = newMap.get(key);
        }
    }
}