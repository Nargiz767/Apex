@isTest

public with sharing class RestApiOutboundCallout_TEST {
 /**
         * Error method defined as testMethod do not support Outbound integration/web sevcice callouts 
         * Covering Rest callout testScenario can be done usoing 2 approaches;
         * 1.Static Resource callout Mock
         * 2.Creating A Mock Response using HttpCallout  class 
         */
    @isTest
    public static void getAnimalsSuccessTestusingStaticResource(){
        /**
     * Unit Test Success Response for Animal Heroku App - GET Method
     * STATIC RESOURCE MOCK APPROACH
     * Step 1: Upload Response Body as a Static Resource
     * Step 2: Fetching Mock Response from Static Resource
     * Step 3: Link/Assosiate the Mock Response to our Unit Test context
     * Step 4: Invoking REST merthod logic
     * Step 5: Assertion Stateements
     */

    
      // Create a mock Response based on our Static Resource
      StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
      mock.setStaticResource('GetAnimalresponse');
      mock.setStatusCode(200);
      mock.setStatus('OK');
      mock.setHeader('Content-Type', 'application/json');

     //Assosiate the callout with this mock Response/linkding 
     Test.setMock(HttpCalloutMock.class,mock);
     
     //Invoking Apex logic 
        Test.startTest();
       HttpResponse mockResponse= RestApiOutboundCallout.getAnimals();
        Test.stopTest();

     // Assertion Statements
     System.assertEquals(200, mockResponse.getStatusCode(), 'Success Response should be 200');
     System.assertNotEquals(null, mockResponse.getBody(), 'Mock Response content should give something');
         
}
@isTest
public static void getUserSuccessTestUsingCalloutMock(){
    //set callour mock response
    Test.setMock(HttpCalloutMock.class, new GetUserCalloutMockResponse());// linking part

    //rest callout in test context
    Test.startTest();
    HttpResponse mockResponse = RestApiOutboundCallout.getUser();
    test.stopTest();

      // Assertion statements
      System.assertEquals(200, mockResponse.getStatusCode(), 'Success Response should be 200');
      System.assertNotEquals(null, mockResponse.getBody(), 'Mock Response content should give something');

}


// Create Mock Response Class

public class GetUserCalloutMockResponse implements HttpCalloutMock {
    // Implement respond Interface method
    public HttpResponse respond(HttpRequest request){
        // Create a fake Response
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"data":{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}');
        return response;
    }
}

}
