import { LightningElement } from 'lwc';

export default class ConditonalRendering3_button extends LightningElement {
    showContent = false;
    labelButton = "show Content";

    clickHandler(){

     //this.showContent =!this.showContent;  

   if(this.showContent){
    this.showContent=false;
    this.labelButton="show Content";
   } else {
    this.showContent=true;
    this.labelButton="Hide content";
   }
    }
}