public with sharing class ContactLWCClass {
    @AuraEnabled
    public static List<Contact> getMatchingContact(String searchKey){
        searchKey = '%' + searchKey + '%';
        return [SELECT FirstName, LastName, Title, Department
                FROM Contact
                WHERE FirstName LIKE :searchKey OR LastName LIKE :searchKey
                ];
    }
}
