
@isTest
public class TestTurkishbatch {
    @TestSetup
    static void makeData(){
        List<Account> accList = new List<Account>();
        for (Integer i = 1; i <= 200; i++) {
            if (i<=100) {
                account acc = new account();
                acc.name = 'Account ' + i;
                accList.add(acc);
            } else {
                account acc = new account();
                acc.name = 'Account ' + i;
                acc.AnnualRevenue = 20000;
                accList.add(acc);
            }
        }
        insert accList;
        list<contact> conlist = new <contact>();
        for (account acc: accList){
            contact c = new contact();
            c.LastName= 'Test';
            c.LeadSource='Partner Referal';
            c.AccountId= acc.Id;
            conlist.add(c);
        }
    }

    @istest
    private static void batchTest() {
        test.startTest();
        TurkishrevBatch b1 = new TurkishrevBatch();
        Database.executeBatch(b1);
        test.stopTest();
        List<Account> accList = [select id, name from account where AnnualRevenue = 10000];
        system.assertEquals(100, accList.size());
    }

    private static void turkissrevQueueable1
}

