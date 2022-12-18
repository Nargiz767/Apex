public class SalesForceProjectHandler {
    public static void creatDefaultTickets(List<salesforce_project__c> apTriggerNew) {
List<salesforce_ticket__c> listST = new List<salesforce_ticket__c>();
      for(salesforce_project__c eachSP: apTriggerNew){
        salesforce_ticket__c newst = new   salesforce_ticket__c ();
        newst.subject__c ='default ticket';
        newst.Salesforce_Project__c = eachSP.id;
        listST.add(newst); 
      }
      if(!listST .isEmpty()){
        insert listST ;
      }
    }
}
