public class CalloutClass {
@future(callout=true)
    public static void makeCallout(){
        HttpRequest request = new HttpRequest();
        // Set the endpoint url
        String endpoint = 'https://animal-blog-dev-ed.lightning.force.com/';
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        // send the http request and get the response
        HttpResponse response = new Http().send(request);
    }
}