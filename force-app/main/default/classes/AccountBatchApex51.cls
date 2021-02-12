global class AccountBatchApex51 implements Database.Batchable<sobject>, Database.AllowsCallouts {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        String query = 'select Name, AccountNumber, Type From Account';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        for(Account acc : scope) {
            if(acc.Type == 'Customer - Direct') {
                try {
                    HttpRequest req = new HttpRequest();
                    HttpResponse res = new HttpResponse();
                    Http http = new Http();
                    
                    String username = 'UserName';
                    String password= 'UserPassword';
                    Blob headerValue = Blob.valueOf(username + ':' + password);
                    String authorizationHrader = 'BASIC' + EncodingUtil.base64Encode(headerValue);
                    
                    req.setHeader('authorization', authorizationHrader);
                    req.setHeader('Content-Type', 'application/json');
                    req.setEndpoint('endpoint Url');
                    req.setMethod('POST');
                    req.setBody('Mesage Type here');
                    res = http.send(req);
                    if(res.getStatusCode()==200) {
                        String jsonResponse = res.getBody();
                        System.debug('Response-' + jsonResponse);
                    }
                    
                } Catch(Exception e) {
                    System.debug('Error: ' + e.getMessage() + 'LN:' + 'LN:' + e.getLineNumber());
                }
            }
        }
    }
    
    global void finish(Database.BatchableContext bc) {
        Datetime  sysTime = System.now();
        // this would increase the time to 1 hour
        sysTime = sysTime.addMinutes(15);
        
        String chron_exp = '' + sysTime.second() + '' + sysTime.minute() + '' + sysTime.hour() + '' + sysTime.day() +
            '' + sysTime.month() + '' + sysTime.year();
        System.debug('chron_exp');
        
        AccountScheduleBatch51 asb = new AccountScheduleBatch51();
        
        System.Schedule('New Schedule' + sysTime.getTime(), chron_exp, asb);

    }

}