import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

import OPP_OBJECT  from '@salesforce/schema/Opportunity';
import NAME_FIELD  from '@salesforce/schema/Opportunity.Name';
import ACCOUNT_FIELD  from '@salesforce/schema/Opportunity.AccountId';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_NAME from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FILED  from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class RecordEditFormOpportunity extends LightningElement {
recordId="006Do0000030IolIAE";
objectName=OPP_OBJECT;

fields ={
    name:NAME_FIELD,
    account:ACCOUNT_FIELD,
    type:TYPE_FIELD ,
    stage:STAGE_NAME,
    amount:AMOUNT_FILED, 
    closeDate:CLOSEDATE_FIELD
};

successHandler(){
    const successToast =new ShowToastEvent ({
        title:"Success",
        messgae:"Opportunity has been saved successfully ",
        variant:"success" 
    });
    this.dispatchEvent(successToast)
}

}