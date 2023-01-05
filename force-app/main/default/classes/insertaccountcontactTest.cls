@isTest
public with sharing class insertaccountcontactTest {
    @isTest
    public static void insertAccCntTest() {
        InsertAccountContact.InsertAccContact('test acc name','cnt lastname');
list <account> acc=[select id,name from account where name ='test acc name'];
system.assert(acc.size()==1);

list <contact> cont =[select id,lastname,accountId from contact where lastName='cnt lastname'];
system.assert(cont.size()==1);
system.assertEquals(acc[0].id ,cont[0].accountId);

    
}
    }

