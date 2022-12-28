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

    public static void completeSPvalidation(list<salesforce_project__c> spTriggerNew, list<Salesforce_Project__c> spTriggerOld,
                                           map <id,salesforce_project__c> spTriggerNewMap,  map <id,salesforce_project__c> spTriggerOldMap){

             set<id> spset = new set <id>();
             for ( salesforce_project__c eachsp : spTriggerNew) {
             if (eachSP.status__c =='Completed' && eachSP.status__c != spTriggerOldMap.get(eachSP.id).status__c) {
                spset.add(eachSP.id);
             }  
             }

             List<salesforce_ticket__c> listst = [select id, status__c ,salesforce_project__c from Salesforce_Ticket__c 
                                                 where Salesforce_Project__c in: spset and status__c !='copmleted'];
          for ( salesforce_ticket__c eachST : ListST ){
            salesforce_project__c newsp = spTriggerNewMap.get(eachST.Salesforce_Project__c);
            newsp.addError('Cannot complete projects , because all tickets not completed');
            
          }

         }
         @future
    public static void spUpdateDescription(Set<id> setSPId) {
        system.debug('inside future method. Huhuuu');
        List<Salesforce_Project__c> allSP = [select id, description__c from Salesforce_Project__c where id in :setSPId];
        for (salesforce_project__c eachSP : allSP) {
            eachSP.Description__c += '. Updated from future';
        }
        update allSP;
    }

     //a
     public static void spStatusCompleted(List<salesforce_project__c> spTriggerNew, List<salesforce_project__c> spTriggerOld, 
     Map<id,salesforce_project__c> spTriggerNewMap, Map<id,salesforce_project__c> spTriggerOldMap) {
         
         //get spIds whose status is changed to 'Completed'
         set<id> spCompleted = new set<id>();
         for (Salesforce_project__c sp : spTriggerNew) {
             //how to get if status is changed to completed?
             //compare old and new value
             if (sp.Status__c == 'Completed' && sp.Status__c != spTriggerOldMap.get(sp.id).Status__c) {
                 spCompleted.add(sp.Id);
             }
         }
         //call future method to update tickets.
         if (!spCompleted.isEmpty()) {
             updateTicketStatus(spCompleted);
         }
 
     }
 
     //b
     @future
     public static void updateTicketStatus(set<id> ProjectIds) {
         //get all tickets
         List<salesforce_ticket__c> allTickets = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
         where Salesforce_Project__c in :ProjectIds and status__c != 'Completed'];
 
         //set status to completed
         for (salesforce_ticket__c eachST : allTickets) {
             eachST.Status__c = 'Completed';
         }
         update allTickets;
         //update tickets.
     }
 }

        

