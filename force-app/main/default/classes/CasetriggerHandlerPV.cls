public  class CasetriggerHandlerPV {
    public static void createDefaulttask(list<case> CaseTriggernew) {
        List<Task> createTask = new list <task>();
        for(case eachcase: casetriggerNew){
            task t = new Task();
            t.subject = 'Email';
            t.priority = 'normal';
            t.whoId= eachcase.ContactId;
            t.whatId = eachcase.Id;
            t.activitydate = date.today();
            createTask.add(t);
        }
        if (!createTask.isEmpty()){
            insert createTask;
        }
    }
}
