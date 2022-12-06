public  class newcalculator {
    public static integer elave(List<Integer> listInt){
   integer returnInt=0;
   for (integer eachInt : ListInt) {
    system.debug('eachInt=>'+eachInt);
    returnInt += eachInt;
    system.debug('returnInt=>'+ returnInt);
   }
   return returnInt;
    }
}
