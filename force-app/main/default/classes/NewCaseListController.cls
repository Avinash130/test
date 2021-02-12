public class NewCaseListController {

    public List<Case> getNewCases(){
        List<Case> results = [SELECT Id, caseNumber FROM Case WHERE status ='new'];
        return results;
    }
}