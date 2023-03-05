import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import NAME_FIELDS from '@salesforce/schema/Account.Name';
import Type_FIELDS from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELDS from '@salesforce/schema/Account.Industry';
import AnnualRevenue_FIELDS from '@salesforce/schema/Account.AnnualRevenue';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';


export default class RecordFormAccount_LWC extends LightningElement {

objectName=ACCOUNT_OBJECT;
    accFields= [NAME_FIELDS,Type_FIELDS,INDUSTRY_FIELDS,AnnualRevenue_FIELDS];
    recordId = "001Do000008kZIEIA2";

    successHandler(){
   const successEvent = new ShowToastEvent({
    title:"Success",
    message:"account record has been saved successfully",
    variant:"success"

   })
   this.dispatchEvent(successEvent);
    }

    errorhandler(){
        const errorEvent = new ShowToastEvent({
         title:"Error",
         message:"An error has been occured",
         variant:"error"
     
        });
        this.dispatchEvent(errorEvent);
         }
}