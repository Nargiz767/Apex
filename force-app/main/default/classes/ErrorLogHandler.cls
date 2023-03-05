public with sharing class ErrorLogHandler {
    public static void createErrorLog(string ClassName, String processName, string logDetails) {
        insert new Error_Log_Error_Log__c(Process_Name__c = processName,
                               Log_Details__c = logDetails,
                               Name = ClassName,
                               Log_Date_Time__c = Datetime.now());
    }
}