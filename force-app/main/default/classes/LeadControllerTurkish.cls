public class LeadControllerTurkish {
    @AuraEnabled
    public static Lead[] searchname(string word) {
        string searchWord = '%' + word + '%';
        return [select FirstName, LastName, Company, Industry, LeadSource from Lead where name like : searchWord];
    }
    @AuraEnabled
    public static lead[] searchIndustry(string industry){
        return  [select FirstName, LastName, Company, Industry, LeadSource from Lead where Industry=:industry];
    }
}