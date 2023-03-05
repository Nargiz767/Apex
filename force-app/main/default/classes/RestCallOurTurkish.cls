public with sharing class RestCallOurTurkish {
   public static void getUser(){

     httpRequest request= new httpRequest();
     Request.setEndPoint('https://reqres.in/api/users/3');
     request.setMethod('GET');

     Http http = new http();
     httpResponse response = http.send(request);


     if (response .getStatusCode()==200){
        system.debug(response.getbody());
        string jsonUser= response.getBody();
        Map<string,object> userValue =(Map<string,object>)JSON.deserializeUntyped(jsonUser);
        system.debug('veri'+ userValue);
        system.debug('veri'+ userValue.get('data'));
        system.debug('veri'+ userValue.get('support'));
        Map<string,Object> userInfo = (map<string,Object>)userValue.get('data');
        system.debug(userInfo);
        system.debug(userInfo.get('first_name'));
        system.debug(userInfo.get('email'));
     }
   }
}