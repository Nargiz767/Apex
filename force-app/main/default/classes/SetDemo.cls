public class SetDemo {
    public static void citySet() {
set<string> cities= new set<string>();
  cities.add('tokyo');
  cities.add('lisbon');
  cities.add('nairobi');
  cities.add('tokyo');
  cities.add('lisbon');
  cities.add('nairobi');
  cities.add('TOKYO');
  system.debug('cities are '+cities);
    }

    public static void randomIntegerSet(){
    Set<integer> setInt = new Set<integer>();
     setInt.add(15);
     setInt.add(10);
     setInt.add(21);
     setInt.add(15);
     setInt.add(21);
     system.debug(setInt);
    }

// we are convert list to set 
    public static set<integer> setFromList(list<integer>intList){
  set<integer>returnSet=new set<integer>();
  returnSet.addAll(intList);
     return returnSet;   
}
public static Set<string> capitalset(set<string>setStr){

   Set<string> qaytar = new Set<string>();

// iterate over each element of set
// convert each element to upper case
// add in a newly created set element
for (string eachstr: setStr){
    string tempstring= eachstr.toUpperCase();
    qaytar.add(tempstring);
}
 return qaytar;
}

}