@isTest
global class TeleDripHttpCalloutMock implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"convo":["action":"sms","date":"2020-02-29 01:00:48+00:00","tooltip":"February 28, 2020, 05:00 PM""]}');
        response.setStatusCode(200);
        return response; 
    }
}