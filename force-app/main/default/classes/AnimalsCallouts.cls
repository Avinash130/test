public class AnimalsCallouts {
    public static HttpResponse makeGetCallout(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setendpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if(response.getStatusCode()==200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Recieved the following animal');
            for(Object animal : animals){
                System.debug(animal);
            }
        }
        return response;
    }
    
    public static HttpResponse makePOSTCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
            request.setMethod('POST');
        request.setHeader('content-type', 'application/JSON; charset=UTF-8');
        request.setBody('{"name":"mighty moose"}');
        HttpResponse response = http.send(request);
        if(response.getStatusCode() !=201){
            System.debug('The status code return was noe expected: ' + 
                        response.getStatusCode()==200 + '' + response.getBody());
        }else {
            System.debug(response.getBody());
        }
        return response;
    }
}