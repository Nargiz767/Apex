public  class ContactQueueableAssign implements Queueable{
    public list <account> listcon;
    public ContactQueueableAssign(list <account> con) {
     listcon= con;
    }

    public void execute (QueueableContext qc){
     list <contact> conlist= new list <contact>();
     for (account accs: listcon){
        contact con= new contact (lastname= 'contact'+ accs.name,accountId = accs.id);
        conlist.add(con);
     }
     if(!conlist.isEmpty()){
        insert conlist;
     }
}
}