public class Collection_assignment {
 public static void days(){

set<string>days=new set<string>();

days.add('monday');
days.add('tuesday');
days.add('wednesday');
days.add('thursday');
days.add('friday');
days.add('saturday');
days.add('sunday');
 }
    public static set <string> 
    bigSet(set<string>upperset){

    set <string>returnset=new set<string>();

    for(string echday:upperset){

   string setdays= echday.toUpperCase();

    returnset.add(setdays);
    }
      return  returnset;
        }
}
    
        
