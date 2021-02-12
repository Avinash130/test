/* 
 * Source : SfdcMonkey.com
 * Date : 9/20/2019
 * API : 46.0
*/
public class customActivityCtrl {
    @AuraEnabled 
    public static List<task> fetchTask(){
        return [SELECT Id,Subject,Description,ActivityDate,Who.Name,WhoId,Priority
                FROM Task
                LIMIT 20];
    }
}