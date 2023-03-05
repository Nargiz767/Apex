/**
 * External System/Insomnia/Workbench   -->  Salesforce (Inbound Integration)
 * AGENDA: Build Custom APex REST Web Services -- Example: Case Manager
 * Http Methods - GET, POST, PATCH, DELETE, PUT
 *
 * Whenever we are setting up any Inbound Integration with Salesforce, it is mandatory to do following steps
 * 1. Authorization - Create Connected App - (Api Access Monitoring Tool)
 * 2. Authentication - Create User Account -  (Username + Password)
 * 
 * For connected App Callback URL details 
 * Production/Developer org-https://login.salesforce.com/
 * Sandbox.test.com
 *
 * When to build Custom Apex REST WebServices?
 * Check in Salesforce REST API Documentation, if you think Feature requested by Business is not possible through Standard APIs provided by Salesforce
 * Then only resort to create a Custom WebService
 * Documention : https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/resources_list.htm
 *
 * Testing Endpoint: https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/InboundCaseManager/
 * How to build Testing Endpoint URL?
 * 1. Identify Domain - Setup => My Domain . i.e, abinash-panigrahi-0113-dev-ed.my.salesforce.com
 * 2. /services/apexrest/ - This is Constant url mapping, which will always remains the same
 * 3. urlMapping provided at RestResource annotation, i.e. InboundCaseManager
 * 
 * Access Modifier of Webservices Apex Class needs to be Global when exposing Custom REST Api
 * So it can be access externally 
 */

@RestResource(urlmapping='/InboundCaseManager/*')
global with sharing class RestInboundwebServices{
    /**
     * This method will enable feature where we will expose/send case record by their Salesforce id 
     * 
     * HttpMethod -Get
     * return type of method will be mapped  directly to Response body
     * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/InboundCaseManager/xxxxxxxxx
     * In Get Request , Input paramert are always provided at the URL level
     * 
     */
    @HttpGet
    Global static Case getCaseById(){
 // Grab case record ID from the URL
  RestRequest request = RestContext.request;
  System.debug('HTTP request details sent by external System'+ request);
  System.debug('EndPoint'+request.requestURI);
  System.debug('Http Method '+ request.HttpMethod);
  System.debug('Header '+ request.Headers);

 // Grab case Record IDfrom URL
 String caseid=request.requestURI.subString(request.requestURI.lastIndexOf('/')+1);
 system.debug ('Case Record Id '+caseId);
 //String s1 = 'abcdefgc';
 //Integer i1 = s1.lastIndexOf('c');
 //System.assertEquals(7, i1);
 // SOQL fetch
 Case Result =[Select id,Description,CaseNumber,status,Origin,priority  FROM CASE WHERE id = :caseId WITH SECURITY_ENFORCED];
 system.debug('case record :'+ result);
 // return case information
 RETURN result;
    }



/**
	 * This Method is deleting Case record by their Salesforce Id
	 * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/InboundCaseManager/5002w000003zzJxAAI
	 * HTTP Method - DELETE
	 * Create Success & Fail Response with dynmaic Status Code and Body
	 */
    @HttpDelete
    global static void deleteCase(){
        // fetch rest request sent be external system
         // To fetch Rest Request sent by External System
         RestRequest request = RestContext.Request;
         System.debug('HTTP Request Details sent by External SYstem ' + request);
         System.debug('Endpoint ' + request.requestURI);
         System.debug('Http Method ' + request.httpMethod);
         System.debug('Header ' + request.headers);
         // Find Case Id info from the URL Endpoint
         String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);
         System.debug('Case Record Id: '+ caseId);
         // Fetch Case record using SOQL
         list <Case> matchingResult = [SELECT Id FROM Case WHERE Id =: caseId WITH SECURITY_ENFORCED ];
         // Build Custom Response
         RestResponse response = RestContext.Response;
         if(! matchingResult.isEmpty()){
             // Success Scenario
             delete matchingResult;
 
             // Success Code for Delete operation => 204
             response.statusCode = 204;
             // Response Body always expect data to be present in Binary format
             response.responseBody = Blob.valueOf('Case record was successfully deleted! :) ');
         } else {
             // Error Scenario
             response.statusCode = 404;
             response.responseBody = Blob.valueOf('Error encountered, Record doesnot exist ! :(');

    }
}
 /**
     * This method is going to create Case record by getting all required field values from External Sytem request
     * Http Method - POST
     * Testing Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/InboundCaseManager/
     * Request Body - { 'subject' : 'xxx', 'description' : 'xxx', 'status' : 'xxx', 'priority' : 'xxx', 'origin' : 'xxx'  }
     * Return Custom meaningful JSON response based on Success/Failure
     * Response Body - { 'id' : 'xxx', 'status' : 'Success/Failure', 'errorMessage' : 'xxx' }
     */

@HttpPost
global static void createcase(String subject,String description, String status, string priority,String origin){
  // Get request content send by external system
    RestRequest request = RestContext.Request;
    System.debug('HTTP Request Details sent by External SYstem ' + request);
    System.debug('Endpoint ' + request.requestURI);
    System.debug('Http Method ' + request.httpMethod);
    System.debug('Header ' + request.headers);
    System.debug('Request body' + request.requestBody);

// Create case Sobject
case newRec= new case();
newRec.Subject= Subject;
newRec.description= description;
newRec.status = status;
newRec.priority =priority;
newRec.Origin =origin;

  // Prepare Custom Response
  RestResponse response = new RestResponse();
  response.addHeader('Content-Type', 'application/json');
  PostResponseWrapper responseContent = new PostResponseWrapper();

// Insertion Case record
try {
    insert newRec;

    // Success Response
    response.statusCode = 201;
    // Prepare JSON Response Body
    responseContent.id = newRec.Id;
    responseContent.status = 'Success';
    responseContent.errorMessage = '';

}catch (Exception ex) {
    // Error Response
    response.statusCode = 404;
    // Prepare JSON Response Body
    responseContent.id = '';
    responseContent.status = 'Failure';
    responseContent.errorMessage = ex.getMessage();
}

// Populate Response Body
String responseBody = JSON.serialize(responseContent);
response.responseBody = Blob.valueOf(responseBody);

}

// Wrapper Class for Response Building
public class  PostResponseWrapper {
public String id;
public String status;
public STring errorMessage;
}



// update existing record
/**
     * This method is going to update Case record by looking at the Salesforce Id followed by Request body
     * HttpMethod - PATCH
     * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/InboundCaseManager/5002w000003zzJxAAI
     * Request Body -  { "subject" : "xxx", "description" : "xxx", "status" : "xxx", "priority" : "xxx", "origin" : "xxx" }
     * Request Body will only contain fieldname which you are going to update
     * Return Type will be Case JSON record
     */
    @HttpPatch
    global static Case updatecaseFields(){
        // Grab Current Inbound Integration Request
        RestRequest request = RestContext.Request;
        // Grab the Case Record Id from Endpoint URI
        String caseId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        // Fetch Case record using Record Id
        List<Case> existingRec = [SELECT Id FROM Case WHERE Id =: caseId WITH SECURITY_ENFORCED];
        // Handling Request JSON Body
        // Request Body would be present in Blob format. Inoerder to convert into String value
        String requestJSON = request.requestBody.toString();
        // Deserialize the JSON STring into name-value pair
        // wrpapper class approch is not feasible key value in JSON will not remail constant
        Map<String,Object> fieldValues = (Map<String,Object>) JSON.deserializeUntyped(requestJSON);
        // Iterate through each parameter fieldname and value
        for(String fieldName : fieldValues.keySet()){
            // Set the field and value on the Case sObject
            // existingRec[0].Status = 'New';
            // existingRec[0].put('Status', 'New');
            // Above 2 lines mean the same thing. In Approach #1 field name is static content but in Approach #2 field name is dynamic content
            existingRec[0].put(fieldName, fieldValues.get(fieldName));
        }
        // Update existing case record
        update existingRec[0];
        return existingRec[0];
}

/**
     * This method will be used to perform UPSERT(Insert/Update) case record by parsing all required parameters from Rest Request sent by External System
     * Incase of Upsert, if Salesforce Id is provided then it is an Update scenario. If not, it is an Insert scenario
     * Endpoint - https://abinash-panigrahi-0113-dev-ed.my.salesforce.com/services/apexrest/InboundCaseManager/
     * Http Method - PUT
     * Request Body - { "id" : "xxx", "subject" : "xxx", "description" : "xxx", "status" : "xxx", "priority" : "xxx", "origin" : "xxx" }
     * Return meaningful JSON response based on Success/Failure
     * Response Body - { 'id' : 'xxx', 'status' : 'Success/Failure', 'errorMessage' : 'xxx' }
     * if Method oparameters are not added then it means We have to do Deserialisation at our own terms
     */
    @HttpPut
    global static void upsertCase(){
        // Get Incoming Inbound REST API Request
        RestRequest request = RestContext.Request;
        // Extract Information/Data from Request Body by deserailising JSON
        String requestBody = request.requestBody.toString();
        // Use deserialize Strict when dfealing with Wrapper class
        // Use deserilaize Untyped when dealing with Map<>String
        PutRequestWrapper requestContent = (PutRequestWrapper) JSON.deserializeStrict(requestBody, PutRequestWrapper.class);

        // Prepare Case Object record
        case newRec = new Case();
        newRec.Status = requestContent.status;
        newRec.Subject = requestContent.subject;
        newRec.Description = requestContent.description;
        newRec.Origin = requestContent.origin;
        newRec.Priority = requestContent.priority;
        if(requestContent.id != null && requestContent.id != ''){
            newRec.Id = requestContent.id;
        }

        //Prepare Response Content
        RestResponse response = RestContext.Response;
        response.addHeader('Content-Type', 'application/json');
        PostResponseWrapper responseContent = new PostResponseWrapper();

        try {
            // Upsert Operation
            upsert newRec;

            // Success Response
            response.statusCode = 201;
            responseContent.status = 'Success';
            responseContent.id = newRec.Id;
            responseContent.errorMessage = '';
        } catch (Exception ex) {
            // Error Response
            response.statusCode = 404;
            responseContent.status = 'Failure';
            responseContent.id = '';
            responseContent.errorMessage = ex.getMessage();
        }

        // Prepare Response Body in JSOn format
        String responseJSON = JSON.serialize(responseContent);
        response.responseBody = Blob.valueOf(responseJSON);
    }

    // Wrapper Class for Put Request Body Deseariliasation
    public class PutRequestWrapper {
        public String id;
        public String subject;
        public STring description;
        public String priority;
        public STring origin;
        public STring status;
    }
}