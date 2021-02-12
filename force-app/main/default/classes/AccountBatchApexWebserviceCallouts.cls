global class AccountBatchApexWebserviceCallouts implements Database.Batchable<sObject>, Database.AllowsCallouts{

    global Database.QueryLocator start(Database.BatchableContext BC) {
        String q = 'select name, AccountNumber, Type FRom Account';
        return Database.getQueryLocator(q);
    }
    
    global void execute(Database.BatchableContext BC, List<Account> acc) {
        for(Account a : acc) {
            if(a.Type.equals('Customer - Direct')){
                try{
                    Http h = new Http();
                    HttpRequest req = new HttpRequest();
                    HttpResponse res = new HttpResponse();
                    
                    String username = 'avinash1@salesforce.com';
                    String password = '1jb09is017';
                    Blob headerValue = Blob.valueOf(username + ':' + password);
                    String authorizationHeader = 'BASIC' + EncodingUtil.base64Encode(headerValue);
                    
                    req.setHeader('Authorization', authorizationHeader);
                    req.setHeader('Content-Type', 'Application/Json');
                    req.setEndpoint('http://speakingjs.com/es5/ch01.html');
                    req.setMethod('POST');
                    req.setBody('Information to Send');
                    res = h.send(req);
                    if(res.getStatusCode() == 200) {
                        String jsonResponse = res.getBody();
                        System.debug('Response'  + jsonResponse);
                    }
                }
                Catch (Exception e) {
                    System.debug('ERROR-'  + e.getMessage());
                }
            }
        }
    }
    
    global void finish(Database.BatchableContext BC) {
        
    }
    
}