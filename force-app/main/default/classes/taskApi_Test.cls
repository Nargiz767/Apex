@isTest
public with sharing class taskApi_Test {
    @isTest 
    private static void  getcountryTest() {
      
      taskTest_Mock mock= new taskTest_Mock();
      Test.setMock(HttpCalloutMock.class,mock);

    
      HttpResponse response = taskApi.getTask(); 
           system.assertEquals(200, response.getStatusCode());
           System.assertEquals('OK', response.getStatus());

    }
}