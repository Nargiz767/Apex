public with sharing class taskApi {
    public static HttpResponse getTask() {
        HttpRequest request = new HttpRequest ();
        request.setMethod('GET');
        request.setEndpoint('https://api.countrylayer.com/v2/all?access_key=f25df2aa26e77dead44eb0341bd991f9');
        
        
        Http http = new Http(); 
        HttpResponse response =new HttpResponse();
        response = http.send(request);
        
        system.debug('Response Status '+ response.getStatus());
        system.debug('Response status code. '+ response.getStatusCode());
        system.debug('Response content/body '+ response.getBody());
        
        if (response.getStatusCode() == 200) {
            String jsonData = response.getBody();
            List<TaskApiWrapper> lstCountry = TaskApiWrapper.parse(response.getBody());
            list<CountryLayer__c> listCountry = new list<CountryLayer__c>();
        
            for (TaskApiWrapper eachWrapper : lstCountry) {
                CountryLayer__c obj = new CountryLayer__c();
                
                obj.name = eachWrapper.name;
                obj.alpha3code__c = eachWrapper.alpha2Code;
                obj.apha2code__c = eachWrapper.alpha3Code;
                obj.Region__c = eachWrapper.region;
                obj.Capital__c = eachWrapper.capital;
                if (eachWrapper.regionalBlocs != null) {
                    obj.RegionalBlock__c=eachWrapper.regionalBlocs.toString();
                }
                listCountry.add(obj);
            }
            upsert listCountry;
        }
        return response;
    }
}