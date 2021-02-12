public with sharing class testopenweather 
{
     public string City{get;set;}
     public string temp{get;set;}
     public string pressure{get;set;}
     public string humidity{get;set;}
     public string temp_min{get;set;}
     public string temp_max{get;set;}
    
    public testopenweather(ApexPages.StandardController stdcontroller)
    {
        Account account=(Account)stdcontroller.getRecord();
        account=[select Id,ShippingCity from account where Id=:account.id];
        
        string accountCity=account.ShippingCity;
        string apikey='cf76d0e1383bb395a0c8fbb89afd458c';
        
        string requestEndpoint='http://api.openweathermap.org/data/2.5/weather';
        requestEndpoint+='?q='+accountcity;
        requestEndpoint+='&units=metric';
        requestEndpoint+='&APPID='+apikey;
        
        Http http=new http();
        HttpRequest request=new HttpRequest();
        request.setEndpoint(requestEndpoint);
        request.setMethod('GET');
        HttpResponse response=http.send(request);
        
        if(response.getStatusCode()==200)
        {
            Map<string, object> result=(Map<string, object>)JSON.deserializeUntyped(response.getBody());
            City=string.valueOf(result.get('name'));
            
            Map<string,object> mainresults=(Map<string,object>)(result.get('main'));
            temp=string.valueOf(mainresults.get('temp'));
            Pressure=string.valueOf(mainresults.get('pressure'));
            humidity=string.valueOf(mainresults.get('humidity'));
            temp_min=string.valueOf(mainresults.get('temp_min'));
            temp_max=string.valueOf(mainresults.get('temp_max'));
            
           
        }
        else
        {
            ApexPages.Message Mymsg=new ApexPages.Message(ApexPages.Severity.ERROR,'There was an error in reading the code');
            ApexPages.addMessage(Mymsg);
        }
    }
    public void insertrec()
    {
            Weather__c w = new weather__c();
            w.Temperature__c=temp;
            w.Pressure__c=Pressure;
            w.Humidity__c=humidity;
            w.temp_min__c=temp_min;
            w.temp_max__c=temp_max;
            w.City__c = City;
            insert w; 
           }
}