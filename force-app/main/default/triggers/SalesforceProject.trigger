trigger SalesforceProject on Salesforce_Project__c (before insert, after insert, before update,after update  ) {
   if(trigger.isAfter && trigger.isInsert){
        //call trigger handler to creat slaesforce ticket
        SalesForceProjectHandler.creatDefaultTickets(Trigger.New);

        //call future method,
        system.debug('calling future method NOW.');
        Map<id, Salesforce_Project__c> spNewMap = trigger.newMap;
        SalesForceProjectHandler.spUpdateDescription(spNewMap.keySet());
        system.debug('called future method. DONE.');

   }
   if (Trigger.isBefore && trigger.isUpdate) {
      //call validation method here.
      //SalesforceProjectTriggerHandler.completeSPvalidation(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
  }
  if (Trigger.isAfter && Trigger.isUpdate) {
      //a
      SalesforceProjectHandler.spStatusCompleted(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
  }
 
}



 

 


   /*
 if (trigger.isBefore && trigger.isInsert){
    for (Salesforce_Project__c spc : trigger.new){
 spc.Project_Name__c = 'New Trigger Project ';
 system.debug ('new name is '+ spc);
}
}

map <id,Salesforce_Project__c > projectOldMap= trigger.OldMap;
map <id,Salesforce_Project__c > projectNewMap= trigger.NewMap;
If (Trigger.isAfter && Trigger.isUpdate){

set <id> spid = projectNewMap.KeySet();
for (id eachid: spid){
Salesforce_Project__c newsp = projectNewMap.get(eachid);
system.debug('project new name '+ newsp.Project_Name__c);

Salesforce_Project__c oldsp = projectOldMap.get(eachid);
system.debug('project old name '+ oldsp.Project_Name__c);
}

 } */

