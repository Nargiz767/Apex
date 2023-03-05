import { api, LightningElement } from 'lwc';

import NAME_FIELDS from '@salesforce/schema/Account.Name';
import TYPE_FIELDS from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELDS from '@salesforce/schema/Account.Industry';
import REVENUE_FIELDS from '@salesforce/schema/Account.AnnualRevenue';
import RATING_FIELDS from '@salesforce/schema/Account.Rating';

import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class RecordViewFormAccount extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    @api recordId;

    fields = {
        name:NAME_FIELDS,
        type:TYPE_FIELDS,
        industry:INDUSTRY_FIELDS,
        revenue:REVENUE_FIELDS,
        rating:RATING_FIELDS
    }
}