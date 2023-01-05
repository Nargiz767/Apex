public class InsertAccountContact {
    public static void InsertAccContact(string accname,string conname) {
  account a= new account ();
  a.name = accName;
  insert a;

  contact c= new contact();
  c.lastName = conname;
  c.accountid =a.id;
  insert c;
    }
}
