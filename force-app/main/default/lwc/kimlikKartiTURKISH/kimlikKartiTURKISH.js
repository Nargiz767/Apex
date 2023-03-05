import { LightningElement } from 'lwc';

export default class KimlikKartiTURKISH extends LightningElement {
    firstName;
     lastName;
     role;
     handleChange(event){
     if (event.target.label==="first name" ) {
        this.firstName= event.target.value;
     } else if (event.target.label==="last name") {
        this.lastName= event.target.value;
     } else {
        this.role= event.target.value;
     }
        
     }
    
/*
    handleChange(event){
        this.firstName= event.target.value;
    }
  handleChange2(event){
    this.lastName= event.target.value;
  }
*/
  options= [
    {label:'salesforce Admin',value:'salesforce Admin'},
    {label:'salesforce Developer',value:'salesforce Developer'},
    {label:'salesforce Architect',value:'salesforce Architect'}
  ]

 // handleChange3(event){
   // this.role= event.target.value;
} 
