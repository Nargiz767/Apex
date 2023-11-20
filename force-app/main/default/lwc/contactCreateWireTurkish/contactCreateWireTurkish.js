import { LightningElement, wire } from 'lwc';
import LEADSOURCE_FIELD from '@salesforce/schema/Contact.LeadSource';
import CONTACT_OBJECT from '@salesforce/schema/Contact'
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
export default class ContactCreateWireTurkish extends LightningElement {
    LeadSourceOptions=[];
    conRTId;
    formData ={};
    changehandler(event) {
       // const name=event.target.name;
       // const value=event.target.value;
        const {name,value}=event.target
        this.formData[name]=value;
        console.log('handlechnage',JSON.stringify(this.formData));
    }
   

    @wire(getObjectInfo,{objectApiName:CONTACT_OBJECT})
    contactInfo({data,error}){
        if(data){
            console.log('data',data);
            this.conRTId=data.defaultRecordTypeId;

        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValues,{fieldApiName:LEADSOURCE_FIELD, recordTypeId:"$conRTId"})
    picklistHandler({data,error}){
        if(data){
            console.log('picklist ',data);
           this.LeadSourceOptions=data.values;
        }
         if(error){
            console.error(error);
         }

    }

    SaveContact (){

    }

    cancelContact (){
        this.template.querySelector('form.contactForm').reset();
        this.template.querySelector('lightning-combobox').value=undefined;
        this.formData = {};
    }

}