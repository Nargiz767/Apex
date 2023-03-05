trigger AppointmentDoctorTrigger on Event_Speaker_Appointment_Doctor__c(before insert, before update) {
    if(Trigger.isBefore){
        if(Trigger.isInsert || Trigger.isUpdate){
            AppointmentDoctorHandler.checkDuplicateDoctorOnEvents(Trigger.new);
        }
    }
}