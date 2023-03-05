import { LightningElement } from 'lwc';

export default class GetterlLWC extends LightningElement {
    fruits =["apple","cherry","mango","orange" ];
    num1=10;
    num2=20;
     get sum(){
        let result= this.num1 + this.num2;
        return result;
    }

get firstFruit(){
return this.fruits[0];
}
}