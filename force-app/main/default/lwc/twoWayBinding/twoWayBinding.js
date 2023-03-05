import { LightningElement } from 'lwc';

export default class TwoWayBinding extends LightningElement {
    fullname='Nargiz';
    role;
    roleOptions =  [
            { label: 'salesforce admin', value: 'salesforce admin' },
            { label: 'salesforce devoloper', value: 'salesforce devoloper' },
            { label: 'salesforce architect', value: 'salesforce architect' },
        ];
    

    changehandler(event){
        if(event.target.label==="Enter your Name Please"){
            this.fullname =event.target.value;
        }else {
            this.role =event.target.value;
        }
    }

}
