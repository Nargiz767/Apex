import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
   
        country;
      
        //showContentTR;

        changeHandler(event){
            this.country = event.target.value;
    
        }  

        get showContent (){
         if(this.country === "USA"){
                return true;
    
            } else {   
             return false;
            }
        }
        
    }