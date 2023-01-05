public class ContactBatch implements Database.Batchable<sObject>,database.stateful{
  integer count= 0;
    public Database.QueryLocator start(Database.BatchableContext ct) {
       Database.QueryLocator c1 = Database.getQueryLocator([select id,name ,email, description from contact]);
       return c1;  
    }
    public void execute(Database.BatchableContext ct, list<contact> listCon){
        list <contact> updatecon = new list<contact>();
      for (contact eachcon: listCon) {
        eachcon.Description +='Updated by batch';
        updatecon.add(eachcon);
      }
      if(!updatecon.isEmpty())
        update listCon;
    }
    public void finish(Database.BatchableContext ct){
     system.debug ('finish method called');
     system.debug('execute method count '+ count);
    }
}
