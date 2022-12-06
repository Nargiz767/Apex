public class Datetime_Assignment {
    public void diffofDate() {
        date varTomorrowDate=date.newInstance(2022,11,15);
        date varTodayDate=date.newInstance(2022,11,14);
        integer dueDate=varTodayDate.daysBetween(varTomorrowDate); 
        System.debug('day between is '+dueDate);
    }

    public void timecheck(){
    datetime tomorrowDate=datetime.newInstance(2022,11,15,7,0,0);
    System.debug(tomorrowDate);
    datetime newtomorrow=tomorrowDate.addDays(10);
    System.debug('tomorrow date is if add  '+newtomorrow);

    datetime var10daysDateTime=datetime.newInstancegmt(2022,11,14,10,9,0);  
    system.debug('today is '+var10daysDateTime); 
    
    long longTime=123398743661L;
    datetime mytime=datetime.newInstance(longTime);
    System.debug('long time is '+longTime);

    datetime tomorrowdate1=datetime.newInstance(2022,11,15);
datetime newdate=tomorrowdate1.addDays(7);
system.debug('if add 7 days '+ newdate);
    }
}
