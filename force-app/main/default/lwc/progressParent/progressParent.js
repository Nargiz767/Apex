import { LightningElement } from 'lwc';

export default class ProgressParent extends LightningElement {
    progressSize;
    progressValue;

    get sizeOptions(){
        return [
            {label: "Small", value: "Small"},
            {label: "Medium", value: "Medium"},
            {label: "Large", value: "Large"}
        ]
    } 

    changeHandler(event){
        if(event.target.name === 'Size'){
            this.progressSize = event.target.value;
        } else {
            this.progressValue = event.target.value;
        }

        let size = this.progressSize;
        let value = this.progressValue;

        this.template.querySelector('c-progress-child').progressHandler(size, value)
    }
}