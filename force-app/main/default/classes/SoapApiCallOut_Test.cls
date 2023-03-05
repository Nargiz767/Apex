/**
 * Implementation of Unit Test Class for SOAP API Outbound Callouts
 * Step I : To Create a new Mock Response - Apex Class which will implement WebServiceMock
 * Step II: Inside Mock Response class we will be implementing doInvoke method with bunch of predefined Method parameters
 * Step III: Initialise Response Class of SOAP Utility/Serrvice Class
 * Step IV: Pass Dummy/Fake Response values
 * Step V: Assosiate Mock Response to our Unit Test method
 * Step VI: Invoking SOAP Callout
 * Step VII: System Assertion
 */


@isTest
public with sharing class SoapApiCallOut_Test {

    @isTest
    public static void makeCalculateCalloutsuccessTEST(){
        //SoapApiCallOut.makeMultiplication();
        // assosiation of mock response to our Unit Testmethod 

        Test.setMock(WebServiceMock.class,new SoapApiOutBoundCalloutCalculatorMock());
        //Inovke soap api callout scenario 
        Test.startTest();
        Double Result = SoapApiCallOut.makeMultiplication();
        Test.stopTest();
        System.assertEquals(30.0,result,'Mock Response return should be matching ');
       
}
 @isTest
 public static void makeParkCalloutsuccessTEST(){
    Test.setMock(WebServiceMock.class,new SoapApiOutBoundApiParkMock());
    //Invoke Soap Api Callout Response 
    Test.startTest();
   list<string> parks =SoapApiCallOut.makePrakCallOut();
    Test.stopTest();
    System.assertEquals(3,parks.size(),'we should be expecting 3 park dummy results from mock response');
    list<string> expectResult = new list<string>{'park1','park2','park3'};
    System.assertEquals(expectResult, parks, 'We should be expecting 3 park dummy results from Mock Response');
    
}
}