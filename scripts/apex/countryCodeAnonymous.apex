Map<string, country_code__c> allcountrycodes = country_code__c.getAll();
system.debug('all country codes =>' + allCountryCodes);
for (string eachcountry : allCountryCodes.keySet()){
    system.debug('country'+ eachcountry +'it is code'+ allCountryCodes.get(eachcountry).code__c);
}