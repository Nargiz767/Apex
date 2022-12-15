public  class Trigger_Map {

    public id InsertSF_Project() {
    Salesforce_Project__c  sp = new Salesforce_Project__c(); 
    sp.Project_Name__c = 'Assingment';
    insert sp;
    return  sp.id;
      
    }
    public void UpdateSF_Project( id sf , string names ){
        Salesforce_Project__c  spr  = new Salesforce_Project__c();
        spr =  [Select id ,Project_Name__c from Salesforce_Project__c where id=: sf ] ;
        spr .Project_Name__c= names ;
        update spr ;
    }
}  
