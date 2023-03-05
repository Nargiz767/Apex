public  class appointmentBatch Implements Database.Batchable<SObject>,Database.stateful{
    integer count = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator ql= Database.getQueryLocator([SELECT Id, Live__c,lastModifiedDate FROM Event_Appointment__c 
                                                          WHERE Live__c != True AND lastModifiedDate < LAST_N_DAYS:60]);
        return ql;                                                  
    }

    public void execute (Database.BatchableContext bc, list< Event_Appointment__c> event){
        if(!event.isEmpty()){
            count++;
            delete event;
        }

    }

    public void finish (Database.BatchableContext bc){
        system.debug('total count records'+count);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('batch process');
        mail.setHtmlBody('Dear group Exacution of the batch has been processed');
        list <string> emailto = new list <string>();
        emailto.add('mmurad766@gmail.com');
        mail.setToAddresses(emailto);
       
       }
}