public class DmlDemo {
    public static void DmlInsertDemo_stnObj() {
// creat new account record using apex code 
Account acc= new account();
// set values to fileds

 acc.Name='SoftInnovas';
 System.debug('not inserted '+acc);

 insert acc;

 system.debug ('inserted'+ acc);

    }

    public static void Dmlinsertdemo_cstobject(){
        salesforce_project__c  spnew = new salesforce_project__c();
     spnew.project_name__c= 'Teach dml to us ';
     spnew.description__c ='Every is doing good';
        insert spnew;
    
    }

    public static void Dmlupdatedemo_1(){
        account acc= new account();
        acc.Name='softinnovas';
        insert acc;

        acc.Name='Salesforce INC';
        update acc;
        system.debug(acc);
    }

    public static void Dmlupdatedemo_3(){
        account acc=[select name from account where name='SoftInnovas' limit 1];
        acc.name='SoftInnovas INC';
        update acc;
        system.debug('update acc'+ acc);

    }


    public static void Dmlupdatedemo_4(){
        account acc=[SELECT  name FROM  account where name ='SoftInnovas INC' limit 1];
        contact cnt= new contact();
        cnt.LastName='Biden';
        cnt.AccountId =acc.id;
        insert cnt;
        system.debug('contact record'+ cnt);
    }

    public static void dmlInsertDemo_5() {
        Salesforce_Project__c sp = [select id, name from Salesforce_Project__c order by CreatedDate desc limit 1];

        //we want to create related ticket
        Salesforce_Ticket__c stNew = new Salesforce_Ticket__c();
        stNew.Subject__c = 'Learn Apex dmls';
        stNew.Priority__c = 'High';
        stNew.Status__c = 'New';
        stNew.Requested_by_date__c = date.newInstance(2022, 12, 5);
        stNew.Salesforce_Project__c = sp.Id;
        insert stNew;
        system.debug('st is ' + stNew);
    }

  public  static void dmlInsertMultiple_right(){
    List<account> listacc = new List<account>();
    account acc1= new account();
    acc1.Name='bu;k acc 1';
    Listacc.add (acc1);

    account acc2= new account();
    acc2.Name='bu;k acc 2';
    Listacc.add (acc2);

    account acc3= new account();
    acc3.Name='bu;k acc 3';
    Listacc.add (acc3);

insert listacc;
  }

  public static void dmlUpdateMultiple_right1() {
    list<account> listAcc = [select id, name, active__c from account limit 10 ];

    list<account> updateAccount = new list<account>();
  for (account acc : listAcc) {
    if (acc.Active__c =='Yes') {
        acc.Name = acc.Name + 'via B.0';
        updateAccount.add(acc);
    
}
if (!updateAccount.isEmpty()) {
    update updateAccount;
}
}
  }
}


