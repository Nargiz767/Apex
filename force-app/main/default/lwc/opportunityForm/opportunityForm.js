import { LightningElement, wire } from 'lwc';
import { getPicklistValuesByRecordType, getObjectInfo } from 'lightning/uiObjectInfoApi';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';


export default class OpportunityFormUC1 extends LightningElement {
    oppRecordTypeId;
    typeOptions=[];
    stageOptions=[];
    oppName;
    oppStage;
    oppType;



    @wire(getObjectInfo, { objectApiName: OPPORTUNITY_OBJECT })
    objectInfoHnadler({data, error}){
        if (data) {
            console.log('Tis is data', data);
            this.oppRecordTypeId=data.defaultRecordTypeId;
        }
        if (error) {
            console.log(error)
        }
    }
    
    @wire(getPicklistValuesByRecordType, { objectApiName: OPPORTUNITY_OBJECT, recordTypeId: '$oppRecordTypeId'  })
    picklistInfoHandler({data, error}){
        if (data) {
            console.log('Tis is picklis data====>', data);
            this.typeOptions=data.picklistFieldValues.Type.values;
            this.stageOptions=data.picklistFieldValues.StageName.values;

        }
        if (error) {
            console.log(error)
        }
    }

    changeHandler(event){
        if (event.target.label==="Opportunity Name") {
            console.log('opportunity name'+event.target.value);
            this.oppName=event.target.value;

        } else if (event.target.label==="Opportunity Stage") {
            console.log('opportunity stage'+event.target.value);
            this.oppStage=event.target.value;

        }else if (event.target.label==="Opportunity Type") {
                console.log('opportunity type'+event.target.value);
                this.oppType=event.target.value;
}
    }
}