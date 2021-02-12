@RestResource(urlMapping='/wrapper/*')
global with sharing class CaseClass {
    @HttpGet
    
    global static List<Casewrapper> doget(){
       RestRequest req = RestContext.request;
        String cnumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
       RestResponse res = RestContext.response;
        
        List<Case> result = [SELECT Id, accountId, Subject, CaseNumber FROM Case WHERE CaseNumber= :cnumber];
        System.debug('Result: ' + result);
        
        List<Casewrapper> cWrapList = new List<Casewrapper>();
        for(Case ca : result){
            Casewrapper caWrap = new Casewrapper();
              caWrap.caId = ca.Id;
             caWrap.accountId = ca.accountId;
              caWrap.Subject = ca.Subject;
            caWrap.CaseNumber = ca.CaseNumber;
            cWrapList.add(caWrap);
            }
          return cWrapList;
    }
    
    global class Casewrapper {
        Public Id caId;
        public String CaseNumber;
        public String accountId;
        public String Subject; 
    }

}