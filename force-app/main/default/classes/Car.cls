public  class Car {
    public string Carcolor; 
    public string carName;

 integer maxspeed= 150;
    
    public void drive () {
        system.debug('driving '+carName+'of color'+Carcolor);
    }

    public void driveAtMaxSpeed(){
        string drivingDescription='driving'+carName+'at'+maxspeed+'km/hr';
        system.debug(drivingDescription);
    }

     
     } 

}

