public  class Cat {
    public string name;
    public string color;

    //public Cat() {
    //    system.debug('cat constructor called automatically');
    //}

    public Cat (string n,string clr){
        name= n;
        color= clr;
        sleeping ();
    }

    public void sleeping (){
        system.debug(name +'kinda sleeping ');
    }


}
