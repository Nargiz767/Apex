/*
 Hands On: If the Case is created where Origin is EMail and Contact is not Null then send an email to the related contact, also save that email as an activity
Implementation:
Part 1: Record Trigger Flow on Case Object with Condition Check of Orgin of email
Part 2: Create Invocable method to sendEmail to Contacts (Apex)
            * Multiple Input Parameters - 1. Case Record Id  2. Contact Record Id  3. Case Number
Part 3: Add Action under The Flow to use this APex feature
*/


public with sharing class CaseFlowController {
    @invocableMethod(
    label ='Send email to contact'
    description= 'Auto- genetated email send to Customers'
    category='Case'
    )
    public static void sendEmailToContact(list<Request> inputParameters) {
        // we are fetching the first element of input[parameters 
        string contactId=inputParameters[0].contactIds;
        string caseId= inputParameters[0].caseIds;
        string caseNumber=inputParameters[0].caseNumber;
// Message.SingleEmailMessage to send Email Message to contact record 
 Messaging.SingleEmailMessage message = new  Messaging.SingleEmailMessage();
 message.subject ='Your case has been received '+ caseNumber;
 message.plaintextBody ='hey Customer, Thank for reaching out of SoftInnovas ';
 message.toaddresses= new List <string> {contactId};
 message.setSaveAsActivity(true);
 // send Email to contact record and capture the result
 messaging.sendEmailResult[] results= Messaging.sendEmail(new list <messaging.SingleEmailMessage> {message});
 // or  List<Messaging.SingleEmailMessage> messages = new List<Messaging.SingleEmailMessage>();
 //messages.add(message);
//Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);


 if(results[0].Success){
   System.debug('Email was sent successfully');
 } else {
System.debug ('Email got failed');
 }

    }
    // Wrapped class is set of Varuables
    // Requests in wrapped Class
    public class Request {
        @InvocableVariable(
            label= 'Case Record Id'
            description= 'The Id of Case record'
            Required=true
        )
        public string caseIds;

        @InvocableVariable(
            label= 'Contact Record Id'
            description= 'The Id of Contact  record'
            Required=true
        )
        public string contactIds;

        @InvocableVariable(
            label= 'Case Number'
            description= 'The AutoNum of Case record'
            
        )
        public string caseNumber;
       
        
    }
}