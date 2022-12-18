public  class SPTriggerHandler {
    public static void creatDefaultTickets(list< Salesforce_Project__c> spTriggerNew) {
      List<Salesforce_Ticket__c> newList = new List<Salesforce_Ticket__c>();
      for (Salesforce_Project__c eachSP : spTriggerNew){
        Salesforce_Ticket__c newst= new Salesforce_Ticket__c();
        newst.subject__c='Default Ticket';
        newst.Salesforce_Project__c=eachSP.id;
        newList.add(newst);

      }
      if (!newList.isEmpty()){
        insert newList;
      }
    } 
}
