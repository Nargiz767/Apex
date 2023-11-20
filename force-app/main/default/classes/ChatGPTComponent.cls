public with sharing class ChatGPTComponent{
    @AuraEnabled(cacheable=true)
    public static String chatGPt(String userMessage) {
        return (userMessage);
    }
}