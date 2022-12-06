public class DML2_Assgn {
    public static void insert_dml() {
  Account newrec1= new account();
  newrec1.Name='Nargiz assingment';
  newrec1.Phone='4378654216';
  insert newrec1;

  Account newrec = new account();
 newrec.Name='Mehdi assingment';
  newrec.Phone='787878';
  insert newrec;
    }

    public static void updating_dml(){
    account newrec= new account ();
       newrec.Name='Account creted';
      insert newrec;
     newrec.Name= 'Account updated';
      update newrec;
    }
}
