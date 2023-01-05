public  class AccountQueueableexample implements Queueable {
    public list <account> listacc;
    public AccountQueueableexample(list <account> accounts) {
  listacc= accounts;
    }

 public void execute (QueueableContext qc) {
   // creat new isntance for update trugger.new
   list <account> updateAccs= new list <account>();
    for (account  eachAcc: listacc) {
      account a = new account();
      a.id =  eachAcc.id; 
      a.Name =eachAcc.name +'-- SI' ;
     updateAccs.add(a);
    }
    update updateAccs;
 }
}
