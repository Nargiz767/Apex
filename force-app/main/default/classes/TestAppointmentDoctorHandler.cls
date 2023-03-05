@isTest
private class TestAppointmentDoctorHandler {
 @TestSetup
 static void prepareData(){
    Event_Organizer_Clinic_Manager__c manager = new Event_Organizer_Clinic_Manager__c(Name = 'Manager1',
                                                      Email__c = 'testmanager1@test.com',
                                                      Phone__c = '4569871236');
 insert manager;
 Event_Appointment__c Appointment = new Event_Appointment__c (Event_Organizer_Clinic_Manager__c = Manager.Id,Name__c = 'Test Event', Status__c = 'In Progress',  End_Date_Time__c = Datetime.now().addDays(14),Maximum_number_of_patients__c = 10, 
 Appointment_Type__c ='Virtual',Live__c = true);
                                                                                         
   insert Appointment;
   Speaker_Doctor__c Dactor1 = new Speaker_Doctor__c(Name = 'doctor1',
                                     Email__c = 'testDoctor1@test.com',
                                     Phone__c = '78965412369');
   Speaker_Doctor__c Dactor2 = new Speaker_Doctor__c (Name = 'doctor2',
                                    Email__c = 'testDoctor2@test.com',
                                    Phone__c = '7898745369');
   insert new List<Speaker_Doctor__c>{Dactor1, Dactor2};
   insert new Event_Speaker_Appointment_Doctor__c (Event_Appointment__c = Appointment.Id, Speaker_Doctor__c =Dactor2.Id);
 }

  @isTest
 static void testPositive(){
    Event_Speaker_Appointment_Doctor__c AppointmentDoctor = [SELECT Id, Event_Appointment__c, Doctor__c FROM Event_Speaker_Appointment_Doctor__c LIMIT 1];
   Boolean isFailed = false;
   try {
    Event_Speaker_Appointment_Doctor__c  newRecord = new Event_Speaker_Appointment_Doctor__c (Event_Appointment__c= AppointmentDoctor.Event_Appointment__c, Doctor__c = AppointmentDoctor.Doctor__c);
      insert newRecord;
   } catch(Exception exc){
      isFailed = true;
   }
   System.assert(isFailed);
}
@isTest
static void testNegative(){
    Event_Appointment__c Appointment = [SELECT Id FROM Event_Appointment__c WHERE  Name__c = 'Test Event' LIMIT 1];
   Doctor__c Dactor2 = [SELECT Id FROM Doctor__c WHERE Name = 'doctor2' LIMIT 1];
   Event_Speaker_Appointment_Doctor__c newRecord = new  Event_Speaker_Appointment_Doctor__c (Event_Appointment__c = Appointment.Id, Doctor__c = Dactor2.Id);
   insert newRecord;
   System.assertNotEquals(newRecord.Id, null);
}
   @isTest
   static void testBulk(){
   }
}