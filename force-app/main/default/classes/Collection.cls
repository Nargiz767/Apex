public class Collection {
    public static string listaAssignment (integer i) {
        List<string> LstMonth = new List<string>();
        LstMonth.add('january');
        LstMonth.add('february');
        LstMonth.add('march');
        LstMonth.add('april');
        LstMonth.add('may');
        LstMonth.add('june');
        LstMonth.add('july');
        LstMonth.add('august');
        LstMonth.add('september');
        LstMonth.add('october');
        LstMonth.add('november');
        LstMonth.add('december');
        string output_month='';
        integer sizeofmonth=LstMonth.size();
        if (i>=sizeofmonth || i< 0){
            output_month='not valid'; 
        } else {
            output_month=LstMonth[i-1];
        }
        
      return output_month;

    }
}
