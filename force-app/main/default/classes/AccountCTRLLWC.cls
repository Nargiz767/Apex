public with sharing class AccountCTRLLWC {
    @AuraEnabled(cacheable =true)
    
   public static list<Account>getTopAccounts(){
    return [SELECT Id,Name,Type,Industry,AnnualRevenue 
            FROM Account
            WHERE AnnualRevenue != null
            LIMIT 5];
    
   }
}