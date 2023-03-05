AppointmentSchedul  asch= new AppointmentSchedul();
string crn = '0 0 13 * * ?';
system.schedule('appointment', crn, asch); 