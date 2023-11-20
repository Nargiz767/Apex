import { LightningElement, wire } from 'lwc';
import getTopAccounts from '@salesforce/apex/AccountCTRLLWC.getTopAccounts'

const COLUMNS = [
    { label: 'Account Name', fieldName: 'Name', type:'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency' }
];

export default class WiredApex1 extends LightningElement {
    columns = COLUMNS;

    @wire (getTopAccounts)
    accounts;
}