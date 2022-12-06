public  class PrimitiveDtatype1{

public void  printNewDate() {
System.debug('create new date instance');

Date newDate=date.newInstance(1995,2,2);
System.debug('new date is'+newDate);

Date newDate2= Date.newInstance(2022,10,5);
System.debug('new date2 is'+newDate2);

date todayDate=date.today();
System.debug('today s date is'+todayDate);

}
public void printTime(){
Time myTime=time.newInstance(18,20,2,30);
System.debug('now time is '+myTime);

Time meTime=time.newInstance(16,18,45,15);
System.debug('now time is '+meTime);
}



public void printNewDateTime(){
Time newTime=time.newInstance(1,1,15,55);
Date newDate=date.today();

Datetime dt1 =Datetime.newInstance(newDate,newTime);
System.debug('dt1 is '+ dt1);

datetime dt2 = datetime.newInstance(2000,5,16);
System.debug('dts is '+ dt2);

Datetime d3=DateTime.newInstance(2021,5,13,9,5,49);
System.debug('d3 is'+d3);

Datetime dt4=datetime.newinstance(600000);
System.debug('dt4 is'+dt4);


long longTime=148956323147896789L;
datetime dt5=datetime.newInstance(longTime);
System.debug('dt5 is'+dt5);

datetime dt6=datetime.now();
system.debug('dt6 now'+dt6); // gmt time

datetime dt7=datetime.newInstanceGmt(1998,8,4,5,1,4);
system.debug('dt5 is'+dt7);



    
}

}




