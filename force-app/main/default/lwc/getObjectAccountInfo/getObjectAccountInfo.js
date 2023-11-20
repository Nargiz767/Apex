import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetObjectAccountInfo extends LightningElement {
accRtId;

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    infoHandler({data, error}){
        if(data){
            console.log(data);
           this.accRtId= data.defaultRecordTypeId;

        }
        if(error){
            console.log(error);
        }
    }
}