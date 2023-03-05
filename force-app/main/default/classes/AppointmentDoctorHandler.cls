public class AppointmentDoctorHandler {
        public static void checkDuplicateDoctorOnEvents(List<Event_Speaker_Appointment_Doctor__c> AppointmentDoctors){
            Map<String, Event_Speaker_Appointment_Doctor__c> AppointmentDoctorsMap = new Map<String, Event_Speaker_Appointment_Doctor__c>();
            Set<Id> AppointmentIds = new Set<Id>();
            Set<Id> DoctorIds = new Set<Id>();
            for(Event_Speaker_Appointment_Doctor__c ad : AppointmentDoctors){
                String uniqueKey = String.valueOf(ad.Event_Appointment__c) + String.valueOf(ad.Doctor__c);
                AppointmentDoctorsMap.put(uniqueKey, ad);
                AppointmentIds.add(ad.Event_Appointment__c);
                DoctorIds.add(ad.Doctor__c);
           }
            List<Event_Speaker_Appointment_Doctor__c> onSystemRecords =  [SELECT Id, Event_Appointment__c, Doctor__c
                                                            FROM Event_Speaker_Appointment_Doctor__c
                                                            WHERE Event_Appointment__c IN: AppointmentIds
                                                            AND Doctor__c IN: DoctorIds];
            for (Event_Speaker_Appointment_Doctor__c sys : onSystemRecords){
                String uniqueKey = String.valueOf(sys.Event_Appointment__c) + String.valueOf(sys.Doctor__c);
                Event_Speaker_Appointment_Doctor__c checkingObject = AppointmentDoctorsMap.get(uniqueKey);
                if (checkingObject == null) continue;
                checkingObject.addError('Found a duplicate Event Speaker record on the system with id: ' + String.valueOf(sys.Id));
            }
        }
    }

