@isTest
public  class AccountqueueableexmapleTest {
@isTest
           private static void testQueueable1() {
                //1. prepare data
                 List<account> listAcc = new list<account>();
        
                 for (Integer i = 0; i < 200; i++) {
                     account a = new account();
                     a.Name = 'Pi account ' + i;
                     a.Active__c = 'Yes';
                     listAcc.add(a);
                 }
                 insert listAcc;
        
                 //2. 
                 Test.startTest();
                 AccountQueueableExample aq = new accountQueueableExample(listAcc);
                 // system.enqueueJob(new AccountQueueableExample(listacc) )
                 system.enqueueJob(aq);
                 Test.stopTest();
        
                 //3. assert
                 list<account> getAccounts = [select id, name,Active__c,(select id, lastname from contacts where lastname like '%contact%' ) from account];
              system.assertEquals(1,getAccounts[0].contacts.size());
           }
        }
    

