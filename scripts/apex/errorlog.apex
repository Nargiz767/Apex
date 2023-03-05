try{
Lead newRecord=new Lead();
newRecord.FirstName='Test6';
newRecord.LastName=null;
insert newRecord;
}catch (Exception exc){
    system.debug('Exception : ' + exc.getMessage());
    ErrorLogHandler.createErrorLog('Ex :Apex class name: Create Lead ', 'from system ex:method name...:fetch Lead',exc.getMessage());
}