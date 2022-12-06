public class Soqldemo2{ 
    public static void soqlchidparents(){
  List<Contact> listcontact = [select id,name,account.name,
  account.industry from contact where account.industry= 'Energy'];
  system.debug(listcontact);
   for (Contact eachcontact: listcontact ){
    //get account name from contact record
    string accname=eachcontact.account.name;
    //contact name from contact 
    system.debug('contact name '+eachcontact.name + 'it is acc name is '
    + accname);
   }
    }

    public static void soqlchidparents_1(){
 list<account> listaccop =[select id, name, annualrevenue, type,
  (select name, amount from opportunities where stageName = 'Closed Won')  
  from account where type = 'Customer - Direct'];

        for (account eachAcc : listAccop) {
     system.debug('acc name => ' + eachAcc.Name + ', annual revenue => '
      + eachAcc.AnnualRevenue);
            List<Opportunity> listOpp = eachAcc.Opportunities;
            for (opportunity eachOpp : listOpp) {
                system.debug('-- opp name => ' + eachOpp.Name + 
                ', amount is ' + eachOpp.Amount);
            }
        }
    }
public static void soqlobject (){
List <Contact>listcont =[select id,name ,account.Name,
account.id from contact];
system.debug(listcont);
    for(contact eachcont:listcont){
       string accnames= eachcont.account.Name;
       string accnam=eachcont.account.id;
       system.debug('account id  is '+accnam); 
       system.debug('account name  is '+accnames); 

    }
}

public static void soqlaccounts(){
List <Account> listaccnt= [select id ,name,(select name, id from contacts )from account];
     system.debug(listaccnt);   
for (account eachaac : listaccnt) {
        system.debug('-- contact  name => ' + eachaac.Name + 
        ', Id is ' + eachaac.id);

        List <contact> listcon =eachaac.contacts;
        for (contact eachcon : listcon){
            system.debug('-- opp name => ' + eachcon.Name + 
            ', id is ' + eachcon.id);
        }
}

}
}
