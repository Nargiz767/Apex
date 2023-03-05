@isTest
public with sharing class OpportunityManagerTurkish_test {
@isTest
   private static void postOpprtunityTest(){
    test.startTest();
    id oppId = Opprtunitymanager_turkisPrac.createOpportunity('Nargiz','2023-7-2','prospecting','33333');
    test.stopTest();
   System.assertNotEquals(null,oppId);
   Opportunity op=[Select id,name,closedate,stagename from Opportunity where id=:oppId];
   system.assertEquals('Nargiz',op.name);
    }
}