import { LightningElement } from 'lwc';

export default class QuerySelectorDemo extends LightningElement {
    fruits= ["Banana","Apple","Mango","cherry"];
    clickHandler(){
        //h1-query selector element
       const h1elem= this.template.querySelector("h1");
       console.log(h1elem.innerText)
       h1elem.style.color="#32a8a8";
       h1elem.style.backgroundColor="yellow";
       h1elem.style.border="2px solid red";

       const pelem= this.template.querySelector("p");
       pelem.style.color= "orange";
       pelem.style.background="balck";
       pelem.style.border="2px solid red";


       const divElems= this.template.querySelectorAll(".child");
       divElems.forEach(item=>{
        console.log(item.innerText);
        item.style.color= "blue";
        item.setAttribute("class","slds-align_absolute-center");
       });

       const buttonElem = this.template.querySelector("lightning-button");
       buttonElem.label = "Don't Click Again";
       buttonElem.variant = "destructive";
    }
}