public  class NewCar {
    public integer currentSpeed= 0;
    public string carType='';
    public string carName='';

    public string startCar(string carType,string carName){
       string start=carType+''+carName;
            return start ;
    } 
    public integer Accelarate(integer x){
        currentSpeed+=x;
        system.debug(currentSpeed);
       return currentSpeed ;
    }
    public integer Brake (integer y){
        currentSpeed-=y;
        system.debug(currentSpeed);
        return currentSpeed ;  
    }

    public integer stopCar(){
        currentSpeed=0;
        return currentSpeed; 
    }
    
    public string checkSpeed (){
        string sp='';
    if (currentSpeed >0 & currentSpeed <=30){
    sp='city mode ';
      system.debug(sp);

    } else if (currentSpeed<=60 & currentSpeed>31){
        sp='econom mode';
         system.debug(sp);

    } else if (currentSpeed >60){
        sp='Sport mode';
        system.debug(sp);
    }
    return sp;
}
}

