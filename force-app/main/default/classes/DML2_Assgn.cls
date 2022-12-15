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
public static void createBulkContacts(){
  list <Contact> con= new list <contact>();

 contact con1=new contact();
 con1.FirstName='Mark';
 con1.lastName ='Ruffalo';
 con.add(con1);

  contact con2=new contact ();
  con2.firstName = 'Mark';
  con2.lastName='Ruffalo';
 con.add(con2);

 contact con3=new contact ();
 con3.firstName = 'Chris';
 con3.lastName='Hemsworth';
con.add(con3);

contact con4=new contact ();
   con4.firstName = 'Scarlett';
   con4.lastName='Johanson';
  con.add(con4);
 insert con;

}

 public static list<contact> searchForContacts(string match) {
  list<account> listcon = [select id, firstname,lastname from contact where lastName=:match ];
  system.debug('list contact motchind '+ listcon);
  return listcon;
}

}
