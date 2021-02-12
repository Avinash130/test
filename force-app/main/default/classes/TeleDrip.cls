public class TeleDrip {
    public static HttpResponse makeGetTelDri() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://app.teledrip.com/api/v1/messages/history/?r=explorer&full_activity=1&phone_number=%2B19493120182&api_key=558476c4188d82d839859dfa2aa0a66a42368b84');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug('Received the following data:' + response);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            System.debug(response.getBody());
            // Deserializes the JSON string into collections of primitive data types.
            //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //List<Object> TeleDrip = (List<Object>) results.get('TeleDrip');
           // System.debug('Received the following :');
          //  for (Object TeleDrips: TeleDrip) {
               // System.debug('TeleDrips');
           // }
      
        }
        return response;
    }
    
    }