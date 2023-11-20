// whenever record inserted to the account auto/ly inserted to the contact 
public class interview {
    public static void createContacts(List<Account> newAccounts) {
            List<Contact> newContacts = new List<Contact>();

            for (Account a : newAccounts) {
                Contact b = new Contact();
                b.LastName = a.Name;
                b.AccountId = a.Id;
                newContacts.add(b);
            }

            insert newContacts;
        }
    



 public static void createaccount (list <account> newaccount){
    list <contact> newcontact=new list <contact>();
    list<opportunity> newopp= new list <opportunity>();
    for(account acc : newaccount){
        contact con = new contact ();
        con.AccountId=acc.id; 
        con.lastname=acc.Name;

        opportunity opp = new opportunity();
        opp.AccountId=acc.Id;
        opp.Name =acc.name;  
    }

    insert newcontact;
    insert newopp;
 }

    }