
import { LightningElement, track, wire } from 'lwc';
import NAME_FILED from '@salesforce/schema/Account.Name';
import TYPE_FILED from '@salesforce/schema/Account.Type';
import INDUSTRY_FILED from '@salesforce/schema/Account.Industry';
import REVENUE_FILED from '@salesforce/schema/Account.AnnualRevenue';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';

import {showToastEvent} from 'lightning/platformShowToastEvent'

const FIELDS= [NAME_FILED,TYPE_FILED ,INDUSTRY_FILED,REVENUE_FILED ]
export default class UpdateAccountRecord extends LightningElement {
recordId= "001Do000003CNwxIAG";
typeOptions=[];
IndustryOptions=[];
 @track formdata={};

 //*1. Fetch the record from database- getRecord With Wire adaptor
 @wire (getRecord, {recordId: '$recordId', fields:FIELDS})
 account;


 //2.Fetch the combobox options from metadata-
//a.getobjectinfo
//b.getpicklistvaluesbyRecordType

@wire(getObjectInfo, {objectApiName:ACCOUNT_OBJECT})
accinfo;


@wire(getPicklistValuesByRecordType, {objectApiName : ACCOUNT_OBJECT,recordTypeId:'$accinfo.data.defaultRecordTypeId'})
picklistHandler({data,error}){
    if(data){
    this.typeOptions=data.picklistFieldValues.Type.values;
    this.IndustryOptions=data.picklistFieldValues.Industry.values;
    }
    if(error){
        console.log(error);
    }

}

    /**
     *1. Fetch the record from database- getRecord With Wire adaptor
     2.Fetch the combobox options from metadata-
       a.getobjectinfo
       b.getpicklistvaluesbyRecordType
     3.update the record   
     
     */

     //3 PREPARE DATE
    changehandler(event){
  //const name= event.target.name;
  //const value =event.target.value;

  const{name,value}=event.target;

  this.formdata[name]=value;

    }

     //update the record
     
    saveAccount(){
           this.formData["Id"] = this.recordId;
           console.log("FormData"  + JSON.stringify(this.formData));
           const recordInput = {
               fields : this.formData
           };
   
           updateRecord(recordInput)
               .then(result =>{
   
                   console.log(result);
                   const toast = new ShowToastEvent({
                       title : "Success",
                       message : "Record has been updated successfully",
                       variant : "success"
                   });
                   this.dispatchEvent(toast);
               })
               .catch(error=>{
                   console.error(error)
   })
    }
}