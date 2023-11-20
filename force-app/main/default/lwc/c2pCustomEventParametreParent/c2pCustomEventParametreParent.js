import { LightningElement } from 'lwc';

export default class C2pCustomEventParametreParent extends LightningElement {
    progressValue;
    mess ;
    flag = false;

    progressHandle(event){
        console.log(event,"hello");

        // this.progressValue=event.detail
        if(event.detail.progress >= 0 && event.detail.progress <=100){
            this.progressValue =event.detail.progress;
            this.mess = event.detail.message;
            this.flag = false;
        } else {
            this.flag = true;
        }
        
    }
}