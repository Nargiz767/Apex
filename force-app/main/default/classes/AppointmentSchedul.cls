public with sharing class AppointmentSchedul implements schedulable{
    public void execute(SchedulableContext ap) {
        database.executeBatch(new appointmentBatch());
            }
}
