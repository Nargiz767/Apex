1public  class DatetimeMethodsDemo {
    public  void calculateAgeInMonth() {
  
        date dttoday =date.today();

        // My birtday
        date nardate= date.newInstance(1987,10,27);

        integer mydate=nardate.monthsbetween(dttoday);
        System.debug('Nargiz birtday betwen nowdats is  '+ mydate);
    }

    public void calculateAgeInDays(){
        // Todays date
        date dttoday= date.today();
         // My birthday 
        date nrdate= date.newInstance(2016,02,02);
        // age in days 
        integer ageindays=nrdate.daysbetween(dttoday);
        System.debug('Nargiz age in days '+ageindays);
    }

    public void printSubscriptionEndDate(){
        date SubscriptionStarDate = date.today();

        date  SubscriptionEndDate =SubscriptionStarDate.addDays(1000);
        System.debug('Subscription End Date on  '+ SubscriptionEndDate );

        integer endDateYear=SubscriptionEndDate.year();
        System.debug('Subscription End year is  '+endDateYear);

        integer endDateMonth=SubscriptionEndDate.month();
        System.debug('Subscription End month is  '+endDateMonth);    
    }

public void printOfferEndDate(){
    datetime dtnow=datetime.now ();

    datetime dtofferEnd=dtnow.addHours(51);
    System.debug('date of offer end'+dtofferEnd);

    date dateofferEnd=dtofferEnd.date();
    System.debug('date end is '+dateofferEnd);
}

public void birthDateToMilliSeconds(){
    datetime brthDate=datetime.newInstance(1987,10,27,10,55,3);
    long longBithDate=brthDate.getTime();
    System.debug('long birt date =>'+longBithDate);
}

}
