SetDemo.citySet();
SetDemo.randomIntegerSet();

 List<integer> listInteger = new List<integer>();
       listInteger.add(10);
       listInteger.add(15);
       listInteger.add(21);
       listInteger.add(15);
       listInteger.add(15);
       listInteger.add(17);

       system.debug('list of '+listInteger);  
    set<integer>setInt=SetDemo.setFromList(listinteger);
    system.debug('set->'+setInt);
    

  set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.add('Lisbon');
        cities.add('Nairobi');
        cities.add('TOKYO');   

        set<string>toUpperCaseset= SetDemo.capitalset(cities);
        system.debug(toUpperCaseset);


        Set<string> uniqueNameSe = new Set<string>();
             uniqueNameSe.add ('tom');
             uniqueNameSe.add('jerry');
             uniqueNameSe.add('cartoon');
             sys
