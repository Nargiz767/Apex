import { LightningElement, wire } from 'lwc';
import getMatchingOpps from'@salesforce/apex/OpportunityLWCClass.getMatchingOpps';

const COLUMNS=[
    { label: 'OPP Name', fieldName: 'Name', type:'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Stage Name', fieldName: 'stageName', type: 'text' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' }
]

export default class OpportunityAPEXLWC extends LightningElement {
    stageName= "Closed Won";
    columns=COLUMNS;

@wire (getMatchingOpps, {stage: '$stageName'})
opps;

}