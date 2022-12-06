public class Dog {
  public string name;
  public string color;
  public integer age;
  public static integer count=0;

  public Dog() {
        count++;
        age=1;
        checkAge();
        showCount();
    }
    public void checkAge (){
        If (age>0 && age<=1 ){
        system.debug('Puppy dog');
    } else if (age>1 && age<=3) {
        system.debug('Young dog');
    }  else if (age>3 && age<=5){
        system.debug('Adult Dog');
    } else if (age>5){
        system.debug('Old dog');
    }  else {
     system.debug('invalid age');
    }
    }
    public Dog (string nam,string col,integer ag){
        name=nam;
        color=col;
        age=ag;
        count++;
        checkAge();
        showCount();

    }
    public static void ShowCount (){
    system.debug('total number of dogs'+count);
}
}

