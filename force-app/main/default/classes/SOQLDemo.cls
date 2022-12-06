public  class SOQLDemo {
    public static void accountSOQL_1 () {
        list<account> listaccount =[select id,name from account where name like '%a%'];
        system.debug('list of account ->'+listaccount);
    }

    public static void accountSOQL_11() {
       account acc = [select id, name from account order by createddate desc limit 1];
       system.debug('latest created account is -> ' + acc);
    }

    public static void accountSOQL_2() {
        account acc = [select id, name, phone, AccountNumber from account order 
        by createddate desc limit 1];
        system.debug('latest created account is -> ' + acc);

        string accName = acc.name;
        string accphone = acc.phone;
        system.debug ('acc name is ' + accName + ', acc phone is ' + accphone +  
        'account number is ' + acc.AccountNumber);
     }

     public static void accountSOQL_3(){
        list<account> listacc=[select id,name,phone,accountnumber,
        shippingcity from account
         order by createddate desc];
         for(account eachacc : listacc){
            string accName=eachacc.name;
            string accphone=eachacc.phone;
            string accshp=eachacc.shippingcity;
            system.debug('acc name is '+accName+ 'acc phone is '
            +accphone+'account number is '
            +eachacc.accountnumber);
         }
     }

     public static void accountsoql_filter(string accnamefilter){
        // we want filter with accnamefilter (string accnamefilter)in soql
        list<account> listacc= [select id, name, phone  from account where 
        name =:accnamefilter];
        system.debug('list of account'+listacc);
     }
     public static void accountsoql_filter(list <string> accname){
      // we want filter with accnamefilter (string accnamefilter)in soql
      list<account> listacc= [select id, name, phone  from account where 
      name IN :accname];
      system.debug('list of account'+listacc);

}


}