@IsTest
public with sharing class RestInboundWeb_Test {
   @TestSetup
   public static void makeData(){
    // Creating a Test Case record
    Case testRec= new Case();
    testRec.Subject ='Test Case';
    testRec.Description='Tst description';
    testRec.Origin='Phone';
    testRec.Status='New';
    testRec.Priority ='High';
    insert testRec;
   }

   @IsTest
    public static void getCaseByIdSuccessTest(){
        Id caseId = [SELECT Id FROM Case LIMIT 1].Id;
        // Setup a mock test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://ddo000000hr6ymas-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/' + caseId;
        request.httpMethod = 'GET';
        RestContext.Request = request;
        // Call the Inbound Webservice method
        Test.startTest();
        Case testRec = RestInboundwebServices.getCaseById();
        Test.stopTest();
        // Verrify Results
        System.assertEquals(testRec.Id, caseId, 'Test case Record Id should be matching with the Webservice method result');
    }

    @IsTest
    public static void createCaseSuccessTest(){
        // Setup a Test requset
        RestRequest request = new RestRequest();
        request.requestURI = 'https://ddo000000hr6ymas-dev-ed.develop.my.salesforce.com/services/apexrest/InboundCaseManager/';
        request.httpMethod = 'POST';
        RestContext.Request = request;
        // Call Webservice method
        Test.startTest();
        RestInboundwebServices.createCase('Test Case #2', 'Test Case Description', 'New', 'High', 'Web');
        Test.stopTest();
        // Verify results
        Case testRec = [SELECT Id, Subject FROM Case WHERE Subject = 'Test Case #2'];
        System.assertEquals('Test Case #2', testRec.Subject, 'New Test record is Created!');
    }
    @IsTest
    public static void deleteCaseSuccessTest(){
        // Fetch case Record id
        Id caseId = [SELECT Id FROM Case LIMIT 1].Id;
        // Setup a test Request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/InboundCaseManager/' + caseId;
        request.httpMethod = 'DELETE';
        RestContext.Request = request;
        RestContext.Response = new RestResponse();
        //Call the WebService method
        Test.startTest();
        RestInboundwebServices.deleteCase();
        Test.stopTest();
        // Verify Result
        List<Case> testRecList = [SELECT Id FROM Case];
        System.assertEquals(0, testRecList.size(), 'Not expecting any Case record to be present after Deletion!');
    }

    }
   
