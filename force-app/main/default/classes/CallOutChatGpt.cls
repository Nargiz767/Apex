public with sharing class CallOutChatGpt {
    @AuraEnabled
// Method to make the API call with the input prompt as a parameter
public static String chatGPt (String inputPrompt) {
    // Prepare the request body (input prompt)
    String requestBody = '{"prompt": "' + inputPrompt + '", "max_tokens": ' + '100' + '}';
    
    // Apex HTTP class is used to make HTTP requests
    Http http = new Http();
    HttpRequest request = new HttpRequest();
    HttpResponse response;

    // Set the endpoint URL
    String endpoint ='https://api.openai.com/v1/chat/completions';

    // Set the API key in the headers
    request.setHeader('Authorization', 'Bearer ' + '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');

    // Set the request method and endpoint URL
    request.setMethod('POST');
    request.setEndpoint(endpoint);

    // Set the request body
    request.setBody(requestBody);
    System.debug('httpRequest ' + request);
    try {
        // Make the API call
        response = http.send(request);

        // Handle the response
        if (response.getStatusCode() == 200) {
            // Successful API call
            String responseBody = response.getBody();
            // Process the response body as needed
            return responseBody;
        } else {
            // Error handling for non-200 status codes
            System.debug('Error: ' + response.getStatusCode() + ' - ' + response.getStatus());
        }
    } catch (Exception ex) {
        // Exception handling
        System.debug('Exception: ' + ex.getMessage());
    }
    return null;
}

}

//Response - Status - Success or error
//Response - StatusCode - 200
//Response - Body - Chat GPT Response
//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
