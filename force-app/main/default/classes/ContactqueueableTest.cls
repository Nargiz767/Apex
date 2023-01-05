@isTest
public class ContactqueueableTest {
    @isTest
    public static void TestContactqueueable() {
//1. prepare data
List<account> listAcc = new list<account>();
        
for (Integer i = 0; i < 20; i++) {
    account a = new account();
    a.Name = 'Pi account ' + i;
    a.Active__c = 'Yes';
    listAcc.add(a);
// 2 method
// listacc.add(new account (name= 'Pi account',  a.Active__c = 'Yes'+i));  
  }
   insert listAcc 
   
 
   Test.startTest();
   ContactqueueableTest ap= new  ContactqueueableTest (listAcc);
   system.enqueueJob(aq);
   Test.stopTest();

   // assert
   list<account> testaccount= [select id ,name ,Active__c where Active__c= 'Yes'];
    }
    }


