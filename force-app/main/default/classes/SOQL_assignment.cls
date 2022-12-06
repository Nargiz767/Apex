public class SOQL_assignment {
    public static void SOQL_Clause() {
 list <contact > listcont = [select id , name from contact where name like 'A%'];
 system.debug('list of contact name with A'+ listcont);
 system.debug ('size of list '+listcont.size());
    }

    public static void soql_frommethod (){
list <contact > listcont = [select id , LastName,phone from contact order by  createddate ];  
system.debug('personal infornamtion '+listcont);
    for(contact eachcont:listcont) {
        string lstName=eachcont.LastName;
        string phonenum=eachcont.phone;
        system.debug('contact last name is '+lstName+
         'contact phone numbner is '+phonenum);
    }
    }


}
