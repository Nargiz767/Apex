@isTest
public with sharing class SoapApiOutBoundApiParkMock implements WebServiceMock {
    public void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ){

 ParkSOAPApex.byCountryResponse response_x =new ParkSOAPApex.byCountryResponse();
 list <string> parkNames = new List <String>{'park1','park2','park3'};
 response_x.return_x= parkNames;
 //  response_x.return_x= new List <String>{'park1','park2','park3'};
 response.put('response_x',response_x);
}
// step 3



}