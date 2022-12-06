listDemo.allCats();

string valueAt2 = ListDemo.cadidatesList(2);
system.debug(valueAt2);

string valueAt5 = ListDemo.cadidatesList(5);
system.debug(valueAt5);


ListDemo.randomIntegerList();

 List<string> listsrt = new List<string>();
 if(listsrt.isEmpty()){
    system.debug('list is empty');
 }

 List<integer> listInteger = new List<integer>();
       listInteger.add(10);
       listInteger.add(15);
       listInteger.add(21);
       listInteger.add(15);
       listInteger.add(15);
       listInteger.add(17);
       system.debug('before sort'+listInteger);  
       listInteger.sort();
        system.debug('after sort'+listInteger);

        //list<string> listSample;// not allor because null 
        //listSample.add('will this work?');// we have to do like below 

         list<string> listSample= new list <string>();