@RestResource(urlMapping='/mhcknw/*')
global with sharing class campclass {
    @HttpGet
    global static list<wrapperclass> findrecords(){
        list<wrapperclass> wrapperlist = new list<wrapperclass>();
        
         RestRequest request = RestContext.request;
         RestResponse res = RestContext.response;
        string caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
          system.debug('######'+caseId);
        List<Case> c = [SELECT Id, case.Account.Name, case.Contact.LastName, CaseNumber, Status, Origin, Subject, Priority, ContactPhone FROM Case
                       WHERE Id = : caseId];
        system.debug('@@@@@@'+c);
          for(Case ca:c){
                    wrapperlist.add(new wrapperclass(ca));
                    system.debug('&&&&&&&'+wrapperlist);
                   }
             return wrapperlist;
    }
        global class wrapperclass{
             public Case cas;
            public wrapperclass(Case ce){
                cas = ce;
            }
        }      
    }