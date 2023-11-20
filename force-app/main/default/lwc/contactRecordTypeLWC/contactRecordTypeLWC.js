import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class ContactRecordTypeLWC extends LightningElement {
  contactDefaultRtId;
  contactEmpoleeRtId;

    @wire (getObjectInfo,{objectApiName :CONTACT_OBJECT})
    infoHandler({data,error}){

        if(data){
       console.log('data',data);    
this.contactDefaultRtId= data.defaultRecordTypeId;

const rtids= data.recordTypeInfos;


this.contactEmpoleeRtId= Object.keys(rtids).find(rtid =>rtids[rtid].name ==="Employee Contact");
        }
    }
}