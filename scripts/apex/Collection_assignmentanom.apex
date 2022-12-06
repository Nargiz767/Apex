List<string> listMethods = new List<string>();
 listMethods.add('monday');
 listMethods.add('tuesday');
 listMethods.add('wednesday');
 listMethods.add('thursday');
 listMethods.add('friday');
 listMethods.add('saturday');
 listMethods.add('sunday');

 system.debug('weekdays'+listMethods);
 system.debug('get days with indexs'+listMethods.get(2));
 boolean check=listMethods.contains('bazar ertesi');
 system.debug('bazat ertesi if contain =>'+ check);
 boolean check1=!listMethods.contains('bazar');
  system.debug('bazat ertesi not contain =>'+ check1);
 string silmek=listMethods.remove(6);
 system.debug('removed day is '+silmek);
 system.debug('list is empty ?'+listMethods.isEmpty());
 system.debug('total list size is ='+ listMethods.size());
 listMethods.sort();
 system.debug('sort list day'+listMethods);


Set<string>setdays=new Set<string>();
setdays.addAll(listMethods);
system.debug(setdays);

set<string> bigdays=Collection_assignment.bigSet(setdays);
system.debug(bigdays);
 
    