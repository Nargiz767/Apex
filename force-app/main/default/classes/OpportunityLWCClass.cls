public class OpportunityLWCClass {
    @AuraEnabled(cacheable = true)
    public static List<Opportunity> getMatchingOpps(String stage){
        return [SELECT Name, Type, StageName, Amount
                FROM Opportunity
                WHERE StageName =:stage 
                LIMIT 5];
    }
}