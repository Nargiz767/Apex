Calculator c2=new Calculator();
Date date1=date.NewInstance(2020,6,22);
boolean date1lp=c2.leapYearCheck(date1);
system.debug(date1+'date 1 is year leap'+date1lp);



integer c2sum33=c2.add(10,15,25);
system.debug(c2sum33);
integer c2Sum1=c2.add(10,15);
system.debug('c2sum1 is'+  c2Sum1);
integer x=88;
integer y=99;
integer  c2Sum3=c2.add(x,y);
system.debug('c2sum3 is'+  c2Sum3);




//Calculator c2=new Calculator();
//c2.printAndReturnMessage('print this asap');// also we can write 
//string returnc2= c2.printAndReturnMessage('print this asap');

//system.debug(returnc2);


//Calculator cal=new Calculator();
//cal.welcomeMessage();


//string message='print this message';
//cal.printNewMessage(message);

//cal.printNewMessage('now print this');