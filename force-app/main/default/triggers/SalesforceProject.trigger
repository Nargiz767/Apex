trigger SalesforceProject on Salesforce_Project__c (before insert,before update, after insert, after update ) {
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

 }
}