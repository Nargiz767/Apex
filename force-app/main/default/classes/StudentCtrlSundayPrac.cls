public with sharing class StudentCtrlSundayPrac{
    @AuraEnabled
   public static list <Student__c> seachbyPostalCode (string code){

    code='%'+ code +'%';
    return [SELECT Student_Name__c,Email__c,Mobile__c,Postal_Code__c,Class__c FROM Student__c WHERE Postal_Code__c LIKE:code ];
   }
}