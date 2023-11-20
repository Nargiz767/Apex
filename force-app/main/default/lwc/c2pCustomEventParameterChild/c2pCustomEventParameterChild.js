import { LightningElement } from 'lwc';

export default class C2pCustomEventParameterChild extends LightningElement {
    progress;

    changeHandler(event){
        this.progress = event.target.value;
    }

    clickHandler(){
        // Create a Custom Event
        let obj = {
            progress : this.progress,
            message : "Hello From Child"
        };
        const progressEvent = new CustomEvent('setprogress', {detail : obj});
        this.dispatchEvent(progressEvent);
    }
}