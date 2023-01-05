@isTest

public class AccountsBatchtest {
    @isTest
    private static void testBatch1() {
 //1. prepare data 
 list <account> listacc= new list <account>();
 for(integer i=0; i<900; i++){
    account a= new account();
    a.name= 'Pi account '+i;
    a.Active__c='Yes';
    listacc.add(a);
 }

 insert listacc;
  // start test
  Test.startTest();
  AccountsBatch ab= new AccountsBatch();
  Database.executeBatch (ab,900);
  Test.stopTest();
  list <account> getAcc=[select id, description from account];
  system.assert(getAcc[0].Description.contains('batch'));
    }
}
