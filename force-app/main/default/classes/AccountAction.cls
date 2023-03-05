public with sharing class AccountAction {
    @invocableMethod(label ='Update Account Revenue'
                     description='Summation of Child Opportunity Amount Display on Parent Annual revenue'
                     category ='Account')
                 
   public static void updateAccountRevenue(list<Id> oppids){
    // fetch parent account inform from OPPIDs using  SOQL
    // use with secuty enforced 
    opportunity newlyCreatedOpp=[SELECT AccountID FROM Opportunity WHERE Id=: oppIds[0] WITH SECURITY_ENFORCED LIMIT 1 ];
    Id parentAccountid= newlyCreatedOpp.AccountID;
    list <opportunity> childOpps =[SELECT Amount FROM opportunity WHERE AccountID =: parentAccountid WITH SECURITY_ENFORCED];
    Decimal totalAmount=0;
    for(opportunity opp: childOpps){
        if (opp.Amount != null && opp.Amount>0){
           totalAmount= totalAmount+ opp.Amount;  
        }
    }
    // creating an instance of Sobject Type Account 
 Account parentacc= new Account (Id = parentAccountId, AnnualRevenue= totalAmount);
 //ikinci variant 
 // patentAcc.id= parentAccountid
 // patentAcc.annualRevenie= totalAmount 
 update Parentacc;
   }
}
/**
* Annotate the method with @InvocableMethod
* The invocable method must be static and public or global
* Only one method in a class can have the invocable method annotation
* Triggers can't reference invocable methods
* Invocable method doesn't accept more than one argument as a method parameter
* Other annotations cant be used with invocable method annotation
 */ 
 
 
