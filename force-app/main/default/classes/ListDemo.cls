public  class ListDemo {
  public static string cadidatesList(integer i){
  List<string> listCandidates = new List<string>();
 listCandidates.add('Marc');
 listCandidates.add('Marc');
 listCandidates.add('John');
 listCandidates.add('Elon');
 system.debug('list of candidates'+listCandidates);
//string returnValue=listCandidates[i];
//return returnValue;
string returnValue='';
integer sizeoflist=listCandidates.size();
if(i>=0 && i < sizeoflist){
    returnValue = listCandidates[i]; //getting value from index i
} else {
    returnValue = 'No values found. come on.';
}

return returnValue;
}
 public static void randomIntegerList(){
      List<integer> listInteger = new List<integer>();
       listInteger.add(10);
       listInteger.add(15);
       listInteger.add(21);
       listInteger.add(15);
       listInteger.add(15);
       listInteger.add(17);
       system.debug('list of cinteger '+listInteger);  
       
       integer index3value=listInteger.get(3);//get value at index 3 1.ci
       integer index3value2=listInteger[3];//get value at index 3 2.ci

       system.debug('index at value 3-->'+index3value);
       system.debug('list of random integer is -->'+index3value2);
    }
  public static void allCats(){
    List<cat> listcats = new List<cat>();
    // how to add cats ?
    // we add 'instances'of cat class
    Cat sfCat2 = new Cat('Leo', 'Orange');
   Cat sfCat3 = new Cat('Luna', 'Brown');
  Cat batch11Cat = new Cat('fluffykins', 'white');
  listcats.add(sfCat2);
  listcats.add(sfCat3);
  listcats.add(batch11Cat);
  listcats.add(sfCat2);
system.debug('cat list'+listcats );
  
}
}



